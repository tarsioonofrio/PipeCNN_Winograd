`timescale 1ns/1ps
module tb_pipecnn_memread_compute;
    logic clock;
    initial begin
        clock=1'b0;
        forever #5ns clock=~clock;
    end

    logic resetn;
    logic ivalid;
    logic fc_en;
    logic [16*6*8-1:0] feature_window;
    logic [32*16*6*8-1:0] transformed_weights;
    logic ovalid;
    logic [32*6*32-1:0] result;

    logic signed [7:0] feature_ref [0:15][0:5];
    logic signed [15:0] transformed_ref [0:15][0:5];
    logic signed [7:0] weight_ref [0:31][0:15][0:5];
    logic signed [31:0] raw_expected [0:1][0:31][0:5];
    logic signed [31:0] expected [0:1][0:31][0:5];
    logic [31:0] rng;
    integer test_id, m, n, l, k;
    longint signed accum;
    logic signed [31:0] m0, m1, m2, m3, m4, m5;
    integer cycle_count, accepted_count, observed_count, previous_output_cycle;
    integer accepted_cycle [0:23];

    function automatic integer signed as_i32(input logic signed [7:0] value);
        as_i32 = {{24{value[7]}}, value};
    endfunction

    function automatic longint signed as_i64_8(input logic signed [7:0] value);
        as_i64_8 = {{56{value[7]}}, value};
    endfunction

    function automatic longint signed as_i64_16(input logic signed [15:0] value);
        as_i64_16 = {{48{value[15]}}, value};
    endfunction

    pipecnn_memread_compute dut (.*);

    // Measure the reconstructed slice at its clock boundary. Inputs are
    // accepted on consecutive cycles below; the two registered MAC stages
    // should produce one valid result per cycle after the fixed latency.
    always @(posedge clock) begin
        integer output_id;
        if (!resetn) begin
            cycle_count <= 0;
            accepted_count <= 0;
            observed_count <= 0;
            previous_output_cycle <= -1;
        end else begin
            cycle_count <= cycle_count + 1;
            if (ivalid) begin
                accepted_cycle[accepted_count] <= cycle_count + 1;
                accepted_count <= accepted_count + 1;
            end
            if (ovalid) begin
                output_id = observed_count;
                if (output_id >= accepted_count)
                    $fatal(1, "unexpected output %0d without accepted input", output_id);
                if (cycle_count + 1 - accepted_cycle[output_id] != 2)
                    $fatal(1, "vector %0d latency=%0d cycles, expected 2",
                        output_id, cycle_count + 1 - accepted_cycle[output_id]);
                if (previous_output_cycle >= 0
                    && cycle_count + 1 - previous_output_cycle != 1)
                    $fatal(1, "output II=%0d cycles, expected 1",
                        cycle_count + 1 - previous_output_cycle);
                previous_output_cycle <= cycle_count + 1;
                observed_count <= observed_count + 1;
            end
        end
    end

    task automatic create_vector(input integer case_num);
        integer v0, v1, v2, v3, v4, v5;
        integer val, slot;
        begin
            slot = case_num % 2;
            for (m=0; m<16; m=m+1) begin
                for (n=0; n<6; n=n+1) begin
                    rng = rng * 32'd1664525 + 32'd1013904223;
                    case (case_num % 5)
                        0: val = {{24{rng[7]}}, rng[7:0]};
                        1: val = ((m+n)%2 != 0) ? -128 : 127;
                        2: val = {{26{rng[5]}}, rng[5:0]};
                        3: val = 0;
                        default: val = {{24{rng[7]}}, rng[7:0]};
                    endcase
                    feature_ref[m][n] = 8'(val);
                    feature_window[(m*6+n)*8 +: 8] = val[7:0];
                end
            end

            for (l=0; l<32; l=l+1)
                for (m=0; m<16; m=m+1)
                    for (n=0; n<6; n=n+1) begin
                        rng = rng * 32'd1664525 + 32'd1013904223;
                        case (case_num % 5)
                            0: val = {{24{rng[7]}}, rng[7:0]};
                            1: val = ((l+m+n)%2 != 0) ? -128 : 127;
                            2: val = {{25{rng[6]}}, rng[6:0]};
                            3: val = 1;
                            default: val = {{24{rng[7]}}, rng[7:0]};
                        endcase
                        weight_ref[l][m][n] = 8'(val);
                        transformed_weights[((l*16+m)*6+n)*8 +: 8] = val[7:0];
                    end

            for (m=0; m<16; m=m+1) begin
                v0 = 4*as_i32(feature_ref[m][0]) - 5*as_i32(feature_ref[m][2]) + as_i32(feature_ref[m][4]);
                v1 = -4*as_i32(feature_ref[m][1]) - 4*as_i32(feature_ref[m][2]) + as_i32(feature_ref[m][3]) + as_i32(feature_ref[m][4]);
                v2 = 4*as_i32(feature_ref[m][1]) - 4*as_i32(feature_ref[m][2]) - as_i32(feature_ref[m][3]) + as_i32(feature_ref[m][4]);
                v3 = -2*as_i32(feature_ref[m][1]) - as_i32(feature_ref[m][2]) + 2*as_i32(feature_ref[m][3]) + as_i32(feature_ref[m][4]);
                v4 = 2*as_i32(feature_ref[m][1]) - as_i32(feature_ref[m][2]) - 2*as_i32(feature_ref[m][3]) + as_i32(feature_ref[m][4]);
                v5 = 4*as_i32(feature_ref[m][1]) - 5*as_i32(feature_ref[m][3]) + as_i32(feature_ref[m][5]);
                transformed_ref[m][0] = 16'(v0);
                transformed_ref[m][1] = 16'(v1);
                transformed_ref[m][2] = 16'(v2);
                transformed_ref[m][3] = 16'(v3);
                transformed_ref[m][4] = 16'(v4);
                transformed_ref[m][5] = 16'(v5);
            end

            for (l=0; l<32; l=l+1) begin
                for (n=0; n<6; n=n+1) begin
                    accum = 0;
                    for (m=0; m<16; m=m+1) begin
                        if (fc_en)
                            accum = accum + as_i64_8(feature_ref[m][n]) * as_i64_8(weight_ref[l][m][n]);
                        else
                            accum = accum + as_i64_16(transformed_ref[m][n]) * as_i64_8(weight_ref[l][m][n]);
                    end
                    raw_expected[slot][l][n] = accum[31:0];
                    expected[slot][l][n] = accum[31:0];
                end

                if (!fc_en) begin
                    m0=expected[slot][l][0]; m1=expected[slot][l][1]; m2=expected[slot][l][2];
                    m3=expected[slot][l][3]; m4=expected[slot][l][4]; m5=expected[slot][l][5];
                    expected[slot][l][0] = m0 + m1 + m2 + m3 + m4;
                    expected[slot][l][1] = m1 - m2 + (m3 <<< 1) - (m4 <<< 1);
                    expected[slot][l][2] = m1 + m2 + (m3 <<< 2) + (m4 <<< 2);
                    expected[slot][l][3] = m1 - m2 + (m3 <<< 3) - (m4 <<< 3) + m5;
                    expected[slot][l][4] = 0;
                    expected[slot][l][5] = 0;
                end
            end
        end
    endtask

    task automatic check_vector(input integer checked_id);
        integer lane, pos;
        logic signed [31:0] got;
        begin
            if (ovalid !== 1'b1)
                $fatal(1, "valid missing for vector %0d", checked_id);
            for (lane=0; lane<32; lane=lane+1)
                for (pos=0; pos<6; pos=pos+1) begin
                    got = dut.mac_result[lane][pos];
                    if (got !== raw_expected[checked_id%2][lane][pos]) begin
                        $fatal(1, "raw MAC mismatch vector=%0d lane=%0d pos=%0d got=%0d expected=%0d",
                            checked_id, lane, pos, got, raw_expected[checked_id%2][lane][pos]);
                    end
                end
            for (lane=0; lane<32; lane=lane+1)
                for (pos=0; pos<6; pos=pos+1) begin
                    got = result[(lane*6+pos)*32 +: 32];
                    if (got !== expected[checked_id%2][lane][pos])
                        $fatal(1, "mismatch vector=%0d fc=%0d lane=%0d pos=%0d got=%0d expected=%0d",
                            checked_id, fc_en, lane, pos, got, expected[checked_id%2][lane][pos]);
                end
        end
    endtask

    initial begin
        resetn=1'b0; ivalid=1'b0; fc_en=1'b0;
        rng=32'h1e95a17b;
        repeat (3) @(negedge clock);
        resetn=1'b1;

        // One vector is accepted on each rising edge. Check each result once
        // it reaches the two-stage output boundary.
        for (test_id=0; test_id<24; test_id=test_id+1) begin
            @(negedge clock);
            if (test_id >= 2)
                check_vector(test_id-2);
            fc_en = (test_id % 2) != 0;
            create_vector(test_id);
            ivalid=1'b1;
        end

        @(negedge clock);
        ivalid=1'b0;
        check_vector(22);
        @(negedge clock);
        check_vector(23);
        @(negedge clock);
        if (ovalid !== 1'b0)
            $fatal(1, "valid did not drain after final vector");
        if (accepted_count != 24 || observed_count != 24)
            $fatal(1, "timing monitor accepted=%0d observed=%0d, expected 24 each",
                accepted_count, observed_count);
        $display("PASS: 24 back-to-back vectors across 32 lanes; latency=2 cycles, II=1; F(4,3)/FC, lane-31 direct branch, 16x8 MAC");
        $finish;
    end
endmodule
