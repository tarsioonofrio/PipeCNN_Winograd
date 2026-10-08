`timescale 1ns/1ps
// Functional SYSTEM path for the active pooling route:
// memRead convolution token -> line-buffer pooling -> pool_ch -> memWrite.
// Handshake timing is this ASIC reconstruction's contract, not AOCL timing.
module pipecnn_pool_memwrite_system #(
    parameter int VEC_SIZE = 16,
    parameter int W_VEC_SIZE = 6,
    parameter int LANE_NUM = 32,
    parameter int DATA_W = 8,
    parameter int DIM_W = 16,
    parameter int MAX_COLS = 136
) (
    input  logic                         clock,
    input  logic                         resetn,

    input  logic                         conv_valid,
    output logic                         conv_ready,
    input  logic [LANE_NUM*W_VEC_SIZE*DATA_W-1:0] conv_data,
    input  logic [15:0]                  line_size,
    input  logic [15:0]                  col_size,

    input  logic [31:0]                  out_num,
    input  logic [7:0]                   q_vec,
    input  logic [7:0]                   rem_size_x,
    input  logic [7:0]                   start_size_x,
    input  logic [7:0]                   out_dim1_div_q_vec,
    input  logic                         next_layer_padding,
    input  logic [DIM_W-1:0]             out_dim1,
    input  logic [DIM_W-1:0]             out_dim2,
    input  logic [31:0]                  out_dim1xdim2,
    input  logic [7:0]                   scal,
    input  logic [7:0]                   scal_rem_z,
    input  logic [7:0]                   scalxq_vec,
    input  logic [7:0]                   scalxrem_size_x,
    input  logic [7:0]                   scalxstart_size_x,
    input  logic [7:0]                   scal_rem_zxq_vec,
    input  logic [7:0]                   scal_rem_zxrem_size_x,
    input  logic [7:0]                   scal_rem_zxstart_size_x,
    input  logic [31:0]                  dim_z_edge_num,

    output logic                         write_valid,
    input  logic                         write_ready,
    output logic [31:0]                  write_addr,
    output logic [VEC_SIZE*DATA_W-1:0]   write_data,
    output logic                         done
);
    logic pool_valid;
    logic pool_ready;
    logic [LANE_NUM*W_VEC_SIZE*DATA_W-1:0] pool_data;
    logic unused_bypass_ready;

    pipecnn_pool_2x2 #(
        .LANE_NUM(LANE_NUM), .W_VEC_SIZE(W_VEC_SIZE),
        .DATA_W(DATA_W), .MAX_COLS(MAX_COLS)
    ) pool (
        .clock, .resetn,
        .in_valid(conv_valid), .in_ready(conv_ready), .conv_data,
        .line_size, .col_size,
        .out_valid(pool_valid), .out_ready(pool_ready), .pool_data
    );

    pipecnn_memwrite_output #(
        .VEC_SIZE(VEC_SIZE), .W_VEC_SIZE(W_VEC_SIZE),
        .LANE_NUM(LANE_NUM), .DATA_W(DATA_W), .DIM_W(DIM_W)
    ) memwrite (
        .clock, .resetn,
        .bypass(1'b0),
        .pool_valid, .pool_ready, .pool_data,
        .bypass_valid(1'b0), .bypass_ready(unused_bypass_ready),
        .bypass_data('0),
        .out_num, .q_vec, .rem_size_x, .start_size_x,
        .out_dim1_div_q_vec, .next_layer_padding,
        .out_dim1, .out_dim2, .out_dim1xdim2,
        .scal, .scal_rem_z, .scalxq_vec, .scalxrem_size_x,
        .scalxstart_size_x, .scal_rem_zxq_vec,
        .scal_rem_zxrem_size_x, .scal_rem_zxstart_size_x,
        .dim_z_edge_num,
        .out_valid(write_valid), .out_ready(write_ready),
        .out_addr(write_addr), .out_data(write_data), .done
    );
endmodule
