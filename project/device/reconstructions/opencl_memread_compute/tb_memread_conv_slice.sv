`timescale 1ns/1ps
module tb_memread_conv_slice;
    logic clock;
    initial begin
        clock=1'b0;
        forever #5ns clock=~clock;
    end

    logic resetn, in_valid, first_term, last_term, fc_en, relu_enable;
    logic [16*6*8-1:0] feature_window;
    logic [32*16*6*8-1:0] transformed_weights;
    logic [32*8-1:0] bias;
    logic signed [7:0] frac_w, frac_b, frac_din, frac_dout;
    logic done;
    logic [32*6*8-1:0] result;

    logic signed [7:0] feature_ref [0:15][0:5];
    logic signed [15:0] tx_ref [0:15][0:5];
    logic signed [7:0] weight_ref [0:31][0:15][0:5];
    logic signed [7:0] bias_ref [0:31];
    logic signed [7:0] expected [0:2][0:31][0:5];
    integer id, lane, term, pos, value;
    longint signed accum64;
    logic signed [31:0] mac_ref [0:5];
    logic signed [31:0] y0, y1, y2, y3;
    logic signed [31:0] scaled_acc, scaled_bias, rounded, saturated;
    logic signed [7:0] quantized;
    logic [31:0] rng;

    pipecnn_memread_conv_slice dut (.*);

`ifdef XRUN
    initial begin
`ifndef VCD_TCL
        $shm_open("dut.shm");
        $shm_probe(tb_memread_conv_slice.dut, "AS");
        $dumpfile("dut.vcd");
        $dumpvars(0, tb_memread_conv_slice.dut);
`endif
    end
`endif

    function automatic integer signed sx8(input logic signed [7:0] v);
        sx8={{24{v[7]}},v};
    endfunction
    function automatic longint signed sx64_16(input logic signed [15:0] v);
        sx64_16={{48{v[15]}},v};
    endfunction
    function automatic longint signed sx64_8(input logic signed [7:0] v);
        sx64_8={{56{v[7]}},v};
    endfunction

    task automatic make_vector(input integer vector_id);
        integer d0,d1,d2,d3,d4,d5;
        begin
            fc_en=(vector_id==1);
            relu_enable=(vector_id==2);
            first_term=1'b1;
            last_term=1'b1;
            frac_w=7; frac_b=6; frac_din=5; frac_dout=4;
            for (term=0; term<16; term=term+1)
                for (pos=0; pos<6; pos=pos+1) begin
                    rng=rng*32'd1664525+32'd1013904223;
                    case (vector_id)
                        0: value={{24{rng[7]}},rng[7:0]};
                        1: value=((term+pos)%2 != 0) ? -31 : 27;
                        default: value=(term*3-pos*5)%63-31;
                    endcase
                    feature_ref[term][pos]=8'(value);
                    feature_window[(term*6+pos)*8 +: 8]=8'(value);
                end

            for (lane=0; lane<32; lane=lane+1)
                for (term=0; term<16; term=term+1)
                    for (pos=0; pos<6; pos=pos+1) begin
                        case (vector_id)
                            0: begin
                                rng=rng*32'd1664525+32'd1013904223;
                                weight_ref[lane][term][pos]=$signed(rng[7:0]);
                            end
                            1: weight_ref[lane][term][pos]=((lane+term+pos)%2 != 0) ? -5 : 7;
                            default: weight_ref[lane][term][pos]=8'((lane*3+term-pos)%15-7);
                        endcase
                        transformed_weights[((lane*16+term)*6+pos)*8 +: 8]
                            = weight_ref[lane][term][pos];
                    end

            for (lane=0; lane<32; lane=lane+1) begin
                bias_ref[lane]=8'((lane*19+vector_id*37)%255-127);
                bias[lane*8 +: 8]=bias_ref[lane];
                for (term=0; term<16; term=term+1) begin
                    d0=sx8(feature_ref[term][0]); d1=sx8(feature_ref[term][1]);
                    d2=sx8(feature_ref[term][2]); d3=sx8(feature_ref[term][3]);
                    d4=sx8(feature_ref[term][4]); d5=sx8(feature_ref[term][5]);
                    tx_ref[term][0]=16'(4*d0-5*d2+d4);
                    tx_ref[term][1]=16'(-4*d1-4*d2+d3+d4);
                    tx_ref[term][2]=16'(4*d1-4*d2-d3+d4);
                    tx_ref[term][3]=16'(-2*d1-d2+2*d3+d4);
                    tx_ref[term][4]=16'(2*d1-d2-2*d3+d4);
                    tx_ref[term][5]=16'(4*d1-5*d3+d5);
                end

                for (pos=0; pos<6; pos=pos+1) begin
                    accum64=0;
                    for (term=0; term<16; term=term+1) begin
                        if (fc_en)
                            accum64=accum64+sx64_8(feature_ref[term][pos])*sx64_8(weight_ref[lane][term][pos]);
                        else
                            accum64=accum64+sx64_16(tx_ref[term][pos])*sx64_8(weight_ref[lane][term][pos]);
                    end
                    mac_ref[pos]=accum64[31:0];
                end

                if (!fc_en) begin
                    y0=mac_ref[0]+mac_ref[1]+mac_ref[2]+mac_ref[3]+mac_ref[4];
                    y1=mac_ref[1]-mac_ref[2]+(mac_ref[3]<<<1)-(mac_ref[4]<<<1);
                    y2=mac_ref[1]+mac_ref[2]+(mac_ref[3]<<<2)+(mac_ref[4]<<<2);
                    y3=mac_ref[1]-mac_ref[2]+(mac_ref[3]<<<3)-(mac_ref[4]<<<3)+mac_ref[5];
                    mac_ref[0]=y0; mac_ref[1]=y1; mac_ref[2]=y2; mac_ref[3]=y3;
                    mac_ref[4]=0; mac_ref[5]=0;
                end

                for (pos=0; pos<6; pos=pos+1) begin
                    scaled_acc=mac_ref[pos]>>>7;
                    scaled_bias=sx8(bias_ref[lane])>>>1;
                    rounded=(scaled_acc&32'hffff_fffe)+scaled_bias+1;
                    if (rounded>=256) saturated=127;
                    else if (rounded< -256) saturated=-128;
                    else saturated=rounded>>>1;
                    quantized=saturated[7:0];
                    if (relu_enable && quantized[7])
                        expected[vector_id][lane][pos]=0;
                    else
                        expected[vector_id][lane][pos]=quantized;
                end
            end
        end
    endtask

    task automatic check_vector(input integer vector_id);
        begin
            if (done !== 1'b1)
                $fatal(1, "done missing for vector %0d", vector_id);
            for (lane=0; lane<32; lane=lane+1) begin
                for (pos=0; pos<6; pos=pos+1) begin
                    if ($signed(result[(lane*6+pos)*8 +: 8]) !== expected[vector_id][lane][pos]) begin
                        $fatal(1, "slice mismatch vector=%0d lane=%0d pos=%0d got=%0d exp=%0d",
                            vector_id,lane,pos,$signed(result[(lane*6+pos)*8 +: 8]),expected[vector_id][lane][pos]);
                    end
                end
            end
        end
    endtask

    initial begin
        resetn=1'b0; in_valid=1'b0; first_term=1'b0; last_term=1'b0;
        fc_en=1'b0; relu_enable=1'b0; frac_w=0; frac_b=0; frac_din=0; frac_dout=0;
        feature_window='0; bias='0; rng=32'h47d193af;
        repeat (3) @(negedge clock);
        resetn=1'b1;

        for (id=0; id<3; id=id+1) begin
            @(negedge clock);
            make_vector(id);
            in_valid=1'b1;
            @(negedge clock); in_valid=1'b0;
            repeat (2) @(negedge clock);
            check_vector(id);
        end

        $display("PASS: integrated 32-lane Winograd/FC compute, accumulation and fixed-point output slice");
        $finish;
    end
endmodule
