`timescale 1ns/1ps
module tb;
    logic clock = 1'b0;
    always #5 clock = ~clock;

    logic resetn = 1'b0;
    logic ivalid = 1'b0;
    logic iready = 1'b0;
    logic signed [15:0] dataa_0, dataa_1, dataa_2, dataa_3;
    logic signed [7:0] datab_0, datab_1, datab_2, datab_3;
    wire ovalid, oready;
    wire [31:0] result;

    integer expected [0:127];
    integer cycle = 0;
    integer checked = 0;
    integer i;

    mult_add_fix8bx16bx4 dut (.*);

    function automatic integer dot4(
        input logic signed [15:0] aa0, input logic signed [7:0] bb0,
        input logic signed [15:0] aa1, input logic signed [7:0] bb1,
        input logic signed [15:0] aa2, input logic signed [7:0] bb2,
        input logic signed [15:0] aa3, input logic signed [7:0] bb3
    );
        reg signed [31:0] x0, x1, x2, x3;
        reg signed [31:0] y0, y1, y2, y3;
        begin
            x0 = {{16{aa0[15]}}, aa0}; x1 = {{16{aa1[15]}}, aa1};
            x2 = {{16{aa2[15]}}, aa2}; x3 = {{16{aa3[15]}}, aa3};
            y0 = {{24{bb0[7]}}, bb0}; y1 = {{24{bb1[7]}}, bb1};
            y2 = {{24{bb2[7]}}, bb2}; y3 = {{24{bb3[7]}}, bb3};
            dot4 = x0*y0 + x1*y1 + x2*y2 + x3*y3;
        end
    endfunction

    always @(posedge clock) begin
        cycle = cycle + 1;
        expected[cycle] = dot4(dataa_0,datab_0,dataa_1,datab_1,
                               dataa_2,datab_2,dataa_3,datab_3);
        #1;
        if (cycle >= 2) begin
            if (result !== expected[cycle-1]) begin
                $display("FAIL cycle=%0d result=%0d expected_prev=%0d",
                         cycle, $signed(result), expected[cycle-1]);
                $fatal(1, "MAC arithmetic or pipeline mismatch");
            end
            checked = checked + 1;
        end
    end

    initial begin
        dataa_0=0; dataa_1=0; dataa_2=0; dataa_3=0;
        datab_0=0; datab_1=0; datab_2=0; datab_3=0;
        repeat (3) @(negedge clock);
        for (i=0; i<32; i=i+1) begin
            @(negedge clock);
            ivalid = (i % 3) != 0;
            iready = (i % 4) != 0;
            case (i)
                0: begin
                    dataa_0=-32768; dataa_1=-32768;
                    dataa_2=-32768; dataa_3=-32768;
                    datab_0=-128; datab_1=-128;
                    datab_2=-128; datab_3=-128;
                end
                1: begin
                    dataa_0=32767; dataa_1=32767;
                    dataa_2=32767; dataa_3=32767;
                    datab_0=127; datab_1=127;
                    datab_2=127; datab_3=127;
                end
                2: begin
                    dataa_0=-32768; dataa_1=32767;
                    dataa_2=-32768; dataa_3=32767;
                    datab_0=127; datab_1=-128;
                    datab_2=-128; datab_3=127;
                end
                3: begin
                    dataa_0=-32768; dataa_1=32767;
                    dataa_2=0; dataa_3=1;
                    datab_0=127; datab_1=127;
                    datab_2=-128; datab_3=-1;
                end
                default: begin
                    dataa_0=16'(i*907-14000); dataa_1=16'(16000-i*613);
                    dataa_2=16'(i*311-4000); dataa_3=16'(8000-i*157);
                    datab_0=8'(i%17-8); datab_1=8'(11-i%19);
                    datab_2=8'(i%23-11); datab_3=8'(9-i%13);
                end
            endcase
        end
        @(negedge clock);
        dataa_0=0; dataa_1=0; dataa_2=0; dataa_3=0;
        datab_0=0; datab_1=0; datab_2=0; datab_3=0;
        repeat (4) @(negedge clock);
        if (checked < 32) $fatal(1, "Too few output checks: %0d", checked);
        if (ovalid !== 1'b1 || oready !== 1'b1)
            $fatal(1, "MAC handshake outputs changed");
        $display("PASS checks=%0d vectors=32 latency=2 registered stages", checked);
        $finish;
    end
endmodule
