`timescale 1ns/1ps
module tb_tile_core;
    logic clk;
    logic rst;
    logic start;
    logic [9*6*16-1:0] feature_tile;
    logic [9*6*16-1:0] weight_tile;
    logic busy;
    logic done;
    logic [4*32-1:0] output_tile;

    logic signed [15:0] feature [0:8][0:5];
    logic signed [15:0] raw_weight [0:8][0:2];
    logic signed [15:0] transformed_weight [0:8][0:5];
    logic signed [31:0] actual [0:3];
    longint signed expected [0:3];
    logic [31:0] random_state;
    integer i, j, x, test_num, latency;

    initial begin
        clk = 1'b0;
        forever #5ns clk = ~clk;
    end

    winograd_f43_3x3_tile_core dut (.*);

    task automatic make_tile;
        begin
            feature_tile = '0;
            weight_tile = '0;
            for (i=0; i<9; i=i+1) begin
                for (j=0; j<6; j=j+1)
                    feature_tile[(i*6+j)*16 +: 16] = feature[i][j];

                // Exact integer form of 24*G*g, with G from
                // data/weight/modelWinogradCut.py.
                transformed_weight[i][0] = 6*raw_weight[i][0];
                transformed_weight[i][1] = -4*raw_weight[i][0]
                                         -4*raw_weight[i][1]
                                         -4*raw_weight[i][2];
                transformed_weight[i][2] = -4*raw_weight[i][0]
                                         +4*raw_weight[i][1]
                                         -4*raw_weight[i][2];
                transformed_weight[i][3] = raw_weight[i][0]
                                         +2*raw_weight[i][1]
                                         +4*raw_weight[i][2];
                transformed_weight[i][4] = raw_weight[i][0]
                                         -2*raw_weight[i][1]
                                         +4*raw_weight[i][2];
                transformed_weight[i][5] = 24*raw_weight[i][2];
                for (j=0; j<6; j=j+1)
                    weight_tile[(i*6+j)*16 +: 16] = transformed_weight[i][j];
            end

            for (x=0; x<4; x=x+1) begin
                expected[x] = 0;
                for (i=0; i<9; i=i+1)
                    for (j=0; j<3; j=j+1)
                        expected[x] = expected[x]
                            + 24 * $signed(feature[i][x+j])
                                * $signed(raw_weight[i][j]);
            end
        end
    endtask

    task automatic launch_and_check;
        begin
            make_tile();
            @(negedge clk);
            start = 1'b1;
            @(negedge clk);
            start = 1'b0;
            latency = 0;
            while (!done && latency < 40) begin
                @(negedge clk);
                latency = latency + 1;
            end
            if (!done)
                $fatal(1, "timeout waiting for tile, case=%0d", test_num);
            if (latency != 31)
                $fatal(1, "tile latency mismatch: got %0d expected 31", latency);
            for (x=0; x<4; x=x+1) begin
                actual[x] = output_tile[x*32 +: 32];
                if (actual[x] !== expected[x][31:0])
                    $fatal(1, "tile mismatch case=%0d x=%0d got=%0d expected=%0d",
                        test_num, x, actual[x], expected[x][31:0]);
            end
            test_num = test_num + 1;
        end
    endtask

    initial begin
        rst=1'b1; start=1'b0;
        feature_tile='0; weight_tile='0;
        test_num=0;
        repeat (2) @(negedge clk);
        rst=1'b0;
        random_state=32'h54a329d1;

        for (integer test=0; test<128; test=test+1) begin
            for (i=0; i<9; i=i+1) begin
                for (j=0; j<6; j=j+1) begin
                    random_state = random_state * 32'd1664525 + 32'd1013904223;
                    feature[i][j] = $signed({{8{random_state[7]}}, random_state[7:0]});
                end
                for (j=0; j<3; j=j+1) begin
                    random_state = random_state * 32'd1664525 + 32'd1013904223;
                    raw_weight[i][j] = $signed({{10{random_state[5]}}, random_state[5:0]});
                end
            end
            launch_and_check();
        end

        $display("PASS: %0d F(4,3) tiles; 3x3/channel reduction, four 16x16 multipliers, latency=31",
            test_num);
        $finish;
    end
endmodule
