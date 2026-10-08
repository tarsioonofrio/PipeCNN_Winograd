`timescale 1ns/1ps
module tb_transforms;
    logic signed [15:0] d0, d1, d2, d3, d4, d5;
    logic signed [15:0] u0, u1, u2, u3, u4, u5;
    logic signed [31:0] m0, m1, m2, m3, m4, m5;
    logic signed [31:0] y0, y1, y2, y3;

    integer vectors;
    integer i;
    logic [31:0] prng;
    longint signed r0, r1, r2, r3, r4, r5;
    longint signed q0, q1, q2, q3;
    longint signed sd0, sd1, sd2, sd3, sd4, sd5;
    longint signed sm0, sm1, sm2, sm3, sm4, sm5;
    logic signed [15:0] er0, er1, er2, er3, er4, er5;
    logic signed [31:0] eq0, eq1, eq2, eq3;

    winograd_f43_input_transform input_transform (.*);
    winograd_f43_output_transform output_transform (.*);

    task automatic check;
        begin
            #1ns;
            sd0 = {{48{d0[15]}},d0}; sd1 = {{48{d1[15]}},d1};
            sd2 = {{48{d2[15]}},d2}; sd3 = {{48{d3[15]}},d3};
            sd4 = {{48{d4[15]}},d4}; sd5 = {{48{d5[15]}},d5};
            sm0 = {{32{m0[31]}},m0}; sm1 = {{32{m1[31]}},m1};
            sm2 = {{32{m2[31]}},m2}; sm3 = {{32{m3[31]}},m3};
            sm4 = {{32{m4[31]}},m4}; sm5 = {{32{m5[31]}},m5};

            r0 = 4*sd0 - 5*sd2 + sd4;
            r1 = -4*sd1 - 4*sd2 + sd3 + sd4;
            r2 = 4*sd1 - 4*sd2 - sd3 + sd4;
            r3 = -2*sd1 - sd2 + 2*sd3 + sd4;
            r4 = 2*sd1 - sd2 - 2*sd3 + sd4;
            r5 = 4*sd1 - 5*sd3 + sd5;
            er0 = r0[15:0]; er1 = r1[15:0]; er2 = r2[15:0];
            er3 = r3[15:0]; er4 = r4[15:0]; er5 = r5[15:0];

            q0 = sm0 + sm1 + sm2 + sm3 + sm4;
            q1 = sm1 - sm2 + 2*sm3 - 2*sm4;
            q2 = sm1 + sm2 + 4*sm3 + 4*sm4;
            q3 = sm1 - sm2 + 8*sm3 - 8*sm4 + sm5;
            eq0 = q0[31:0]; eq1 = q1[31:0]; eq2 = q2[31:0]; eq3 = q3[31:0];

            if ({u0,u1,u2,u3,u4,u5} !== {er0,er1,er2,er3,er4,er5})
                $fatal(1, "BT*d mismatch vector=%0d got=%h expected=%h", vectors,
                    {u0,u1,u2,u3,u4,u5}, {er0,er1,er2,er3,er4,er5});
            if ({y0,y1,y2,y3} !== {eq0,eq1,eq2,eq3})
                $fatal(1, "A^T*m mismatch vector=%0d got=%h expected=%h", vectors,
                    {y0,y1,y2,y3}, {eq0,eq1,eq2,eq3});
            vectors = vectors + 1;
        end
    endtask

    initial begin
        vectors = 0;
        prng = 32'h6d2b79f5;
        d0=0; d1=0; d2=0; d3=0; d4=0; d5=0;
        m0=0; m1=0; m2=0; m3=0; m4=0; m5=0;
        check();

        d0=-16'sd32768; d1=16'sd32767; d2=-16'sd1;
        d3=16'sd1; d4=-16'sd32768; d5=16'sd32767;
        m0=32'sh7fffffff; m1=32'sh80000000; m2=32'sh7fffffff;
        m3=32'sh80000000; m4=32'sh7fffffff; m5=32'sh80000000;
        check();

        for (i=0; i<1000; i=i+1) begin
            prng = prng * 32'd1664525 + 32'd1013904223; d0=prng[15:0];
            prng = prng * 32'd1664525 + 32'd1013904223; d1=prng[15:0];
            prng = prng * 32'd1664525 + 32'd1013904223; d2=prng[15:0];
            prng = prng * 32'd1664525 + 32'd1013904223; d3=prng[15:0];
            prng = prng * 32'd1664525 + 32'd1013904223; d4=prng[15:0];
            prng = prng * 32'd1664525 + 32'd1013904223; d5=prng[15:0];
            prng = prng * 32'd1664525 + 32'd1013904223; m0=prng;
            prng = prng * 32'd1664525 + 32'd1013904223; m1=prng;
            prng = prng * 32'd1664525 + 32'd1013904223; m2=prng;
            prng = prng * 32'd1664525 + 32'd1013904223; m3=prng;
            prng = prng * 32'd1664525 + 32'd1013904223; m4=prng;
            prng = prng * 32'd1664525 + 32'd1013904223; m5=prng;
            check();
        end

        $display("PASS: %0d F(4,3) transform vectors; 16/32-bit wrap checked", vectors);
        $finish;
    end
endmodule
