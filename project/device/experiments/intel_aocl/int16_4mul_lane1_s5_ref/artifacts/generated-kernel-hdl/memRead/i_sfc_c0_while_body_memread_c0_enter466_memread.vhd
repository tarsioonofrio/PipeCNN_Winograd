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

-- VHDL created from i_sfc_c0_while_body_memread_c0_enter466_memread
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

entity i_sfc_c0_while_body_memread_c0_enter466_memread is
    port (
        in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni1_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit467_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit467_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_5 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit467_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_10 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit467_11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit467_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit467_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_17 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_18 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_19 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit467_20 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit467_21 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_bottom : in std_logic_vector(63 downto 0);  -- ufix64
        out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_col_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_control : in std_logic_vector(7 downto 0);  -- ufix8
        in_conv_loop_cnt : in std_logic_vector(31 downto 0);  -- ufix32
        in_conv_row_rem : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_dim1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_dim1xdim2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_dim2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_group_num_mul_win_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_group_num_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_group_num_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_line_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_padding : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_size : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_stride : in std_logic_vector(7 downto 0);  -- ufix8
        in_weight_dim1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_weight_dim3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_weight_dim4_div_lane : in std_logic_vector(15 downto 0);  -- ufix16
        in_weights : in std_logic_vector(63 downto 0);  -- ufix64
        in_win_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_win_size_y : in std_logic_vector(7 downto 0);  -- ufix8
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_bias : in std_logic_vector(63 downto 0);  -- ufix64
        out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_while_body_memread_c0_enter466_memread;

architecture normal of i_sfc_c0_while_body_memread_c0_enter466_memread is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread162 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_while_body_memread_c0_enter466_memread27 is
        port (
            in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni1_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_bottom : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_col_size : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_control : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_conv_loop_cnt : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_conv_row_rem : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_dim1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_dim1xdim2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_dim2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_group_num_mul_win_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_group_num_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_group_num_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_line_size : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_padding : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pool_size : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_pool_stride : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_weight_dim1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_weight_dim3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_weight_dim4_div_lane : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_weights : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_win_size : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_win_size_y : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi21_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi21_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi21_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi21_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi21_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi21_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi21_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi21_20 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi21_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_10 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_20 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,31)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,30)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x(BLACKBOX,29)@1
    -- out out_c0_exi21_0@9
    -- out out_c0_exi21_1@9
    -- out out_c0_exi21_2@9
    -- out out_c0_exi21_3@9
    -- out out_c0_exi21_4@9
    -- out out_c0_exi21_5@9
    -- out out_c0_exi21_6@9
    -- out out_c0_exi21_7@9
    -- out out_c0_exi21_8@9
    -- out out_c0_exi21_9@9
    -- out out_c0_exi21_10@9
    -- out out_c0_exi21_11@9
    -- out out_c0_exi21_12@9
    -- out out_c0_exi21_13@9
    -- out out_c0_exi21_14@9
    -- out out_c0_exi21_15@9
    -- out out_c0_exi21_16@9
    -- out out_c0_exi21_17@9
    -- out out_c0_exi21_18@9
    -- out out_c0_exi21_19@9
    -- out out_c0_exi21_20@9
    -- out out_c0_exi21_21@9
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out@20000000
    -- out out_o_valid@9
    -- out out_pipeline_valid_out@20000000
    thei_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x : i_sfc_logic_c0_while_body_memread_c0_enter466_memread27
    PORT MAP (
        in_c0_eni1_0 => in_c0_eni1_0,
        in_c0_eni1_1 => in_c0_eni1_1,
        in_bias => in_bias,
        in_bottom => in_bottom,
        in_col_size => in_col_size,
        in_control => in_control,
        in_conv_loop_cnt => in_conv_loop_cnt,
        in_conv_row_rem => in_conv_row_rem,
        in_data_dim1 => in_data_dim1,
        in_data_dim1xdim2 => in_data_dim1xdim2,
        in_data_dim2 => in_data_dim2,
        in_group_num_mul_win_size => in_group_num_mul_win_size,
        in_group_num_x => in_group_num_x,
        in_group_num_y => in_group_num_y,
        in_i_valid => input_accepted_and_q,
        in_intel_reserved_ffwd_0_0 => in_intel_reserved_ffwd_0_0,
        in_intel_reserved_ffwd_1_0 => in_intel_reserved_ffwd_1_0,
        in_line_size => in_line_size,
        in_padding => in_padding,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_pool_size => in_pool_size,
        in_pool_stride => in_pool_stride,
        in_weight_dim1 => in_weight_dim1,
        in_weight_dim3 => in_weight_dim3,
        in_weight_dim4_div_lane => in_weight_dim4_div_lane,
        in_weights => in_weights,
        in_win_size => in_win_size,
        in_win_size_y => in_win_size_y,
        out_c0_exi21_0 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_0,
        out_c0_exi21_1 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_1,
        out_c0_exi21_2 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_2,
        out_c0_exi21_3 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_3,
        out_c0_exi21_4 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_4,
        out_c0_exi21_5 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_5,
        out_c0_exi21_6 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_6,
        out_c0_exi21_7 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_7,
        out_c0_exi21_8 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_8,
        out_c0_exi21_9 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_9,
        out_c0_exi21_10 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_10,
        out_c0_exi21_11 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_11,
        out_c0_exi21_12 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_12,
        out_c0_exi21_13 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_13,
        out_c0_exi21_14 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_14,
        out_c0_exi21_15 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_15,
        out_c0_exi21_16 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_16,
        out_c0_exi21_17 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_17,
        out_c0_exi21_18 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_18,
        out_c0_exi21_19 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_19,
        out_c0_exi21_20 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_20,
        out_c0_exi21_21 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_21,
        out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out,
        out_o_valid => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x(BLACKBOX,28)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_data_out_2@20000003
    -- out out_data_out_3@20000003
    -- out out_data_out_4@20000003
    -- out out_data_out_5@20000003
    -- out out_data_out_6@20000003
    -- out out_data_out_7@20000003
    -- out out_data_out_8@20000003
    -- out out_data_out_9@20000003
    -- out out_data_out_10@20000003
    -- out out_data_out_11@20000003
    -- out out_data_out_12@20000003
    -- out out_data_out_13@20000003
    -- out out_data_out_14@20000003
    -- out out_data_out_15@20000003
    -- out out_data_out_16@20000003
    -- out out_data_out_17@20000003
    -- out out_data_out_18@20000003
    -- out out_data_out_19@20000003
    -- out out_data_out_20@20000003
    -- out out_data_out_21@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x : i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread162
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_0,
        in_data_in_1 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_1,
        in_data_in_2 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_2,
        in_data_in_3 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_3,
        in_data_in_4 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_4,
        in_data_in_5 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_5,
        in_data_in_6 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_6,
        in_data_in_7 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_7,
        in_data_in_8 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_8,
        in_data_in_9 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_9,
        in_data_in_10 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_10,
        in_data_in_11 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_11,
        in_data_in_12 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_12,
        in_data_in_13 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_13,
        in_data_in_14 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_14,
        in_data_in_15 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_15,
        in_data_in_16 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_16,
        in_data_in_17 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_17,
        in_data_in_18 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_18,
        in_data_in_19 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_19,
        in_data_in_20 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_20,
        in_data_in_21 => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_c0_exi21_21,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_18,
        out_data_out_19 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_19,
        out_data_out_20 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_20,
        out_data_out_21 => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_21,
        out_stall_entry => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@12
    out_c0_exit467_0 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_0;
    out_c0_exit467_1 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_1;
    out_c0_exit467_2 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_2;
    out_c0_exit467_3 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_3;
    out_c0_exit467_4 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_4;
    out_c0_exit467_5 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_5;
    out_c0_exit467_6 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_6;
    out_c0_exit467_7 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_7;
    out_c0_exit467_8 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_8;
    out_c0_exit467_9 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_9;
    out_c0_exit467_10 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_10;
    out_c0_exit467_11 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_11;
    out_c0_exit467_12 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_12;
    out_c0_exit467_13 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_13;
    out_c0_exit467_14 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_14;
    out_c0_exit467_15 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_15;
    out_c0_exit467_16 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_16;
    out_c0_exit467_17 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_17;
    out_c0_exit467_18 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_18;
    out_c0_exit467_19 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_19;
    out_c0_exit467_20 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_20;
    out_c0_exit467_21 <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_data_out_21;
    out_o_valid <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_valid_out;

    -- dupName_0_regfree_osync_x(GPOUT,5)
    out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out <= i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out;

    -- pipeline_valid_out_sync(GPOUT,33)
    out_pipeline_valid_out <= i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_pipeline_valid_out;

    -- regfree_osync(GPOUT,35)
    out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out <= i_sfc_logic_c0_while_body_memread_c0_enter466_memread27_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out;

    -- sync_out(GPOUT,37)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_while_body_memread_c0_exit467_memread_aunroll_x_out_stall_entry;

END normal;
