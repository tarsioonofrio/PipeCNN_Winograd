`timescale 1ns/1ps
// One output-channel tile of four horizontal results. Input samples have
// already been grouped into nine (kernel-row,input-channel) vectors. Filter
// coefficients are pretransformed along x, matching the OpenCL host layout.
module winograd_f43_3x3_tile_core (
    input  logic                     clk,
    input  logic                     rst,
    input  logic                     start,
    input  logic [9*6*16-1:0]        feature_tile,
    input  logic [9*6*16-1:0]        weight_tile,
    output logic                     busy,
    output logic                     done,
    output logic [4*32-1:0]          output_tile
);
    typedef enum logic [1:0] {IDLE, ISSUE_MAC, WAIT_MAC, FINISH} state_t;
    state_t state;
    logic [9*6*16-1:0] feature_q, weight_q;
    logic signed [15:0] transformed_input [0:8][0:5];
    logic signed [31:0] transformed_sum [0:5];
    logic [9*16-1:0] mac_feature_pack, mac_weight_pack;
    logic [2:0] transform_index;
    logic mac_start, mac_busy, mac_done;
    logic signed [31:0] mac_result;
    logic signed [31:0] y0, y1, y2, y3;
    integer comb_i;
    integer seq_i;

    genvar term;
    generate
        for (term=0; term<9; term=term+1) begin : g_input_transform
            winograd_f43_input_transform input_transform (
                .d0(feature_q[(term*6+0)*16 +: 16]),
                .d1(feature_q[(term*6+1)*16 +: 16]),
                .d2(feature_q[(term*6+2)*16 +: 16]),
                .d3(feature_q[(term*6+3)*16 +: 16]),
                .d4(feature_q[(term*6+4)*16 +: 16]),
                .d5(feature_q[(term*6+5)*16 +: 16]),
                .u0(transformed_input[term][0]),
                .u1(transformed_input[term][1]),
                .u2(transformed_input[term][2]),
                .u3(transformed_input[term][3]),
                .u4(transformed_input[term][4]),
                .u5(transformed_input[term][5])
            );
        end
    endgenerate

    always_comb begin
        mac_start = (state == ISSUE_MAC);
        mac_feature_pack = '0;
        mac_weight_pack = '0;
        for (comb_i=0; comb_i<9; comb_i=comb_i+1) begin
            mac_feature_pack[comb_i*16 +: 16] = transformed_input[comb_i][transform_index];
            mac_weight_pack[comb_i*16 +: 16] = weight_q[(comb_i*6+int'(transform_index))*16 +: 16];
        end
    end

    winograd_f43_dot9_mac4 reduce_nine_terms (
        .clk(clk), .rst(rst), .start(mac_start),
        .feature_terms(mac_feature_pack),
        .weight_terms(mac_weight_pack),
        .busy(mac_busy), .done(mac_done), .result(mac_result)
    );

    winograd_f43_output_transform output_transform (
        .m0(transformed_sum[0]), .m1(transformed_sum[1]),
        .m2(transformed_sum[2]), .m3(transformed_sum[3]),
        .m4(transformed_sum[4]), .m5(transformed_sum[5]),
        .y0(y0), .y1(y1), .y2(y2), .y3(y3)
    );

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            busy <= 1'b0;
            done <= 1'b0;
            output_tile <= '0;
            feature_q <= '0;
            weight_q <= '0;
            transform_index <= '0;
            for (seq_i=0; seq_i<6; seq_i=seq_i+1)
                transformed_sum[seq_i] <= '0;
        end else begin
            done <= 1'b0;
            case (state)
                IDLE: begin
                    if (start) begin
                        feature_q <= feature_tile;
                        weight_q <= weight_tile;
                        transform_index <= '0;
                        busy <= 1'b1;
                        state <= ISSUE_MAC;
                    end
                end
                ISSUE_MAC: begin
                    state <= WAIT_MAC;
                end
                WAIT_MAC: begin
                    if (mac_done) begin
                        transformed_sum[transform_index] <= mac_result;
                        if (transform_index == 5)
                            state <= FINISH;
                        else begin
                            transform_index <= transform_index + 1'b1;
                            state <= ISSUE_MAC;
                        end
                    end
                end
                FINISH: begin
                    output_tile[0*32 +: 32] <= y0;
                    output_tile[1*32 +: 32] <= y1;
                    output_tile[2*32 +: 32] <= y2;
                    output_tile[3*32 +: 32] <= y3;
                    busy <= 1'b0;
                    done <= 1'b1;
                    state <= IDLE;
                end
                default: begin
                    state <= IDLE;
                    busy <= 1'b0;
                end
            endcase
        end
    end
endmodule
