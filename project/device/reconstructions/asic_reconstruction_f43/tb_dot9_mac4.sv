`timescale 1ns/1ps
module tb_dot9_mac4;
    logic clk;
    logic rst = 1'b1;
    logic start = 1'b0;
    logic [9*16-1:0] feature_terms = '0;
    logic [9*16-1:0] weight_terms = '0;
    logic busy;
    logic done;
    logic signed [31:0] result;

    logic signed [15:0] features [0:8];
    logic signed [15:0] weights [0:8];
    longint signed reference_sum;
    logic signed [31:0] expected;
    logic [31:0] random_state;
    integer i, test_num, latency;

    initial begin
        clk = 1'b0;
        forever #5ns clk = ~clk;
    end

    winograd_f43_dot9_mac4 dut (.*);

    task automatic launch_and_check;
        begin
            feature_terms = '0;
            weight_terms = '0;
            reference_sum = 0;
            for (i=0; i<9; i=i+1) begin
                feature_terms[i*16 +: 16] = features[i];
                weight_terms[i*16 +: 16] = weights[i];
                reference_sum = reference_sum
                    + $signed(features[i]) * $signed(weights[i]);
            end
            expected = reference_sum[31:0];

            @(negedge clk);
            start = 1'b1;
            @(negedge clk);
            start = 1'b0;
            latency = 0;
            while (!done && latency < 5) begin
                @(negedge clk);
                latency = latency + 1;
            end
            if (!done)
                $fatal(1, "timeout waiting for MAC completion, case=%0d", test_num);
            if (latency != 3)
                $fatal(1, "latency mismatch: got %0d cycles expected 3", latency);
            if (result !== expected)
                $fatal(1, "dot9 mismatch case=%0d got=%0d expected=%0d",
                    test_num, result, expected);
            test_num = test_num + 1;
        end
    endtask

    initial begin
        test_num = 0;
        repeat (2) @(negedge clk);
        rst = 1'b0;

        for (i=0; i<9; i=i+1) begin
            features[i] = -16'sd32768;
            weights[i] = -16'sd32768;
        end
        launch_and_check();

        for (i=0; i<9; i=i+1) begin
            if ((i % 2) != 0) begin
                features[i] = 16'sd32767;
                weights[i] = -16'sd32768;
            end else begin
                features[i] = -16'sd32768;
                weights[i] = 16'sd32767;
            end
        end
        launch_and_check();

        random_state = 32'h8f31a2c7;
        for (integer test=0; test<256; test=test+1) begin
            for (i=0; i<9; i=i+1) begin
                random_state = random_state * 32'd1664525 + 32'd1013904223;
                features[i] = random_state[15:0];
                random_state = random_state * 32'd1664525 + 32'd1013904223;
                weights[i] = random_state[15:0];
            end
            launch_and_check();
        end

        $display("PASS: %0d dot9 reductions; four 16x16 products per cycle, 32-bit wrap, latency=3",
            test_num);
        $finish;
    end
endmodule
