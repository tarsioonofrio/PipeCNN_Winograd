`timescale 1ns/1ps
module tb;
    logic signed [15:0] a0, b0, a1, b1, a2, b2, a3, b3;
    logic signed [31:0] result;
    longint signed expected;
    logic [31:0] bits;
    integer i;

    mac4_int16 dut (.*);

    task automatic check_case;
        begin
            expected = $signed(longint'(a0)) * $signed(longint'(b0))
                     + $signed(longint'(a1)) * $signed(longint'(b1))
                     + $signed(longint'(a2)) * $signed(longint'(b2))
                     + $signed(longint'(a3)) * $signed(longint'(b3));
            #1ns;
            if (result !== expected[31:0]) begin
                $error("MAC mismatch: got 0x%08x expected 0x%08x", result, expected[31:0]);
                $fatal(1);
            end
        end
    endtask

    initial begin
`ifdef XRUN
        $shm_open("dut.shm");
        $shm_probe(tb.dut, "AS");
        $dumpfile("dut.vcd");
        $dumpvars(0, tb.dut);
`endif
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

        for (i = 0; i < 10000; i = i + 1) begin
            bits = $urandom; a0 = bits[15:0];
            bits = $urandom; b0 = bits[15:0];
            bits = $urandom; a1 = bits[15:0];
            bits = $urandom; b1 = bits[15:0];
            bits = $urandom; a2 = bits[15:0];
            bits = $urandom; b2 = bits[15:0];
            bits = $urandom; a3 = bits[15:0];
            bits = $urandom; b3 = bits[15:0];
            check_case();
        end
        $display("PASS: 10002 signed int16 four-product vectors; 32-bit wrap verified");
        $finish;
    end
endmodule
