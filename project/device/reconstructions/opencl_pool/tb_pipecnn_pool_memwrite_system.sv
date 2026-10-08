`timescale 1ns/1ps
module tb_pipecnn_pool_memwrite_system;
    localparam int LANES = 4;
    localparam int VEC = 2;
    localparam int W = 6;
    localparam int TOKEN_W = LANES*W*8;

    logic clock = 0;
    logic resetn = 0;
    logic conv_valid = 0;
    logic conv_ready;
    logic [TOKEN_W-1:0] conv_data = '0;
    logic [15:0] line_size = 4;
    logic [15:0] col_size = 2;
    logic [31:0] out_num = 16;
    logic [7:0] q_vec = 2;
    logic [7:0] rem_size_x = 2;
    logic [7:0] start_size_x = 2;
    logic [7:0] out_dim1_div_q_vec = 2;
    logic next_layer_padding = 0;
    logic [15:0] out_dim1 = 4;
    logic [15:0] out_dim2 = 2;
    logic [31:0] out_dim1xdim2 = 8;
    logic [7:0] scal = 2;
    logic [7:0] scal_rem_z = 2;
    logic [7:0] scalxq_vec = 4;
    logic [7:0] scalxrem_size_x = 4;
    logic [7:0] scalxstart_size_x = 4;
    logic [7:0] scal_rem_zxq_vec = 4;
    logic [7:0] scal_rem_zxrem_size_x = 4;
    logic [7:0] scal_rem_zxstart_size_x = 4;
    logic [31:0] dim_z_edge_num = 16;
    logic write_valid;
    logic write_ready = 1;
    logic [31:0] write_addr;
    logic [VEC*8-1:0] write_data;
    logic done;
    integer cycle_count = 0;
    integer writes_seen = 0;
    integer row, col;
    logic stalled_q = 0;
    logic [31:0] held_addr_q;
    logic [VEC*8-1:0] held_data_q;

    always #5 clock = ~clock;

    always @(negedge clock) begin
        if (resetn) begin
            write_ready <= ((cycle_count % 5) != 2);
            cycle_count <= cycle_count + 1;
        end
    end

    pipecnn_pool_memwrite_system #(
        .VEC_SIZE(VEC), .W_VEC_SIZE(W), .LANE_NUM(LANES), .MAX_COLS(2)
    ) dut (
        .clock, .resetn, .conv_valid, .conv_ready, .conv_data,
        .line_size, .col_size, .out_num, .q_vec, .rem_size_x,
        .start_size_x, .out_dim1_div_q_vec, .next_layer_padding,
        .out_dim1, .out_dim2, .out_dim1xdim2, .scal, .scal_rem_z,
        .scalxq_vec, .scalxrem_size_x, .scalxstart_size_x,
        .scal_rem_zxq_vec, .scal_rem_zxrem_size_x,
        .scal_rem_zxstart_size_x, .dim_z_edge_num,
        .write_valid, .write_ready, .write_addr, .write_data, .done
    );

    function automatic [TOKEN_W-1:0] make_tile(input integer y, input integer x);
        reg [TOKEN_W-1:0] value;
        integer lane, pos, sample;
        begin
            value = '0;
            for (lane=0; lane<LANES; lane=lane+1)
                for (pos=0; pos<W; pos=pos+1) begin
                    sample = lane*10 + y*7 + x*3 + pos - 30;
                    value[(lane*W+pos)*8 +: 8] = 8'(sample);
                end
            make_tile = value;
        end
    endfunction

    function automatic integer sample_value(
        input integer lane, input integer y, input integer x, input integer pos
    );
        sample_value = lane*10 + y*7 + x*3 + pos - 30;
    endfunction

    function automatic integer max4(
        input integer a, input integer b, input integer c, input integer d
    );
        integer m0, m1;
        begin
            m0 = (a > b) ? a : b;
            m1 = (c > d) ? c : d;
            max4 = (m0 > m1) ? m0 : m1;
        end
    endfunction

    task automatic send_tile(input integer y, input integer x);
        begin
            @(negedge clock);
            conv_data = make_tile(y,x);
            conv_valid = 1;
            while (!conv_ready) @(negedge clock);
            @(negedge clock);
            conv_valid = 0;
        end
    endtask

    always @(posedge clock) begin : scoreboard
        integer tile, local_index, lane_group, width_index;
        integer y_group, x_group, vector_index, expected_addr;
        integer lane, bottom_y, expected_value0, expected_value1;
        reg [7:0] expected_byte0, expected_byte1;
        if (!resetn) begin
            stalled_q = 0;
        end else begin
            if (stalled_q && (write_addr !== held_addr_q || write_data !== held_data_q)) begin
                $error("integrated output changed during backpressure");
                $fatal(1);
            end
            stalled_q = write_valid && !write_ready;
            if (stalled_q) begin
                held_addr_q = write_addr;
                held_data_q = write_data;
            end
        end

        if (resetn && write_valid && write_ready) begin
            tile = writes_seen / 4;
            local_index = writes_seen % 4;
            lane_group = local_index / 2;
            width_index = local_index % 2;
            y_group = tile / 2;
            x_group = tile % 2;
            vector_index = lane_group;
            expected_addr = vector_index*8 + y_group*4 + x_group*2 + width_index;
            if (write_addr !== expected_addr[31:0]) begin
                $error("write %0d addr got %0d expected %0d", writes_seen,write_addr,expected_addr);
                $fatal(1);
            end

            bottom_y = y_group*2+1;
            for (lane=0; lane<VEC; lane=lane+1) begin
                integer output_lane;
                output_lane = lane_group*VEC+lane;
                if (width_index == 0)
                    expected_value0 = max4(
                        sample_value(output_lane,bottom_y-1,x_group,0),
                        sample_value(output_lane,bottom_y-1,x_group,1),
                        sample_value(output_lane,bottom_y,x_group,0),
                        sample_value(output_lane,bottom_y,x_group,1));
                else
                    expected_value0 = max4(
                        sample_value(output_lane,bottom_y-1,x_group,2),
                        sample_value(output_lane,bottom_y-1,x_group,3),
                        sample_value(output_lane,bottom_y,x_group,2),
                        sample_value(output_lane,bottom_y,x_group,3));
                expected_value1 = expected_value0;
                expected_byte0 = 8'(expected_value0);
                expected_byte1 = 8'(expected_value1);
                if (write_data[lane*8 +: 8] !== expected_byte0) begin
                    $error("write %0d byte%0d got %h expected %h", writes_seen,lane,
                           write_data[lane*8 +: 8], expected_byte0);
                    $fatal(1);
                end
            end
            writes_seen <= writes_seen + 1;
        end
    end

    initial begin
        repeat (3) @(negedge clock);
        resetn = 1;
        for (row=0; row<4; row=row+1)
            for (col=0; col<2; col=col+1)
                send_tile(row,col);
        wait(done);
        @(negedge clock);
        if (writes_seen != out_num) begin
            $error("observed %0d writes expected %0d",writes_seen,out_num);
            $fatal(1);
        end
        $display("PASS: pooled conv stream through memWrite (%0d checked writes, stalls included)",writes_seen);
        $finish;
    end

    initial begin
        #10000;
        $fatal(1,"timeout");
    end
endmodule
