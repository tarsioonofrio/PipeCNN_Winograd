-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from bb_memRead_B4
-- VHDL created on Thu Oct  8 10:49:42 2026


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity bb_memRead_B4 is
    port (
        in_c0_exit9673_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_18 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exit9673_0_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_20 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_21 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_22 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_23 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_24 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_25 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_26 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exit9673_0_27 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_28 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_29 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_30 : in std_logic_vector(0 downto 0);  -- ufix1
        in_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_bottom : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe109776_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe119788_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1297910_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1398012_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1498114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1598216_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1698318_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1798420_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1898522_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe1998624_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2098726_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2198828_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2298930_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2399032_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2499134_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2599236_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2699338_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe2799440_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2899541_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe3099742_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe79744_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_col_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_control : in std_logic_vector(7 downto 0);  -- ufix8
        in_conv_loop_cnt : in std_logic_vector(31 downto 0);  -- ufix32
        in_conv_row_rem : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_dim1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_dim1xdim2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_dim2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_fc_en : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_b : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_din : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_dout : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_w : in std_logic_vector(7 downto 0);  -- ufix8
        in_group_num_mul_win_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_group_num_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_group_num_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_line_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_memdep_phi122_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_padding : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_size : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_stride : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_weight_dim1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_weight_dim3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_weight_dim4_div_lane : in std_logic_vector(15 downto 0);  -- ufix16
        in_weights : in std_logic_vector(63 downto 0);  -- ufix64
        in_win_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_win_size_y : in std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit1008_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1008_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit1020_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit1020_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exit1032_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit1032_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c3_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c4_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c4_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c5_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c5_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe109776 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe119788 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1297910 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1398012 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1498114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1598216 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1698318 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1798420 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1898522 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe1998624 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2098726 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2198828 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2298930 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2399032 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2499134 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2599236 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2699338 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe2799440 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi122 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_memRead_B4;

architecture normal of bb_memRead_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component memRead_B4_branch is
        port (
            in_c0_exit1008_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1008_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit1020_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1020_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exit1032_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit1032_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c3_exit_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exit_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c4_exit_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c4_exit_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c5_exit_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c5_exit_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe109776 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe119788 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1297910 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1398012 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1498114 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1598216 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1698318 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1798420 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1898522 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe1998624 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2098726 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2198828 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2298930 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2399032 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2499134 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2599236 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2699338 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe2799440 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe29996 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi122 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1008_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1008_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit1020_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit1020_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exit1032_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit1032_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c3_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c4_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c4_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c5_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c5_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe109776 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe119788 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1297910 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1398012 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1498114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1598216 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1698318 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1798420 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1898522 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe1998624 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2098726 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2198828 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2298930 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2399032 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2499134 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2599236 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2699338 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe2799440 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi122 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memRead_B4_merge is
        port (
            in_c0_exit9673_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_0_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_0_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_0_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_0_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_0_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_0_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_0_18 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exit9673_0_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_26 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exit9673_0_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_0_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe109776_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe119788_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1297910_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1398012_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1498114_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1598216_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1698318_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1798420_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1898522_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe1998624_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2098726_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2198828_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2298930_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2399032_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2499134_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2599236_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2699338_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe2799440_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2899541_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe3099742_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe79744_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_phi122_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit9673_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit9673_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit9673_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit9673_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit9673_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit9673_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit9673_18 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit9673_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_26 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit9673_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit9673_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe109776 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe119788 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1297910 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1398012 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1498114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1598216 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1698318 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1798420 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1898522 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe1998624 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2098726 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2198828 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2298930 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2399032 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2499134 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2599236 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2699338 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe2799440 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2899541 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3099742 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe79744 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_phi122 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_memRead_B4_stall_region is
        port (
            in_c0_exit9673_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit9673_18 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exit9673_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_26 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exit9673_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit9673_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe109776 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe119788 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1297910 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1398012 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1498114 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1598216 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1698318 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1798420 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1898522 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe1998624 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2098726 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2198828 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2298930 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2399032 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2499134 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2599236 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2699338 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe2799440 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2899541 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe3099742 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe79744 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_phi122 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1008_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1008_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit1020_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit1020_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exit1032_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit1032_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c3_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c4_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c4_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c5_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c5_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe109776 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe119788 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1297910 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1398012 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1498114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1598216 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1698318 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1798420 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1898522 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe1998624 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2098726 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2198828 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2298930 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2399032 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2499134 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2599236 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2699338 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe2799440 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe29996 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi122 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal memRead_B4_branch_aunroll_x_out_c0_exit1008_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exit1008_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c1_exit1020_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c1_exit1020_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c2_exit1032_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c2_exit1032_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c3_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c3_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c4_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c4_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c5_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c5_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe109776 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe119788 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1297910 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1398012 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1498114 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1598216 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1698318 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1798420 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1898522 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe1998624 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2098726 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2198828 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2298930 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2399032 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2499134 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2599236 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2699338 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B4_branch_aunroll_x_out_c0_exe2799440 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_memdep_phi122 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_26 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exit9673_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe109776 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe119788 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1297910 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1398012 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1498114 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1598216 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1698318 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1798420 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1898522 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe1998624 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2098726 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2198828 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2298930 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2399032 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2499134 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2599236 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2699338 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2799440 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe2899541 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe3099742 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_c0_exe79744 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B4_merge_aunroll_x_out_memdep_phi122 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exit1008_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exit1008_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c1_exit1020_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c1_exit1020_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c2_exit1032_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c2_exit1032_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c3_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c3_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c4_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c4_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c5_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c5_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe109776 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe119788 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1297910 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1398012 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1498114 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1598216 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1698318 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1798420 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1898522 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe1998624 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2098726 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2198828 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2298930 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2399032 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2499134 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2599236 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2699338 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe2799440 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_c0_exe29996 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_memdep_phi122 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- memRead_B4_merge_aunroll_x(BLACKBOX,86)
    thememRead_B4_merge_aunroll_x : memRead_B4_merge
    PORT MAP (
        in_c0_exit9673_0_0 => in_c0_exit9673_0_0,
        in_c0_exit9673_0_1 => in_c0_exit9673_0_1,
        in_c0_exit9673_0_2 => in_c0_exit9673_0_2,
        in_c0_exit9673_0_3 => in_c0_exit9673_0_3,
        in_c0_exit9673_0_4 => in_c0_exit9673_0_4,
        in_c0_exit9673_0_5 => in_c0_exit9673_0_5,
        in_c0_exit9673_0_6 => in_c0_exit9673_0_6,
        in_c0_exit9673_0_7 => in_c0_exit9673_0_7,
        in_c0_exit9673_0_8 => in_c0_exit9673_0_8,
        in_c0_exit9673_0_9 => in_c0_exit9673_0_9,
        in_c0_exit9673_0_10 => in_c0_exit9673_0_10,
        in_c0_exit9673_0_11 => in_c0_exit9673_0_11,
        in_c0_exit9673_0_12 => in_c0_exit9673_0_12,
        in_c0_exit9673_0_13 => in_c0_exit9673_0_13,
        in_c0_exit9673_0_14 => in_c0_exit9673_0_14,
        in_c0_exit9673_0_15 => in_c0_exit9673_0_15,
        in_c0_exit9673_0_16 => in_c0_exit9673_0_16,
        in_c0_exit9673_0_17 => in_c0_exit9673_0_17,
        in_c0_exit9673_0_18 => in_c0_exit9673_0_18,
        in_c0_exit9673_0_19 => in_c0_exit9673_0_19,
        in_c0_exit9673_0_20 => in_c0_exit9673_0_20,
        in_c0_exit9673_0_21 => in_c0_exit9673_0_21,
        in_c0_exit9673_0_22 => in_c0_exit9673_0_22,
        in_c0_exit9673_0_23 => in_c0_exit9673_0_23,
        in_c0_exit9673_0_24 => in_c0_exit9673_0_24,
        in_c0_exit9673_0_25 => in_c0_exit9673_0_25,
        in_c0_exit9673_0_26 => in_c0_exit9673_0_26,
        in_c0_exit9673_0_27 => in_c0_exit9673_0_27,
        in_c0_exit9673_0_28 => in_c0_exit9673_0_28,
        in_c0_exit9673_0_29 => in_c0_exit9673_0_29,
        in_c0_exit9673_0_30 => in_c0_exit9673_0_30,
        in_c0_exe109776_0 => in_c0_exe109776_0,
        in_c0_exe119788_0 => in_c0_exe119788_0,
        in_c0_exe1297910_0 => in_c0_exe1297910_0,
        in_c0_exe1398012_0 => in_c0_exe1398012_0,
        in_c0_exe1498114_0 => in_c0_exe1498114_0,
        in_c0_exe1598216_0 => in_c0_exe1598216_0,
        in_c0_exe1698318_0 => in_c0_exe1698318_0,
        in_c0_exe1798420_0 => in_c0_exe1798420_0,
        in_c0_exe1898522_0 => in_c0_exe1898522_0,
        in_c0_exe1998624_0 => in_c0_exe1998624_0,
        in_c0_exe2098726_0 => in_c0_exe2098726_0,
        in_c0_exe2198828_0 => in_c0_exe2198828_0,
        in_c0_exe2298930_0 => in_c0_exe2298930_0,
        in_c0_exe2399032_0 => in_c0_exe2399032_0,
        in_c0_exe2499134_0 => in_c0_exe2499134_0,
        in_c0_exe2599236_0 => in_c0_exe2599236_0,
        in_c0_exe2699338_0 => in_c0_exe2699338_0,
        in_c0_exe2799440_0 => in_c0_exe2799440_0,
        in_c0_exe2899541_0 => in_c0_exe2899541_0,
        in_c0_exe3099742_0 => in_c0_exe3099742_0,
        in_c0_exe79744_0 => in_c0_exe79744_0,
        in_memdep_phi122_0 => in_memdep_phi122_0,
        in_stall_in => bb_memRead_B4_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit9673_0 => memRead_B4_merge_aunroll_x_out_c0_exit9673_0,
        out_c0_exit9673_1 => memRead_B4_merge_aunroll_x_out_c0_exit9673_1,
        out_c0_exit9673_2 => memRead_B4_merge_aunroll_x_out_c0_exit9673_2,
        out_c0_exit9673_3 => memRead_B4_merge_aunroll_x_out_c0_exit9673_3,
        out_c0_exit9673_4 => memRead_B4_merge_aunroll_x_out_c0_exit9673_4,
        out_c0_exit9673_5 => memRead_B4_merge_aunroll_x_out_c0_exit9673_5,
        out_c0_exit9673_6 => memRead_B4_merge_aunroll_x_out_c0_exit9673_6,
        out_c0_exit9673_7 => memRead_B4_merge_aunroll_x_out_c0_exit9673_7,
        out_c0_exit9673_8 => memRead_B4_merge_aunroll_x_out_c0_exit9673_8,
        out_c0_exit9673_9 => memRead_B4_merge_aunroll_x_out_c0_exit9673_9,
        out_c0_exit9673_10 => memRead_B4_merge_aunroll_x_out_c0_exit9673_10,
        out_c0_exit9673_11 => memRead_B4_merge_aunroll_x_out_c0_exit9673_11,
        out_c0_exit9673_12 => memRead_B4_merge_aunroll_x_out_c0_exit9673_12,
        out_c0_exit9673_13 => memRead_B4_merge_aunroll_x_out_c0_exit9673_13,
        out_c0_exit9673_14 => memRead_B4_merge_aunroll_x_out_c0_exit9673_14,
        out_c0_exit9673_15 => memRead_B4_merge_aunroll_x_out_c0_exit9673_15,
        out_c0_exit9673_16 => memRead_B4_merge_aunroll_x_out_c0_exit9673_16,
        out_c0_exit9673_17 => memRead_B4_merge_aunroll_x_out_c0_exit9673_17,
        out_c0_exit9673_18 => memRead_B4_merge_aunroll_x_out_c0_exit9673_18,
        out_c0_exit9673_19 => memRead_B4_merge_aunroll_x_out_c0_exit9673_19,
        out_c0_exit9673_20 => memRead_B4_merge_aunroll_x_out_c0_exit9673_20,
        out_c0_exit9673_21 => memRead_B4_merge_aunroll_x_out_c0_exit9673_21,
        out_c0_exit9673_22 => memRead_B4_merge_aunroll_x_out_c0_exit9673_22,
        out_c0_exit9673_23 => memRead_B4_merge_aunroll_x_out_c0_exit9673_23,
        out_c0_exit9673_24 => memRead_B4_merge_aunroll_x_out_c0_exit9673_24,
        out_c0_exit9673_25 => memRead_B4_merge_aunroll_x_out_c0_exit9673_25,
        out_c0_exit9673_26 => memRead_B4_merge_aunroll_x_out_c0_exit9673_26,
        out_c0_exit9673_27 => memRead_B4_merge_aunroll_x_out_c0_exit9673_27,
        out_c0_exit9673_28 => memRead_B4_merge_aunroll_x_out_c0_exit9673_28,
        out_c0_exit9673_29 => memRead_B4_merge_aunroll_x_out_c0_exit9673_29,
        out_c0_exit9673_30 => memRead_B4_merge_aunroll_x_out_c0_exit9673_30,
        out_c0_exe109776 => memRead_B4_merge_aunroll_x_out_c0_exe109776,
        out_c0_exe119788 => memRead_B4_merge_aunroll_x_out_c0_exe119788,
        out_c0_exe1297910 => memRead_B4_merge_aunroll_x_out_c0_exe1297910,
        out_c0_exe1398012 => memRead_B4_merge_aunroll_x_out_c0_exe1398012,
        out_c0_exe1498114 => memRead_B4_merge_aunroll_x_out_c0_exe1498114,
        out_c0_exe1598216 => memRead_B4_merge_aunroll_x_out_c0_exe1598216,
        out_c0_exe1698318 => memRead_B4_merge_aunroll_x_out_c0_exe1698318,
        out_c0_exe1798420 => memRead_B4_merge_aunroll_x_out_c0_exe1798420,
        out_c0_exe1898522 => memRead_B4_merge_aunroll_x_out_c0_exe1898522,
        out_c0_exe1998624 => memRead_B4_merge_aunroll_x_out_c0_exe1998624,
        out_c0_exe2098726 => memRead_B4_merge_aunroll_x_out_c0_exe2098726,
        out_c0_exe2198828 => memRead_B4_merge_aunroll_x_out_c0_exe2198828,
        out_c0_exe2298930 => memRead_B4_merge_aunroll_x_out_c0_exe2298930,
        out_c0_exe2399032 => memRead_B4_merge_aunroll_x_out_c0_exe2399032,
        out_c0_exe2499134 => memRead_B4_merge_aunroll_x_out_c0_exe2499134,
        out_c0_exe2599236 => memRead_B4_merge_aunroll_x_out_c0_exe2599236,
        out_c0_exe2699338 => memRead_B4_merge_aunroll_x_out_c0_exe2699338,
        out_c0_exe2799440 => memRead_B4_merge_aunroll_x_out_c0_exe2799440,
        out_c0_exe2899541 => memRead_B4_merge_aunroll_x_out_c0_exe2899541,
        out_c0_exe3099742 => memRead_B4_merge_aunroll_x_out_c0_exe3099742,
        out_c0_exe79744 => memRead_B4_merge_aunroll_x_out_c0_exe79744,
        out_memdep_phi122 => memRead_B4_merge_aunroll_x_out_memdep_phi122,
        out_stall_out_0 => memRead_B4_merge_aunroll_x_out_stall_out_0,
        out_valid_out => memRead_B4_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_memRead_B4_stall_region(BLACKBOX,121)
    thebb_memRead_B4_stall_region : bb_memRead_B4_stall_region
    PORT MAP (
        in_c0_exit9673_0 => memRead_B4_merge_aunroll_x_out_c0_exit9673_0,
        in_c0_exit9673_1 => memRead_B4_merge_aunroll_x_out_c0_exit9673_1,
        in_c0_exit9673_2 => memRead_B4_merge_aunroll_x_out_c0_exit9673_2,
        in_c0_exit9673_3 => memRead_B4_merge_aunroll_x_out_c0_exit9673_3,
        in_c0_exit9673_4 => memRead_B4_merge_aunroll_x_out_c0_exit9673_4,
        in_c0_exit9673_5 => memRead_B4_merge_aunroll_x_out_c0_exit9673_5,
        in_c0_exit9673_6 => memRead_B4_merge_aunroll_x_out_c0_exit9673_6,
        in_c0_exit9673_7 => memRead_B4_merge_aunroll_x_out_c0_exit9673_7,
        in_c0_exit9673_8 => memRead_B4_merge_aunroll_x_out_c0_exit9673_8,
        in_c0_exit9673_9 => memRead_B4_merge_aunroll_x_out_c0_exit9673_9,
        in_c0_exit9673_10 => memRead_B4_merge_aunroll_x_out_c0_exit9673_10,
        in_c0_exit9673_11 => memRead_B4_merge_aunroll_x_out_c0_exit9673_11,
        in_c0_exit9673_12 => memRead_B4_merge_aunroll_x_out_c0_exit9673_12,
        in_c0_exit9673_13 => memRead_B4_merge_aunroll_x_out_c0_exit9673_13,
        in_c0_exit9673_14 => memRead_B4_merge_aunroll_x_out_c0_exit9673_14,
        in_c0_exit9673_15 => memRead_B4_merge_aunroll_x_out_c0_exit9673_15,
        in_c0_exit9673_16 => memRead_B4_merge_aunroll_x_out_c0_exit9673_16,
        in_c0_exit9673_17 => memRead_B4_merge_aunroll_x_out_c0_exit9673_17,
        in_c0_exit9673_18 => memRead_B4_merge_aunroll_x_out_c0_exit9673_18,
        in_c0_exit9673_19 => memRead_B4_merge_aunroll_x_out_c0_exit9673_19,
        in_c0_exit9673_20 => memRead_B4_merge_aunroll_x_out_c0_exit9673_20,
        in_c0_exit9673_21 => memRead_B4_merge_aunroll_x_out_c0_exit9673_21,
        in_c0_exit9673_22 => memRead_B4_merge_aunroll_x_out_c0_exit9673_22,
        in_c0_exit9673_23 => memRead_B4_merge_aunroll_x_out_c0_exit9673_23,
        in_c0_exit9673_24 => memRead_B4_merge_aunroll_x_out_c0_exit9673_24,
        in_c0_exit9673_25 => memRead_B4_merge_aunroll_x_out_c0_exit9673_25,
        in_c0_exit9673_26 => memRead_B4_merge_aunroll_x_out_c0_exit9673_26,
        in_c0_exit9673_27 => memRead_B4_merge_aunroll_x_out_c0_exit9673_27,
        in_c0_exit9673_28 => memRead_B4_merge_aunroll_x_out_c0_exit9673_28,
        in_c0_exit9673_29 => memRead_B4_merge_aunroll_x_out_c0_exit9673_29,
        in_c0_exit9673_30 => memRead_B4_merge_aunroll_x_out_c0_exit9673_30,
        in_c0_exe109776 => memRead_B4_merge_aunroll_x_out_c0_exe109776,
        in_c0_exe119788 => memRead_B4_merge_aunroll_x_out_c0_exe119788,
        in_c0_exe1297910 => memRead_B4_merge_aunroll_x_out_c0_exe1297910,
        in_c0_exe1398012 => memRead_B4_merge_aunroll_x_out_c0_exe1398012,
        in_c0_exe1498114 => memRead_B4_merge_aunroll_x_out_c0_exe1498114,
        in_c0_exe1598216 => memRead_B4_merge_aunroll_x_out_c0_exe1598216,
        in_c0_exe1698318 => memRead_B4_merge_aunroll_x_out_c0_exe1698318,
        in_c0_exe1798420 => memRead_B4_merge_aunroll_x_out_c0_exe1798420,
        in_c0_exe1898522 => memRead_B4_merge_aunroll_x_out_c0_exe1898522,
        in_c0_exe1998624 => memRead_B4_merge_aunroll_x_out_c0_exe1998624,
        in_c0_exe2098726 => memRead_B4_merge_aunroll_x_out_c0_exe2098726,
        in_c0_exe2198828 => memRead_B4_merge_aunroll_x_out_c0_exe2198828,
        in_c0_exe2298930 => memRead_B4_merge_aunroll_x_out_c0_exe2298930,
        in_c0_exe2399032 => memRead_B4_merge_aunroll_x_out_c0_exe2399032,
        in_c0_exe2499134 => memRead_B4_merge_aunroll_x_out_c0_exe2499134,
        in_c0_exe2599236 => memRead_B4_merge_aunroll_x_out_c0_exe2599236,
        in_c0_exe2699338 => memRead_B4_merge_aunroll_x_out_c0_exe2699338,
        in_c0_exe2799440 => memRead_B4_merge_aunroll_x_out_c0_exe2799440,
        in_c0_exe2899541 => memRead_B4_merge_aunroll_x_out_c0_exe2899541,
        in_c0_exe3099742 => memRead_B4_merge_aunroll_x_out_c0_exe3099742,
        in_c0_exe79744 => memRead_B4_merge_aunroll_x_out_c0_exe79744,
        in_memdep_phi122 => memRead_B4_merge_aunroll_x_out_memdep_phi122,
        in_stall_in => memRead_B4_branch_aunroll_x_out_stall_out,
        in_valid_in => memRead_B4_merge_aunroll_x_out_valid_out,
        out_c0_exit1008_0 => bb_memRead_B4_stall_region_out_c0_exit1008_0,
        out_c0_exit1008_1 => bb_memRead_B4_stall_region_out_c0_exit1008_1,
        out_c1_exit1020_0 => bb_memRead_B4_stall_region_out_c1_exit1020_0,
        out_c1_exit1020_1 => bb_memRead_B4_stall_region_out_c1_exit1020_1,
        out_c2_exit1032_0 => bb_memRead_B4_stall_region_out_c2_exit1032_0,
        out_c2_exit1032_1 => bb_memRead_B4_stall_region_out_c2_exit1032_1,
        out_c3_exit_0 => bb_memRead_B4_stall_region_out_c3_exit_0,
        out_c3_exit_1 => bb_memRead_B4_stall_region_out_c3_exit_1,
        out_c4_exit_0 => bb_memRead_B4_stall_region_out_c4_exit_0,
        out_c4_exit_1 => bb_memRead_B4_stall_region_out_c4_exit_1,
        out_c5_exit_0 => bb_memRead_B4_stall_region_out_c5_exit_0,
        out_c5_exit_1 => bb_memRead_B4_stall_region_out_c5_exit_1,
        out_c0_exe109776 => bb_memRead_B4_stall_region_out_c0_exe109776,
        out_c0_exe119788 => bb_memRead_B4_stall_region_out_c0_exe119788,
        out_c0_exe1297910 => bb_memRead_B4_stall_region_out_c0_exe1297910,
        out_c0_exe1398012 => bb_memRead_B4_stall_region_out_c0_exe1398012,
        out_c0_exe1498114 => bb_memRead_B4_stall_region_out_c0_exe1498114,
        out_c0_exe1598216 => bb_memRead_B4_stall_region_out_c0_exe1598216,
        out_c0_exe1698318 => bb_memRead_B4_stall_region_out_c0_exe1698318,
        out_c0_exe1798420 => bb_memRead_B4_stall_region_out_c0_exe1798420,
        out_c0_exe1898522 => bb_memRead_B4_stall_region_out_c0_exe1898522,
        out_c0_exe1998624 => bb_memRead_B4_stall_region_out_c0_exe1998624,
        out_c0_exe2098726 => bb_memRead_B4_stall_region_out_c0_exe2098726,
        out_c0_exe2198828 => bb_memRead_B4_stall_region_out_c0_exe2198828,
        out_c0_exe2298930 => bb_memRead_B4_stall_region_out_c0_exe2298930,
        out_c0_exe2399032 => bb_memRead_B4_stall_region_out_c0_exe2399032,
        out_c0_exe2499134 => bb_memRead_B4_stall_region_out_c0_exe2499134,
        out_c0_exe2599236 => bb_memRead_B4_stall_region_out_c0_exe2599236,
        out_c0_exe2699338 => bb_memRead_B4_stall_region_out_c0_exe2699338,
        out_c0_exe2799440 => bb_memRead_B4_stall_region_out_c0_exe2799440,
        out_c0_exe29996 => bb_memRead_B4_stall_region_out_c0_exe29996,
        out_memdep_phi122 => bb_memRead_B4_stall_region_out_memdep_phi122,
        out_stall_out => bb_memRead_B4_stall_region_out_stall_out,
        out_valid_out => bb_memRead_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- memRead_B4_branch_aunroll_x(BLACKBOX,85)
    thememRead_B4_branch_aunroll_x : memRead_B4_branch
    PORT MAP (
        in_c0_exit1008_0 => bb_memRead_B4_stall_region_out_c0_exit1008_0,
        in_c0_exit1008_1 => bb_memRead_B4_stall_region_out_c0_exit1008_1,
        in_c1_exit1020_0 => bb_memRead_B4_stall_region_out_c1_exit1020_0,
        in_c1_exit1020_1 => bb_memRead_B4_stall_region_out_c1_exit1020_1,
        in_c2_exit1032_0 => bb_memRead_B4_stall_region_out_c2_exit1032_0,
        in_c2_exit1032_1 => bb_memRead_B4_stall_region_out_c2_exit1032_1,
        in_c3_exit_0 => bb_memRead_B4_stall_region_out_c3_exit_0,
        in_c3_exit_1 => bb_memRead_B4_stall_region_out_c3_exit_1,
        in_c4_exit_0 => bb_memRead_B4_stall_region_out_c4_exit_0,
        in_c4_exit_1 => bb_memRead_B4_stall_region_out_c4_exit_1,
        in_c5_exit_0 => bb_memRead_B4_stall_region_out_c5_exit_0,
        in_c5_exit_1 => bb_memRead_B4_stall_region_out_c5_exit_1,
        in_c0_exe109776 => bb_memRead_B4_stall_region_out_c0_exe109776,
        in_c0_exe119788 => bb_memRead_B4_stall_region_out_c0_exe119788,
        in_c0_exe1297910 => bb_memRead_B4_stall_region_out_c0_exe1297910,
        in_c0_exe1398012 => bb_memRead_B4_stall_region_out_c0_exe1398012,
        in_c0_exe1498114 => bb_memRead_B4_stall_region_out_c0_exe1498114,
        in_c0_exe1598216 => bb_memRead_B4_stall_region_out_c0_exe1598216,
        in_c0_exe1698318 => bb_memRead_B4_stall_region_out_c0_exe1698318,
        in_c0_exe1798420 => bb_memRead_B4_stall_region_out_c0_exe1798420,
        in_c0_exe1898522 => bb_memRead_B4_stall_region_out_c0_exe1898522,
        in_c0_exe1998624 => bb_memRead_B4_stall_region_out_c0_exe1998624,
        in_c0_exe2098726 => bb_memRead_B4_stall_region_out_c0_exe2098726,
        in_c0_exe2198828 => bb_memRead_B4_stall_region_out_c0_exe2198828,
        in_c0_exe2298930 => bb_memRead_B4_stall_region_out_c0_exe2298930,
        in_c0_exe2399032 => bb_memRead_B4_stall_region_out_c0_exe2399032,
        in_c0_exe2499134 => bb_memRead_B4_stall_region_out_c0_exe2499134,
        in_c0_exe2599236 => bb_memRead_B4_stall_region_out_c0_exe2599236,
        in_c0_exe2699338 => bb_memRead_B4_stall_region_out_c0_exe2699338,
        in_c0_exe2799440 => bb_memRead_B4_stall_region_out_c0_exe2799440,
        in_c0_exe29996 => bb_memRead_B4_stall_region_out_c0_exe29996,
        in_memdep_phi122 => bb_memRead_B4_stall_region_out_memdep_phi122,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_memRead_B4_stall_region_out_valid_out,
        out_c0_exit1008_0 => memRead_B4_branch_aunroll_x_out_c0_exit1008_0,
        out_c0_exit1008_1 => memRead_B4_branch_aunroll_x_out_c0_exit1008_1,
        out_c1_exit1020_0 => memRead_B4_branch_aunroll_x_out_c1_exit1020_0,
        out_c1_exit1020_1 => memRead_B4_branch_aunroll_x_out_c1_exit1020_1,
        out_c2_exit1032_0 => memRead_B4_branch_aunroll_x_out_c2_exit1032_0,
        out_c2_exit1032_1 => memRead_B4_branch_aunroll_x_out_c2_exit1032_1,
        out_c3_exit_0 => memRead_B4_branch_aunroll_x_out_c3_exit_0,
        out_c3_exit_1 => memRead_B4_branch_aunroll_x_out_c3_exit_1,
        out_c4_exit_0 => memRead_B4_branch_aunroll_x_out_c4_exit_0,
        out_c4_exit_1 => memRead_B4_branch_aunroll_x_out_c4_exit_1,
        out_c5_exit_0 => memRead_B4_branch_aunroll_x_out_c5_exit_0,
        out_c5_exit_1 => memRead_B4_branch_aunroll_x_out_c5_exit_1,
        out_c0_exe109776 => memRead_B4_branch_aunroll_x_out_c0_exe109776,
        out_c0_exe119788 => memRead_B4_branch_aunroll_x_out_c0_exe119788,
        out_c0_exe1297910 => memRead_B4_branch_aunroll_x_out_c0_exe1297910,
        out_c0_exe1398012 => memRead_B4_branch_aunroll_x_out_c0_exe1398012,
        out_c0_exe1498114 => memRead_B4_branch_aunroll_x_out_c0_exe1498114,
        out_c0_exe1598216 => memRead_B4_branch_aunroll_x_out_c0_exe1598216,
        out_c0_exe1698318 => memRead_B4_branch_aunroll_x_out_c0_exe1698318,
        out_c0_exe1798420 => memRead_B4_branch_aunroll_x_out_c0_exe1798420,
        out_c0_exe1898522 => memRead_B4_branch_aunroll_x_out_c0_exe1898522,
        out_c0_exe1998624 => memRead_B4_branch_aunroll_x_out_c0_exe1998624,
        out_c0_exe2098726 => memRead_B4_branch_aunroll_x_out_c0_exe2098726,
        out_c0_exe2198828 => memRead_B4_branch_aunroll_x_out_c0_exe2198828,
        out_c0_exe2298930 => memRead_B4_branch_aunroll_x_out_c0_exe2298930,
        out_c0_exe2399032 => memRead_B4_branch_aunroll_x_out_c0_exe2399032,
        out_c0_exe2499134 => memRead_B4_branch_aunroll_x_out_c0_exe2499134,
        out_c0_exe2599236 => memRead_B4_branch_aunroll_x_out_c0_exe2599236,
        out_c0_exe2699338 => memRead_B4_branch_aunroll_x_out_c0_exe2699338,
        out_c0_exe2799440 => memRead_B4_branch_aunroll_x_out_c0_exe2799440,
        out_memdep_phi122 => memRead_B4_branch_aunroll_x_out_memdep_phi122,
        out_stall_out => memRead_B4_branch_aunroll_x_out_stall_out,
        out_valid_out_0 => memRead_B4_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => memRead_B4_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exit1008_0(GPOUT,87)
    out_c0_exit1008_0 <= memRead_B4_branch_aunroll_x_out_c0_exit1008_0;

    -- out_c0_exit1008_1(GPOUT,88)
    out_c0_exit1008_1 <= memRead_B4_branch_aunroll_x_out_c0_exit1008_1;

    -- out_c1_exit1020_0(GPOUT,89)
    out_c1_exit1020_0 <= memRead_B4_branch_aunroll_x_out_c1_exit1020_0;

    -- out_c1_exit1020_1(GPOUT,90)
    out_c1_exit1020_1 <= memRead_B4_branch_aunroll_x_out_c1_exit1020_1;

    -- out_c2_exit1032_0(GPOUT,91)
    out_c2_exit1032_0 <= memRead_B4_branch_aunroll_x_out_c2_exit1032_0;

    -- out_c2_exit1032_1(GPOUT,92)
    out_c2_exit1032_1 <= memRead_B4_branch_aunroll_x_out_c2_exit1032_1;

    -- out_c3_exit_0(GPOUT,93)
    out_c3_exit_0 <= memRead_B4_branch_aunroll_x_out_c3_exit_0;

    -- out_c3_exit_1(GPOUT,94)
    out_c3_exit_1 <= memRead_B4_branch_aunroll_x_out_c3_exit_1;

    -- out_c4_exit_0(GPOUT,95)
    out_c4_exit_0 <= memRead_B4_branch_aunroll_x_out_c4_exit_0;

    -- out_c4_exit_1(GPOUT,96)
    out_c4_exit_1 <= memRead_B4_branch_aunroll_x_out_c4_exit_1;

    -- out_c5_exit_0(GPOUT,97)
    out_c5_exit_0 <= memRead_B4_branch_aunroll_x_out_c5_exit_0;

    -- out_c5_exit_1(GPOUT,98)
    out_c5_exit_1 <= memRead_B4_branch_aunroll_x_out_c5_exit_1;

    -- out_c0_exe109776(GPOUT,99)
    out_c0_exe109776 <= memRead_B4_branch_aunroll_x_out_c0_exe109776;

    -- out_c0_exe119788(GPOUT,100)
    out_c0_exe119788 <= memRead_B4_branch_aunroll_x_out_c0_exe119788;

    -- out_c0_exe1297910(GPOUT,101)
    out_c0_exe1297910 <= memRead_B4_branch_aunroll_x_out_c0_exe1297910;

    -- out_c0_exe1398012(GPOUT,102)
    out_c0_exe1398012 <= memRead_B4_branch_aunroll_x_out_c0_exe1398012;

    -- out_c0_exe1498114(GPOUT,103)
    out_c0_exe1498114 <= memRead_B4_branch_aunroll_x_out_c0_exe1498114;

    -- out_c0_exe1598216(GPOUT,104)
    out_c0_exe1598216 <= memRead_B4_branch_aunroll_x_out_c0_exe1598216;

    -- out_c0_exe1698318(GPOUT,105)
    out_c0_exe1698318 <= memRead_B4_branch_aunroll_x_out_c0_exe1698318;

    -- out_c0_exe1798420(GPOUT,106)
    out_c0_exe1798420 <= memRead_B4_branch_aunroll_x_out_c0_exe1798420;

    -- out_c0_exe1898522(GPOUT,107)
    out_c0_exe1898522 <= memRead_B4_branch_aunroll_x_out_c0_exe1898522;

    -- out_c0_exe1998624(GPOUT,108)
    out_c0_exe1998624 <= memRead_B4_branch_aunroll_x_out_c0_exe1998624;

    -- out_c0_exe2098726(GPOUT,109)
    out_c0_exe2098726 <= memRead_B4_branch_aunroll_x_out_c0_exe2098726;

    -- out_c0_exe2198828(GPOUT,110)
    out_c0_exe2198828 <= memRead_B4_branch_aunroll_x_out_c0_exe2198828;

    -- out_c0_exe2298930(GPOUT,111)
    out_c0_exe2298930 <= memRead_B4_branch_aunroll_x_out_c0_exe2298930;

    -- out_c0_exe2399032(GPOUT,112)
    out_c0_exe2399032 <= memRead_B4_branch_aunroll_x_out_c0_exe2399032;

    -- out_c0_exe2499134(GPOUT,113)
    out_c0_exe2499134 <= memRead_B4_branch_aunroll_x_out_c0_exe2499134;

    -- out_c0_exe2599236(GPOUT,114)
    out_c0_exe2599236 <= memRead_B4_branch_aunroll_x_out_c0_exe2599236;

    -- out_c0_exe2699338(GPOUT,115)
    out_c0_exe2699338 <= memRead_B4_branch_aunroll_x_out_c0_exe2699338;

    -- out_c0_exe2799440(GPOUT,116)
    out_c0_exe2799440 <= memRead_B4_branch_aunroll_x_out_c0_exe2799440;

    -- out_memdep_phi122(GPOUT,117)
    out_memdep_phi122 <= memRead_B4_branch_aunroll_x_out_memdep_phi122;

    -- out_stall_out_0(GPOUT,118)
    out_stall_out_0 <= memRead_B4_merge_aunroll_x_out_stall_out_0;

    -- out_valid_out_0(GPOUT,119)
    out_valid_out_0 <= memRead_B4_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,120)
    out_valid_out_1 <= memRead_B4_branch_aunroll_x_out_valid_out_1;

END normal;
