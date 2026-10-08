`timescale 1ns/1ps
// Functional reconstruction of the active pool_size=2, pool_stride=2 path
// in conv_pipe.cl. The ASIC ready/valid wrapper is explicit; AOCL timing is
// not claimed. One line of two horizontal maxima per lane is retained.
module pipecnn_pool_2x2 #(
    parameter int LANE_NUM = 32,
    parameter int W_VEC_SIZE = 6,
    parameter int DATA_W = 8,
    parameter int MAX_COLS = 136
) (
    input  logic                              clock,
    input  logic                              resetn,
    input  logic                              in_valid,
    output logic                              in_ready,
    input  logic [LANE_NUM*W_VEC_SIZE*DATA_W-1:0] conv_data,
    input  logic [15:0]                       line_size,
    input  logic [15:0]                       col_size,
    output logic                              out_valid,
    input  logic                              out_ready,
    output logic [LANE_NUM*W_VEC_SIZE*DATA_W-1:0] pool_data
);
    localparam int POOL_VALUES_PER_LANE = W_VEC_SIZE/2-1;
    localparam int POOL_LINE_W = LANE_NUM*POOL_VALUES_PER_LANE*DATA_W;
    localparam int CONV_TOKEN_W = LANE_NUM*W_VEC_SIZE*DATA_W;
    localparam int PTR_W = (MAX_COLS > 1) ? $clog2(MAX_COLS) : 1;

    logic [POOL_LINE_W-1:0] line_buf [0:MAX_COLS-1];
    logic [POOL_LINE_W-1:0] horizontal_max;
    logic [CONV_TOKEN_W-1:0] vertical_max;
    logic [CONV_TOKEN_W-1:0] pool_data_q;
    logic pending_output;
    logic [15:0] line_buf_ptr;
    logic [PTR_W-1:0] line_buf_index;
    logic [15:0] row_cnt;
    logic [15:0] row_pool_cnt;
    integer lane;

    function automatic logic signed [DATA_W-1:0] max_signed(
        input logic signed [DATA_W-1:0] a,
        input logic signed [DATA_W-1:0] b
    );
        max_signed = (a >= b) ? a : b;
    endfunction

    assign line_buf_index = line_buf_ptr[PTR_W-1:0];

    always_comb begin
        horizontal_max = '0;
        vertical_max = '0;
        for (lane=0; lane<LANE_NUM; lane=lane+1) begin
            horizontal_max[(lane*POOL_VALUES_PER_LANE+0)*DATA_W +: DATA_W] =
                max_signed(
                    $signed(conv_data[(lane*W_VEC_SIZE+0)*DATA_W +: DATA_W]),
                    $signed(conv_data[(lane*W_VEC_SIZE+1)*DATA_W +: DATA_W]));
            horizontal_max[(lane*POOL_VALUES_PER_LANE+1)*DATA_W +: DATA_W] =
                max_signed(
                    $signed(conv_data[(lane*W_VEC_SIZE+2)*DATA_W +: DATA_W]),
                    $signed(conv_data[(lane*W_VEC_SIZE+3)*DATA_W +: DATA_W]));

            vertical_max[(lane*W_VEC_SIZE+0)*DATA_W +: DATA_W] =
                max_signed(
                    $signed(line_buf[line_buf_index][(lane*POOL_VALUES_PER_LANE+0)*DATA_W +: DATA_W]),
                    $signed(horizontal_max[(lane*POOL_VALUES_PER_LANE+0)*DATA_W +: DATA_W]));
            vertical_max[(lane*W_VEC_SIZE+1)*DATA_W +: DATA_W] =
                max_signed(
                    $signed(line_buf[line_buf_index][(lane*POOL_VALUES_PER_LANE+1)*DATA_W +: DATA_W]),
                    $signed(horizontal_max[(lane*POOL_VALUES_PER_LANE+1)*DATA_W +: DATA_W]));
        end
    end

    assign in_ready = resetn && !pending_output;
    assign out_valid = resetn && pending_output;
    assign pool_data = pool_data_q;

    always_ff @(posedge clock) begin
        if (!resetn) begin
            pending_output <= 1'b0;
            pool_data_q <= '0;
            line_buf_ptr <= '0;
            row_cnt <= '0;
            row_pool_cnt <= '0;
        end else begin
            if (pending_output && out_ready)
                pending_output <= 1'b0;

            if (in_valid && in_ready) begin
                line_buf[line_buf_index] <= horizontal_max;
                pool_data_q <= vertical_max;
                pending_output <= (row_pool_cnt == 1);

                if (line_buf_ptr == col_size-1'b1) begin
                    line_buf_ptr <= '0;
                    if (row_cnt == line_size-1'b1) begin
                        row_cnt <= '0;
                        row_pool_cnt <= '0;
                    end else begin
                        row_cnt <= row_cnt + 1'b1;
                        if (row_pool_cnt == 1)
                            row_pool_cnt <= '0;
                        else
                            row_pool_cnt <= row_pool_cnt + 1'b1;
                    end
                end else begin
                    line_buf_ptr <= line_buf_ptr + 1'b1;
                end
            end
        end
    end

    initial begin
        if (W_VEC_SIZE != 6)
            $error("pool_2x2 reconstruction expects active W_VEC_SIZE=6");
        if (MAX_COLS < 1)
            $error("MAX_COLS must be positive");
    end
endmodule
