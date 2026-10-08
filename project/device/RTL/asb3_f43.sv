`timescale 1ns/1ps
// Three-buffer aligned stream buffer for 1-D Winograd F(4,3) input tiles.
// Each accepted block carries four adjacent feature vectors. Once the first
// two blocks are available, emit a six-vector tile: four from the older block
// and two from the newer block. The 0 -> 1 -> 2 -> 0 rotation matches the
// AS-buffer schedule described for PipeCNN-Winograd.
module asb3_f43 #(
    parameter int CHANNELS = 3,
    parameter int DATA_W = 16
) (
    input  logic clk,
    input  logic rst,
    input  logic block_valid,
    input  logic [CHANNELS*DATA_W-1:0] block_data [0:3],
    output logic tile_valid,
    output logic [CHANNELS*DATA_W*6-1:0] tile_data
);
    logic [CHANNELS*DATA_W-1:0] buffer [0:2][0:3];
    integer block_count;
    integer current_slot;
    integer previous_slot;
    integer i;

    always_ff @(posedge clk) begin
        if (!rst) begin
            block_count <= 0;
            tile_valid <= 1'b0;
            tile_data <= '0;
        end else begin
            tile_valid <= 1'b0;
            if (block_valid) begin
                current_slot = block_count % 3;
                previous_slot = (block_count + 2) % 3;

                for (i = 0; i < 4; i = i + 1)
                    buffer[current_slot][i] <= block_data[i];

                if (block_count != 0) begin
                    for (i = 0; i < 4; i = i + 1)
                        tile_data[i*CHANNELS*DATA_W +: CHANNELS*DATA_W]
                            <= buffer[previous_slot][i];
                    tile_data[4*CHANNELS*DATA_W +: CHANNELS*DATA_W] <= block_data[0];
                    tile_data[5*CHANNELS*DATA_W +: CHANNELS*DATA_W] <= block_data[1];
                    tile_valid <= 1'b1;
                end

                block_count <= block_count + 1;
            end
        end
    end
endmodule
