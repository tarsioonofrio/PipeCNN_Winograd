`timescale 1ns/1ps
module asb3_f43_tb;
    localparam int CHANNELS = 3;
    localparam int DATA_W = 16;
    localparam int INPUT_H = 32;
    localparam int INPUT_W = 32;
    localparam int OUTPUT_H = 30;
    localparam int OUTPUT_W = 30;
    localparam int TILE_OUT = 4;
    localparam int TILE_IN = 6;
    localparam int TILE_ROWS = (OUTPUT_H + TILE_OUT - 1) / TILE_OUT;
    localparam int TILE_COLS = (OUTPUT_W + TILE_OUT - 1) / TILE_OUT;
    localparam int TILE_COUNT = TILE_ROWS * TILE_COLS;
    localparam int INPUT_CHANNELS = 3;
    localparam int OUTPUT_CHANNELS = 3;
    localparam int HADAMARD_PRODUCTS_PER_TILE = TILE_IN*TILE_IN*INPUT_CHANNELS*OUTPUT_CHANNELS;
    localparam int BLOCKS_PER_ROW = (INPUT_W + 2 + 3) / 4;

    logic clk = 0;
    logic rst = 0;
    logic block_valid = 0;
    logic [CHANNELS*DATA_W-1:0] block_data [0:3];
    logic tile_valid;
    logic [CHANNELS*DATA_W*TILE_IN-1:0] tile_data;
    integer tile_count = 0;
    integer vector_read_count = 0;
    integer tile_y, row_offset, block_idx, block_col, ch, tile_col, tile_x;
    integer x, y;
    integer multiplier_count, groups_per_tile, ideal_compute_cycles;
    logic signed [15:0] expected;

    always #5 clk = ~clk;

    asb3_f43 #(.CHANNELS(CHANNELS), .DATA_W(DATA_W)) dut (
        .clk(clk), .rst(rst), .block_valid(block_valid),
        .block_data(block_data), .tile_valid(tile_valid), .tile_data(tile_data)
    );

    function automatic logic signed [15:0] feature_value(input integer c, input integer row, input integer col);
        if (row < 0 || row >= INPUT_H || col < 0 || col >= INPUT_W)
            feature_value = 16'sd0;
        else
            feature_value = 16'(1 + c*1000 + row*INPUT_W + col);
    endfunction

    initial begin
        for (tile_y = 0; tile_y < TILE_ROWS; tile_y = tile_y + 1) begin
            for (row_offset = 0; row_offset < TILE_IN; row_offset = row_offset + 1) begin
                // Restart the three-slot stream for each input row. The test
                // checks horizontal tile assembly and vertical edge padding.
                @(negedge clk);
                rst = 0;
                block_valid = 0;
                repeat (2) @(negedge clk);
                rst = 1;

                y = tile_y*TILE_OUT + row_offset;
                for (block_idx = 0; block_idx < BLOCKS_PER_ROW; block_idx = block_idx + 1) begin
                    for (block_col = 0; block_col < 4; block_col = block_col + 1) begin
                        x = block_idx*4 + block_col;
                        block_data[block_col] = '0;
                        for (ch = 0; ch < CHANNELS; ch = ch + 1)
                            block_data[block_col][ch*DATA_W +: DATA_W] =
                                feature_value(ch, y, x);
                    end

                    @(negedge clk);
                    block_valid = 1;
                    vector_read_count = vector_read_count + 4;
                    @(posedge clk);
                    #1;

                    if (block_idx == 0) begin
                        if (tile_valid !== 1'b0)
                            $fatal(1, "Tile emitted before two aligned blocks were loaded");
                    end else begin
                        if (tile_valid !== 1'b1)
                            $fatal(1, "Missing tile after input block %0d", block_idx);
                        tile_col = block_idx - 1;
                        tile_x = tile_col*TILE_OUT;
                        for (block_col = 0; block_col < TILE_IN; block_col = block_col + 1) begin
                            x = tile_x + block_col;
                            for (ch = 0; ch < CHANNELS; ch = ch + 1) begin
                                expected = feature_value(ch, y, x);
                                if (tile_data[(block_col*CHANNELS + ch)*DATA_W +: DATA_W]
                                    !== expected[DATA_W-1:0])
                                    $fatal(1,
                                        "ASB mismatch tile_y=%0d row=%0d tile_x=%0d col=%0d channel=%0d got=%0d expected=%0d",
                                        tile_y, y, tile_x, block_col, ch,
                                        $signed(tile_data[(block_col*CHANNELS + ch)*DATA_W +: DATA_W]),
                                        $signed(expected[DATA_W-1:0]));
                            end
                        end
                        tile_count = tile_count + 1;
                    end
                    block_valid = 0;
                end
            end
        end

        if (tile_count != TILE_ROWS*TILE_IN*TILE_COLS)
            $fatal(1, "Unexpected tile count: %0d", tile_count);
        $display("PASS: %0d six-vector ASB tiles, %0d channels, signed int16", tile_count, CHANNELS);
        $display("Coverage: output grid %0dx%0d in F(4,3) tiles; right and bottom input edges zero-padded",
            OUTPUT_W, OUTPUT_H);
        $display("Horizontal stream traffic in this test model: %0d four-vector blocks (%0d vectors)",
            vector_read_count/4, vector_read_count);
        $display("Ideal 2-D F(4,3) Hadamard issue bound: %0d tiles x %0d products/tile (%0d total products)",
            TILE_COUNT, HADAMARD_PRODUCTS_PER_TILE,
            TILE_COUNT*HADAMARD_PRODUCTS_PER_TILE);
        $display("Multipliers | ideal issue cycles (ceil per tile)");
        for (multiplier_count = 4; multiplier_count <= 36; multiplier_count = multiplier_count + 4) begin
            groups_per_tile = (HADAMARD_PRODUCTS_PER_TILE + multiplier_count - 1)
                / multiplier_count;
            ideal_compute_cycles = TILE_COUNT * groups_per_tile;
            if (ideal_compute_cycles * multiplier_count < TILE_COUNT*HADAMARD_PRODUCTS_PER_TILE)
                $fatal(1, "Invalid ideal multiplier schedule for %0d multipliers", multiplier_count);
            $display("%0d | %0d", multiplier_count, ideal_compute_cycles);
        end
        $finish;
    end
endmodule
