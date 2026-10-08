`timescale 1ns/1ps
// Connects source-level memRead counters, feature/weight buffers, layout
// transpose and arithmetic. Feature and global weight words are supplied by
// the caller for the exposed logical addresses; external memory latency and
// AOCL scheduling are outside this reconstruction.
module pipecnn_memread_buffered_compute #(
    parameter int VEC_SIZE = 16,
    parameter int MAX_WIN_SIZE = 96,
    parameter int INDEX_W = 32,
    parameter int COUNTER_W = 16,
    parameter int CONV_GP_SIZE_Y = 1
) (
    input  logic                         clock,
    input  logic                         resetn,
    input  logic                         word_valid,
    output logic                         word_ready,
    input  logic [COUNTER_W-1:0]         win_size,
    input  logic [COUNTER_W-1:0]         win_size_y,
    input  logic [COUNTER_W-1:0]         weight_dim3,
    input  logic [COUNTER_W-1:0]         weight_dim4_div_lane,
    input  logic [COUNTER_W-1:0]         group_num_x,
    input  logic [COUNTER_W-1:0]         group_num_y,
    input  logic [7:0]                   group_size_x,
    input  logic [7:0]                   stride,
    input  logic [7:0]                   weight_dim1,
    input  logic [7:0]                   conv_row_rem,
    input  logic [COUNTER_W-1:0]         data_dim1,
    input  logic [COUNTER_W-1:0]         data_dim2,
    input  logic [31:0]                  data_dim1xdim2,
    input  logic [7:0]                   padding,
    input  logic [INDEX_W-1:0]           conv_loop_cnt,
    input  logic [INDEX_W-1:0]           group_num_mul_win_size,
    input  logic [4*VEC_SIZE*8-1:0]      bottom_word,
    input  logic                         fc_en,
    input  logic [32*16*6*8-1:0]         weight_word,
    input  logic [32*8-1:0]              bias_word,
    input  logic signed [7:0]            frac_w,
    input  logic signed [7:0]            frac_b,
    input  logic signed [7:0]            frac_din,
    input  logic signed [7:0]            frac_dout,
    input  logic                         relu_enable,
    output logic                         result_valid,
    output logic [32*6*8-1:0]            result,
    output logic [COUNTER_W-1:0]         gp_num_x,
    output logic [COUNTER_W-1:0]         gp_num_y,
    output logic [COUNTER_W-1:0]         out_idx_z,
    output logic [COUNTER_W-1:0]         win_itm_xyz,
    output logic [1:0]                   flag,
    output logic                         read8_flag,
    output logic [INDEX_W-1:0]           conv_z_cnt,
    output logic [INDEX_W-1:0]           iteration_index,
    output logic                         done,
    output logic [31:0]                  weight_global_address,
    output logic [31:0]                  bottom_read_address,
    output logic                         bottom_zero_fill,
    output logic [COUNTER_W-1:0]         feature_x,
    output logic [COUNTER_W-1:0]         feature_y,
    output logic [COUNTER_W-1:0]         feature_z
);
    logic gp_num_x_is_one, weight_load_en;
    logic first_term, last_term;
    logic [4*VEC_SIZE*8-1:0] input_word;
    logic buffer_word_ready, step_valid;
    logic [COUNTER_W-1:0] weight_load_index, win_itm_y, win_itm_z;

    pipecnn_memread_counters #(
        .INDEX_W(INDEX_W), .COUNTER_W(COUNTER_W),
        .CONV_GP_SIZE_Y(CONV_GP_SIZE_Y), .VEC_SIZE(VEC_SIZE)
    ) counters (
        .clock, .resetn, .step(step_valid),
        .win_size, .win_size_y, .weight_dim3, .weight_dim4_div_lane,
        .group_num_x, .group_num_y, .group_size_x, .stride,
        .weight_dim1, .conv_row_rem, .conv_loop_cnt,
        .group_num_mul_win_size,
        .gp_num_x, .gp_num_y, .out_idx_z, .win_itm_xyz,
        .win_itm_y, .win_itm_z, .flag, .read8_flag, .conv_z_cnt,
        .iteration_index, .done, .gp_num_x_is_one, .weight_load_en,
        .weight_load_index, .weight_global_address,
        .feature_x, .feature_y, .feature_z
    );

    pipecnn_memread_address #(.DIM_W(COUNTER_W)) address (
        .feature_x, .feature_y, .feature_z,
        .data_dim1, .data_dim2, .data_dim1xdim2, .padding,
        .rd_prt(bottom_read_address), .zero_fill(bottom_zero_fill)
    );
    assign input_word = bottom_zero_fill ? '0 : bottom_word;

    assign word_ready = buffer_word_ready && !done;
    assign step_valid = word_valid && word_ready;
    assign first_term = (conv_z_cnt == 0);
    assign last_term = (conv_z_cnt == conv_loop_cnt - 1'b1);

    pipecnn_win_buffer_compute #(
        .VEC_SIZE(VEC_SIZE), .DATA_W(8), .MAX_WIN_SIZE(MAX_WIN_SIZE),
        .INDEX_W(COUNTER_W)
    ) buffer_compute (
        .clock, .resetn, .word_valid(word_valid && !done),
        .word_ready(buffer_word_ready),
        .win_size, .word_index(win_itm_xyz), .gp_num_x_is_one,
        .weight_dim1, .conv_row_rem, .input_word, .fc_en,
        .weight_load_en, .weight_load_index, .weight_word,
        .first_term, .last_term, .bias(bias_word),
        .frac_w, .frac_b, .frac_din, .frac_dout, .relu_enable,
        .result_valid, .result
    );
endmodule
