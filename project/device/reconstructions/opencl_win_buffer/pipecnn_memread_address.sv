`timescale 1ns/1ps
// Source-level translation of memRead's rd_prt calculation and vertical
// padding guard. The returned address is the intvec-pointer index used by
// bottom[rd_prt]; the external memory supplies that 512-bit word.
module pipecnn_memread_address #(
    parameter int DIM_W = 16
) (
    input  logic [DIM_W-1:0] feature_x,
    input  logic [DIM_W-1:0] feature_y,
    input  logic [DIM_W-1:0] feature_z,
    input  logic [DIM_W-1:0] data_dim1,
    input  logic [DIM_W-1:0] data_dim2,
    input  logic [31:0]      data_dim1xdim2,
    input  logic [7:0]       padding,
    output logic [31:0]      rd_prt,
    output logic             zero_fill
);
    logic [31:0] y_offset, y_limit;
    logic [31:0] element_address;

    always_comb begin
        y_offset = 32'(feature_y) - 32'(padding);
        y_limit = 32'(data_dim2) + 32'(padding);
        element_address = 32'(feature_z) * data_dim1xdim2
                        + y_offset * 32'(data_dim1)
                        + 32'(feature_x);
        rd_prt = element_address >> 2;
        zero_fill = (32'(feature_y) < 32'(padding))
                 || (32'(feature_y) >= y_limit);
    end
endmodule
