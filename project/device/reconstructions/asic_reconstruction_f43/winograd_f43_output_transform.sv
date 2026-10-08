`timescale 1ns/1ps
// Controlled ASIC reconstruction of the A^T*m equations in conv_pipe.cl.
// The OpenCL source stores these outputs as MACTYPE, normally signed 32-bit.
module winograd_f43_output_transform #(
    parameter int IN_W = 32,
    parameter int OUT_W = 32,
    parameter int CALC_W = IN_W + 5
) (
    input  logic signed [IN_W-1:0] m0,
    input  logic signed [IN_W-1:0] m1,
    input  logic signed [IN_W-1:0] m2,
    input  logic signed [IN_W-1:0] m3,
    input  logic signed [IN_W-1:0] m4,
    input  logic signed [IN_W-1:0] m5,
    output logic signed [OUT_W-1:0] y0,
    output logic signed [OUT_W-1:0] y1,
    output logic signed [OUT_W-1:0] y2,
    output logic signed [OUT_W-1:0] y3
);
    logic signed [CALC_W-1:0] x0, x1, x2, x3, x4, x5;
    logic signed [CALC_W-1:0] t0, t1, t2, t3;

    always_comb begin
        x0 = {{(CALC_W-IN_W){m0[IN_W-1]}}, m0};
        x1 = {{(CALC_W-IN_W){m1[IN_W-1]}}, m1};
        x2 = {{(CALC_W-IN_W){m2[IN_W-1]}}, m2};
        x3 = {{(CALC_W-IN_W){m3[IN_W-1]}}, m3};
        x4 = {{(CALC_W-IN_W){m4[IN_W-1]}}, m4};
        x5 = {{(CALC_W-IN_W){m5[IN_W-1]}}, m5};

        t0 = x0 + x1 + x2 + x3 + x4;
        t1 = x1 - x2 + (x3 <<< 1) - (x4 <<< 1);
        t2 = x1 + x2 + (x3 <<< 2) + (x4 <<< 2);
        t3 = x1 - x2 + (x3 <<< 3) - (x4 <<< 3) + x5;

        y0 = t0[OUT_W-1:0];
        y1 = t1[OUT_W-1:0];
        y2 = t2[OUT_W-1:0];
        y3 = t3[OUT_W-1:0];
    end
endmodule
