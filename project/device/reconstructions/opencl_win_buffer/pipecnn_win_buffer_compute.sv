`timescale 1ns/1ps
// Connects the source-level three-slot feature buffer to the existing
// memRead arithmetic slice. The six-vector tile is transposed from the
// OpenCL wvec-major layout into the compute module's input-channel-major
// layout. The logical weight buffer supplies the selected word for each
// accepted input. The caller provides its load enable/address; AOCL scheduling
// is unknown.
module pipecnn_win_buffer_compute #(
    parameter int VEC_SIZE = 16,
    parameter int DATA_W = 8,
    parameter int MAX_WIN_SIZE = 96,
    parameter int INDEX_W = 16
) (
    input  logic                         clock,
    input  logic                         resetn,
    input  logic                         word_valid,
    output logic                         word_ready,
    input  logic [INDEX_W-1:0]           win_size,
    input  logic [INDEX_W-1:0]           word_index,
    input  logic                         gp_num_x_is_one,
    input  logic [7:0]                   weight_dim1,
    input  logic [7:0]                   conv_row_rem,
    input  logic [4*VEC_SIZE*DATA_W-1:0] input_word,
    input  logic                         fc_en,
    input  logic                         weight_load_en,
    input  logic [INDEX_W-1:0]           weight_load_index,
    input  logic [32*16*6*8-1:0]         weight_word,
    input  logic                         first_term,
    input  logic                         last_term,
    input  logic [32*8-1:0]              bias,
    input  logic signed [7:0]            frac_w,
    input  logic signed [7:0]            frac_b,
    input  logic signed [7:0]            frac_din,
    input  logic signed [7:0]            frac_dout,
    input  logic                         relu_enable,
    output logic                         result_valid,
    output logic [32*6*8-1:0]            result
);
    logic tile_valid;
    logic [6*VEC_SIZE*DATA_W-1:0] tile_data;
    logic [VEC_SIZE*6*DATA_W-1:0] feature_window;
    logic [32*16*6*8-1:0] weights_q;
    logic [32*16*6*8-1:0] selected_weights;
    logic fc_en_q, first_term_q, last_term_q, relu_enable_q;
    logic [32*8-1:0] bias_q;
    logic signed [7:0] frac_w_q, frac_b_q, frac_din_q, frac_dout_q;
    integer channel, position;

    pipecnn_win_buffer3 #(
        .VEC_SIZE(VEC_SIZE), .DATA_W(DATA_W),
        .MAX_WIN_SIZE(MAX_WIN_SIZE), .INDEX_W(INDEX_W)
    ) winbuf (
        .clock, .resetn,
        .in_valid(word_valid), .in_ready(word_ready),
        .win_size, .word_index, .gp_num_x_is_one,
        .weight_dim1, .conv_row_rem, .input_word,
        .tile_valid, .tile_ready(1'b1), .tile_data
    );

    pipecnn_weight_buffer #(
        .WORD_W(32*16*6*8), .DEPTH(MAX_WIN_SIZE), .INDEX_W(INDEX_W)
    ) weightbuf (
        .clock, .resetn,
        .load_valid(word_valid && word_ready && weight_load_en),
        .load_index(weight_load_index), .load_data(weight_word),
        .read_index(word_index), .read_data(selected_weights)
    );

    always_comb begin
        feature_window = '0;
        for (channel=0; channel<VEC_SIZE; channel=channel+1)
            for (position=0; position<6; position=position+1)
                feature_window[(channel*6+position)*DATA_W +: DATA_W] =
                    tile_data[(position*VEC_SIZE+channel)*DATA_W +: DATA_W];
    end

    always_ff @(posedge clock) begin
        if (!resetn) begin
            fc_en_q <= 1'b0;
            first_term_q <= 1'b0;
            last_term_q <= 1'b0;
            relu_enable_q <= 1'b0;
            bias_q <= '0;
            frac_w_q <= '0;
            frac_b_q <= '0;
            frac_din_q <= '0;
            frac_dout_q <= '0;
        end else if (word_valid && word_ready) begin
            weights_q <= selected_weights;
            fc_en_q <= fc_en;
            first_term_q <= first_term;
            last_term_q <= last_term;
            relu_enable_q <= relu_enable;
            bias_q <= bias;
            frac_w_q <= frac_w;
            frac_b_q <= frac_b;
            frac_din_q <= frac_din;
            frac_dout_q <= frac_dout;
        end
    end

    pipecnn_memread_conv_slice compute (
        .clock, .resetn,
        .in_valid(tile_valid), .first_term(first_term_q),
        .last_term(last_term_q), .fc_en(fc_en_q),
        .feature_window, .transformed_weights(weights_q), .bias(bias_q),
        .frac_w(frac_w_q), .frac_b(frac_b_q),
        .frac_din(frac_din_q), .frac_dout(frac_dout_q),
        .relu_enable(relu_enable_q), .done(result_valid), .result
    );
endmodule
