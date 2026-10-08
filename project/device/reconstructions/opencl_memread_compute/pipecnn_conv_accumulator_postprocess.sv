`timescale 1ns/1ps
// Source-level reconstruction of conv_out accumulation and the active
// fixed-point/bias/saturation/ReLU sequence in conv_pipe.cl.
module pipecnn_conv_accumulator_postprocess (
    input  logic                    clock,
    input  logic                    resetn,
    input  logic                    in_valid,
    input  logic                    first_term,
    input  logic                    last_term,
    input  logic [32*6*32-1:0]      conv_term,
    input  logic [32*8-1:0]        bias,
    input  logic signed [7:0]       frac_w,
    input  logic signed [7:0]       frac_b,
    input  logic signed [7:0]       frac_din,
    input  logic signed [7:0]       frac_dout,
    input  logic                    relu_enable,
    output logic                    done,
    output logic [32*6*8-1:0]       result
);
    logic signed [31:0] accum [0:31][0:5];
    integer lane, pos;

    function automatic logic signed [7:0] postprocess(
        input logic signed [31:0] acc_value,
        input logic signed [7:0] bias_value,
        input logic signed [7:0] fw,
        input logic signed [7:0] fb,
        input logic signed [7:0] fdin,
        input logic signed [7:0] fdout,
        input logic relu
    );
        integer acc_shift;
        integer bias_delta;
        logic signed [31:0] scaled_acc;
        logic signed [31:0] scaled_bias;
        logic signed [31:0] rounded_sum;
        logic signed [31:0] saturated;
        logic signed [7:0] quantized;
        begin
            acc_shift = int'(fw) + int'(fdin) - int'(fdout) - 1;
            bias_delta = int'(fb) - int'(fdout);
            if (acc_shift >= 0)
                scaled_acc = acc_value >>> acc_shift;
            else
                scaled_acc = acc_value <<< (-acc_shift);

            if (bias_delta > 1)
                scaled_bias = $signed({{24{bias_value[7]}}, bias_value}) >>> (bias_delta - 1);
            else
                scaled_bias = $signed({{24{bias_value[7]}}, bias_value}) <<< (1 - bias_delta);

            rounded_sum = (scaled_acc & 32'hffff_fffe) + scaled_bias + 32'sd1;
            if (rounded_sum >= 32'sd256)
                saturated = 32'sd127;
            else if (rounded_sum < -32'sd256)
                saturated = -32'sd128;
            else
                saturated = rounded_sum >>> 1;

            quantized = saturated[7:0];
            if (relu && quantized[7])
                postprocess = 8'sd0;
            else
                postprocess = quantized;
        end
    endfunction

    always_ff @(posedge clock) begin
        if (!resetn) begin
            done <= 1'b0;
            result <= '0;
            for (lane=0; lane<32; lane=lane+1)
                for (pos=0; pos<6; pos=pos+1)
                    accum[lane][pos] <= '0;
        end else begin
            done <= 1'b0;
            if (in_valid) begin
                for (lane=0; lane<32; lane=lane+1) begin
                    for (pos=0; pos<6; pos=pos+1) begin
                        if (first_term)
                            accum[lane][pos] <= conv_term[(lane*6+pos)*32 +: 32];
                        else
                            accum[lane][pos] <= accum[lane][pos]
                                + $signed(conv_term[(lane*6+pos)*32 +: 32]);

                        if (last_term) begin
                            if (first_term)
                                result[(lane*6+pos)*8 +: 8] <= postprocess(
                                    $signed(conv_term[(lane*6+pos)*32 +: 32]),
                                    $signed(bias[lane*8 +: 8]),
                                    frac_w, frac_b, frac_din, frac_dout, relu_enable);
                            else
                                result[(lane*6+pos)*8 +: 8] <= postprocess(
                                    accum[lane][pos]
                                        + $signed(conv_term[(lane*6+pos)*32 +: 32]),
                                    $signed(bias[lane*8 +: 8]),
                                    frac_w, frac_b, frac_din, frac_dout, relu_enable);
                        end
                    end
                end
                if (last_term)
                    done <= 1'b1;
            end
        end
    end
endmodule
