`timescale 1ns/1ps
// Source-level translation of conv_pipe.cl::win_buffer[WIN_BUF_SIZE][3].
// Each input word contains four VEC_SIZE-byte vectors. The 0->1->2 slot flag
// writes the current word while reading the two older slots selected by the
// OpenCL switch. The two initial groups are warm-up and do not emit a tile.
// Ready/valid timing is an ASIC wrapper, not recovered AOCL timing.
module pipecnn_win_buffer3 #(
    parameter int VEC_SIZE = 16,
    parameter int DATA_W = 8,
    parameter int MAX_WIN_SIZE = 96,
    parameter int INDEX_W = 16
) (
    input  logic                         clock,
    input  logic                         resetn,
    input  logic                         in_valid,
    output logic                         in_ready,
    input  logic [INDEX_W-1:0]           win_size,
    input  logic [INDEX_W-1:0]           word_index,
    input  logic                         gp_num_x_is_one,
    input  logic [7:0]                   weight_dim1,
    input  logic [7:0]                   conv_row_rem,
    input  logic [4*VEC_SIZE*DATA_W-1:0] input_word,
    output logic                         tile_valid,
    input  logic                         tile_ready,
    output logic [6*VEC_SIZE*DATA_W-1:0] tile_data
);
    localparam int WORD_W = 4*VEC_SIZE*DATA_W;
    localparam int TILE_W = 6*VEC_SIZE*DATA_W;
    localparam int WIN_PTR_W = (MAX_WIN_SIZE > 1) ? $clog2(MAX_WIN_SIZE) : 1;

    logic [WORD_W-1:0] buffer [0:MAX_WIN_SIZE-1][0:2];
    logic [WIN_PTR_W-1:0] buffer_addr;
    logic [WORD_W-1:0] read1_word, read2_word;
    logic [TILE_W-1:0] tile_data_comb, tile_data_q;
    logic tile_valid_q;
    logic [1:0] flag;
    logic [31:0] accepted_count;
    logic [1:0] read1_slot, read2_slot;
    logic tail_zero, tail_one;
    integer vector_index, byte_index;

    always_comb begin
        case (flag)
            2'd0: begin read1_slot=2'd1; read2_slot=2'd2; end
            2'd1: begin read1_slot=2'd2; read2_slot=2'd0; end
            default: begin read1_slot=2'd0; read2_slot=2'd1; end
        endcase
        read1_word = buffer[buffer_addr][read1_slot];
        read2_word = buffer[buffer_addr][read2_slot];
        tail_zero = gp_num_x_is_one && weight_dim1 == 3 && conv_row_rem == 3;
        tail_one = gp_num_x_is_one && weight_dim1 == 3 && conv_row_rem == 0;
        tile_data_comb = '0;

        for (vector_index=0; vector_index<3; vector_index=vector_index+1)
            for (byte_index=0; byte_index<VEC_SIZE; byte_index=byte_index+1)
                tile_data_comb[(vector_index*VEC_SIZE+byte_index)*DATA_W +: DATA_W] =
                    read1_word[(vector_index*VEC_SIZE+byte_index)*DATA_W +: DATA_W];

        if (!tail_zero) begin
            for (byte_index=0; byte_index<VEC_SIZE; byte_index=byte_index+1)
                tile_data_comb[(3*VEC_SIZE+byte_index)*DATA_W +: DATA_W] =
                    read1_word[(3*VEC_SIZE+byte_index)*DATA_W +: DATA_W];
            if (!tail_one) begin
                for (byte_index=0; byte_index<VEC_SIZE; byte_index=byte_index+1) begin
                    tile_data_comb[(4*VEC_SIZE+byte_index)*DATA_W +: DATA_W] =
                        read2_word[(0*VEC_SIZE+byte_index)*DATA_W +: DATA_W];
                    tile_data_comb[(5*VEC_SIZE+byte_index)*DATA_W +: DATA_W] =
                        read2_word[(1*VEC_SIZE+byte_index)*DATA_W +: DATA_W];
                end
            end
        end
    end

    assign in_ready = resetn && (!tile_valid || tile_ready);
    assign tile_valid = resetn && (accepted_count > (32'(win_size) * 2)) && tile_valid_q;
    assign tile_data = tile_data_q;
    assign buffer_addr = word_index[WIN_PTR_W-1:0];

    always_ff @(posedge clock) begin
        if (!resetn) begin
            flag <= 2'd0;
            accepted_count <= '0;
            tile_valid_q <= 1'b0;
            tile_data_q <= '0;
        end else begin
            if (tile_valid_q && tile_ready)
                tile_valid_q <= 1'b0;

            if (in_valid && in_ready) begin
                buffer[buffer_addr][flag] <= input_word;
                accepted_count <= accepted_count + 1'b1;
                if (accepted_count + 1'b1 > (32'(win_size) * 2)) begin
                    tile_data_q <= tile_data_comb;
                    tile_valid_q <= 1'b1;
                end

                if (word_index == win_size - 1'b1) begin
                    if (flag == 2'd2)
                        flag <= 2'd0;
                    else
                        flag <= flag + 1'b1;
                end
            end
        end
    end

    initial begin
        if (MAX_WIN_SIZE < 1)
            $error("MAX_WIN_SIZE must be positive");
        if (DATA_W != 8)
            $error("OpenCL win_buffer reinterpretation expects 8-bit bytes");
    end
endmodule
