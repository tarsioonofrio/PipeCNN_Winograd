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

-- VHDL created from i_sfc_logic_c0_while_body_memread_c0_enter466_memread27
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

entity i_sfc_logic_c0_while_body_memread_c0_enter466_memread27 is
    port (
        in_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_bottom : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni1_1 : in std_logic_vector(0 downto 0);  -- ufix1
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
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_c0_exi21_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi21_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi21_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_5 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi21_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_10 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi21_11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi21_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi21_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_17 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_18 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_19 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi21_20 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi21_21 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_while_body_memread_c0_enter466_memread27;

architecture normal of i_sfc_logic_c0_while_body_memread_c0_enter466_memread27 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going34_memread29 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_not_exitcond_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_not_exitcond_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_initeration_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_not_exitcond_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_gp_num_x_0535_pop25_memread40 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_25 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_gp_num_y_0536_pop24_memread42 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_24 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_line_buf_ptr_0544_pop17_memread107 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_17 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_out_idx_z_0537_pop23_memread73 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_23 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_row_cnt_0546_pop15_memread112 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_15 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_row_pool_cnt_0545_pop16_memread121 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_16 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_win_itm_xyz_0547_pop14_memread33 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_14 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_win_itm_z_0540_pop21_memread38 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_21 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_conv_z_cnt_0543_pop18_memread83 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_index_0548_pop13_memread31 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_read8_flag_0542_pop19_memread132 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_19 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_win_itm_y_0539_pop22_memread36 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_22 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_gp_num_x_0535_push25_memread160 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_25 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_gp_num_y_0536_push24_memread158 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_24 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_line_buf_ptr_0544_push17_memread130 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_17 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_out_idx_z_0537_push23_memread155 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_23 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_row_cnt_0546_push15_memread119 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_15 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_row_pool_cnt_0545_push16_memread128 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_16 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_win_itm_xyz_0547_push14_memread98 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_14 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_win_itm_z_0540_push21_memread91 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_21 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond35_memread95 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_conv_z_cnt_0543_push18_memread135 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_index_0548_push13_memread93 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_read8_flag_0542_push19_memread147 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_19 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_win_itm_y_0539_push22_memread89 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_22 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_conv2027_memread44 is
        port (
            in_intel_reserved_ffwd_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_0_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_mul28_memread51 is
        port (
            in_intel_reserved_ffwd_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_1_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_bias_sync_buffer_memread80 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_bottom_sync_buffer_memread58 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_col_size_sync_buffer_memread109 is
        port (
            in_buffer_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_control_sync_buffer23_memread104 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_conv_loop_cnt_sync_buffer_memread100 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_conv_row_rem_sync_buffer19_memread144 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_data_dim1_sync_buffer_memread55 is
        port (
            in_buffer_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_data_dim1xdim2_sync_buffer_memread53 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_data_dim2_sync_buffer_memread48 is
        port (
            in_buffer_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_group_num_mul_win_size_sync_buffer21_memread85 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_group_num_mul_win_size_sync_buffer22_memread61 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_group_num_x_sync_buffer_memread137 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_group_num_y_sync_buffer_memread149 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_line_size_sync_buffer_memread114 is
        port (
            in_buffer_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_padding_sync_buffer_memread46 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_pool_size_sync_buffer_memread123 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_pool_stride_sync_buffer_memread126 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_weight_dim1_sync_buffer_memread141 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_weight_dim3_sync_buffer_memread67 is
        port (
            in_buffer_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_weight_dim4_div_lane_sync_buffer_memread152 is
        port (
            in_buffer_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_weights_sync_buffer_memread77 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_win_size_sync_buffer_memread75 is
        port (
            in_buffer_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_win_size_y_sync_buffer_memread64 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add100_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add1197_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_add1217_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_add1223_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_add35_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add37_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add45_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_conv_row_rem_off_rm_memread_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_inc1237_conv_z_cnt_0_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc1275_out_idx_z_0_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_inc1296_gp_num_y_0_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_inc1306_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_inc1334_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_inc14_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc76_win_itm_z_1_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_inc86_memread_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_mul21_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul27_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul30_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul34_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul98_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1178_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1185_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1191_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1213_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1242_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1248_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1253_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub1259_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub60_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub65_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub829_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i8_1gr_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_arrayidx102400_0_memread_memread79_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_multconst_x_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_arrayidx102400_0_memread_memread79_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx102400_0_memread_memread79_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx102400_0_memread_memread79_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx102400_0_memread_memread79_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx102400_0_memread_memread79_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx106419_0_memread_memread82_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_multconst_x_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_arrayidx106419_0_memread_memread82_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx106419_0_memread_memread82_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx106419_0_memread_memread82_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx106419_0_memread_memread82_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx106419_0_memread_memread82_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx50458_0_memread_memread60_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx50458_0_memread_memread60_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx50458_0_memread_memread60_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx50458_0_memread_memread60_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx50458_0_memread_memread60_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx50458_0_memread_memread60_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_conv1176_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1177_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1183_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1184_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1189_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1190_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1212_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1214_rm_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1247_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1258_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv15_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv18_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv18_memread_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv23_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv24_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv24_memread_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv29_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv29_memread_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv32_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv33_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv43_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv58_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv64_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv96_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv96_memread_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv97_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv97_rm_memread_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_idxprom101_memread_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom105_memread_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom49_memread_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_inc1237_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc1275_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_inc1296_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_inc76_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul21_memread_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul21_memread_multconst_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul27_memread_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul30_memread_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul34_memread_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul98_memread_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul98_memread_multconst_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread146_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i16_1gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i16_2gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_65535_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i8_0gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_1gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_2gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_3gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_1785_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1785_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2090_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2091_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2091_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_2092_demorgan_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2093_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2093_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_2094_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2095_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2095_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_2099_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2099_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_2100_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2101_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2102_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2102_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_2103_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2103_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2104_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2104_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2105_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2105_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2106_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2106_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2107_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2107_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2108_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2108_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2109_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2109_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2110_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2110_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2111_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2111_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2112_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2112_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2113_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2113_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2114_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2114_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2115_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2115_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2116_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2116_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2117_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2117_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2119_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2121_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2121_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2123_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2123_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2124_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2124_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2125_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2125_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2126_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2126_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2127_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2127_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2128_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2128_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2130_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2130_memread_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_2131_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2131_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2132_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going34_memread_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going34_memread_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going34_memread_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going34_memread_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_feedback_stall_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_feedback_stall_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_feedback_stall_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_feedback_stall_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_row_cnt_0546_pop15_memread_out_feedback_stall_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_feedback_stall_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_feedback_stall_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_win_itm_z_0540_pop21_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_win_itm_z_0540_pop21_memread_out_feedback_stall_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_feedback_stall_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_index_0548_pop13_memread_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_index_0548_pop13_memread_out_feedback_stall_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_read8_flag_0542_pop19_memread_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_read8_flag_0542_pop19_memread_out_feedback_stall_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_win_itm_y_0539_pop22_memread_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_win_itm_y_0539_pop22_memread_out_feedback_stall_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_gp_num_x_0535_push25_memread_out_feedback_out_25 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_gp_num_x_0535_push25_memread_out_feedback_valid_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_gp_num_y_0536_push24_memread_out_feedback_out_24 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_gp_num_y_0536_push24_memread_out_feedback_valid_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_line_buf_ptr_0544_push17_memread_out_feedback_out_17 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_line_buf_ptr_0544_push17_memread_out_feedback_valid_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_out_idx_z_0537_push23_memread_out_feedback_out_23 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_out_idx_z_0537_push23_memread_out_feedback_valid_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_row_cnt_0546_push15_memread_out_feedback_out_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_row_cnt_0546_push15_memread_out_feedback_valid_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_row_pool_cnt_0545_push16_memread_out_feedback_out_16 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_row_pool_cnt_0545_push16_memread_out_feedback_valid_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_win_itm_xyz_0547_push14_memread_out_feedback_out_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_win_itm_xyz_0547_push14_memread_out_feedback_valid_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_win_itm_z_0540_push21_memread_out_feedback_out_21 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_win_itm_z_0540_push21_memread_out_feedback_valid_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond35_memread_out_feedback_out_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond35_memread_out_feedback_valid_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_z_cnt_0543_push18_memread_out_feedback_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_conv_z_cnt_0543_push18_memread_out_feedback_valid_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_index_0548_push13_memread_out_feedback_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_index_0548_push13_memread_out_feedback_valid_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_read8_flag_0542_push19_memread_out_feedback_out_19 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_read8_flag_0542_push19_memread_out_feedback_valid_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_win_itm_y_0539_push22_memread_out_feedback_out_22 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_win_itm_y_0539_push22_memread_out_feedback_valid_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add100_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add100_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add100_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add100_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add1197_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1197_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1197_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1197_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1197_memread_memread117_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add1197_memread_memread117_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_add1217_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1217_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1217_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1217_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1223_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1223_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1223_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add1223_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add35_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add35_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add35_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add35_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add37_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add37_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add37_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add37_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_rm_memread_vt_const_31_q : STD_LOGIC_VECTOR (14 downto 0);
    signal i_add45_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add45_rm_memread_vt_select_16_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_and1042_rm_memread_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and1042_rm_memread_vt_const_7_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_and1042_rm_memread_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and1042_rm_memread_vt_select_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_brmerge568_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_brmerge568_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_brmerge569_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_brmerge570_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_brmerge570_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_brmerge_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1043_not_rm_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1043_rm_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1179_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1186_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1186_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1192_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1201_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1230_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1230_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1230_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1230_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1234_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1243_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1243_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1249_not_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1249_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1249_not_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2152_or2160_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2152_or_or_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_rm_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1254_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1254_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1254_mux_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1254_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1260_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1272_pre_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1272_pre_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1280_not_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1280_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1286_mux_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp16_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp40_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp40_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp40_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp40_memread_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp46_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp46_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp46_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp46_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp61_not_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp61_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp66_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp66_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp66_mux_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp66_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp830_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp830_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp89_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp93_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp93_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv1176_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1176_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1177_rm_memread_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_conv1177_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1177_rm_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv1183_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1183_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1184_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1184_rm_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1189_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1189_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1190_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1190_rm_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1212_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1212_rm_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv1214_add1217_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv1214_add1217_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1247_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1247_rm_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv1258_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv1258_rm_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv15_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv15_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv18_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv18_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv23_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv23_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv24_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv24_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv29_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv29_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv31_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv31_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv31_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv32_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv32_rm_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv33_rm_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv36_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv36_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv36_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv43_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv43_rm_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv58_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv58_rm_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv64_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv64_rm_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv96_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv96_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv97_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv97_rm_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv_row_rem_off_rm_memread_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_conv_row_rem_off_rm_memread_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_conv_row_rem_off_rm_memread_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_conv_row_rem_off_rm_memread_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_div59_rm_memread_vt_const_31_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_div59_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div59_rm_memread_vt_select_11_b : STD_LOGIC_VECTOR (11 downto 0);
    signal i_div_memread_vt_const_31_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_div_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_memread_vt_select_29_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_ffwd_dst_conv2027_memread_out_dest_data_out_0_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_mul28_memread_out_dest_data_out_1_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_gp_num_x_1_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_gp_num_x_1_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_idxprom105_memread_vt_const_63_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_idxprom105_memread_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom105_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_idxprom49_memread_vt_const_63_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_idxprom49_memread_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom49_memread_vt_select_29_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_inc1237_conv_z_cnt_0_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc1237_conv_z_cnt_0_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc1237_conv_z_cnt_0_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc1237_conv_z_cnt_0_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc1237_memread_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_inc1237_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc1237_memread_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc1275_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_inc1275_memread_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc1275_out_idx_z_0_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1275_out_idx_z_0_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1275_out_idx_z_0_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1275_out_idx_z_0_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1296_gp_num_y_0_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1296_gp_num_y_0_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1296_gp_num_y_0_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1296_gp_num_y_0_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1296_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_inc1296_memread_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc1306_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1306_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1306_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1306_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1334_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1334_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1334_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc1334_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc14_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc14_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc14_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc14_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc76_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_inc76_memread_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc76_win_itm_z_1_memread_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc76_win_itm_z_1_memread_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc76_win_itm_z_1_memread_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc76_win_itm_z_1_memread_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc86_memread_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc86_memread_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc86_memread_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc86_memread_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_mul1229_rm_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul1229_rm_memread_vt_select_16_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul21_memread_a0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul21_memread_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul21_memread_s1 : STD_LOGIC_VECTOR (47 downto 0);
    signal i_mul21_memread_pr : UNSIGNED (47 downto 0);
    signal i_mul21_memread_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_mul27_memread_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul27_memread_b0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul27_memread_s1 : STD_LOGIC_VECTOR (47 downto 0);
    signal i_mul27_memread_pr : UNSIGNED (47 downto 0);
    signal i_mul27_memread_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_mul30_memread_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul30_memread_b0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul30_memread_s1 : STD_LOGIC_VECTOR (47 downto 0);
    signal i_mul30_memread_pr : UNSIGNED (47 downto 0);
    signal i_mul30_memread_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_mul34_memread_a0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul34_memread_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul34_memread_s1 : STD_LOGIC_VECTOR (47 downto 0);
    signal i_mul34_memread_pr : UNSIGNED (47 downto 0);
    signal i_mul34_memread_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_not_rm_memread_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_not_rm_memread_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_not_rm_memread_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_not_rm_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notexit36_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notlhs_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notrhs_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond507_not_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond567_xor_demorgan_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond567_xor_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_xor_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_read8_flag_1_memread_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_read8_flag_1_memread_vt_const_7_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_read8_flag_1_memread_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_read8_flag_1_memread_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memread_10_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memread_9_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sub1178_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1178_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1178_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1178_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1185_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1185_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1185_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1185_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1191_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1191_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1191_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1191_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1213_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1213_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1213_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1213_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1242_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1242_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1242_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1242_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1248_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1248_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1248_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1248_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1253_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1253_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1253_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1253_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1259_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1259_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1259_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub1259_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub60_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub60_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub60_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub60_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub65_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub65_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub65_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub65_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub829_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub829_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub829_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub829_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_bias_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_bottom_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_col_size_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_control_sync_buffer23_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_conv_loop_cnt_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_conv_row_rem_sync_buffer19_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_data_dim1_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_data_dim1xdim2_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_data_dim2_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_group_num_mul_win_size_sync_buffer21_memread_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_group_num_mul_win_size_sync_buffer22_memread_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_group_num_x_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_group_num_y_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_line_size_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_padding_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_pool_size_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_pool_stride_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_weight_dim1_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_weight_dim3_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_weight_dim4_div_lane_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_weights_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_win_size_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_win_size_y_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memread146_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memread146_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memread88_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_win_itm_y_1_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_win_itm_y_1_memread_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_win_itm_y_2_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_win_itm_y_2_memread_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_win_itm_z_1_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_win_itm_z_1_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_align_12_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_align_12_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_align_14_q : STD_LOGIC_VECTOR (39 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_align_14_qint : STD_LOGIC_VECTOR (39 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_align_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_align_15_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_join_16_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_align_12_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_align_12_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_join_13_q : STD_LOGIC_VECTOR (49 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_align_14_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_align_14_qint : STD_LOGIC_VECTOR (33 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_align_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_align_15_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_join_16_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_align_12_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_align_12_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_align_14_q : STD_LOGIC_VECTOR (39 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_align_14_qint : STD_LOGIC_VECTOR (39 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_align_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_align_15_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_join_16_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (72 downto 0);
    signal rightShiftStage0Idx1Rng4_uid660_i_div59_rm_memread_memread69_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0Idx1Pad4_uid661_i_div59_rm_memread_memread69_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1_uid662_i_div59_rm_memread_memread69_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng2_uid669_i_div_memread_memread57_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage0Idx1_uid671_i_div_memread_memread57_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid673_i_div_memread_memread57_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid673_i_div_memread_memread57_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng1_uid679_i_mul1229_rm_memread_memread103_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid679_i_mul1229_rm_memread_memread103_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid680_i_mul1229_rm_memread_memread103_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im0_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im3_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im6_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_im9_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal i_mul98_memread_cma_reset : std_logic;
    type i_mul98_memread_cma_a0type is array(NATURAL range <>) of UNSIGNED(15 downto 0);
    signal i_mul98_memread_cma_a0 : i_mul98_memread_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul98_memread_cma_a0 : signal is true;
    signal i_mul98_memread_cma_c0 : i_mul98_memread_cma_a0type(0 to 0);
    attribute preserve of i_mul98_memread_cma_c0 : signal is true;
    type i_mul98_memread_cma_ptype is array(NATURAL range <>) of UNSIGNED(31 downto 0);
    signal i_mul98_memread_cma_p : i_mul98_memread_cma_ptype(0 to 0);
    signal i_mul98_memread_cma_u : i_mul98_memread_cma_ptype(0 to 0);
    signal i_mul98_memread_cma_w : i_mul98_memread_cma_ptype(0 to 0);
    signal i_mul98_memread_cma_x : i_mul98_memread_cma_ptype(0 to 0);
    signal i_mul98_memread_cma_y : i_mul98_memread_cma_ptype(0 to 0);
    signal i_mul98_memread_cma_s : i_mul98_memread_cma_ptype(0 to 0);
    signal i_mul98_memread_cma_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul98_memread_cma_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul98_memread_cma_ena0 : std_logic;
    signal i_mul98_memread_cma_ena1 : std_logic;
    signal i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_win_itm_z_1_memread_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist1_i_unnamed_memread88_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_notexit36_memread_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_notexit36_memread_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_notexit36_memread_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_notexit36_memread_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_notexit36_memread_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_inc1237_memread_vt_select_0_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_idxprom49_memread_vt_select_29_b_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist9_i_conv31_memread_vt_select_15_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist10_i_conv24_memread_vt_join_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_cmp93_memread_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_cmp46_memread_c_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_cmp40_memread_n_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_cmp1272_pre_memread_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_cmp1260_not_memread_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_cmp12532_rm_memread_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_cmp1243_memread_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_cmp1243_memread_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_cmp1230_memread_c_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist26_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist28_sync_in_aunroll_x_in_c0_eni1_1_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_sync_in_aunroll_x_in_c0_eni1_1_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_sync_in_aunroll_x_in_c0_eni1_1_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_sync_in_aunroll_x_in_c0_eni1_1_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_sync_in_aunroll_x_in_i_valid_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_sync_in_aunroll_x_in_i_valid_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_i_conv97_rm_memread_vt_join_narrowed_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist39_i_conv18_memread_vt_join_narrowed_x_b_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist40_i_conv1214_rm_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist41_i_arrayidx50458_0_memread_memread60_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist42_i_arrayidx106419_0_memread_memread82_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist43_i_arrayidx102400_0_memread_memread79_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist44_bgTrunc_i_sub829_rm_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_bgTrunc_i_sub1253_rm_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_bgTrunc_i_sub1191_rm_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_bgTrunc_i_sub1178_rm_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_bgTrunc_i_inc86_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist49_bgTrunc_i_inc14_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_bgTrunc_i_inc1334_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist51_bgTrunc_i_inc1306_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist52_bgTrunc_i_add35_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_mem_reset0 : std_logic;
    signal redist11_i_conv15_memread_vt_join_q_3_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist11_i_conv15_memread_vt_join_q_3_rdcnt_i : signal is true;
    signal redist11_i_conv15_memread_vt_join_q_3_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_conv15_memread_vt_join_q_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist11_i_conv15_memread_vt_join_q_3_sticky_ena_q : signal is true;
    signal redist11_i_conv15_memread_vt_join_q_3_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_inputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_reset0 : std_logic;
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i : signal is true;
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_eq : std_logic;
    attribute preserve of redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_eq : signal is true;
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena_q : signal is true;
    signal redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_reset0 : std_logic;
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i : signal is true;
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_eq : std_logic;
    attribute preserve of redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_eq : signal is true;
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena_q : signal is true;
    signal redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_inputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_reset0 : std_logic;
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_i : signal is true;
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena_q : signal is true;
    signal redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_reset0 : std_logic;
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_i : signal is true;
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena_q : signal is true;
    signal redist53_bgTrunc_i_add100_memread_sel_x_b_3_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist32_sync_in_aunroll_x_in_i_valid_1(DELAY,803)
    redist32_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist32_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist33_sync_in_aunroll_x_in_i_valid_2(DELAY,804)
    redist33_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist32_sync_in_aunroll_x_in_i_valid_1_q, xout => redist33_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist34_sync_in_aunroll_x_in_i_valid_3(DELAY,805)
    redist34_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist33_sync_in_aunroll_x_in_i_valid_2_q, xout => redist34_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist35_sync_in_aunroll_x_in_i_valid_4(DELAY,806)
    redist35_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist34_sync_in_aunroll_x_in_i_valid_3_q, xout => redist35_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist36_sync_in_aunroll_x_in_i_valid_7(DELAY,807)
    redist36_sync_in_aunroll_x_in_i_valid_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist35_sync_in_aunroll_x_in_i_valid_4_q, xout => redist36_sync_in_aunroll_x_in_i_valid_7_q, clk => clock, aclr => resetn );

    -- redist37_sync_in_aunroll_x_in_i_valid_8(DELAY,808)
    redist37_sync_in_aunroll_x_in_i_valid_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist36_sync_in_aunroll_x_in_i_valid_7_q, xout => redist37_sync_in_aunroll_x_in_i_valid_8_q, clk => clock, aclr => resetn );

    -- dupName_0_c_i32_1gr_x(CONSTANT,37)
    dupName_0_c_i32_1gr_x_q <= "11111111111111111111111111111111";

    -- i_conv1177_rm_memread_vt_const_31(CONSTANT,352)
    i_conv1177_rm_memread_vt_const_31_q <= "000000000000000000000000";

    -- i_syncbuf_pool_size_sync_buffer_memread(BLACKBOX,539)@0
    -- in in_i_dependence@8
    -- in in_valid_in@8
    -- out out_buffer_out@8
    -- out out_valid_out@8
    thei_syncbuf_pool_size_sync_buffer_memread : i_syncbuf_pool_size_sync_buffer_memread123
    PORT MAP (
        in_buffer_in => in_pool_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_7_q,
        out_buffer_out => i_syncbuf_pool_size_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv1177_rm_memread_sel_x(BITSELECT,121)@8
    i_conv1177_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_pool_size_sync_buffer_memread_out_buffer_out(7 downto 0)), 32));

    -- i_conv1177_rm_memread_vt_select_7(BITSELECT,354)@8
    i_conv1177_rm_memread_vt_select_7_b <= i_conv1177_rm_memread_sel_x_b(7 downto 0);

    -- i_conv1177_rm_memread_vt_join(BITJOIN,353)@8
    i_conv1177_rm_memread_vt_join_q <= i_conv1177_rm_memread_vt_const_31_q & i_conv1177_rm_memread_vt_select_7_b;

    -- i_sub1178_rm_memread(ADD,512)@8
    i_sub1178_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv1177_rm_memread_vt_join_q);
    i_sub1178_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub1178_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1178_rm_memread_a) + UNSIGNED(i_sub1178_rm_memread_b));
    i_sub1178_rm_memread_q <= i_sub1178_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1178_rm_memread_sel_x(BITSELECT,24)@8
    bgTrunc_i_sub1178_rm_memread_sel_x_b <= i_sub1178_rm_memread_q(31 downto 0);

    -- redist47_bgTrunc_i_sub1178_rm_memread_sel_x_b_1(DELAY,818)
    redist47_bgTrunc_i_sub1178_rm_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub1178_rm_memread_sel_x_b, xout => redist47_bgTrunc_i_sub1178_rm_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_mul21_memread_multconst_x(CONSTANT,167)
    i_mul21_memread_multconst_x_q <= "0000000000000000";

    -- i_syncbuf_pool_stride_sync_buffer_memread(BLACKBOX,540)@0
    -- in in_i_dependence@8
    -- in in_valid_in@8
    -- out out_buffer_out@8
    -- out out_valid_out@8
    thei_syncbuf_pool_stride_sync_buffer_memread : i_syncbuf_pool_stride_sync_buffer_memread126
    PORT MAP (
        in_buffer_in => in_pool_stride,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_7_q,
        out_buffer_out => i_syncbuf_pool_stride_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv1212_rm_memread_sel_x(BITSELECT,126)@8
    i_conv1212_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_pool_stride_sync_buffer_memread_out_buffer_out(7 downto 0)), 32));

    -- i_conv1212_rm_memread_vt_select_7(BITSELECT,374)@8
    i_conv1212_rm_memread_vt_select_7_b <= i_conv1212_rm_memread_sel_x_b(7 downto 0);

    -- i_conv1212_rm_memread_vt_join(BITJOIN,373)@8
    i_conv1212_rm_memread_vt_join_q <= i_conv1177_rm_memread_vt_const_31_q & i_conv1212_rm_memread_vt_select_7_b;

    -- i_sub1213_rm_memread(SUB,515)@8
    i_sub1213_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv1177_rm_memread_vt_join_q);
    i_sub1213_rm_memread_b <= STD_LOGIC_VECTOR("0" & i_conv1212_rm_memread_vt_join_q);
    i_sub1213_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1213_rm_memread_a) - UNSIGNED(i_sub1213_rm_memread_b));
    i_sub1213_rm_memread_q <= i_sub1213_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1213_rm_memread_sel_x(BITSELECT,27)@8
    bgTrunc_i_sub1213_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(i_sub1213_rm_memread_q(31 downto 0));

    -- i_conv1214_rm_memread_sel_x(BITSELECT,127)@8
    i_conv1214_rm_memread_sel_x_b <= bgTrunc_i_sub1213_rm_memread_sel_x_b(15 downto 0);

    -- redist40_i_conv1214_rm_memread_sel_x_b_1(DELAY,811)
    redist40_i_conv1214_rm_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv1214_rm_memread_sel_x_b, xout => redist40_i_conv1214_rm_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- c_i16_1gr(CONSTANT,214)
    c_i16_1gr_q <= "0000000000000001";

    -- i_add1217_memread(ADD,294)@9
    i_add1217_memread_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out);
    i_add1217_memread_b <= STD_LOGIC_VECTOR("0" & c_i16_1gr_q);
    i_add1217_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add1217_memread_a) + UNSIGNED(i_add1217_memread_b));
    i_add1217_memread_q <= i_add1217_memread_o(16 downto 0);

    -- bgTrunc_i_add1217_memread_sel_x(BITSELECT,4)@9
    bgTrunc_i_add1217_memread_sel_x_b <= i_add1217_memread_q(15 downto 0);

    -- i_conv1214_add1217_memread(MUX,375)@9
    i_conv1214_add1217_memread_s <= i_cmp1179_memread_q;
    i_conv1214_add1217_memread_combproc: PROCESS (i_conv1214_add1217_memread_s, bgTrunc_i_add1217_memread_sel_x_b, redist40_i_conv1214_rm_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_conv1214_add1217_memread_s) IS
            WHEN "0" => i_conv1214_add1217_memread_q <= bgTrunc_i_add1217_memread_sel_x_b;
            WHEN "1" => i_conv1214_add1217_memread_q <= redist40_i_conv1214_rm_memread_sel_x_b_1_q;
            WHEN OTHERS => i_conv1214_add1217_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- c_i32_1gr(CONSTANT,219)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_syncbuf_group_num_mul_win_size_sync_buffer21_memread(BLACKBOX,533)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_group_num_mul_win_size_sync_buffer21_memread : i_syncbuf_group_num_mul_win_size_sync_buffer21_memread85
    PORT MAP (
        in_buffer_in => in_group_num_mul_win_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_group_num_mul_win_size_sync_buffer21_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp12_memread(LOGICAL,335)@1
    i_cmp12_memread_q <= "1" WHEN bgTrunc_i_inc14_memread_sel_x_b = i_syncbuf_group_num_mul_win_size_sync_buffer21_memread_out_buffer_out ELSE "0";

    -- i_syncbuf_group_num_mul_win_size_sync_buffer22_memread(BLACKBOX,534)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_group_num_mul_win_size_sync_buffer22_memread : i_syncbuf_group_num_mul_win_size_sync_buffer22_memread61
    PORT MAP (
        in_buffer_in => in_group_num_mul_win_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_group_num_mul_win_size_sync_buffer22_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp12532_rm_memread(LOGICAL,327)@1
    i_cmp12532_rm_memread_q <= "1" WHEN i_syncbuf_group_num_mul_win_size_sync_buffer22_memread_out_buffer_out = i_mul98_memread_multconst_x_q ELSE "0";

    -- i_unnamed_memread88(LOGICAL,551)@1
    i_unnamed_memread88_q <= i_cmp12532_rm_memread_q or i_cmp12_memread_q;

    -- i_notexit36_memread(LOGICAL,497)@1
    i_notexit36_memread_q <= i_unnamed_memread88_q xor VCC_q;

    -- redist2_i_notexit36_memread_q_1(DELAY,773)
    redist2_i_notexit36_memread_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_notexit36_memread_q, xout => redist2_i_notexit36_memread_q_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_index_0548_push13_memread(BLACKBOX,288)@2
    -- out out_feedback_out_13@20000000
    -- out out_feedback_valid_out_13@20000000
    thei_acl_push_i32_index_0548_push13_memread : i_acl_push_i32_index_0548_push13_memread93
    PORT MAP (
        in_data_in => redist49_bgTrunc_i_inc14_memread_sel_x_b_1_q,
        in_feedback_stall_in_13 => i_acl_pop_i32_index_0548_pop13_memread_out_feedback_stall_out_13,
        in_notexit36 => redist2_i_notexit36_memread_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_13 => i_acl_push_i32_index_0548_push13_memread_out_feedback_out_13,
        out_feedback_valid_out_13 => i_acl_push_i32_index_0548_push13_memread_out_feedback_valid_out_13,
        clock => clock,
        resetn => resetn
    );

    -- i_mul98_memread_multconst_x(CONSTANT,175)
    i_mul98_memread_multconst_x_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_index_0548_pop13_memread(BLACKBOX,275)@1
    -- out out_feedback_stall_out_13@20000000
    thei_acl_pop_i32_index_0548_pop13_memread : i_acl_pop_i32_index_0548_pop13_memread31
    PORT MAP (
        in_data_in => i_mul98_memread_multconst_x_q,
        in_dir => in_c0_eni1_1,
        in_feedback_in_13 => i_acl_push_i32_index_0548_push13_memread_out_feedback_out_13,
        in_feedback_valid_in_13 => i_acl_push_i32_index_0548_push13_memread_out_feedback_valid_out_13,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_index_0548_pop13_memread_out_data_out,
        out_feedback_stall_out_13 => i_acl_pop_i32_index_0548_pop13_memread_out_feedback_stall_out_13,
        clock => clock,
        resetn => resetn
    );

    -- i_inc14_memread(ADD,478)@1
    i_inc14_memread_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_index_0548_pop13_memread_out_data_out);
    i_inc14_memread_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc14_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc14_memread_a) + UNSIGNED(i_inc14_memread_b));
    i_inc14_memread_q <= i_inc14_memread_o(32 downto 0);

    -- bgTrunc_i_inc14_memread_sel_x(BITSELECT,16)@1
    bgTrunc_i_inc14_memread_sel_x_b <= i_inc14_memread_q(31 downto 0);

    -- redist49_bgTrunc_i_inc14_memread_sel_x_b_1(DELAY,820)
    redist49_bgTrunc_i_inc14_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc14_memread_sel_x_b, xout => redist49_bgTrunc_i_inc14_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add45_rm_memread_vt_const_31(CONSTANT,299)
    i_add45_rm_memread_vt_const_31_q <= "000000000000000";

    -- leftShiftStage0Idx1Rng1_uid679_i_mul1229_rm_memread_memread103_shift_x(BITSELECT,678)@2
    leftShiftStage0Idx1Rng1_uid679_i_mul1229_rm_memread_memread103_shift_x_in <= i_conv97_rm_memread_vt_join_q(30 downto 0);
    leftShiftStage0Idx1Rng1_uid679_i_mul1229_rm_memread_memread103_shift_x_b <= leftShiftStage0Idx1Rng1_uid679_i_mul1229_rm_memread_memread103_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid680_i_mul1229_rm_memread_memread103_shift_x(BITJOIN,679)@2
    leftShiftStage0Idx1_uid680_i_mul1229_rm_memread_memread103_shift_x_q <= leftShiftStage0Idx1Rng1_uid679_i_mul1229_rm_memread_memread103_shift_x_b & GND_q;

    -- i_syncbuf_win_size_sync_buffer_memread(BLACKBOX,545)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_win_size_sync_buffer_memread : i_syncbuf_win_size_sync_buffer_memread75
    PORT MAP (
        in_buffer_in => in_win_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_win_size_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv97_rm_memread_sel_x(BITSELECT,145)@2
    i_conv97_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_win_size_sync_buffer_memread_out_buffer_out(15 downto 0)), 32));

    -- i_conv97_rm_memread_vt_select_15(BITSELECT,440)@2
    i_conv97_rm_memread_vt_select_15_b <= i_conv97_rm_memread_sel_x_b(15 downto 0);

    -- i_conv97_rm_memread_vt_join(BITJOIN,439)@2
    i_conv97_rm_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv97_rm_memread_vt_select_15_b;

    -- leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x(MUX,681)@2
    leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_s <= VCC_q;
    leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_combproc: PROCESS (leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_s, i_conv97_rm_memread_vt_join_q, leftShiftStage0Idx1_uid680_i_mul1229_rm_memread_memread103_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_q <= i_conv97_rm_memread_vt_join_q;
            WHEN "1" => leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_q <= leftShiftStage0Idx1_uid680_i_mul1229_rm_memread_memread103_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mul1229_rm_memread_vt_select_16(BITSELECT,490)@2
    i_mul1229_rm_memread_vt_select_16_b <= leftShiftStage0_uid682_i_mul1229_rm_memread_memread103_shift_x_q(16 downto 1);

    -- i_mul1229_rm_memread_vt_join(BITJOIN,489)@2
    i_mul1229_rm_memread_vt_join_q <= i_add45_rm_memread_vt_const_31_q & i_mul1229_rm_memread_vt_select_16_b & GND_q;

    -- i_cmp1230_memread(COMPARE,320)@2 + 1
    i_cmp1230_memread_a <= STD_LOGIC_VECTOR("00" & i_mul1229_rm_memread_vt_join_q);
    i_cmp1230_memread_b <= STD_LOGIC_VECTOR("00" & redist49_bgTrunc_i_inc14_memread_sel_x_b_1_q);
    i_cmp1230_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp1230_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp1230_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp1230_memread_a) - UNSIGNED(i_cmp1230_memread_b));
        END IF;
    END PROCESS;
    i_cmp1230_memread_c(0) <= i_cmp1230_memread_o(33);

    -- redist20_i_cmp1230_memread_c_7(DELAY,791)
    redist20_i_cmp1230_memread_c_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1230_memread_c, xout => redist20_i_cmp1230_memread_c_7_q, clk => clock, aclr => resetn );

    -- i_acl_2090_memread(LOGICAL,229)@9
    i_acl_2090_memread_q <= redist20_i_cmp1230_memread_c_7_q and i_cmp830_not_memread_q;

    -- i_acl_2108_memread(MUX,244)@9
    i_acl_2108_memread_s <= i_acl_2090_memread_q;
    i_acl_2108_memread_combproc: PROCESS (i_acl_2108_memread_s, i_conv1214_add1217_memread_q, i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out)
    BEGIN
        CASE (i_acl_2108_memread_s) IS
            WHEN "0" => i_acl_2108_memread_q <= i_conv1214_add1217_memread_q;
            WHEN "1" => i_acl_2108_memread_q <= i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out;
            WHEN OTHERS => i_acl_2108_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2092_demorgan_memread(LOGICAL,231)@9
    i_acl_2092_demorgan_memread_q <= i_cmp830_memread_q or redist20_i_cmp1230_memread_c_7_q;

    -- i_acl_2109_memread(MUX,245)@9
    i_acl_2109_memread_s <= i_acl_2092_demorgan_memread_q;
    i_acl_2109_memread_combproc: PROCESS (i_acl_2109_memread_s, i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out, i_acl_2108_memread_q)
    BEGIN
        CASE (i_acl_2109_memread_s) IS
            WHEN "0" => i_acl_2109_memread_q <= i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out;
            WHEN "1" => i_acl_2109_memread_q <= i_acl_2108_memread_q;
            WHEN OTHERS => i_acl_2109_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp1043_not_rm_memread(LOGICAL,313)@9
    i_cmp1043_not_rm_memread_q <= i_cmp1043_rm_memread_q xor VCC_q;

    -- i_acl_2094_memread(LOGICAL,233)@9
    i_acl_2094_memread_q <= i_cmp830_memread_q and i_cmp1043_not_rm_memread_q;

    -- i_acl_2110_memread(MUX,246)@9
    i_acl_2110_memread_s <= i_acl_2094_memread_q;
    i_acl_2110_memread_combproc: PROCESS (i_acl_2110_memread_s, i_acl_2109_memread_q, i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out)
    BEGIN
        CASE (i_acl_2110_memread_s) IS
            WHEN "0" => i_acl_2110_memread_q <= i_acl_2109_memread_q;
            WHEN "1" => i_acl_2110_memread_q <= i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out;
            WHEN OTHERS => i_acl_2110_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2113_memread(MUX,249)@9
    i_acl_2113_memread_s <= i_acl_2090_memread_q;
    i_acl_2113_memread_combproc: PROCESS (i_acl_2113_memread_s, i_add1197_memread_memread117_q, i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out)
    BEGIN
        CASE (i_acl_2113_memread_s) IS
            WHEN "0" => i_acl_2113_memread_q <= i_add1197_memread_memread117_q;
            WHEN "1" => i_acl_2113_memread_q <= i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out;
            WHEN OTHERS => i_acl_2113_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2114_memread(MUX,250)@9
    i_acl_2114_memread_s <= i_acl_2092_demorgan_memread_q;
    i_acl_2114_memread_combproc: PROCESS (i_acl_2114_memread_s, i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out, i_acl_2113_memread_q)
    BEGIN
        CASE (i_acl_2114_memread_s) IS
            WHEN "0" => i_acl_2114_memread_q <= i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out;
            WHEN "1" => i_acl_2114_memread_q <= i_acl_2113_memread_q;
            WHEN OTHERS => i_acl_2114_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2115_memread(MUX,251)@9
    i_acl_2115_memread_s <= i_acl_2094_memread_q;
    i_acl_2115_memread_combproc: PROCESS (i_acl_2115_memread_s, i_acl_2114_memread_q, i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out)
    BEGIN
        CASE (i_acl_2115_memread_s) IS
            WHEN "0" => i_acl_2115_memread_q <= i_acl_2114_memread_q;
            WHEN "1" => i_acl_2115_memread_q <= i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out;
            WHEN OTHERS => i_acl_2115_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2116_memread(MUX,252)@9
    i_acl_2116_memread_s <= i_reduction_memread_10_memread_q;
    i_acl_2116_memread_combproc: PROCESS (i_acl_2116_memread_s, i_acl_2115_memread_q, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2116_memread_s) IS
            WHEN "0" => i_acl_2116_memread_q <= i_acl_2115_memread_q;
            WHEN "1" => i_acl_2116_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2116_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2117_memread(MUX,253)@9
    i_acl_2117_memread_s <= i_acl_2101_memread_q;
    i_acl_2117_memread_combproc: PROCESS (i_acl_2117_memread_s, i_acl_2116_memread_q, i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out)
    BEGIN
        CASE (i_acl_2117_memread_s) IS
            WHEN "0" => i_acl_2117_memread_q <= i_acl_2116_memread_q;
            WHEN "1" => i_acl_2117_memread_q <= i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out;
            WHEN OTHERS => i_acl_2117_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_row_cnt_0546_push15_memread(BLACKBOX,282)@9
    -- out out_feedback_out_15@20000000
    -- out out_feedback_valid_out_15@20000000
    thei_acl_push_i16_row_cnt_0546_push15_memread : i_acl_push_i16_row_cnt_0546_push15_memread119
    PORT MAP (
        in_data_in => i_acl_2117_memread_q,
        in_feedback_stall_in_15 => i_acl_pop_i16_row_cnt_0546_pop15_memread_out_feedback_stall_out_15,
        in_notexit36 => redist6_i_notexit36_memread_q_8_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_feedback_out_15 => i_acl_push_i16_row_cnt_0546_push15_memread_out_feedback_out_15,
        out_feedback_valid_out_15 => i_acl_push_i16_row_cnt_0546_push15_memread_out_feedback_valid_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_row_cnt_0546_pop15_memread(BLACKBOX,270)@9
    -- out out_feedback_stall_out_15@20000000
    thei_acl_pop_i16_row_cnt_0546_pop15_memread : i_acl_pop_i16_row_cnt_0546_pop15_memread112
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_8_q,
        in_feedback_in_15 => i_acl_push_i16_row_cnt_0546_push15_memread_out_feedback_out_15,
        in_feedback_valid_in_15 => i_acl_push_i16_row_cnt_0546_push15_memread_out_feedback_valid_out_15,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_data_out => i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out,
        out_feedback_stall_out_15 => i_acl_pop_i16_row_cnt_0546_pop15_memread_out_feedback_stall_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_add1197_memread(ADD,292)@9
    i_add1197_memread_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out);
    i_add1197_memread_b <= STD_LOGIC_VECTOR("0" & c_i16_1gr_q);
    i_add1197_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add1197_memread_a) + UNSIGNED(i_add1197_memread_b));
    i_add1197_memread_q <= i_add1197_memread_o(16 downto 0);

    -- bgTrunc_i_add1197_memread_sel_x(BITSELECT,3)@9
    bgTrunc_i_add1197_memread_sel_x_b <= i_add1197_memread_q(15 downto 0);

    -- i_syncbuf_line_size_sync_buffer_memread(BLACKBOX,537)@0
    -- in in_i_dependence@8
    -- in in_valid_in@8
    -- out out_buffer_out@8
    -- out out_valid_out@8
    thei_syncbuf_line_size_sync_buffer_memread : i_syncbuf_line_size_sync_buffer_memread114
    PORT MAP (
        in_buffer_in => in_line_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_7_q,
        out_buffer_out => i_syncbuf_line_size_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv1190_rm_memread_sel_x(BITSELECT,125)@8
    i_conv1190_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_line_size_sync_buffer_memread_out_buffer_out(15 downto 0)), 32));

    -- i_conv1190_rm_memread_vt_select_15(BITSELECT,370)@8
    i_conv1190_rm_memread_vt_select_15_b <= i_conv1190_rm_memread_sel_x_b(15 downto 0);

    -- i_conv1190_rm_memread_vt_join(BITJOIN,369)@8
    i_conv1190_rm_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv1190_rm_memread_vt_select_15_b;

    -- i_sub1191_rm_memread(ADD,514)@8
    i_sub1191_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv1190_rm_memread_vt_join_q);
    i_sub1191_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub1191_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1191_rm_memread_a) + UNSIGNED(i_sub1191_rm_memread_b));
    i_sub1191_rm_memread_q <= i_sub1191_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1191_rm_memread_sel_x(BITSELECT,26)@8
    bgTrunc_i_sub1191_rm_memread_sel_x_b <= i_sub1191_rm_memread_q(31 downto 0);

    -- redist46_bgTrunc_i_sub1191_rm_memread_sel_x_b_1(DELAY,817)
    redist46_bgTrunc_i_sub1191_rm_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub1191_rm_memread_sel_x_b, xout => redist46_bgTrunc_i_sub1191_rm_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv1189_memread_sel_x(BITSELECT,124)@9
    i_conv1189_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_row_cnt_0546_pop15_memread_out_data_out(15 downto 0)), 32));

    -- i_conv1189_memread_vt_select_15(BITSELECT,366)@9
    i_conv1189_memread_vt_select_15_b <= i_conv1189_memread_sel_x_b(15 downto 0);

    -- i_conv1189_memread_vt_join(BITJOIN,365)@9
    i_conv1189_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv1189_memread_vt_select_15_b;

    -- i_cmp1192_memread(LOGICAL,318)@9
    i_cmp1192_memread_q <= "1" WHEN i_conv1189_memread_vt_join_q = redist46_bgTrunc_i_sub1191_rm_memread_sel_x_b_1_q ELSE "0";

    -- i_add1197_memread_memread117(MUX,293)@9
    i_add1197_memread_memread117_s <= i_cmp1192_memread_q;
    i_add1197_memread_memread117_combproc: PROCESS (i_add1197_memread_memread117_s, bgTrunc_i_add1197_memread_sel_x_b, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_add1197_memread_memread117_s) IS
            WHEN "0" => i_add1197_memread_memread117_q <= bgTrunc_i_add1197_memread_sel_x_b;
            WHEN "1" => i_add1197_memread_memread117_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_add1197_memread_memread117_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp1201_memread(LOGICAL,319)@9
    i_cmp1201_memread_q <= "1" WHEN i_add1197_memread_memread117_q = i_mul21_memread_multconst_x_q ELSE "0";

    -- i_syncbuf_col_size_sync_buffer_memread(BLACKBOX,526)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_col_size_sync_buffer_memread : i_syncbuf_col_size_sync_buffer_memread109
    PORT MAP (
        in_buffer_in => in_col_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_buffer_out => i_syncbuf_col_size_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv1184_rm_memread_sel_x(BITSELECT,123)@9
    i_conv1184_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_col_size_sync_buffer_memread_out_buffer_out(15 downto 0)), 32));

    -- i_conv1184_rm_memread_vt_select_15(BITSELECT,362)@9
    i_conv1184_rm_memread_vt_select_15_b <= i_conv1184_rm_memread_sel_x_b(15 downto 0);

    -- i_conv1184_rm_memread_vt_join(BITJOIN,361)@9
    i_conv1184_rm_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv1184_rm_memread_vt_select_15_b;

    -- i_sub1185_rm_memread(ADD,513)@9
    i_sub1185_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv1184_rm_memread_vt_join_q);
    i_sub1185_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub1185_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1185_rm_memread_a) + UNSIGNED(i_sub1185_rm_memread_b));
    i_sub1185_rm_memread_q <= i_sub1185_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1185_rm_memread_sel_x(BITSELECT,25)@9
    bgTrunc_i_sub1185_rm_memread_sel_x_b <= i_sub1185_rm_memread_q(31 downto 0);

    -- i_conv1183_memread_sel_x(BITSELECT,122)@9
    i_conv1183_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out(15 downto 0)), 32));

    -- i_conv1183_memread_vt_select_15(BITSELECT,358)@9
    i_conv1183_memread_vt_select_15_b <= i_conv1183_memread_sel_x_b(15 downto 0);

    -- i_conv1183_memread_vt_join(BITJOIN,357)@9
    i_conv1183_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv1183_memread_vt_select_15_b;

    -- i_cmp1186_memread(LOGICAL,316)@9
    i_cmp1186_memread_q <= "1" WHEN i_conv1183_memread_vt_join_q = bgTrunc_i_sub1185_rm_memread_sel_x_b ELSE "0";

    -- i_reduction_memread_9_memread(LOGICAL,511)@9
    i_reduction_memread_9_memread_q <= i_cmp1186_memread_q and i_cmp1201_memread_q;

    -- i_reduction_memread_10_memread(LOGICAL,510)@9
    i_reduction_memread_10_memread_q <= i_acl_2132_memread_q and i_reduction_memread_9_memread_q;

    -- i_acl_2111_memread(MUX,247)@9
    i_acl_2111_memread_s <= i_reduction_memread_10_memread_q;
    i_acl_2111_memread_combproc: PROCESS (i_acl_2111_memread_s, i_acl_2110_memread_q, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2111_memread_s) IS
            WHEN "0" => i_acl_2111_memread_q <= i_acl_2110_memread_q;
            WHEN "1" => i_acl_2111_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2111_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp1186_not_memread(LOGICAL,317)@9
    i_cmp1186_not_memread_q <= i_cmp1186_memread_q xor VCC_q;

    -- i_acl_2100_memread(LOGICAL,236)@9
    i_acl_2100_memread_q <= i_cmp1043_rm_memread_q and i_cmp1186_not_memread_q;

    -- i_acl_2101_memread(LOGICAL,237)@9
    i_acl_2101_memread_q <= i_cmp830_memread_q and i_acl_2100_memread_q;

    -- i_acl_2112_memread(MUX,248)@9
    i_acl_2112_memread_s <= i_acl_2101_memread_q;
    i_acl_2112_memread_combproc: PROCESS (i_acl_2112_memread_s, i_acl_2111_memread_q, i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out)
    BEGIN
        CASE (i_acl_2112_memread_s) IS
            WHEN "0" => i_acl_2112_memread_q <= i_acl_2111_memread_q;
            WHEN "1" => i_acl_2112_memread_q <= i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out;
            WHEN OTHERS => i_acl_2112_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_row_pool_cnt_0545_push16_memread(BLACKBOX,283)@9
    -- out out_feedback_out_16@20000000
    -- out out_feedback_valid_out_16@20000000
    thei_acl_push_i16_row_pool_cnt_0545_push16_memread : i_acl_push_i16_row_pool_cnt_0545_push16_memread128
    PORT MAP (
        in_data_in => i_acl_2112_memread_q,
        in_feedback_stall_in_16 => i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_feedback_stall_out_16,
        in_notexit36 => redist6_i_notexit36_memread_q_8_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_feedback_out_16 => i_acl_push_i16_row_pool_cnt_0545_push16_memread_out_feedback_out_16,
        out_feedback_valid_out_16 => i_acl_push_i16_row_pool_cnt_0545_push16_memread_out_feedback_valid_out_16,
        clock => clock,
        resetn => resetn
    );

    -- redist28_sync_in_aunroll_x_in_c0_eni1_1_1(DELAY,799)
    redist28_sync_in_aunroll_x_in_c0_eni1_1_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni1_1, xout => redist28_sync_in_aunroll_x_in_c0_eni1_1_1_q, clk => clock, aclr => resetn );

    -- redist29_sync_in_aunroll_x_in_c0_eni1_1_2(DELAY,800)
    redist29_sync_in_aunroll_x_in_c0_eni1_1_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist28_sync_in_aunroll_x_in_c0_eni1_1_1_q, xout => redist29_sync_in_aunroll_x_in_c0_eni1_1_2_q, clk => clock, aclr => resetn );

    -- redist30_sync_in_aunroll_x_in_c0_eni1_1_3(DELAY,801)
    redist30_sync_in_aunroll_x_in_c0_eni1_1_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist29_sync_in_aunroll_x_in_c0_eni1_1_2_q, xout => redist30_sync_in_aunroll_x_in_c0_eni1_1_3_q, clk => clock, aclr => resetn );

    -- redist31_sync_in_aunroll_x_in_c0_eni1_1_8(DELAY,802)
    redist31_sync_in_aunroll_x_in_c0_eni1_1_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist30_sync_in_aunroll_x_in_c0_eni1_1_3_q, xout => redist31_sync_in_aunroll_x_in_c0_eni1_1_8_q, clk => clock, aclr => resetn );

    -- i_acl_pop_i16_row_pool_cnt_0545_pop16_memread(BLACKBOX,271)@9
    -- out out_feedback_stall_out_16@20000000
    thei_acl_pop_i16_row_pool_cnt_0545_pop16_memread : i_acl_pop_i16_row_pool_cnt_0545_pop16_memread121
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_8_q,
        in_feedback_in_16 => i_acl_push_i16_row_pool_cnt_0545_push16_memread_out_feedback_out_16,
        in_feedback_valid_in_16 => i_acl_push_i16_row_pool_cnt_0545_push16_memread_out_feedback_valid_out_16,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_data_out => i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out,
        out_feedback_stall_out_16 => i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_feedback_stall_out_16,
        clock => clock,
        resetn => resetn
    );

    -- i_conv1176_memread_sel_x(BITSELECT,120)@9
    i_conv1176_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_row_pool_cnt_0545_pop16_memread_out_data_out(15 downto 0)), 32));

    -- i_conv1176_memread_vt_select_15(BITSELECT,350)@9
    i_conv1176_memread_vt_select_15_b <= i_conv1176_memread_sel_x_b(15 downto 0);

    -- i_conv1176_memread_vt_join(BITJOIN,349)@9
    i_conv1176_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv1176_memread_vt_select_15_b;

    -- i_cmp1179_memread(LOGICAL,315)@9
    i_cmp1179_memread_q <= "1" WHEN i_conv1176_memread_vt_join_q = redist47_bgTrunc_i_sub1178_rm_memread_sel_x_b_1_q ELSE "0";

    -- i_add1223_memread(ADD,295)@9
    i_add1223_memread_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out);
    i_add1223_memread_b <= STD_LOGIC_VECTOR("0" & c_i16_1gr_q);
    i_add1223_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add1223_memread_a) + UNSIGNED(i_add1223_memread_b));
    i_add1223_memread_q <= i_add1223_memread_o(16 downto 0);

    -- bgTrunc_i_add1223_memread_sel_x(BITSELECT,5)@9
    bgTrunc_i_add1223_memread_sel_x_b <= i_add1223_memread_q(15 downto 0);

    -- i_acl_2103_memread(MUX,239)@9
    i_acl_2103_memread_s <= i_acl_2090_memread_q;
    i_acl_2103_memread_combproc: PROCESS (i_acl_2103_memread_s, i_mul21_memread_multconst_x_q, i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out)
    BEGIN
        CASE (i_acl_2103_memread_s) IS
            WHEN "0" => i_acl_2103_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN "1" => i_acl_2103_memread_q <= i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out;
            WHEN OTHERS => i_acl_2103_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2104_memread(MUX,240)@9
    i_acl_2104_memread_s <= i_acl_2092_demorgan_memread_q;
    i_acl_2104_memread_combproc: PROCESS (i_acl_2104_memread_s, i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out, i_acl_2103_memread_q)
    BEGIN
        CASE (i_acl_2104_memread_s) IS
            WHEN "0" => i_acl_2104_memread_q <= i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out;
            WHEN "1" => i_acl_2104_memread_q <= i_acl_2103_memread_q;
            WHEN OTHERS => i_acl_2104_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2105_memread(MUX,241)@9
    i_acl_2105_memread_s <= i_acl_2094_memread_q;
    i_acl_2105_memread_combproc: PROCESS (i_acl_2105_memread_s, i_acl_2104_memread_q, i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out)
    BEGIN
        CASE (i_acl_2105_memread_s) IS
            WHEN "0" => i_acl_2105_memread_q <= i_acl_2104_memread_q;
            WHEN "1" => i_acl_2105_memread_q <= i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out;
            WHEN OTHERS => i_acl_2105_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2106_memread(MUX,242)@9
    i_acl_2106_memread_s <= i_reduction_memread_10_memread_q;
    i_acl_2106_memread_combproc: PROCESS (i_acl_2106_memread_s, i_acl_2105_memread_q, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2106_memread_s) IS
            WHEN "0" => i_acl_2106_memread_q <= i_acl_2105_memread_q;
            WHEN "1" => i_acl_2106_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2106_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2107_memread(MUX,243)@9
    i_acl_2107_memread_s <= i_acl_2101_memread_q;
    i_acl_2107_memread_combproc: PROCESS (i_acl_2107_memread_s, i_acl_2106_memread_q, bgTrunc_i_add1223_memread_sel_x_b)
    BEGIN
        CASE (i_acl_2107_memread_s) IS
            WHEN "0" => i_acl_2107_memread_q <= i_acl_2106_memread_q;
            WHEN "1" => i_acl_2107_memread_q <= bgTrunc_i_add1223_memread_sel_x_b;
            WHEN OTHERS => i_acl_2107_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_line_buf_ptr_0544_push17_memread(BLACKBOX,280)@9
    -- out out_feedback_out_17@20000000
    -- out out_feedback_valid_out_17@20000000
    thei_acl_push_i16_line_buf_ptr_0544_push17_memread : i_acl_push_i16_line_buf_ptr_0544_push17_memread130
    PORT MAP (
        in_data_in => i_acl_2107_memread_q,
        in_feedback_stall_in_17 => i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_feedback_stall_out_17,
        in_notexit36 => redist6_i_notexit36_memread_q_8_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_feedback_out_17 => i_acl_push_i16_line_buf_ptr_0544_push17_memread_out_feedback_out_17,
        out_feedback_valid_out_17 => i_acl_push_i16_line_buf_ptr_0544_push17_memread_out_feedback_valid_out_17,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_line_buf_ptr_0544_pop17_memread(BLACKBOX,268)@9
    -- out out_feedback_stall_out_17@20000000
    thei_acl_pop_i16_line_buf_ptr_0544_pop17_memread : i_acl_pop_i16_line_buf_ptr_0544_pop17_memread107
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_8_q,
        in_feedback_in_17 => i_acl_push_i16_line_buf_ptr_0544_push17_memread_out_feedback_out_17,
        in_feedback_valid_in_17 => i_acl_push_i16_line_buf_ptr_0544_push17_memread_out_feedback_valid_out_17,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_data_out => i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out,
        out_feedback_stall_out_17 => i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_feedback_stall_out_17,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp830_not_memread(LOGICAL,344)@9
    i_cmp830_not_memread_q <= i_cmp830_memread_q xor VCC_q;

    -- i_acl_2132_memread(LOGICAL,264)@9
    i_acl_2132_memread_q <= i_cmp830_memread_q and i_cmp1043_rm_memread_q;

    -- c_i8_0gr(CONSTANT,223)
    c_i8_0gr_q <= "00000000";

    -- i_and1042_rm_memread_vt_const_7(CONSTANT,305)
    i_and1042_rm_memread_vt_const_7_q <= "000000";

    -- c_i8_2gr(CONSTANT,225)
    c_i8_2gr_q <= "00000010";

    -- i_syncbuf_control_sync_buffer23_memread(BLACKBOX,527)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_control_sync_buffer23_memread : i_syncbuf_control_sync_buffer23_memread104
    PORT MAP (
        in_buffer_in => in_control,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_buffer_out => i_syncbuf_control_sync_buffer23_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_and1042_rm_memread(LOGICAL,303)@9
    i_and1042_rm_memread_q <= i_syncbuf_control_sync_buffer23_memread_out_buffer_out and c_i8_2gr_q;

    -- i_and1042_rm_memread_vt_select_1(BITSELECT,307)@9
    i_and1042_rm_memread_vt_select_1_b <= i_and1042_rm_memread_q(1 downto 1);

    -- i_and1042_rm_memread_vt_join(BITJOIN,306)@9
    i_and1042_rm_memread_vt_join_q <= i_and1042_rm_memread_vt_const_7_q & i_and1042_rm_memread_vt_select_1_b & GND_q;

    -- i_cmp1043_rm_memread(LOGICAL,314)@9
    i_cmp1043_rm_memread_q <= "1" WHEN i_and1042_rm_memread_vt_join_q = c_i8_0gr_q ELSE "0";

    -- i_syncbuf_conv_loop_cnt_sync_buffer_memread(BLACKBOX,528)@0
    -- in in_i_dependence@8
    -- in in_valid_in@8
    -- out out_buffer_out@8
    -- out out_valid_out@8
    thei_syncbuf_conv_loop_cnt_sync_buffer_memread : i_syncbuf_conv_loop_cnt_sync_buffer_memread100
    PORT MAP (
        in_buffer_in => in_conv_loop_cnt,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_7_q,
        out_buffer_out => i_syncbuf_conv_loop_cnt_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_sub829_rm_memread(ADD,522)@8
    i_sub829_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_conv_loop_cnt_sync_buffer_memread_out_buffer_out);
    i_sub829_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub829_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub829_rm_memread_a) + UNSIGNED(i_sub829_rm_memread_b));
    i_sub829_rm_memread_q <= i_sub829_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub829_rm_memread_sel_x(BITSELECT,34)@8
    bgTrunc_i_sub829_rm_memread_sel_x_b <= i_sub829_rm_memread_q(31 downto 0);

    -- redist44_bgTrunc_i_sub829_rm_memread_sel_x_b_1(DELAY,815)
    redist44_bgTrunc_i_sub829_rm_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub829_rm_memread_sel_x_b, xout => redist44_bgTrunc_i_sub829_rm_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp830_memread(LOGICAL,343)@9
    i_cmp830_memread_q <= "1" WHEN i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_data_out = redist44_bgTrunc_i_sub829_rm_memread_sel_x_b_1_q ELSE "0";

    -- i_sub1242_rm_memread(ADD,516)@2
    i_sub1242_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv97_rm_memread_vt_join_q);
    i_sub1242_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub1242_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1242_rm_memread_a) + UNSIGNED(i_sub1242_rm_memread_b));
    i_sub1242_rm_memread_q <= i_sub1242_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1242_rm_memread_sel_x(BITSELECT,28)@2
    bgTrunc_i_sub1242_rm_memread_sel_x_b <= i_sub1242_rm_memread_q(31 downto 0);

    -- redist3_i_notexit36_memread_q_2(DELAY,774)
    redist3_i_notexit36_memread_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_notexit36_memread_q_1_q, xout => redist3_i_notexit36_memread_q_2_q, clk => clock, aclr => resetn );

    -- i_inc1334_memread(ADD,477)@2
    i_inc1334_memread_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out);
    i_inc1334_memread_b <= STD_LOGIC_VECTOR("0" & c_i16_1gr_q);
    i_inc1334_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc1334_memread_a) + UNSIGNED(i_inc1334_memread_b));
    i_inc1334_memread_q <= i_inc1334_memread_o(16 downto 0);

    -- bgTrunc_i_inc1334_memread_sel_x(BITSELECT,15)@2
    bgTrunc_i_inc1334_memread_sel_x_b <= i_inc1334_memread_q(15 downto 0);

    -- redist50_bgTrunc_i_inc1334_memread_sel_x_b_1(DELAY,821)
    redist50_bgTrunc_i_inc1334_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc1334_memread_sel_x_b, xout => redist50_bgTrunc_i_inc1334_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_acl_2131_memread(MUX,263)@3
    i_acl_2131_memread_s <= i_cmp1243_memread_q;
    i_acl_2131_memread_combproc: PROCESS (i_acl_2131_memread_s, redist50_bgTrunc_i_inc1334_memread_sel_x_b_1_q, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2131_memread_s) IS
            WHEN "0" => i_acl_2131_memread_q <= redist50_bgTrunc_i_inc1334_memread_sel_x_b_1_q;
            WHEN "1" => i_acl_2131_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2131_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_win_itm_xyz_0547_push14_memread(BLACKBOX,284)@3
    -- out out_feedback_out_14@20000000
    -- out out_feedback_valid_out_14@20000000
    thei_acl_push_i16_win_itm_xyz_0547_push14_memread : i_acl_push_i16_win_itm_xyz_0547_push14_memread98
    PORT MAP (
        in_data_in => i_acl_2131_memread_q,
        in_feedback_stall_in_14 => i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_feedback_stall_out_14,
        in_notexit36 => redist3_i_notexit36_memread_q_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist33_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_14 => i_acl_push_i16_win_itm_xyz_0547_push14_memread_out_feedback_out_14,
        out_feedback_valid_out_14 => i_acl_push_i16_win_itm_xyz_0547_push14_memread_out_feedback_valid_out_14,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_win_itm_xyz_0547_pop14_memread(BLACKBOX,272)@2
    -- out out_feedback_stall_out_14@20000000
    thei_acl_pop_i16_win_itm_xyz_0547_pop14_memread : i_acl_pop_i16_win_itm_xyz_0547_pop14_memread33
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist28_sync_in_aunroll_x_in_c0_eni1_1_1_q,
        in_feedback_in_14 => i_acl_push_i16_win_itm_xyz_0547_push14_memread_out_feedback_out_14,
        in_feedback_valid_in_14 => i_acl_push_i16_win_itm_xyz_0547_push14_memread_out_feedback_valid_out_14,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out,
        out_feedback_stall_out_14 => i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_feedback_stall_out_14,
        clock => clock,
        resetn => resetn
    );

    -- i_conv15_memread_sel_x(BITSELECT,130)@2
    i_conv15_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out(15 downto 0)), 32));

    -- i_conv15_memread_vt_select_15(BITSELECT,388)@2
    i_conv15_memread_vt_select_15_b <= i_conv15_memread_sel_x_b(15 downto 0);

    -- i_conv15_memread_vt_join(BITJOIN,387)@2
    i_conv15_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv15_memread_vt_select_15_b;

    -- i_cmp1243_memread(LOGICAL,322)@2 + 1
    i_cmp1243_memread_qi <= "1" WHEN i_conv15_memread_vt_join_q = bgTrunc_i_sub1242_rm_memread_sel_x_b ELSE "0";
    i_cmp1243_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1243_memread_qi, xout => i_cmp1243_memread_q, clk => clock, aclr => resetn );

    -- redist18_i_cmp1243_memread_q_2(DELAY,789)
    redist18_i_cmp1243_memread_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1243_memread_q, xout => redist18_i_cmp1243_memread_q_2_q, clk => clock, aclr => resetn );

    -- redist19_i_cmp1243_memread_q_7(DELAY,790)
    redist19_i_cmp1243_memread_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist18_i_cmp1243_memread_q_2_q, xout => redist19_i_cmp1243_memread_q_7_q, clk => clock, aclr => resetn );

    -- redist4_i_notexit36_memread_q_3(DELAY,775)
    redist4_i_notexit36_memread_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_notexit36_memread_q_2_q, xout => redist4_i_notexit36_memread_q_3_q, clk => clock, aclr => resetn );

    -- redist5_i_notexit36_memread_q_4(DELAY,776)
    redist5_i_notexit36_memread_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_notexit36_memread_q_3_q, xout => redist5_i_notexit36_memread_q_4_q, clk => clock, aclr => resetn );

    -- redist6_i_notexit36_memread_q_8(DELAY,777)
    redist6_i_notexit36_memread_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_i_notexit36_memread_q_4_q, xout => redist6_i_notexit36_memread_q_8_q, clk => clock, aclr => resetn );

    -- redist1_i_unnamed_memread88_q_8(DELAY,772)
    redist1_i_unnamed_memread88_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_memread88_q, xout => redist1_i_unnamed_memread88_q_8_q, clk => clock, aclr => resetn );

    -- i_inc1237_memread_vt_const_31(CONSTANT,463)
    i_inc1237_memread_vt_const_31_q <= "0000000000000000000000000000000";

    -- i_read8_flag_1_memread_vt_const_7(CONSTANT,507)
    i_read8_flag_1_memread_vt_const_7_q <= "0000000";

    -- c_i8_1gr(CONSTANT,224)
    c_i8_1gr_q <= "00000001";

    -- redist26_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_1(DELAY,797)
    redist26_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out, xout => redist26_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_2126_memread(MUX,259)@3
    i_acl_2126_memread_s <= i_cmp1243_memread_q;
    i_acl_2126_memread_combproc: PROCESS (i_acl_2126_memread_s, redist26_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_1_q, i_gp_num_x_1_memread_q)
    BEGIN
        CASE (i_acl_2126_memread_s) IS
            WHEN "0" => i_acl_2126_memread_q <= redist26_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_1_q;
            WHEN "1" => i_acl_2126_memread_q <= i_gp_num_x_1_memread_q;
            WHEN OTHERS => i_acl_2126_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_gp_num_x_0535_push25_memread(BLACKBOX,278)@3
    -- out out_feedback_out_25@20000000
    -- out out_feedback_valid_out_25@20000000
    thei_acl_push_i16_gp_num_x_0535_push25_memread : i_acl_push_i16_gp_num_x_0535_push25_memread160
    PORT MAP (
        in_data_in => i_acl_2126_memread_q,
        in_feedback_stall_in_25 => i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_feedback_stall_out_25,
        in_notexit36 => redist3_i_notexit36_memread_q_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist33_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_25 => i_acl_push_i16_gp_num_x_0535_push25_memread_out_feedback_out_25,
        out_feedback_valid_out_25 => i_acl_push_i16_gp_num_x_0535_push25_memread_out_feedback_valid_out_25,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_gp_num_x_0535_pop25_memread(BLACKBOX,266)@2
    -- out out_feedback_stall_out_25@20000000
    thei_acl_pop_i16_gp_num_x_0535_pop25_memread : i_acl_pop_i16_gp_num_x_0535_pop25_memread40
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist28_sync_in_aunroll_x_in_c0_eni1_1_1_q,
        in_feedback_in_25 => i_acl_push_i16_gp_num_x_0535_push25_memread_out_feedback_out_25,
        in_feedback_valid_in_25 => i_acl_push_i16_gp_num_x_0535_push25_memread_out_feedback_valid_out_25,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out,
        out_feedback_stall_out_25 => i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_feedback_stall_out_25,
        clock => clock,
        resetn => resetn
    );

    -- i_inc1306_memread(ADD,476)@2
    i_inc1306_memread_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out);
    i_inc1306_memread_b <= STD_LOGIC_VECTOR("0" & c_i16_1gr_q);
    i_inc1306_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc1306_memread_a) + UNSIGNED(i_inc1306_memread_b));
    i_inc1306_memread_q <= i_inc1306_memread_o(16 downto 0);

    -- bgTrunc_i_inc1306_memread_sel_x(BITSELECT,14)@2
    bgTrunc_i_inc1306_memread_sel_x_b <= i_inc1306_memread_q(15 downto 0);

    -- redist51_bgTrunc_i_inc1306_memread_sel_x_b_1(DELAY,822)
    redist51_bgTrunc_i_inc1306_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc1306_memread_sel_x_b, xout => redist51_bgTrunc_i_inc1306_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_group_num_x_sync_buffer_memread(BLACKBOX,535)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_group_num_x_sync_buffer_memread : i_syncbuf_group_num_x_sync_buffer_memread137
    PORT MAP (
        in_buffer_in => in_group_num_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_group_num_x_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv1258_rm_memread_sel_x(BITSELECT,129)@2
    i_conv1258_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_group_num_x_sync_buffer_memread_out_buffer_out(7 downto 0)), 32));

    -- i_conv1258_rm_memread_vt_select_7(BITSELECT,384)@2
    i_conv1258_rm_memread_vt_select_7_b <= i_conv1258_rm_memread_sel_x_b(7 downto 0);

    -- i_conv1258_rm_memread_vt_join(BITJOIN,383)@2
    i_conv1258_rm_memread_vt_join_q <= i_conv1177_rm_memread_vt_const_31_q & i_conv1258_rm_memread_vt_select_7_b;

    -- i_sub1259_rm_memread(ADD,519)@2
    i_sub1259_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv1258_rm_memread_vt_join_q);
    i_sub1259_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub1259_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1259_rm_memread_a) + UNSIGNED(i_sub1259_rm_memread_b));
    i_sub1259_rm_memread_q <= i_sub1259_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1259_rm_memread_sel_x(BITSELECT,31)@2
    bgTrunc_i_sub1259_rm_memread_sel_x_b <= i_sub1259_rm_memread_q(31 downto 0);

    -- i_conv18_memread_sel_x(BITSELECT,131)@2
    i_conv18_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out(15 downto 0)), 32));

    -- i_conv18_memread_vt_select_15(BITSELECT,392)@2
    i_conv18_memread_vt_select_15_b <= i_conv18_memread_sel_x_b(15 downto 0);

    -- i_conv18_memread_vt_join(BITJOIN,391)@2
    i_conv18_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv18_memread_vt_select_15_b;

    -- i_cmp1272_pre_memread(LOGICAL,332)@2 + 1
    i_cmp1272_pre_memread_qi <= "1" WHEN i_conv18_memread_vt_join_q = bgTrunc_i_sub1259_rm_memread_sel_x_b ELSE "0";
    i_cmp1272_pre_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1272_pre_memread_qi, xout => i_cmp1272_pre_memread_q, clk => clock, aclr => resetn );

    -- i_gp_num_x_1_memread(MUX,450)@3
    i_gp_num_x_1_memread_s <= i_cmp1272_pre_memread_q;
    i_gp_num_x_1_memread_combproc: PROCESS (i_gp_num_x_1_memread_s, redist51_bgTrunc_i_inc1306_memread_sel_x_b_1_q, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_gp_num_x_1_memread_s) IS
            WHEN "0" => i_gp_num_x_1_memread_q <= redist51_bgTrunc_i_inc1306_memread_sel_x_b_1_q;
            WHEN "1" => i_gp_num_x_1_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_gp_num_x_1_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_notlhs_memread(LOGICAL,498)@3
    i_notlhs_memread_q <= "1" WHEN i_gp_num_x_1_memread_q /= c_i16_1gr_q ELSE "0";

    -- c_i8_3gr(CONSTANT,226)
    c_i8_3gr_q <= "00000011";

    -- i_syncbuf_weight_dim1_sync_buffer_memread(BLACKBOX,541)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_weight_dim1_sync_buffer_memread : i_syncbuf_weight_dim1_sync_buffer_memread141
    PORT MAP (
        in_buffer_in => in_weight_dim1,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist33_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_weight_dim1_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_notrhs_memread(LOGICAL,499)@3
    i_notrhs_memread_q <= "1" WHEN i_syncbuf_weight_dim1_sync_buffer_memread_out_buffer_out /= c_i8_3gr_q ELSE "0";

    -- i_or_cond507_not_memread(LOGICAL,500)@3
    i_or_cond507_not_memread_q <= i_notrhs_memread_q or i_notlhs_memread_q;

    -- dupName_0_c_i8_1gr_x(CONSTANT,38)
    dupName_0_c_i8_1gr_x_q <= "11111111";

    -- i_syncbuf_conv_row_rem_sync_buffer19_memread(BLACKBOX,529)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_conv_row_rem_sync_buffer19_memread : i_syncbuf_conv_row_rem_sync_buffer19_memread144
    PORT MAP (
        in_buffer_in => in_conv_row_rem,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist33_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_conv_row_rem_sync_buffer19_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv_row_rem_off_rm_memread(ADD,441)@3
    i_conv_row_rem_off_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_conv_row_rem_sync_buffer19_memread_out_buffer_out);
    i_conv_row_rem_off_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i8_1gr_x_q);
    i_conv_row_rem_off_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_conv_row_rem_off_rm_memread_a) + UNSIGNED(i_conv_row_rem_off_rm_memread_b));
    i_conv_row_rem_off_rm_memread_q <= i_conv_row_rem_off_rm_memread_o(8 downto 0);

    -- bgTrunc_i_conv_row_rem_off_rm_memread_sel_x(BITSELECT,10)@3
    bgTrunc_i_conv_row_rem_off_rm_memread_sel_x_b <= i_conv_row_rem_off_rm_memread_q(7 downto 0);

    -- i_not_rm_memread(COMPARE,496)@3
    i_not_rm_memread_a <= STD_LOGIC_VECTOR("00" & c_i8_1gr_q);
    i_not_rm_memread_b <= STD_LOGIC_VECTOR("00" & bgTrunc_i_conv_row_rem_off_rm_memread_sel_x_b);
    i_not_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_not_rm_memread_a) - UNSIGNED(i_not_rm_memread_b));
    i_not_rm_memread_c(0) <= i_not_rm_memread_o(9);

    -- i_brmerge570_memread(LOGICAL,311)@3 + 1
    i_brmerge570_memread_qi <= i_not_rm_memread_c or i_or_cond507_not_memread_q;
    i_brmerge570_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_brmerge570_memread_qi, xout => i_brmerge570_memread_q, clk => clock, aclr => resetn );

    -- i_unnamed_memread146_sel_x(BITSELECT,176)@4
    i_unnamed_memread146_sel_x_b <= std_logic_vector(resize(unsigned(i_brmerge570_memread_q(0 downto 0)), 8));

    -- i_unnamed_memread146_vt_select_0(BITSELECT,550)@4
    i_unnamed_memread146_vt_select_0_b <= i_unnamed_memread146_sel_x_b(0 downto 0);

    -- i_unnamed_memread146_vt_join(BITJOIN,549)@4
    i_unnamed_memread146_vt_join_q <= i_read8_flag_1_memread_vt_const_7_q & i_unnamed_memread146_vt_select_0_b;

    -- i_read8_flag_1_memread(LOGICAL,506)@4
    i_read8_flag_1_memread_q <= i_unnamed_memread146_vt_join_q xor c_i8_1gr_q;

    -- i_read8_flag_1_memread_vt_select_0(BITSELECT,509)@4
    i_read8_flag_1_memread_vt_select_0_b <= i_read8_flag_1_memread_q(0 downto 0);

    -- i_read8_flag_1_memread_vt_join(BITJOIN,508)@4
    i_read8_flag_1_memread_vt_join_q <= i_read8_flag_1_memread_vt_const_7_q & i_read8_flag_1_memread_vt_select_0_b;

    -- i_acl_2130_memread(MUX,262)@4
    i_acl_2130_memread_s <= redist18_i_cmp1243_memread_q_2_q;
    i_acl_2130_memread_combproc: PROCESS (i_acl_2130_memread_s, i_acl_pop_i8_read8_flag_0542_pop19_memread_out_data_out, i_read8_flag_1_memread_vt_join_q)
    BEGIN
        CASE (i_acl_2130_memread_s) IS
            WHEN "0" => i_acl_2130_memread_q <= i_acl_pop_i8_read8_flag_0542_pop19_memread_out_data_out;
            WHEN "1" => i_acl_2130_memread_q <= i_read8_flag_1_memread_vt_join_q;
            WHEN OTHERS => i_acl_2130_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_read8_flag_0542_push19_memread(BLACKBOX,289)@4
    -- out out_feedback_out_19@20000000
    -- out out_feedback_valid_out_19@20000000
    thei_acl_push_i8_read8_flag_0542_push19_memread : i_acl_push_i8_read8_flag_0542_push19_memread147
    PORT MAP (
        in_data_in => i_acl_2130_memread_q,
        in_feedback_stall_in_19 => i_acl_pop_i8_read8_flag_0542_pop19_memread_out_feedback_stall_out_19,
        in_notexit36 => redist4_i_notexit36_memread_q_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_19 => i_acl_push_i8_read8_flag_0542_push19_memread_out_feedback_out_19,
        out_feedback_valid_out_19 => i_acl_push_i8_read8_flag_0542_push19_memread_out_feedback_valid_out_19,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_read8_flag_0542_pop19_memread(BLACKBOX,276)@4
    -- out out_feedback_stall_out_19@20000000
    thei_acl_pop_i8_read8_flag_0542_pop19_memread : i_acl_pop_i8_read8_flag_0542_pop19_memread132
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist30_sync_in_aunroll_x_in_c0_eni1_1_3_q,
        in_feedback_in_19 => i_acl_push_i8_read8_flag_0542_push19_memread_out_feedback_out_19,
        in_feedback_valid_in_19 => i_acl_push_i8_read8_flag_0542_push19_memread_out_feedback_valid_out_19,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i8_read8_flag_0542_pop19_memread_out_data_out,
        out_feedback_stall_out_19 => i_acl_pop_i8_read8_flag_0542_pop19_memread_out_feedback_stall_out_19,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp1234_memread(LOGICAL,321)@4
    i_cmp1234_memread_q <= "1" WHEN i_acl_pop_i8_read8_flag_0542_pop19_memread_out_data_out = c_i8_0gr_q ELSE "0";

    -- i_inc1237_memread_sel_x(BITSELECT,158)@4
    i_inc1237_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_cmp1234_memread_q(0 downto 0)), 32));

    -- i_inc1237_memread_vt_select_0(BITSELECT,465)@4
    i_inc1237_memread_vt_select_0_b <= i_inc1237_memread_sel_x_b(0 downto 0);

    -- redist7_i_inc1237_memread_vt_select_0_b_5(DELAY,778)
    redist7_i_inc1237_memread_vt_select_0_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_inc1237_memread_vt_select_0_b, xout => redist7_i_inc1237_memread_vt_select_0_b_5_q, clk => clock, aclr => resetn );

    -- i_inc1237_memread_vt_join(BITJOIN,464)@9
    i_inc1237_memread_vt_join_q <= i_inc1237_memread_vt_const_31_q & redist7_i_inc1237_memread_vt_select_0_b_5_q;

    -- i_inc1237_conv_z_cnt_0_memread(ADD,461)@9
    i_inc1237_conv_z_cnt_0_memread_a <= STD_LOGIC_VECTOR("0" & i_inc1237_memread_vt_join_q);
    i_inc1237_conv_z_cnt_0_memread_b <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_data_out);
    i_inc1237_conv_z_cnt_0_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc1237_conv_z_cnt_0_memread_a) + UNSIGNED(i_inc1237_conv_z_cnt_0_memread_b));
    i_inc1237_conv_z_cnt_0_memread_q <= i_inc1237_conv_z_cnt_0_memread_o(32 downto 0);

    -- bgTrunc_i_inc1237_conv_z_cnt_0_memread_sel_x(BITSELECT,11)@9
    bgTrunc_i_inc1237_conv_z_cnt_0_memread_sel_x_b <= i_inc1237_conv_z_cnt_0_memread_q(31 downto 0);

    -- i_acl_2091_memread(MUX,230)@9
    i_acl_2091_memread_s <= i_acl_2090_memread_q;
    i_acl_2091_memread_combproc: PROCESS (i_acl_2091_memread_s, i_mul98_memread_multconst_x_q, bgTrunc_i_inc1237_conv_z_cnt_0_memread_sel_x_b)
    BEGIN
        CASE (i_acl_2091_memread_s) IS
            WHEN "0" => i_acl_2091_memread_q <= i_mul98_memread_multconst_x_q;
            WHEN "1" => i_acl_2091_memread_q <= bgTrunc_i_inc1237_conv_z_cnt_0_memread_sel_x_b;
            WHEN OTHERS => i_acl_2091_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2093_memread(MUX,232)@9
    i_acl_2093_memread_s <= i_acl_2092_demorgan_memread_q;
    i_acl_2093_memread_combproc: PROCESS (i_acl_2093_memread_s, i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_data_out, i_acl_2091_memread_q)
    BEGIN
        CASE (i_acl_2093_memread_s) IS
            WHEN "0" => i_acl_2093_memread_q <= i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_data_out;
            WHEN "1" => i_acl_2093_memread_q <= i_acl_2091_memread_q;
            WHEN OTHERS => i_acl_2093_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2095_memread(MUX,234)@9
    i_acl_2095_memread_s <= i_acl_2094_memread_q;
    i_acl_2095_memread_combproc: PROCESS (i_acl_2095_memread_s, i_acl_2093_memread_q, i_mul98_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2095_memread_s) IS
            WHEN "0" => i_acl_2095_memread_q <= i_acl_2093_memread_q;
            WHEN "1" => i_acl_2095_memread_q <= i_mul98_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2095_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2099_memread(MUX,235)@9
    i_acl_2099_memread_s <= i_reduction_memread_10_memread_q;
    i_acl_2099_memread_combproc: PROCESS (i_acl_2099_memread_s, i_acl_2095_memread_q, i_mul98_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2099_memread_s) IS
            WHEN "0" => i_acl_2099_memread_q <= i_acl_2095_memread_q;
            WHEN "1" => i_acl_2099_memread_q <= i_mul98_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2099_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2102_memread(MUX,238)@9
    i_acl_2102_memread_s <= i_acl_2101_memread_q;
    i_acl_2102_memread_combproc: PROCESS (i_acl_2102_memread_s, i_acl_2099_memread_q, i_mul98_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2102_memread_s) IS
            WHEN "0" => i_acl_2102_memread_q <= i_acl_2099_memread_q;
            WHEN "1" => i_acl_2102_memread_q <= i_mul98_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2102_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i32_conv_z_cnt_0543_push18_memread(BLACKBOX,287)@9
    -- out out_feedback_out_18@20000000
    -- out out_feedback_valid_out_18@20000000
    thei_acl_push_i32_conv_z_cnt_0543_push18_memread : i_acl_push_i32_conv_z_cnt_0543_push18_memread135
    PORT MAP (
        in_data_in => i_acl_2102_memread_q,
        in_feedback_stall_in_18 => i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_feedback_stall_out_18,
        in_notexit36 => redist6_i_notexit36_memread_q_8_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_feedback_out_18 => i_acl_push_i32_conv_z_cnt_0543_push18_memread_out_feedback_out_18,
        out_feedback_valid_out_18 => i_acl_push_i32_conv_z_cnt_0543_push18_memread_out_feedback_valid_out_18,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_conv_z_cnt_0543_pop18_memread(BLACKBOX,274)@9
    -- out out_feedback_stall_out_18@20000000
    thei_acl_pop_i32_conv_z_cnt_0543_pop18_memread : i_acl_pop_i32_conv_z_cnt_0543_pop18_memread83
    PORT MAP (
        in_data_in => i_mul98_memread_multconst_x_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_8_q,
        in_feedback_in_18 => i_acl_push_i32_conv_z_cnt_0543_push18_memread_out_feedback_out_18,
        in_feedback_valid_in_18 => i_acl_push_i32_conv_z_cnt_0543_push18_memread_out_feedback_valid_out_18,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_data_out => i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_data_out,
        out_feedback_stall_out_18 => i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_feedback_stall_out_18,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx106419_0_memread_memread82_mult_multconst_x(CONSTANT,104)
    i_arrayidx106419_0_memread_memread82_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- i_idxprom105_memread_vt_const_63(CONSTANT,454)
    i_idxprom105_memread_vt_const_63_q <= "000000000000000000000000000000000000000000000000";

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_notEnable(LOGICAL,850)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_nor(LOGICAL,851)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_nor_q <= not (redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_notEnable_q or redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena_q);

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_last(CONSTANT,847)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_last_q <= "01";

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmp(LOGICAL,848)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmp_q <= "1" WHEN redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_last_q = redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_q ELSE "0";

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmpReg(REG,849)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmpReg_q <= STD_LOGIC_VECTOR(redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena(REG,852)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_nor_q = "1") THEN
                redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_enaAnd(LOGICAL,853)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_enaAnd_q <= redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_sticky_ena_q and VCC_q;

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt(COUNTER,845)
    -- low=0, high=2, step=1, init=0
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_eq <= '1';
            ELSE
                redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_eq <= '0';
            END IF;
            IF (redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_eq = '1') THEN
                redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i <= redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i + 2;
            ELSE
                redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i <= redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_i, 2)));

    -- redist15_i_cmp1272_pre_memread_q_2(DELAY,786)
    redist15_i_cmp1272_pre_memread_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1272_pre_memread_q, xout => redist15_i_cmp1272_pre_memread_q_2_q, clk => clock, aclr => resetn );

    -- i_inc1275_memread_sel_x(BITSELECT,159)@4
    i_inc1275_memread_sel_x_b <= std_logic_vector(resize(unsigned(redist15_i_cmp1272_pre_memread_q_2_q(0 downto 0)), 16));

    -- i_inc1275_memread_vt_select_0(BITSELECT,469)@4
    i_inc1275_memread_vt_select_0_b <= i_inc1275_memread_sel_x_b(0 downto 0);

    -- i_inc1275_memread_vt_join(BITJOIN,468)@4
    i_inc1275_memread_vt_join_q <= i_add45_rm_memread_vt_const_31_q & i_inc1275_memread_vt_select_0_b;

    -- i_inc1275_out_idx_z_0_memread(ADD,470)@4
    i_inc1275_out_idx_z_0_memread_a <= STD_LOGIC_VECTOR("0" & i_inc1275_memread_vt_join_q);
    i_inc1275_out_idx_z_0_memread_b <= STD_LOGIC_VECTOR("0" & redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q);
    i_inc1275_out_idx_z_0_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc1275_out_idx_z_0_memread_a) + UNSIGNED(i_inc1275_out_idx_z_0_memread_b));
    i_inc1275_out_idx_z_0_memread_q <= i_inc1275_out_idx_z_0_memread_o(16 downto 0);

    -- bgTrunc_i_inc1275_out_idx_z_0_memread_sel_x(BITSELECT,12)@4
    bgTrunc_i_inc1275_out_idx_z_0_memread_sel_x_b <= i_inc1275_out_idx_z_0_memread_q(15 downto 0);

    -- i_syncbuf_weight_dim4_div_lane_sync_buffer_memread(BLACKBOX,543)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_weight_dim4_div_lane_sync_buffer_memread : i_syncbuf_weight_dim4_div_lane_sync_buffer_memread152
    PORT MAP (
        in_buffer_in => in_weight_dim4_div_lane,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist33_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_weight_dim4_div_lane_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv1247_rm_memread_sel_x(BITSELECT,128)@3
    i_conv1247_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_weight_dim4_div_lane_sync_buffer_memread_out_buffer_out(15 downto 0)), 32));

    -- i_conv1247_rm_memread_vt_select_15(BITSELECT,380)@3
    i_conv1247_rm_memread_vt_select_15_b <= i_conv1247_rm_memread_sel_x_b(15 downto 0);

    -- i_conv1247_rm_memread_vt_join(BITJOIN,379)@3
    i_conv1247_rm_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv1247_rm_memread_vt_select_15_b;

    -- i_sub1248_rm_memread(ADD,517)@3
    i_sub1248_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv1247_rm_memread_vt_join_q);
    i_sub1248_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub1248_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1248_rm_memread_a) + UNSIGNED(i_sub1248_rm_memread_b));
    i_sub1248_rm_memread_q <= i_sub1248_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1248_rm_memread_sel_x(BITSELECT,29)@3
    bgTrunc_i_sub1248_rm_memread_sel_x_b <= i_sub1248_rm_memread_q(31 downto 0);

    -- i_conv96_memread_sel_x(BITSELECT,143)@3
    i_conv96_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out(15 downto 0)), 32));

    -- i_conv96_memread_vt_select_15(BITSELECT,436)@3
    i_conv96_memread_vt_select_15_b <= i_conv96_memread_sel_x_b(15 downto 0);

    -- i_conv96_memread_vt_join(BITJOIN,435)@3
    i_conv96_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv96_memread_vt_select_15_b;

    -- i_cmp1249_not_memread(LOGICAL,323)@3 + 1
    i_cmp1249_not_memread_qi <= "1" WHEN i_conv96_memread_vt_join_q /= bgTrunc_i_sub1248_rm_memread_sel_x_b ELSE "0";
    i_cmp1249_not_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1249_not_memread_qi, xout => i_cmp1249_not_memread_q, clk => clock, aclr => resetn );

    -- i_cmp1249_not_not_memread(LOGICAL,324)@4
    i_cmp1249_not_not_memread_q <= i_cmp1249_not_memread_q xor VCC_q;

    -- i_syncbuf_group_num_y_sync_buffer_memread(BLACKBOX,536)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_group_num_y_sync_buffer_memread : i_syncbuf_group_num_y_sync_buffer_memread149
    PORT MAP (
        in_buffer_in => in_group_num_y,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_group_num_y_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_sub1253_rm_memread(ADD,518)@2
    i_sub1253_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_group_num_y_sync_buffer_memread_out_buffer_out);
    i_sub1253_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub1253_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub1253_rm_memread_a) + UNSIGNED(i_sub1253_rm_memread_b));
    i_sub1253_rm_memread_q <= i_sub1253_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub1253_rm_memread_sel_x(BITSELECT,30)@2
    bgTrunc_i_sub1253_rm_memread_sel_x_b <= i_sub1253_rm_memread_q(31 downto 0);

    -- redist45_bgTrunc_i_sub1253_rm_memread_sel_x_b_1(DELAY,816)
    redist45_bgTrunc_i_sub1253_rm_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub1253_rm_memread_sel_x_b, xout => redist45_bgTrunc_i_sub1253_rm_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp1280_not_memread(LOGICAL,333)@2 + 1
    i_cmp1280_not_memread_qi <= "1" WHEN i_conv24_memread_vt_join_q /= bgTrunc_i_sub1253_rm_memread_sel_x_b ELSE "0";
    i_cmp1280_not_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1280_not_memread_qi, xout => i_cmp1280_not_memread_q, clk => clock, aclr => resetn );

    -- i_cmp1286_mux_memread(LOGICAL,334)@3
    i_cmp1286_mux_memread_q <= i_cmp1280_not_memread_q and i_cmp1272_pre_memread_q;

    -- i_inc1296_memread_sel_x(BITSELECT,160)@3
    i_inc1296_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_cmp1286_mux_memread_q(0 downto 0)), 16));

    -- i_inc1296_memread_vt_select_0(BITSELECT,475)@3
    i_inc1296_memread_vt_select_0_b <= i_inc1296_memread_sel_x_b(0 downto 0);

    -- i_inc1296_memread_vt_join(BITJOIN,474)@3
    i_inc1296_memread_vt_join_q <= i_add45_rm_memread_vt_const_31_q & i_inc1296_memread_vt_select_0_b;

    -- i_inc1296_gp_num_y_0_memread(ADD,471)@3
    i_inc1296_gp_num_y_0_memread_a <= STD_LOGIC_VECTOR("0" & i_inc1296_memread_vt_join_q);
    i_inc1296_gp_num_y_0_memread_b <= STD_LOGIC_VECTOR("0" & redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1_q);
    i_inc1296_gp_num_y_0_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc1296_gp_num_y_0_memread_a) + UNSIGNED(i_inc1296_gp_num_y_0_memread_b));
    i_inc1296_gp_num_y_0_memread_q <= i_inc1296_gp_num_y_0_memread_o(16 downto 0);

    -- bgTrunc_i_inc1296_gp_num_y_0_memread_sel_x(BITSELECT,13)@3
    bgTrunc_i_inc1296_gp_num_y_0_memread_sel_x_b <= i_inc1296_gp_num_y_0_memread_q(15 downto 0);

    -- i_cmp1260_not_memread(LOGICAL,331)@3
    i_cmp1260_not_memread_q <= i_cmp1272_pre_memread_q xor VCC_q;

    -- i_brmerge569_memread(LOGICAL,310)@3
    i_brmerge569_memread_q <= i_cmp1280_not_memread_q or i_cmp1260_not_memread_q;

    -- i_acl_2125_memread(MUX,258)@3
    i_acl_2125_memread_s <= i_brmerge569_memread_q;
    i_acl_2125_memread_combproc: PROCESS (i_acl_2125_memread_s, i_mul21_memread_multconst_x_q, bgTrunc_i_inc1296_gp_num_y_0_memread_sel_x_b)
    BEGIN
        CASE (i_acl_2125_memread_s) IS
            WHEN "0" => i_acl_2125_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN "1" => i_acl_2125_memread_q <= bgTrunc_i_inc1296_gp_num_y_0_memread_sel_x_b;
            WHEN OTHERS => i_acl_2125_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1(DELAY,796)
    redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out, xout => redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_2127_memread(MUX,260)@3
    i_acl_2127_memread_s <= i_cmp1243_memread_q;
    i_acl_2127_memread_combproc: PROCESS (i_acl_2127_memread_s, redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1_q, i_acl_2125_memread_q)
    BEGIN
        CASE (i_acl_2127_memread_s) IS
            WHEN "0" => i_acl_2127_memread_q <= redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1_q;
            WHEN "1" => i_acl_2127_memread_q <= i_acl_2125_memread_q;
            WHEN OTHERS => i_acl_2127_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_gp_num_y_0536_push24_memread(BLACKBOX,279)@3
    -- out out_feedback_out_24@20000000
    -- out out_feedback_valid_out_24@20000000
    thei_acl_push_i16_gp_num_y_0536_push24_memread : i_acl_push_i16_gp_num_y_0536_push24_memread158
    PORT MAP (
        in_data_in => i_acl_2127_memread_q,
        in_feedback_stall_in_24 => i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_feedback_stall_out_24,
        in_notexit36 => redist3_i_notexit36_memread_q_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist33_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_24 => i_acl_push_i16_gp_num_y_0536_push24_memread_out_feedback_out_24,
        out_feedback_valid_out_24 => i_acl_push_i16_gp_num_y_0536_push24_memread_out_feedback_valid_out_24,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_gp_num_y_0536_pop24_memread(BLACKBOX,267)@2
    -- out out_feedback_stall_out_24@20000000
    thei_acl_pop_i16_gp_num_y_0536_pop24_memread : i_acl_pop_i16_gp_num_y_0536_pop24_memread42
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist28_sync_in_aunroll_x_in_c0_eni1_1_1_q,
        in_feedback_in_24 => i_acl_push_i16_gp_num_y_0536_push24_memread_out_feedback_out_24,
        in_feedback_valid_in_24 => i_acl_push_i16_gp_num_y_0536_push24_memread_out_feedback_valid_out_24,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out,
        out_feedback_stall_out_24 => i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_feedback_stall_out_24,
        clock => clock,
        resetn => resetn
    );

    -- i_conv24_memread_sel_x(BITSELECT,134)@2
    i_conv24_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out(15 downto 0)), 32));

    -- i_conv24_memread_vt_select_15(BITSELECT,400)@2
    i_conv24_memread_vt_select_15_b <= i_conv24_memread_sel_x_b(15 downto 0);

    -- i_conv24_memread_vt_join(BITJOIN,399)@2
    i_conv24_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv24_memread_vt_select_15_b;

    -- redist10_i_conv24_memread_vt_join_q_1(DELAY,781)
    redist10_i_conv24_memread_vt_join_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv24_memread_vt_join_q, xout => redist10_i_conv24_memread_vt_join_q_1_q, clk => clock, aclr => resetn );

    -- i_cmp1254_memread(LOGICAL,328)@3 + 1
    i_cmp1254_memread_qi <= "1" WHEN redist10_i_conv24_memread_vt_join_q_1_q = redist45_bgTrunc_i_sub1253_rm_memread_sel_x_b_1_q ELSE "0";
    i_cmp1254_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1254_memread_qi, xout => i_cmp1254_memread_q, clk => clock, aclr => resetn );

    -- i_brmerge568_not_memread(LOGICAL,309)@4
    i_brmerge568_not_memread_q <= i_cmp1254_memread_q and i_cmp1249_not_not_memread_q;

    -- i_acl_2119_memread(LOGICAL,254)@4
    i_acl_2119_memread_q <= redist15_i_cmp1272_pre_memread_q_2_q and i_brmerge568_not_memread_q;

    -- i_acl_2123_memread(MUX,256)@4
    i_acl_2123_memread_s <= i_acl_2119_memread_q;
    i_acl_2123_memread_combproc: PROCESS (i_acl_2123_memread_s, redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_acl_2123_memread_s) IS
            WHEN "0" => i_acl_2123_memread_q <= redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q;
            WHEN "1" => i_acl_2123_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_acl_2123_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp1254_mux_memread(LOGICAL,329)@4
    i_cmp1254_mux_memread_q <= i_cmp1249_not_memread_q and i_cmp1254_memread_q;

    -- redist16_i_cmp1260_not_memread_q_1(DELAY,787)
    redist16_i_cmp1260_not_memread_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1260_not_memread_q, xout => redist16_i_cmp1260_not_memread_q_1_q, clk => clock, aclr => resetn );

    -- i_cmp1254_not_memread(LOGICAL,330)@4
    i_cmp1254_not_memread_q <= i_cmp1254_memread_q xor VCC_q;

    -- i_brmerge568_memread(LOGICAL,308)@4
    i_brmerge568_memread_q <= i_cmp1249_not_memread_q or i_cmp1254_not_memread_q;

    -- i_acl_2121_memread(MUX,255)@4
    i_acl_2121_memread_s <= i_brmerge568_memread_q;
    i_acl_2121_memread_combproc: PROCESS (i_acl_2121_memread_s, redist16_i_cmp1260_not_memread_q_1_q, i_cmp1254_mux_memread_q)
    BEGIN
        CASE (i_acl_2121_memread_s) IS
            WHEN "0" => i_acl_2121_memread_q <= redist16_i_cmp1260_not_memread_q_1_q;
            WHEN "1" => i_acl_2121_memread_q <= i_cmp1254_mux_memread_q;
            WHEN OTHERS => i_acl_2121_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2124_memread(MUX,257)@4
    i_acl_2124_memread_s <= i_acl_2121_memread_q;
    i_acl_2124_memread_combproc: PROCESS (i_acl_2124_memread_s, i_acl_2123_memread_q, bgTrunc_i_inc1275_out_idx_z_0_memread_sel_x_b)
    BEGIN
        CASE (i_acl_2124_memread_s) IS
            WHEN "0" => i_acl_2124_memread_q <= i_acl_2123_memread_q;
            WHEN "1" => i_acl_2124_memread_q <= bgTrunc_i_inc1275_out_idx_z_0_memread_sel_x_b;
            WHEN OTHERS => i_acl_2124_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2128_memread(MUX,261)@4
    i_acl_2128_memread_s <= redist18_i_cmp1243_memread_q_2_q;
    i_acl_2128_memread_combproc: PROCESS (i_acl_2128_memread_s, redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q, i_acl_2124_memread_q)
    BEGIN
        CASE (i_acl_2128_memread_s) IS
            WHEN "0" => i_acl_2128_memread_q <= redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q;
            WHEN "1" => i_acl_2128_memread_q <= i_acl_2124_memread_q;
            WHEN OTHERS => i_acl_2128_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_out_idx_z_0537_push23_memread(BLACKBOX,281)@4
    -- out out_feedback_out_23@20000000
    -- out out_feedback_valid_out_23@20000000
    thei_acl_push_i16_out_idx_z_0537_push23_memread : i_acl_push_i16_out_idx_z_0537_push23_memread155
    PORT MAP (
        in_data_in => i_acl_2128_memread_q,
        in_feedback_stall_in_23 => i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_feedback_stall_out_23,
        in_notexit36 => redist4_i_notexit36_memread_q_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_23 => i_acl_push_i16_out_idx_z_0537_push23_memread_out_feedback_out_23,
        out_feedback_valid_out_23 => i_acl_push_i16_out_idx_z_0537_push23_memread_out_feedback_valid_out_23,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_out_idx_z_0537_pop23_memread(BLACKBOX,269)@3
    -- out out_feedback_stall_out_23@20000000
    thei_acl_pop_i16_out_idx_z_0537_pop23_memread : i_acl_pop_i16_out_idx_z_0537_pop23_memread73
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist29_sync_in_aunroll_x_in_c0_eni1_1_2_q,
        in_feedback_in_23 => i_acl_push_i16_out_idx_z_0537_push23_memread_out_feedback_out_23,
        in_feedback_valid_in_23 => i_acl_push_i16_out_idx_z_0537_push23_memread_out_feedback_valid_out_23,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist33_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out,
        out_feedback_stall_out_23 => i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_feedback_stall_out_23,
        clock => clock,
        resetn => resetn
    );

    -- redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1(DELAY,794)
    redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out, xout => redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_wraddr(REG,846)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_wraddr_q <= STD_LOGIC_VECTOR(redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem(DUALMEM,844)
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_ia <= STD_LOGIC_VECTOR(redist23_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_1_q);
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_aa <= redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_wraddr_q;
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_ab <= redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_rdcnt_q;
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_reset0 <= not (resetn);
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_reset0,
        clock1 => clock,
        address_a => redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_aa,
        data_a => redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_ab,
        q_b => redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_iq
    );
    redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_q <= redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_iq(15 downto 0);

    -- i_idxprom105_memread_sel_x(BITSELECT,156)@8
    i_idxprom105_memread_sel_x_b <= std_logic_vector(resize(unsigned(redist24_i_acl_pop_i16_out_idx_z_0537_pop23_memread_out_data_out_5_mem_q(15 downto 0)), 64));

    -- i_idxprom105_memread_vt_select_15(BITSELECT,456)@8
    i_idxprom105_memread_vt_select_15_b <= i_idxprom105_memread_sel_x_b(15 downto 0);

    -- i_idxprom105_memread_vt_join(BITJOIN,455)@8
    i_idxprom105_memread_vt_join_q <= i_idxprom105_memread_vt_const_63_q & i_idxprom105_memread_vt_select_15_b;

    -- i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select(BITSELECT,769)@8
    i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_b <= i_idxprom105_memread_vt_join_q(15 downto 0);
    i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_c <= i_idxprom105_memread_vt_join_q(31 downto 16);
    i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_d <= i_idxprom105_memread_vt_join_q(47 downto 32);
    i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_e <= i_idxprom105_memread_vt_join_q(63 downto 48);

    -- i_arrayidx106419_0_memread_memread82_mult_x_im9_shift0(BITSHIFT,762)@8
    i_arrayidx106419_0_memread_memread82_mult_x_im9_shift0_qint <= i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_e & "0";
    i_arrayidx106419_0_memread_memread82_mult_x_im9_shift0_q <= i_arrayidx106419_0_memread_memread82_mult_x_im9_shift0_qint(16 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_x_align_15(BITSHIFT,635)@8
    i_arrayidx106419_0_memread_memread82_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx106419_0_memread_memread82_mult_x_im9_shift0_q) & "00000000000000";
    i_arrayidx106419_0_memread_memread82_mult_x_align_15_q <= i_arrayidx106419_0_memread_memread82_mult_x_align_15_qint(31 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_x_im3_shift0(BITSHIFT,760)@8
    i_arrayidx106419_0_memread_memread82_mult_x_im3_shift0_qint <= i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_c & "0";
    i_arrayidx106419_0_memread_memread82_mult_x_im3_shift0_q <= i_arrayidx106419_0_memread_memread82_mult_x_im3_shift0_qint(16 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_x_align_14(BITSHIFT,634)@8
    i_arrayidx106419_0_memread_memread82_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx106419_0_memread_memread82_mult_x_im3_shift0_q) & "0000000000000000";
    i_arrayidx106419_0_memread_memread82_mult_x_align_14_q <= i_arrayidx106419_0_memread_memread82_mult_x_align_14_qint(33 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_x_join_16(BITJOIN,636)@8
    i_arrayidx106419_0_memread_memread82_mult_x_join_16_q <= i_arrayidx106419_0_memread_memread82_mult_x_align_15_q & i_arrayidx106419_0_memread_memread82_mult_x_align_14_q;

    -- i_arrayidx106419_0_memread_memread82_mult_x_im6_shift0(BITSHIFT,761)@8
    i_arrayidx106419_0_memread_memread82_mult_x_im6_shift0_qint <= i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_d & "0";
    i_arrayidx106419_0_memread_memread82_mult_x_im6_shift0_q <= i_arrayidx106419_0_memread_memread82_mult_x_im6_shift0_qint(16 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_x_align_12(BITSHIFT,632)@8
    i_arrayidx106419_0_memread_memread82_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx106419_0_memread_memread82_mult_x_im6_shift0_q) & "00000000000000";
    i_arrayidx106419_0_memread_memread82_mult_x_align_12_q <= i_arrayidx106419_0_memread_memread82_mult_x_align_12_qint(31 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_x_im0_shift0(BITSHIFT,759)@8
    i_arrayidx106419_0_memread_memread82_mult_x_im0_shift0_qint <= i_arrayidx106419_0_memread_memread82_mult_x_bs1_merged_bit_select_b & "0";
    i_arrayidx106419_0_memread_memread82_mult_x_im0_shift0_q <= i_arrayidx106419_0_memread_memread82_mult_x_im0_shift0_qint(16 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_x_join_13(BITJOIN,633)@8
    i_arrayidx106419_0_memread_memread82_mult_x_join_13_q <= i_arrayidx106419_0_memread_memread82_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx106419_0_memread_memread82_mult_x_im0_shift0_q);

    -- i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0(ADD,637)@8
    i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000000" & i_arrayidx106419_0_memread_memread82_mult_x_join_13_q);
    i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx106419_0_memread_memread82_mult_x_join_16_q);
    i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_b));
    i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_q <= i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_o(66 downto 0);

    -- i_arrayidx106419_0_memread_memread82_mult_extender_x(BITJOIN,103)@8
    i_arrayidx106419_0_memread_memread82_mult_extender_x_q <= i_arrayidx106419_0_memread_memread82_mult_multconst_x_q & i_arrayidx106419_0_memread_memread82_mult_x_result_add_0_0_q(65 downto 0);

    -- i_arrayidx106419_0_memread_memread82_trunc_sel_x(BITSELECT,105)@8
    i_arrayidx106419_0_memread_memread82_trunc_sel_x_b <= i_arrayidx106419_0_memread_memread82_mult_extender_x_q(63 downto 0);

    -- redist42_i_arrayidx106419_0_memread_memread82_trunc_sel_x_b_1(DELAY,813)
    redist42_i_arrayidx106419_0_memread_memread82_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx106419_0_memread_memread82_trunc_sel_x_b, xout => redist42_i_arrayidx106419_0_memread_memread82_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_bias_sync_buffer_memread(BLACKBOX,524)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_bias_sync_buffer_memread : i_syncbuf_bias_sync_buffer_memread80
    PORT MAP (
        in_buffer_in => in_bias,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_buffer_out => i_syncbuf_bias_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx106419_0_memread_memread82_add_x(ADD,106)@9
    i_arrayidx106419_0_memread_memread82_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_bias_sync_buffer_memread_out_buffer_out);
    i_arrayidx106419_0_memread_memread82_add_x_b <= STD_LOGIC_VECTOR("0" & redist42_i_arrayidx106419_0_memread_memread82_trunc_sel_x_b_1_q);
    i_arrayidx106419_0_memread_memread82_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx106419_0_memread_memread82_add_x_a) + UNSIGNED(i_arrayidx106419_0_memread_memread82_add_x_b));
    i_arrayidx106419_0_memread_memread82_add_x_q <= i_arrayidx106419_0_memread_memread82_add_x_o(64 downto 0);

    -- i_arrayidx106419_0_memread_memread82_dupName_0_trunc_sel_x(BITSELECT,100)@9
    i_arrayidx106419_0_memread_memread82_dupName_0_trunc_sel_x_b <= i_arrayidx106419_0_memread_memread82_add_x_q(63 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_multconst_x(CONSTANT,94)
    i_arrayidx102400_0_memread_memread79_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000";

    -- i_arrayidx102400_0_memread_memread79_mult_x_im9_shift0(BITSHIFT,756)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im9_shift0_qint <= i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_e & "0";
    i_arrayidx102400_0_memread_memread79_mult_x_im9_shift0_q <= i_arrayidx102400_0_memread_memread79_mult_x_im9_shift0_qint(16 downto 0);

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_notEnable(LOGICAL,869)
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_nor(LOGICAL,870)
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_nor_q <= not (redist53_bgTrunc_i_add100_memread_sel_x_b_3_notEnable_q or redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena_q);

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_cmpReg(REG,868)
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist53_bgTrunc_i_add100_memread_sel_x_b_3_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist53_bgTrunc_i_add100_memread_sel_x_b_3_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena(REG,871)
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist53_bgTrunc_i_add100_memread_sel_x_b_3_nor_q = "1") THEN
                redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist53_bgTrunc_i_add100_memread_sel_x_b_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_enaAnd(LOGICAL,872)
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_enaAnd_q <= redist53_bgTrunc_i_add100_memread_sel_x_b_3_sticky_ena_q and VCC_q;

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt(COUNTER,866)
    -- low=0, high=1, step=1, init=0
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_i <= redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_i, 1)));

    -- i_conv97_rm_memread_vt_join_narrowed_x(BITSELECT,146)@2
    i_conv97_rm_memread_vt_join_narrowed_x_b <= i_conv97_rm_memread_vt_join_q(15 downto 0);

    -- redist38_i_conv97_rm_memread_vt_join_narrowed_x_b_1(DELAY,809)
    redist38_i_conv97_rm_memread_vt_join_narrowed_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv97_rm_memread_vt_join_narrowed_x_b, xout => redist38_i_conv97_rm_memread_vt_join_narrowed_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv96_memread_vt_join_narrowed_x(BITSELECT,144)@3
    i_conv96_memread_vt_join_narrowed_x_b <= i_conv96_memread_vt_join_q(15 downto 0);

    -- i_mul98_memread_cma(CHAINMULTADD,767)@3 + 2
    i_mul98_memread_cma_reset <= not (resetn);
    i_mul98_memread_cma_ena0 <= '1';
    i_mul98_memread_cma_ena1 <= i_mul98_memread_cma_ena0;
    i_mul98_memread_cma_p(0) <= i_mul98_memread_cma_a0(0) * i_mul98_memread_cma_c0(0);
    i_mul98_memread_cma_u(0) <= RESIZE(i_mul98_memread_cma_p(0),32);
    i_mul98_memread_cma_w(0) <= i_mul98_memread_cma_u(0);
    i_mul98_memread_cma_x(0) <= i_mul98_memread_cma_w(0);
    i_mul98_memread_cma_y(0) <= i_mul98_memread_cma_x(0);
    i_mul98_memread_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul98_memread_cma_a0 <= (others => (others => '0'));
            i_mul98_memread_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul98_memread_cma_ena0 = '1') THEN
                i_mul98_memread_cma_a0(0) <= RESIZE(UNSIGNED(i_conv96_memread_vt_join_narrowed_x_b),16);
                i_mul98_memread_cma_c0(0) <= RESIZE(UNSIGNED(redist38_i_conv97_rm_memread_vt_join_narrowed_x_b_1_q),16);
            END IF;
        END IF;
    END PROCESS;
    i_mul98_memread_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul98_memread_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul98_memread_cma_ena1 = '1') THEN
                i_mul98_memread_cma_s(0) <= i_mul98_memread_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul98_memread_cma_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul98_memread_cma_s(0)(31 downto 0)), xout => i_mul98_memread_cma_qq, clk => clock, aclr => resetn );
    i_mul98_memread_cma_q <= STD_LOGIC_VECTOR(i_mul98_memread_cma_qq(31 downto 0));

    -- i_mul98_memread_extender_x(BITJOIN,174)@5
    i_mul98_memread_extender_x_q <= i_mul98_memread_multconst_x_q & i_mul98_memread_cma_q;

    -- bgTrunc_i_mul98_memread_sel_x(BITSELECT,23)@5
    bgTrunc_i_mul98_memread_sel_x_b <= i_mul98_memread_extender_x_q(31 downto 0);

    -- redist11_i_conv15_memread_vt_join_q_3_notEnable(LOGICAL,829)
    redist11_i_conv15_memread_vt_join_q_3_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist11_i_conv15_memread_vt_join_q_3_nor(LOGICAL,830)
    redist11_i_conv15_memread_vt_join_q_3_nor_q <= not (redist11_i_conv15_memread_vt_join_q_3_notEnable_q or redist11_i_conv15_memread_vt_join_q_3_sticky_ena_q);

    -- redist11_i_conv15_memread_vt_join_q_3_cmpReg(REG,828)
    redist11_i_conv15_memread_vt_join_q_3_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_conv15_memread_vt_join_q_3_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist11_i_conv15_memread_vt_join_q_3_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist11_i_conv15_memread_vt_join_q_3_sticky_ena(REG,831)
    redist11_i_conv15_memread_vt_join_q_3_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_conv15_memread_vt_join_q_3_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist11_i_conv15_memread_vt_join_q_3_nor_q = "1") THEN
                redist11_i_conv15_memread_vt_join_q_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist11_i_conv15_memread_vt_join_q_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_i_conv15_memread_vt_join_q_3_enaAnd(LOGICAL,832)
    redist11_i_conv15_memread_vt_join_q_3_enaAnd_q <= redist11_i_conv15_memread_vt_join_q_3_sticky_ena_q and VCC_q;

    -- redist11_i_conv15_memread_vt_join_q_3_rdcnt(COUNTER,826)
    -- low=0, high=1, step=1, init=0
    redist11_i_conv15_memread_vt_join_q_3_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_conv15_memread_vt_join_q_3_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist11_i_conv15_memread_vt_join_q_3_rdcnt_i <= redist11_i_conv15_memread_vt_join_q_3_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist11_i_conv15_memread_vt_join_q_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist11_i_conv15_memread_vt_join_q_3_rdcnt_i, 1)));

    -- redist11_i_conv15_memread_vt_join_q_3_wraddr(REG,827)
    redist11_i_conv15_memread_vt_join_q_3_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_conv15_memread_vt_join_q_3_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist11_i_conv15_memread_vt_join_q_3_wraddr_q <= STD_LOGIC_VECTOR(redist11_i_conv15_memread_vt_join_q_3_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist11_i_conv15_memread_vt_join_q_3_mem(DUALMEM,825)
    redist11_i_conv15_memread_vt_join_q_3_mem_ia <= STD_LOGIC_VECTOR(i_conv15_memread_vt_join_q);
    redist11_i_conv15_memread_vt_join_q_3_mem_aa <= redist11_i_conv15_memread_vt_join_q_3_wraddr_q;
    redist11_i_conv15_memread_vt_join_q_3_mem_ab <= redist11_i_conv15_memread_vt_join_q_3_rdcnt_q;
    redist11_i_conv15_memread_vt_join_q_3_mem_reset0 <= not (resetn);
    redist11_i_conv15_memread_vt_join_q_3_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => redist11_i_conv15_memread_vt_join_q_3_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist11_i_conv15_memread_vt_join_q_3_mem_reset0,
        clock1 => clock,
        address_a => redist11_i_conv15_memread_vt_join_q_3_mem_aa,
        data_a => redist11_i_conv15_memread_vt_join_q_3_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist11_i_conv15_memread_vt_join_q_3_mem_ab,
        q_b => redist11_i_conv15_memread_vt_join_q_3_mem_iq
    );
    redist11_i_conv15_memread_vt_join_q_3_mem_q <= redist11_i_conv15_memread_vt_join_q_3_mem_iq(31 downto 0);

    -- i_add100_memread(ADD,291)@5
    i_add100_memread_a <= STD_LOGIC_VECTOR("0" & redist11_i_conv15_memread_vt_join_q_3_mem_q);
    i_add100_memread_b <= STD_LOGIC_VECTOR("0" & bgTrunc_i_mul98_memread_sel_x_b);
    i_add100_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add100_memread_a) + UNSIGNED(i_add100_memread_b));
    i_add100_memread_q <= i_add100_memread_o(32 downto 0);

    -- bgTrunc_i_add100_memread_sel_x(BITSELECT,2)@5
    bgTrunc_i_add100_memread_sel_x_b <= i_add100_memread_q(31 downto 0);

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_wraddr(REG,867)
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist53_bgTrunc_i_add100_memread_sel_x_b_3_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist53_bgTrunc_i_add100_memread_sel_x_b_3_wraddr_q <= STD_LOGIC_VECTOR(redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem(DUALMEM,865)
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_ia <= STD_LOGIC_VECTOR(bgTrunc_i_add100_memread_sel_x_b);
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_aa <= redist53_bgTrunc_i_add100_memread_sel_x_b_3_wraddr_q;
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_ab <= redist53_bgTrunc_i_add100_memread_sel_x_b_3_rdcnt_q;
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_reset0 <= not (resetn);
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => redist53_bgTrunc_i_add100_memread_sel_x_b_3_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_reset0,
        clock1 => clock,
        address_a => redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_aa,
        data_a => redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_ab,
        q_b => redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_iq
    );
    redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_q <= redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_iq(31 downto 0);

    -- i_idxprom101_memread_sel_x(BITSELECT,155)@8
    i_idxprom101_memread_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist53_bgTrunc_i_add100_memread_sel_x_b_3_mem_q(31 downto 0)), 64)));

    -- i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select(BITSELECT,768)@8
    i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_b <= i_idxprom101_memread_sel_x_b(15 downto 0);
    i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_c <= i_idxprom101_memread_sel_x_b(31 downto 16);
    i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_d <= i_idxprom101_memread_sel_x_b(47 downto 32);
    i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_e <= i_idxprom101_memread_sel_x_b(63 downto 48);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1(ADD,757)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_a <= STD_LOGIC_VECTOR("00" & i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_e);
    i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_b <= STD_LOGIC_VECTOR("0" & i_arrayidx102400_0_memread_memread79_mult_x_im9_shift0_q);
    i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_a) + UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_b));
    i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_q <= i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_o(17 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im9_shift2(BITSHIFT,758)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im9_shift2_qint <= i_arrayidx102400_0_memread_memread79_mult_x_im9_add_1_q & "000000";
    i_arrayidx102400_0_memread_memread79_mult_x_im9_shift2_q <= i_arrayidx102400_0_memread_memread79_mult_x_im9_shift2_qint(23 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_align_15(BITSHIFT,617)@8
    i_arrayidx102400_0_memread_memread79_mult_x_align_15_qint <= i_arrayidx102400_0_memread_memread79_mult_x_im9_shift2_q & "00000000";
    i_arrayidx102400_0_memread_memread79_mult_x_align_15_q <= i_arrayidx102400_0_memread_memread79_mult_x_align_15_qint(31 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im3_shift0(BITSHIFT,750)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im3_shift0_qint <= i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_c & "0";
    i_arrayidx102400_0_memread_memread79_mult_x_im3_shift0_q <= i_arrayidx102400_0_memread_memread79_mult_x_im3_shift0_qint(16 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1(ADD,751)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_a <= STD_LOGIC_VECTOR("00" & i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_c);
    i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_b <= STD_LOGIC_VECTOR("0" & i_arrayidx102400_0_memread_memread79_mult_x_im3_shift0_q);
    i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_a) + UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_b));
    i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_q <= i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_o(17 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im3_shift2(BITSHIFT,752)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im3_shift2_qint <= i_arrayidx102400_0_memread_memread79_mult_x_im3_add_1_q & "000000";
    i_arrayidx102400_0_memread_memread79_mult_x_im3_shift2_q <= i_arrayidx102400_0_memread_memread79_mult_x_im3_shift2_qint(23 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_align_14(BITSHIFT,616)@8
    i_arrayidx102400_0_memread_memread79_mult_x_align_14_qint <= i_arrayidx102400_0_memread_memread79_mult_x_im3_shift2_q & "0000000000000000";
    i_arrayidx102400_0_memread_memread79_mult_x_align_14_q <= i_arrayidx102400_0_memread_memread79_mult_x_align_14_qint(39 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_join_16(BITJOIN,618)@8
    i_arrayidx102400_0_memread_memread79_mult_x_join_16_q <= i_arrayidx102400_0_memread_memread79_mult_x_align_15_q & i_arrayidx102400_0_memread_memread79_mult_x_align_14_q;

    -- i_arrayidx102400_0_memread_memread79_mult_x_im6_shift0(BITSHIFT,753)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im6_shift0_qint <= i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_d & "0";
    i_arrayidx102400_0_memread_memread79_mult_x_im6_shift0_q <= i_arrayidx102400_0_memread_memread79_mult_x_im6_shift0_qint(16 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1(ADD,754)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_a <= STD_LOGIC_VECTOR("00" & i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_d);
    i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_b <= STD_LOGIC_VECTOR("0" & i_arrayidx102400_0_memread_memread79_mult_x_im6_shift0_q);
    i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_a) + UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_b));
    i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_q <= i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_o(17 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im6_shift2(BITSHIFT,755)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im6_shift2_qint <= i_arrayidx102400_0_memread_memread79_mult_x_im6_add_1_q & "000000";
    i_arrayidx102400_0_memread_memread79_mult_x_im6_shift2_q <= i_arrayidx102400_0_memread_memread79_mult_x_im6_shift2_qint(23 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_align_12(BITSHIFT,614)@8
    i_arrayidx102400_0_memread_memread79_mult_x_align_12_qint <= i_arrayidx102400_0_memread_memread79_mult_x_im6_shift2_q & "00000000";
    i_arrayidx102400_0_memread_memread79_mult_x_align_12_q <= i_arrayidx102400_0_memread_memread79_mult_x_align_12_qint(31 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im0_shift0(BITSHIFT,747)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im0_shift0_qint <= i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_b & "0";
    i_arrayidx102400_0_memread_memread79_mult_x_im0_shift0_q <= i_arrayidx102400_0_memread_memread79_mult_x_im0_shift0_qint(16 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1(ADD,748)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_a <= STD_LOGIC_VECTOR("00" & i_arrayidx102400_0_memread_memread79_mult_x_bs1_merged_bit_select_b);
    i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_b <= STD_LOGIC_VECTOR("0" & i_arrayidx102400_0_memread_memread79_mult_x_im0_shift0_q);
    i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_a) + UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_b));
    i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_q <= i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_o(17 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_im0_shift2(BITSHIFT,749)@8
    i_arrayidx102400_0_memread_memread79_mult_x_im0_shift2_qint <= i_arrayidx102400_0_memread_memread79_mult_x_im0_add_1_q & "000000";
    i_arrayidx102400_0_memread_memread79_mult_x_im0_shift2_q <= i_arrayidx102400_0_memread_memread79_mult_x_im0_shift2_qint(23 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_x_join_13(BITJOIN,615)@8
    i_arrayidx102400_0_memread_memread79_mult_x_join_13_q <= i_arrayidx102400_0_memread_memread79_mult_x_align_12_q & i_arrayidx102400_0_memread_memread79_mult_x_im0_shift2_q;

    -- i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0(ADD,619)@8
    i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000000" & i_arrayidx102400_0_memread_memread79_mult_x_join_13_q);
    i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx102400_0_memread_memread79_mult_x_join_16_q);
    i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_b));
    i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_q <= i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_o(72 downto 0);

    -- i_arrayidx102400_0_memread_memread79_mult_extender_x(BITJOIN,93)@8
    i_arrayidx102400_0_memread_memread79_mult_extender_x_q <= i_arrayidx102400_0_memread_memread79_mult_multconst_x_q & i_arrayidx102400_0_memread_memread79_mult_x_result_add_0_0_q(71 downto 0);

    -- i_arrayidx102400_0_memread_memread79_trunc_sel_x(BITSELECT,95)@8
    i_arrayidx102400_0_memread_memread79_trunc_sel_x_b <= i_arrayidx102400_0_memread_memread79_mult_extender_x_q(63 downto 0);

    -- redist43_i_arrayidx102400_0_memread_memread79_trunc_sel_x_b_1(DELAY,814)
    redist43_i_arrayidx102400_0_memread_memread79_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx102400_0_memread_memread79_trunc_sel_x_b, xout => redist43_i_arrayidx102400_0_memread_memread79_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_weights_sync_buffer_memread(BLACKBOX,544)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_weights_sync_buffer_memread : i_syncbuf_weights_sync_buffer_memread77
    PORT MAP (
        in_buffer_in => in_weights,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_buffer_out => i_syncbuf_weights_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx102400_0_memread_memread79_add_x(ADD,96)@9
    i_arrayidx102400_0_memread_memread79_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_weights_sync_buffer_memread_out_buffer_out);
    i_arrayidx102400_0_memread_memread79_add_x_b <= STD_LOGIC_VECTOR("0" & redist43_i_arrayidx102400_0_memread_memread79_trunc_sel_x_b_1_q);
    i_arrayidx102400_0_memread_memread79_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx102400_0_memread_memread79_add_x_a) + UNSIGNED(i_arrayidx102400_0_memread_memread79_add_x_b));
    i_arrayidx102400_0_memread_memread79_add_x_q <= i_arrayidx102400_0_memread_memread79_add_x_o(64 downto 0);

    -- i_arrayidx102400_0_memread_memread79_dupName_0_trunc_sel_x(BITSELECT,90)@9
    i_arrayidx102400_0_memread_memread79_dupName_0_trunc_sel_x_b <= i_arrayidx102400_0_memread_memread79_add_x_q(63 downto 0);

    -- i_or_cond_xor_memread(LOGICAL,505)@9
    i_or_cond_xor_memread_q <= i_or_cond_memread_q xor VCC_q;

    -- i_cmp12532_phi_decision2152_or2160_memread(LOGICAL,325)@9
    i_cmp12532_phi_decision2152_or2160_memread_q <= redist17_i_cmp12532_rm_memread_q_8_q or i_or_cond_xor_memread_q;

    -- i_cmp93_memread(LOGICAL,346)@3 + 1
    i_cmp93_memread_qi <= "1" WHEN redist25_i_acl_pop_i16_gp_num_y_0536_pop24_memread_out_data_out_1_q = i_mul21_memread_multconst_x_q ELSE "0";
    i_cmp93_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp93_memread_qi, xout => i_cmp93_memread_q, clk => clock, aclr => resetn );

    -- redist12_i_cmp93_memread_q_6(DELAY,783)
    redist12_i_cmp93_memread_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp93_memread_q, xout => redist12_i_cmp93_memread_q_6_q, clk => clock, aclr => resetn );

    -- c_i16_2gr(CONSTANT,215)
    c_i16_2gr_q <= "0000000000000010";

    -- i_cmp89_memread(LOGICAL,345)@9
    i_cmp89_memread_q <= "1" WHEN redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_q = c_i16_2gr_q ELSE "0";

    -- i_or_cond_memread(LOGICAL,503)@9
    i_or_cond_memread_q <= i_cmp89_memread_q and redist12_i_cmp93_memread_q_6_q;

    -- i_or_cond567_xor_demorgan_memread(LOGICAL,501)@9
    i_or_cond567_xor_demorgan_memread_q <= redist14_i_cmp40_memread_n_4_q and redist13_i_cmp46_memread_c_4_q;

    -- i_or_cond567_xor_memread(LOGICAL,502)@9
    i_or_cond567_xor_memread_q <= i_or_cond567_xor_demorgan_memread_q xor VCC_q;

    -- i_cmp12532_phi_decision2152_or_or_memread(LOGICAL,326)@9
    i_cmp12532_phi_decision2152_or_or_memread_q <= redist17_i_cmp12532_rm_memread_q_8_q or i_or_cond567_xor_memread_q;

    -- redist17_i_cmp12532_rm_memread_q_8(DELAY,788)
    redist17_i_cmp12532_rm_memread_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp12532_rm_memread_q, xout => redist17_i_cmp12532_rm_memread_q_8_q, clk => clock, aclr => resetn );

    -- i_idxprom49_memread_vt_const_63(CONSTANT,458)
    i_idxprom49_memread_vt_const_63_q <= "0000000000000000000000000000000000";

    -- i_div_memread_vt_const_31(CONSTANT,445)
    i_div_memread_vt_const_31_q <= "00";

    -- rightShiftStage0Idx1Rng2_uid669_i_div_memread_memread57_shift_x(BITSELECT,668)@7
    rightShiftStage0Idx1Rng2_uid669_i_div_memread_memread57_shift_x_b <= bgTrunc_i_add37_memread_sel_x_b(31 downto 2);

    -- rightShiftStage0Idx1_uid671_i_div_memread_memread57_shift_x(BITJOIN,670)@7
    rightShiftStage0Idx1_uid671_i_div_memread_memread57_shift_x_q <= i_div_memread_vt_const_31_q & rightShiftStage0Idx1Rng2_uid669_i_div_memread_memread57_shift_x_b;

    -- i_syncbuf_data_dim1_sync_buffer_memread(BLACKBOX,530)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_data_dim1_sync_buffer_memread : i_syncbuf_data_dim1_sync_buffer_memread55
    PORT MAP (
        in_buffer_in => in_data_dim1,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_data_dim1_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv33_rm_memread_sel_x(BITSELECT,139)@5
    i_conv33_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_data_dim1_sync_buffer_memread_out_buffer_out(15 downto 0)), 32));

    -- i_conv33_rm_memread_vt_select_15(BITSELECT,416)@5
    i_conv33_rm_memread_vt_select_15_b <= i_conv33_rm_memread_sel_x_b(15 downto 0);

    -- i_syncbuf_padding_sync_buffer_memread(BLACKBOX,538)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_padding_sync_buffer_memread : i_syncbuf_padding_sync_buffer_memread46
    PORT MAP (
        in_buffer_in => in_padding,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_padding_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv32_rm_memread_sel_x(BITSELECT,138)@5
    i_conv32_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_padding_sync_buffer_memread_out_buffer_out(7 downto 0)), 32));

    -- i_conv32_rm_memread_vt_select_7(BITSELECT,412)@5
    i_conv32_rm_memread_vt_select_7_b <= i_conv32_rm_memread_sel_x_b(7 downto 0);

    -- i_conv32_rm_memread_vt_join(BITJOIN,411)@5
    i_conv32_rm_memread_vt_join_q <= i_conv1177_rm_memread_vt_const_31_q & i_conv32_rm_memread_vt_select_7_b;

    -- c_i32_65535(CONSTANT,222)
    c_i32_65535_q <= "00000000000000001111111111111111";

    -- i_ffwd_dst_conv2027_memread(BLACKBOX,448)@2
    thei_ffwd_dst_conv2027_memread : i_ffwd_dst_conv2027_memread44
    PORT MAP (
        in_intel_reserved_ffwd_0_0 => in_intel_reserved_ffwd_0_0,
        in_stall_in => GND_q,
        in_valid_in => redist32_sync_in_aunroll_x_in_i_valid_1_q,
        out_dest_data_out_0_0 => i_ffwd_dst_conv2027_memread_out_dest_data_out_0_0,
        clock => clock,
        resetn => resetn
    );

    -- i_conv24_memread_vt_join_narrowed_x(BITSELECT,135)@2
    i_conv24_memread_vt_join_narrowed_x_b <= i_conv24_memread_vt_join_q(15 downto 0);

    -- i_mul27_memread(MULT,492)@2 + 2
    i_mul27_memread_pr <= UNSIGNED(UNSIGNED(i_mul27_memread_a0) * UNSIGNED(i_mul27_memread_b0));
    i_mul27_memread_component: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul27_memread_a0 <= (others => '0');
            i_mul27_memread_b0 <= (others => '0');
            i_mul27_memread_s1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_mul27_memread_a0 <= i_conv24_memread_vt_join_narrowed_x_b;
            i_mul27_memread_b0 <= i_ffwd_dst_conv2027_memread_out_dest_data_out_0_0;
            i_mul27_memread_s1 <= STD_LOGIC_VECTOR(i_mul27_memread_pr);
        END IF;
    END PROCESS;
    i_mul27_memread_q <= i_mul27_memread_s1;

    -- i_mul27_memread_extender_x(BITJOIN,168)@4
    i_mul27_memread_extender_x_q <= i_mul21_memread_multconst_x_q & i_mul27_memread_q;

    -- bgTrunc_i_mul27_memread_sel_x(BITSELECT,20)@4
    bgTrunc_i_mul27_memread_sel_x_b <= i_mul27_memread_extender_x_q(31 downto 0);

    -- i_inc86_memread(ADD,484)@4
    i_inc86_memread_a <= STD_LOGIC_VECTOR("0" & i_win_itm_y_1_memread_q);
    i_inc86_memread_b <= STD_LOGIC_VECTOR("0" & c_i8_1gr_q);
    i_inc86_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc86_memread_a) + UNSIGNED(i_inc86_memread_b));
    i_inc86_memread_q <= i_inc86_memread_o(8 downto 0);

    -- bgTrunc_i_inc86_memread_sel_x(BITSELECT,18)@4
    bgTrunc_i_inc86_memread_sel_x_b <= i_inc86_memread_q(7 downto 0);

    -- redist48_bgTrunc_i_inc86_memread_sel_x_b_1(DELAY,819)
    redist48_bgTrunc_i_inc86_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc86_memread_sel_x_b, xout => redist48_bgTrunc_i_inc86_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_win_size_y_sync_buffer_memread(BLACKBOX,546)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_win_size_y_sync_buffer_memread : i_syncbuf_win_size_y_sync_buffer_memread64
    PORT MAP (
        in_buffer_in => in_win_size_y,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_win_size_y_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv64_rm_memread_sel_x(BITSELECT,142)@4
    i_conv64_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_win_size_y_sync_buffer_memread_out_buffer_out(7 downto 0)), 32));

    -- i_conv64_rm_memread_vt_select_7(BITSELECT,432)@4
    i_conv64_rm_memread_vt_select_7_b <= i_conv64_rm_memread_sel_x_b(7 downto 0);

    -- i_conv64_rm_memread_vt_join(BITJOIN,431)@4
    i_conv64_rm_memread_vt_join_q <= i_conv1177_rm_memread_vt_const_31_q & i_conv64_rm_memread_vt_select_7_b;

    -- i_sub65_rm_memread(ADD,521)@4
    i_sub65_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv64_rm_memread_vt_join_q);
    i_sub65_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub65_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub65_rm_memread_a) + UNSIGNED(i_sub65_rm_memread_b));
    i_sub65_rm_memread_q <= i_sub65_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub65_rm_memread_sel_x(BITSELECT,33)@4
    bgTrunc_i_sub65_rm_memread_sel_x_b <= i_sub65_rm_memread_q(31 downto 0);

    -- i_cmp66_memread(LOGICAL,340)@4 + 1
    i_cmp66_memread_qi <= "1" WHEN i_conv23_memread_vt_join_q = bgTrunc_i_sub65_rm_memread_sel_x_b ELSE "0";
    i_cmp66_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp66_memread_qi, xout => i_cmp66_memread_q, clk => clock, aclr => resetn );

    -- i_win_itm_y_2_memread(MUX,553)@5
    i_win_itm_y_2_memread_s <= i_cmp66_memread_q;
    i_win_itm_y_2_memread_combproc: PROCESS (i_win_itm_y_2_memread_s, redist48_bgTrunc_i_inc86_memread_sel_x_b_1_q, c_i8_0gr_q)
    BEGIN
        CASE (i_win_itm_y_2_memread_s) IS
            WHEN "0" => i_win_itm_y_2_memread_q <= redist48_bgTrunc_i_inc86_memread_sel_x_b_1_q;
            WHEN "1" => i_win_itm_y_2_memread_q <= c_i8_0gr_q;
            WHEN OTHERS => i_win_itm_y_2_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_win_itm_y_0539_push22_memread(BLACKBOX,290)@5
    -- out out_feedback_out_22@20000000
    -- out out_feedback_valid_out_22@20000000
    thei_acl_push_i8_win_itm_y_0539_push22_memread : i_acl_push_i8_win_itm_y_0539_push22_memread89
    PORT MAP (
        in_data_in => i_win_itm_y_2_memread_q,
        in_feedback_stall_in_22 => i_acl_pop_i8_win_itm_y_0539_pop22_memread_out_feedback_stall_out_22,
        in_notexit36 => redist5_i_notexit36_memread_q_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_22 => i_acl_push_i8_win_itm_y_0539_push22_memread_out_feedback_out_22,
        out_feedback_valid_out_22 => i_acl_push_i8_win_itm_y_0539_push22_memread_out_feedback_valid_out_22,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_win_itm_y_0539_pop22_memread(BLACKBOX,277)@4
    -- out out_feedback_stall_out_22@20000000
    thei_acl_pop_i8_win_itm_y_0539_pop22_memread : i_acl_pop_i8_win_itm_y_0539_pop22_memread36
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist30_sync_in_aunroll_x_in_c0_eni1_1_3_q,
        in_feedback_in_22 => i_acl_push_i8_win_itm_y_0539_push22_memread_out_feedback_out_22,
        in_feedback_valid_in_22 => i_acl_push_i8_win_itm_y_0539_push22_memread_out_feedback_valid_out_22,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i8_win_itm_y_0539_pop22_memread_out_data_out,
        out_feedback_stall_out_22 => i_acl_pop_i8_win_itm_y_0539_pop22_memread_out_feedback_stall_out_22,
        clock => clock,
        resetn => resetn
    );

    -- redist21_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_2(DELAY,792)
    redist21_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out, xout => redist21_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_cmp16_memread(LOGICAL,336)@4
    i_cmp16_memread_q <= "1" WHEN redist21_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_2_q = i_mul21_memread_multconst_x_q ELSE "0";

    -- i_win_itm_y_1_memread(MUX,552)@4
    i_win_itm_y_1_memread_s <= i_cmp16_memread_q;
    i_win_itm_y_1_memread_combproc: PROCESS (i_win_itm_y_1_memread_s, i_acl_pop_i8_win_itm_y_0539_pop22_memread_out_data_out, c_i8_0gr_q)
    BEGIN
        CASE (i_win_itm_y_1_memread_s) IS
            WHEN "0" => i_win_itm_y_1_memread_q <= i_acl_pop_i8_win_itm_y_0539_pop22_memread_out_data_out;
            WHEN "1" => i_win_itm_y_1_memread_q <= c_i8_0gr_q;
            WHEN OTHERS => i_win_itm_y_1_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv23_memread_sel_x(BITSELECT,133)@4
    i_conv23_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_win_itm_y_1_memread_q(7 downto 0)), 32));

    -- i_conv23_memread_vt_select_7(BITSELECT,396)@4
    i_conv23_memread_vt_select_7_b <= i_conv23_memread_sel_x_b(7 downto 0);

    -- i_conv23_memread_vt_join(BITJOIN,395)@4
    i_conv23_memread_vt_join_q <= i_conv1177_rm_memread_vt_const_31_q & i_conv23_memread_vt_select_7_b;

    -- i_add_memread(ADD,302)@4
    i_add_memread_a <= STD_LOGIC_VECTOR("0" & i_conv23_memread_vt_join_q);
    i_add_memread_b <= STD_LOGIC_VECTOR("0" & bgTrunc_i_mul27_memread_sel_x_b);
    i_add_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_memread_a) + UNSIGNED(i_add_memread_b));
    i_add_memread_q <= i_add_memread_o(32 downto 0);

    -- bgTrunc_i_add_memread_sel_x(BITSELECT,9)@4
    bgTrunc_i_add_memread_sel_x_b <= i_add_memread_q(31 downto 0);

    -- i_conv31_memread(LOGICAL,405)@4
    i_conv31_memread_q <= bgTrunc_i_add_memread_sel_x_b and c_i32_65535_q;

    -- i_conv31_memread_vt_select_15(BITSELECT,408)@4
    i_conv31_memread_vt_select_15_b <= i_conv31_memread_q(15 downto 0);

    -- redist9_i_conv31_memread_vt_select_15_b_1(DELAY,780)
    redist9_i_conv31_memread_vt_select_15_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv31_memread_vt_select_15_b, xout => redist9_i_conv31_memread_vt_select_15_b_1_q, clk => clock, aclr => resetn );

    -- i_conv31_memread_vt_join(BITJOIN,407)@5
    i_conv31_memread_vt_join_q <= i_mul21_memread_multconst_x_q & redist9_i_conv31_memread_vt_select_15_b_1_q;

    -- i_sub_memread(SUB,523)@5
    i_sub_memread_a <= STD_LOGIC_VECTOR("0" & i_conv31_memread_vt_join_q);
    i_sub_memread_b <= STD_LOGIC_VECTOR("0" & i_conv32_rm_memread_vt_join_q);
    i_sub_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_memread_a) - UNSIGNED(i_sub_memread_b));
    i_sub_memread_q <= i_sub_memread_o(32 downto 0);

    -- bgTrunc_i_sub_memread_sel_x(BITSELECT,35)@5
    bgTrunc_i_sub_memread_sel_x_b <= STD_LOGIC_VECTOR(i_sub_memread_q(31 downto 0));

    -- i_mul34_memread(MULT,494)@5 + 2
    i_mul34_memread_pr <= UNSIGNED(UNSIGNED(i_mul34_memread_a0) * UNSIGNED(i_mul34_memread_b0));
    i_mul34_memread_component: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul34_memread_a0 <= (others => '0');
            i_mul34_memread_b0 <= (others => '0');
            i_mul34_memread_s1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_mul34_memread_a0 <= bgTrunc_i_sub_memread_sel_x_b;
            i_mul34_memread_b0 <= i_conv33_rm_memread_vt_select_15_b;
            i_mul34_memread_s1 <= STD_LOGIC_VECTOR(i_mul34_memread_pr);
        END IF;
    END PROCESS;
    i_mul34_memread_q <= i_mul34_memread_s1;

    -- i_mul34_memread_extender_x(BITJOIN,172)@7
    i_mul34_memread_extender_x_q <= i_mul21_memread_multconst_x_q & i_mul34_memread_q;

    -- bgTrunc_i_mul34_memread_sel_x(BITSELECT,22)@7
    bgTrunc_i_mul34_memread_sel_x_b <= i_mul34_memread_extender_x_q(31 downto 0);

    -- i_conv18_memread_vt_join_narrowed_x(BITSELECT,132)@2
    i_conv18_memread_vt_join_narrowed_x_b <= i_conv18_memread_vt_join_q(15 downto 0);

    -- redist39_i_conv18_memread_vt_join_narrowed_x_b_2(DELAY,810)
    redist39_i_conv18_memread_vt_join_narrowed_x_b_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv18_memread_vt_join_narrowed_x_b, xout => redist39_i_conv18_memread_vt_join_narrowed_x_b_2_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_mul28_memread(BLACKBOX,449)@4
    thei_ffwd_dst_mul28_memread : i_ffwd_dst_mul28_memread51
    PORT MAP (
        in_intel_reserved_ffwd_1_0 => in_intel_reserved_ffwd_1_0,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_1_0 => i_ffwd_dst_mul28_memread_out_dest_data_out_1_0,
        clock => clock,
        resetn => resetn
    );

    -- i_mul21_memread(MULT,491)@4 + 2
    i_mul21_memread_pr <= UNSIGNED(UNSIGNED(i_mul21_memread_a0) * UNSIGNED(i_mul21_memread_b0));
    i_mul21_memread_component: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul21_memread_a0 <= (others => '0');
            i_mul21_memread_b0 <= (others => '0');
            i_mul21_memread_s1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_mul21_memread_a0 <= i_ffwd_dst_mul28_memread_out_dest_data_out_1_0;
            i_mul21_memread_b0 <= redist39_i_conv18_memread_vt_join_narrowed_x_b_2_q;
            i_mul21_memread_s1 <= STD_LOGIC_VECTOR(i_mul21_memread_pr);
        END IF;
    END PROCESS;
    i_mul21_memread_q <= i_mul21_memread_s1;

    -- i_mul21_memread_extender_x(BITJOIN,166)@6
    i_mul21_memread_extender_x_q <= i_mul21_memread_multconst_x_q & i_mul21_memread_q;

    -- bgTrunc_i_mul21_memread_sel_x(BITSELECT,19)@6
    bgTrunc_i_mul21_memread_sel_x_b <= i_mul21_memread_extender_x_q(31 downto 0);

    -- i_conv36_memread(LOGICAL,417)@6
    i_conv36_memread_q <= bgTrunc_i_mul21_memread_sel_x_b and c_i32_65535_q;

    -- i_conv36_memread_vt_select_15(BITSELECT,420)@6
    i_conv36_memread_vt_select_15_b <= i_conv36_memread_q(15 downto 0);

    -- i_conv36_memread_vt_join(BITJOIN,419)@6
    i_conv36_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv36_memread_vt_select_15_b;

    -- i_syncbuf_data_dim1xdim2_sync_buffer_memread(BLACKBOX,531)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_data_dim1xdim2_sync_buffer_memread : i_syncbuf_data_dim1xdim2_sync_buffer_memread53
    PORT MAP (
        in_buffer_in => in_data_dim1xdim2,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_data_dim1xdim2_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_win_itm_z_1_memread_q_1(DELAY,771)
    redist0_i_win_itm_z_1_memread_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_win_itm_z_1_memread_q, xout => redist0_i_win_itm_z_1_memread_q_1_q, clk => clock, aclr => resetn );

    -- i_div59_rm_memread_vt_const_31(CONSTANT,442)
    i_div59_rm_memread_vt_const_31_q <= "00000000000000000000";

    -- rightShiftStage0Idx1Pad4_uid661_i_div59_rm_memread_memread69_shift_x(CONSTANT,660)
    rightShiftStage0Idx1Pad4_uid661_i_div59_rm_memread_memread69_shift_x_q <= "0000";

    -- rightShiftStage0Idx1Rng4_uid660_i_div59_rm_memread_memread69_shift_x(BITSELECT,659)@4
    rightShiftStage0Idx1Rng4_uid660_i_div59_rm_memread_memread69_shift_x_b <= i_conv58_rm_memread_vt_join_q(31 downto 4);

    -- rightShiftStage0Idx1_uid662_i_div59_rm_memread_memread69_shift_x(BITJOIN,661)@4
    rightShiftStage0Idx1_uid662_i_div59_rm_memread_memread69_shift_x_q <= rightShiftStage0Idx1Pad4_uid661_i_div59_rm_memread_memread69_shift_x_q & rightShiftStage0Idx1Rng4_uid660_i_div59_rm_memread_memread69_shift_x_b;

    -- i_syncbuf_weight_dim3_sync_buffer_memread(BLACKBOX,542)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_weight_dim3_sync_buffer_memread : i_syncbuf_weight_dim3_sync_buffer_memread67
    PORT MAP (
        in_buffer_in => in_weight_dim3,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_weight_dim3_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv58_rm_memread_sel_x(BITSELECT,141)@4
    i_conv58_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_weight_dim3_sync_buffer_memread_out_buffer_out(15 downto 0)), 32));

    -- i_conv58_rm_memread_vt_select_15(BITSELECT,428)@4
    i_conv58_rm_memread_vt_select_15_b <= i_conv58_rm_memread_sel_x_b(15 downto 0);

    -- i_conv58_rm_memread_vt_join(BITJOIN,427)@4
    i_conv58_rm_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv58_rm_memread_vt_select_15_b;

    -- rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x(MUX,663)@4
    rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_s <= VCC_q;
    rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_combproc: PROCESS (rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_s, i_conv58_rm_memread_vt_join_q, rightShiftStage0Idx1_uid662_i_div59_rm_memread_memread69_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_q <= i_conv58_rm_memread_vt_join_q;
            WHEN "1" => rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_q <= rightShiftStage0Idx1_uid662_i_div59_rm_memread_memread69_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_div59_rm_memread_vt_select_11(BITSELECT,444)@4
    i_div59_rm_memread_vt_select_11_b <= rightShiftStage0_uid664_i_div59_rm_memread_memread69_shift_x_q(11 downto 0);

    -- i_div59_rm_memread_vt_join(BITJOIN,443)@4
    i_div59_rm_memread_vt_join_q <= i_div59_rm_memread_vt_const_31_q & i_div59_rm_memread_vt_select_11_b;

    -- i_sub60_rm_memread(ADD,520)@4
    i_sub60_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_div59_rm_memread_vt_join_q);
    i_sub60_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub60_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub60_rm_memread_a) + UNSIGNED(i_sub60_rm_memread_b));
    i_sub60_rm_memread_q <= i_sub60_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub60_rm_memread_sel_x(BITSELECT,32)@4
    bgTrunc_i_sub60_rm_memread_sel_x_b <= i_sub60_rm_memread_q(31 downto 0);

    -- i_cmp61_not_memread(LOGICAL,339)@4 + 1
    i_cmp61_not_memread_qi <= "1" WHEN i_conv29_memread_vt_join_q /= bgTrunc_i_sub60_rm_memread_sel_x_b ELSE "0";
    i_cmp61_not_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp61_not_memread_qi, xout => i_cmp61_not_memread_q, clk => clock, aclr => resetn );

    -- i_cmp66_mux_memread(LOGICAL,341)@5
    i_cmp66_mux_memread_q <= i_cmp61_not_memread_q and i_cmp66_memread_q;

    -- i_inc76_memread_sel_x(BITSELECT,161)@5
    i_inc76_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_cmp66_mux_memread_q(0 downto 0)), 16));

    -- i_inc76_memread_vt_select_0(BITSELECT,482)@5
    i_inc76_memread_vt_select_0_b <= i_inc76_memread_sel_x_b(0 downto 0);

    -- i_inc76_memread_vt_join(BITJOIN,481)@5
    i_inc76_memread_vt_join_q <= i_add45_rm_memread_vt_const_31_q & i_inc76_memread_vt_select_0_b;

    -- i_inc76_win_itm_z_1_memread(ADD,483)@5
    i_inc76_win_itm_z_1_memread_a <= STD_LOGIC_VECTOR("0" & i_inc76_memread_vt_join_q);
    i_inc76_win_itm_z_1_memread_b <= STD_LOGIC_VECTOR("0" & redist0_i_win_itm_z_1_memread_q_1_q);
    i_inc76_win_itm_z_1_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc76_win_itm_z_1_memread_a) + UNSIGNED(i_inc76_win_itm_z_1_memread_b));
    i_inc76_win_itm_z_1_memread_q <= i_inc76_win_itm_z_1_memread_o(16 downto 0);

    -- bgTrunc_i_inc76_win_itm_z_1_memread_sel_x(BITSELECT,17)@5
    bgTrunc_i_inc76_win_itm_z_1_memread_sel_x_b <= i_inc76_win_itm_z_1_memread_q(15 downto 0);

    -- i_cmp66_not_memread(LOGICAL,342)@5
    i_cmp66_not_memread_q <= i_cmp66_memread_q xor VCC_q;

    -- i_brmerge_memread(LOGICAL,312)@5
    i_brmerge_memread_q <= i_cmp61_not_memread_q or i_cmp66_not_memread_q;

    -- i_acl_1785_memread(MUX,228)@5
    i_acl_1785_memread_s <= i_brmerge_memread_q;
    i_acl_1785_memread_combproc: PROCESS (i_acl_1785_memread_s, i_mul21_memread_multconst_x_q, bgTrunc_i_inc76_win_itm_z_1_memread_sel_x_b)
    BEGIN
        CASE (i_acl_1785_memread_s) IS
            WHEN "0" => i_acl_1785_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN "1" => i_acl_1785_memread_q <= bgTrunc_i_inc76_win_itm_z_1_memread_sel_x_b;
            WHEN OTHERS => i_acl_1785_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_win_itm_z_0540_push21_memread(BLACKBOX,285)@5
    -- out out_feedback_out_21@20000000
    -- out out_feedback_valid_out_21@20000000
    thei_acl_push_i16_win_itm_z_0540_push21_memread : i_acl_push_i16_win_itm_z_0540_push21_memread91
    PORT MAP (
        in_data_in => i_acl_1785_memread_q,
        in_feedback_stall_in_21 => i_acl_pop_i16_win_itm_z_0540_pop21_memread_out_feedback_stall_out_21,
        in_notexit36 => redist5_i_notexit36_memread_q_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_21 => i_acl_push_i16_win_itm_z_0540_push21_memread_out_feedback_out_21,
        out_feedback_valid_out_21 => i_acl_push_i16_win_itm_z_0540_push21_memread_out_feedback_valid_out_21,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_win_itm_z_0540_pop21_memread(BLACKBOX,273)@4
    -- out out_feedback_stall_out_21@20000000
    thei_acl_pop_i16_win_itm_z_0540_pop21_memread : i_acl_pop_i16_win_itm_z_0540_pop21_memread38
    PORT MAP (
        in_data_in => i_mul21_memread_multconst_x_q,
        in_dir => redist30_sync_in_aunroll_x_in_c0_eni1_1_3_q,
        in_feedback_in_21 => i_acl_push_i16_win_itm_z_0540_push21_memread_out_feedback_out_21,
        in_feedback_valid_in_21 => i_acl_push_i16_win_itm_z_0540_push21_memread_out_feedback_valid_out_21,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i16_win_itm_z_0540_pop21_memread_out_data_out,
        out_feedback_stall_out_21 => i_acl_pop_i16_win_itm_z_0540_pop21_memread_out_feedback_stall_out_21,
        clock => clock,
        resetn => resetn
    );

    -- i_win_itm_z_1_memread(MUX,554)@4
    i_win_itm_z_1_memread_s <= i_cmp16_memread_q;
    i_win_itm_z_1_memread_combproc: PROCESS (i_win_itm_z_1_memread_s, i_acl_pop_i16_win_itm_z_0540_pop21_memread_out_data_out, i_mul21_memread_multconst_x_q)
    BEGIN
        CASE (i_win_itm_z_1_memread_s) IS
            WHEN "0" => i_win_itm_z_1_memread_q <= i_acl_pop_i16_win_itm_z_0540_pop21_memread_out_data_out;
            WHEN "1" => i_win_itm_z_1_memread_q <= i_mul21_memread_multconst_x_q;
            WHEN OTHERS => i_win_itm_z_1_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv29_memread_sel_x(BITSELECT,136)@4
    i_conv29_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_win_itm_z_1_memread_q(15 downto 0)), 32));

    -- i_conv29_memread_vt_select_15(BITSELECT,404)@4
    i_conv29_memread_vt_select_15_b <= i_conv29_memread_sel_x_b(15 downto 0);

    -- i_conv29_memread_vt_join(BITJOIN,403)@4
    i_conv29_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv29_memread_vt_select_15_b;

    -- i_conv29_memread_vt_join_narrowed_x(BITSELECT,137)@4
    i_conv29_memread_vt_join_narrowed_x_b <= i_conv29_memread_vt_join_q(15 downto 0);

    -- i_mul30_memread(MULT,493)@4 + 2
    i_mul30_memread_pr <= UNSIGNED(UNSIGNED(i_mul30_memread_a0) * UNSIGNED(i_mul30_memread_b0));
    i_mul30_memread_component: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul30_memread_a0 <= (others => '0');
            i_mul30_memread_b0 <= (others => '0');
            i_mul30_memread_s1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_mul30_memread_a0 <= i_conv29_memread_vt_join_narrowed_x_b;
            i_mul30_memread_b0 <= i_syncbuf_data_dim1xdim2_sync_buffer_memread_out_buffer_out;
            i_mul30_memread_s1 <= STD_LOGIC_VECTOR(i_mul30_memread_pr);
        END IF;
    END PROCESS;
    i_mul30_memread_q <= i_mul30_memread_s1;

    -- i_mul30_memread_extender_x(BITJOIN,170)@6
    i_mul30_memread_extender_x_q <= i_mul21_memread_multconst_x_q & i_mul30_memread_q;

    -- bgTrunc_i_mul30_memread_sel_x(BITSELECT,21)@6
    bgTrunc_i_mul30_memread_sel_x_b <= i_mul30_memread_extender_x_q(31 downto 0);

    -- i_add35_memread(ADD,296)@6
    i_add35_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_mul30_memread_sel_x_b);
    i_add35_memread_b <= STD_LOGIC_VECTOR("0" & i_conv36_memread_vt_join_q);
    i_add35_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add35_memread_a) + UNSIGNED(i_add35_memread_b));
    i_add35_memread_q <= i_add35_memread_o(32 downto 0);

    -- bgTrunc_i_add35_memread_sel_x(BITSELECT,6)@6
    bgTrunc_i_add35_memread_sel_x_b <= i_add35_memread_q(31 downto 0);

    -- redist52_bgTrunc_i_add35_memread_sel_x_b_1(DELAY,823)
    redist52_bgTrunc_i_add35_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add35_memread_sel_x_b, xout => redist52_bgTrunc_i_add35_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add37_memread(ADD,297)@7
    i_add37_memread_a <= STD_LOGIC_VECTOR("0" & redist52_bgTrunc_i_add35_memread_sel_x_b_1_q);
    i_add37_memread_b <= STD_LOGIC_VECTOR("0" & bgTrunc_i_mul34_memread_sel_x_b);
    i_add37_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add37_memread_a) + UNSIGNED(i_add37_memread_b));
    i_add37_memread_q <= i_add37_memread_o(32 downto 0);

    -- bgTrunc_i_add37_memread_sel_x(BITSELECT,7)@7
    bgTrunc_i_add37_memread_sel_x_b <= i_add37_memread_q(31 downto 0);

    -- rightShiftStage0_uid673_i_div_memread_memread57_shift_x(MUX,672)@7
    rightShiftStage0_uid673_i_div_memread_memread57_shift_x_s <= VCC_q;
    rightShiftStage0_uid673_i_div_memread_memread57_shift_x_combproc: PROCESS (rightShiftStage0_uid673_i_div_memread_memread57_shift_x_s, bgTrunc_i_add37_memread_sel_x_b, rightShiftStage0Idx1_uid671_i_div_memread_memread57_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid673_i_div_memread_memread57_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid673_i_div_memread_memread57_shift_x_q <= bgTrunc_i_add37_memread_sel_x_b;
            WHEN "1" => rightShiftStage0_uid673_i_div_memread_memread57_shift_x_q <= rightShiftStage0Idx1_uid671_i_div_memread_memread57_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid673_i_div_memread_memread57_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_div_memread_vt_select_29(BITSELECT,447)@7
    i_div_memread_vt_select_29_b <= rightShiftStage0_uid673_i_div_memread_memread57_shift_x_q(29 downto 0);

    -- i_div_memread_vt_join(BITJOIN,446)@7
    i_div_memread_vt_join_q <= i_div_memread_vt_const_31_q & i_div_memread_vt_select_29_b;

    -- i_idxprom49_memread_sel_x(BITSELECT,157)@7
    i_idxprom49_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_div_memread_vt_join_q(31 downto 0)), 64));

    -- i_idxprom49_memread_vt_select_29(BITSELECT,460)@7
    i_idxprom49_memread_vt_select_29_b <= i_idxprom49_memread_sel_x_b(29 downto 0);

    -- redist8_i_idxprom49_memread_vt_select_29_b_1(DELAY,779)
    redist8_i_idxprom49_memread_vt_select_29_b_1 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_idxprom49_memread_vt_select_29_b, xout => redist8_i_idxprom49_memread_vt_select_29_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom49_memread_vt_join(BITJOIN,459)@8
    i_idxprom49_memread_vt_join_q <= i_idxprom49_memread_vt_const_63_q & redist8_i_idxprom49_memread_vt_select_29_b_1_q;

    -- i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select(BITSELECT,770)@8
    i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_b <= i_idxprom49_memread_vt_join_q(15 downto 0);
    i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_c <= i_idxprom49_memread_vt_join_q(31 downto 16);
    i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_d <= i_idxprom49_memread_vt_join_q(47 downto 32);
    i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_e <= i_idxprom49_memread_vt_join_q(63 downto 48);

    -- i_arrayidx50458_0_memread_memread60_mult_x_im9_shift0(BITSHIFT,766)@8
    i_arrayidx50458_0_memread_memread60_mult_x_im9_shift0_qint <= i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_e & "0000000";
    i_arrayidx50458_0_memread_memread60_mult_x_im9_shift0_q <= i_arrayidx50458_0_memread_memread60_mult_x_im9_shift0_qint(22 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_x_align_15(BITSHIFT,653)@8
    i_arrayidx50458_0_memread_memread60_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx50458_0_memread_memread60_mult_x_im9_shift0_q) & "00000000";
    i_arrayidx50458_0_memread_memread60_mult_x_align_15_q <= i_arrayidx50458_0_memread_memread60_mult_x_align_15_qint(31 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_x_im3_shift0(BITSHIFT,764)@8
    i_arrayidx50458_0_memread_memread60_mult_x_im3_shift0_qint <= i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_c & "0000000";
    i_arrayidx50458_0_memread_memread60_mult_x_im3_shift0_q <= i_arrayidx50458_0_memread_memread60_mult_x_im3_shift0_qint(22 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_x_align_14(BITSHIFT,652)@8
    i_arrayidx50458_0_memread_memread60_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx50458_0_memread_memread60_mult_x_im3_shift0_q) & "0000000000000000";
    i_arrayidx50458_0_memread_memread60_mult_x_align_14_q <= i_arrayidx50458_0_memread_memread60_mult_x_align_14_qint(39 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_x_join_16(BITJOIN,654)@8
    i_arrayidx50458_0_memread_memread60_mult_x_join_16_q <= i_arrayidx50458_0_memread_memread60_mult_x_align_15_q & i_arrayidx50458_0_memread_memread60_mult_x_align_14_q;

    -- i_arrayidx50458_0_memread_memread60_mult_x_im6_shift0(BITSHIFT,765)@8
    i_arrayidx50458_0_memread_memread60_mult_x_im6_shift0_qint <= i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_d & "0000000";
    i_arrayidx50458_0_memread_memread60_mult_x_im6_shift0_q <= i_arrayidx50458_0_memread_memread60_mult_x_im6_shift0_qint(22 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_x_align_12(BITSHIFT,650)@8
    i_arrayidx50458_0_memread_memread60_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx50458_0_memread_memread60_mult_x_im6_shift0_q) & "00000000";
    i_arrayidx50458_0_memread_memread60_mult_x_align_12_q <= i_arrayidx50458_0_memread_memread60_mult_x_align_12_qint(31 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_x_im0_shift0(BITSHIFT,763)@8
    i_arrayidx50458_0_memread_memread60_mult_x_im0_shift0_qint <= i_arrayidx50458_0_memread_memread60_mult_x_bs1_merged_bit_select_b & "0000000";
    i_arrayidx50458_0_memread_memread60_mult_x_im0_shift0_q <= i_arrayidx50458_0_memread_memread60_mult_x_im0_shift0_qint(22 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_x_join_13(BITJOIN,651)@8
    i_arrayidx50458_0_memread_memread60_mult_x_join_13_q <= i_arrayidx50458_0_memread_memread60_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx50458_0_memread_memread60_mult_x_im0_shift0_q);

    -- i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0(ADD,655)@8
    i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000000" & i_arrayidx50458_0_memread_memread60_mult_x_join_13_q);
    i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx50458_0_memread_memread60_mult_x_join_16_q);
    i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_b));
    i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_q <= i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_o(72 downto 0);

    -- i_arrayidx50458_0_memread_memread60_mult_extender_x(BITJOIN,113)@8
    i_arrayidx50458_0_memread_memread60_mult_extender_x_q <= i_arrayidx102400_0_memread_memread79_mult_multconst_x_q & i_arrayidx50458_0_memread_memread60_mult_x_result_add_0_0_q(71 downto 0);

    -- i_arrayidx50458_0_memread_memread60_trunc_sel_x(BITSELECT,115)@8
    i_arrayidx50458_0_memread_memread60_trunc_sel_x_b <= i_arrayidx50458_0_memread_memread60_mult_extender_x_q(63 downto 0);

    -- redist41_i_arrayidx50458_0_memread_memread60_trunc_sel_x_b_1(DELAY,812)
    redist41_i_arrayidx50458_0_memread_memread60_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx50458_0_memread_memread60_trunc_sel_x_b, xout => redist41_i_arrayidx50458_0_memread_memread60_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_bottom_sync_buffer_memread(BLACKBOX,525)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_bottom_sync_buffer_memread : i_syncbuf_bottom_sync_buffer_memread58
    PORT MAP (
        in_buffer_in => in_bottom,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_8_q,
        out_buffer_out => i_syncbuf_bottom_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx50458_0_memread_memread60_add_x(ADD,116)@9
    i_arrayidx50458_0_memread_memread60_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_bottom_sync_buffer_memread_out_buffer_out);
    i_arrayidx50458_0_memread_memread60_add_x_b <= STD_LOGIC_VECTOR("0" & redist41_i_arrayidx50458_0_memread_memread60_trunc_sel_x_b_1_q);
    i_arrayidx50458_0_memread_memread60_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx50458_0_memread_memread60_add_x_a) + UNSIGNED(i_arrayidx50458_0_memread_memread60_add_x_b));
    i_arrayidx50458_0_memread_memread60_add_x_q <= i_arrayidx50458_0_memread_memread60_add_x_o(64 downto 0);

    -- i_arrayidx50458_0_memread_memread60_dupName_0_trunc_sel_x(BITSELECT,110)@9
    i_arrayidx50458_0_memread_memread60_dupName_0_trunc_sel_x_b <= i_arrayidx50458_0_memread_memread60_add_x_q(63 downto 0);

    -- i_syncbuf_data_dim2_sync_buffer_memread(BLACKBOX,532)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_data_dim2_sync_buffer_memread : i_syncbuf_data_dim2_sync_buffer_memread48
    PORT MAP (
        in_buffer_in => in_data_dim2,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_data_dim2_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv43_rm_memread_sel_x(BITSELECT,140)@5
    i_conv43_rm_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_data_dim2_sync_buffer_memread_out_buffer_out(15 downto 0)), 32));

    -- i_conv43_rm_memread_vt_select_15(BITSELECT,424)@5
    i_conv43_rm_memread_vt_select_15_b <= i_conv43_rm_memread_sel_x_b(15 downto 0);

    -- i_conv43_rm_memread_vt_join(BITJOIN,423)@5
    i_conv43_rm_memread_vt_join_q <= i_mul21_memread_multconst_x_q & i_conv43_rm_memread_vt_select_15_b;

    -- i_add45_rm_memread(ADD,298)@5
    i_add45_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv32_rm_memread_vt_join_q);
    i_add45_rm_memread_b <= STD_LOGIC_VECTOR("0" & i_conv43_rm_memread_vt_join_q);
    i_add45_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add45_rm_memread_a) + UNSIGNED(i_add45_rm_memread_b));
    i_add45_rm_memread_q <= i_add45_rm_memread_o(32 downto 0);

    -- bgTrunc_i_add45_rm_memread_sel_x(BITSELECT,8)@5
    bgTrunc_i_add45_rm_memread_sel_x_b <= i_add45_rm_memread_q(31 downto 0);

    -- i_add45_rm_memread_vt_select_16(BITSELECT,301)@5
    i_add45_rm_memread_vt_select_16_b <= bgTrunc_i_add45_rm_memread_sel_x_b(16 downto 0);

    -- i_add45_rm_memread_vt_join(BITJOIN,300)@5
    i_add45_rm_memread_vt_join_q <= i_add45_rm_memread_vt_const_31_q & i_add45_rm_memread_vt_select_16_b;

    -- i_cmp46_memread(COMPARE,338)@5 + 1
    i_cmp46_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_conv31_memread_vt_join_q(31)) & i_conv31_memread_vt_join_q));
    i_cmp46_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_add45_rm_memread_vt_join_q(31)) & i_add45_rm_memread_vt_join_q));
    i_cmp46_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp46_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp46_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp46_memread_a) - SIGNED(i_cmp46_memread_b));
        END IF;
    END PROCESS;
    i_cmp46_memread_c(0) <= i_cmp46_memread_o(33);

    -- redist13_i_cmp46_memread_c_4(DELAY,784)
    redist13_i_cmp46_memread_c_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp46_memread_c, xout => redist13_i_cmp46_memread_c_4_q, clk => clock, aclr => resetn );

    -- i_cmp40_memread(COMPARE,337)@5 + 1
    i_cmp40_memread_a <= STD_LOGIC_VECTOR("00" & i_conv31_memread_vt_join_q);
    i_cmp40_memread_b <= STD_LOGIC_VECTOR("00" & i_conv32_rm_memread_vt_join_q);
    i_cmp40_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp40_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp40_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp40_memread_a) - UNSIGNED(i_cmp40_memread_b));
        END IF;
    END PROCESS;
    i_cmp40_memread_n(0) <= not (i_cmp40_memread_o(33));

    -- redist14_i_cmp40_memread_n_4(DELAY,785)
    redist14_i_cmp40_memread_n_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp40_memread_n, xout => redist14_i_cmp40_memread_n_4_q, clk => clock, aclr => resetn );

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_notEnable(LOGICAL,861)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_nor(LOGICAL,862)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_nor_q <= not (redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_notEnable_q or redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena_q);

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_last(CONSTANT,858)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_last_q <= "010";

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmp(LOGICAL,859)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmp_b <= STD_LOGIC_VECTOR("0" & redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_q);
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmp_q <= "1" WHEN redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_last_q = redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmp_b ELSE "0";

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmpReg(REG,860)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmpReg_q <= STD_LOGIC_VECTOR(redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmp_q);
        END IF;
    END PROCESS;

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena(REG,863)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_nor_q = "1") THEN
                redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_enaAnd(LOGICAL,864)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_enaAnd_q <= redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_sticky_ena_q and VCC_q;

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt(COUNTER,856)
    -- low=0, high=3, step=1, init=0
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_i <= redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_i, 2)));

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_inputreg(DELAY,854)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist26_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_1_q, xout => redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_inputreg_q, clk => clock, aclr => resetn );

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_wraddr(REG,857)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_wraddr_q <= STD_LOGIC_VECTOR(redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem(DUALMEM,855)
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_ia <= STD_LOGIC_VECTOR(redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_inputreg_q);
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_aa <= redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_wraddr_q;
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_ab <= redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_rdcnt_q;
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_reset0 <= not (resetn);
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_reset0,
        clock1 => clock,
        address_a => redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_aa,
        data_a => redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_ab,
        q_b => redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_iq
    );
    redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_q <= redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_iq(15 downto 0);

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_notEnable(LOGICAL,840)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_nor(LOGICAL,841)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_nor_q <= not (redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_notEnable_q or redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena_q);

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_last(CONSTANT,837)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_last_q <= "01";

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmp(LOGICAL,838)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmp_q <= "1" WHEN redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_last_q = redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_q ELSE "0";

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmpReg(REG,839)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmpReg_q <= STD_LOGIC_VECTOR(redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmp_q);
        END IF;
    END PROCESS;

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena(REG,842)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_nor_q = "1") THEN
                redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_enaAnd(LOGICAL,843)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_enaAnd_q <= redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_sticky_ena_q and VCC_q;

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt(COUNTER,835)
    -- low=0, high=2, step=1, init=0
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_eq <= '1';
            ELSE
                redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_eq <= '0';
            END IF;
            IF (redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_eq = '1') THEN
                redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i <= redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i + 2;
            ELSE
                redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i <= redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_i, 2)));

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_inputreg(DELAY,833)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist21_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_2_q, xout => redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_inputreg_q, clk => clock, aclr => resetn );

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_wraddr(REG,836)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_wraddr_q <= STD_LOGIC_VECTOR(redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem(DUALMEM,834)
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_ia <= STD_LOGIC_VECTOR(redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_inputreg_q);
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_aa <= redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_wraddr_q;
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_ab <= redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_rdcnt_q;
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_reset0 <= not (resetn);
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_reset0,
        clock1 => clock,
        address_a => redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_aa,
        data_a => redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_ab,
        q_b => redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_iq
    );
    redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_q <= redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_iq(15 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,178)@9
    out_c0_exi21_0 <= GND_q;
    out_c0_exi21_1 <= redist22_i_acl_pop_i16_win_itm_xyz_0547_pop14_memread_out_data_out_7_mem_q;
    out_c0_exi21_2 <= redist27_i_acl_pop_i16_gp_num_x_0535_pop25_memread_out_data_out_7_mem_q;
    out_c0_exi21_3 <= redist14_i_cmp40_memread_n_4_q;
    out_c0_exi21_4 <= redist13_i_cmp46_memread_c_4_q;
    out_c0_exi21_5 <= i_arrayidx50458_0_memread_memread60_dupName_0_trunc_sel_x_b;
    out_c0_exi21_6 <= redist17_i_cmp12532_rm_memread_q_8_q;
    out_c0_exi21_7 <= i_cmp12532_phi_decision2152_or_or_memread_q;
    out_c0_exi21_8 <= i_or_cond_memread_q;
    out_c0_exi21_9 <= i_cmp12532_phi_decision2152_or2160_memread_q;
    out_c0_exi21_10 <= i_arrayidx102400_0_memread_memread79_dupName_0_trunc_sel_x_b;
    out_c0_exi21_11 <= i_arrayidx106419_0_memread_memread82_dupName_0_trunc_sel_x_b;
    out_c0_exi21_12 <= i_acl_pop_i32_conv_z_cnt_0543_pop18_memread_out_data_out;
    out_c0_exi21_13 <= redist1_i_unnamed_memread88_q_8_q;
    out_c0_exi21_14 <= redist6_i_notexit36_memread_q_8_q;
    out_c0_exi21_15 <= redist19_i_cmp1243_memread_q_7_q;
    out_c0_exi21_16 <= i_cmp830_memread_q;
    out_c0_exi21_17 <= i_cmp1043_rm_memread_q;
    out_c0_exi21_18 <= i_acl_2132_memread_q;
    out_c0_exi21_19 <= i_cmp830_not_memread_q;
    out_c0_exi21_20 <= i_acl_pop_i16_line_buf_ptr_0544_pop17_memread_out_data_out;
    out_c0_exi21_21 <= i_cmp1179_memread_q;
    out_o_valid <= redist37_sync_in_aunroll_x_in_i_valid_8_q;

    -- i_acl_push_i1_notexitcond35_memread(BLACKBOX,286)@1
    -- out out_feedback_out_6@20000000
    -- out out_feedback_valid_out_6@20000000
    thei_acl_push_i1_notexitcond35_memread : i_acl_push_i1_notexitcond35_memread95
    PORT MAP (
        in_data_in => i_notexit36_memread_q,
        in_feedback_stall_in_6 => i_acl_pipeline_keep_going34_memread_out_not_exitcond_stall_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_6 => i_acl_push_i1_notexitcond35_memread_out_feedback_out_6,
        out_feedback_valid_out_6 => i_acl_push_i1_notexitcond35_memread_out_feedback_valid_out_6,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going34_memread(BLACKBOX,265)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going34_memread : i_acl_pipeline_keep_going34_memread29
    PORT MAP (
        in_data_in => VCC_q,
        in_initeration_in => GND_q,
        in_initeration_valid_in => GND_q,
        in_not_exitcond_in => i_acl_push_i1_notexitcond35_memread_out_feedback_out_6,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond35_memread_out_feedback_valid_out_6,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_exiting_stall_out => i_acl_pipeline_keep_going34_memread_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going34_memread_out_exiting_valid_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going34_memread_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going34_memread_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,227)
    out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_valid_out <= i_acl_pipeline_keep_going34_memread_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going34_memread_exiting_stall_out <= i_acl_pipeline_keep_going34_memread_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,579)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going34_memread_out_pipeline_valid_out;

END normal;
