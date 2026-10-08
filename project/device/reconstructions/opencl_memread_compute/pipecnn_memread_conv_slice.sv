`timescale 1ns/1ps
// Arithmetic CORE slice: one memRead vector iteration through Winograd MAC,
// conv_out accumulation, fixed-point conversion, bias, saturation and ReLU.
// Memory access, pooling and AOCL kernel wrappers remain outside this module.
module pipecnn_memread_conv_slice (
    input  logic                    clock,
    input  logic                    resetn,
    input  logic                    in_valid,
    input  logic                    first_term,
    input  logic                    last_term,
    input  logic                    fc_en,
    input  logic [16*6*8-1:0]       feature_window,
    input  logic [32*16*6*8-1:0]    transformed_weights,
    input  logic [32*8-1:0]        bias,
    input  logic signed [7:0]       frac_w,
    input  logic signed [7:0]       frac_b,
    input  logic signed [7:0]       frac_din,
    input  logic signed [7:0]       frac_dout,
    input  logic                    relu_enable,
    output logic                    done,
    output logic [32*6*8-1:0]       result
);
    logic compute_valid;
    logic [32*6*32-1:0] compute_result;
    logic [1:0] first_pipe, last_pipe, relu_pipe;
    logic [1:0][32*8-1:0] bias_pipe;
    logic signed [7:0] fw_pipe [0:1], fb_pipe [0:1];
    logic signed [7:0] fdin_pipe [0:1], fdout_pipe [0:1];

    pipecnn_memread_compute compute (
        .clock(clock), .resetn(resetn), .ivalid(in_valid), .fc_en(fc_en),
        .feature_window(feature_window),
        .transformed_weights(transformed_weights),
        .ovalid(compute_valid), .result(compute_result)
    );

    always_ff @(posedge clock) begin
        if (!resetn) begin
            first_pipe <= '0;
            last_pipe <= '0;
            relu_pipe <= '0;
            bias_pipe <= '0;
            fw_pipe[0] <= '0; fw_pipe[1] <= '0;
            fb_pipe[0] <= '0; fb_pipe[1] <= '0;
            fdin_pipe[0] <= '0; fdin_pipe[1] <= '0;
            fdout_pipe[0] <= '0; fdout_pipe[1] <= '0;
        end else begin
            first_pipe <= {first_pipe[0], first_term};
            last_pipe <= {last_pipe[0], last_term};
            relu_pipe <= {relu_pipe[0], relu_enable};
            bias_pipe[0] <= bias;
            bias_pipe[1] <= bias_pipe[0];
            fw_pipe[0] <= frac_w; fw_pipe[1] <= fw_pipe[0];
            fb_pipe[0] <= frac_b; fb_pipe[1] <= fb_pipe[0];
            fdin_pipe[0] <= frac_din; fdin_pipe[1] <= fdin_pipe[0];
            fdout_pipe[0] <= frac_dout; fdout_pipe[1] <= fdout_pipe[0];
        end
    end

    pipecnn_conv_accumulator_postprocess accumulator (
        .clock(clock), .resetn(resetn), .in_valid(compute_valid),
        .first_term(first_pipe[1]), .last_term(last_pipe[1]),
        .conv_term(compute_result), .bias(bias_pipe[1]),
        .frac_w(fw_pipe[1]), .frac_b(fb_pipe[1]),
        .frac_din(fdin_pipe[1]), .frac_dout(fdout_pipe[1]),
        .relu_enable(relu_pipe[1]), .done(done), .result(result)
    );
endmodule
