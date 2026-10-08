`timescale 1ns/1ps
module tb_pipecnn_win_buffer3;
    localparam int VEC = 2;
    localparam int WIN = 2;
    localparam int TOKEN_W = 4*VEC*8;
    localparam int TILE_W = 6*VEC*8;

    logic clock=0, resetn=0;
    logic in_valid=0, in_ready;
    logic [1:0] win_size=2'(WIN), word_index=0;
    logic gp_num_x_is_one=0;
    logic [7:0] weight_dim1=3, conv_row_rem=1;
    logic [TOKEN_W-1:0] input_word='0;
    logic tile_valid, tile_ready=1;
    logic [TILE_W-1:0] tile_data;
    integer cycle_count=0, outputs_seen=0, group, index;
    logic stalled_q=0;
    logic [TILE_W-1:0] held_tile_q;

    always #5 clock=~clock;
    always @(negedge clock) begin
        if (resetn) begin
            tile_ready <= ((cycle_count%4)!=1);
            cycle_count <= cycle_count+1;
        end
    end

    pipecnn_win_buffer3 #(.VEC_SIZE(VEC), .MAX_WIN_SIZE(WIN), .INDEX_W(2)) dut (
        .clock,.resetn,.in_valid,.in_ready,.win_size,.word_index,
        .gp_num_x_is_one,.weight_dim1,.conv_row_rem,.input_word,
        .tile_valid,.tile_ready,.tile_data
    );

    function automatic [TOKEN_W-1:0] make_word(input integer g,input integer idx);
        reg [TOKEN_W-1:0] value;
        integer vector_index, lane;
        begin
            value='0;
            for (vector_index=0;vector_index<4;vector_index=vector_index+1)
                for (lane=0;lane<VEC;lane=lane+1)
                    value[(vector_index*VEC+lane)*8 +: 8]
                        = 8'(g*20+idx*8+vector_index*2+lane+1);
            make_word=value;
        end
    endfunction

    function automatic integer byte_value(input integer g,input integer idx,
                                           input integer vector_index,input integer lane);
        byte_value=g*20+idx*8+vector_index*2+lane+1;
    endfunction

    task automatic send_word(input integer g,input integer idx);
        begin
            @(negedge clock);
            word_index=2'(idx);
            // Synthetic sequence: the last two boundary cases assert the
            // source condition gp_num_x==1; this test has no group counter.
            gp_num_x_is_one=(g>=3);
            if (g==3) conv_row_rem=3;
            else if (g==4) conv_row_rem=0;
            else conv_row_rem=1;
            input_word=make_word(g,idx);
            in_valid=1;
            while (!in_ready) @(negedge clock);
            @(negedge clock);
            in_valid=0;
        end
    endtask

    always @(posedge clock) begin : scoreboard
        integer output_group, word_idx, vector_index, lane, expected;
        reg [7:0] expected_byte;
        if (!resetn) begin
            stalled_q=0;
        end else begin
            if (stalled_q && tile_data !== held_tile_q) begin
                $error("window tile changed under backpressure");
                $fatal(1);
            end
            stalled_q=tile_valid && !tile_ready;
            if (stalled_q) held_tile_q=tile_data;
        end

        if (resetn && tile_valid && tile_ready) begin
            output_group=2+outputs_seen/WIN;
            word_idx=outputs_seen%WIN;
            for (vector_index=0;vector_index<6;vector_index=vector_index+1)
                for (lane=0;lane<VEC;lane=lane+1) begin
                    if (vector_index<4)
                        expected=byte_value(output_group-2,word_idx,vector_index,lane);
                    else
                        expected=byte_value(output_group-1,word_idx,vector_index-4,lane);
                    if (output_group==3 && vector_index>=3)
                        expected=0;
                    else if (output_group==4 && vector_index>=4)
                        expected=0;
                    expected_byte=8'(expected);
                    if (tile_data[(vector_index*VEC+lane)*8 +: 8] !== expected_byte) begin
                        $error("tile %0d vector %0d lane %0d got %h expected %h",
                               outputs_seen,vector_index,lane,
                               tile_data[(vector_index*VEC+lane)*8 +: 8],expected_byte);
                        $fatal(1);
                    end
                end
            outputs_seen<=outputs_seen+1;
        end
    end

    initial begin
        repeat (3) @(negedge clock);
        resetn=1;
        for (group=0;group<5;group=group+1)
            for (index=0;index<WIN;index=index+1)
                send_word(group,index);
        wait(outputs_seen==6);
        @(negedge clock);
        $display("PASS: three-slot schedule, two-group warm-up, read ordering, tail masks, and stalls (%0d tiles)",outputs_seen);
        $finish;
    end

    initial begin
        #5000;
        $fatal(1,"timeout");
    end
endmodule
