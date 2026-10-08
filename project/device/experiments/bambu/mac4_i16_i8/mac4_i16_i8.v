// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-10-07T22:52:57
// Bambu executed with: /tmp/.mount_bambu-pqRxUx/usr/bin/bambu --top-fname=mac4_i16_i8 --output-temporary-directory=/sim/tarsio/hls_bambu_mac4_20261007/attempt4/panda-temp mac4.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************


`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg signed [BITSIZE_in1-1:0] in1_in;
      reg signed [BITSIZE_in2-1:0] in2_in;
      wire signed [BITSIZE_out1-1:0] mult_res;
      reg signed [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ternary_plus_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 + in3;
endmodule

// Datapath RTL description for mac4_i16_i8
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_mac4_i16_i8(clock,
  reset,
  in_port_a0,
  in_port_b0,
  in_port_a1,
  in_port_b1,
  in_port_a2,
  in_port_b2,
  in_port_a3,
  in_port_b3,
  return_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2);
  // IN
  input clock;
  input reset;
  input [15:0] in_port_a0;
  input [7:0] in_port_b0;
  input [15:0] in_port_a1;
  input [7:0] in_port_b1;
  input [15:0] in_port_a2;
  input [7:0] in_port_b2;
  input [15:0] in_port_a3;
  input [7:0] in_port_b3;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  // OUT
  output [31:0] return_port;
  // Component and signal declarations
  wire signed [15:0] out_IIdata_converter_FU_11_i0_fu_mac4_i16_i8_428532_428581;
  wire signed [7:0] out_IIdata_converter_FU_13_i0_fu_mac4_i16_i8_428532_428582;
  wire signed [15:0] out_IIdata_converter_FU_15_i0_fu_mac4_i16_i8_428532_428583;
  wire signed [7:0] out_IIdata_converter_FU_17_i0_fu_mac4_i16_i8_428532_428584;
  wire signed [15:0] out_IIdata_converter_FU_3_i0_fu_mac4_i16_i8_428532_428577;
  wire signed [7:0] out_IIdata_converter_FU_5_i0_fu_mac4_i16_i8_428532_428578;
  wire signed [15:0] out_IIdata_converter_FU_7_i0_fu_mac4_i16_i8_428532_428579;
  wire signed [7:0] out_IIdata_converter_FU_9_i0_fu_mac4_i16_i8_428532_428580;
  wire [31:0] out_IUdata_converter_FU_18_i0_fu_mac4_i16_i8_428532_428707;
  wire signed [15:0] out_UIdata_converter_FU_10_i0_fu_mac4_i16_i8_428532_428694;
  wire signed [7:0] out_UIdata_converter_FU_12_i0_fu_mac4_i16_i8_428532_428697;
  wire signed [15:0] out_UIdata_converter_FU_14_i0_fu_mac4_i16_i8_428532_428700;
  wire signed [7:0] out_UIdata_converter_FU_16_i0_fu_mac4_i16_i8_428532_428703;
  wire signed [15:0] out_UIdata_converter_FU_2_i0_fu_mac4_i16_i8_428532_428682;
  wire signed [7:0] out_UIdata_converter_FU_4_i0_fu_mac4_i16_i8_428532_428685;
  wire signed [15:0] out_UIdata_converter_FU_6_i0_fu_mac4_i16_i8_428532_428688;
  wire signed [7:0] out_UIdata_converter_FU_8_i0_fu_mac4_i16_i8_428532_428691;
  wire signed [23:0] out_mult_expr_FU_16_16_16_0_20_i0_fu_mac4_i16_i8_428532_428585;
  wire signed [23:0] out_mult_expr_FU_16_16_16_0_20_i1_fu_mac4_i16_i8_428532_428586;
  wire signed [23:0] out_mult_expr_FU_16_16_16_0_20_i2_fu_mac4_i16_i8_428532_428587;
  wire signed [23:0] out_mult_expr_FU_16_16_16_0_20_i3_fu_mac4_i16_i8_428532_428588;
  wire signed [24:0] out_plus_expr_FU_32_32_32_21_i0_fu_mac4_i16_i8_428532_428590;
  wire [23:0] out_reg_0_reg_0;
  wire [23:0] out_reg_1_reg_1;
  wire [24:0] out_reg_2_reg_2;
  wire signed [25:0] out_ternary_plus_expr_FU_32_32_32_32_22_i0_fu_mac4_i16_i8_428532_428591;
  
  IIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428577 (.out1(out_IIdata_converter_FU_3_i0_fu_mac4_i16_i8_428532_428577),
    .in1(out_UIdata_converter_FU_2_i0_fu_mac4_i16_i8_428532_428682));
  IIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428578 (.out1(out_IIdata_converter_FU_5_i0_fu_mac4_i16_i8_428532_428578),
    .in1(out_UIdata_converter_FU_4_i0_fu_mac4_i16_i8_428532_428685));
  IIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428579 (.out1(out_IIdata_converter_FU_7_i0_fu_mac4_i16_i8_428532_428579),
    .in1(out_UIdata_converter_FU_6_i0_fu_mac4_i16_i8_428532_428688));
  IIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428580 (.out1(out_IIdata_converter_FU_9_i0_fu_mac4_i16_i8_428532_428580),
    .in1(out_UIdata_converter_FU_8_i0_fu_mac4_i16_i8_428532_428691));
  IIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428581 (.out1(out_IIdata_converter_FU_11_i0_fu_mac4_i16_i8_428532_428581),
    .in1(out_UIdata_converter_FU_10_i0_fu_mac4_i16_i8_428532_428694));
  IIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428582 (.out1(out_IIdata_converter_FU_13_i0_fu_mac4_i16_i8_428532_428582),
    .in1(out_UIdata_converter_FU_12_i0_fu_mac4_i16_i8_428532_428697));
  IIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428583 (.out1(out_IIdata_converter_FU_15_i0_fu_mac4_i16_i8_428532_428583),
    .in1(out_UIdata_converter_FU_14_i0_fu_mac4_i16_i8_428532_428700));
  IIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428584 (.out1(out_IIdata_converter_FU_17_i0_fu_mac4_i16_i8_428532_428584),
    .in1(out_UIdata_converter_FU_16_i0_fu_mac4_i16_i8_428532_428703));
  mult_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(16),
    .BITSIZE_out1(24),
    .PIPE_PARAMETER(0)) fu_mac4_i16_i8_428532_428585 (.out1(out_mult_expr_FU_16_16_16_0_20_i0_fu_mac4_i16_i8_428532_428585),
    .clock(clock),
    .in1(out_IIdata_converter_FU_9_i0_fu_mac4_i16_i8_428532_428580),
    .in2(out_IIdata_converter_FU_7_i0_fu_mac4_i16_i8_428532_428579));
  mult_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(16),
    .BITSIZE_out1(24),
    .PIPE_PARAMETER(0)) fu_mac4_i16_i8_428532_428586 (.out1(out_mult_expr_FU_16_16_16_0_20_i1_fu_mac4_i16_i8_428532_428586),
    .clock(clock),
    .in1(out_IIdata_converter_FU_13_i0_fu_mac4_i16_i8_428532_428582),
    .in2(out_IIdata_converter_FU_11_i0_fu_mac4_i16_i8_428532_428581));
  mult_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(16),
    .BITSIZE_out1(24),
    .PIPE_PARAMETER(0)) fu_mac4_i16_i8_428532_428587 (.out1(out_mult_expr_FU_16_16_16_0_20_i2_fu_mac4_i16_i8_428532_428587),
    .clock(clock),
    .in1(out_IIdata_converter_FU_5_i0_fu_mac4_i16_i8_428532_428578),
    .in2(out_IIdata_converter_FU_3_i0_fu_mac4_i16_i8_428532_428577));
  mult_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(16),
    .BITSIZE_out1(24),
    .PIPE_PARAMETER(0)) fu_mac4_i16_i8_428532_428588 (.out1(out_mult_expr_FU_16_16_16_0_20_i3_fu_mac4_i16_i8_428532_428588),
    .clock(clock),
    .in1(out_IIdata_converter_FU_17_i0_fu_mac4_i16_i8_428532_428584),
    .in2(out_IIdata_converter_FU_15_i0_fu_mac4_i16_i8_428532_428583));
  plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(25)) fu_mac4_i16_i8_428532_428590 (.out1(out_plus_expr_FU_32_32_32_21_i0_fu_mac4_i16_i8_428532_428590),
    .in1(out_mult_expr_FU_16_16_16_0_20_i2_fu_mac4_i16_i8_428532_428587),
    .in2(out_mult_expr_FU_16_16_16_0_20_i3_fu_mac4_i16_i8_428532_428588));
  ternary_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_in3(25),
    .BITSIZE_out1(26)) fu_mac4_i16_i8_428532_428591 (.out1(out_ternary_plus_expr_FU_32_32_32_32_22_i0_fu_mac4_i16_i8_428532_428591),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_1_reg_1),
    .in3(out_reg_2_reg_2));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428682 (.out1(out_UIdata_converter_FU_2_i0_fu_mac4_i16_i8_428532_428682),
    .in1(in_port_a0));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428685 (.out1(out_UIdata_converter_FU_4_i0_fu_mac4_i16_i8_428532_428685),
    .in1(in_port_b0));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428688 (.out1(out_UIdata_converter_FU_6_i0_fu_mac4_i16_i8_428532_428688),
    .in1(in_port_a1));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428691 (.out1(out_UIdata_converter_FU_8_i0_fu_mac4_i16_i8_428532_428691),
    .in1(in_port_b1));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428694 (.out1(out_UIdata_converter_FU_10_i0_fu_mac4_i16_i8_428532_428694),
    .in1(in_port_a2));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428697 (.out1(out_UIdata_converter_FU_12_i0_fu_mac4_i16_i8_428532_428697),
    .in1(in_port_b2));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_mac4_i16_i8_428532_428700 (.out1(out_UIdata_converter_FU_14_i0_fu_mac4_i16_i8_428532_428700),
    .in1(in_port_a3));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_mac4_i16_i8_428532_428703 (.out1(out_UIdata_converter_FU_16_i0_fu_mac4_i16_i8_428532_428703),
    .in1(in_port_b3));
  IUdata_converter_FU #(.BITSIZE_in1(26),
    .BITSIZE_out1(32)) fu_mac4_i16_i8_428532_428707 (.out1(out_IUdata_converter_FU_18_i0_fu_mac4_i16_i8_428532_428707),
    .in1(out_ternary_plus_expr_FU_32_32_32_32_22_i0_fu_mac4_i16_i8_428532_428591));
  register_STD #(.BITSIZE_in1(24),
    .BITSIZE_out1(24)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_16_16_16_0_20_i0_fu_mac4_i16_i8_428532_428585),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(24),
    .BITSIZE_out1(24)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_16_16_16_0_20_i1_fu_mac4_i16_i8_428532_428586),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(25),
    .BITSIZE_out1(25)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_21_i0_fu_mac4_i16_i8_428532_428590),
    .wenable(wrenable_reg_2));
  // io-signal post fix
  assign return_port = out_IUdata_converter_FU_18_i0_fu_mac4_i16_i8_428532_428707;

endmodule

// FSM based controller description for mac4_i16_i8
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_mac4_i16_i8(done_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  parameter [1:0] S_0 = 2'b01,
    S_1 = 2'b10;
  reg [1:0] _present_state=S_0, _next_state;
  reg done_port;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          _next_state = S_1;
          done_port = 1'b1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock or negedge reset)
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for mac4_i16_i8
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _mac4_i16_i8(clock,
  reset,
  start_port,
  done_port,
  a0,
  b0,
  a1,
  b1,
  a2,
  b2,
  a3,
  b3,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [15:0] a0;
  input [7:0] b0;
  input [15:0] a1;
  input [7:0] b1;
  input [15:0] a2;
  input [7:0] b2;
  input [15:0] a3;
  input [7:0] b3;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  
  controller_mac4_i16_i8 Controller_i (.done_port(done_delayed_REG_signal_in),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_mac4_i16_i8 Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a0(a0),
    .in_port_b0(b0),
    .in_port_a1(a1),
    .in_port_b1(b1),
    .in_port_a2(a2),
    .in_port_b2(b2),
    .in_port_a3(a3),
    .in_port_b3(b3),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: mac4_i16_i8
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module mac4_i16_i8(clock,
  reset,
  start_port,
  a0,
  b0,
  a1,
  b1,
  a2,
  b2,
  a3,
  b3,
  done_port,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [15:0] a0;
  input [7:0] b0;
  input [15:0] a1;
  input [7:0] b1;
  input [15:0] a2;
  input [7:0] b2;
  input [15:0] a3;
  input [7:0] b3;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire [31:0] out_return_port_ui_view_convert_expr_FU;
  
  _mac4_i16_i8 _mac4_i16_i8_i0 (.done_port(done_port),
    .return_port(out_return_port_ui_view_convert_expr_FU),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .a0(a0),
    .b0(b0),
    .a1(a1),
    .b1(b1),
    .a2(a2),
    .b2(b2),
    .a3(a3),
    .b3(b3));
  ui_view_convert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) return_port_ui_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_ui_view_convert_expr_FU));

endmodule


