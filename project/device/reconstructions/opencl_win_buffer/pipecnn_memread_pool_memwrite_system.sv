`timescale 1ns/1ps
// Functional source-level SYSTEM reconstruction:
// memRead counters/buffers/compute -> token FIFO -> optional 2x2 pooling
// -> memWrite address/data generation. FIFO timing is this ASIC wrapper's
// explicit ready/valid contract, not recovered AOCL channel timing.
module pipecnn_memread_pool_memwrite_system #(
    parameter int VEC_SIZE = 16,
    parameter int MAX_WIN_SIZE = 96,
    parameter int INDEX_W = 32,
    parameter int COUNTER_W = 16,
    parameter int CONV_GP_SIZE_Y = 1,
    parameter int FIFO_DEPTH = 8,
    parameter int MAX_COLS = 136,
    parameter int DIM_W = 16
) (
    input  logic                         clock,
    input  logic                         resetn,

    input  logic                         word_valid,
    output logic                         word_ready,
    input  logic [COUNTER_W-1:0]         win_size,
    input  logic [COUNTER_W-1:0]         win_size_y,
    input  logic [COUNTER_W-1:0]         weight_dim3,
    input  logic [COUNTER_W-1:0]         weight_dim4_div_lane,
    input  logic [COUNTER_W-1:0]         group_num_x,
    input  logic [COUNTER_W-1:0]         group_num_y,
    input  logic [7:0]                   group_size_x,
    input  logic [7:0]                   stride,
    input  logic [7:0]                   weight_dim1,
    input  logic [7:0]                   conv_row_rem,
    input  logic [COUNTER_W-1:0]         data_dim1,
    input  logic [COUNTER_W-1:0]         data_dim2,
    input  logic [31:0]                  data_dim1xdim2,
    input  logic [7:0]                   padding,
    input  logic [INDEX_W-1:0]           conv_loop_cnt,
    input  logic [INDEX_W-1:0]           group_num_mul_win_size,
    input  logic [4*VEC_SIZE*8-1:0]      bottom_word,
    input  logic                         fc_en,
    input  logic [32*16*6*8-1:0]         weight_word,
    input  logic [32*8-1:0]              bias_word,
    input  logic signed [7:0]            frac_w,
    input  logic signed [7:0]            frac_b,
    input  logic signed [7:0]            frac_din,
    input  logic signed [7:0]            frac_dout,
    input  logic                         relu_enable,

    // memRead -> pool/memWrite control and output geometry.
    input  logic                         bypass,
    input  logic [15:0]                  line_size,
    input  logic [15:0]                  col_size,
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

    output logic                         write_valid,
    input  logic                         write_ready,
    output logic [31:0]                  write_addr,
    output logic [VEC_SIZE*8-1:0]        write_data,
    output logic                         memread_done,
    output logic                         memwrite_done,
    output logic [COUNTER_W-1:0]         gp_num_x,
    output logic [COUNTER_W-1:0]         gp_num_y,
    output logic [COUNTER_W-1:0]         out_idx_z,
    output logic [COUNTER_W-1:0]         win_itm_xyz,
    output logic [1:0]                   flag,
    output logic                         read8_flag,
    output logic [INDEX_W-1:0]           conv_z_cnt,
    output logic [INDEX_W-1:0]           iteration_index,
    output logic [31:0]                  weight_global_address,
    output logic [31:0]                  bottom_read_address,
    output logic                         bottom_zero_fill,
    output logic [COUNTER_W-1:0]         feature_x,
    output logic [COUNTER_W-1:0]         feature_y,
    output logic [COUNTER_W-1:0]         feature_z,
    output logic [$clog2(FIFO_DEPTH+1)-1:0] result_fifo_count
);
    localparam int TOKEN_W = 32*6*8;
    localparam int FIFO_PTR_W = (FIFO_DEPTH > 1) ? $clog2(FIFO_DEPTH) : 1;
    localparam int FIFO_COUNT_W = $clog2(FIFO_DEPTH+1);
    // The compute slice registers the input MAC operands/results and then
    // registers accumulation/postprocessing. Four entries cover all results
    // that can still emerge after upstream admission is stopped.
    localparam int RESULT_RESERVATION = 4;

    logic core_word_ready, core_result_valid;
    logic [TOKEN_W-1:0] core_result;
    logic core_input_enable;
    logic [TOKEN_W-1:0] fifo_mem [0:FIFO_DEPTH-1];
    logic [FIFO_PTR_W-1:0] fifo_write_ptr, fifo_read_ptr;
    logic fifo_valid, pool_in_ready, pool_out_valid, pool_out_ready;
    logic [TOKEN_W-1:0] fifo_head, pool_result;
    logic memwrite_pool_ready, memwrite_bypass_ready;
    logic fifo_push, fifo_pop;
    logic [FIFO_COUNT_W-1:0] fifo_count_q;

    assign result_fifo_count = fifo_count_q;
    assign fifo_head = fifo_mem[fifo_read_ptr];
    assign fifo_valid = (fifo_count_q != 0);
    assign fifo_push = core_result_valid;
    assign fifo_pop = fifo_valid && (bypass ? memwrite_bypass_ready : pool_in_ready);

    // Stop accepting source iterations early enough to absorb the fixed
    // compute pipeline's outstanding output tokens before the FIFO fills.
    assign core_input_enable = (fifo_count_q < FIFO_COUNT_W'(FIFO_DEPTH-RESULT_RESERVATION));
    assign word_ready = resetn && core_word_ready && core_input_enable && !memread_done;

    pipecnn_memread_buffered_compute #(
        .VEC_SIZE(VEC_SIZE), .MAX_WIN_SIZE(MAX_WIN_SIZE), .INDEX_W(INDEX_W),
        .COUNTER_W(COUNTER_W), .CONV_GP_SIZE_Y(CONV_GP_SIZE_Y)
    ) memread (
        .clock, .resetn, .word_valid(word_valid && word_ready), .word_ready(core_word_ready),
        .win_size, .win_size_y, .weight_dim3, .weight_dim4_div_lane,
        .group_num_x, .group_num_y, .group_size_x, .stride, .weight_dim1,
        .conv_row_rem, .data_dim1, .data_dim2, .data_dim1xdim2, .padding,
        .conv_loop_cnt, .group_num_mul_win_size, .bottom_word, .fc_en,
        .weight_word, .bias_word, .frac_w, .frac_b, .frac_din, .frac_dout,
        .relu_enable, .result_valid(core_result_valid), .result(core_result),
        .gp_num_x, .gp_num_y, .out_idx_z, .win_itm_xyz, .flag, .read8_flag,
        .conv_z_cnt, .iteration_index, .done(memread_done),
        .weight_global_address, .bottom_read_address, .bottom_zero_fill,
        .feature_x, .feature_y, .feature_z
    );

    always_ff @(posedge clock) begin
        if (!resetn) begin
            fifo_write_ptr <= '0;
            fifo_read_ptr <= '0;
            fifo_count_q <= '0;
        end else begin
            if (fifo_push) begin
                fifo_mem[fifo_write_ptr] <= core_result;
                if (fifo_write_ptr == FIFO_PTR_W'(FIFO_DEPTH-1))
                    fifo_write_ptr <= '0;
                else
                    fifo_write_ptr <= fifo_write_ptr + 1'b1;
            end

            if (fifo_pop) begin
                if (fifo_read_ptr == FIFO_PTR_W'(FIFO_DEPTH-1))
                    fifo_read_ptr <= '0;
                else
                    fifo_read_ptr <= fifo_read_ptr + 1'b1;
            end

            case ({fifo_push, fifo_pop})
                2'b10: fifo_count_q <= fifo_count_q + 1'b1;
                2'b01: fifo_count_q <= fifo_count_q - 1'b1;
                default: fifo_count_q <= fifo_count_q;
            endcase
        end
    end

    pipecnn_pool_2x2 #(
        .LANE_NUM(32), .W_VEC_SIZE(6), .DATA_W(8), .MAX_COLS(MAX_COLS)
    ) pool (
        .clock, .resetn,
        .in_valid(fifo_valid && !bypass), .in_ready(pool_in_ready),
        .conv_data(fifo_head), .line_size, .col_size,
        .out_valid(pool_out_valid), .out_ready(pool_out_ready),
        .pool_data(pool_result)
    );

    pipecnn_memwrite_output #(
        .VEC_SIZE(VEC_SIZE), .W_VEC_SIZE(6), .LANE_NUM(32), .DATA_W(8), .DIM_W(DIM_W)
    ) memwrite (
        .clock, .resetn, .bypass,
        .pool_valid(pool_out_valid), .pool_ready(memwrite_pool_ready),
        .pool_data(pool_result),
        .bypass_valid(fifo_valid && bypass), .bypass_ready(memwrite_bypass_ready),
        .bypass_data(fifo_head),
        .out_num, .q_vec, .rem_size_x, .start_size_x, .out_dim1_div_q_vec,
        .next_layer_padding, .out_dim1, .out_dim2, .out_dim1xdim2,
        .scal, .scal_rem_z, .scalxq_vec, .scalxrem_size_x,
        .scalxstart_size_x, .scal_rem_zxq_vec, .scal_rem_zxrem_size_x,
        .scal_rem_zxstart_size_x, .dim_z_edge_num,
        .out_valid(write_valid), .out_ready(write_ready),
        .out_addr(write_addr), .out_data(write_data), .done(memwrite_done)
    );

    assign pool_out_ready = memwrite_pool_ready;

    initial begin
        if (FIFO_DEPTH <= RESULT_RESERVATION)
            $error("FIFO_DEPTH must exceed the four-cycle output reservation");
        if ((FIFO_DEPTH & (FIFO_DEPTH-1)) != 0)
            $error("FIFO_DEPTH must be a power of two");
    end
endmodule
