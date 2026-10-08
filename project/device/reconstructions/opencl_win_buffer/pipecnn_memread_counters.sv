`timescale 1ns/1ps
// Source-level iteration counters from conv_pipe.cl::memRead. This advances
// once per accepted loop iteration. It reproduces counter expressions only;
// it does not claim the cycle schedule inferred by AOCL.
module pipecnn_memread_counters #(
    parameter int INDEX_W = 32,
    parameter int COUNTER_W = 16,
    parameter int CONV_GP_SIZE_Y = 1,
    parameter int VEC_SIZE = 16
) (
    input  logic                       clock,
    input  logic                       resetn,
    input  logic                       step,
    input  logic [COUNTER_W-1:0]       win_size,
    input  logic [COUNTER_W-1:0]       win_size_y,
    input  logic [COUNTER_W-1:0]       weight_dim3,
    input  logic [COUNTER_W-1:0]       weight_dim4_div_lane,
    input  logic [COUNTER_W-1:0]       group_num_x,
    input  logic [COUNTER_W-1:0]       group_num_y,
    input  logic [7:0]                 group_size_x,
    input  logic [7:0]                 stride,
    input  logic [7:0]                 weight_dim1,
    input  logic [7:0]                 conv_row_rem,
    input  logic [INDEX_W-1:0]         conv_loop_cnt,
    input  logic [INDEX_W-1:0]         group_num_mul_win_size,
    output logic [COUNTER_W-1:0]       gp_num_x,
    output logic [COUNTER_W-1:0]       gp_num_y,
    output logic [COUNTER_W-1:0]       out_idx_z,
    output logic [COUNTER_W-1:0]       win_itm_xyz,
    output logic [COUNTER_W-1:0]       win_itm_y,
    output logic [COUNTER_W-1:0]       win_itm_z,
    output logic [1:0]                 flag,
    output logic                       read8_flag,
    output logic [INDEX_W-1:0]         conv_z_cnt,
    output logic [INDEX_W-1:0]         iteration_index,
    output logic                       done,
    output logic                       gp_num_x_is_one,
    output logic                       weight_load_en,
    output logic [COUNTER_W-1:0]       weight_load_index,
    output logic [31:0]                weight_global_address,
    output logic [COUNTER_W-1:0]       feature_x,
    output logic [COUNTER_W-1:0]       feature_y,
    output logic [COUNTER_W-1:0]       feature_z
);
    logic [INDEX_W-1:0] iteration_count;
    logic [COUNTER_W-1:0] next_gp_num_x, next_gp_num_y, next_out_idx_z;
    logic [COUNTER_W-1:0] next_win_itm_y, next_win_itm_z;
    logic [COUNTER_W-1:0] effective_win_itm_y, effective_win_itm_z;
    logic [1:0] next_flag;
    logic next_read8_flag;
    logic [INDEX_W-1:0] next_conv_z_cnt;
    logic [COUNTER_W-1:0] effective_weight_z_last;

    always_comb begin
        iteration_index = iteration_count + 1'b1;
        done = (iteration_count >= group_num_mul_win_size);
        gp_num_x_is_one = (gp_num_x == 1);
        weight_load_en = (gp_num_x == 2) && (gp_num_y == 0);
        weight_load_index = win_itm_xyz;
        weight_global_address = 32'(out_idx_z) * 32'(win_size)
                              + 32'(win_itm_xyz);
        effective_win_itm_y = (win_itm_xyz == 0) ? '0 : win_itm_y;
        effective_win_itm_z = (win_itm_xyz == 0) ? '0 : win_itm_z;
        feature_x = COUNTER_W'(32'(gp_num_x) * 32'(group_size_x)
                             * 32'(stride));
        feature_y = COUNTER_W'(32'(gp_num_y) * 32'(CONV_GP_SIZE_Y)
                             * 32'(stride) + 32'(effective_win_itm_y));
        feature_z = effective_win_itm_z;
        effective_weight_z_last = COUNTER_W'((32'(weight_dim3) / VEC_SIZE) - 1);

        next_gp_num_x = gp_num_x;
        next_gp_num_y = gp_num_y;
        next_out_idx_z = out_idx_z;
        next_win_itm_y = win_itm_y;
        next_win_itm_z = win_itm_z;
        next_flag = flag;
        next_read8_flag = read8_flag;
        next_conv_z_cnt = conv_z_cnt;

        // The source resets these coordinates at the first window item,
        // then advances y/z after every loop iteration.
        if (win_itm_xyz == 0) begin
            next_win_itm_y = 0;
            next_win_itm_z = 0;
        end
        if (next_win_itm_y == win_size_y - 1'b1) begin
            next_win_itm_y = 0;
            if (next_win_itm_z == effective_weight_z_last)
                next_win_itm_z = 0;
            else
                next_win_itm_z = next_win_itm_z + 1'b1;
        end else begin
            next_win_itm_y = next_win_itm_y + 1'b1;
        end

        // conv_z_cnt is updated after this iteration's arithmetic in source.
        if (conv_z_cnt == conv_loop_cnt - 1'b1)
            next_conv_z_cnt = 0;
        else if (iteration_index > 2*win_size && !read8_flag)
            next_conv_z_cnt = conv_z_cnt + 1'b1;

        // Virtual group counters advance once per complete win_size sequence.
        if (win_itm_xyz == win_size - 1'b1) begin
            if ((out_idx_z == weight_dim4_div_lane - 1'b1)
                && (gp_num_y == group_num_y - 1'b1)
                && (gp_num_x == group_num_x - 1'b1))
                next_out_idx_z = 0;
            else if ((gp_num_y == group_num_y - 1'b1)
                     && (gp_num_x == group_num_x - 1'b1))
                next_out_idx_z = out_idx_z + 1'b1;

            if ((gp_num_y == group_num_y - 1'b1)
                && (gp_num_x == group_num_x - 1'b1))
                next_gp_num_y = 0;
            else if (gp_num_x == group_num_x - 1'b1)
                next_gp_num_y = gp_num_y + 1'b1;

            if (gp_num_x == group_num_x - 1'b1)
                next_gp_num_x = 0;
            else
                next_gp_num_x = gp_num_x + 1'b1;

            if ((next_gp_num_x == 1) && (weight_dim1 == 3)
                && ((conv_row_rem == 1) || (conv_row_rem == 2)))
                next_read8_flag = 1'b1;
            else
                next_read8_flag = 1'b0;

            if (flag == 2)
                next_flag = 0;
            else
                next_flag = flag + 1'b1;
        end
    end

    always_ff @(posedge clock) begin
        if (!resetn) begin
            iteration_count <= 0;
            gp_num_x <= 0;
            gp_num_y <= 0;
            out_idx_z <= 0;
            win_itm_xyz <= 0;
            win_itm_y <= 0;
            win_itm_z <= 0;
            flag <= 0;
            read8_flag <= 0;
            conv_z_cnt <= 0;
        end else if (step && !done) begin
            iteration_count <= iteration_count + 1'b1;
            gp_num_x <= next_gp_num_x;
            gp_num_y <= next_gp_num_y;
            out_idx_z <= next_out_idx_z;
            win_itm_y <= next_win_itm_y;
            win_itm_z <= next_win_itm_z;
            read8_flag <= next_read8_flag;
            conv_z_cnt <= next_conv_z_cnt;
            flag <= next_flag;

            if (win_itm_xyz == win_size - 1'b1)
                win_itm_xyz <= 0;
            else
                win_itm_xyz <= win_itm_xyz + 1'b1;
        end
    end

    initial begin
        if (INDEX_W < 1 || COUNTER_W < 1 || VEC_SIZE < 1
            || CONV_GP_SIZE_Y < 0)
            $error("counter parameters are invalid");
    end
endmodule
