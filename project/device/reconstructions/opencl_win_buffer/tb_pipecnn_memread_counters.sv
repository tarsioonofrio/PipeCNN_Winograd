`timescale 1ns/1ps
module tb_pipecnn_memread_counters;
    localparam int WIN=4, GROUP_X=4, GROUP_Y=1, OUT_Z=2;
    logic clock, resetn, step;
    logic [15:0] win_size, win_size_y, weight_dim3;
    logic [15:0] weight_dim4_div_lane;
    logic [15:0] group_num_x, group_num_y;
    logic [7:0] group_size_x, stride, weight_dim1, conv_row_rem;
    logic [31:0] conv_loop_cnt;
    logic [31:0] group_num_mul_win_size;
    logic [15:0] gp_num_x, gp_num_y, out_idx_z, win_itm_xyz;
    logic [15:0] win_itm_y, win_itm_z;
    logic [1:0] flag;
    logic read8_flag;
    logic [31:0] conv_z_cnt, iteration_index;
    logic done;
    logic gp_num_x_is_one, weight_load_en;
    logic [15:0] weight_load_index;
    logic [31:0] weight_global_address;
    logic [15:0] feature_x, feature_y, feature_z;
    logic [15:0] address_x, address_y, address_z;
    logic [15:0] address_dim1, address_dim2;
    logic [31:0] address_dim1xdim2, rd_prt;
    logic [7:0] address_padding;
    logic zero_fill;
    integer i, group_index, expected_x;
    logic [15:0] expected_y, expected_z;
    integer expected_item, expected_output_z, expected_flag;
    integer expected_conv_z;

    always #5 clock=~clock;

    pipecnn_memread_counters #(.INDEX_W(32),.COUNTER_W(16),.VEC_SIZE(16)) dut (.*);

    pipecnn_memread_address address_unit (
        .feature_x(address_x), .feature_y(address_y), .feature_z(address_z),
        .data_dim1(address_dim1), .data_dim2(address_dim2),
        .data_dim1xdim2(address_dim1xdim2), .padding(address_padding),
        .rd_prt, .zero_fill
    );

    task automatic check_iteration(input integer ordinal);
        begin
            group_index=ordinal/WIN;
            expected_item=ordinal%WIN;
            expected_x=group_index%GROUP_X;
            expected_output_z=(group_index/(GROUP_X*GROUP_Y))%OUT_Z;
            expected_y=16'(expected_item%2);
            expected_z=16'(expected_item/2);
            expected_flag=group_index%3;
            expected_conv_z=0;
            for (integer k=1;k<ordinal+1;k=k+1) begin
                if (expected_conv_z==conv_loop_cnt-1)
                    expected_conv_z=0;
                else if (k>2*WIN && ((k-1)/WIN)%GROUP_X!=1)
                    expected_conv_z=expected_conv_z+1;
            end

            if (iteration_index !== 32'(ordinal+1)
                || gp_num_x !== 16'(expected_x)
                || gp_num_y !== 16'(0)
                || out_idx_z !== 16'(expected_output_z)
                || win_itm_xyz !== 16'(expected_item)
                || win_itm_y !== 16'(expected_y)
                || win_itm_z !== 16'(expected_z)
                || flag !== 2'(expected_flag)
                || gp_num_x_is_one !== (expected_x==1)
                || read8_flag !== (expected_x==1)
                || weight_load_en !== (expected_x==2)
                || weight_load_index !== 16'(expected_item)
                || weight_global_address !== 32'(expected_output_z*WIN+expected_item)
                || feature_x !== 16'(expected_x*2)
                || feature_y !== 16'(expected_y)
                || feature_z !== 16'(expected_z)
                || conv_z_cnt !== 32'(expected_conv_z)) begin
                $error("counter mismatch at source iteration %0d",ordinal+1);
                $display("x=%0d y=%0d outz=%0d item=%0d flag=%0d read8=%b load=%b addr=%0d convz=%0d",
                         gp_num_x,gp_num_y,out_idx_z,win_itm_xyz,flag,read8_flag,
                         weight_load_en,weight_global_address,conv_z_cnt);
                $display("expected x=%0d y=%0d outz=%0d item=%0d flag=%0d addr=%0d convz=%0d",
                         expected_x,0,expected_output_z,expected_item,expected_flag,
                         expected_output_z*WIN+expected_item,expected_conv_z);
                $fatal(1);
            end
        end
    endtask

    initial begin
        clock=0; resetn=0; step=0;
        win_size=16'(WIN); win_size_y=16'd2; weight_dim3=16'd32;
        weight_dim4_div_lane=16'(OUT_Z);
        group_num_x=16'(GROUP_X); group_num_y=16'(GROUP_Y);
        group_size_x=8'd2; stride=8'd1; weight_dim1=8'd3;
        conv_row_rem=8'd1; conv_loop_cnt=32'd2;
        group_num_mul_win_size=32'd20;
        address_x=0; address_y=0; address_z=0;
        address_dim1=16'd32; address_dim2=16'd4;
        address_dim1xdim2=32'd128; address_padding=8'd1;
        repeat (3) @(negedge clock);
        resetn=1;
        for (i=0;i<20;i=i+1) begin
            @(negedge clock);
            check_iteration(i);
            step=1;
            @(negedge clock);
            step=0;
        end
        if (done !== 1'b1 || iteration_index !== 32'd21) begin
            $error("counter did not stop at group_num_mul_win_size");
            $fatal(1);
        end
        address_x=16'd8; address_y=16'd0; address_z=16'd1; #1;
        if (rd_prt !== 32'd26 || zero_fill !== 1'b1) begin
            $error("top-padding address mismatch: addr=%0d zero_fill=%b",rd_prt,zero_fill);
            $fatal(1);
        end
        address_x=16'd4; address_y=16'd1; address_z=16'd0; #1;
        if (rd_prt !== 32'd1 || zero_fill !== 1'b0) begin
            $error("valid-row address mismatch: addr=%0d zero_fill=%b",rd_prt,zero_fill);
            $fatal(1);
        end
        address_x=16'd12; address_y=16'd5; address_z=16'd0; #1;
        if (rd_prt !== 32'd35 || zero_fill !== 1'b1) begin
            $error("bottom-padding address mismatch: addr=%0d zero_fill=%b",rd_prt,zero_fill);
            $fatal(1);
        end
        $display("PASS: memRead counters (20 iterations), loop termination, memory address and y-padding");
        $finish;
    end

    initial begin
        #5000;
        $fatal(1,"timeout");
    end
endmodule
