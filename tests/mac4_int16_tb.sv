module mac4_int16_tb;
    logic signed [15:0] a0, b0, a1, b1, a2, b2, a3, b3;
    logic signed [15:0] result;
    longint signed expected;
    integer signed p0, p1, p2, p3;
    integer i;
    logic [31:0] random_bits;

    mac4_int16 dut (
        .a0(a0), .b0(b0), .a1(a1), .b1(b1),
        .a2(a2), .b2(b2), .a3(a3), .b3(b3),
        .result(result)
    );

    task automatic check_case;
        begin
            p0 = a0 * b0;
            p1 = a1 * b1;
            p2 = a2 * b2;
            p3 = a3 * b3;
            expected = (longint'(p0) >>> 8) + (longint'(p1) >>> 8)
                     + (longint'(p2) >>> 8) + (longint'(p3) >>> 8);
            #1;
            if (result !== expected[15:0]) begin
                $error("MAC mismatch: got %0d expected %0d", $signed(result), expected);
                $fatal(1);
            end
        end
    endtask

    initial begin
        // Signed extrema and sums that require more than 32 result bits.
        a0 = -16'sd32768; b0 = -16'sd32768;
        a1 = -16'sd32768; b1 = -16'sd32768;
        a2 = -16'sd32768; b2 = -16'sd32768;
        a3 = -16'sd32768; b3 = -16'sd32768;
        check_case();

        a0 = -16'sd32768; b0 = 16'sd32767;
        a1 = -16'sd32768; b1 = 16'sd32767;
        a2 = -16'sd32768; b2 = 16'sd32767;
        a3 = -16'sd32768; b3 = 16'sd32767;
        check_case();

        // Four shifted Q8.8 products exercise the 16-bit sum wrap.
        a0 = 16'sd32767; b0 = 16'sd2;
        a1 = 16'sd32767; b1 = 16'sd2;
        a2 = 16'sd32767; b2 = 16'sd2;
        a3 = 16'sd32767; b3 = 16'sd2;
        check_case();

        a0 = 16'sd32767; b0 = 16'sd32767;
        a1 = -16'sd32768; b1 = 16'sd32767;
        a2 = 16'sd0; b2 = -16'sd1;
        a3 = -16'sd1; b3 = -16'sd1;
        check_case();

        // Deterministic pseudo-random signed vectors, including all bit patterns.
        for (i = 0; i < 10000; i = i + 1) begin
            random_bits = $urandom; a0 = random_bits[15:0];
            random_bits = $urandom; b0 = random_bits[15:0];
            random_bits = $urandom; a1 = random_bits[15:0];
            random_bits = $urandom; b1 = random_bits[15:0];
            random_bits = $urandom; a2 = random_bits[15:0];
            random_bits = $urandom; b2 = random_bits[15:0];
            random_bits = $urandom; a3 = random_bits[15:0];
            random_bits = $urandom; b3 = random_bits[15:0];
            check_case();
        end

        $display("PASS: 10004 signed int16 MAC vectors with 16-bit wrap");
        $finish;
    end
endmodule
