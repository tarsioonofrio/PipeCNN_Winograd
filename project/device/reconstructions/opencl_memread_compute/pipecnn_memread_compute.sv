`timescale 1ns/1ps
// Source-level reconstruction of the active VEC_SIZE=16 compute slice in
// conv_pipe.cl. This is not the AOCL-generated kernel RTL.
module pipecnn_memread_compute (
    input  logic                    clock,
    input  logic                    resetn,
    input  logic                    ivalid,
    input  logic                    fc_en,
    input  logic [16*6*8-1:0]       feature_window,
    input  logic [32*16*6*8-1:0]    transformed_weights,
    output logic                    ovalid,
    output logic [32*6*32-1:0]      result
);
    logic signed [15:0] feature_transformed [0:15][0:5];
    logic signed [15:0] feature_selected [0:15][0:5];
    logic signed [31:0] mac_group [0:30][0:5][0:3];
    logic signed [31:0] mac_result [0:31][0:5];
    logic signed [31:0] winograd_result [0:31][0:3];
    logic signed [31:0] direct_sum_comb [0:5];
    logic signed [31:0] direct_sum_q0 [0:5];
    logic signed [31:0] direct_sum_q1 [0:5];
    logic [1:0] valid_pipe;
    logic [1:0] fc_pipe;

    genvar input_channel;
    generate
        for (input_channel=0; input_channel<16; input_channel=input_channel+1) begin : g_input_transform
            logic signed [7:0] d [0:5];
            logic signed [15:0] d_ext [0:5];
            assign d[0] = feature_window[(input_channel*6+0)*8 +: 8];
            assign d[1] = feature_window[(input_channel*6+1)*8 +: 8];
            assign d[2] = feature_window[(input_channel*6+2)*8 +: 8];
            assign d[3] = feature_window[(input_channel*6+3)*8 +: 8];
            assign d[4] = feature_window[(input_channel*6+4)*8 +: 8];
            assign d[5] = feature_window[(input_channel*6+5)*8 +: 8];
            for (genvar p=0; p<6; p=p+1) begin : g_sign_extend
                assign d_ext[p] = {{8{d[p][7]}}, d[p]};
            end

            winograd_f43_input_transform #(
                .IN_W(16), .OUT_W(16), .CALC_W(20)
            ) input_transform (
                .d0(d_ext[0]), .d1(d_ext[1]), .d2(d_ext[2]),
                .d3(d_ext[3]), .d4(d_ext[4]), .d5(d_ext[5]),
                .u0(feature_transformed[input_channel][0]),
                .u1(feature_transformed[input_channel][1]),
                .u2(feature_transformed[input_channel][2]),
                .u3(feature_transformed[input_channel][3]),
                .u4(feature_transformed[input_channel][4]),
                .u5(feature_transformed[input_channel][5])
            );

            for (genvar n=0; n<6; n=n+1) begin : g_fc_input_mux
                assign feature_selected[input_channel][n] = fc_en
                    ? d_ext[n] : feature_transformed[input_channel][n];
            end
        end
    endgenerate

    // The OpenCL unrolls ll, n, and the four 4-product calls. Under the active
    // DSP-budget branch lanes 0..30 use four registered MACs per position.
    // Lane 31 uses the explicit 16-product expression from the source.
    generate
        for (genvar lane=0; lane<32; lane=lane+1) begin : g_output_lane
            for (genvar n=0; n<6; n=n+1) begin : g_transform_position
                if (lane < 31) begin : g_custom_mac_lane
                    for (genvar group=0; group<4; group=group+1) begin : g_four_product_group
                        mult_add_fix8bx16bx4 mac4 (
                            .clock(clock), .resetn(resetn),
                            .ivalid(ivalid), .iready(1'b1),
                            .ovalid(), .oready(),
                            .dataa_0(feature_selected[group*4+0][n]),
                            .datab_0(transformed_weights[((lane*16+group*4+0)*6+n)*8 +: 8]),
                            .dataa_1(feature_selected[group*4+1][n]),
                            .datab_1(transformed_weights[((lane*16+group*4+1)*6+n)*8 +: 8]),
                            .dataa_2(feature_selected[group*4+2][n]),
                            .datab_2(transformed_weights[((lane*16+group*4+2)*6+n)*8 +: 8]),
                            .dataa_3(feature_selected[group*4+3][n]),
                            .datab_3(transformed_weights[((lane*16+group*4+3)*6+n)*8 +: 8]),
                            .result(mac_group[lane][n][group])
                        );
                    end
                    assign mac_result[lane][n] = mac_group[lane][n][0]
                        + mac_group[lane][n][1]
                        + mac_group[lane][n][2]
                        + mac_group[lane][n][3];
                end else begin : g_opencl_direct_lane
                    logic signed [31:0] product [0:15];
                    for (genvar term=0; term<16; term=term+1) begin : g_product
                        wire signed [31:0] feature_ext = {{16{feature_selected[term][n][15]}}, feature_selected[term][n]};
                        wire signed [7:0] weight = transformed_weights[((lane*16+term)*6+n)*8 +: 8];
                        wire signed [31:0] weight_ext = {{24{weight[7]}}, weight};
                        assign product[term] = feature_ext * weight_ext;
                    end
                    assign direct_sum_comb[n] = product[0] + product[1]
                        + product[2] + product[3] + product[4] + product[5]
                        + product[6] + product[7] + product[8] + product[9]
                        + product[10] + product[11] + product[12] + product[13]
                        + product[14] + product[15];
                    assign mac_result[lane][n] = direct_sum_q1[n];
                end
            end

            winograd_f43_output_transform output_transform (
                .m0(mac_result[lane][0]), .m1(mac_result[lane][1]),
                .m2(mac_result[lane][2]), .m3(mac_result[lane][3]),
                .m4(mac_result[lane][4]), .m5(mac_result[lane][5]),
                .y0(winograd_result[lane][0]), .y1(winograd_result[lane][1]),
                .y2(winograd_result[lane][2]), .y3(winograd_result[lane][3])
            );
        end
    endgenerate

    integer l, p;
    integer q;
    always_ff @(posedge clock) begin
        if (!resetn) begin
            for (q=0; q<6; q=q+1) begin
                direct_sum_q0[q] <= '0;
                direct_sum_q1[q] <= '0;
            end
        end else begin
            for (q=0; q<6; q=q+1) begin
                // The explicit lane-31 multiply branch is latency-balanced
                // to the two registered stages of the custom MAC lanes.
                direct_sum_q0[q] <= direct_sum_comb[q];
                direct_sum_q1[q] <= direct_sum_q0[q];
            end
        end
    end

    always_comb begin
        result = '0;
        for (l=0; l<32; l=l+1) begin
            if (fc_pipe[1]) begin
                for (p=0; p<6; p=p+1)
                    result[(l*6+p)*32 +: 32] = mac_result[l][p];
            end else begin
                for (p=0; p<4; p=p+1)
                    result[(l*6+p)*32 +: 32] = winograd_result[l][p];
                result[(l*6+4)*32 +: 32] = '0;
                result[(l*6+5)*32 +: 32] = '0;
            end
        end
    end

    always_ff @(posedge clock) begin
        if (!resetn) begin
            valid_pipe <= '0;
            fc_pipe <= '0;
        end else begin
            valid_pipe <= {valid_pipe[0], ivalid};
            fc_pipe <= {fc_pipe[0], fc_en};
        end
    end

    assign ovalid = valid_pipe[1];
endmodule
