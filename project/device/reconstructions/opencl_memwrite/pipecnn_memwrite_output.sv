`timescale 1ns/1ps
// Functional reconstruction of conv_pipe.cl::memWrite for the active
// VEC_SIZE/W_VEC_SIZE/LANE_NUM configuration. Handshakes are an ASIC wrapper
// around the source-level channel read and global-memory write operations;
// AOCL cycle timing is not claimed.
module pipecnn_memwrite_output #(
    parameter int VEC_SIZE = 16,
    parameter int W_VEC_SIZE = 6,
    parameter int LANE_NUM = 32,
    parameter int DATA_W = 8,
    parameter int DIM_W = 16
) (
    input  logic                         clock,
    input  logic                         resetn,

    input  logic                         bypass,
    input  logic                         pool_valid,
    output logic                         pool_ready,
    input  logic [LANE_NUM*W_VEC_SIZE*DATA_W-1:0] pool_data,
    input  logic                         bypass_valid,
    output logic                         bypass_ready,
    input  logic [LANE_NUM*W_VEC_SIZE*DATA_W-1:0] bypass_data,

    input  logic [31:0]                  out_num,
    input  logic [7:0]                   q_vec,
    input  logic [7:0]                   rem_size_x,
    input  logic [7:0]                   start_size_x,
    input  logic [7:0]                   out_dim1_div_q_vec,
    input  logic                         next_layer_padding,
    input  logic [DIM_W-1:0]             out_dim1,
    input  logic [DIM_W-1:0]             out_dim2,
    input  logic [31:0]                  out_dim1xdim2,
    input  logic [7:0]                   scal,
    input  logic [7:0]                   scal_rem_z,
    input  logic [7:0]                   scalxq_vec,
    input  logic [7:0]                   scalxrem_size_x,
    input  logic [7:0]                   scalxstart_size_x,
    input  logic [7:0]                   scal_rem_zxq_vec,
    input  logic [7:0]                   scal_rem_zxrem_size_x,
    input  logic [7:0]                   scal_rem_zxstart_size_x,
    input  logic [31:0]                  dim_z_edge_num,

    output logic                         out_valid,
    input  logic                         out_ready,
    output logic [31:0]                  out_addr,
    output logic [VEC_SIZE*DATA_W-1:0]   out_data,
    output logic                         done
);
    localparam int TOKEN_W = LANE_NUM * W_VEC_SIZE * DATA_W;

    logic [TOKEN_W-1:0] token_q;
    logic [31:0] processed_count;
    logic [31:0] candidate_index;
    logic [DIM_W-1:0] x_dim, y_dim, z_dim;
    logic [DIM_W-1:0] padding_tmp;
    logic start_flag, end_flag;
    logic [7:0] active_width, active_loop_num;
    logic [7:0] width_cnt, lane_cnt, inner_loop;
    logic [7:0] selected_width;
    logic [7:0] selected_loop_num;
    logic [7:0] source_index;
    logic in_emit;
    integer k;

    function automatic logic [31:0] to_u32_dim(input logic [DIM_W-1:0] value);
        to_u32_dim = '0;
        to_u32_dim[DIM_W-1:0] = value;
    endfunction

    function automatic logic [31:0] to_u32_byte(input logic [7:0] value);
        to_u32_byte = {24'b0, value};
    endfunction

    always_comb begin
        candidate_index = processed_count + 1'b1;
        selected_width = q_vec;
        selected_loop_num = scalxq_vec;
        if (candidate_index >= dim_z_edge_num) begin
            if (start_flag) begin
                selected_width = start_size_x;
                selected_loop_num = scal_rem_zxstart_size_x;
            end else if (end_flag) begin
                selected_width = rem_size_x;
                selected_loop_num = scal_rem_zxrem_size_x;
            end else begin
                selected_width = q_vec;
                selected_loop_num = scal_rem_zxq_vec;
            end
        end else begin
            if (start_flag) begin
                selected_width = start_size_x;
                selected_loop_num = scalxstart_size_x;
            end else if (end_flag) begin
                selected_width = rem_size_x;
                selected_loop_num = scalxrem_size_x;
            end else begin
                selected_width = q_vec;
                selected_loop_num = scalxq_vec;
            end
        end
    end

    assign in_emit = active_loop_num != 0 && inner_loop < active_loop_num;
    assign pool_ready = resetn && !in_emit && processed_count < out_num && !bypass;
    assign bypass_ready = resetn && !in_emit && processed_count < out_num && bypass;
    assign out_valid = resetn && in_emit;
    assign done = (processed_count == out_num) && !in_emit;

    always_comb begin
        out_addr = '0;
        out_data = '0;
        source_index = width_cnt;

        if (start_flag && width_cnt == 0 && next_layer_padding)
            source_index = 0;
        else if (start_flag && width_cnt < start_size_x && next_layer_padding)
            source_index = width_cnt - 1'b1;

        if (start_flag && width_cnt == 0 && next_layer_padding) begin
            out_data = '0;
        end else if (end_flag && width_cnt == rem_size_x - 1'b1
                     && next_layer_padding) begin
            out_data = '0;
        end else begin
            for (k = 0; k < VEC_SIZE; k = k + 1)
                out_data[k*DATA_W +: DATA_W] =
                    token_q[((lane_cnt*VEC_SIZE+k)*W_VEC_SIZE+int'(source_index))*DATA_W +: DATA_W];
        end

        out_addr = (to_u32_dim(z_dim) + to_u32_byte(lane_cnt)) * out_dim1xdim2
                 + to_u32_dim(y_dim) * to_u32_dim(out_dim1)
                 + to_u32_dim(x_dim) * to_u32_byte(q_vec)
                 + to_u32_dim(padding_tmp)
                 + to_u32_byte(width_cnt);
    end

    always_ff @(posedge clock) begin
        if (!resetn) begin
            token_q <= '0;
            processed_count <= '0;
            x_dim <= '0;
            y_dim <= '0;
            z_dim <= '0;
            padding_tmp <= '0;
            start_flag <= 1'b1;
            end_flag <= 1'b0;
            active_width <= '0;
            active_loop_num <= '0;
            width_cnt <= '0;
            lane_cnt <= '0;
            inner_loop <= '0;
        end else if (!in_emit) begin
            if (processed_count < out_num &&
                ((bypass && bypass_valid) || (!bypass && pool_valid))) begin
                token_q <= bypass ? bypass_data : pool_data;
                active_width <= selected_width;
                active_loop_num <= selected_loop_num;
                width_cnt <= '0;
                lane_cnt <= '0;
                inner_loop <= '0;
            end
        end else if (out_valid && out_ready) begin
            processed_count <= processed_count + 1'b1;
            if (width_cnt == active_width - 1'b1) begin
                lane_cnt <= lane_cnt + 1'b1;
                width_cnt <= '0;
            end else begin
                width_cnt <= width_cnt + 1'b1;
            end

            if (inner_loop == active_loop_num - 1'b1) begin
                inner_loop <= '0;
                active_loop_num <= '0;

                if (end_flag && y_dim == out_dim2 - 1'b1) begin
                    z_dim <= z_dim + DIM_W'(scal);
                    y_dim <= '0;
                end else if (end_flag) begin
                    y_dim <= y_dim + 1'b1;
                end

                if (x_dim == DIM_W'(out_dim1_div_q_vec - 1'b1))
                    x_dim <= '0;
                else
                    x_dim <= x_dim + 1'b1;

                if (x_dim == DIM_W'(out_dim1_div_q_vec - 1'b1)) begin
                    start_flag <= 1'b1;
                    padding_tmp <= '0;
                end else begin
                    start_flag <= 1'b0;
                    padding_tmp <= next_layer_padding ? DIM_W'(1) : '0;
                end

                if (x_dim == DIM_W'(out_dim1_div_q_vec - 1'b1))
                    end_flag <= (out_dim1_div_q_vec == 1);
                else
                    end_flag <= (x_dim + DIM_W'(1) == DIM_W'(out_dim1_div_q_vec - 1'b1));
            end else begin
                inner_loop <= inner_loop + 1'b1;
            end
        end
    end

    // scal_rem_z is part of the source-level host contract; the supplied
    // scal_rem_z* loop counts encode it. Keep this port visible for traceability.
    logic unused_scal_rem_z;
    always_comb unused_scal_rem_z = ^scal_rem_z;

endmodule
