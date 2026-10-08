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

-- VHDL created from i_sfc_logic_c0_while_body_memwrite_c0_enter_memwrite2
-- VHDL created on Thu Oct  8 10:49:43 2026


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

entity i_sfc_logic_c0_while_body_memwrite_c0_enter_memwrite2 is
    port (
        in_bypass : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni1_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_next_layer_padding : in std_logic_vector(7 downto 0);  -- ufix8
        in_out_dim1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_out_dim1_div_q_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_out_dim1xdim2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_out_dim2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_out_num : in std_logic_vector(31 downto 0);  -- ufix32
        in_q_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_rem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal_rem_zxq_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal_rem_zxrem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal_rem_zxstart_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scalxq_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_scalxrem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scalxstart_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_start_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_top : in std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_6 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi11_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_9 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_while_body_memwrite_c0_enter_memwrite2;

architecture normal of i_sfc_logic_c0_while_body_memwrite_c0_enter_memwrite2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going_memwrite8 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_in : in std_logic_vector(7 downto 0);  -- Fixed Point
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


    component i_acl_pop_i16_padding_tmp_09_pop14_memwrite100 is
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


    component i_acl_pop_i16_x_dim_08_pop15_memwrite96 is
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


    component i_acl_pop_i16_y_dim_012_pop11_memwrite92 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_z_dim_013_pop10_memwrite88 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_10 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_index_019_pop4_memwrite19 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i4_cleanups_pop17_memwrite4 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_17 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_stall_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i4_initerations_pop16_memwrite10 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_end_flag_011_pop12_memwrite39 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_inner_loop_018_pop5_memwrite23 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_5 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_lane_cnt_017_pop6_memwrite75 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_6 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_loop_num_014_pop9_memwrite53 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_9 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_start_flag_010_pop13_memwrite26 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_width_015_pop8_memwrite69 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_8 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_width_cnt_016_pop7_memwrite73 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_7 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_padding_tmp_09_push14_memwrite126 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i16_x_dim_08_push15_memwrite124 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i16_y_dim_012_push11_memwrite132 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_z_dim_013_push10_memwrite134 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_lastiniteration_memwrite17 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond_memwrite142 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_first_cleanup : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_index_019_push4_memwrite21 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i4_cleanups_push17_memwrite145 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_feedback_stall_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_out_17 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i4_initerations_push16_memwrite13 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_out_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_end_flag_011_push12_memwrite130 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_inner_loop_018_push5_memwrite136 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_5 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_lane_cnt_017_push6_memwrite109 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_loop_num_014_push9_memwrite61 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_9 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_start_flag_010_push13_memwrite128 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_width_015_push8_memwrite71 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_8 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_width_cnt_016_push7_memwrite107 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_7 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_bypass_sync_buffer_memwrite28 is
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


    component i_syncbuf_dim_z_edge_num_sync_buffer_memwrite36 is
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


    component i_syncbuf_next_layer_padding_sync_buffer5_memwrite121 is
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


    component i_syncbuf_next_layer_padding_sync_buffer_memwrite83 is
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


    component i_syncbuf_out_dim1_div_q_vec_sync_buffer_memwrite117 is
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


    component i_syncbuf_out_dim1_sync_buffer_memwrite94 is
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


    component i_syncbuf_out_dim1xdim2_sync_buffer_memwrite90 is
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


    component i_syncbuf_out_dim2_sync_buffer_memwrite112 is
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


    component i_syncbuf_out_num_sync_buffer1_memwrite32 is
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


    component i_syncbuf_out_num_sync_buffer_memwrite138 is
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


    component i_syncbuf_q_vec_sync_buffer2_memwrite98 is
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


    component i_syncbuf_q_vec_sync_buffer_memwrite67 is
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


    component i_syncbuf_rem_size_x_sync_buffer3_memwrite80 is
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


    component i_syncbuf_rem_size_x_sync_buffer_memwrite63 is
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


    component i_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite57 is
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


    component i_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite55 is
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


    component i_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite51 is
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


    component i_syncbuf_scal_sync_buffer_memwrite115 is
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


    component i_syncbuf_scalxq_vec_sync_buffer_memwrite43 is
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


    component i_syncbuf_scalxrem_size_x_sync_buffer_memwrite45 is
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


    component i_syncbuf_scalxstart_size_x_sync_buffer_memwrite59 is
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


    component i_syncbuf_start_size_x_sync_buffer4_memwrite86 is
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


    component i_syncbuf_start_size_x_sync_buffer_memwrite65 is
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


    component i_syncbuf_top_sync_buffer_memwrite102 is
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_acl_260_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_add134_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc158_memwrite_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_inc192_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bgTrunc_i_inc210_memwrite_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_inc4_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_lane_cnt_2_memwrite_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_mul135_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul138_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul142_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memwrite_42_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memwrite_45_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub152_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub162_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub171_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub187_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_memwrite_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_multconst_x_q : STD_LOGIC_VECTOR (57 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_cleanups_shl_memwrite_sel_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_conv132_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv133_pre_phi_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv136_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv136_memwrite_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv137_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv140_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv140_memwrite_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv141_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv144_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv151_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv161_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv170_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv176_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv186_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv194_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv199_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv5_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv63_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv64_rm_memwrite_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_idxprom148_memwrite_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_inc156_memwrite_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_inc182_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul135_memwrite_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul135_memwrite_multconst_x_q : STD_LOGIC_VECTOR (14 downto 0);
    signal i_mul138_memwrite_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul138_memwrite_multconst_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul142_memwrite_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul142_memwrite_multconst_x_q : STD_LOGIC_VECTOR (39 downto 0);
    signal i_next_cleanups_memwrite_memwrite144_shift_narrow_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_start_flag_1_memwrite_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i16_0gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i16_1gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i4_0gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i4_1gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i4_7gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i8_0gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_1gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_217_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_217_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_217_memwrite_vt_const_7_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_acl_217_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_217_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_218_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_218_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_218_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_218_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_219_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_219_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_219_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_219_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_221_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_221_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_222_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_222_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_223_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_223_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_224_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_224_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_225_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_225_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_241_demorgan_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_241_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_242_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_243_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_245_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_245_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_249_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_251_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_251_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_254_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_254_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_254_memwrite_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_254_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_255_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_255_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_257_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_257_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_258_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_258_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_260_memwrite_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_acl_260_memwrite_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_acl_260_memwrite_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_acl_260_memwrite_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_acl_261_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_261_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_262_xor_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_262_xor_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_263_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_263_xor_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_out_initeration_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_feedback_stall_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_x_dim_08_pop15_memwrite_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_x_dim_08_pop15_memwrite_out_feedback_stall_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_y_dim_012_pop11_memwrite_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_z_dim_013_pop10_memwrite_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_z_dim_013_pop10_memwrite_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_index_019_pop4_memwrite_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_index_019_pop4_memwrite_out_feedback_stall_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i4_cleanups_pop17_memwrite_out_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal i_acl_pop_i4_cleanups_pop17_memwrite_out_feedback_stall_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i4_initerations_pop16_memwrite_out_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal i_acl_pop_i4_initerations_pop16_memwrite_out_feedback_stall_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_end_flag_011_pop12_memwrite_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_end_flag_011_pop12_memwrite_out_feedback_stall_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_feedback_stall_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_lane_cnt_017_pop6_memwrite_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_lane_cnt_017_pop6_memwrite_out_feedback_stall_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_loop_num_014_pop9_memwrite_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_loop_num_014_pop9_memwrite_out_feedback_stall_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_start_flag_010_pop13_memwrite_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_start_flag_010_pop13_memwrite_out_feedback_stall_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_width_015_pop8_memwrite_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_width_015_pop8_memwrite_out_feedback_stall_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_feedback_stall_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_padding_tmp_09_push14_memwrite_out_feedback_out_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_padding_tmp_09_push14_memwrite_out_feedback_valid_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_x_dim_08_push15_memwrite_out_feedback_out_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_x_dim_08_push15_memwrite_out_feedback_valid_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_y_dim_012_push11_memwrite_out_feedback_out_11 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_y_dim_012_push11_memwrite_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_z_dim_013_push10_memwrite_out_feedback_out_10 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_z_dim_013_push10_memwrite_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_lastiniteration_memwrite_out_feedback_out_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_lastiniteration_memwrite_out_feedback_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond_memwrite_out_feedback_out_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond_memwrite_out_feedback_valid_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_index_019_push4_memwrite_out_feedback_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_index_019_push4_memwrite_out_feedback_valid_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i4_cleanups_push17_memwrite_out_feedback_out_17 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i4_cleanups_push17_memwrite_out_feedback_valid_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i4_initerations_push16_memwrite_out_feedback_out_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i4_initerations_push16_memwrite_out_feedback_valid_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_end_flag_011_push12_memwrite_out_feedback_out_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_end_flag_011_push12_memwrite_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_inner_loop_018_push5_memwrite_out_feedback_out_5 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_inner_loop_018_push5_memwrite_out_feedback_valid_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_lane_cnt_017_push6_memwrite_out_feedback_out_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_lane_cnt_017_push6_memwrite_out_feedback_valid_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_loop_num_014_push9_memwrite_out_feedback_out_9 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_loop_num_014_push9_memwrite_out_feedback_valid_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_start_flag_010_push13_memwrite_out_feedback_out_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_start_flag_010_push13_memwrite_out_feedback_valid_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_width_015_push8_memwrite_out_feedback_out_8 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_width_015_push8_memwrite_out_feedback_valid_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_width_cnt_016_push7_memwrite_out_feedback_out_7 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_width_cnt_016_push7_memwrite_out_feedback_valid_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add134_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add134_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add134_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add134_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add134_memwrite_vt_select_16_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_add177_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add177_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_add177_memwrite_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_add177_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_rm_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_rm_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_rm_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cleanups_shl_memwrite_vt_const_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_cleanups_shl_memwrite_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_cleanups_shl_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12_memwrite_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp12_memwrite_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp12_memwrite_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp12_memwrite_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp153_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp163_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp172_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp188_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp195_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp204_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp27_phi_decision269_or270_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp27_phi_decision269_or_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp27_rm_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp2_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp2_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp56_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp65_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp65_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp69_old_rm_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp6_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp80_memwrite_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp80_memwrite_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp80_memwrite_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp80_memwrite_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp9_not_rm_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp9_not_rm_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv132_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv132_memwrite_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv133_pre_phi_memwrite_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_conv133_pre_phi_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv133_pre_phi_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv136_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv136_memwrite_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv137_rm_memwrite_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv140_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv140_memwrite_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv141_rm_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv144_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv144_memwrite_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv151_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv151_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv161_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv161_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv170_rm_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv170_rm_memwrite_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv176_rm_memwrite_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv176_rm_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv186_rm_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv186_rm_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv194_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv194_memwrite_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv199_rm_memwrite_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv199_rm_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv5_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv5_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv63_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv63_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv64_rm_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv64_rm_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_first_cleanup_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_xor6_or_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_xor6_or_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_xor7_or_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_xor7_or_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_xor_or_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_xor_or_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_idxprom148_memwrite_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom148_memwrite_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc156_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_inc156_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc158_memwrite_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc158_memwrite_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc158_memwrite_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc158_memwrite_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc182_memwrite_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_inc182_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc182_y_dim_0_memwrite_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc182_y_dim_0_memwrite_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc182_y_dim_0_memwrite_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc182_y_dim_0_memwrite_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc192_memwrite_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc192_memwrite_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc192_memwrite_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc192_memwrite_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_inc210_memwrite_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc210_memwrite_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc210_memwrite_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc210_memwrite_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_inc4_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc4_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc4_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc4_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_lane_cnt_2_memwrite_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_lane_cnt_2_memwrite_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_lane_cnt_2_memwrite_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_lane_cnt_2_memwrite_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_last_initeration_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_masked_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_masked_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mul135_memwrite_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal i_mul135_memwrite_b0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul135_memwrite_s1 : STD_LOGIC_VECTOR (48 downto 0);
    signal i_mul135_memwrite_pr : UNSIGNED (48 downto 0);
    signal i_mul135_memwrite_q : STD_LOGIC_VECTOR (48 downto 0);
    signal i_mul142_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul142_memwrite_vt_select_23_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_next_initerations_memwrite_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_next_initerations_memwrite_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_not_cmp12_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_cmp69_old_rm_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond2_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notexit_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond27_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond27_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_pre_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_pre_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_pre_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_15_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_16_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_18_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_19_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_1_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_1_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_memwrite_21_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_22_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_23_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_25_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_26_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_27_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_28_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_29_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_29_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_2_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_2_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_memwrite_3_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_3_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_memwrite_42_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_42_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_42_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_42_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_42_memwrite_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_memwrite_42_memwrite_vt_select_16_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_reduction_memwrite_43_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_43_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_43_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_43_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_44_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_44_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_44_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_44_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_45_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_45_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_45_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_45_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memwrite_4_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_4_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_memwrite_5_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_5_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_memwrite_6_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_6_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_memwrite_6_memwrite_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_memwrite_6_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_memwrite_7_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_7_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_memwrite_8_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_8_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_memwrite_9_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_9_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_scalxrem_size_x_scalxq_vec_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_scalxrem_size_x_scalxq_vec_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_selcond_memwrite_10_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_11_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_12_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_12_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_25_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_26_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_6_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_6_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_7_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_8_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_memwrite_9_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_start_flag_1_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_start_flag_1_memwrite_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sub152_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub152_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub152_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub152_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub162_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub162_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub162_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub162_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub171_rm_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub171_rm_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub171_rm_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub171_rm_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub187_rm_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub187_rm_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub187_rm_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub187_rm_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_rm_memwrite_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_rm_memwrite_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_rm_memwrite_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_rm_memwrite_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_bypass_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_dim_z_edge_num_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_next_layer_padding_sync_buffer5_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_next_layer_padding_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_out_dim1_div_q_vec_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_out_dim1_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_out_dim1xdim2_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_out_dim2_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_out_num_sync_buffer1_memwrite_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_out_num_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_q_vec_sync_buffer2_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_q_vec_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_rem_size_x_sync_buffer3_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_rem_size_x_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_scal_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_scalxq_vec_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_scalxrem_size_x_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_scalxstart_size_x_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_start_size_x_sync_buffer4_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_start_size_x_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_top_sync_buffer_memwrite_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_tobool32_pre_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool32_pre_not_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool38_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool50266_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool50_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool50_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool58_memwrite_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool58_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memwrite141_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memwrite15_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_memwrite15_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memwrite30_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memwrite41_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memwrite41_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memwrite41_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memwrite47_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memwrite48_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memwrite48_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_memwrite48_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memwrite49_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memwrite6_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_memwrite6_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_memwrite6_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_width_cnt_2_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_width_cnt_2_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_x_dim_1_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_x_dim_1_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_xor_memwrite_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_align_12_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_align_12_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_join_13_q : STD_LOGIC_VECTOR (53 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_align_14_q : STD_LOGIC_VECTOR (37 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_align_14_qint : STD_LOGIC_VECTOR (37 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_align_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_align_15_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_join_16_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (70 downto 0);
    signal leftShiftStage0Idx1Rng1_uid551_i_next_cleanups_memwrite_memwrite144_shift_x_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx1Rng1_uid551_i_next_cleanups_memwrite_memwrite144_shift_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx1_uid552_i_next_cleanups_memwrite_memwrite144_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStageSel0Dto0_uid553_i_next_cleanups_memwrite_memwrite144_shift_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStageSel0Dto0_uid553_i_next_cleanups_memwrite_memwrite144_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng1_uid559_i_next_initerations_memwrite_memwrite12_shift_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx1_uid561_i_next_initerations_memwrite_memwrite12_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_memwrite15_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memwrite15_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal i_mul138_memwrite_cma_reset : std_logic;
    type i_mul138_memwrite_cma_a0type is array(NATURAL range <>) of UNSIGNED(15 downto 0);
    signal i_mul138_memwrite_cma_a0 : i_mul138_memwrite_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul138_memwrite_cma_a0 : signal is true;
    signal i_mul138_memwrite_cma_c0 : i_mul138_memwrite_cma_a0type(0 to 0);
    attribute preserve of i_mul138_memwrite_cma_c0 : signal is true;
    type i_mul138_memwrite_cma_ptype is array(NATURAL range <>) of UNSIGNED(31 downto 0);
    signal i_mul138_memwrite_cma_p : i_mul138_memwrite_cma_ptype(0 to 0);
    signal i_mul138_memwrite_cma_u : i_mul138_memwrite_cma_ptype(0 to 0);
    signal i_mul138_memwrite_cma_w : i_mul138_memwrite_cma_ptype(0 to 0);
    signal i_mul138_memwrite_cma_x : i_mul138_memwrite_cma_ptype(0 to 0);
    signal i_mul138_memwrite_cma_y : i_mul138_memwrite_cma_ptype(0 to 0);
    signal i_mul138_memwrite_cma_s : i_mul138_memwrite_cma_ptype(0 to 0);
    signal i_mul138_memwrite_cma_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul138_memwrite_cma_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul138_memwrite_cma_ena0 : std_logic;
    signal i_mul138_memwrite_cma_ena1 : std_logic;
    signal i_mul142_memwrite_cma_reset : std_logic;
    signal i_mul142_memwrite_cma_a0 : i_mul138_memwrite_cma_a0type(0 to 0);
    attribute preserve of i_mul142_memwrite_cma_a0 : signal is true;
    type i_mul142_memwrite_cma_c0type is array(NATURAL range <>) of UNSIGNED(9 downto 0);
    signal i_mul142_memwrite_cma_c0 : i_mul142_memwrite_cma_c0type(0 to 0);
    attribute preserve of i_mul142_memwrite_cma_c0 : signal is true;
    type i_mul142_memwrite_cma_ptype is array(NATURAL range <>) of UNSIGNED(25 downto 0);
    signal i_mul142_memwrite_cma_p : i_mul142_memwrite_cma_ptype(0 to 0);
    signal i_mul142_memwrite_cma_u : i_mul142_memwrite_cma_ptype(0 to 0);
    signal i_mul142_memwrite_cma_w : i_mul142_memwrite_cma_ptype(0 to 0);
    signal i_mul142_memwrite_cma_x : i_mul142_memwrite_cma_ptype(0 to 0);
    signal i_mul142_memwrite_cma_y : i_mul142_memwrite_cma_ptype(0 to 0);
    signal i_mul142_memwrite_cma_s : i_mul142_memwrite_cma_ptype(0 to 0);
    signal i_mul142_memwrite_cma_qq : STD_LOGIC_VECTOR (25 downto 0);
    signal i_mul142_memwrite_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_mul142_memwrite_cma_ena0 : std_logic;
    signal i_mul142_memwrite_cma_ena1 : std_logic;
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_tobool58_memwrite_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_tobool50_memwrite_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_tobool38_memwrite_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_selcond_memwrite_9_memwrite_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_reduction_memwrite_4_memwrite_q_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_i_reduction_memwrite_4_memwrite_q_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_i_reduction_memwrite_42_memwrite_vt_select_16_b_2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist7_i_reduction_memwrite_29_memwrite_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_reduction_memwrite_29_memwrite_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_masked_memwrite_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_inc182_memwrite_vt_select_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_idxprom148_memwrite_vt_select_31_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_first_cleanup_xor_or_memwrite_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_first_cleanup_xor7_or_memwrite_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_first_cleanup_xor6_or_memwrite_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_cmp9_not_rm_memwrite_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_cmp6_memwrite_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_cmp2_memwrite_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_cmp195_memwrite_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_cmp163_memwrite_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist21_i_acl_pop_i32_index_019_pop4_memwrite_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist23_i_acl_pipeline_keep_going_memwrite_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_i_acl_pipeline_keep_going_memwrite_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_acl_pipeline_keep_going_memwrite_out_data_out_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_i_acl_251_memwrite_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_i_acl_245_memwrite_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_i_acl_219_memwrite_vt_select_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_sync_in_aunroll_x_in_c0_eni1_1_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_sync_in_aunroll_x_in_c0_eni1_1_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_sync_in_aunroll_x_in_i_valid_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_i_conv140_memwrite_vt_join_narrowed_x_b_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist41_i_conv136_memwrite_vt_join_narrowed_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist42_i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist43_bgTrunc_i_sub187_rm_memwrite_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist44_bgTrunc_i_sub152_memwrite_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist34_sync_in_aunroll_x_in_i_valid_1(DELAY,650)
    redist34_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist34_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist35_sync_in_aunroll_x_in_i_valid_2(DELAY,651)
    redist35_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist34_sync_in_aunroll_x_in_i_valid_1_q, xout => redist35_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist36_sync_in_aunroll_x_in_i_valid_3(DELAY,652)
    redist36_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist35_sync_in_aunroll_x_in_i_valid_2_q, xout => redist36_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist37_sync_in_aunroll_x_in_i_valid_4(DELAY,653)
    redist37_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist36_sync_in_aunroll_x_in_i_valid_3_q, xout => redist37_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist38_sync_in_aunroll_x_in_i_valid_5(DELAY,654)
    redist38_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist37_sync_in_aunroll_x_in_i_valid_4_q, xout => redist38_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- redist39_sync_in_aunroll_x_in_i_valid_9(DELAY,655)
    redist39_sync_in_aunroll_x_in_i_valid_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist38_sync_in_aunroll_x_in_i_valid_5_q, xout => redist39_sync_in_aunroll_x_in_i_valid_9_q, clk => clock, aclr => resetn );

    -- c_i4_0gr(CONSTANT,154)
    c_i4_0gr_q <= "0000";

    -- i_cleanups_shl_memwrite_vt_const_3(CONSTANT,245)
    i_cleanups_shl_memwrite_vt_const_3_q <= "000";

    -- c_i4_1gr(CONSTANT,155)
    c_i4_1gr_q <= "0001";

    -- i_notexit_memwrite(LOGICAL,370)@4
    i_notexit_memwrite_q <= i_unnamed_memwrite141_q xor VCC_q;

    -- i_acl_push_i1_notexitcond_memwrite(BLACKBOX,221)@4
    -- out out_feedback_out_2@20000000
    -- out out_feedback_valid_out_2@20000000
    thei_acl_push_i1_notexitcond_memwrite : i_acl_push_i1_notexitcond_memwrite142
    PORT MAP (
        in_data_in => i_notexit_memwrite_q,
        in_feedback_stall_in_2 => i_acl_pipeline_keep_going_memwrite_out_not_exitcond_stall_out,
        in_first_cleanup => i_first_cleanup_memwrite_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_2 => i_acl_push_i1_notexitcond_memwrite_out_feedback_out_2,
        out_feedback_valid_out_2 => i_acl_push_i1_notexitcond_memwrite_out_feedback_valid_out_2,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0Idx1Rng1_uid559_i_next_initerations_memwrite_memwrite12_shift_x(BITSELECT,558)@1
    rightShiftStage0Idx1Rng1_uid559_i_next_initerations_memwrite_memwrite12_shift_x_b <= i_acl_pop_i4_initerations_pop16_memwrite_out_data_out(3 downto 1);

    -- rightShiftStage0Idx1_uid561_i_next_initerations_memwrite_memwrite12_shift_x(BITJOIN,560)@1
    rightShiftStage0Idx1_uid561_i_next_initerations_memwrite_memwrite12_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid559_i_next_initerations_memwrite_memwrite12_shift_x_b;

    -- i_acl_push_i4_initerations_push16_memwrite(BLACKBOX,224)@1
    -- out out_feedback_out_16@20000000
    -- out out_feedback_valid_out_16@20000000
    thei_acl_push_i4_initerations_push16_memwrite : i_acl_push_i4_initerations_push16_memwrite13
    PORT MAP (
        in_data_in => i_next_initerations_memwrite_vt_join_q,
        in_feedback_stall_in_16 => i_acl_pop_i4_initerations_pop16_memwrite_out_feedback_stall_out_16,
        in_keep_going => i_acl_pipeline_keep_going_memwrite_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_16 => i_acl_push_i4_initerations_push16_memwrite_out_feedback_out_16,
        out_feedback_valid_out_16 => i_acl_push_i4_initerations_push16_memwrite_out_feedback_valid_out_16,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i4_initerations_pop16_memwrite(BLACKBOX,208)@1
    -- out out_feedback_stall_out_16@20000000
    thei_acl_pop_i4_initerations_pop16_memwrite : i_acl_pop_i4_initerations_pop16_memwrite10
    PORT MAP (
        in_data_in => c_i4_7gr_q,
        in_dir => in_c0_eni1_1,
        in_feedback_in_16 => i_acl_push_i4_initerations_push16_memwrite_out_feedback_out_16,
        in_feedback_valid_in_16 => i_acl_push_i4_initerations_push16_memwrite_out_feedback_valid_out_16,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i4_initerations_pop16_memwrite_out_data_out,
        out_feedback_stall_out_16 => i_acl_pop_i4_initerations_pop16_memwrite_out_feedback_stall_out_16,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x(MUX,562)@1
    rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_s <= VCC_q;
    rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_combproc: PROCESS (rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_s, i_acl_pop_i4_initerations_pop16_memwrite_out_data_out, rightShiftStage0Idx1_uid561_i_next_initerations_memwrite_memwrite12_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_q <= i_acl_pop_i4_initerations_pop16_memwrite_out_data_out;
            WHEN "1" => rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_q <= rightShiftStage0Idx1_uid561_i_next_initerations_memwrite_memwrite12_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_next_initerations_memwrite_vt_select_2(BITSELECT,365)@1
    i_next_initerations_memwrite_vt_select_2_b <= rightShiftStage0_uid563_i_next_initerations_memwrite_memwrite12_shift_x_q(2 downto 0);

    -- i_next_initerations_memwrite_vt_join(BITJOIN,364)@1
    i_next_initerations_memwrite_vt_join_q <= GND_q & i_next_initerations_memwrite_vt_select_2_b;

    -- i_unnamed_memwrite15_BitSelect_for_a(BITSELECT,607)@1
    i_unnamed_memwrite15_BitSelect_for_a_b <= i_next_initerations_memwrite_vt_join_q(0 downto 0);

    -- i_unnamed_memwrite15_join(BITJOIN,608)@1
    i_unnamed_memwrite15_join_q <= GND_q & GND_q & GND_q & i_unnamed_memwrite15_BitSelect_for_a_b;

    -- i_unnamed_memwrite15_vt_select_0(BITSELECT,465)@1
    i_unnamed_memwrite15_vt_select_0_b <= i_unnamed_memwrite15_join_q(0 downto 0);

    -- i_unnamed_memwrite15_vt_join(BITJOIN,464)@1
    i_unnamed_memwrite15_vt_join_q <= i_cleanups_shl_memwrite_vt_const_3_q & i_unnamed_memwrite15_vt_select_0_b;

    -- i_last_initeration_memwrite(LOGICAL,355)@1
    i_last_initeration_memwrite_q <= "1" WHEN i_unnamed_memwrite15_vt_join_q /= c_i4_0gr_q ELSE "0";

    -- i_acl_push_i1_lastiniteration_memwrite(BLACKBOX,220)@1
    -- out out_feedback_out_1@20000000
    -- out out_feedback_valid_out_1@20000000
    thei_acl_push_i1_lastiniteration_memwrite : i_acl_push_i1_lastiniteration_memwrite17
    PORT MAP (
        in_data_in => i_last_initeration_memwrite_q,
        in_feedback_stall_in_1 => i_acl_pipeline_keep_going_memwrite_out_initeration_stall_out,
        in_keep_going => i_acl_pipeline_keep_going_memwrite_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_1 => i_acl_push_i1_lastiniteration_memwrite_out_feedback_out_1,
        out_feedback_valid_out_1 => i_acl_push_i1_lastiniteration_memwrite_out_feedback_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_memwrite(BLACKBOX,201)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going_memwrite : i_acl_pipeline_keep_going_memwrite8
    PORT MAP (
        in_data_in => in_c0_eni1_1,
        in_initeration_in => i_acl_push_i1_lastiniteration_memwrite_out_feedback_out_1,
        in_initeration_valid_in => i_acl_push_i1_lastiniteration_memwrite_out_feedback_valid_out_1,
        in_not_exitcond_in => i_acl_push_i1_notexitcond_memwrite_out_feedback_out_2,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond_memwrite_out_feedback_valid_out_2,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pipeline_keep_going_memwrite_out_data_out,
        out_exiting_stall_out => i_acl_pipeline_keep_going_memwrite_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going_memwrite_out_exiting_valid_out,
        out_initeration_stall_out => i_acl_pipeline_keep_going_memwrite_out_initeration_stall_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going_memwrite_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going_memwrite_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- redist23_i_acl_pipeline_keep_going_memwrite_out_data_out_1(DELAY,639)
    redist23_i_acl_pipeline_keep_going_memwrite_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pipeline_keep_going_memwrite_out_data_out, xout => redist23_i_acl_pipeline_keep_going_memwrite_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2(DELAY,640)
    redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist23_i_acl_pipeline_keep_going_memwrite_out_data_out_1_q, xout => redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist25_i_acl_pipeline_keep_going_memwrite_out_data_out_3(DELAY,641)
    redist25_i_acl_pipeline_keep_going_memwrite_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q, xout => redist25_i_acl_pipeline_keep_going_memwrite_out_data_out_3_q, clk => clock, aclr => resetn );

    -- leftShiftStage0Idx1Rng1_uid551_i_next_cleanups_memwrite_memwrite144_shift_x(BITSELECT,550)@4
    leftShiftStage0Idx1Rng1_uid551_i_next_cleanups_memwrite_memwrite144_shift_x_in <= i_acl_pop_i4_cleanups_pop17_memwrite_out_data_out(2 downto 0);
    leftShiftStage0Idx1Rng1_uid551_i_next_cleanups_memwrite_memwrite144_shift_x_b <= leftShiftStage0Idx1Rng1_uid551_i_next_cleanups_memwrite_memwrite144_shift_x_in(2 downto 0);

    -- leftShiftStage0Idx1_uid552_i_next_cleanups_memwrite_memwrite144_shift_x(BITJOIN,551)@4
    leftShiftStage0Idx1_uid552_i_next_cleanups_memwrite_memwrite144_shift_x_q <= leftShiftStage0Idx1Rng1_uid551_i_next_cleanups_memwrite_memwrite144_shift_x_b & GND_q;

    -- i_xor_memwrite(LOGICAL,483)@4
    i_xor_memwrite_q <= i_first_cleanup_memwrite_q xor VCC_q;

    -- i_or_memwrite(LOGICAL,375)@4
    i_or_memwrite_q <= i_unnamed_memwrite141_q or i_xor_memwrite_q;

    -- i_cleanups_shl_memwrite_sel_x(BITSELECT,88)@4
    i_cleanups_shl_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_or_memwrite_q(0 downto 0)), 4));

    -- i_cleanups_shl_memwrite_vt_select_0(BITSELECT,247)@4
    i_cleanups_shl_memwrite_vt_select_0_b <= i_cleanups_shl_memwrite_sel_x_b(0 downto 0);

    -- i_cleanups_shl_memwrite_vt_join(BITJOIN,246)@4
    i_cleanups_shl_memwrite_vt_join_q <= i_cleanups_shl_memwrite_vt_const_3_q & i_cleanups_shl_memwrite_vt_select_0_b;

    -- i_next_cleanups_memwrite_memwrite144_shift_narrow_x(BITSELECT,120)@4
    i_next_cleanups_memwrite_memwrite144_shift_narrow_x_b <= i_cleanups_shl_memwrite_vt_join_q(1 downto 0);

    -- leftShiftStageSel0Dto0_uid553_i_next_cleanups_memwrite_memwrite144_shift_x(BITSELECT,552)@4
    leftShiftStageSel0Dto0_uid553_i_next_cleanups_memwrite_memwrite144_shift_x_in <= i_next_cleanups_memwrite_memwrite144_shift_narrow_x_b(0 downto 0);
    leftShiftStageSel0Dto0_uid553_i_next_cleanups_memwrite_memwrite144_shift_x_b <= leftShiftStageSel0Dto0_uid553_i_next_cleanups_memwrite_memwrite144_shift_x_in(0 downto 0);

    -- leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x(MUX,553)@4
    leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_s <= leftShiftStageSel0Dto0_uid553_i_next_cleanups_memwrite_memwrite144_shift_x_b;
    leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_combproc: PROCESS (leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_s, i_acl_pop_i4_cleanups_pop17_memwrite_out_data_out, leftShiftStage0Idx1_uid552_i_next_cleanups_memwrite_memwrite144_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_q <= i_acl_pop_i4_cleanups_pop17_memwrite_out_data_out;
            WHEN "1" => leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_q <= leftShiftStage0Idx1_uid552_i_next_cleanups_memwrite_memwrite144_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i4_cleanups_push17_memwrite(BLACKBOX,223)@4
    -- out out_feedback_out_17@20000000
    -- out out_feedback_valid_out_17@20000000
    thei_acl_push_i4_cleanups_push17_memwrite : i_acl_push_i4_cleanups_push17_memwrite145
    PORT MAP (
        in_data_in => leftShiftStage0_uid554_i_next_cleanups_memwrite_memwrite144_shift_x_q,
        in_feedback_stall_in_17 => i_acl_pop_i4_cleanups_pop17_memwrite_out_feedback_stall_out_17,
        in_keep_going => redist25_i_acl_pipeline_keep_going_memwrite_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_17 => i_acl_push_i4_cleanups_push17_memwrite_out_feedback_out_17,
        out_feedback_valid_out_17 => i_acl_push_i4_cleanups_push17_memwrite_out_feedback_valid_out_17,
        clock => clock,
        resetn => resetn
    );

    -- redist31_sync_in_aunroll_x_in_c0_eni1_1_2(DELAY,647)
    redist31_sync_in_aunroll_x_in_c0_eni1_1_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni1_1, xout => redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q, clk => clock, aclr => resetn );

    -- redist32_sync_in_aunroll_x_in_c0_eni1_1_3(DELAY,648)
    redist32_sync_in_aunroll_x_in_c0_eni1_1_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q, xout => redist32_sync_in_aunroll_x_in_c0_eni1_1_3_q, clk => clock, aclr => resetn );

    -- c_i4_7gr(CONSTANT,156)
    c_i4_7gr_q <= "0111";

    -- i_acl_pop_i4_cleanups_pop17_memwrite(BLACKBOX,207)@4
    -- out out_feedback_stall_out_17@20000000
    thei_acl_pop_i4_cleanups_pop17_memwrite : i_acl_pop_i4_cleanups_pop17_memwrite4
    PORT MAP (
        in_data_in => c_i4_7gr_q,
        in_dir => redist32_sync_in_aunroll_x_in_c0_eni1_1_3_q,
        in_feedback_in_17 => i_acl_push_i4_cleanups_push17_memwrite_out_feedback_out_17,
        in_feedback_valid_in_17 => i_acl_push_i4_cleanups_push17_memwrite_out_feedback_valid_out_17,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i4_cleanups_pop17_memwrite_out_data_out,
        out_feedback_stall_out_17 => i_acl_pop_i4_cleanups_pop17_memwrite_out_feedback_stall_out_17,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_memwrite6(LOGICAL,477)@4
    i_unnamed_memwrite6_q <= i_acl_pop_i4_cleanups_pop17_memwrite_out_data_out and c_i4_1gr_q;

    -- i_unnamed_memwrite6_vt_select_0(BITSELECT,480)@4
    i_unnamed_memwrite6_vt_select_0_b <= i_unnamed_memwrite6_q(0 downto 0);

    -- i_unnamed_memwrite6_vt_join(BITJOIN,479)@4
    i_unnamed_memwrite6_vt_join_q <= i_cleanups_shl_memwrite_vt_const_3_q & i_unnamed_memwrite6_vt_select_0_b;

    -- i_first_cleanup_memwrite(LOGICAL,333)@4
    i_first_cleanup_memwrite_q <= "1" WHEN i_unnamed_memwrite6_vt_join_q /= c_i4_0gr_q ELSE "0";

    -- i_syncbuf_out_num_sync_buffer_memwrite(BLACKBOX,439)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_out_num_sync_buffer_memwrite : i_syncbuf_out_num_sync_buffer_memwrite138
    PORT MAP (
        in_buffer_in => in_out_num,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_out_num_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,153)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_acl_push_i32_index_019_push4_memwrite(BLACKBOX,222)@2
    -- out out_feedback_out_4@20000000
    -- out out_feedback_valid_out_4@20000000
    thei_acl_push_i32_index_019_push4_memwrite : i_acl_push_i32_index_019_push4_memwrite21
    PORT MAP (
        in_data_in => bgTrunc_i_inc4_memwrite_sel_x_b,
        in_feedback_stall_in_4 => i_acl_pop_i32_index_019_pop4_memwrite_out_feedback_stall_out_4,
        in_keep_going => redist23_i_acl_pipeline_keep_going_memwrite_out_data_out_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_4 => i_acl_push_i32_index_019_push4_memwrite_out_feedback_out_4,
        out_feedback_valid_out_4 => i_acl_push_i32_index_019_push4_memwrite_out_feedback_valid_out_4,
        clock => clock,
        resetn => resetn
    );

    -- i_mul138_memwrite_multconst_x(CONSTANT,114)
    i_mul138_memwrite_multconst_x_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_index_019_pop4_memwrite(BLACKBOX,206)@1
    -- out out_feedback_stall_out_4@20000000
    thei_acl_pop_i32_index_019_pop4_memwrite : i_acl_pop_i32_index_019_pop4_memwrite19
    PORT MAP (
        in_data_in => i_mul138_memwrite_multconst_x_q,
        in_dir => in_c0_eni1_1,
        in_feedback_in_4 => i_acl_push_i32_index_019_push4_memwrite_out_feedback_out_4,
        in_feedback_valid_in_4 => i_acl_push_i32_index_019_push4_memwrite_out_feedback_valid_out_4,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_index_019_pop4_memwrite_out_data_out,
        out_feedback_stall_out_4 => i_acl_pop_i32_index_019_pop4_memwrite_out_feedback_stall_out_4,
        clock => clock,
        resetn => resetn
    );

    -- redist21_i_acl_pop_i32_index_019_pop4_memwrite_out_data_out_1(DELAY,637)
    redist21_i_acl_pop_i32_index_019_pop4_memwrite_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_index_019_pop4_memwrite_out_data_out, xout => redist21_i_acl_pop_i32_index_019_pop4_memwrite_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_inc4_memwrite(ADD,353)@2
    i_inc4_memwrite_a <= STD_LOGIC_VECTOR("0" & redist21_i_acl_pop_i32_index_019_pop4_memwrite_out_data_out_1_q);
    i_inc4_memwrite_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc4_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc4_memwrite_a) + UNSIGNED(i_inc4_memwrite_b));
    i_inc4_memwrite_q <= i_inc4_memwrite_o(32 downto 0);

    -- bgTrunc_i_inc4_memwrite_sel_x(BITSELECT,8)@2
    bgTrunc_i_inc4_memwrite_sel_x_b <= i_inc4_memwrite_q(31 downto 0);

    -- i_cmp2_memwrite(LOGICAL,258)@2 + 1
    i_cmp2_memwrite_qi <= "1" WHEN bgTrunc_i_inc4_memwrite_sel_x_b = i_syncbuf_out_num_sync_buffer_memwrite_out_buffer_out ELSE "0";
    i_cmp2_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp2_memwrite_qi, xout => i_cmp2_memwrite_q, clk => clock, aclr => resetn );

    -- redist17_i_cmp2_memwrite_q_2(DELAY,633)
    redist17_i_cmp2_memwrite_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp2_memwrite_q, xout => redist17_i_cmp2_memwrite_q_2_q, clk => clock, aclr => resetn );

    -- i_syncbuf_out_num_sync_buffer1_memwrite(BLACKBOX,438)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_out_num_sync_buffer1_memwrite : i_syncbuf_out_num_sync_buffer1_memwrite32
    PORT MAP (
        in_buffer_in => in_out_num,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_out_num_sync_buffer1_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp27_rm_memwrite(LOGICAL,257)@4
    i_cmp27_rm_memwrite_q <= "1" WHEN i_syncbuf_out_num_sync_buffer1_memwrite_out_buffer_out = i_mul138_memwrite_multconst_x_q ELSE "0";

    -- i_unnamed_memwrite141(LOGICAL,461)@4
    i_unnamed_memwrite141_q <= i_cmp27_rm_memwrite_q or redist17_i_cmp2_memwrite_q_2_q;

    -- i_masked_memwrite(LOGICAL,356)@4 + 1
    i_masked_memwrite_qi <= i_unnamed_memwrite141_q and i_first_cleanup_memwrite_q;
    i_masked_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_masked_memwrite_qi, xout => i_masked_memwrite_q, clk => clock, aclr => resetn );

    -- redist9_i_masked_memwrite_q_6(DELAY,625)
    redist9_i_masked_memwrite_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_masked_memwrite_q, xout => redist9_i_masked_memwrite_q_6_q, clk => clock, aclr => resetn );

    -- i_first_cleanup_xor7_or_memwrite(LOGICAL,335)@4 + 1
    i_first_cleanup_xor7_or_memwrite_qi <= i_cmp27_rm_memwrite_q or i_xor_memwrite_q;
    i_first_cleanup_xor7_or_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_xor7_or_memwrite_qi, xout => i_first_cleanup_xor7_or_memwrite_q, clk => clock, aclr => resetn );

    -- redist13_i_first_cleanup_xor7_or_memwrite_q_6(DELAY,629)
    redist13_i_first_cleanup_xor7_or_memwrite_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_xor7_or_memwrite_q, xout => redist13_i_first_cleanup_xor7_or_memwrite_q_6_q, clk => clock, aclr => resetn );

    -- i_arrayidx149_0_memwrite_memwrite104_mult_multconst_x(CONSTANT,82)
    i_arrayidx149_0_memwrite_memwrite104_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000";

    -- i_mul135_memwrite_multconst_x(CONSTANT,112)
    i_mul135_memwrite_multconst_x_q <= "000000000000000";

    -- i_conv133_pre_phi_memwrite_vt_const_31(CONSTANT,270)
    i_conv133_pre_phi_memwrite_vt_const_31_q <= "000000000000000000000000";

    -- c_i8_0gr(CONSTANT,157)
    c_i8_0gr_q <= "00000000";

    -- redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4(DELAY,642)
    redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist25_i_acl_pipeline_keep_going_memwrite_out_data_out_3_q, xout => redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q, clk => clock, aclr => resetn );

    -- c_i8_1gr(CONSTANT,158)
    c_i8_1gr_q <= "00000001";

    -- i_inc158_memwrite(ADD,345)@5
    i_inc158_memwrite_a <= STD_LOGIC_VECTOR("0" & i_reduction_memwrite_4_memwrite_q);
    i_inc158_memwrite_b <= STD_LOGIC_VECTOR("0" & c_i8_1gr_q);
    i_inc158_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc158_memwrite_a) + UNSIGNED(i_inc158_memwrite_b));
    i_inc158_memwrite_q <= i_inc158_memwrite_o(8 downto 0);

    -- bgTrunc_i_inc158_memwrite_sel_x(BITSELECT,4)@5
    bgTrunc_i_inc158_memwrite_sel_x_b <= i_inc158_memwrite_q(7 downto 0);

    -- dupName_0_c_i32_1gr_x(CONSTANT,23)
    dupName_0_c_i32_1gr_x_q <= "11111111111111111111111111111111";

    -- i_syncbuf_rem_size_x_sync_buffer_memwrite(BLACKBOX,443)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_rem_size_x_sync_buffer_memwrite : i_syncbuf_rem_size_x_sync_buffer_memwrite63
    PORT MAP (
        in_buffer_in => in_rem_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_rem_size_x_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_start_size_x_sync_buffer_memwrite(BLACKBOX,452)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_start_size_x_sync_buffer_memwrite : i_syncbuf_start_size_x_sync_buffer_memwrite65
    PORT MAP (
        in_buffer_in => in_start_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_start_size_x_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_dim_z_edge_num_sync_buffer_memwrite(BLACKBOX,431)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_dim_z_edge_num_sync_buffer_memwrite : i_syncbuf_dim_z_edge_num_sync_buffer_memwrite36
    PORT MAP (
        in_buffer_in => in_dim_z_edge_num,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_dim_z_edge_num_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp12_memwrite(COMPARE,248)@2 + 1
    i_cmp12_memwrite_a <= STD_LOGIC_VECTOR("00" & bgTrunc_i_inc4_memwrite_sel_x_b);
    i_cmp12_memwrite_b <= STD_LOGIC_VECTOR("00" & i_syncbuf_dim_z_edge_num_sync_buffer_memwrite_out_buffer_out);
    i_cmp12_memwrite_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp12_memwrite_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp12_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp12_memwrite_a) - UNSIGNED(i_cmp12_memwrite_b));
        END IF;
    END PROCESS;
    i_cmp12_memwrite_c(0) <= i_cmp12_memwrite_o(33);

    -- i_inc210_memwrite(ADD,352)@3
    i_inc210_memwrite_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_data_out);
    i_inc210_memwrite_b <= STD_LOGIC_VECTOR("0" & c_i8_1gr_q);
    i_inc210_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc210_memwrite_a) + UNSIGNED(i_inc210_memwrite_b));
    i_inc210_memwrite_q <= i_inc210_memwrite_o(8 downto 0);

    -- bgTrunc_i_inc210_memwrite_sel_x(BITSELECT,7)@3
    bgTrunc_i_inc210_memwrite_sel_x_b <= i_inc210_memwrite_q(7 downto 0);

    -- i_syncbuf_scalxrem_size_x_sync_buffer_memwrite(BLACKBOX,449)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_scalxrem_size_x_sync_buffer_memwrite : i_syncbuf_scalxrem_size_x_sync_buffer_memwrite45
    PORT MAP (
        in_buffer_in => in_scalxrem_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_scalxrem_size_x_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_scalxq_vec_sync_buffer_memwrite(BLACKBOX,448)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_scalxq_vec_sync_buffer_memwrite : i_syncbuf_scalxq_vec_sync_buffer_memwrite43
    PORT MAP (
        in_buffer_in => in_scalxq_vec,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_scalxq_vec_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_217_memwrite_vt_const_7(CONSTANT,162)
    i_acl_217_memwrite_vt_const_7_q <= "0000000";

    -- i_syncbuf_out_dim1_div_q_vec_sync_buffer_memwrite(BLACKBOX,434)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_out_dim1_div_q_vec_sync_buffer_memwrite : i_syncbuf_out_dim1_div_q_vec_sync_buffer_memwrite117
    PORT MAP (
        in_buffer_in => in_out_dim1_div_q_vec,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist34_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_out_dim1_div_q_vec_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv186_rm_memwrite_sel_x(BITSELECT,102)@2
    i_conv186_rm_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_out_dim1_div_q_vec_sync_buffer_memwrite_out_buffer_out(7 downto 0)), 32));

    -- i_conv186_rm_memwrite_vt_select_7(BITSELECT,312)@2
    i_conv186_rm_memwrite_vt_select_7_b <= i_conv186_rm_memwrite_sel_x_b(7 downto 0);

    -- i_conv186_rm_memwrite_vt_join(BITJOIN,311)@2
    i_conv186_rm_memwrite_vt_join_q <= i_conv133_pre_phi_memwrite_vt_const_31_q & i_conv186_rm_memwrite_vt_select_7_b;

    -- i_sub187_rm_memwrite(ADD,428)@2
    i_sub187_rm_memwrite_a <= STD_LOGIC_VECTOR("0" & i_conv186_rm_memwrite_vt_join_q);
    i_sub187_rm_memwrite_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub187_rm_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub187_rm_memwrite_a) + UNSIGNED(i_sub187_rm_memwrite_b));
    i_sub187_rm_memwrite_q <= i_sub187_rm_memwrite_o(32 downto 0);

    -- bgTrunc_i_sub187_rm_memwrite_sel_x(BITSELECT,20)@2
    bgTrunc_i_sub187_rm_memwrite_sel_x_b <= i_sub187_rm_memwrite_q(31 downto 0);

    -- redist43_bgTrunc_i_sub187_rm_memwrite_sel_x_b_1(DELAY,659)
    redist43_bgTrunc_i_sub187_rm_memwrite_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub187_rm_memwrite_sel_x_b, xout => redist43_bgTrunc_i_sub187_rm_memwrite_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- c_i16_0gr(CONSTANT,148)
    c_i16_0gr_q <= "0000000000000000";

    -- c_i16_1gr(CONSTANT,149)
    c_i16_1gr_q <= "0000000000000001";

    -- i_acl_255_memwrite(MUX,189)@3
    i_acl_255_memwrite_s <= i_cmp163_memwrite_q;
    i_acl_255_memwrite_combproc: PROCESS (i_acl_255_memwrite_s, i_acl_pop_i16_x_dim_08_pop15_memwrite_out_data_out, i_x_dim_1_memwrite_q)
    BEGIN
        CASE (i_acl_255_memwrite_s) IS
            WHEN "0" => i_acl_255_memwrite_q <= i_acl_pop_i16_x_dim_08_pop15_memwrite_out_data_out;
            WHEN "1" => i_acl_255_memwrite_q <= i_x_dim_1_memwrite_q;
            WHEN OTHERS => i_acl_255_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_x_dim_08_push15_memwrite(BLACKBOX,217)@3
    -- out out_feedback_out_15@20000000
    -- out out_feedback_valid_out_15@20000000
    thei_acl_push_i16_x_dim_08_push15_memwrite : i_acl_push_i16_x_dim_08_push15_memwrite124
    PORT MAP (
        in_data_in => i_acl_255_memwrite_q,
        in_feedback_stall_in_15 => i_acl_pop_i16_x_dim_08_pop15_memwrite_out_feedback_stall_out_15,
        in_keep_going => redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_15 => i_acl_push_i16_x_dim_08_push15_memwrite_out_feedback_out_15,
        out_feedback_valid_out_15 => i_acl_push_i16_x_dim_08_push15_memwrite_out_feedback_valid_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_x_dim_08_pop15_memwrite(BLACKBOX,203)@3
    -- out out_feedback_stall_out_15@20000000
    thei_acl_pop_i16_x_dim_08_pop15_memwrite : i_acl_pop_i16_x_dim_08_pop15_memwrite96
    PORT MAP (
        in_data_in => c_i16_0gr_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q,
        in_feedback_in_15 => i_acl_push_i16_x_dim_08_push15_memwrite_out_feedback_out_15,
        in_feedback_valid_in_15 => i_acl_push_i16_x_dim_08_push15_memwrite_out_feedback_valid_out_15,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i16_x_dim_08_pop15_memwrite_out_data_out,
        out_feedback_stall_out_15 => i_acl_pop_i16_x_dim_08_pop15_memwrite_out_feedback_stall_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_inc192_memwrite(ADD,351)@3
    i_inc192_memwrite_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_x_dim_08_pop15_memwrite_out_data_out);
    i_inc192_memwrite_b <= STD_LOGIC_VECTOR("0" & c_i16_1gr_q);
    i_inc192_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc192_memwrite_a) + UNSIGNED(i_inc192_memwrite_b));
    i_inc192_memwrite_q <= i_inc192_memwrite_o(16 downto 0);

    -- bgTrunc_i_inc192_memwrite_sel_x(BITSELECT,6)@3
    bgTrunc_i_inc192_memwrite_sel_x_b <= i_inc192_memwrite_q(15 downto 0);

    -- i_conv140_memwrite_sel_x(BITSELECT,94)@3
    i_conv140_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_x_dim_08_pop15_memwrite_out_data_out(15 downto 0)), 32));

    -- i_conv140_memwrite_vt_select_15(BITSELECT,284)@3
    i_conv140_memwrite_vt_select_15_b <= i_conv140_memwrite_sel_x_b(15 downto 0);

    -- i_conv140_memwrite_vt_join(BITJOIN,283)@3
    i_conv140_memwrite_vt_join_q <= c_i16_0gr_q & i_conv140_memwrite_vt_select_15_b;

    -- i_cmp188_memwrite(LOGICAL,252)@3
    i_cmp188_memwrite_q <= "1" WHEN i_conv140_memwrite_vt_join_q = redist43_bgTrunc_i_sub187_rm_memwrite_sel_x_b_1_q ELSE "0";

    -- i_x_dim_1_memwrite(MUX,482)@3
    i_x_dim_1_memwrite_s <= i_cmp188_memwrite_q;
    i_x_dim_1_memwrite_combproc: PROCESS (i_x_dim_1_memwrite_s, bgTrunc_i_inc192_memwrite_sel_x_b, c_i16_0gr_q)
    BEGIN
        CASE (i_x_dim_1_memwrite_s) IS
            WHEN "0" => i_x_dim_1_memwrite_q <= bgTrunc_i_inc192_memwrite_sel_x_b;
            WHEN "1" => i_x_dim_1_memwrite_q <= c_i16_0gr_q;
            WHEN OTHERS => i_x_dim_1_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv194_memwrite_sel_x(BITSELECT,103)@3
    i_conv194_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_x_dim_1_memwrite_q(15 downto 0)), 32));

    -- i_conv194_memwrite_vt_select_15(BITSELECT,316)@3
    i_conv194_memwrite_vt_select_15_b <= i_conv194_memwrite_sel_x_b(15 downto 0);

    -- i_conv194_memwrite_vt_join(BITJOIN,315)@3
    i_conv194_memwrite_vt_join_q <= c_i16_0gr_q & i_conv194_memwrite_vt_select_15_b;

    -- i_cmp204_memwrite(LOGICAL,254)@3
    i_cmp204_memwrite_q <= "1" WHEN i_conv194_memwrite_vt_join_q = redist43_bgTrunc_i_sub187_rm_memwrite_sel_x_b_1_q ELSE "0";

    -- i_acl_memwrite_sel_x(BITSELECT,77)@3
    i_acl_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_cmp204_memwrite_q(0 downto 0)), 8));

    -- i_acl_memwrite_vt_select_0(BITSELECT,200)@3
    i_acl_memwrite_vt_select_0_b <= i_acl_memwrite_sel_x_b(0 downto 0);

    -- i_acl_memwrite_vt_join(BITJOIN,199)@3
    i_acl_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_acl_memwrite_vt_select_0_b;

    -- i_acl_258_memwrite(MUX,191)@3
    i_acl_258_memwrite_s <= i_cmp163_memwrite_q;
    i_acl_258_memwrite_combproc: PROCESS (i_acl_258_memwrite_s, i_acl_pop_i8_end_flag_011_pop12_memwrite_out_data_out, i_acl_memwrite_vt_join_q)
    BEGIN
        CASE (i_acl_258_memwrite_s) IS
            WHEN "0" => i_acl_258_memwrite_q <= i_acl_pop_i8_end_flag_011_pop12_memwrite_out_data_out;
            WHEN "1" => i_acl_258_memwrite_q <= i_acl_memwrite_vt_join_q;
            WHEN OTHERS => i_acl_258_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_end_flag_011_push12_memwrite(BLACKBOX,225)@3
    -- out out_feedback_out_12@20000000
    -- out out_feedback_valid_out_12@20000000
    thei_acl_push_i8_end_flag_011_push12_memwrite : i_acl_push_i8_end_flag_011_push12_memwrite130
    PORT MAP (
        in_data_in => i_acl_258_memwrite_q,
        in_feedback_stall_in_12 => i_acl_pop_i8_end_flag_011_pop12_memwrite_out_feedback_stall_out_12,
        in_keep_going => redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_12 => i_acl_push_i8_end_flag_011_push12_memwrite_out_feedback_out_12,
        out_feedback_valid_out_12 => i_acl_push_i8_end_flag_011_push12_memwrite_out_feedback_valid_out_12,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_end_flag_011_pop12_memwrite(BLACKBOX,209)@3
    -- out out_feedback_stall_out_12@20000000
    thei_acl_pop_i8_end_flag_011_pop12_memwrite : i_acl_pop_i8_end_flag_011_pop12_memwrite39
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q,
        in_feedback_in_12 => i_acl_push_i8_end_flag_011_push12_memwrite_out_feedback_out_12,
        in_feedback_valid_in_12 => i_acl_push_i8_end_flag_011_push12_memwrite_out_feedback_valid_out_12,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i8_end_flag_011_pop12_memwrite_out_data_out,
        out_feedback_stall_out_12 => i_acl_pop_i8_end_flag_011_pop12_memwrite_out_feedback_stall_out_12,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_memwrite41(LOGICAL,467)@3
    i_unnamed_memwrite41_q <= i_acl_pop_i8_end_flag_011_pop12_memwrite_out_data_out and c_i8_1gr_q;

    -- i_unnamed_memwrite41_vt_select_0(BITSELECT,470)@3
    i_unnamed_memwrite41_vt_select_0_b <= i_unnamed_memwrite41_q(0 downto 0);

    -- i_unnamed_memwrite41_vt_join(BITJOIN,469)@3
    i_unnamed_memwrite41_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_unnamed_memwrite41_vt_select_0_b;

    -- i_tobool38_memwrite(LOGICAL,456)@3
    i_tobool38_memwrite_q <= "1" WHEN i_unnamed_memwrite41_vt_join_q /= c_i8_0gr_q ELSE "0";

    -- i_scalxrem_size_x_scalxq_vec_memwrite(MUX,411)@3
    i_scalxrem_size_x_scalxq_vec_memwrite_s <= i_tobool38_memwrite_q;
    i_scalxrem_size_x_scalxq_vec_memwrite_combproc: PROCESS (i_scalxrem_size_x_scalxq_vec_memwrite_s, i_syncbuf_scalxq_vec_sync_buffer_memwrite_out_buffer_out, i_syncbuf_scalxrem_size_x_sync_buffer_memwrite_out_buffer_out)
    BEGIN
        CASE (i_scalxrem_size_x_scalxq_vec_memwrite_s) IS
            WHEN "0" => i_scalxrem_size_x_scalxq_vec_memwrite_q <= i_syncbuf_scalxq_vec_sync_buffer_memwrite_out_buffer_out;
            WHEN "1" => i_scalxrem_size_x_scalxq_vec_memwrite_q <= i_syncbuf_scalxrem_size_x_sync_buffer_memwrite_out_buffer_out;
            WHEN OTHERS => i_scalxrem_size_x_scalxq_vec_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_syncbuf_scalxstart_size_x_sync_buffer_memwrite(BLACKBOX,450)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_scalxstart_size_x_sync_buffer_memwrite : i_syncbuf_scalxstart_size_x_sync_buffer_memwrite59
    PORT MAP (
        in_buffer_in => in_scalxstart_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_scalxstart_size_x_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite(BLACKBOX,444)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite : i_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite57
    PORT MAP (
        in_buffer_in => in_scal_rem_zxq_vec,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite(BLACKBOX,445)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite : i_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite55
    PORT MAP (
        in_buffer_in => in_scal_rem_zxrem_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite(BLACKBOX,446)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite : i_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite51
    PORT MAP (
        in_buffer_in => in_scal_rem_zxstart_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i8_loop_num_014_push9_memwrite(BLACKBOX,228)@3
    -- out out_feedback_out_9@20000000
    -- out out_feedback_valid_out_9@20000000
    thei_acl_push_i8_loop_num_014_push9_memwrite : i_acl_push_i8_loop_num_014_push9_memwrite61
    PORT MAP (
        in_data_in => i_acl_225_memwrite_q,
        in_feedback_stall_in_9 => i_acl_pop_i8_loop_num_014_pop9_memwrite_out_feedback_stall_out_9,
        in_keep_going => redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_9 => i_acl_push_i8_loop_num_014_push9_memwrite_out_feedback_out_9,
        out_feedback_valid_out_9 => i_acl_push_i8_loop_num_014_push9_memwrite_out_feedback_valid_out_9,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_loop_num_014_pop9_memwrite(BLACKBOX,212)@3
    -- out out_feedback_stall_out_9@20000000
    thei_acl_pop_i8_loop_num_014_pop9_memwrite : i_acl_pop_i8_loop_num_014_pop9_memwrite53
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q,
        in_feedback_in_9 => i_acl_push_i8_loop_num_014_push9_memwrite_out_feedback_out_9,
        in_feedback_valid_in_9 => i_acl_push_i8_loop_num_014_push9_memwrite_out_feedback_valid_out_9,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i8_loop_num_014_pop9_memwrite_out_data_out,
        out_feedback_stall_out_9 => i_acl_pop_i8_loop_num_014_pop9_memwrite_out_feedback_stall_out_9,
        clock => clock,
        resetn => resetn
    );

    -- i_tobool32_pre_not_memwrite(LOGICAL,455)@3
    i_tobool32_pre_not_memwrite_q <= i_tobool32_pre_memwrite_q xor VCC_q;

    -- i_not_cmp12_memwrite(LOGICAL,366)@3
    i_not_cmp12_memwrite_q <= i_cmp12_memwrite_c xor VCC_q;

    -- i_reduction_memwrite_15_memwrite(LOGICAL,380)@3
    i_reduction_memwrite_15_memwrite_q <= i_cmp6_memwrite_q and i_not_cmp12_memwrite_q;

    -- i_reduction_memwrite_16_memwrite(LOGICAL,381)@3
    i_reduction_memwrite_16_memwrite_q <= i_reduction_memwrite_15_memwrite_q and i_tobool32_pre_not_memwrite_q;

    -- i_acl_221_memwrite(MUX,173)@3
    i_acl_221_memwrite_s <= i_reduction_memwrite_16_memwrite_q;
    i_acl_221_memwrite_combproc: PROCESS (i_acl_221_memwrite_s, i_acl_pop_i8_loop_num_014_pop9_memwrite_out_data_out, i_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite_out_buffer_out)
    BEGIN
        CASE (i_acl_221_memwrite_s) IS
            WHEN "0" => i_acl_221_memwrite_q <= i_acl_pop_i8_loop_num_014_pop9_memwrite_out_data_out;
            WHEN "1" => i_acl_221_memwrite_q <= i_syncbuf_scal_rem_zxstart_size_x_sync_buffer_memwrite_out_buffer_out;
            WHEN OTHERS => i_acl_221_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_222_memwrite(MUX,174)@3
    i_acl_222_memwrite_s <= i_reduction_memwrite_19_memwrite_q;
    i_acl_222_memwrite_combproc: PROCESS (i_acl_222_memwrite_s, i_acl_221_memwrite_q, i_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite_out_buffer_out)
    BEGIN
        CASE (i_acl_222_memwrite_s) IS
            WHEN "0" => i_acl_222_memwrite_q <= i_acl_221_memwrite_q;
            WHEN "1" => i_acl_222_memwrite_q <= i_syncbuf_scal_rem_zxrem_size_x_sync_buffer_memwrite_out_buffer_out;
            WHEN OTHERS => i_acl_222_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp195_memwrite(LOGICAL,253)@3
    i_cmp195_memwrite_q <= "1" WHEN i_x_dim_1_memwrite_q = c_i16_0gr_q ELSE "0";

    -- i_start_flag_1_memwrite_sel_x(BITSELECT,125)@3
    i_start_flag_1_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_cmp195_memwrite_q(0 downto 0)), 8));

    -- i_start_flag_1_memwrite_vt_select_0(BITSELECT,424)@3
    i_start_flag_1_memwrite_vt_select_0_b <= i_start_flag_1_memwrite_sel_x_b(0 downto 0);

    -- i_start_flag_1_memwrite_vt_join(BITJOIN,423)@3
    i_start_flag_1_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_start_flag_1_memwrite_vt_select_0_b;

    -- i_acl_257_memwrite(MUX,190)@3
    i_acl_257_memwrite_s <= i_cmp163_memwrite_q;
    i_acl_257_memwrite_combproc: PROCESS (i_acl_257_memwrite_s, i_acl_pop_i8_start_flag_010_pop13_memwrite_out_data_out, i_start_flag_1_memwrite_vt_join_q)
    BEGIN
        CASE (i_acl_257_memwrite_s) IS
            WHEN "0" => i_acl_257_memwrite_q <= i_acl_pop_i8_start_flag_010_pop13_memwrite_out_data_out;
            WHEN "1" => i_acl_257_memwrite_q <= i_start_flag_1_memwrite_vt_join_q;
            WHEN OTHERS => i_acl_257_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_start_flag_010_push13_memwrite(BLACKBOX,229)@3
    -- out out_feedback_out_13@20000000
    -- out out_feedback_valid_out_13@20000000
    thei_acl_push_i8_start_flag_010_push13_memwrite : i_acl_push_i8_start_flag_010_push13_memwrite128
    PORT MAP (
        in_data_in => i_acl_257_memwrite_q,
        in_feedback_stall_in_13 => i_acl_pop_i8_start_flag_010_pop13_memwrite_out_feedback_stall_out_13,
        in_keep_going => redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_13 => i_acl_push_i8_start_flag_010_push13_memwrite_out_feedback_out_13,
        out_feedback_valid_out_13 => i_acl_push_i8_start_flag_010_push13_memwrite_out_feedback_valid_out_13,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_start_flag_010_pop13_memwrite(BLACKBOX,213)@3
    -- out out_feedback_stall_out_13@20000000
    thei_acl_pop_i8_start_flag_010_pop13_memwrite : i_acl_pop_i8_start_flag_010_pop13_memwrite26
    PORT MAP (
        in_data_in => c_i8_1gr_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q,
        in_feedback_in_13 => i_acl_push_i8_start_flag_010_push13_memwrite_out_feedback_out_13,
        in_feedback_valid_in_13 => i_acl_push_i8_start_flag_010_push13_memwrite_out_feedback_valid_out_13,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i8_start_flag_010_pop13_memwrite_out_data_out,
        out_feedback_stall_out_13 => i_acl_pop_i8_start_flag_010_pop13_memwrite_out_feedback_stall_out_13,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_memwrite47(LOGICAL,471)@3
    i_unnamed_memwrite47_q <= i_acl_pop_i8_start_flag_010_pop13_memwrite_out_data_out or i_acl_pop_i8_end_flag_011_pop12_memwrite_out_data_out;

    -- i_unnamed_memwrite48(LOGICAL,472)@3
    i_unnamed_memwrite48_q <= i_unnamed_memwrite47_q and c_i8_1gr_q;

    -- i_unnamed_memwrite48_vt_select_0(BITSELECT,475)@3
    i_unnamed_memwrite48_vt_select_0_b <= i_unnamed_memwrite48_q(0 downto 0);

    -- i_unnamed_memwrite48_vt_join(BITJOIN,474)@3
    i_unnamed_memwrite48_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_unnamed_memwrite48_vt_select_0_b;

    -- i_unnamed_memwrite49(LOGICAL,476)@3
    i_unnamed_memwrite49_q <= "1" WHEN i_unnamed_memwrite48_vt_join_q = c_i8_0gr_q ELSE "0";

    -- i_reduction_memwrite_21_memwrite(LOGICAL,385)@3
    i_reduction_memwrite_21_memwrite_q <= i_unnamed_memwrite49_q and i_reduction_memwrite_15_memwrite_q;

    -- i_acl_223_memwrite(MUX,175)@3
    i_acl_223_memwrite_s <= i_reduction_memwrite_21_memwrite_q;
    i_acl_223_memwrite_combproc: PROCESS (i_acl_223_memwrite_s, i_acl_222_memwrite_q, i_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite_out_buffer_out)
    BEGIN
        CASE (i_acl_223_memwrite_s) IS
            WHEN "0" => i_acl_223_memwrite_q <= i_acl_222_memwrite_q;
            WHEN "1" => i_acl_223_memwrite_q <= i_syncbuf_scal_rem_zxq_vec_sync_buffer_memwrite_out_buffer_out;
            WHEN OTHERS => i_acl_223_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_memwrite_23_memwrite(LOGICAL,387)@3
    i_reduction_memwrite_23_memwrite_q <= i_reduction_memwrite_22_memwrite_q and i_tobool32_pre_not_memwrite_q;

    -- i_acl_224_memwrite(MUX,176)@3
    i_acl_224_memwrite_s <= i_reduction_memwrite_23_memwrite_q;
    i_acl_224_memwrite_combproc: PROCESS (i_acl_224_memwrite_s, i_acl_223_memwrite_q, i_syncbuf_scalxstart_size_x_sync_buffer_memwrite_out_buffer_out)
    BEGIN
        CASE (i_acl_224_memwrite_s) IS
            WHEN "0" => i_acl_224_memwrite_q <= i_acl_223_memwrite_q;
            WHEN "1" => i_acl_224_memwrite_q <= i_syncbuf_scalxstart_size_x_sync_buffer_memwrite_out_buffer_out;
            WHEN OTHERS => i_acl_224_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_225_memwrite(MUX,177)@3
    i_acl_225_memwrite_s <= i_reduction_memwrite_25_memwrite_q;
    i_acl_225_memwrite_combproc: PROCESS (i_acl_225_memwrite_s, i_acl_224_memwrite_q, i_scalxrem_size_x_scalxq_vec_memwrite_q)
    BEGIN
        CASE (i_acl_225_memwrite_s) IS
            WHEN "0" => i_acl_225_memwrite_q <= i_acl_224_memwrite_q;
            WHEN "1" => i_acl_225_memwrite_q <= i_scalxrem_size_x_scalxq_vec_memwrite_q;
            WHEN OTHERS => i_acl_225_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv161_memwrite_sel_x(BITSELECT,99)@3
    i_conv161_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_225_memwrite_q(7 downto 0)), 32));

    -- i_conv161_memwrite_vt_select_7(BITSELECT,300)@3
    i_conv161_memwrite_vt_select_7_b <= i_conv161_memwrite_sel_x_b(7 downto 0);

    -- i_conv161_memwrite_vt_join(BITJOIN,299)@3
    i_conv161_memwrite_vt_join_q <= i_conv133_pre_phi_memwrite_vt_const_31_q & i_conv161_memwrite_vt_select_7_b;

    -- i_sub162_memwrite(ADD,426)@3
    i_sub162_memwrite_a <= STD_LOGIC_VECTOR("0" & i_conv161_memwrite_vt_join_q);
    i_sub162_memwrite_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub162_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub162_memwrite_a) + UNSIGNED(i_sub162_memwrite_b));
    i_sub162_memwrite_q <= i_sub162_memwrite_o(32 downto 0);

    -- bgTrunc_i_sub162_memwrite_sel_x(BITSELECT,18)@3
    bgTrunc_i_sub162_memwrite_sel_x_b <= i_sub162_memwrite_q(31 downto 0);

    -- i_conv5_memwrite_sel_x(BITSELECT,105)@3
    i_conv5_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_data_out(7 downto 0)), 32));

    -- i_conv5_memwrite_vt_select_7(BITSELECT,324)@3
    i_conv5_memwrite_vt_select_7_b <= i_conv5_memwrite_sel_x_b(7 downto 0);

    -- i_conv5_memwrite_vt_join(BITJOIN,323)@3
    i_conv5_memwrite_vt_join_q <= i_conv133_pre_phi_memwrite_vt_const_31_q & i_conv5_memwrite_vt_select_7_b;

    -- i_cmp163_memwrite(LOGICAL,250)@3
    i_cmp163_memwrite_q <= "1" WHEN i_conv5_memwrite_vt_join_q = bgTrunc_i_sub162_memwrite_sel_x_b ELSE "0";

    -- i_acl_261_memwrite(MUX,193)@3
    i_acl_261_memwrite_s <= i_cmp163_memwrite_q;
    i_acl_261_memwrite_combproc: PROCESS (i_acl_261_memwrite_s, bgTrunc_i_inc210_memwrite_sel_x_b, c_i8_0gr_q)
    BEGIN
        CASE (i_acl_261_memwrite_s) IS
            WHEN "0" => i_acl_261_memwrite_q <= bgTrunc_i_inc210_memwrite_sel_x_b;
            WHEN "1" => i_acl_261_memwrite_q <= c_i8_0gr_q;
            WHEN OTHERS => i_acl_261_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_inner_loop_018_push5_memwrite(BLACKBOX,226)@3
    -- out out_feedback_out_5@20000000
    -- out out_feedback_valid_out_5@20000000
    thei_acl_push_i8_inner_loop_018_push5_memwrite : i_acl_push_i8_inner_loop_018_push5_memwrite136
    PORT MAP (
        in_data_in => i_acl_261_memwrite_q,
        in_feedback_stall_in_5 => i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_feedback_stall_out_5,
        in_keep_going => redist24_i_acl_pipeline_keep_going_memwrite_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_5 => i_acl_push_i8_inner_loop_018_push5_memwrite_out_feedback_out_5,
        out_feedback_valid_out_5 => i_acl_push_i8_inner_loop_018_push5_memwrite_out_feedback_valid_out_5,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_inner_loop_018_pop5_memwrite(BLACKBOX,210)@3
    -- out out_feedback_stall_out_5@20000000
    thei_acl_pop_i8_inner_loop_018_pop5_memwrite : i_acl_pop_i8_inner_loop_018_pop5_memwrite23
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist31_sync_in_aunroll_x_in_c0_eni1_1_2_q,
        in_feedback_in_5 => i_acl_push_i8_inner_loop_018_push5_memwrite_out_feedback_out_5,
        in_feedback_valid_in_5 => i_acl_push_i8_inner_loop_018_push5_memwrite_out_feedback_valid_out_5,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_data_out,
        out_feedback_stall_out_5 => i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_feedback_stall_out_5,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp6_memwrite(LOGICAL,262)@3
    i_cmp6_memwrite_q <= "1" WHEN i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_data_out = c_i8_0gr_q ELSE "0";

    -- i_reduction_memwrite_22_memwrite(LOGICAL,386)@3
    i_reduction_memwrite_22_memwrite_q <= i_cmp6_memwrite_q and i_cmp12_memwrite_c;

    -- i_pre_memwrite(LOGICAL,376)@3
    i_pre_memwrite_q <= i_acl_pop_i8_start_flag_010_pop13_memwrite_out_data_out and c_i8_1gr_q;

    -- i_pre_memwrite_vt_select_0(BITSELECT,379)@3
    i_pre_memwrite_vt_select_0_b <= i_pre_memwrite_q(0 downto 0);

    -- i_pre_memwrite_vt_join(BITJOIN,378)@3
    i_pre_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_pre_memwrite_vt_select_0_b;

    -- i_tobool32_pre_memwrite(LOGICAL,454)@3
    i_tobool32_pre_memwrite_q <= "1" WHEN i_pre_memwrite_vt_join_q = c_i8_0gr_q ELSE "0";

    -- i_reduction_memwrite_25_memwrite(LOGICAL,388)@3
    i_reduction_memwrite_25_memwrite_q <= i_tobool32_pre_memwrite_q and i_reduction_memwrite_22_memwrite_q;

    -- i_reduction_memwrite_18_memwrite(LOGICAL,382)@3
    i_reduction_memwrite_18_memwrite_q <= i_tobool32_pre_memwrite_q and i_tobool38_memwrite_q;

    -- i_reduction_memwrite_19_memwrite(LOGICAL,383)@3
    i_reduction_memwrite_19_memwrite_q <= i_reduction_memwrite_15_memwrite_q and i_reduction_memwrite_18_memwrite_q;

    -- i_selcond_memwrite_6_memwrite(LOGICAL,417)@3 + 1
    i_selcond_memwrite_6_memwrite_qi <= i_reduction_memwrite_19_memwrite_q or i_reduction_memwrite_25_memwrite_q;
    i_selcond_memwrite_6_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_memwrite_6_memwrite_qi, xout => i_selcond_memwrite_6_memwrite_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_1_memwrite(MUX,384)@4
    i_reduction_memwrite_1_memwrite_s <= i_selcond_memwrite_6_memwrite_q;
    i_reduction_memwrite_1_memwrite_combproc: PROCESS (i_reduction_memwrite_1_memwrite_s, i_syncbuf_start_size_x_sync_buffer_memwrite_out_buffer_out, i_syncbuf_rem_size_x_sync_buffer_memwrite_out_buffer_out)
    BEGIN
        CASE (i_reduction_memwrite_1_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_1_memwrite_q <= i_syncbuf_start_size_x_sync_buffer_memwrite_out_buffer_out;
            WHEN "1" => i_reduction_memwrite_1_memwrite_q <= i_syncbuf_rem_size_x_sync_buffer_memwrite_out_buffer_out;
            WHEN OTHERS => i_reduction_memwrite_1_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_syncbuf_q_vec_sync_buffer_memwrite(BLACKBOX,441)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_q_vec_sync_buffer_memwrite : i_syncbuf_q_vec_sync_buffer_memwrite67
    PORT MAP (
        in_buffer_in => in_q_vec,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_q_vec_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_selcond_memwrite_11_memwrite(LOGICAL,413)@3
    i_selcond_memwrite_11_memwrite_q <= i_reduction_memwrite_25_memwrite_q and i_tobool38_memwrite_q;

    -- i_selcond_memwrite_9_memwrite(LOGICAL,420)@3
    i_selcond_memwrite_9_memwrite_q <= i_reduction_memwrite_25_memwrite_q xor VCC_q;

    -- i_selcond_memwrite_7_memwrite(LOGICAL,418)@3
    i_selcond_memwrite_7_memwrite_q <= i_reduction_memwrite_21_memwrite_q xor VCC_q;

    -- i_selcond_memwrite_8_memwrite(LOGICAL,419)@3
    i_selcond_memwrite_8_memwrite_q <= i_reduction_memwrite_23_memwrite_q or i_selcond_memwrite_7_memwrite_q;

    -- i_selcond_memwrite_10_memwrite(LOGICAL,412)@3
    i_selcond_memwrite_10_memwrite_q <= i_selcond_memwrite_8_memwrite_q and i_selcond_memwrite_9_memwrite_q;

    -- i_selcond_memwrite_12_memwrite(LOGICAL,414)@3 + 1
    i_selcond_memwrite_12_memwrite_qi <= i_selcond_memwrite_10_memwrite_q or i_selcond_memwrite_11_memwrite_q;
    i_selcond_memwrite_12_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_memwrite_12_memwrite_qi, xout => i_selcond_memwrite_12_memwrite_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_2_memwrite(MUX,393)@4
    i_reduction_memwrite_2_memwrite_s <= i_selcond_memwrite_12_memwrite_q;
    i_reduction_memwrite_2_memwrite_combproc: PROCESS (i_reduction_memwrite_2_memwrite_s, i_syncbuf_q_vec_sync_buffer_memwrite_out_buffer_out, i_reduction_memwrite_1_memwrite_q)
    BEGIN
        CASE (i_reduction_memwrite_2_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_2_memwrite_q <= i_syncbuf_q_vec_sync_buffer_memwrite_out_buffer_out;
            WHEN "1" => i_reduction_memwrite_2_memwrite_q <= i_reduction_memwrite_1_memwrite_q;
            WHEN OTHERS => i_reduction_memwrite_2_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_width_015_push8_memwrite(BLACKBOX,230)@4
    -- out out_feedback_out_8@20000000
    -- out out_feedback_valid_out_8@20000000
    thei_acl_push_i8_width_015_push8_memwrite : i_acl_push_i8_width_015_push8_memwrite71
    PORT MAP (
        in_data_in => i_reduction_memwrite_3_memwrite_q,
        in_feedback_stall_in_8 => i_acl_pop_i8_width_015_pop8_memwrite_out_feedback_stall_out_8,
        in_keep_going => redist25_i_acl_pipeline_keep_going_memwrite_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_8 => i_acl_push_i8_width_015_push8_memwrite_out_feedback_out_8,
        out_feedback_valid_out_8 => i_acl_push_i8_width_015_push8_memwrite_out_feedback_valid_out_8,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_width_015_pop8_memwrite(BLACKBOX,214)@4
    -- out out_feedback_stall_out_8@20000000
    thei_acl_pop_i8_width_015_pop8_memwrite : i_acl_pop_i8_width_015_pop8_memwrite69
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist32_sync_in_aunroll_x_in_c0_eni1_1_3_q,
        in_feedback_in_8 => i_acl_push_i8_width_015_push8_memwrite_out_feedback_out_8,
        in_feedback_valid_in_8 => i_acl_push_i8_width_015_push8_memwrite_out_feedback_valid_out_8,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i8_width_015_pop8_memwrite_out_data_out,
        out_feedback_stall_out_8 => i_acl_pop_i8_width_015_pop8_memwrite_out_feedback_stall_out_8,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_memwrite_27_memwrite(LOGICAL,390)@3
    i_reduction_memwrite_27_memwrite_q <= i_reduction_memwrite_21_memwrite_q or i_reduction_memwrite_23_memwrite_q;

    -- i_reduction_memwrite_26_memwrite(LOGICAL,389)@3
    i_reduction_memwrite_26_memwrite_q <= i_reduction_memwrite_16_memwrite_q or i_reduction_memwrite_19_memwrite_q;

    -- i_reduction_memwrite_28_memwrite(LOGICAL,391)@3
    i_reduction_memwrite_28_memwrite_q <= i_reduction_memwrite_26_memwrite_q or i_reduction_memwrite_27_memwrite_q;

    -- i_reduction_memwrite_29_memwrite(LOGICAL,392)@3 + 1
    i_reduction_memwrite_29_memwrite_qi <= i_reduction_memwrite_25_memwrite_q or i_reduction_memwrite_28_memwrite_q;
    i_reduction_memwrite_29_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_memwrite_29_memwrite_qi, xout => i_reduction_memwrite_29_memwrite_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_3_memwrite(MUX,394)@4
    i_reduction_memwrite_3_memwrite_s <= i_reduction_memwrite_29_memwrite_q;
    i_reduction_memwrite_3_memwrite_combproc: PROCESS (i_reduction_memwrite_3_memwrite_s, i_acl_pop_i8_width_015_pop8_memwrite_out_data_out, i_reduction_memwrite_2_memwrite_q)
    BEGIN
        CASE (i_reduction_memwrite_3_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_3_memwrite_q <= i_acl_pop_i8_width_015_pop8_memwrite_out_data_out;
            WHEN "1" => i_reduction_memwrite_3_memwrite_q <= i_reduction_memwrite_2_memwrite_q;
            WHEN OTHERS => i_reduction_memwrite_3_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv151_memwrite_sel_x(BITSELECT,98)@4
    i_conv151_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_reduction_memwrite_3_memwrite_q(7 downto 0)), 32));

    -- i_conv151_memwrite_vt_select_7(BITSELECT,296)@4
    i_conv151_memwrite_vt_select_7_b <= i_conv151_memwrite_sel_x_b(7 downto 0);

    -- i_conv151_memwrite_vt_join(BITJOIN,295)@4
    i_conv151_memwrite_vt_join_q <= i_conv133_pre_phi_memwrite_vt_const_31_q & i_conv151_memwrite_vt_select_7_b;

    -- i_sub152_memwrite(ADD,425)@4
    i_sub152_memwrite_a <= STD_LOGIC_VECTOR("0" & i_conv151_memwrite_vt_join_q);
    i_sub152_memwrite_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub152_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub152_memwrite_a) + UNSIGNED(i_sub152_memwrite_b));
    i_sub152_memwrite_q <= i_sub152_memwrite_o(32 downto 0);

    -- bgTrunc_i_sub152_memwrite_sel_x(BITSELECT,17)@4
    bgTrunc_i_sub152_memwrite_sel_x_b <= i_sub152_memwrite_q(31 downto 0);

    -- redist44_bgTrunc_i_sub152_memwrite_sel_x_b_1(DELAY,660)
    redist44_bgTrunc_i_sub152_memwrite_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub152_memwrite_sel_x_b, xout => redist44_bgTrunc_i_sub152_memwrite_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp153_memwrite(LOGICAL,249)@5
    i_cmp153_memwrite_q <= "1" WHEN i_conv63_memwrite_vt_join_q = redist44_bgTrunc_i_sub152_memwrite_sel_x_b_1_q ELSE "0";

    -- i_width_cnt_2_memwrite(MUX,481)@5
    i_width_cnt_2_memwrite_s <= i_cmp153_memwrite_q;
    i_width_cnt_2_memwrite_combproc: PROCESS (i_width_cnt_2_memwrite_s, bgTrunc_i_inc158_memwrite_sel_x_b, c_i8_0gr_q)
    BEGIN
        CASE (i_width_cnt_2_memwrite_s) IS
            WHEN "0" => i_width_cnt_2_memwrite_q <= bgTrunc_i_inc158_memwrite_sel_x_b;
            WHEN "1" => i_width_cnt_2_memwrite_q <= c_i8_0gr_q;
            WHEN OTHERS => i_width_cnt_2_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_width_cnt_016_push7_memwrite(BLACKBOX,231)@5
    -- out out_feedback_out_7@20000000
    -- out out_feedback_valid_out_7@20000000
    thei_acl_push_i8_width_cnt_016_push7_memwrite : i_acl_push_i8_width_cnt_016_push7_memwrite107
    PORT MAP (
        in_data_in => i_width_cnt_2_memwrite_q,
        in_feedback_stall_in_7 => i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_feedback_stall_out_7,
        in_keep_going => redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_7 => i_acl_push_i8_width_cnt_016_push7_memwrite_out_feedback_out_7,
        out_feedback_valid_out_7 => i_acl_push_i8_width_cnt_016_push7_memwrite_out_feedback_valid_out_7,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_width_cnt_016_pop7_memwrite(BLACKBOX,215)@4
    -- out out_feedback_stall_out_7@20000000
    thei_acl_pop_i8_width_cnt_016_pop7_memwrite : i_acl_pop_i8_width_cnt_016_pop7_memwrite73
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist32_sync_in_aunroll_x_in_c0_eni1_1_3_q,
        in_feedback_in_7 => i_acl_push_i8_width_cnt_016_push7_memwrite_out_feedback_out_7,
        in_feedback_valid_in_7 => i_acl_push_i8_width_cnt_016_push7_memwrite_out_feedback_valid_out_7,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out,
        out_feedback_stall_out_7 => i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_feedback_stall_out_7,
        clock => clock,
        resetn => resetn
    );

    -- redist20_i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out_1(DELAY,636)
    redist20_i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out, xout => redist20_i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist7_i_reduction_memwrite_29_memwrite_q_2(DELAY,623)
    redist7_i_reduction_memwrite_29_memwrite_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_memwrite_29_memwrite_q, xout => redist7_i_reduction_memwrite_29_memwrite_q_2_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_4_memwrite(MUX,402)@5
    i_reduction_memwrite_4_memwrite_s <= redist7_i_reduction_memwrite_29_memwrite_q_2_q;
    i_reduction_memwrite_4_memwrite_combproc: PROCESS (i_reduction_memwrite_4_memwrite_s, redist20_i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out_1_q, c_i8_0gr_q)
    BEGIN
        CASE (i_reduction_memwrite_4_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_4_memwrite_q <= redist20_i_acl_pop_i8_width_cnt_016_pop7_memwrite_out_data_out_1_q;
            WHEN "1" => i_reduction_memwrite_4_memwrite_q <= c_i8_0gr_q;
            WHEN OTHERS => i_reduction_memwrite_4_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv63_memwrite_sel_x(BITSELECT,106)@5
    i_conv63_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_reduction_memwrite_4_memwrite_q(7 downto 0)), 32));

    -- i_conv63_memwrite_vt_select_7(BITSELECT,328)@5
    i_conv63_memwrite_vt_select_7_b <= i_conv63_memwrite_sel_x_b(7 downto 0);

    -- i_conv63_memwrite_vt_join(BITJOIN,327)@5
    i_conv63_memwrite_vt_join_q <= i_conv133_pre_phi_memwrite_vt_const_31_q & i_conv63_memwrite_vt_select_7_b;

    -- i_syncbuf_next_layer_padding_sync_buffer5_memwrite(BLACKBOX,432)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_next_layer_padding_sync_buffer5_memwrite : i_syncbuf_next_layer_padding_sync_buffer5_memwrite121
    PORT MAP (
        in_buffer_in => in_next_layer_padding,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_next_layer_padding_sync_buffer5_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv199_rm_memwrite_sel_x(BITSELECT,104)@5
    i_conv199_rm_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_next_layer_padding_sync_buffer5_memwrite_out_buffer_out(7 downto 0)), 16));

    -- i_conv199_rm_memwrite_vt_select_7(BITSELECT,320)@5
    i_conv199_rm_memwrite_vt_select_7_b <= i_conv199_rm_memwrite_sel_x_b(7 downto 0);

    -- i_conv199_rm_memwrite_vt_join(BITJOIN,319)@5
    i_conv199_rm_memwrite_vt_join_q <= c_i8_0gr_q & i_conv199_rm_memwrite_vt_select_7_b;

    -- redist18_i_cmp195_memwrite_q_2(DELAY,634)
    redist18_i_cmp195_memwrite_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp195_memwrite_q, xout => redist18_i_cmp195_memwrite_q_2_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_6_memwrite(MUX,404)@5
    i_reduction_memwrite_6_memwrite_s <= redist18_i_cmp195_memwrite_q_2_q;
    i_reduction_memwrite_6_memwrite_combproc: PROCESS (i_reduction_memwrite_6_memwrite_s, i_conv199_rm_memwrite_vt_join_q, c_i16_0gr_q)
    BEGIN
        CASE (i_reduction_memwrite_6_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_6_memwrite_q <= i_conv199_rm_memwrite_vt_join_q;
            WHEN "1" => i_reduction_memwrite_6_memwrite_q <= c_i16_0gr_q;
            WHEN OTHERS => i_reduction_memwrite_6_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_memwrite_6_memwrite_vt_select_7(BITSELECT,407)@5
    i_reduction_memwrite_6_memwrite_vt_select_7_b <= i_reduction_memwrite_6_memwrite_q(7 downto 0);

    -- i_reduction_memwrite_6_memwrite_vt_join(BITJOIN,406)@5
    i_reduction_memwrite_6_memwrite_vt_join_q <= c_i8_0gr_q & i_reduction_memwrite_6_memwrite_vt_select_7_b;

    -- redist19_i_cmp163_memwrite_q_2(DELAY,635)
    redist19_i_cmp163_memwrite_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp163_memwrite_q, xout => redist19_i_cmp163_memwrite_q_2_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_7_memwrite(MUX,408)@5
    i_reduction_memwrite_7_memwrite_s <= redist19_i_cmp163_memwrite_q_2_q;
    i_reduction_memwrite_7_memwrite_combproc: PROCESS (i_reduction_memwrite_7_memwrite_s, i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_data_out, i_reduction_memwrite_6_memwrite_vt_join_q)
    BEGIN
        CASE (i_reduction_memwrite_7_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_7_memwrite_q <= i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_data_out;
            WHEN "1" => i_reduction_memwrite_7_memwrite_q <= i_reduction_memwrite_6_memwrite_vt_join_q;
            WHEN OTHERS => i_reduction_memwrite_7_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_padding_tmp_09_push14_memwrite(BLACKBOX,216)@5
    -- out out_feedback_out_14@20000000
    -- out out_feedback_valid_out_14@20000000
    thei_acl_push_i16_padding_tmp_09_push14_memwrite : i_acl_push_i16_padding_tmp_09_push14_memwrite126
    PORT MAP (
        in_data_in => i_reduction_memwrite_7_memwrite_q,
        in_feedback_stall_in_14 => i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_feedback_stall_out_14,
        in_keep_going => redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_14 => i_acl_push_i16_padding_tmp_09_push14_memwrite_out_feedback_out_14,
        out_feedback_valid_out_14 => i_acl_push_i16_padding_tmp_09_push14_memwrite_out_feedback_valid_out_14,
        clock => clock,
        resetn => resetn
    );

    -- redist33_sync_in_aunroll_x_in_c0_eni1_1_4(DELAY,649)
    redist33_sync_in_aunroll_x_in_c0_eni1_1_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist32_sync_in_aunroll_x_in_c0_eni1_1_3_q, xout => redist33_sync_in_aunroll_x_in_c0_eni1_1_4_q, clk => clock, aclr => resetn );

    -- i_acl_pop_i16_padding_tmp_09_pop14_memwrite(BLACKBOX,202)@5
    -- out out_feedback_stall_out_14@20000000
    thei_acl_pop_i16_padding_tmp_09_pop14_memwrite : i_acl_pop_i16_padding_tmp_09_pop14_memwrite100
    PORT MAP (
        in_data_in => c_i16_0gr_q,
        in_dir => redist33_sync_in_aunroll_x_in_c0_eni1_1_4_q,
        in_feedback_in_14 => i_acl_push_i16_padding_tmp_09_push14_memwrite_out_feedback_out_14,
        in_feedback_valid_in_14 => i_acl_push_i16_padding_tmp_09_push14_memwrite_out_feedback_valid_out_14,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_data_out => i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_data_out,
        out_feedback_stall_out_14 => i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_feedback_stall_out_14,
        clock => clock,
        resetn => resetn
    );

    -- i_conv144_memwrite_sel_x(BITSELECT,97)@5
    i_conv144_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_padding_tmp_09_pop14_memwrite_out_data_out(15 downto 0)), 32));

    -- i_conv144_memwrite_vt_select_15(BITSELECT,292)@5
    i_conv144_memwrite_vt_select_15_b <= i_conv144_memwrite_sel_x_b(15 downto 0);

    -- i_conv144_memwrite_vt_join(BITJOIN,291)@5
    i_conv144_memwrite_vt_join_q <= c_i16_0gr_q & i_conv144_memwrite_vt_select_15_b;

    -- i_reduction_memwrite_42_memwrite(ADD,395)@5
    i_reduction_memwrite_42_memwrite_a <= STD_LOGIC_VECTOR("0" & i_conv144_memwrite_vt_join_q);
    i_reduction_memwrite_42_memwrite_b <= STD_LOGIC_VECTOR("0" & i_conv63_memwrite_vt_join_q);
    i_reduction_memwrite_42_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memwrite_42_memwrite_a) + UNSIGNED(i_reduction_memwrite_42_memwrite_b));
    i_reduction_memwrite_42_memwrite_q <= i_reduction_memwrite_42_memwrite_o(32 downto 0);

    -- bgTrunc_i_reduction_memwrite_42_memwrite_sel_x(BITSELECT,13)@5
    bgTrunc_i_reduction_memwrite_42_memwrite_sel_x_b <= i_reduction_memwrite_42_memwrite_q(31 downto 0);

    -- i_reduction_memwrite_42_memwrite_vt_select_16(BITSELECT,398)@5
    i_reduction_memwrite_42_memwrite_vt_select_16_b <= bgTrunc_i_reduction_memwrite_42_memwrite_sel_x_b(16 downto 0);

    -- redist6_i_reduction_memwrite_42_memwrite_vt_select_16_b_2(DELAY,622)
    redist6_i_reduction_memwrite_42_memwrite_vt_select_16_b_2 : dspba_delay
    GENERIC MAP ( width => 17, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_memwrite_42_memwrite_vt_select_16_b, xout => redist6_i_reduction_memwrite_42_memwrite_vt_select_16_b_2_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_42_memwrite_vt_join(BITJOIN,397)@7
    i_reduction_memwrite_42_memwrite_vt_join_q <= i_mul135_memwrite_multconst_x_q & redist6_i_reduction_memwrite_42_memwrite_vt_select_16_b_2_q;

    -- i_syncbuf_out_dim1xdim2_sync_buffer_memwrite(BLACKBOX,436)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_out_dim1xdim2_sync_buffer_memwrite : i_syncbuf_out_dim1xdim2_sync_buffer_memwrite90
    PORT MAP (
        in_buffer_in => in_out_dim1xdim2,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_out_dim1xdim2_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_scal_sync_buffer_memwrite(BLACKBOX,447)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_scal_sync_buffer_memwrite : i_syncbuf_scal_sync_buffer_memwrite115
    PORT MAP (
        in_buffer_in => in_scal,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_scal_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv176_rm_memwrite_sel_x(BITSELECT,101)@5
    i_conv176_rm_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_scal_sync_buffer_memwrite_out_buffer_out(7 downto 0)), 16));

    -- i_conv176_rm_memwrite_vt_select_7(BITSELECT,308)@5
    i_conv176_rm_memwrite_vt_select_7_b <= i_conv176_rm_memwrite_sel_x_b(7 downto 0);

    -- i_conv176_rm_memwrite_vt_join(BITJOIN,307)@5
    i_conv176_rm_memwrite_vt_join_q <= c_i8_0gr_q & i_conv176_rm_memwrite_vt_select_7_b;

    -- i_syncbuf_out_dim2_sync_buffer_memwrite(BLACKBOX,437)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_out_dim2_sync_buffer_memwrite : i_syncbuf_out_dim2_sync_buffer_memwrite112
    PORT MAP (
        in_buffer_in => in_out_dim2,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_out_dim2_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv170_rm_memwrite_sel_x(BITSELECT,100)@4
    i_conv170_rm_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_out_dim2_sync_buffer_memwrite_out_buffer_out(15 downto 0)), 32));

    -- i_conv170_rm_memwrite_vt_select_15(BITSELECT,304)@4
    i_conv170_rm_memwrite_vt_select_15_b <= i_conv170_rm_memwrite_sel_x_b(15 downto 0);

    -- i_conv170_rm_memwrite_vt_join(BITJOIN,303)@4
    i_conv170_rm_memwrite_vt_join_q <= c_i16_0gr_q & i_conv170_rm_memwrite_vt_select_15_b;

    -- i_sub171_rm_memwrite(ADD,427)@4
    i_sub171_rm_memwrite_a <= STD_LOGIC_VECTOR("0" & i_conv170_rm_memwrite_vt_join_q);
    i_sub171_rm_memwrite_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub171_rm_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub171_rm_memwrite_a) + UNSIGNED(i_sub171_rm_memwrite_b));
    i_sub171_rm_memwrite_q <= i_sub171_rm_memwrite_o(32 downto 0);

    -- bgTrunc_i_sub171_rm_memwrite_sel_x(BITSELECT,19)@4
    bgTrunc_i_sub171_rm_memwrite_sel_x_b <= i_sub171_rm_memwrite_q(31 downto 0);

    -- redist22_i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out_1(DELAY,638)
    redist22_i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out, xout => redist22_i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_8_memwrite(MUX,409)@5
    i_reduction_memwrite_8_memwrite_s <= redist19_i_cmp163_memwrite_q_2_q;
    i_reduction_memwrite_8_memwrite_combproc: PROCESS (i_reduction_memwrite_8_memwrite_s, redist22_i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out_1_q, c_i16_0gr_q)
    BEGIN
        CASE (i_reduction_memwrite_8_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_8_memwrite_q <= redist22_i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out_1_q;
            WHEN "1" => i_reduction_memwrite_8_memwrite_q <= c_i16_0gr_q;
            WHEN OTHERS => i_reduction_memwrite_8_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_inc182_memwrite_sel_x(BITSELECT,110)@3
    i_inc182_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_unnamed_memwrite41_vt_join_q(7 downto 0)), 16));

    -- i_inc182_memwrite_vt_select_0(BITSELECT,349)@3
    i_inc182_memwrite_vt_select_0_b <= i_inc182_memwrite_sel_x_b(0 downto 0);

    -- redist10_i_inc182_memwrite_vt_select_0_b_1(DELAY,626)
    redist10_i_inc182_memwrite_vt_select_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_inc182_memwrite_vt_select_0_b, xout => redist10_i_inc182_memwrite_vt_select_0_b_1_q, clk => clock, aclr => resetn );

    -- i_inc182_memwrite_vt_join(BITJOIN,348)@4
    i_inc182_memwrite_vt_join_q <= i_mul135_memwrite_multconst_x_q & redist10_i_inc182_memwrite_vt_select_0_b_1_q;

    -- i_inc182_y_dim_0_memwrite(ADD,350)@4
    i_inc182_y_dim_0_memwrite_a <= STD_LOGIC_VECTOR("0" & i_inc182_memwrite_vt_join_q);
    i_inc182_y_dim_0_memwrite_b <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out);
    i_inc182_y_dim_0_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc182_y_dim_0_memwrite_a) + UNSIGNED(i_inc182_y_dim_0_memwrite_b));
    i_inc182_y_dim_0_memwrite_q <= i_inc182_y_dim_0_memwrite_o(16 downto 0);

    -- bgTrunc_i_inc182_y_dim_0_memwrite_sel_x(BITSELECT,5)@4
    bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b <= i_inc182_y_dim_0_memwrite_q(15 downto 0);

    -- redist47_bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b_1(DELAY,663)
    redist47_bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b, xout => redist47_bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_selcond_memwrite_25_memwrite(LOGICAL,415)@5
    i_selcond_memwrite_25_memwrite_q <= redist19_i_cmp163_memwrite_q_2_q xor VCC_q;

    -- i_selcond_memwrite_26_memwrite(LOGICAL,416)@5
    i_selcond_memwrite_26_memwrite_q <= i_or_cond27_memwrite_q or i_selcond_memwrite_25_memwrite_q;

    -- i_reduction_memwrite_9_memwrite(MUX,410)@5
    i_reduction_memwrite_9_memwrite_s <= i_selcond_memwrite_26_memwrite_q;
    i_reduction_memwrite_9_memwrite_combproc: PROCESS (i_reduction_memwrite_9_memwrite_s, redist47_bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b_1_q, i_reduction_memwrite_8_memwrite_q)
    BEGIN
        CASE (i_reduction_memwrite_9_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_9_memwrite_q <= redist47_bgTrunc_i_inc182_y_dim_0_memwrite_sel_x_b_1_q;
            WHEN "1" => i_reduction_memwrite_9_memwrite_q <= i_reduction_memwrite_8_memwrite_q;
            WHEN OTHERS => i_reduction_memwrite_9_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_y_dim_012_push11_memwrite(BLACKBOX,218)@5
    -- out out_feedback_out_11@20000000
    -- out out_feedback_valid_out_11@20000000
    thei_acl_push_i16_y_dim_012_push11_memwrite : i_acl_push_i16_y_dim_012_push11_memwrite132
    PORT MAP (
        in_data_in => i_reduction_memwrite_9_memwrite_q,
        in_feedback_stall_in_11 => i_acl_pop_i16_y_dim_012_pop11_memwrite_out_feedback_stall_out_11,
        in_keep_going => redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_11 => i_acl_push_i16_y_dim_012_push11_memwrite_out_feedback_out_11,
        out_feedback_valid_out_11 => i_acl_push_i16_y_dim_012_push11_memwrite_out_feedback_valid_out_11,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_y_dim_012_pop11_memwrite(BLACKBOX,204)@4
    -- out out_feedback_stall_out_11@20000000
    thei_acl_pop_i16_y_dim_012_pop11_memwrite : i_acl_pop_i16_y_dim_012_pop11_memwrite92
    PORT MAP (
        in_data_in => c_i16_0gr_q,
        in_dir => redist32_sync_in_aunroll_x_in_c0_eni1_1_3_q,
        in_feedback_in_11 => i_acl_push_i16_y_dim_012_push11_memwrite_out_feedback_out_11,
        in_feedback_valid_in_11 => i_acl_push_i16_y_dim_012_push11_memwrite_out_feedback_valid_out_11,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist36_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out,
        out_feedback_stall_out_11 => i_acl_pop_i16_y_dim_012_pop11_memwrite_out_feedback_stall_out_11,
        clock => clock,
        resetn => resetn
    );

    -- i_conv136_memwrite_sel_x(BITSELECT,91)@4
    i_conv136_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_y_dim_012_pop11_memwrite_out_data_out(15 downto 0)), 32));

    -- i_conv136_memwrite_vt_select_15(BITSELECT,276)@4
    i_conv136_memwrite_vt_select_15_b <= i_conv136_memwrite_sel_x_b(15 downto 0);

    -- i_conv136_memwrite_vt_join(BITJOIN,275)@4
    i_conv136_memwrite_vt_join_q <= c_i16_0gr_q & i_conv136_memwrite_vt_select_15_b;

    -- i_cmp172_memwrite(LOGICAL,251)@4
    i_cmp172_memwrite_q <= "1" WHEN i_conv136_memwrite_vt_join_q = bgTrunc_i_sub171_rm_memwrite_sel_x_b ELSE "0";

    -- redist2_i_tobool38_memwrite_q_1(DELAY,618)
    redist2_i_tobool38_memwrite_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tobool38_memwrite_q, xout => redist2_i_tobool38_memwrite_q_1_q, clk => clock, aclr => resetn );

    -- i_or_cond27_memwrite(LOGICAL,371)@4 + 1
    i_or_cond27_memwrite_qi <= redist2_i_tobool38_memwrite_q_1_q and i_cmp172_memwrite_q;
    i_or_cond27_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond27_memwrite_qi, xout => i_or_cond27_memwrite_q, clk => clock, aclr => resetn );

    -- i_add177_memwrite(MUX,236)@5
    i_add177_memwrite_s <= i_or_cond27_memwrite_q;
    i_add177_memwrite_combproc: PROCESS (i_add177_memwrite_s, c_i16_0gr_q, i_conv176_rm_memwrite_vt_join_q)
    BEGIN
        CASE (i_add177_memwrite_s) IS
            WHEN "0" => i_add177_memwrite_q <= c_i16_0gr_q;
            WHEN "1" => i_add177_memwrite_q <= i_conv176_rm_memwrite_vt_join_q;
            WHEN OTHERS => i_add177_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_add177_memwrite_vt_select_7(BITSELECT,239)@5
    i_add177_memwrite_vt_select_7_b <= i_add177_memwrite_q(7 downto 0);

    -- i_add177_memwrite_vt_join(BITJOIN,238)@5
    i_add177_memwrite_vt_join_q <= c_i8_0gr_q & i_add177_memwrite_vt_select_7_b;

    -- i_acl_254_memwrite(MUX,185)@5
    i_acl_254_memwrite_s <= redist19_i_cmp163_memwrite_q_2_q;
    i_acl_254_memwrite_combproc: PROCESS (i_acl_254_memwrite_s, c_i16_0gr_q, i_add177_memwrite_vt_join_q)
    BEGIN
        CASE (i_acl_254_memwrite_s) IS
            WHEN "0" => i_acl_254_memwrite_q <= c_i16_0gr_q;
            WHEN "1" => i_acl_254_memwrite_q <= i_add177_memwrite_vt_join_q;
            WHEN OTHERS => i_acl_254_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_254_memwrite_vt_select_7(BITSELECT,188)@5
    i_acl_254_memwrite_vt_select_7_b <= i_acl_254_memwrite_q(7 downto 0);

    -- i_acl_254_memwrite_vt_join(BITJOIN,187)@5
    i_acl_254_memwrite_vt_join_q <= c_i8_0gr_q & i_acl_254_memwrite_vt_select_7_b;

    -- i_acl_260_memwrite(ADD,192)@5
    i_acl_260_memwrite_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i16_z_dim_013_pop10_memwrite_out_data_out);
    i_acl_260_memwrite_b <= STD_LOGIC_VECTOR("0" & i_acl_254_memwrite_vt_join_q);
    i_acl_260_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_260_memwrite_a) + UNSIGNED(i_acl_260_memwrite_b));
    i_acl_260_memwrite_q <= i_acl_260_memwrite_o(16 downto 0);

    -- bgTrunc_i_acl_260_memwrite_sel_x(BITSELECT,2)@5
    bgTrunc_i_acl_260_memwrite_sel_x_b <= i_acl_260_memwrite_q(15 downto 0);

    -- i_acl_push_i16_z_dim_013_push10_memwrite(BLACKBOX,219)@5
    -- out out_feedback_out_10@20000000
    -- out out_feedback_valid_out_10@20000000
    thei_acl_push_i16_z_dim_013_push10_memwrite : i_acl_push_i16_z_dim_013_push10_memwrite134
    PORT MAP (
        in_data_in => bgTrunc_i_acl_260_memwrite_sel_x_b,
        in_feedback_stall_in_10 => i_acl_pop_i16_z_dim_013_pop10_memwrite_out_feedback_stall_out_10,
        in_keep_going => redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_10 => i_acl_push_i16_z_dim_013_push10_memwrite_out_feedback_out_10,
        out_feedback_valid_out_10 => i_acl_push_i16_z_dim_013_push10_memwrite_out_feedback_valid_out_10,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_z_dim_013_pop10_memwrite(BLACKBOX,205)@5
    -- out out_feedback_stall_out_10@20000000
    thei_acl_pop_i16_z_dim_013_pop10_memwrite : i_acl_pop_i16_z_dim_013_pop10_memwrite88
    PORT MAP (
        in_data_in => c_i16_0gr_q,
        in_dir => redist33_sync_in_aunroll_x_in_c0_eni1_1_4_q,
        in_feedback_in_10 => i_acl_push_i16_z_dim_013_push10_memwrite_out_feedback_out_10,
        in_feedback_valid_in_10 => i_acl_push_i16_z_dim_013_push10_memwrite_out_feedback_valid_out_10,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_data_out => i_acl_pop_i16_z_dim_013_pop10_memwrite_out_data_out,
        out_feedback_stall_out_10 => i_acl_pop_i16_z_dim_013_pop10_memwrite_out_feedback_stall_out_10,
        clock => clock,
        resetn => resetn
    );

    -- i_conv132_memwrite_sel_x(BITSELECT,89)@5
    i_conv132_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_pop_i16_z_dim_013_pop10_memwrite_out_data_out(15 downto 0)), 32));

    -- i_conv132_memwrite_vt_select_15(BITSELECT,268)@5
    i_conv132_memwrite_vt_select_15_b <= i_conv132_memwrite_sel_x_b(15 downto 0);

    -- i_conv132_memwrite_vt_join(BITJOIN,267)@5
    i_conv132_memwrite_vt_join_q <= c_i16_0gr_q & i_conv132_memwrite_vt_select_15_b;

    -- i_inc156_memwrite_sel_x(BITSELECT,109)@5
    i_inc156_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_cmp153_memwrite_q(0 downto 0)), 8));

    -- i_inc156_memwrite_vt_select_0(BITSELECT,344)@5
    i_inc156_memwrite_vt_select_0_b <= i_inc156_memwrite_sel_x_b(0 downto 0);

    -- i_inc156_memwrite_vt_join(BITJOIN,343)@5
    i_inc156_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_inc156_memwrite_vt_select_0_b;

    -- i_lane_cnt_2_memwrite(ADD,354)@5
    i_lane_cnt_2_memwrite_a <= STD_LOGIC_VECTOR("0" & i_inc156_memwrite_vt_join_q);
    i_lane_cnt_2_memwrite_b <= STD_LOGIC_VECTOR("0" & i_reduction_memwrite_5_memwrite_q);
    i_lane_cnt_2_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_lane_cnt_2_memwrite_a) + UNSIGNED(i_lane_cnt_2_memwrite_b));
    i_lane_cnt_2_memwrite_q <= i_lane_cnt_2_memwrite_o(8 downto 0);

    -- bgTrunc_i_lane_cnt_2_memwrite_sel_x(BITSELECT,9)@5
    bgTrunc_i_lane_cnt_2_memwrite_sel_x_b <= i_lane_cnt_2_memwrite_q(7 downto 0);

    -- i_acl_push_i8_lane_cnt_017_push6_memwrite(BLACKBOX,227)@5
    -- out out_feedback_out_6@20000000
    -- out out_feedback_valid_out_6@20000000
    thei_acl_push_i8_lane_cnt_017_push6_memwrite : i_acl_push_i8_lane_cnt_017_push6_memwrite109
    PORT MAP (
        in_data_in => bgTrunc_i_lane_cnt_2_memwrite_sel_x_b,
        in_feedback_stall_in_6 => i_acl_pop_i8_lane_cnt_017_pop6_memwrite_out_feedback_stall_out_6,
        in_keep_going => redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_6 => i_acl_push_i8_lane_cnt_017_push6_memwrite_out_feedback_out_6,
        out_feedback_valid_out_6 => i_acl_push_i8_lane_cnt_017_push6_memwrite_out_feedback_valid_out_6,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_lane_cnt_017_pop6_memwrite(BLACKBOX,211)@5
    -- out out_feedback_stall_out_6@20000000
    thei_acl_pop_i8_lane_cnt_017_pop6_memwrite : i_acl_pop_i8_lane_cnt_017_pop6_memwrite75
    PORT MAP (
        in_data_in => c_i8_0gr_q,
        in_dir => redist33_sync_in_aunroll_x_in_c0_eni1_1_4_q,
        in_feedback_in_6 => i_acl_push_i8_lane_cnt_017_push6_memwrite_out_feedback_out_6,
        in_feedback_valid_in_6 => i_acl_push_i8_lane_cnt_017_push6_memwrite_out_feedback_valid_out_6,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_data_out => i_acl_pop_i8_lane_cnt_017_pop6_memwrite_out_data_out,
        out_feedback_stall_out_6 => i_acl_pop_i8_lane_cnt_017_pop6_memwrite_out_feedback_stall_out_6,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_memwrite_5_memwrite(MUX,403)@5
    i_reduction_memwrite_5_memwrite_s <= redist7_i_reduction_memwrite_29_memwrite_q_2_q;
    i_reduction_memwrite_5_memwrite_combproc: PROCESS (i_reduction_memwrite_5_memwrite_s, i_acl_pop_i8_lane_cnt_017_pop6_memwrite_out_data_out, c_i8_0gr_q)
    BEGIN
        CASE (i_reduction_memwrite_5_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_5_memwrite_q <= i_acl_pop_i8_lane_cnt_017_pop6_memwrite_out_data_out;
            WHEN "1" => i_reduction_memwrite_5_memwrite_q <= c_i8_0gr_q;
            WHEN OTHERS => i_reduction_memwrite_5_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv133_pre_phi_memwrite_sel_x(BITSELECT,90)@5
    i_conv133_pre_phi_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_reduction_memwrite_5_memwrite_q(7 downto 0)), 32));

    -- i_conv133_pre_phi_memwrite_vt_select_7(BITSELECT,272)@5
    i_conv133_pre_phi_memwrite_vt_select_7_b <= i_conv133_pre_phi_memwrite_sel_x_b(7 downto 0);

    -- i_conv133_pre_phi_memwrite_vt_join(BITJOIN,271)@5
    i_conv133_pre_phi_memwrite_vt_join_q <= i_conv133_pre_phi_memwrite_vt_const_31_q & i_conv133_pre_phi_memwrite_vt_select_7_b;

    -- i_add134_memwrite(ADD,232)@5
    i_add134_memwrite_a <= STD_LOGIC_VECTOR("0" & i_conv133_pre_phi_memwrite_vt_join_q);
    i_add134_memwrite_b <= STD_LOGIC_VECTOR("0" & i_conv132_memwrite_vt_join_q);
    i_add134_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add134_memwrite_a) + UNSIGNED(i_add134_memwrite_b));
    i_add134_memwrite_q <= i_add134_memwrite_o(32 downto 0);

    -- bgTrunc_i_add134_memwrite_sel_x(BITSELECT,3)@5
    bgTrunc_i_add134_memwrite_sel_x_b <= i_add134_memwrite_q(31 downto 0);

    -- i_add134_memwrite_vt_select_16(BITSELECT,235)@5
    i_add134_memwrite_vt_select_16_b <= bgTrunc_i_add134_memwrite_sel_x_b(16 downto 0);

    -- i_mul135_memwrite(MULT,357)@5 + 2
    i_mul135_memwrite_pr <= UNSIGNED(UNSIGNED(i_mul135_memwrite_a0) * UNSIGNED(i_mul135_memwrite_b0));
    i_mul135_memwrite_component: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul135_memwrite_a0 <= (others => '0');
            i_mul135_memwrite_b0 <= (others => '0');
            i_mul135_memwrite_s1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_mul135_memwrite_a0 <= i_add134_memwrite_vt_select_16_b;
            i_mul135_memwrite_b0 <= i_syncbuf_out_dim1xdim2_sync_buffer_memwrite_out_buffer_out;
            i_mul135_memwrite_s1 <= STD_LOGIC_VECTOR(i_mul135_memwrite_pr);
        END IF;
    END PROCESS;
    i_mul135_memwrite_q <= i_mul135_memwrite_s1;

    -- i_mul135_memwrite_extender_x(BITJOIN,111)@7
    i_mul135_memwrite_extender_x_q <= i_mul135_memwrite_multconst_x_q & i_mul135_memwrite_q;

    -- bgTrunc_i_mul135_memwrite_sel_x(BITSELECT,10)@7
    bgTrunc_i_mul135_memwrite_sel_x_b <= i_mul135_memwrite_extender_x_q(31 downto 0);

    -- i_reduction_memwrite_44_memwrite(ADD,400)@7
    i_reduction_memwrite_44_memwrite_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_mul135_memwrite_sel_x_b);
    i_reduction_memwrite_44_memwrite_b <= STD_LOGIC_VECTOR("0" & i_reduction_memwrite_42_memwrite_vt_join_q);
    i_reduction_memwrite_44_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memwrite_44_memwrite_a) + UNSIGNED(i_reduction_memwrite_44_memwrite_b));
    i_reduction_memwrite_44_memwrite_q <= i_reduction_memwrite_44_memwrite_o(32 downto 0);

    -- bgTrunc_i_reduction_memwrite_44_memwrite_sel_x(BITSELECT,15)@7
    bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b <= i_reduction_memwrite_44_memwrite_q(31 downto 0);

    -- redist45_bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b_1(DELAY,661)
    redist45_bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b, xout => redist45_bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_out_dim1_sync_buffer_memwrite(BLACKBOX,435)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_out_dim1_sync_buffer_memwrite : i_syncbuf_out_dim1_sync_buffer_memwrite94
    PORT MAP (
        in_buffer_in => in_out_dim1,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_out_dim1_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv137_rm_memwrite_sel_x(BITSELECT,93)@5
    i_conv137_rm_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_out_dim1_sync_buffer_memwrite_out_buffer_out(15 downto 0)), 32));

    -- i_conv137_rm_memwrite_vt_select_15(BITSELECT,280)@5
    i_conv137_rm_memwrite_vt_select_15_b <= i_conv137_rm_memwrite_sel_x_b(15 downto 0);

    -- i_conv136_memwrite_vt_join_narrowed_x(BITSELECT,92)@4
    i_conv136_memwrite_vt_join_narrowed_x_b <= i_conv136_memwrite_vt_join_q(15 downto 0);

    -- redist41_i_conv136_memwrite_vt_join_narrowed_x_b_1(DELAY,657)
    redist41_i_conv136_memwrite_vt_join_narrowed_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv136_memwrite_vt_join_narrowed_x_b, xout => redist41_i_conv136_memwrite_vt_join_narrowed_x_b_1_q, clk => clock, aclr => resetn );

    -- i_mul138_memwrite_cma(CHAINMULTADD,613)@5 + 2
    i_mul138_memwrite_cma_reset <= not (resetn);
    i_mul138_memwrite_cma_ena0 <= '1';
    i_mul138_memwrite_cma_ena1 <= i_mul138_memwrite_cma_ena0;
    i_mul138_memwrite_cma_p(0) <= i_mul138_memwrite_cma_a0(0) * i_mul138_memwrite_cma_c0(0);
    i_mul138_memwrite_cma_u(0) <= RESIZE(i_mul138_memwrite_cma_p(0),32);
    i_mul138_memwrite_cma_w(0) <= i_mul138_memwrite_cma_u(0);
    i_mul138_memwrite_cma_x(0) <= i_mul138_memwrite_cma_w(0);
    i_mul138_memwrite_cma_y(0) <= i_mul138_memwrite_cma_x(0);
    i_mul138_memwrite_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul138_memwrite_cma_a0 <= (others => (others => '0'));
            i_mul138_memwrite_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul138_memwrite_cma_ena0 = '1') THEN
                i_mul138_memwrite_cma_a0(0) <= RESIZE(UNSIGNED(redist41_i_conv136_memwrite_vt_join_narrowed_x_b_1_q),16);
                i_mul138_memwrite_cma_c0(0) <= RESIZE(UNSIGNED(i_conv137_rm_memwrite_vt_select_15_b),16);
            END IF;
        END IF;
    END PROCESS;
    i_mul138_memwrite_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul138_memwrite_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul138_memwrite_cma_ena1 = '1') THEN
                i_mul138_memwrite_cma_s(0) <= i_mul138_memwrite_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul138_memwrite_cma_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul138_memwrite_cma_s(0)(31 downto 0)), xout => i_mul138_memwrite_cma_qq, clk => clock, aclr => resetn );
    i_mul138_memwrite_cma_q <= STD_LOGIC_VECTOR(i_mul138_memwrite_cma_qq(31 downto 0));

    -- i_mul138_memwrite_extender_x(BITJOIN,113)@7
    i_mul138_memwrite_extender_x_q <= i_mul138_memwrite_multconst_x_q & i_mul138_memwrite_cma_q;

    -- bgTrunc_i_mul138_memwrite_sel_x(BITSELECT,11)@7
    bgTrunc_i_mul138_memwrite_sel_x_b <= i_mul138_memwrite_extender_x_q(31 downto 0);

    -- i_mul142_memwrite_multconst_x(CONSTANT,116)
    i_mul142_memwrite_multconst_x_q <= "0000000000000000000000000000000000000000";

    -- i_syncbuf_q_vec_sync_buffer2_memwrite(BLACKBOX,440)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_q_vec_sync_buffer2_memwrite : i_syncbuf_q_vec_sync_buffer2_memwrite98
    PORT MAP (
        in_buffer_in => in_q_vec,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_q_vec_sync_buffer2_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv141_rm_memwrite_sel_x(BITSELECT,96)@5
    i_conv141_rm_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_q_vec_sync_buffer2_memwrite_out_buffer_out(7 downto 0)), 32));

    -- i_conv141_rm_memwrite_vt_select_7(BITSELECT,288)@5
    i_conv141_rm_memwrite_vt_select_7_b <= i_conv141_rm_memwrite_sel_x_b(7 downto 0);

    -- i_conv140_memwrite_vt_join_narrowed_x(BITSELECT,95)@3
    i_conv140_memwrite_vt_join_narrowed_x_b <= i_conv140_memwrite_vt_join_q(15 downto 0);

    -- redist40_i_conv140_memwrite_vt_join_narrowed_x_b_2(DELAY,656)
    redist40_i_conv140_memwrite_vt_join_narrowed_x_b_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv140_memwrite_vt_join_narrowed_x_b, xout => redist40_i_conv140_memwrite_vt_join_narrowed_x_b_2_q, clk => clock, aclr => resetn );

    -- i_mul142_memwrite_cma(CHAINMULTADD,614)@5 + 2
    i_mul142_memwrite_cma_reset <= not (resetn);
    i_mul142_memwrite_cma_ena0 <= '1';
    i_mul142_memwrite_cma_ena1 <= i_mul142_memwrite_cma_ena0;
    i_mul142_memwrite_cma_p(0) <= i_mul142_memwrite_cma_a0(0) * i_mul142_memwrite_cma_c0(0);
    i_mul142_memwrite_cma_u(0) <= RESIZE(i_mul142_memwrite_cma_p(0),26);
    i_mul142_memwrite_cma_w(0) <= i_mul142_memwrite_cma_u(0);
    i_mul142_memwrite_cma_x(0) <= i_mul142_memwrite_cma_w(0);
    i_mul142_memwrite_cma_y(0) <= i_mul142_memwrite_cma_x(0);
    i_mul142_memwrite_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul142_memwrite_cma_a0 <= (others => (others => '0'));
            i_mul142_memwrite_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul142_memwrite_cma_ena0 = '1') THEN
                i_mul142_memwrite_cma_a0(0) <= RESIZE(UNSIGNED(redist40_i_conv140_memwrite_vt_join_narrowed_x_b_2_q),16);
                i_mul142_memwrite_cma_c0(0) <= RESIZE(UNSIGNED(i_conv141_rm_memwrite_vt_select_7_b),10);
            END IF;
        END IF;
    END PROCESS;
    i_mul142_memwrite_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul142_memwrite_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul142_memwrite_cma_ena1 = '1') THEN
                i_mul142_memwrite_cma_s(0) <= i_mul142_memwrite_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul142_memwrite_cma_delay : dspba_delay
    GENERIC MAP ( width => 26, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul142_memwrite_cma_s(0)(25 downto 0)), xout => i_mul142_memwrite_cma_qq, clk => clock, aclr => resetn );
    i_mul142_memwrite_cma_q <= STD_LOGIC_VECTOR(i_mul142_memwrite_cma_qq(23 downto 0));

    -- i_mul142_memwrite_extender_x(BITJOIN,115)@7
    i_mul142_memwrite_extender_x_q <= i_mul142_memwrite_multconst_x_q & i_mul142_memwrite_cma_q;

    -- bgTrunc_i_mul142_memwrite_sel_x(BITSELECT,12)@7
    bgTrunc_i_mul142_memwrite_sel_x_b <= i_mul142_memwrite_extender_x_q(31 downto 0);

    -- i_mul142_memwrite_vt_select_23(BITSELECT,362)@7
    i_mul142_memwrite_vt_select_23_b <= bgTrunc_i_mul142_memwrite_sel_x_b(23 downto 0);

    -- i_mul142_memwrite_vt_join(BITJOIN,361)@7
    i_mul142_memwrite_vt_join_q <= c_i8_0gr_q & i_mul142_memwrite_vt_select_23_b;

    -- i_reduction_memwrite_43_memwrite(ADD,399)@7
    i_reduction_memwrite_43_memwrite_a <= STD_LOGIC_VECTOR("0" & i_mul142_memwrite_vt_join_q);
    i_reduction_memwrite_43_memwrite_b <= STD_LOGIC_VECTOR("0" & bgTrunc_i_mul138_memwrite_sel_x_b);
    i_reduction_memwrite_43_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memwrite_43_memwrite_a) + UNSIGNED(i_reduction_memwrite_43_memwrite_b));
    i_reduction_memwrite_43_memwrite_q <= i_reduction_memwrite_43_memwrite_o(32 downto 0);

    -- bgTrunc_i_reduction_memwrite_43_memwrite_sel_x(BITSELECT,14)@7
    bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b <= i_reduction_memwrite_43_memwrite_q(31 downto 0);

    -- redist46_bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b_1(DELAY,662)
    redist46_bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b, xout => redist46_bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_reduction_memwrite_45_memwrite(ADD,401)@8
    i_reduction_memwrite_45_memwrite_a <= STD_LOGIC_VECTOR("0" & redist46_bgTrunc_i_reduction_memwrite_43_memwrite_sel_x_b_1_q);
    i_reduction_memwrite_45_memwrite_b <= STD_LOGIC_VECTOR("0" & redist45_bgTrunc_i_reduction_memwrite_44_memwrite_sel_x_b_1_q);
    i_reduction_memwrite_45_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memwrite_45_memwrite_a) + UNSIGNED(i_reduction_memwrite_45_memwrite_b));
    i_reduction_memwrite_45_memwrite_q <= i_reduction_memwrite_45_memwrite_o(32 downto 0);

    -- bgTrunc_i_reduction_memwrite_45_memwrite_sel_x(BITSELECT,16)@8
    bgTrunc_i_reduction_memwrite_45_memwrite_sel_x_b <= i_reduction_memwrite_45_memwrite_q(31 downto 0);

    -- i_idxprom148_memwrite_sel_x(BITSELECT,108)@8
    i_idxprom148_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(bgTrunc_i_reduction_memwrite_45_memwrite_sel_x_b(31 downto 0)), 64));

    -- i_idxprom148_memwrite_vt_select_31(BITSELECT,340)@8
    i_idxprom148_memwrite_vt_select_31_b <= i_idxprom148_memwrite_sel_x_b(31 downto 0);

    -- redist11_i_idxprom148_memwrite_vt_select_31_b_1(DELAY,627)
    redist11_i_idxprom148_memwrite_vt_select_31_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_idxprom148_memwrite_vt_select_31_b, xout => redist11_i_idxprom148_memwrite_vt_select_31_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom148_memwrite_vt_join(BITJOIN,339)@9
    i_idxprom148_memwrite_vt_join_q <= i_mul138_memwrite_multconst_x_q & redist11_i_idxprom148_memwrite_vt_select_31_b_1_q;

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select(BITSELECT,615)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_b <= i_idxprom148_memwrite_vt_join_q(15 downto 0);
    i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_c <= i_idxprom148_memwrite_vt_join_q(31 downto 16);
    i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_d <= i_idxprom148_memwrite_vt_join_q(47 downto 32);
    i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_e <= i_idxprom148_memwrite_vt_join_q(63 downto 48);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_im9_shift0(BITSHIFT,612)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im9_shift0_qint <= i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_e & "00000";
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im9_shift0_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_im9_shift0_qint(20 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_align_15(BITSHIFT,543)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx149_0_memwrite_memwrite104_mult_x_im9_shift0_q) & "0000000000";
    i_arrayidx149_0_memwrite_memwrite104_mult_x_align_15_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_align_15_qint(31 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_im3_shift0(BITSHIFT,610)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im3_shift0_qint <= i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_c & "00000";
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im3_shift0_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_im3_shift0_qint(20 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_align_14(BITSHIFT,542)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx149_0_memwrite_memwrite104_mult_x_im3_shift0_q) & "0000000000000000";
    i_arrayidx149_0_memwrite_memwrite104_mult_x_align_14_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_align_14_qint(37 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_join_16(BITJOIN,544)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_join_16_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_align_15_q & i_arrayidx149_0_memwrite_memwrite104_mult_x_align_14_q;

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_im6_shift0(BITSHIFT,611)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im6_shift0_qint <= i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_d & "00000";
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im6_shift0_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_im6_shift0_qint(20 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_align_12(BITSHIFT,540)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx149_0_memwrite_memwrite104_mult_x_im6_shift0_q) & "0000000000";
    i_arrayidx149_0_memwrite_memwrite104_mult_x_align_12_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_align_12_qint(31 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_im0_shift0(BITSHIFT,609)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im0_shift0_qint <= i_arrayidx149_0_memwrite_memwrite104_mult_x_bs1_merged_bit_select_b & "00000";
    i_arrayidx149_0_memwrite_memwrite104_mult_x_im0_shift0_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_im0_shift0_qint(20 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_join_13(BITJOIN,541)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_join_13_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx149_0_memwrite_memwrite104_mult_x_im0_shift0_q);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0(ADD,545)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000000" & i_arrayidx149_0_memwrite_memwrite104_mult_x_join_13_q);
    i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx149_0_memwrite_memwrite104_mult_x_join_16_q);
    i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_b));
    i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_q <= i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_o(70 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_mult_extender_x(BITJOIN,81)@9
    i_arrayidx149_0_memwrite_memwrite104_mult_extender_x_q <= i_arrayidx149_0_memwrite_memwrite104_mult_multconst_x_q & i_arrayidx149_0_memwrite_memwrite104_mult_x_result_add_0_0_q(69 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x(BITSELECT,83)@9
    i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b <= i_arrayidx149_0_memwrite_memwrite104_mult_extender_x_q(63 downto 0);

    -- redist42_i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b_1(DELAY,658)
    redist42_i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b, xout => redist42_i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_top_sync_buffer_memwrite(BLACKBOX,453)@0
    -- in in_i_dependence@10
    -- in in_valid_in@10
    -- out out_buffer_out@10
    -- out out_valid_out@10
    thei_syncbuf_top_sync_buffer_memwrite : i_syncbuf_top_sync_buffer_memwrite102
    PORT MAP (
        in_buffer_in => in_top,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist39_sync_in_aunroll_x_in_i_valid_9_q,
        out_buffer_out => i_syncbuf_top_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx149_0_memwrite_memwrite104_add_x(ADD,84)@10
    i_arrayidx149_0_memwrite_memwrite104_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_top_sync_buffer_memwrite_out_buffer_out);
    i_arrayidx149_0_memwrite_memwrite104_add_x_b <= STD_LOGIC_VECTOR("0" & redist42_i_arrayidx149_0_memwrite_memwrite104_trunc_sel_x_b_1_q);
    i_arrayidx149_0_memwrite_memwrite104_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx149_0_memwrite_memwrite104_add_x_a) + UNSIGNED(i_arrayidx149_0_memwrite_memwrite104_add_x_b));
    i_arrayidx149_0_memwrite_memwrite104_add_x_q <= i_arrayidx149_0_memwrite_memwrite104_add_x_o(64 downto 0);

    -- i_arrayidx149_0_memwrite_memwrite104_dupName_0_trunc_sel_x(BITSELECT,78)@10
    i_arrayidx149_0_memwrite_memwrite104_dupName_0_trunc_sel_x_b <= i_arrayidx149_0_memwrite_memwrite104_add_x_q(63 downto 0);

    -- redist4_i_reduction_memwrite_4_memwrite_q_1(DELAY,620)
    redist4_i_reduction_memwrite_4_memwrite_q_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_memwrite_4_memwrite_q, xout => redist4_i_reduction_memwrite_4_memwrite_q_1_q, clk => clock, aclr => resetn );

    -- i_cmp56_memwrite(LOGICAL,259)@6
    i_cmp56_memwrite_q <= "1" WHEN redist4_i_reduction_memwrite_4_memwrite_q_1_q = c_i8_0gr_q ELSE "0";

    -- redist3_i_selcond_memwrite_9_memwrite_q_1(DELAY,619)
    redist3_i_selcond_memwrite_9_memwrite_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_memwrite_9_memwrite_q, xout => redist3_i_selcond_memwrite_9_memwrite_q_1_q, clk => clock, aclr => resetn );

    -- i_acl_217_memwrite(MUX,161)@3
    i_acl_217_memwrite_s <= i_reduction_memwrite_19_memwrite_q;
    i_acl_217_memwrite_combproc: PROCESS (i_acl_217_memwrite_s, i_pre_memwrite_vt_join_q, c_i8_0gr_q)
    BEGIN
        CASE (i_acl_217_memwrite_s) IS
            WHEN "0" => i_acl_217_memwrite_q <= i_pre_memwrite_vt_join_q;
            WHEN "1" => i_acl_217_memwrite_q <= c_i8_0gr_q;
            WHEN OTHERS => i_acl_217_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_217_memwrite_vt_select_0(BITSELECT,164)@3
    i_acl_217_memwrite_vt_select_0_b <= i_acl_217_memwrite_q(0 downto 0);

    -- i_acl_217_memwrite_vt_join(BITJOIN,163)@3
    i_acl_217_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_acl_217_memwrite_vt_select_0_b;

    -- i_acl_218_memwrite(MUX,165)@3
    i_acl_218_memwrite_s <= i_reduction_memwrite_21_memwrite_q;
    i_acl_218_memwrite_combproc: PROCESS (i_acl_218_memwrite_s, i_acl_217_memwrite_vt_join_q, c_i8_0gr_q)
    BEGIN
        CASE (i_acl_218_memwrite_s) IS
            WHEN "0" => i_acl_218_memwrite_q <= i_acl_217_memwrite_vt_join_q;
            WHEN "1" => i_acl_218_memwrite_q <= c_i8_0gr_q;
            WHEN OTHERS => i_acl_218_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_218_memwrite_vt_select_0(BITSELECT,168)@3
    i_acl_218_memwrite_vt_select_0_b <= i_acl_218_memwrite_q(0 downto 0);

    -- i_acl_218_memwrite_vt_join(BITJOIN,167)@3
    i_acl_218_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_acl_218_memwrite_vt_select_0_b;

    -- i_acl_219_memwrite(MUX,169)@3
    i_acl_219_memwrite_s <= i_reduction_memwrite_23_memwrite_q;
    i_acl_219_memwrite_combproc: PROCESS (i_acl_219_memwrite_s, i_acl_218_memwrite_vt_join_q, i_pre_memwrite_vt_join_q)
    BEGIN
        CASE (i_acl_219_memwrite_s) IS
            WHEN "0" => i_acl_219_memwrite_q <= i_acl_218_memwrite_vt_join_q;
            WHEN "1" => i_acl_219_memwrite_q <= i_pre_memwrite_vt_join_q;
            WHEN OTHERS => i_acl_219_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_219_memwrite_vt_select_0(BITSELECT,172)@3
    i_acl_219_memwrite_vt_select_0_b <= i_acl_219_memwrite_q(0 downto 0);

    -- redist30_i_acl_219_memwrite_vt_select_0_b_1(DELAY,646)
    redist30_i_acl_219_memwrite_vt_select_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_219_memwrite_vt_select_0_b, xout => redist30_i_acl_219_memwrite_vt_select_0_b_1_q, clk => clock, aclr => resetn );

    -- i_acl_219_memwrite_vt_join(BITJOIN,171)@4
    i_acl_219_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & redist30_i_acl_219_memwrite_vt_select_0_b_1_q;

    -- i_tobool50266_memwrite(LOGICAL,457)@4
    i_tobool50266_memwrite_q <= "1" WHEN i_acl_219_memwrite_vt_join_q /= c_i8_0gr_q ELSE "0";

    -- i_tobool50_memwrite(LOGICAL,458)@4 + 1
    i_tobool50_memwrite_qi <= i_tobool50266_memwrite_q and redist3_i_selcond_memwrite_9_memwrite_q_1_q;
    i_tobool50_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tobool50_memwrite_qi, xout => i_tobool50_memwrite_q, clk => clock, aclr => resetn );

    -- redist1_i_tobool50_memwrite_q_2(DELAY,617)
    redist1_i_tobool50_memwrite_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tobool50_memwrite_q, xout => redist1_i_tobool50_memwrite_q_2_q, clk => clock, aclr => resetn );

    -- i_or_cond_memwrite(LOGICAL,374)@6
    i_or_cond_memwrite_q <= redist1_i_tobool50_memwrite_q_2_q and i_cmp56_memwrite_q;

    -- i_not_or_cond_memwrite(LOGICAL,369)@6
    i_not_or_cond_memwrite_q <= i_or_cond_memwrite_q xor VCC_q;

    -- i_syncbuf_next_layer_padding_sync_buffer_memwrite(BLACKBOX,433)@0
    -- in in_i_dependence@6
    -- in in_valid_in@6
    -- out out_buffer_out@6
    -- out out_valid_out@6
    thei_syncbuf_next_layer_padding_sync_buffer_memwrite : i_syncbuf_next_layer_padding_sync_buffer_memwrite83
    PORT MAP (
        in_buffer_in => in_next_layer_padding,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist38_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_next_layer_padding_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp69_old_rm_memwrite(LOGICAL,261)@6
    i_cmp69_old_rm_memwrite_q <= "1" WHEN i_syncbuf_next_layer_padding_sync_buffer_memwrite_out_buffer_out = c_i8_1gr_q ELSE "0";

    -- i_syncbuf_rem_size_x_sync_buffer3_memwrite(BLACKBOX,442)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_rem_size_x_sync_buffer3_memwrite : i_syncbuf_rem_size_x_sync_buffer3_memwrite80
    PORT MAP (
        in_buffer_in => in_rem_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist37_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_rem_size_x_sync_buffer3_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv64_rm_memwrite_sel_x(BITSELECT,107)@5
    i_conv64_rm_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_rem_size_x_sync_buffer3_memwrite_out_buffer_out(7 downto 0)), 32));

    -- i_conv64_rm_memwrite_vt_select_7(BITSELECT,332)@5
    i_conv64_rm_memwrite_vt_select_7_b <= i_conv64_rm_memwrite_sel_x_b(7 downto 0);

    -- i_conv64_rm_memwrite_vt_join(BITJOIN,331)@5
    i_conv64_rm_memwrite_vt_join_q <= i_conv133_pre_phi_memwrite_vt_const_31_q & i_conv64_rm_memwrite_vt_select_7_b;

    -- i_sub_rm_memwrite(ADD,429)@5
    i_sub_rm_memwrite_a <= STD_LOGIC_VECTOR("0" & i_conv64_rm_memwrite_vt_join_q);
    i_sub_rm_memwrite_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub_rm_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_rm_memwrite_a) + UNSIGNED(i_sub_rm_memwrite_b));
    i_sub_rm_memwrite_q <= i_sub_rm_memwrite_o(32 downto 0);

    -- bgTrunc_i_sub_rm_memwrite_sel_x(BITSELECT,21)@5
    bgTrunc_i_sub_rm_memwrite_sel_x_b <= i_sub_rm_memwrite_q(31 downto 0);

    -- i_cmp65_memwrite(LOGICAL,260)@5 + 1
    i_cmp65_memwrite_qi <= "1" WHEN i_conv63_memwrite_vt_join_q = bgTrunc_i_sub_rm_memwrite_sel_x_b ELSE "0";
    i_cmp65_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp65_memwrite_qi, xout => i_cmp65_memwrite_q, clk => clock, aclr => resetn );

    -- i_or_cond2_memwrite(LOGICAL,372)@6
    i_or_cond2_memwrite_q <= i_cmp65_memwrite_q and i_cmp69_old_rm_memwrite_q;

    -- i_not_or_cond2_memwrite(LOGICAL,368)@6
    i_not_or_cond2_memwrite_q <= i_or_cond2_memwrite_q xor VCC_q;

    -- i_tobool58_memwrite(LOGICAL,459)@3 + 1
    i_tobool58_memwrite_qi <= "1" WHEN i_unnamed_memwrite41_vt_join_q = c_i8_0gr_q ELSE "0";
    i_tobool58_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tobool58_memwrite_qi, xout => i_tobool58_memwrite_q, clk => clock, aclr => resetn );

    -- redist0_i_tobool58_memwrite_q_3(DELAY,616)
    redist0_i_tobool58_memwrite_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tobool58_memwrite_q, xout => redist0_i_tobool58_memwrite_q_3_q, clk => clock, aclr => resetn );

    -- i_acl_242_memwrite(LOGICAL,180)@6
    i_acl_242_memwrite_q <= redist0_i_tobool58_memwrite_q_3_q or i_not_or_cond2_memwrite_q;

    -- i_syncbuf_start_size_x_sync_buffer4_memwrite(BLACKBOX,451)@0
    -- in in_i_dependence@6
    -- in in_valid_in@6
    -- out out_buffer_out@6
    -- out out_valid_out@6
    thei_syncbuf_start_size_x_sync_buffer4_memwrite : i_syncbuf_start_size_x_sync_buffer4_memwrite86
    PORT MAP (
        in_buffer_in => in_start_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist38_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_start_size_x_sync_buffer4_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp80_memwrite(COMPARE,263)@6
    i_cmp80_memwrite_a <= STD_LOGIC_VECTOR("00" & redist4_i_reduction_memwrite_4_memwrite_q_1_q);
    i_cmp80_memwrite_b <= STD_LOGIC_VECTOR("00" & i_syncbuf_start_size_x_sync_buffer4_memwrite_out_buffer_out);
    i_cmp80_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp80_memwrite_a) - UNSIGNED(i_cmp80_memwrite_b));
    i_cmp80_memwrite_c(0) <= i_cmp80_memwrite_o(9);

    -- i_or_cond3_memwrite(LOGICAL,373)@6
    i_or_cond3_memwrite_q <= i_cmp80_memwrite_c and i_cmp69_old_rm_memwrite_q;

    -- i_acl_241_demorgan_memwrite(LOGICAL,178)@6
    i_acl_241_demorgan_memwrite_q <= redist1_i_tobool50_memwrite_q_2_q and i_or_cond3_memwrite_q;

    -- i_acl_249_memwrite(LOGICAL,183)@6
    i_acl_249_memwrite_q <= i_acl_241_demorgan_memwrite_q and i_acl_242_memwrite_q;

    -- i_acl_251_memwrite(LOGICAL,184)@6 + 1
    i_acl_251_memwrite_qi <= i_acl_249_memwrite_q and i_not_or_cond_memwrite_q;
    i_acl_251_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_251_memwrite_qi, xout => i_acl_251_memwrite_q, clk => clock, aclr => resetn );

    -- redist28_i_acl_251_memwrite_q_4(DELAY,644)
    redist28_i_acl_251_memwrite_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_251_memwrite_q, xout => redist28_i_acl_251_memwrite_q_4_q, clk => clock, aclr => resetn );

    -- i_not_cmp69_old_rm_memwrite(LOGICAL,367)@6
    i_not_cmp69_old_rm_memwrite_q <= i_cmp69_old_rm_memwrite_q xor VCC_q;

    -- i_acl_241_memwrite(LOGICAL,179)@6
    i_acl_241_memwrite_q <= i_acl_241_demorgan_memwrite_q xor VCC_q;

    -- i_acl_243_memwrite(LOGICAL,181)@6
    i_acl_243_memwrite_q <= i_acl_242_memwrite_q and i_acl_241_memwrite_q;

    -- i_acl_245_memwrite(MUX,182)@6 + 1
    i_acl_245_memwrite_s <= i_or_cond_memwrite_q;
    i_acl_245_memwrite_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_245_memwrite_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_245_memwrite_s) IS
                WHEN "0" => i_acl_245_memwrite_q <= i_acl_243_memwrite_q;
                WHEN "1" => i_acl_245_memwrite_q <= i_not_cmp69_old_rm_memwrite_q;
                WHEN OTHERS => i_acl_245_memwrite_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist29_i_acl_245_memwrite_q_4(DELAY,645)
    redist29_i_acl_245_memwrite_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_245_memwrite_q, xout => redist29_i_acl_245_memwrite_q_4_q, clk => clock, aclr => resetn );

    -- redist5_i_reduction_memwrite_4_memwrite_q_5(DELAY,621)
    redist5_i_reduction_memwrite_4_memwrite_q_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_reduction_memwrite_4_memwrite_q_1_q, xout => redist5_i_reduction_memwrite_4_memwrite_q_5_q, clk => clock, aclr => resetn );

    -- redist8_i_reduction_memwrite_29_memwrite_q_7(DELAY,624)
    redist8_i_reduction_memwrite_29_memwrite_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_i_reduction_memwrite_29_memwrite_q_2_q, xout => redist8_i_reduction_memwrite_29_memwrite_q_7_q, clk => clock, aclr => resetn );

    -- i_syncbuf_bypass_sync_buffer_memwrite(BLACKBOX,430)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_bypass_sync_buffer_memwrite : i_syncbuf_bypass_sync_buffer_memwrite28
    PORT MAP (
        in_buffer_in => in_bypass,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist35_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_bypass_sync_buffer_memwrite_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_and_rm_memwrite(LOGICAL,240)@3
    i_and_rm_memwrite_q <= i_syncbuf_bypass_sync_buffer_memwrite_out_buffer_out and c_i8_1gr_q;

    -- i_and_rm_memwrite_vt_select_0(BITSELECT,243)@3
    i_and_rm_memwrite_vt_select_0_b <= i_and_rm_memwrite_q(0 downto 0);

    -- i_and_rm_memwrite_vt_join(BITJOIN,242)@3
    i_and_rm_memwrite_vt_join_q <= i_acl_217_memwrite_vt_const_7_q & i_and_rm_memwrite_vt_select_0_b;

    -- i_cmp9_not_rm_memwrite(LOGICAL,264)@3 + 1
    i_cmp9_not_rm_memwrite_qi <= "1" WHEN i_and_rm_memwrite_vt_join_q /= c_i8_0gr_q ELSE "0";
    i_cmp9_not_rm_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp9_not_rm_memwrite_qi, xout => i_cmp9_not_rm_memwrite_q, clk => clock, aclr => resetn );

    -- redist16_i_cmp6_memwrite_q_1(DELAY,632)
    redist16_i_cmp6_memwrite_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp6_memwrite_q, xout => redist16_i_cmp6_memwrite_q_1_q, clk => clock, aclr => resetn );

    -- i_acl_263_memwrite(LOGICAL,195)@4
    i_acl_263_memwrite_q <= redist16_i_cmp6_memwrite_q_1_q and i_cmp9_not_rm_memwrite_q;

    -- i_acl_263_xor_memwrite(LOGICAL,196)@4
    i_acl_263_xor_memwrite_q <= i_acl_263_memwrite_q xor VCC_q;

    -- i_cmp27_phi_decision269_or270_memwrite(LOGICAL,255)@4
    i_cmp27_phi_decision269_or270_memwrite_q <= i_cmp27_rm_memwrite_q or i_acl_263_xor_memwrite_q;

    -- i_first_cleanup_xor6_or_memwrite(LOGICAL,334)@4 + 1
    i_first_cleanup_xor6_or_memwrite_qi <= i_cmp27_phi_decision269_or270_memwrite_q or i_xor_memwrite_q;
    i_first_cleanup_xor6_or_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_xor6_or_memwrite_qi, xout => i_first_cleanup_xor6_or_memwrite_q, clk => clock, aclr => resetn );

    -- redist14_i_first_cleanup_xor6_or_memwrite_q_6(DELAY,630)
    redist14_i_first_cleanup_xor6_or_memwrite_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_xor6_or_memwrite_q, xout => redist14_i_first_cleanup_xor6_or_memwrite_q_6_q, clk => clock, aclr => resetn );

    -- redist15_i_cmp9_not_rm_memwrite_q_7(DELAY,631)
    redist15_i_cmp9_not_rm_memwrite_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp9_not_rm_memwrite_q, xout => redist15_i_cmp9_not_rm_memwrite_q_7_q, clk => clock, aclr => resetn );

    -- i_unnamed_memwrite30(LOGICAL,466)@3
    i_unnamed_memwrite30_q <= i_acl_pop_i8_inner_loop_018_pop5_memwrite_out_data_out or i_and_rm_memwrite_vt_join_q;

    -- i_acl_262_xor_memwrite(LOGICAL,194)@3 + 1
    i_acl_262_xor_memwrite_qi <= "1" WHEN i_unnamed_memwrite30_q /= c_i8_0gr_q ELSE "0";
    i_acl_262_xor_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_262_xor_memwrite_qi, xout => i_acl_262_xor_memwrite_q, clk => clock, aclr => resetn );

    -- i_cmp27_phi_decision269_or_memwrite(LOGICAL,256)@4
    i_cmp27_phi_decision269_or_memwrite_q <= i_acl_262_xor_memwrite_q or i_cmp27_rm_memwrite_q;

    -- i_first_cleanup_xor_or_memwrite(LOGICAL,336)@4 + 1
    i_first_cleanup_xor_or_memwrite_qi <= i_cmp27_phi_decision269_or_memwrite_q or i_xor_memwrite_q;
    i_first_cleanup_xor_or_memwrite_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_xor_or_memwrite_qi, xout => i_first_cleanup_xor_or_memwrite_q, clk => clock, aclr => resetn );

    -- redist12_i_first_cleanup_xor_or_memwrite_q_6(DELAY,628)
    redist12_i_first_cleanup_xor_or_memwrite_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_xor_or_memwrite_q, xout => redist12_i_first_cleanup_xor_or_memwrite_q_6_q, clk => clock, aclr => resetn );

    -- redist27_i_acl_pipeline_keep_going_memwrite_out_data_out_9(DELAY,643)
    redist27_i_acl_pipeline_keep_going_memwrite_out_data_out_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist26_i_acl_pipeline_keep_going_memwrite_out_data_out_4_q, xout => redist27_i_acl_pipeline_keep_going_memwrite_out_data_out_9_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,127)@10
    out_c0_exi11_0 <= GND_q;
    out_c0_exi11_1 <= redist27_i_acl_pipeline_keep_going_memwrite_out_data_out_9_q;
    out_c0_exi11_2 <= redist12_i_first_cleanup_xor_or_memwrite_q_6_q;
    out_c0_exi11_3 <= redist15_i_cmp9_not_rm_memwrite_q_7_q;
    out_c0_exi11_4 <= redist14_i_first_cleanup_xor6_or_memwrite_q_6_q;
    out_c0_exi11_5 <= redist8_i_reduction_memwrite_29_memwrite_q_7_q;
    out_c0_exi11_6 <= redist5_i_reduction_memwrite_4_memwrite_q_5_q;
    out_c0_exi11_7 <= redist29_i_acl_245_memwrite_q_4_q;
    out_c0_exi11_8 <= redist28_i_acl_251_memwrite_q_4_q;
    out_c0_exi11_9 <= i_arrayidx149_0_memwrite_memwrite104_dupName_0_trunc_sel_x_b;
    out_c0_exi11_10 <= redist13_i_first_cleanup_xor7_or_memwrite_q_6_q;
    out_c0_exi11_11 <= redist9_i_masked_memwrite_q_6_q;
    out_o_valid <= redist39_sync_in_aunroll_x_in_i_valid_9_q;

    -- ext_sig_sync_out(GPOUT,160)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out <= i_acl_pipeline_keep_going_memwrite_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out <= i_acl_pipeline_keep_going_memwrite_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,506)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going_memwrite_out_pipeline_valid_out;

END normal;
