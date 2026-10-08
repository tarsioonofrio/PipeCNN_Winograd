`timescale 1ns/1ps
module tb_pipecnn_memwrite_output;
    localparam int VEC_SIZE = 2;
    localparam int W_VEC_SIZE = 4;
    localparam int LANE_NUM = 4;
    localparam int TOKEN_W = LANE_NUM*W_VEC_SIZE*8;

    logic clock = 0;
    logic resetn = 0;
    logic bypass = 1;
    logic pool_valid = 0;
    logic pool_ready;
    logic [TOKEN_W-1:0] pool_data = '0;
    logic bypass_valid = 0;
    logic bypass_ready;
    logic [TOKEN_W-1:0] bypass_data = '0;
    logic [31:0] out_num = 18;
    logic [7:0] q_vec = 2;
    logic [7:0] rem_size_x = 3;
    logic [7:0] start_size_x = 3;
    logic [7:0] out_dim1_div_q_vec = 2;
    logic next_layer_padding = 1;
    logic [15:0] out_dim1 = 6;
    logic [15:0] out_dim2 = 1;
    logic [31:0] out_dim1xdim2 = 6;
    logic [7:0] scal = 2;
    logic [7:0] scal_rem_z = 1;
    logic [7:0] scalxq_vec = 4;
    logic [7:0] scalxrem_size_x = 6;
    logic [7:0] scalxstart_size_x = 6;
    logic [7:0] scal_rem_zxq_vec = 2;
    logic [7:0] scal_rem_zxrem_size_x = 3;
    logic [7:0] scal_rem_zxstart_size_x = 3;
    logic [31:0] dim_z_edge_num = 12;
    logic out_valid;
    logic out_ready = 1;
    logic [31:0] out_addr;
    logic [15:0] out_data;
    logic done;
    integer cycle_count = 0;
    integer seen = 0;
    integer i;
    logic stalled_q = 0;
    logic [31:0] held_addr_q;
    logic [15:0] held_data_q;

    always #5 clock = ~clock;

    always @(negedge clock) begin
        if (resetn) begin
            out_ready <= ((cycle_count % 4) != 1);
            cycle_count <= cycle_count + 1;
        end
    end

    pipecnn_memwrite_output #(
        .VEC_SIZE(VEC_SIZE), .W_VEC_SIZE(W_VEC_SIZE), .LANE_NUM(LANE_NUM)
    ) dut (
        .clock, .resetn,
        .bypass, .pool_valid, .pool_ready, .pool_data,
        .bypass_valid, .bypass_ready, .bypass_data,
        .out_num, .q_vec, .rem_size_x, .start_size_x,
        .out_dim1_div_q_vec, .next_layer_padding,
        .out_dim1, .out_dim2, .out_dim1xdim2,
        .scal, .scal_rem_z, .scalxq_vec, .scalxrem_size_x,
        .scalxstart_size_x, .scal_rem_zxq_vec,
        .scal_rem_zxrem_size_x, .scal_rem_zxstart_size_x,
        .dim_z_edge_num, .out_valid, .out_ready, .out_addr, .out_data, .done
    );

    function automatic [TOKEN_W-1:0] make_token;
        reg [TOKEN_W-1:0] value;
        integer lane, pos;
        begin
            value = '0;
            for (lane=0; lane<LANE_NUM; lane=lane+1)
                for (pos=0; pos<W_VEC_SIZE; pos=pos+1)
                    value[(lane*W_VEC_SIZE+pos)*8 +: 8] = 8'(lane*16+pos+1);
            make_token = value;
        end
    endfunction

    task automatic send_token;
        begin
            @(negedge clock);
            if (bypass) begin
                bypass_valid = 1;
                bypass_data = make_token();
                while (!bypass_ready) @(negedge clock);
                @(negedge clock);
                bypass_valid = 0;
            end else begin
                pool_valid = 1;
                pool_data = make_token();
                while (!pool_ready) @(negedge clock);
                @(negedge clock);
                pool_valid = 0;
            end
        end
    endtask

    always @(posedge clock) begin : scoreboard
        integer token_group, local_index, x_group, lane_count, width_count;
        integer vector_index, src_index, lane_index, expected_addr;
        reg expected_pad;
        reg [7:0] expected_byte0, expected_byte1;
        if (!resetn) begin
            stalled_q = 0;
        end else begin
            if (stalled_q && (out_addr !== held_addr_q || out_data !== held_data_q)) begin
                $error("memWrite changed address/data while output was stalled");
                $fatal(1);
            end
            stalled_q = out_valid && !out_ready;
            if (stalled_q) begin
                held_addr_q = out_addr;
                held_data_q = out_data;
            end
        end

        if (resetn && out_valid && out_ready) begin
            if (seen < 12) begin
                token_group = seen / 6;
                local_index = seen % 6;
                lane_count = local_index / 3;
                width_count = local_index % 3;
                vector_index = lane_count;
            end else begin
                token_group = 2 + (seen-12)/3;
                local_index = (seen-12)%3;
                lane_count = 0;
                width_count = local_index;
                vector_index = 2;
            end
            x_group = (token_group == 0 || token_group == 2) ? 0 : 1;
            expected_addr = vector_index*6 + x_group*2
                          + ((x_group == 0) ? 0 : 1) + width_count;
            expected_pad = ((x_group == 0 && width_count == 0) ||
                            (x_group == 1 && width_count == 2));

            if (expected_pad) begin
                expected_byte0 = 0;
                expected_byte1 = 0;
            end else begin
                src_index = (x_group == 0) ? width_count-1 : width_count;
                lane_index = lane_count*VEC_SIZE;
                expected_byte0 = 8'(lane_index*16 + src_index + 1);
                expected_byte1 = 8'((lane_index+1)*16 + src_index + 1);
            end

            if (out_addr !== expected_addr[31:0]) begin
                $error("write %0d address got %0d expected %0d", seen, out_addr, expected_addr);
                $fatal(1);
            end
            if (out_data[7:0] !== expected_byte0 || out_data[15:8] !== expected_byte1) begin
                $error("write %0d data got %h expected %h%h", seen, out_data,
                       expected_byte1, expected_byte0);
                $fatal(1);
            end
            seen <= seen + 1;
        end
    end

    initial begin
        repeat (3) @(negedge clock);
        resetn = 1;
        for (i=0; i<4; i=i+1)
            send_token();

        wait(done);
        @(negedge clock);
        if (seen != out_num) begin
            $error("observed %0d writes expected %0d", seen, out_num);
            $fatal(1);
        end
        resetn = 0;
        seen = 0;
        cycle_count = 0;
        repeat (3) @(negedge clock);
        bypass = 0;
        pool_valid = 0;
        bypass_valid = 0;
        resetn = 1;
        for (i=0; i<4; i=i+1)
            send_token();
        wait(done);
        @(negedge clock);
        if (seen != out_num) begin
            $error("pool path observed %0d writes expected %0d", seen, out_num);
            $fatal(1);
        end
        $display("PASS: memWrite routing, output order, padding, residual z group, and stalls (%0d writes per path)", seen);
        $finish;
    end

    initial begin
        #5000;
        $fatal(1, "timeout");
    end
endmodule
