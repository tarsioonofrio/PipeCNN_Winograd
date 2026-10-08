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

-- VHDL created from bb_memRead_B0
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

entity bb_memRead_B0 is
    port (
        in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_bottom : in std_logic_vector(63 downto 0);  -- ufix64
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
        in_group_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_line_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_padding : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_size : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_stride : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(7 downto 0);  -- ufix8
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_weight_dim1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_weight_dim3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_weight_dim4_div_lane : in std_logic_vector(15 downto 0);  -- ufix16
        in_weights : in std_logic_vector(63 downto 0);  -- ufix64
        in_win_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_win_size_y : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_0_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_1_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_memRead_B0;

architecture normal of bb_memRead_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_memRead_B0_stall_region is
        port (
            in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_group_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_0_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_1_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memRead_B0_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memRead_B0_merge is
        port (
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_memRead_B0_stall_region_out_feedback_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B0_stall_region_out_intel_reserved_ffwd_0_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B0_stall_region_out_intel_reserved_ffwd_1_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- memRead_B0_merge(BLACKBOX,38)
    thememRead_B0_merge : memRead_B0_merge
    PORT MAP (
        in_stall_in => bb_memRead_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_stall_out_0 => memRead_B0_merge_out_stall_out_0,
        out_valid_out => memRead_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- memRead_B0_branch(BLACKBOX,37)
    thememRead_B0_branch : memRead_B0_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_memRead_B0_stall_region_out_valid_out,
        out_stall_out => memRead_B0_branch_out_stall_out,
        out_valid_out_0 => memRead_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_memRead_B0_stall_region(BLACKBOX,2)
    thebb_memRead_B0_stall_region : bb_memRead_B0_stall_region
    PORT MAP (
        in_feedback_in_0 => in_feedback_in_0,
        in_feedback_valid_in_0 => in_feedback_valid_in_0,
        in_group_size_x => in_group_size_x,
        in_stall_in => memRead_B0_branch_out_stall_out,
        in_stride => in_stride,
        in_valid_in => memRead_B0_merge_out_valid_out,
        out_feedback_stall_out_0 => bb_memRead_B0_stall_region_out_feedback_stall_out_0,
        out_intel_reserved_ffwd_0_0 => bb_memRead_B0_stall_region_out_intel_reserved_ffwd_0_0,
        out_intel_reserved_ffwd_1_0 => bb_memRead_B0_stall_region_out_intel_reserved_ffwd_1_0,
        out_stall_out => bb_memRead_B0_stall_region_out_stall_out,
        out_valid_out => bb_memRead_B0_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_stall_out_0_sync(GPOUT,4)
    out_feedback_stall_out_0 <= bb_memRead_B0_stall_region_out_feedback_stall_out_0;

    -- out_intel_reserved_ffwd_0_0(GPOUT,39)
    out_intel_reserved_ffwd_0_0 <= bb_memRead_B0_stall_region_out_intel_reserved_ffwd_0_0;

    -- out_intel_reserved_ffwd_1_0(GPOUT,40)
    out_intel_reserved_ffwd_1_0 <= bb_memRead_B0_stall_region_out_intel_reserved_ffwd_1_0;

    -- out_stall_out_0(GPOUT,41)
    out_stall_out_0 <= memRead_B0_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,42)
    out_valid_out_0 <= memRead_B0_branch_out_valid_out_0;

END normal;
