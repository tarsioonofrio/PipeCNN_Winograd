`timescale 1ns/1ps
module tb_pipecnn_memread_pool_memwrite_system;
    localparam int VEC=16;
    localparam int WORD_W=4*VEC*8;
    localparam int WEIGHT_W=32*16*6*8;
    localparam int RESULT_W=VEC*8;
    localparam int MIN_READ_RESPONSE_LATENCY=2;

    logic clock, resetn;
    logic word_valid=0, word_ready;
    logic [15:0] win_size=2, win_size_y=1, weight_dim3=16;
    logic [15:0] weight_dim4_div_lane=1;
    logic [15:0] group_num_x=3, group_num_y=1;
    logic [7:0] group_size_x=4, stride=1, weight_dim1=3, conv_row_rem=1;
    logic [15:0] data_dim1=16, data_dim2=1;
    logic [31:0] data_dim1xdim2=16;
    logic [7:0] padding=0;
    logic [31:0] conv_loop_cnt=2, group_num_mul_win_size=12;
    logic [WORD_W-1:0] bottom_word='0;
    logic fc_en=0;
    logic [WEIGHT_W-1:0] weight_word;
    logic [32*8-1:0] bias_word='0;
    logic signed [7:0] frac_w=0, frac_b=0, frac_din=0, frac_dout=0;
    logic relu_enable=0;

    logic bypass=1;
    logic [15:0] line_size=3, col_size=1;
    logic [31:0] out_num=6;
    logic [7:0] q_vec=1, rem_size_x=1, start_size_x=1;
    logic [7:0] out_dim1_div_q_vec=3;
    logic next_layer_padding=0;
    logic [15:0] out_dim1=3, out_dim2=1;
    logic [31:0] out_dim1xdim2=3;
    logic [7:0] scal=2, scal_rem_z=2;
    logic [7:0] scalxq_vec=2, scalxrem_size_x=2, scalxstart_size_x=2;
    logic [7:0] scal_rem_zxq_vec=2, scal_rem_zxrem_size_x=2;
    logic [7:0] scal_rem_zxstart_size_x=2;
    logic [31:0] dim_z_edge_num=100;
    logic write_valid, write_ready;
    logic [31:0] write_addr;
    logic [RESULT_W-1:0] write_data;
    logic memread_done, memwrite_done;
    logic [15:0] gp_num_x, gp_num_y, out_idx_z, win_itm_xyz;
    logic [1:0] flag;
    logic read8_flag;
    logic [31:0] conv_z_cnt, iteration_index, weight_global_address;
    logic [31:0] bottom_read_address;
    logic bottom_zero_fill;
    logic [15:0] feature_x, feature_y, feature_z;
    logic [3:0] result_fifo_count;

    integer cycle_count, writes_seen, result_tokens_seen, i, weight_bit;
    integer memory_reads_seen, memory_response_wait_cycles, max_memory_response_wait;
    integer layer22_cycle_start, layer22_elapsed_cycles;
    integer address_index;
    integer fixed_read_response_latency;
    logic stalled_q, full_layer22, nonzero_compute_mode;
    logic [577:0] layer22_address_seen;
    logic [31:0] held_addr_q;
    logic [RESULT_W-1:0] held_data_q;

    always #5 clock=~clock;

    function automatic logic [WORD_W-1:0] feature_word_for_address(
        input logic [31:0] address
    );
        integer byte_index;
        begin
            for (byte_index=0; byte_index<WORD_W/8; byte_index=byte_index+1)
                feature_word_for_address[byte_index*8 +: 8]
                    = 8'(address + byte_index*13);
        end
    endfunction

    function automatic logic [WORD_W-1:0] feature_word_for_compute(
        input integer group_id,input integer item_index
    );
        integer vector_index, channel;
        begin
            feature_word_for_compute='0;
            for (vector_index=0;vector_index<4;vector_index=vector_index+1)
                for (channel=0;channel<VEC;channel=channel+1)
                    feature_word_for_compute[(vector_index*VEC+channel)*8 +: 8]
                        = 8'(group_id*20+item_index*8+vector_index+channel+1);
        end
    endfunction

    function automatic logic signed [7:0] expected_compute_output(
        input integer output_id,input integer output_position
    );
        integer base_group, term, p, source_group, source_position;
        integer d[0:5], u[0:5], m[0:5];
        integer accumulated[0:3];
        integer y0,y1,y2,y3,scaled,rounded,saturated;
        begin
            for (p=0;p<4;p=p+1)
                accumulated[p]=0;
            base_group=(output_id==1) ? 1 : 0;
            for (term=0;term<2;term=term+1) begin
                for (p=0;p<6;p=p+1) begin
                    if (p<4) begin
                        source_group=base_group;
                        source_position=p;
                    end else begin
                        source_group=(base_group+1)%3;
                        source_position=p-4;
                    end
                    d[p]=source_group*20+term*8+source_position+1;
                end
                u[0]=4*d[0]-5*d[2]+d[4];
                u[1]=-4*d[1]-4*d[2]+d[3]+d[4];
                u[2]=4*d[1]-4*d[2]-d[3]+d[4];
                u[3]=-2*d[1]-d[2]+2*d[3]+d[4];
                u[4]=2*d[1]-d[2]-2*d[3]+d[4];
                u[5]=4*d[1]-5*d[3]+d[5];
                for (p=0;p<6;p=p+1)
                    m[p]=u[p]*(5+term);
                y0=m[0]+m[1]+m[2]+m[3]+m[4];
                y1=m[1]-m[2]+2*m[3]-2*m[4];
                y2=m[1]+m[2]+4*m[3]+4*m[4];
                y3=m[1]-m[2]+8*m[3]-8*m[4]+m[5];
                accumulated[0]=accumulated[0]+y0;
                accumulated[1]=accumulated[1]+y1;
                accumulated[2]=accumulated[2]+y2;
                accumulated[3]=accumulated[3]+y3;
            end
            if (output_position<4) begin
                scaled=accumulated[output_position] >>> 7;
                rounded=(scaled & 32'hffff_fffe)+1;
                if (rounded>=256) saturated=127;
                else if (rounded< -256) saturated=-128;
                else saturated=rounded >>> 1;
                expected_compute_output=8'(saturated);
            end else begin
                expected_compute_output=8'sd0;
            end
        end
    endfunction

    always @(negedge clock) begin
        if (resetn) begin
            write_ready <= ((cycle_count % 5) != 2);
            cycle_count <= cycle_count+1;
        end
    end

    pipecnn_memread_pool_memwrite_system #(
        .MAX_WIN_SIZE(96), .FIFO_DEPTH(8), .MAX_COLS(8)
    ) dut (
        .clock, .resetn, .word_valid, .word_ready,
        .win_size, .win_size_y, .weight_dim3, .weight_dim4_div_lane,
        .group_num_x, .group_num_y, .group_size_x, .stride,
        .weight_dim1, .conv_row_rem, .data_dim1, .data_dim2,
        .data_dim1xdim2, .padding, .conv_loop_cnt, .group_num_mul_win_size,
        .bottom_word, .fc_en, .weight_word, .bias_word,
        .frac_w, .frac_b, .frac_din, .frac_dout, .relu_enable,
        .bypass, .line_size, .col_size, .out_num, .q_vec,
        .rem_size_x, .start_size_x, .out_dim1_div_q_vec,
        .next_layer_padding, .out_dim1, .out_dim2, .out_dim1xdim2,
        .scal, .scal_rem_z, .scalxq_vec, .scalxrem_size_x,
        .scalxstart_size_x, .scal_rem_zxq_vec,
        .scal_rem_zxrem_size_x, .scal_rem_zxstart_size_x,
        .dim_z_edge_num, .write_valid, .write_ready,
        .write_addr, .write_data, .memread_done, .memwrite_done,
        .gp_num_x, .gp_num_y, .out_idx_z, .win_itm_xyz,
        .flag, .read8_flag, .conv_z_cnt, .iteration_index,
        .weight_global_address, .bottom_read_address, .bottom_zero_fill,
        .feature_x, .feature_y, .feature_z, .result_fifo_count
    );

    task automatic send_word;
        logic [31:0] request_address;
        logic [31:0] request_weight_address;
        logic [15:0] request_group,request_item;
        logic request_zero_fill;
        integer response_latency;
        integer weight_lane,weight_position,weight_bit_index;
        begin
            @(negedge clock);
            request_address=bottom_read_address;
            request_weight_address=weight_global_address;
            request_group=gp_num_x;
            request_item=win_itm_xyz;
            request_zero_fill=bottom_zero_fill;
            if (fixed_read_response_latency >= 0)
                response_latency=fixed_read_response_latency;
            else
                response_latency=MIN_READ_RESPONSE_LATENCY
                                 + int'(request_address % 3);
            memory_reads_seen=memory_reads_seen+1;
            memory_response_wait_cycles=memory_response_wait_cycles+response_latency;
            if (response_latency>max_memory_response_wait)
                max_memory_response_wait=response_latency;

            repeat (response_latency) @(negedge clock);
            if (bottom_read_address !== request_address
                || weight_global_address !== request_weight_address
                || gp_num_x !== request_group || win_itm_xyz !== request_item) begin
                $error("feature read address changed before response: got=%0d expected=%0d",
                       bottom_read_address,request_address);
                $fatal(1);
            end
            if (nonzero_compute_mode)
                bottom_word=feature_word_for_compute(int'(request_group),int'(request_item));
            else if (request_zero_fill)
                bottom_word='0;
            else
                bottom_word=feature_word_for_address(request_address);
            if (nonzero_compute_mode) begin
                for (weight_bit_index=0;weight_bit_index<WEIGHT_W;
                     weight_bit_index=weight_bit_index+1)
                    weight_word[weight_bit_index]=1'b0;
                for (weight_position=0;weight_position<6;weight_position=weight_position+1) begin
                    for (weight_lane=0;weight_lane<2;weight_lane=weight_lane+1) begin
                        if (weight_lane==0)
                            weight_word[((0*16+0)*6+weight_position)*8 +: 8]
                                =8'(5+request_weight_address);
                        else
                            weight_word[((31*16+0)*6+weight_position)*8 +: 8]
                                =8'(5+request_weight_address);
                    end
                end
            end
            word_valid=1;
            while (!word_ready) begin
                @(negedge clock);
                if (bottom_read_address !== request_address
                    || weight_global_address !== request_weight_address
                    || gp_num_x !== request_group || win_itm_xyz !== request_item) begin
                    $error("feature read address changed while response was stalled");
                    $fatal(1);
                end
            end
            @(posedge clock);
            @(negedge clock);
            word_valid=0;
        end
    endtask

    task automatic run_layer(input logic use_pool, input integer expected_writes);
        begin
            word_valid=0;
            resetn=0;
            bypass=!use_pool;
            out_num=expected_writes;
            repeat (2) @(negedge clock);
            writes_seen=0;
            cycle_count=0;
            stalled_q=0;
            full_layer22=0;
            layer22_address_seen='0;
            write_ready=1;
            @(negedge clock);
            resetn=1;

            for (i=0; i<12; i=i+1)
                send_word();

            wait(memread_done);
            wait(memwrite_done);
            @(negedge clock);
            if (writes_seen != expected_writes) begin
                $error("bypass=%0d observed %0d writes, expected %0d",
                       bypass,writes_seen,expected_writes);
                $fatal(1);
            end
            if (result_fifo_count != 0) begin
                $error("result FIFO did not drain: count=%0d",result_fifo_count);
                $fatal(1);
            end
        end
    endtask

    task automatic run_layer22_host_workload;
        begin
            resetn=0;
            word_valid=0;
            bypass=1;
            win_size=16;
            win_size_y=1;
            weight_dim3=256;
            weight_dim4_div_lane=1;
            group_num_x=5;
            group_num_y=17;
            group_size_x=4;
            stride=1;
            weight_dim1=1;
            conv_row_rem=1;
            data_dim1=20;
            data_dim2=17;
            data_dim1xdim2=340;
            padding=0;
            conv_loop_cnt=16;
            group_num_mul_win_size=1392;
            fc_en=1;

            line_size=17;
            col_size=5;
            out_num=578;
            q_vec=4;
            rem_size_x=1;
            start_size_x=4;
            out_dim1_div_q_vec=5;
            next_layer_padding=0;
            out_dim1=17;
            out_dim2=17;
            out_dim1xdim2=289;
            scal=2;
            scal_rem_z=2;
            scalxq_vec=8;
            scalxrem_size_x=2;
            scalxstart_size_x=8;
            scal_rem_zxq_vec=8;
            scal_rem_zxrem_size_x=2;
            scal_rem_zxstart_size_x=8;
            dim_z_edge_num=578;

            repeat (2) @(negedge clock);
            writes_seen=0;
            cycle_count=0;
            stalled_q=0;
            layer22_address_seen='0;
            full_layer22=1;
            write_ready=1;
            @(negedge clock);
            resetn=1;
            layer22_cycle_start=cycle_count;

            for (i=0; i<1392; i=i+1) begin
                send_word();
                if ((i % 200) == 199)
                    $display("Active host row 22 input progress %0d/%0d, source index=%0d, fifo=%0d, writes=%0d",
                             i+1,1392,iteration_index,result_fifo_count,writes_seen);
            end

            wait(memread_done);
            wait(memwrite_done);
            @(negedge clock);
            layer22_elapsed_cycles=cycle_count-layer22_cycle_start;
            if (writes_seen != 578 || result_tokens_seen != 85
                || result_fifo_count != 0) begin
                $error("Active host row 22 workload ended with tokens=%0d writes=%0d FIFO=%0d",
                       result_tokens_seen,writes_seen,result_fifo_count);
                $fatal(1);
            end
            for (address_index=0; address_index<578; address_index=address_index+1)
                if (!layer22_address_seen[address_index]) begin
                    $error("Active host row 22 output address %0d was not written",address_index);
                    $fatal(1);
                end
        end
    endtask

    task automatic run_nonzero_compute_system;
        begin
            nonzero_compute_mode=1;
            resetn=0;
            word_valid=0;
            win_size=2;
            win_size_y=1;
            weight_dim3=16;
            weight_dim4_div_lane=1;
            group_num_x=3;
            group_num_y=1;
            group_size_x=4;
            stride=1;
            weight_dim1=3;
            conv_row_rem=1;
            data_dim1=16;
            data_dim2=1;
            data_dim1xdim2=16;
            padding=0;
            conv_loop_cnt=2;
            group_num_mul_win_size=12;
            fc_en=0;
            frac_w=7;
            frac_b=0;
            frac_din=1;
            frac_dout=0;
            relu_enable=0;

            bypass=1;
            line_size=3;
            col_size=1;
            out_num=6;
            q_vec=1;
            rem_size_x=1;
            start_size_x=1;
            out_dim1_div_q_vec=3;
            next_layer_padding=0;
            out_dim1=3;
            out_dim2=1;
            out_dim1xdim2=3;
            scal=2;
            scal_rem_z=2;
            scalxq_vec=2;
            scalxrem_size_x=2;
            scalxstart_size_x=2;
            scal_rem_zxq_vec=2;
            scal_rem_zxrem_size_x=2;
            scal_rem_zxstart_size_x=2;
            dim_z_edge_num=100;

            repeat (2) @(negedge clock);
            writes_seen=0;
            cycle_count=0;
            stalled_q=0;
            full_layer22=0;
            layer22_address_seen='0;
            write_ready=1;
            @(negedge clock);
            resetn=1;

            for (i=0;i<12;i=i+1)
                send_word();

            wait(memread_done);
            wait(memwrite_done);
            @(negedge clock);
            if (writes_seen!=6 || result_tokens_seen!=3 || result_fifo_count!=0) begin
                $error("nonzero system case ended with tokens=%0d writes=%0d FIFO=%0d",
                       result_tokens_seen,writes_seen,result_fifo_count);
                $fatal(1);
            end
            nonzero_compute_mode=0;
        end
    endtask

    always @(posedge clock) begin
        integer expected_addr,token_index,lane_base,byte_index,lane_index;
        logic signed [7:0] expected_byte;
        if (!resetn) begin
            stalled_q<=0;
            result_tokens_seen<=0;
        end else begin
            if (dut.core_result_valid) begin
                if (nonzero_compute_mode) begin
                    token_index=result_tokens_seen;
                    if (token_index>=3) begin
                        $error("unexpected extra nonzero compute token");
                        $fatal(1);
                    end
                    for (byte_index=0;byte_index<6;byte_index=byte_index+1) begin
                        expected_byte=expected_compute_output(token_index,byte_index);
                        if ($signed(dut.core_result[(0*6+byte_index)*8 +: 8])!==expected_byte
                            || $signed(dut.core_result[(31*6+byte_index)*8 +: 8])!==expected_byte) begin
                            $error("system token %0d feature %0d got lane0=%0d lane31=%0d expected=%0d",
                                   token_index,byte_index,
                                   $signed(dut.core_result[(0*6+byte_index)*8 +: 8]),
                                   $signed(dut.core_result[(31*6+byte_index)*8 +: 8]),
                                   expected_byte);
                            $fatal(1);
                        end
                        for (lane_index=1;lane_index<31;lane_index=lane_index+1)
                            if (dut.core_result[(lane_index*6+byte_index)*8 +: 8]!==8'b0) begin
                                $error("system token has unexpected nonzero lane %0d feature %0d",
                                       lane_index,byte_index);
                                $fatal(1);
                            end
                    end
                end
                result_tokens_seen<=result_tokens_seen+1;
            end
            if (stalled_q && (write_addr !== held_addr_q || write_data !== held_data_q)) begin
                $error("system output changed under backpressure");
                $fatal(1);
            end
            stalled_q<=write_valid && !write_ready;
            if (write_valid && !write_ready) begin
                held_addr_q<=write_addr;
                held_data_q<=write_data;
            end
        end

        if (resetn && write_valid && write_ready) begin
            if (nonzero_compute_mode) begin
                token_index=writes_seen/2;
                lane_base=(writes_seen%2)*16;
                for (byte_index=0;byte_index<VEC;byte_index=byte_index+1) begin
                    lane_index=lane_base+byte_index;
                    expected_byte=8'sd0;
                    if (lane_index==0 || lane_index==31)
                        expected_byte=expected_compute_output(token_index,0);
                    if ($signed(write_data[byte_index*8 +: 8])!==expected_byte) begin
                        $error("memWrite output %0d byte %0d got %0d expected %0d",
                               writes_seen,byte_index,
                               $signed(write_data[byte_index*8 +: 8]),expected_byte);
                        $fatal(1);
                    end
                end
            end else if (write_data !== '0) begin
                $error("zero workload produced nonzero output data: %h",write_data);
                $fatal(1);
            end
            if (bypass) begin
                if (full_layer22) begin
                    expected_addr=int'(write_addr);
                    if (write_addr >= 578 || layer22_address_seen[write_addr]) begin
                        $error("Active host row 22 output address repeated or out of range: %0d",write_addr);
                        $fatal(1);
                    end
                    layer22_address_seen[write_addr]<=1'b1;
                end else begin
                    case (writes_seen)
                        0: expected_addr=0;
                        1: expected_addr=3;
                        2: expected_addr=1;
                        3: expected_addr=4;
                        4: expected_addr=2;
                        5: expected_addr=5;
                        default: expected_addr=-1;
                    endcase
                end
            end else begin
                case (writes_seen)
                    0: expected_addr=0;
                    1: expected_addr=3;
                    default: expected_addr=-1;
                endcase
            end
            if (write_addr !== 32'(expected_addr)) begin
                $error("write %0d address got %0d expected %0d",
                       writes_seen,write_addr,expected_addr);
                $fatal(1);
            end
            writes_seen<=writes_seen+1;
        end
    end

    initial begin
        clock=0;
        resetn=0;
        write_ready=1;
        cycle_count=0;
        writes_seen=0;
        stalled_q=0;
        full_layer22=0;
        nonzero_compute_mode=0;
        layer22_address_seen='0;
        memory_reads_seen=0;
        memory_response_wait_cycles=0;
        max_memory_response_wait=0;
        fixed_read_response_latency=-1;
        if ($value$plusargs("MEMORY_READ_LATENCY=%d",fixed_read_response_latency)
            && fixed_read_response_latency<0)
            $fatal(1,"MEMORY_READ_LATENCY must be nonnegative");
        for (weight_bit=0; weight_bit<WEIGHT_W; weight_bit=weight_bit+1)
            weight_word[weight_bit]=1'b0;
        run_layer(1'b0,6);
        run_layer(1'b1,2);
        run_layer22_host_workload();
        run_nonzero_compute_system();
        $display("PASS: memRead -> FIFO -> bypass/pooling -> memWrite; active host row 22: 1392 iterations, 85 tokens, 578 writes");
        $display("Active host row 22 modeled cycles from reset release through FIFO/output drain: %0d",
                 layer22_elapsed_cycles);
        $display("PASS: nonzero F(4,3) compute reference through FIFO and memWrite");
        if (fixed_read_response_latency<0)
            $display("Synthetic feature-source delay: address-dependent 2-4 cycles; reads=%0d total_wait=%0d max_wait=%0d",
                     memory_reads_seen,memory_response_wait_cycles,max_memory_response_wait);
        else
            $display("Synthetic feature-source delay: fixed %0d cycles; reads=%0d total_wait=%0d max_wait=%0d",
                     fixed_read_response_latency,memory_reads_seen,
                     memory_response_wait_cycles,max_memory_response_wait);
        $finish;
    end

    initial begin
        #200000;
        $fatal(1,"timeout");
    end
endmodule
