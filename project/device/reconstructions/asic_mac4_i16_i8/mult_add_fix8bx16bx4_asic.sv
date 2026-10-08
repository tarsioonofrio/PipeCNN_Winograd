`timescale 1ns/1ps
// ASIC-compatible behavioral replacement for the original Intel MAC wrapper.
// Keep this experiment separate from rtl_lib.xml until full-kernel RTL is
// recovered and the replacement is integrated deliberately.
module mult_add_fix8bx16bx4 (
    input  logic        clock,
    input  logic        resetn,
    input  logic        ivalid,
    input  logic        iready,
    output logic        ovalid,
    output logic        oready,
    input  logic [15:0] dataa_0,
    input  logic [7:0]  datab_0,
    input  logic [15:0] dataa_1,
    input  logic [7:0]  datab_1,
    input  logic [15:0] dataa_2,
    input  logic [7:0]  datab_2,
    input  logic [15:0] dataa_3,
    input  logic [7:0]  datab_3,
    output logic [31:0] result
);
    logic signed [15:0] a0_q, a1_q, a2_q, a3_q;
    logic signed [7:0]  b0_q, b1_q, b2_q, b3_q;
    logic signed [23:0] p0, p1, p2, p3;
    logic signed [25:0] sum_comb, sum_q;

    // The original wrapper ignores these controls and advertises an
    // always-ready, always-valid, stall-free interface.
    always_comb begin
        ovalid = 1'b1;
        oready = 1'b1;

        p0 = a0_q * b0_q;
        p1 = a1_q * b1_q;
        p2 = a2_q * b2_q;
        p3 = a3_q * b3_q;

        sum_comb = {{2{p0[23]}}, p0}
                 + {{2{p1[23]}}, p1}
                 + {{2{p2[23]}}, p2}
                 + {{2{p3[23]}}, p3};
    end

    // Preserve four simultaneous signed 16x8 products, input registers,
    // output register, and the original two-stage fixed-latency contract.
    // resetn, ivalid, and iready are intentionally ignored like the source IP.
    always_ff @(posedge clock) begin
        a0_q <= $signed(dataa_0);
        b0_q <= $signed(datab_0);
        a1_q <= $signed(dataa_1);
        b1_q <= $signed(datab_1);
        a2_q <= $signed(dataa_2);
        b2_q <= $signed(datab_2);
        a3_q <= $signed(dataa_3);
        b3_q <= $signed(datab_3);
        sum_q <= sum_comb;
    end

    always_comb result = {{6{sum_q[25]}}, sum_q};
endmodule
