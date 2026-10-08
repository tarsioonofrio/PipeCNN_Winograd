`timescale 1ns/1ps
module tb_pipecnn_win_buffer_compute;
    localparam int VEC=16;
    localparam int WORD_W=4*VEC*8;
    localparam int WEIGHT_W=32*16*6*8;
    localparam int RESULT_W=32*6*8;

    logic clock, resetn=0;
    logic word_valid=0, word_ready;
    logic [15:0] win_size=16'd2, win_size_y=16'd1, weight_dim3=16'd16;
    logic [15:0] weight_dim4_div_lane=16'd1;
    logic [15:0] group_num_x=16'd3, group_num_y=16'd1;
    logic [7:0] group_size_x=8'd4, stride=8'd1;
    logic [7:0] weight_dim1=3, conv_row_rem=1;
    logic [15:0] data_dim1=16'd16, data_dim2=16'd1;
    logic [31:0] data_dim1xdim2=32'd16;
    logic [7:0] padding=0;
    logic [WORD_W-1:0] bottom_word='0;
    logic fc_en=0;
    logic [31:0] conv_loop_cnt=2;
    logic [31:0] group_num_mul_win_size=12;
    logic [WEIGHT_W-1:0] weight_word;
    logic [32*8-1:0] bias_word='0;
    logic signed [7:0] frac_w=7, frac_b=0, frac_din=1, frac_dout=0;
    logic relu_enable=0;
    logic result_valid;
    logic [RESULT_W-1:0] result;
    logic [15:0] gp_num_x, gp_num_y, out_idx_z, win_itm_xyz;
    logic [1:0] flag;
    logic read8_flag;
    logic [31:0] conv_z_cnt, iteration_index, weight_global_address;
    logic [31:0] bottom_read_address;
    logic bottom_zero_fill;
    logic done;
    logic [15:0] feature_x, feature_y, feature_z;
    integer output_seen, group, index, n, weight_bit, clear_bit;

    always #5 clock=~clock;

    pipecnn_memread_buffered_compute #(
        .MAX_WIN_SIZE(2),.INDEX_W(32),.COUNTER_W(16)
    ) dut (
        .clock,.resetn,.word_valid,.word_ready,
        .win_size,.win_size_y,.weight_dim3,.weight_dim4_div_lane,
        .group_num_x,.group_num_y,.group_size_x,.stride,
        .weight_dim1,.conv_row_rem,.data_dim1,.data_dim2,.data_dim1xdim2,
        .padding,.conv_loop_cnt,.group_num_mul_win_size,
        .bottom_word,.fc_en,.weight_word,.bias_word,
        .frac_w,.frac_b,.frac_din,.frac_dout,.relu_enable,
        .gp_num_x,.gp_num_y,.out_idx_z,.win_itm_xyz,.flag,.read8_flag,
        .conv_z_cnt,.iteration_index,.done,.weight_global_address,
        .bottom_read_address,.bottom_zero_fill,
        .feature_x,.feature_y,.feature_z,
        .result_valid,.result
    );

    function automatic [WORD_W-1:0] make_word(input integer g,input integer idx);
        reg [WORD_W-1:0] value;
        integer vector_index, channel;
        begin
            value='0;
            for (vector_index=0;vector_index<4;vector_index=vector_index+1)
                for (channel=0;channel<VEC;channel=channel+1)
                    value[(vector_index*VEC+channel)*8 +: 8]
                        = 8'(g*20+idx*8+vector_index+channel+1);
            make_word=value;
        end
    endfunction

    function automatic logic signed [7:0] expected_output(
        input integer output_id, input integer output_position
    );
        integer base_group, term, p, source_group, source_position;
        integer d[0:5], u[0:5], m[0:5];
        integer accumulated[0:3];
        integer y0, y1, y2, y3, scaled, rounded, saturated;
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
                expected_output=8'(saturated);
            end else begin
                expected_output=8'sd0;
            end
        end
    endfunction

    task automatic send_word(input integer g,input integer idx);
        begin
            @(negedge clock);
            if (gp_num_x !== 16'(g) || win_itm_xyz !== 16'(idx)
                || bottom_read_address !== 32'(g) || bottom_zero_fill !== 1'b0) begin
                $error("unexpected source counters before group=%0d index=%0d: gp_x=%0d win_item=%0d",
                       g,idx,gp_num_x,win_itm_xyz);
                $fatal(1);
            end
            bottom_word=make_word(g,idx);
            for (clear_bit=0;clear_bit<WEIGHT_W;clear_bit=clear_bit+1)
                weight_word[clear_bit]=1'b0;
            for (n=0;n<6;n=n+1) begin
                weight_word[((0*16+0)*6+n)*8 +: 8] = 8'(5+weight_global_address);
                weight_word[((31*16+0)*6+n)*8 +: 8] = 8'(5+weight_global_address);
            end
            word_valid=1;
            while (!word_ready) @(negedge clock);
            @(negedge clock);
            word_valid=0;
        end
    endtask

    always @(posedge clock) begin : scoreboard
        integer tile_index, lane;
        logic signed [7:0] expected_byte;
        if (resetn && result_valid) begin
            if (output_seen >= 3) begin
                $error("unexpected extra compute output");
                $fatal(1);
            end
            tile_index=output_seen;
            for (n=0;n<6;n=n+1) begin
                expected_byte=expected_output(tile_index,n);
                if ($signed(result[(0*6+n)*8 +: 8]) !== expected_byte ||
                    $signed(result[(31*6+n)*8 +: 8]) !== expected_byte) begin
                    $error("tile %0d feature %0d got lane0=%0d lane31=%0d expected=%0d",
                           tile_index,n,$signed(result[n*8 +: 8]),
                           $signed(result[(31*6+n)*8 +: 8]),expected_byte);
                    $fatal(1);
                end
                for (lane=1;lane<31;lane=lane+1)
                    if (result[(lane*6+n)*8 +: 8] !== 8'b0) begin
                        $error("unexpected nonzero output lane %0d position %0d",lane,n);
                        $fatal(1);
                    end
            end
            output_seen<=output_seen+1;
        end
    end

    initial begin
        clock=0;
        output_seen=0;
        for (weight_bit=0;weight_bit<WEIGHT_W;weight_bit=weight_bit+1)
            weight_word[weight_bit]=1'b0;
        repeat (3) @(negedge clock);
        resetn=1;
        for (group=0;group<6;group=group+1)
            for (index=0;index<2;index=index+1)
                send_word(group%3,index);
        if (done !== 1'b1) begin
            $error("integrated counter did not finish the twelve-iteration source loop");
            $fatal(1);
        end
        wait(output_seen==3);
        repeat (4) @(negedge clock);
        $display("PASS: memRead counters/buffers, F(4,3) convolution, two-term accumulation and quantized output (%0d tiles)",output_seen);
        $finish;
    end

    initial begin
        #10000;
        $fatal(1,"timeout");
    end
endmodule
