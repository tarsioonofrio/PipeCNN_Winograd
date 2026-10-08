`timescale 1ns/1ps
// Four signed 16x16 products summed with 32-bit wraparound semantics.
module mac4_int16 (
    input  logic signed [15:0] a0,
    input  logic signed [15:0] b0,
    input  logic signed [15:0] a1,
    input  logic signed [15:0] b1,
    input  logic signed [15:0] a2,
    input  logic signed [15:0] b2,
    input  logic signed [15:0] a3,
    input  logic signed [15:0] b3,
    output logic signed [31:0] result
);
    logic signed [31:0] product0;
    logic signed [31:0] product1;
    logic signed [31:0] product2;
    logic signed [31:0] product3;

    always_comb begin
        product0 = a0 * b0;
        product1 = a1 * b1;
        product2 = a2 * b2;
        product3 = a3 * b3;
        result = product0 + product1 + product2 + product3;
    end
endmodule
