`timescale 1ns/1ps
module tb_pipecnn_pool_2x2;
    localparam int LANES = 2;
    localparam int W = 6;
    localparam int TOKEN_W = LANES*W*8;

    logic clock = 0;
    logic resetn = 0;
    logic in_valid = 0;
    logic in_ready;
    logic [TOKEN_W-1:0] conv_data = '0;
    logic [15:0] line_size = 4;
    logic [15:0] col_size = 2;
    logic out_valid;
    logic out_ready = 1;
    logic [TOKEN_W-1:0] pool_data;
    integer cycle_count = 0;
    integer outputs_seen = 0;
    integer row, col;
    logic stalled_q = 0;
    logic [TOKEN_W-1:0] held_data_q;

    always #5 clock = ~clock;

    always @(negedge clock) begin
        if (resetn) begin
            out_ready <= ((cycle_count % 5) != 2);
            cycle_count <= cycle_count + 1;
        end
    end

    pipecnn_pool_2x2 #(.LANE_NUM(LANES), .W_VEC_SIZE(W), .MAX_COLS(2)) dut (
        .clock, .resetn, .in_valid, .in_ready, .conv_data,
        .line_size, .col_size, .out_valid, .out_ready, .pool_data
    );

    function automatic [TOKEN_W-1:0] make_tile(input integer y, input integer x);
        reg [TOKEN_W-1:0] value;
        integer lane, pos, sample;
        begin
            value = '0;
            for (lane=0; lane<LANES; lane=lane+1)
                for (pos=0; pos<W; pos=pos+1) begin
                    sample = lane*24 + y*7 + x*2 + pos - 30;
                    value[(lane*W+pos)*8 +: 8] = 8'(sample);
                end
            make_tile = value;
        end
    endfunction

    function automatic integer sample_value(
        input integer lane, input integer y, input integer x, input integer pos
    );
        sample_value = lane*24 + y*7 + x*2 + pos - 30;
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
            in_valid = 1;
            while (!in_ready) @(negedge clock);
            @(negedge clock);
            in_valid = 0;
        end
    endtask

    always @(posedge clock) begin : scoreboard
        integer bottom_y, tile_x, lane;
        integer expected0, expected1;
        reg [7:0] byte0, byte1;
        if (!resetn) begin
            stalled_q = 0;
        end else begin
            if (stalled_q && pool_data !== held_data_q) begin
                $error("pool output changed during backpressure");
                $fatal(1);
            end
            stalled_q = out_valid && !out_ready;
            if (stalled_q)
                held_data_q = pool_data;
        end

        if (resetn && out_valid && out_ready) begin
            bottom_y = (outputs_seen / 2)*2 + 1;
            tile_x = outputs_seen % 2;
            for (lane=0; lane<LANES; lane=lane+1) begin
                expected0 = max4(
                    sample_value(lane,bottom_y-1,tile_x,0),
                    sample_value(lane,bottom_y-1,tile_x,1),
                    sample_value(lane,bottom_y,tile_x,0),
                    sample_value(lane,bottom_y,tile_x,1));
                expected1 = max4(
                    sample_value(lane,bottom_y-1,tile_x,2),
                    sample_value(lane,bottom_y-1,tile_x,3),
                    sample_value(lane,bottom_y,tile_x,2),
                    sample_value(lane,bottom_y,tile_x,3));
                byte0 = 8'(expected0);
                byte1 = 8'(expected1);
                if (pool_data[(lane*W+0)*8 +: 8] !== byte0 ||
                    pool_data[(lane*W+1)*8 +: 8] !== byte1) begin
                    $error("pool token %0d lane %0d got %h/%h expected %h/%h",
                           outputs_seen,lane,
                           pool_data[(lane*W+0)*8 +: 8], pool_data[(lane*W+1)*8 +: 8],
                           byte0,byte1);
                    $fatal(1);
                end
                if (pool_data[(lane*W+2)*8 +: 32] !== 32'b0) begin
                    $error("pool token %0d lane %0d nonzero unused output bytes",outputs_seen,lane);
                    $fatal(1);
                end
            end
            outputs_seen <= outputs_seen + 1;
        end
    end

    initial begin
        repeat (3) @(negedge clock);
        resetn = 1;
        for (row=0; row<4; row=row+1)
            for (col=0; col<2; col=col+1)
                send_tile(row,col);
        wait(outputs_seen == 4);
        @(negedge clock);
        $display("PASS: signed 2x2 pooling, line-buffer reuse, stride-2 rows, and stalls (%0d tokens)", outputs_seen);
        $finish;
    end

    initial begin
        #5000;
        $fatal(1,"timeout");
    end
endmodule
