`timescale 1ns/1ps
module tb_accumulator_postprocess;
    logic clock;
    initial begin
        clock=1'b0;
        forever #5ns clock=~clock;
    end

    logic resetn, in_valid, first_term, last_term;
    logic [32*6*32-1:0] conv_term;
    logic [32*8-1:0] bias;
    logic signed [7:0] frac_w, frac_b, frac_din, frac_dout;
    logic relu_enable, done;
    logic [32*6*8-1:0] result;
    logic signed [31:0] term_ref [0:3][0:31][0:5];
    logic signed [7:0] bias_ref [0:31];
    logic signed [7:0] expected [0:31][0:5];
    logic [31:0] rng;
    integer set_id, iteration, lane, pos;
    longint signed sum64;
    logic signed [31:0] sum32;
    logic signed [7:0] scaled_byte;
    logic signed [31:0] scaled_acc_ref, scaled_bias_ref, rounded_ref, saturated_ref;
    integer shift_ref, bias_delta_ref;

    pipecnn_conv_accumulator_postprocess dut (.*);

    function automatic logic signed [7:0] sx8(input logic [7:0] v);
        sx8 = $signed(v);
    endfunction

    task automatic make_case(input integer id);
        begin
            case (id % 22)
                0: begin frac_w=14; frac_b=7; frac_din=-1; frac_dout=4; end
                1: begin frac_w=7; frac_b=6; frac_din=4; frac_dout=4; end
                2: begin frac_w=8; frac_b=6; frac_din=4; frac_dout=5; end
                3: begin frac_w=6; frac_b=6; frac_din=5; frac_dout=5; end
                4,5: begin frac_w=8; frac_b=6; frac_din=5; frac_dout=5; end
                6: begin frac_w=7; frac_b=7; frac_din=5; frac_dout=5; end
                7,8: begin frac_w=9; frac_b=7; frac_din=5; frac_dout=5; end
                9: begin frac_w=6; frac_b=7; frac_din=5; frac_dout=5; end
                10: begin frac_w=8; frac_b=6; frac_din=5; frac_dout=5; end
                11: begin frac_w=6; frac_b=7; frac_din=5; frac_dout=6; end
                12: begin frac_w=9; frac_b=7; frac_din=6; frac_dout=6; end
                13: begin frac_w=9; frac_b=7; frac_din=6; frac_dout=5; end
                14: begin frac_w=6; frac_b=8; frac_din=5; frac_dout=5; end
                15: begin frac_w=9; frac_b=7; frac_din=5; frac_dout=7; end
                16: begin frac_w=6; frac_b=7; frac_din=7; frac_dout=6; end
                17: begin frac_w=6; frac_b=6; frac_din=6; frac_dout=4; end
                18: begin frac_w=9; frac_b=8; frac_din=4; frac_dout=5; end
                19: begin frac_w=9; frac_b=7; frac_din=5; frac_dout=6; end
                20: begin frac_w=8; frac_b=6; frac_din=6; frac_dout=5; end
                default: begin frac_w=7; frac_b=4; frac_din=5; frac_dout=3; end
            endcase
            relu_enable=(id % 2) != 0;
            for (lane=0; lane<32; lane=lane+1) begin
                rng=rng*32'd1664525+32'd1013904223;
                bias_ref[lane]=rng[7:0];
                bias[lane*8 +: 8]=rng[7:0];
                for (pos=0; pos<6; pos=pos+1)
                    for (iteration=0; iteration<4; iteration=iteration+1) begin
                        rng=rng*32'd1664525+32'd1013904223;
                        term_ref[iteration][lane][pos]=rng;
                    end
            end

            for (lane=0; lane<32; lane=lane+1)
                for (pos=0; pos<6; pos=pos+1) begin
                    sum64=0;
                    for (iteration=0; iteration<4; iteration=iteration+1)
                        sum64=sum64+{{32{term_ref[iteration][lane][pos][31]}}, term_ref[iteration][lane][pos]};
                    sum32=sum64[31:0];

                    shift_ref=int'(frac_w)+int'(frac_din)-int'(frac_dout)-1;
                    bias_delta_ref=int'(frac_b)-int'(frac_dout);
                    if (shift_ref>=0)
                        scaled_acc_ref=sum32>>>shift_ref;
                    else
                        scaled_acc_ref=sum32<<<(-shift_ref);
                    if (bias_delta_ref>1)
                        scaled_bias_ref=$signed({{24{bias_ref[lane][7]}},bias_ref[lane]})>>>(bias_delta_ref-1);
                    else
                        scaled_bias_ref=$signed({{24{bias_ref[lane][7]}},bias_ref[lane]})<<<(1-bias_delta_ref);
                    rounded_ref=(scaled_acc_ref&32'hffff_fffe)+scaled_bias_ref+1;
                    if (rounded_ref>=256)
                        saturated_ref=127;
                    else if (rounded_ref< -256)
                        saturated_ref=-128;
                    else
                        saturated_ref=rounded_ref>>>1;
                    scaled_byte=saturated_ref[7:0];
                    if (relu_enable && scaled_byte[7])
                        expected[lane][pos]=0;
                    else
                        expected[lane][pos]=scaled_byte;
                end
        end
    endtask

    task automatic send_term(input integer iter);
        begin
            for (lane=0; lane<32; lane=lane+1)
                for (pos=0; pos<6; pos=pos+1)
                    conv_term[(lane*6+pos)*32 +: 32]=term_ref[iter][lane][pos];
            in_valid=1'b1;
            first_term=(iter==0);
            last_term=(iter==3);
            @(negedge clock);
        end
    endtask

    task automatic check_output(input integer id);
        begin
            if (done !== 1'b1)
                $fatal(1, "done missing for case %0d", id);
            for (lane=0; lane<32; lane=lane+1)
                for (pos=0; pos<6; pos=pos+1)
                    if ($signed(result[(lane*6+pos)*8 +: 8]) !== expected[lane][pos])
                        $fatal(1, "postprocess mismatch case=%0d lane=%0d pos=%0d got=%0d exp=%0d",
                            id, lane, pos, $signed(result[(lane*6+pos)*8 +: 8]), expected[lane][pos]);
        end
    endtask

    initial begin
        resetn=1'b0; in_valid=1'b0; first_term=1'b0; last_term=1'b0;
        frac_w=0; frac_b=0; frac_din=0; frac_dout=0; relu_enable=0;
        conv_term='0; bias='0; rng=32'h87c32a51;
        repeat (3) @(negedge clock);
        resetn=1'b1;

        for (set_id=0; set_id<22; set_id=set_id+1) begin
            make_case(set_id);
            for (iteration=0; iteration<4; iteration=iteration+1)
                send_term(iteration);
            in_valid=1'b0; first_term=1'b0; last_term=1'b0;
            check_output(set_id);
            @(negedge clock);
        end

        $display("PASS: accumulation/postprocess for all 22 configured fraction tuples x 32 lanes x 6 positions");
        $finish;
    end
endmodule
