`timescale 1ns/1ps
// Logical reconstruction of conv_pipe.cl's weight_buffer[win_itm_xyz].
// It models one load and one read in a loop iteration. A same-address
// load/read forwards the loaded word, matching the source-level assignment
// followed by the array read. Physical RAM latency and AOCL scheduling remain
// implementation-dependent and are not modeled here.
module pipecnn_weight_buffer #(
    parameter int WORD_W = 32*16*6*8,
    parameter int DEPTH = 96,
    parameter int INDEX_W = 16
) (
    input  logic                  clock,
    input  logic                  resetn,
    input  logic                  load_valid,
    input  logic [INDEX_W-1:0]    load_index,
    input  logic [WORD_W-1:0]     load_data,
    input  logic [INDEX_W-1:0]    read_index,
    output logic [WORD_W-1:0]     read_data
);
    localparam int PTR_W = (DEPTH > 1) ? $clog2(DEPTH) : 1;
    logic [WORD_W-1:0] buffer [0:DEPTH-1];
    logic [PTR_W-1:0] load_ptr, read_ptr;

    assign load_ptr = load_index[PTR_W-1:0];
    assign read_ptr = read_index[PTR_W-1:0];

    always_comb begin
        if (load_valid && load_index == read_index)
            read_data = load_data;
        else
            read_data = buffer[read_ptr];
    end

    always_ff @(posedge clock) begin
        if (resetn && load_valid)
            buffer[load_ptr] <= load_data;
    end

    initial begin
        if (WORD_W < 1 || DEPTH < 1 || INDEX_W < 1)
            $error("weight buffer parameters must be positive");
    end
endmodule
