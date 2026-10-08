module conv3x3_mac4_tb;
    // Direct-convolution memory model for the agreed layer. This is separate
    // from the PipeCNN Winograd kernel and models bank conflicts, not physical
    // FPGA SRAM timing or a particular AOCL-generated memory system.
    localparam int INPUT_CHANNELS = 3;
    localparam int OUTPUT_CHANNELS = 3;
    localparam int INPUT_SIZE = 32;
    localparam int KERNEL_SIZE = 3;
    localparam int OUTPUT_SIZE = INPUT_SIZE - KERNEL_SIZE + 1;
    localparam int TERMS_PER_OUTPUT = INPUT_CHANNELS * KERNEL_SIZE * KERNEL_SIZE;
    localparam int MACS_PER_CYCLE = 4;
    localparam int GROUPS_PER_OUTPUT = (TERMS_PER_OUTPUT + MACS_PER_CYCLE - 1) / MACS_PER_CYCLE;
    localparam int MAX_BANKS = 8;
    localparam int READ_LATENCY = 1;
    localparam int INPUT_WORDS = INPUT_CHANNELS * INPUT_SIZE * INPUT_SIZE;
    localparam int WEIGHT_WORDS = OUTPUT_CHANNELS * TERMS_PER_OUTPUT;
    localparam int OUTPUT_WORDS = OUTPUT_CHANNELS * OUTPUT_SIZE * OUTPUT_SIZE;

    logic signed [15:0] a0, b0, a1, b1, a2, b2, a3, b3;
    logic signed [15:0] mac_result;
    logic signed [15:0] feature_mem [0:INPUT_WORDS-1];
    logic signed [15:0] weight_mem [0:WEIGHT_WORDS-1];
    logic signed [15:0] output_mem [0:OUTPUT_WORDS-1];
    logic signed [15:0] lane_feature [0:MACS_PER_CYCLE-1];
    logic signed [15:0] lane_weight [0:MACS_PER_CYCLE-1];
    logic pending [0:MACS_PER_CYCLE-1];
    logic feature_bank_busy [0:MAX_BANKS-1];
    logic weight_bank_busy [0:MAX_BANKS-1];

    integer feature_read_count /* verilator public_flat_rw */;
    integer weight_read_count /* verilator public_flat_rw */;
    integer output_writes;
    integer memory_issue_cycles /* verilator public_flat_rw */;
    integer memory_stall_cycles /* verilator public_flat_rw */;
    integer i;
    integer init_value;
    integer oc, oy, ox, group_idx, lane, term, ic, ky, kx;
    integer feature_addr, weight_addr, output_addr;
    integer feature_bank, weight_bank;
    integer remaining;
    integer requests_this_cycle;
    integer accepted_this_cycle;
    integer active_banks;
    integer bank_config;
    integer bank_mapping;
    logic signed [15:0] partial_sum;
    longint signed expected_sum;
    logic signed [15:0] actual_sum;

    mac4_int16 dut (
        .a0(a0), .b0(b0), .a1(a1), .b1(b1),
        .a2(a2), .b2(b2), .a3(a3), .b3(b3),
        .result(mac_result)
    );

    function automatic logic signed [15:0] q8_word(input integer value);
        q8_word = 16'(value * 256);
    endfunction

    initial begin
        a0 = 0; b0 = 0; a1 = 0; b1 = 0;
        a2 = 0; b2 = 0; a3 = 0; b3 = 0;

        // Deterministic signed Q8.8 feature and weight memories.
        for (i = 0; i < INPUT_WORDS; i = i + 1) begin
            init_value = ((i * 37 + 13) % 33) - 16;
            feature_mem[i] = q8_word(init_value);
        end
        for (i = 0; i < WEIGHT_WORDS; i = i + 1) begin
            init_value = ((i * 11 + 5) % 17) - 8;
            weight_mem[i] = q8_word(init_value);
        end

        for (bank_mapping = 0; bank_mapping < 2; bank_mapping = bank_mapping + 1) begin
        for (bank_config = 0; bank_config < 4; bank_config = bank_config + 1) begin
            active_banks = 1 << bank_config;
            feature_read_count = 0;
            weight_read_count = 0;
            output_writes = 0;
            memory_issue_cycles = 0;
            memory_stall_cycles = 0;

            for (oc = 0; oc < OUTPUT_CHANNELS; oc = oc + 1) begin
            for (oy = 0; oy < OUTPUT_SIZE; oy = oy + 1) begin
                for (ox = 0; ox < OUTPUT_SIZE; ox = ox + 1) begin
                    partial_sum = 0;
                    expected_sum = 0;

                    for (group_idx = 0; group_idx < GROUPS_PER_OUTPUT; group_idx = group_idx + 1) begin
                        remaining = 0;
                        for (lane = 0; lane < MACS_PER_CYCLE; lane = lane + 1) begin
                            term = group_idx * MACS_PER_CYCLE + lane;
                            lane_feature[lane] = 0;
                            lane_weight[lane] = 0;
                            pending[lane] = (term < TERMS_PER_OUTPUT);
                            if (pending[lane]) remaining = remaining + 1;
                        end

                        // Each feature/weight memory has active_banks single-read
                        // banks, interleaved by word address. Requests that
                        // collide on either memory bank wait for a later cycle.
                        while (remaining > 0) begin
                            requests_this_cycle = remaining;
                            for (i = 0; i < active_banks; i = i + 1) begin
                                feature_bank_busy[i] = 0;
                                weight_bank_busy[i] = 0;
                            end
                            accepted_this_cycle = 0;

                            for (lane = 0; lane < MACS_PER_CYCLE; lane = lane + 1) begin
                                term = group_idx * MACS_PER_CYCLE + lane;
                                if (pending[lane]) begin
                                    ic = term / (KERNEL_SIZE * KERNEL_SIZE);
                                    ky = (term / KERNEL_SIZE) % KERNEL_SIZE;
                                    kx = term % KERNEL_SIZE;
                                    feature_addr = (ic * INPUT_SIZE + (oy + ky)) * INPUT_SIZE + (ox + kx);
                                    weight_addr = oc * TERMS_PER_OUTPUT + term;
                                    if (bank_mapping == 0)
                                        feature_bank = feature_addr % active_banks;
                                    else
                                        feature_bank = ((ox + kx) + 3 * (oy + ky) + 5 * ic)
                                            % active_banks;
                                    weight_bank = weight_addr % active_banks;

                                    if (!feature_bank_busy[feature_bank]
                                        && !weight_bank_busy[weight_bank]) begin
                                        feature_bank_busy[feature_bank] = 1;
                                        weight_bank_busy[weight_bank] = 1;
                                        lane_feature[lane] = feature_mem[feature_addr];
                                        lane_weight[lane] = weight_mem[weight_addr];
                                        pending[lane] = 0;
                                        remaining = remaining - 1;
                                        accepted_this_cycle = accepted_this_cycle + 1;
                                        feature_read_count = feature_read_count + 1;
                                        weight_read_count = weight_read_count + 1;
                                        expected_sum = expected_sum
                                            + (($signed(longint'(feature_mem[feature_addr]))
                                              * $signed(longint'(weight_mem[weight_addr]))) >>> 8);
                                    end
                                end
                            end

                            if (accepted_this_cycle == 0)
                                $fatal(1, "Memory scheduler made no progress");
                            memory_issue_cycles = memory_issue_cycles + 1;
                            if (accepted_this_cycle < requests_this_cycle)
                                memory_stall_cycles = memory_stall_cycles + 1;
                            #1;
                        end

                        // Count a distinct read-return latency and one MAC
                        // execution cycle after the group's reads are issued.
                        #READ_LATENCY;
                        a0 = lane_feature[0]; b0 = lane_weight[0];
                        a1 = lane_feature[1]; b1 = lane_weight[1];
                        a2 = lane_feature[2]; b2 = lane_weight[2];
                        a3 = lane_feature[3]; b3 = lane_weight[3];
                        #1;
                        partial_sum = partial_sum + mac_result;
                    end

                    actual_sum = partial_sum;
                    if (actual_sum !== expected_sum[15:0]) begin
                        $fatal(1,
                            "Mismatch at oc=%0d oy=%0d ox=%0d: got %0d expected %0d",
                            oc, oy, ox, actual_sum, expected_sum[15:0]);
                    end

                    output_addr = (oc * OUTPUT_SIZE + oy) * OUTPUT_SIZE + ox;
                    output_mem[output_addr] = actual_sum;
                    output_writes = output_writes + 1;
                end
            end
        end

            if (feature_read_count != 72900 || weight_read_count != 72900 || output_writes != OUTPUT_WORDS)
                $fatal(1, "Unexpected transaction counts: feature=%0d weights=%0d outputs=%0d",
                    feature_read_count, weight_read_count, output_writes);
            if (memory_issue_cycles != OUTPUT_WORDS * GROUPS_PER_OUTPUT + memory_stall_cycles)
                $fatal(1, "Inconsistent memory cycle counters: issue=%0d stalls=%0d",
                    memory_issue_cycles, memory_stall_cycles);

            $display("PASS: %0d outputs, signed int16 Q8.8, %0d MACs", output_writes, MACS_PER_CYCLE);
            if (bank_mapping == 0)
                $display("Feature mapping: linear word interleave; weight mapping: linear word interleave");
            else
                $display("Feature mapping: skewed spatial bank = (x + 3*y + 5*channel) mod banks; weight mapping: linear word interleave");
            $display("Memory model: %0d banks/operand, one read port/bank, read latency %0d cycle",
                active_banks, READ_LATENCY);
            $display("Memory issue: %0d cycles, including %0d cycles where bank conflicts deferred requests",
                memory_issue_cycles, memory_stall_cycles);
            $display("Non-overlapped read-return latency: %0d cycles; MAC execution: %0d cycles; total modeled cycles: %0d",
                OUTPUT_WORDS * GROUPS_PER_OUTPUT * READ_LATENCY,
                OUTPUT_WORDS * GROUPS_PER_OUTPUT,
                memory_issue_cycles + OUTPUT_WORDS * GROUPS_PER_OUTPUT * (READ_LATENCY + 1));
            $display("Traffic: %0d feature reads, %0d weight reads, %0d output writes",
                feature_read_count, weight_read_count, output_writes);
        end
        end
        $finish;
    end
endmodule
