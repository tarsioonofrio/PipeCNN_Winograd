`timescale 1ns/1ps
// Controlled ASIC reconstruction of the BT*d equations in conv_pipe.cl.
// Results intentionally truncate to OUT_W bits, matching assignment into
// CONVTYPE in the OpenCL source.
module winograd_f43_input_transform #(
    parameter int IN_W = 16,
    parameter int OUT_W = 16,
    parameter int CALC_W = IN_W + 4
) (
    input  logic signed [IN_W-1:0] d0,
    input  logic signed [IN_W-1:0] d1,
    input  logic signed [IN_W-1:0] d2,
    input  logic signed [IN_W-1:0] d3,
    input  logic signed [IN_W-1:0] d4,
    input  logic signed [IN_W-1:0] d5,
    output logic signed [OUT_W-1:0] u0,
    output logic signed [OUT_W-1:0] u1,
    output logic signed [OUT_W-1:0] u2,
    output logic signed [OUT_W-1:0] u3,
    output logic signed [OUT_W-1:0] u4,
    output logic signed [OUT_W-1:0] u5
);
    logic signed [CALC_W-1:0] x0, x1, x2, x3, x4, x5;
    logic signed [CALC_W-1:0] t0, t1, t2, t3, t4, t5;

    always_comb begin
        x0 = {{(CALC_W-IN_W){d0[IN_W-1]}}, d0};
        x1 = {{(CALC_W-IN_W){d1[IN_W-1]}}, d1};
        x2 = {{(CALC_W-IN_W){d2[IN_W-1]}}, d2};
        x3 = {{(CALC_W-IN_W){d3[IN_W-1]}}, d3};
        x4 = {{(CALC_W-IN_W){d4[IN_W-1]}}, d4};
        x5 = {{(CALC_W-IN_W){d5[IN_W-1]}}, d5};

        t0 = (x0 <<< 2) - (x2 <<< 2) - x2 + x4;
        t1 = -(x1 <<< 2) - (x2 <<< 2) + x3 + x4;
        t2 =  (x1 <<< 2) - (x2 <<< 2) - x3 + x4;
        t3 = -(x1 <<< 1) - x2 + (x3 <<< 1) + x4;
        t4 =  (x1 <<< 1) - x2 - (x3 <<< 1) + x4;
        t5 =  (x1 <<< 2) - (x3 <<< 2) - x3 + x5;

        u0 = t0[OUT_W-1:0];
        u1 = t1[OUT_W-1:0];
        u2 = t2[OUT_W-1:0];
        u3 = t3[OUT_W-1:0];
        u4 = t4[OUT_W-1:0];
        u5 = t5[OUT_W-1:0];
    end
endmodule
