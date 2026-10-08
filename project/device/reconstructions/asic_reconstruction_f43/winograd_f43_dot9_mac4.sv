`timescale 1ns/1ps
// Four-product reduction for the 3 input-channel x 3 vertical-tap terms at
// one F(4,3) transform position. The feature/weight values are the 16-bit
// transformed coefficients supplied by the surrounding reconstruction.
module winograd_f43_dot9_mac4 (
    input  logic                    clk,
    input  logic                    rst,
    input  logic                    start,
    input  logic [9*16-1:0]         feature_terms,
    input  logic [9*16-1:0]         weight_terms,
    output logic                    busy,
    output logic                    done,
    output logic signed [31:0]      result
);
    logic signed [15:0] feature_q [0:8];
    logic signed [15:0] weight_q [0:8];
    logic signed [15:0] lane_feature [0:3];
    logic signed [15:0] lane_weight [0:3];
    logic signed [31:0] mac_sum;
    logic signed [31:0] accumulator;
    logic [1:0] group_index;
    integer lane;
    integer term_index;

    mac4_int16 mac (
        .a0(lane_feature[0]), .b0(lane_weight[0]),
        .a1(lane_feature[1]), .b1(lane_weight[1]),
        .a2(lane_feature[2]), .b2(lane_weight[2]),
        .a3(lane_feature[3]), .b3(lane_weight[3]),
        .result(mac_sum)
    );

    always_comb begin
        for (lane=0; lane<4; lane=lane+1) begin
            term_index = group_index*4 + lane;
            if (term_index < 9) begin
                lane_feature[lane] = feature_q[term_index];
                lane_weight[lane] = weight_q[term_index];
            end else begin
                lane_feature[lane] = '0;
                lane_weight[lane] = '0;
            end
        end
    end

    integer i;
    always_ff @(posedge clk) begin
        if (rst) begin
            busy <= 1'b0;
            done <= 1'b0;
            result <= '0;
            accumulator <= '0;
            group_index <= '0;
            for (i=0; i<9; i=i+1) begin
                feature_q[i] <= '0;
                weight_q[i] <= '0;
            end
        end else begin
            done <= 1'b0;
            if (!busy && start) begin
                for (i=0; i<9; i=i+1) begin
                    feature_q[i] <= feature_terms[i*16 +: 16];
                    weight_q[i] <= weight_terms[i*16 +: 16];
                end
                accumulator <= '0;
                group_index <= '0;
                busy <= 1'b1;
            end else if (busy) begin
                if (group_index == 2) begin
                    result <= accumulator + mac_sum;
                    busy <= 1'b0;
                    done <= 1'b1;
                end else begin
                    accumulator <= accumulator + mac_sum;
                    group_index <= group_index + 1'b1;
                end
            end
        end
    end
endmodule
