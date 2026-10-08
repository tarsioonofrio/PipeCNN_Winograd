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

-- VHDL created from i_sfc_logic_c1_while_body_memwrite_c1_enter_memwrite150
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

entity i_sfc_logic_c1_while_body_memwrite_c1_enter_memwrite150 is
    port (
        in_c1_eni9_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni9_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_4 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_5 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_6 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_7 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_8 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_9 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_10 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_11 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_12 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni9_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni9_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni9_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni9_16 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni9_17 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni9_18 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni9_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_1 : out std_logic_vector(255 downto 0);  -- ufix256
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_while_body_memwrite_c1_enter_memwrite150;

architecture normal of i_sfc_logic_c1_while_body_memwrite_c1_enter_memwrite150 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite157 is
        port (
            in_data_in : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_3 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_feedback_valid_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_feedback_stall_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite159 is
        port (
            in_c1_ene6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_feedback_stall_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_feedback_out_3 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_feedback_valid_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_mask92_memwrite_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_c_i16_0gr_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_memwrite_memwrite154_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memwrite_memwrite154_0_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_memwrite_memwrite154_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memwrite_memwrite154_1_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_memwrite_memwrite154_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memwrite_memwrite154_2_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_memwrite_memwrite154_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memwrite_memwrite154_3_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_memwrite_memwrite154_4_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memwrite_memwrite154_4_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_memwrite_memwrite154_5_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memwrite_memwrite154_5_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx100_pmg_o_pml_ba_memwrite_sel_x_b : STD_LOGIC_VECTOR (95 downto 0);
    signal i_arrayidx123_pmg_o_pml_ba_memwrite_sel_x_b : STD_LOGIC_VECTOR (95 downto 0);
    signal i_conv78_memwrite_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom114_memwrite_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_pml_s179_memwrite_memwrite162_shift_narrow_x_b : STD_LOGIC_VECTOR (6 downto 0);
    signal i_pml_s_memwrite_memwrite164_shift_narrow_x_b : STD_LOGIC_VECTOR (6 downto 0);
    signal i_pml_t180_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_pml_t_memwrite_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal i_reduction_memwrite_14_compressed_memwrite_memwrite156_reduction_memWrite_14_bitvec_join_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal i_reduction_memwrite_60_compressed_memwrite_memwrite166_reduction_memWrite_60_shuffle_join_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal c_i64_112_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i8_7gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i96_0gr_q : STD_LOGIC_VECTOR (95 downto 0);
    signal i_acl_246_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_246_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_252_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_252_memwrite_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite_out_data_out : STD_LOGIC_VECTOR (95 downto 0);
    signal i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite_out_feedback_stall_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite_out_feedback_out_3 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite_out_feedback_valid_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_95_q : STD_LOGIC_VECTOR (88 downto 0);
    signal i_arrayidx100_pmg_o_pml_ba_memwrite_vt_join_q : STD_LOGIC_VECTOR (95 downto 0);
    signal i_arrayidx100_pmg_o_pml_ba_memwrite_vt_select_6_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_arrayidx100_pmg_s_memwrite_vt_const_63_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx100_pmg_s_memwrite_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx100_pmg_s_memwrite_vt_select_6_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_arrayidx123_pmg_o_pml_ba_memwrite_vt_join_q : STD_LOGIC_VECTOR (95 downto 0);
    signal i_arrayidx123_pmg_o_pml_ba_memwrite_vt_select_6_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_arrayidx123_pmg_s_memwrite_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx123_pmg_s_memwrite_vt_select_6_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_conv78_memwrite_vt_const_63_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_conv78_memwrite_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv78_memwrite_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_idxprom114_memwrite_vt_const_63_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_idxprom114_memwrite_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom114_memwrite_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mask124_memwrite_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mask124_memwrite_vt_const_7_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_mask124_memwrite_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mask124_memwrite_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mask92_memwrite_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_mask92_memwrite_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_mask92_memwrite_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_mask92_memwrite_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_mask92_memwrite_vt_const_63_q : STD_LOGIC_VECTOR (50 downto 0);
    signal i_mask92_memwrite_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mask92_memwrite_vt_select_12_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_memwrite_0_memwrite_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_0_memwrite_q : STD_LOGIC_VECTOR (95 downto 0);
    signal i_sub93_memwrite_vt_const_63_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_sub93_memwrite_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sub93_memwrite_vt_select_11_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx1Rng4_uid209_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_in : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1Rng4_uid209_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_b : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1_uid210_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1Rng32_uid217_i_pml_s179_memwrite_memwrite162_shift_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1Pad32_uid218_i_pml_s179_memwrite_memwrite162_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1_uid219_i_pml_s179_memwrite_memwrite162_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage0Idx2Rng64_uid220_i_pml_s179_memwrite_memwrite162_shift_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2Pad64_uid221_i_pml_s179_memwrite_memwrite162_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx2_uid222_i_pml_s179_memwrite_memwrite162_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage1Idx1Rng16_uid226_i_pml_s179_memwrite_memwrite162_shift_x_b : STD_LOGIC_VECTOR (79 downto 0);
    signal rightShiftStage1Idx1_uid228_i_pml_s179_memwrite_memwrite162_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage1Idx1Rng16_uid244_i_pml_s_memwrite_memwrite164_shift_x_b : STD_LOGIC_VECTOR (79 downto 0);
    signal rightShiftStage1Idx1_uid246_i_pml_s_memwrite_memwrite164_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal leftShiftStage0Idx1Rng4_uid254_i_sub93_memwrite_memwrite163_shift_x_in : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1Rng4_uid254_i_sub93_memwrite_memwrite163_shift_x_b : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1_uid255_i_sub93_memwrite_memwrite163_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx100_pmg_s_memwrite_BitSelect_for_a_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_arrayidx100_pmg_s_memwrite_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStageSel6Dto5_uid224_i_pml_s179_memwrite_memwrite162_shift_x_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid224_i_pml_s179_memwrite_memwrite162_shift_x_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStageSel6Dto5_uid242_i_pml_s_memwrite_memwrite164_shift_x_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid242_i_pml_s_memwrite_memwrite164_shift_x_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_f : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_g : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_h : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_i : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_j : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_k : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_l : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_m : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_p : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_r : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_t : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_u : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_v : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_w : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_y : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_z : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_bb : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_cc : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_dd : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ee : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ff : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_gg : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_hh : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ii : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_jj : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_kk : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ll : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_mm : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_nn : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_oo : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_pp : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_qq : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_rr : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ss : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_tt : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_uu : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_vv : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ww : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_xx : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_yy : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_zz : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o61 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o62 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o63 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o64 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o65 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o66 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o67 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o68 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o69 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o70 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o71 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o72 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o73 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o74 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o75 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o76 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o77 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o78 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o79 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o80 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o81 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o82 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o83 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o84 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o85 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o86 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o87 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o88 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o89 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o90 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o91 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o92 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o93 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o94 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o95 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sync_in_aunroll_x_in_c1_eni9_19_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_pml_t_memwrite_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist1_sync_in_aunroll_x_in_i_valid_1(DELAY,272)
    redist1_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist1_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- dupName_3_c_i16_0gr_x(CONSTANT,4)
    dupName_3_c_i16_0gr_x_q <= "0000000000000000";

    -- rightShiftStage1Idx1Rng16_uid244_i_pml_s_memwrite_memwrite164_shift_x(BITSELECT,243)@13
    rightShiftStage1Idx1Rng16_uid244_i_pml_s_memwrite_memwrite164_shift_x_b <= rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q(95 downto 16);

    -- rightShiftStage1Idx1_uid246_i_pml_s_memwrite_memwrite164_shift_x(BITJOIN,245)@13
    rightShiftStage1Idx1_uid246_i_pml_s_memwrite_memwrite164_shift_x_q <= dupName_3_c_i16_0gr_x_q & rightShiftStage1Idx1Rng16_uid244_i_pml_s_memwrite_memwrite164_shift_x_b;

    -- c_i96_0gr(CONSTANT,156)
    c_i96_0gr_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx2Pad64_uid221_i_pml_s179_memwrite_memwrite162_shift_x(CONSTANT,220)
    rightShiftStage0Idx2Pad64_uid221_i_pml_s179_memwrite_memwrite162_shift_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng64_uid220_i_pml_s179_memwrite_memwrite162_shift_x(BITSELECT,219)@13
    rightShiftStage0Idx2Rng64_uid220_i_pml_s179_memwrite_memwrite162_shift_x_b <= i_reduction_memwrite_0_memwrite_q(95 downto 64);

    -- rightShiftStage0Idx2_uid222_i_pml_s179_memwrite_memwrite162_shift_x(BITJOIN,221)@13
    rightShiftStage0Idx2_uid222_i_pml_s179_memwrite_memwrite162_shift_x_q <= rightShiftStage0Idx2Pad64_uid221_i_pml_s179_memwrite_memwrite162_shift_x_q & rightShiftStage0Idx2Rng64_uid220_i_pml_s179_memwrite_memwrite162_shift_x_b;

    -- rightShiftStage0Idx1Pad32_uid218_i_pml_s179_memwrite_memwrite162_shift_x(CONSTANT,217)
    rightShiftStage0Idx1Pad32_uid218_i_pml_s179_memwrite_memwrite162_shift_x_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx1Rng32_uid217_i_pml_s179_memwrite_memwrite162_shift_x(BITSELECT,216)@13
    rightShiftStage0Idx1Rng32_uid217_i_pml_s179_memwrite_memwrite162_shift_x_b <= i_reduction_memwrite_0_memwrite_q(95 downto 32);

    -- rightShiftStage0Idx1_uid219_i_pml_s179_memwrite_memwrite162_shift_x(BITJOIN,218)@13
    rightShiftStage0Idx1_uid219_i_pml_s179_memwrite_memwrite162_shift_x_q <= rightShiftStage0Idx1Pad32_uid218_i_pml_s179_memwrite_memwrite162_shift_x_q & rightShiftStage0Idx1Rng32_uid217_i_pml_s179_memwrite_memwrite162_shift_x_b;

    -- i_acl_memwrite_memwrite154_5_x(MUX,10)@13
    i_acl_memwrite_memwrite154_5_x_s <= in_c1_eni9_13;
    i_acl_memwrite_memwrite154_5_x_combproc: PROCESS (i_acl_memwrite_memwrite154_5_x_s, in_c1_eni9_6, in_c1_eni9_12)
    BEGIN
        CASE (i_acl_memwrite_memwrite154_5_x_s) IS
            WHEN "0" => i_acl_memwrite_memwrite154_5_x_q <= in_c1_eni9_6;
            WHEN "1" => i_acl_memwrite_memwrite154_5_x_q <= in_c1_eni9_12;
            WHEN OTHERS => i_acl_memwrite_memwrite154_5_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_memwrite_memwrite154_4_x(MUX,9)@13
    i_acl_memwrite_memwrite154_4_x_s <= in_c1_eni9_13;
    i_acl_memwrite_memwrite154_4_x_combproc: PROCESS (i_acl_memwrite_memwrite154_4_x_s, in_c1_eni9_5, in_c1_eni9_11)
    BEGIN
        CASE (i_acl_memwrite_memwrite154_4_x_s) IS
            WHEN "0" => i_acl_memwrite_memwrite154_4_x_q <= in_c1_eni9_5;
            WHEN "1" => i_acl_memwrite_memwrite154_4_x_q <= in_c1_eni9_11;
            WHEN OTHERS => i_acl_memwrite_memwrite154_4_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_memwrite_memwrite154_3_x(MUX,8)@13
    i_acl_memwrite_memwrite154_3_x_s <= in_c1_eni9_13;
    i_acl_memwrite_memwrite154_3_x_combproc: PROCESS (i_acl_memwrite_memwrite154_3_x_s, in_c1_eni9_4, in_c1_eni9_10)
    BEGIN
        CASE (i_acl_memwrite_memwrite154_3_x_s) IS
            WHEN "0" => i_acl_memwrite_memwrite154_3_x_q <= in_c1_eni9_4;
            WHEN "1" => i_acl_memwrite_memwrite154_3_x_q <= in_c1_eni9_10;
            WHEN OTHERS => i_acl_memwrite_memwrite154_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_memwrite_memwrite154_2_x(MUX,7)@13
    i_acl_memwrite_memwrite154_2_x_s <= in_c1_eni9_13;
    i_acl_memwrite_memwrite154_2_x_combproc: PROCESS (i_acl_memwrite_memwrite154_2_x_s, in_c1_eni9_3, in_c1_eni9_9)
    BEGIN
        CASE (i_acl_memwrite_memwrite154_2_x_s) IS
            WHEN "0" => i_acl_memwrite_memwrite154_2_x_q <= in_c1_eni9_3;
            WHEN "1" => i_acl_memwrite_memwrite154_2_x_q <= in_c1_eni9_9;
            WHEN OTHERS => i_acl_memwrite_memwrite154_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_memwrite_memwrite154_1_x(MUX,6)@13
    i_acl_memwrite_memwrite154_1_x_s <= in_c1_eni9_13;
    i_acl_memwrite_memwrite154_1_x_combproc: PROCESS (i_acl_memwrite_memwrite154_1_x_s, in_c1_eni9_2, in_c1_eni9_8)
    BEGIN
        CASE (i_acl_memwrite_memwrite154_1_x_s) IS
            WHEN "0" => i_acl_memwrite_memwrite154_1_x_q <= in_c1_eni9_2;
            WHEN "1" => i_acl_memwrite_memwrite154_1_x_q <= in_c1_eni9_8;
            WHEN OTHERS => i_acl_memwrite_memwrite154_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_memwrite_memwrite154_0_x(MUX,5)@13
    i_acl_memwrite_memwrite154_0_x_s <= in_c1_eni9_13;
    i_acl_memwrite_memwrite154_0_x_combproc: PROCESS (i_acl_memwrite_memwrite154_0_x_s, in_c1_eni9_1, in_c1_eni9_7)
    BEGIN
        CASE (i_acl_memwrite_memwrite154_0_x_s) IS
            WHEN "0" => i_acl_memwrite_memwrite154_0_x_q <= in_c1_eni9_1;
            WHEN "1" => i_acl_memwrite_memwrite154_0_x_q <= in_c1_eni9_7;
            WHEN OTHERS => i_acl_memwrite_memwrite154_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x(BITJOIN,125)@13
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q <= i_acl_memwrite_memwrite154_5_x_q & i_acl_memwrite_memwrite154_4_x_q & i_acl_memwrite_memwrite154_3_x_q & i_acl_memwrite_memwrite154_2_x_q & i_acl_memwrite_memwrite154_1_x_q & i_acl_memwrite_memwrite154_0_x_q;

    -- i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select(BITSELECT,269)@13
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_b <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(0 downto 0);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_c <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(1 downto 1);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_d <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(10 downto 10);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_e <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(11 downto 11);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_f <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(12 downto 12);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_g <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(13 downto 13);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_h <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(14 downto 14);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_i <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(15 downto 15);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_j <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(16 downto 16);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_k <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(17 downto 17);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_l <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(18 downto 18);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_m <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(19 downto 19);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_n <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(2 downto 2);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(20 downto 20);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_p <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(21 downto 21);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_q <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(22 downto 22);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_r <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(23 downto 23);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_s <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(24 downto 24);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_t <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(25 downto 25);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_u <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(26 downto 26);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_v <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(27 downto 27);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_w <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(28 downto 28);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_x <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(29 downto 29);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_y <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(3 downto 3);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_z <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(30 downto 30);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_aa <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(31 downto 31);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_bb <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(32 downto 32);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_cc <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(33 downto 33);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_dd <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(34 downto 34);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ee <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(35 downto 35);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ff <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(36 downto 36);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_gg <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(37 downto 37);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_hh <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(38 downto 38);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ii <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(39 downto 39);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_jj <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(4 downto 4);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_kk <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(40 downto 40);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ll <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(41 downto 41);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_mm <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(42 downto 42);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_nn <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(43 downto 43);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_oo <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(44 downto 44);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_pp <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(45 downto 45);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_qq <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(46 downto 46);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_rr <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(47 downto 47);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ss <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(48 downto 48);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_tt <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(49 downto 49);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_uu <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(5 downto 5);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_vv <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(50 downto 50);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ww <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(51 downto 51);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_xx <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(52 downto 52);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_yy <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(53 downto 53);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_zz <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(54 downto 54);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_1 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(55 downto 55);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_2 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(56 downto 56);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_3 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(57 downto 57);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_4 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(58 downto 58);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_5 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(59 downto 59);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_6 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(6 downto 6);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_7 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(60 downto 60);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_8 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(61 downto 61);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_9 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(62 downto 62);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_0 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(63 downto 63);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o61 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(64 downto 64);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o62 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(65 downto 65);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o63 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(66 downto 66);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o64 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(67 downto 67);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o65 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(68 downto 68);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o66 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(69 downto 69);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o67 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(7 downto 7);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o68 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(70 downto 70);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o69 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(71 downto 71);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o70 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(72 downto 72);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o71 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(73 downto 73);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o72 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(74 downto 74);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o73 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(75 downto 75);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o74 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(76 downto 76);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o75 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(77 downto 77);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o76 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(78 downto 78);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o77 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(79 downto 79);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o78 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(8 downto 8);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o79 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(80 downto 80);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o80 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(81 downto 81);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o81 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(82 downto 82);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o82 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(83 downto 83);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o83 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(84 downto 84);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o84 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(85 downto 85);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o85 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(86 downto 86);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o86 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(87 downto 87);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o87 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(88 downto 88);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o88 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(89 downto 89);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o89 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(9 downto 9);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o90 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(90 downto 90);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o91 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(91 downto 91);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o92 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(92 downto 92);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o93 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(93 downto 93);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o94 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(94 downto 94);
    i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o95 <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_vec_5_join_x_q(95 downto 95);

    -- i_reduction_memwrite_14_compressed_memwrite_memwrite156_reduction_memWrite_14_bitvec_join_x(BITJOIN,126)@13
    i_reduction_memwrite_14_compressed_memwrite_memwrite156_reduction_memWrite_14_bitvec_join_x_q <= i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o95 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o94 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o93 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o92 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o91 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o90 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o88 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o87 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o86 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o85 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o84 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o83 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o82 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o81 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o80 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o79 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o77 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o76 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o75 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o74 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o73 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o72 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o71 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o70 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o69 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o68 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o66 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o65 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o64 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o63 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o62 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o61 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_0 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_9 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_8 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_7 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_5 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_4 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_3 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_2 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_1 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_zz & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_yy & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_xx & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ww & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_vv & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_tt & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ss & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_rr & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_qq & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_pp & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_oo & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_nn & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_mm & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ll & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_kk & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ii & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_hh & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_gg & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ff & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_ee & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_dd & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_cc & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_bb & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_aa & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_z & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_x & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_w & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_v & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_u & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_t & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_s & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_r & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o89 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o78 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_o67 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_6 & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_uu & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_jj & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_y & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_14_bitvec_memwrite_memwrite155_reduction_memWrite_14_bitvec_select_0_x_merged_bit_select_b;

    -- i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite(BLACKBOX,160)@13
    -- out out_feedback_out_3@20000000
    -- out out_feedback_valid_out_3@20000000
    thei_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite : i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite159
    PORT MAP (
        in_c1_ene6 => in_c1_eni9_16,
        in_data_in => i_reduction_memwrite_0_memwrite_q,
        in_feedback_stall_in_3 => i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite_out_feedback_stall_out_3,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_3 => i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite_out_feedback_out_3,
        out_feedback_valid_out_3 => i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite_out_feedback_valid_out_3,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite(BLACKBOX,159)@13
    -- out out_feedback_stall_out_3@20000000
    thei_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite : i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite157
    PORT MAP (
        in_data_in => c_i96_0gr_q,
        in_dir => in_c1_eni9_14,
        in_feedback_in_3 => i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite_out_feedback_out_3,
        in_feedback_valid_in_3 => i_acl_push_i96_ch_data_0_0_0_pm_0_push3_memwrite_out_feedback_valid_out_3,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite_out_data_out,
        out_feedback_stall_out_3 => i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite_out_feedback_stall_out_3,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_memwrite_0_memwrite(MUX,199)@13
    i_reduction_memwrite_0_memwrite_s <= in_c1_eni9_15;
    i_reduction_memwrite_0_memwrite_combproc: PROCESS (i_reduction_memwrite_0_memwrite_s, i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite_out_data_out, i_reduction_memwrite_14_compressed_memwrite_memwrite156_reduction_memWrite_14_bitvec_join_x_q)
    BEGIN
        CASE (i_reduction_memwrite_0_memwrite_s) IS
            WHEN "0" => i_reduction_memwrite_0_memwrite_q <= i_acl_pop_i96_ch_data_0_0_0_pm_0_pop3_memwrite_out_data_out;
            WHEN "1" => i_reduction_memwrite_0_memwrite_q <= i_reduction_memwrite_14_compressed_memwrite_memwrite156_reduction_memWrite_14_bitvec_join_x_q;
            WHEN OTHERS => i_reduction_memwrite_0_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x(MUX,242)@13
    rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_s <= rightShiftStageSel6Dto5_uid242_i_pml_s_memwrite_memwrite164_shift_x_merged_bit_select_b;
    rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_combproc: PROCESS (rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_s, i_reduction_memwrite_0_memwrite_q, rightShiftStage0Idx1_uid219_i_pml_s179_memwrite_memwrite162_shift_x_q, rightShiftStage0Idx2_uid222_i_pml_s179_memwrite_memwrite162_shift_x_q, c_i96_0gr_q)
    BEGIN
        CASE (rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q <= i_reduction_memwrite_0_memwrite_q;
            WHEN "01" => rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q <= rightShiftStage0Idx1_uid219_i_pml_s179_memwrite_memwrite162_shift_x_q;
            WHEN "10" => rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q <= rightShiftStage0Idx2_uid222_i_pml_s179_memwrite_memwrite162_shift_x_q;
            WHEN "11" => rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q <= c_i96_0gr_q;
            WHEN OTHERS => rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_95(CONSTANT,163)
    i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_95_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- i_arrayidx100_pmg_s_memwrite_vt_const_63(CONSTANT,168)
    i_arrayidx100_pmg_s_memwrite_vt_const_63_q <= "000000000000000000000000000000000000000000000000000000000";

    -- i_mask92_memwrite_vt_const_63(CONSTANT,194)
    i_mask92_memwrite_vt_const_63_q <= "000000000000000000000000000000000000000000000000000";

    -- c_i64_112(CONSTANT,153)
    c_i64_112_q <= "0000000000000000000000000000000000000000000000000000000001110000";

    -- i_sub93_memwrite_vt_const_63(CONSTANT,201)
    i_sub93_memwrite_vt_const_63_q <= "0000000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng4_uid254_i_sub93_memwrite_memwrite163_shift_x(BITSELECT,253)@13
    leftShiftStage0Idx1Rng4_uid254_i_sub93_memwrite_memwrite163_shift_x_in <= i_conv78_memwrite_vt_join_q(59 downto 0);
    leftShiftStage0Idx1Rng4_uid254_i_sub93_memwrite_memwrite163_shift_x_b <= leftShiftStage0Idx1Rng4_uid254_i_sub93_memwrite_memwrite163_shift_x_in(59 downto 0);

    -- leftShiftStage0Idx1_uid255_i_sub93_memwrite_memwrite163_shift_x(BITJOIN,254)@13
    leftShiftStage0Idx1_uid255_i_sub93_memwrite_memwrite163_shift_x_q <= leftShiftStage0Idx1Rng4_uid254_i_sub93_memwrite_memwrite163_shift_x_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_conv78_memwrite_vt_const_63(CONSTANT,181)
    i_conv78_memwrite_vt_const_63_q <= "00000000000000000000000000000000000000000000000000000000";

    -- i_conv78_memwrite_sel_x(BITSELECT,17)@13
    i_conv78_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(in_c1_eni9_17(7 downto 0)), 64));

    -- i_conv78_memwrite_vt_select_7(BITSELECT,183)@13
    i_conv78_memwrite_vt_select_7_b <= i_conv78_memwrite_sel_x_b(7 downto 0);

    -- i_conv78_memwrite_vt_join(BITJOIN,182)@13
    i_conv78_memwrite_vt_join_q <= i_conv78_memwrite_vt_const_63_q & i_conv78_memwrite_vt_select_7_b;

    -- leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x(MUX,256)@13
    leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_s <= VCC_q;
    leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_combproc: PROCESS (leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_s, i_conv78_memwrite_vt_join_q, leftShiftStage0Idx1_uid255_i_sub93_memwrite_memwrite163_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_q <= i_conv78_memwrite_vt_join_q;
            WHEN "1" => leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_q <= leftShiftStage0Idx1_uid255_i_sub93_memwrite_memwrite163_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_sub93_memwrite_vt_select_11(BITSELECT,203)@13
    i_sub93_memwrite_vt_select_11_b <= leftShiftStage0_uid257_i_sub93_memwrite_memwrite163_shift_x_q(11 downto 4);

    -- i_sub93_memwrite_vt_join(BITJOIN,202)@13
    i_sub93_memwrite_vt_join_q <= i_sub93_memwrite_vt_const_63_q & i_sub93_memwrite_vt_select_11_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_mask92_memwrite(ADD,192)@13
    i_mask92_memwrite_a <= STD_LOGIC_VECTOR("0" & i_sub93_memwrite_vt_join_q);
    i_mask92_memwrite_b <= STD_LOGIC_VECTOR("0" & c_i64_112_q);
    i_mask92_memwrite_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mask92_memwrite_a) + UNSIGNED(i_mask92_memwrite_b));
    i_mask92_memwrite_q <= i_mask92_memwrite_o(64 downto 0);

    -- bgTrunc_i_mask92_memwrite_sel_x(BITSELECT,2)@13
    bgTrunc_i_mask92_memwrite_sel_x_b <= i_mask92_memwrite_q(63 downto 0);

    -- i_mask92_memwrite_vt_select_12(BITSELECT,196)@13
    i_mask92_memwrite_vt_select_12_b <= bgTrunc_i_mask92_memwrite_sel_x_b(12 downto 4);

    -- i_mask92_memwrite_vt_join(BITJOIN,195)@13
    i_mask92_memwrite_vt_join_q <= i_mask92_memwrite_vt_const_63_q & i_mask92_memwrite_vt_select_12_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_arrayidx100_pmg_s_memwrite_BitSelect_for_a(BITSELECT,260)@13
    i_arrayidx100_pmg_s_memwrite_BitSelect_for_a_b <= i_mask92_memwrite_vt_join_q(6 downto 4);

    -- i_arrayidx100_pmg_s_memwrite_join(BITJOIN,261)@13
    i_arrayidx100_pmg_s_memwrite_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_arrayidx100_pmg_s_memwrite_BitSelect_for_a_b & GND_q & GND_q & GND_q & GND_q;

    -- i_arrayidx100_pmg_s_memwrite_vt_select_6(BITSELECT,170)@13
    i_arrayidx100_pmg_s_memwrite_vt_select_6_b <= i_arrayidx100_pmg_s_memwrite_join_q(6 downto 4);

    -- i_arrayidx100_pmg_s_memwrite_vt_join(BITJOIN,169)@13
    i_arrayidx100_pmg_s_memwrite_vt_join_q <= i_arrayidx100_pmg_s_memwrite_vt_const_63_q & i_arrayidx100_pmg_s_memwrite_vt_select_6_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_arrayidx100_pmg_o_pml_ba_memwrite_sel_x(BITSELECT,11)@13
    i_arrayidx100_pmg_o_pml_ba_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_arrayidx100_pmg_s_memwrite_vt_join_q(63 downto 0)), 96));

    -- i_arrayidx100_pmg_o_pml_ba_memwrite_vt_select_6(BITSELECT,165)@13
    i_arrayidx100_pmg_o_pml_ba_memwrite_vt_select_6_b <= i_arrayidx100_pmg_o_pml_ba_memwrite_sel_x_b(6 downto 4);

    -- i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3(CONSTANT,162)
    i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q <= "0000";

    -- i_arrayidx100_pmg_o_pml_ba_memwrite_vt_join(BITJOIN,164)@13
    i_arrayidx100_pmg_o_pml_ba_memwrite_vt_join_q <= i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_95_q & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_select_6_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_pml_s_memwrite_memwrite164_shift_narrow_x(BITSELECT,26)@13
    i_pml_s_memwrite_memwrite164_shift_narrow_x_b <= i_arrayidx100_pmg_o_pml_ba_memwrite_vt_join_q(6 downto 0);

    -- rightShiftStageSel6Dto5_uid242_i_pml_s_memwrite_memwrite164_shift_x_merged_bit_select(BITSELECT,268)@13
    rightShiftStageSel6Dto5_uid242_i_pml_s_memwrite_memwrite164_shift_x_merged_bit_select_b <= i_pml_s_memwrite_memwrite164_shift_narrow_x_b(6 downto 5);
    rightShiftStageSel6Dto5_uid242_i_pml_s_memwrite_memwrite164_shift_x_merged_bit_select_c <= i_pml_s_memwrite_memwrite164_shift_narrow_x_b(4 downto 4);

    -- rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x(MUX,247)@13
    rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_s <= rightShiftStageSel6Dto5_uid242_i_pml_s_memwrite_memwrite164_shift_x_merged_bit_select_c;
    rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_combproc: PROCESS (rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_s, rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q, rightShiftStage1Idx1_uid246_i_pml_s_memwrite_memwrite164_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_q <= rightShiftStage0_uid243_i_pml_s_memwrite_memwrite164_shift_x_q;
            WHEN "1" => rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_q <= rightShiftStage1Idx1_uid246_i_pml_s_memwrite_memwrite164_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_pml_t_memwrite_sel_x(BITSELECT,28)@13
    i_pml_t_memwrite_sel_x_b <= rightShiftStage1_uid248_i_pml_s_memwrite_memwrite164_shift_x_q(15 downto 0);

    -- redist2_i_pml_t_memwrite_sel_x_b_1(DELAY,273)
    redist2_i_pml_t_memwrite_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_pml_t_memwrite_sel_x_b, xout => redist2_i_pml_t_memwrite_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage1Idx1Rng16_uid226_i_pml_s179_memwrite_memwrite162_shift_x(BITSELECT,225)@13
    rightShiftStage1Idx1Rng16_uid226_i_pml_s179_memwrite_memwrite162_shift_x_b <= rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q(95 downto 16);

    -- rightShiftStage1Idx1_uid228_i_pml_s179_memwrite_memwrite162_shift_x(BITJOIN,227)@13
    rightShiftStage1Idx1_uid228_i_pml_s179_memwrite_memwrite162_shift_x_q <= dupName_3_c_i16_0gr_x_q & rightShiftStage1Idx1Rng16_uid226_i_pml_s179_memwrite_memwrite162_shift_x_b;

    -- rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x(MUX,224)@13
    rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_s <= rightShiftStageSel6Dto5_uid224_i_pml_s179_memwrite_memwrite162_shift_x_merged_bit_select_b;
    rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_combproc: PROCESS (rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_s, i_reduction_memwrite_0_memwrite_q, rightShiftStage0Idx1_uid219_i_pml_s179_memwrite_memwrite162_shift_x_q, rightShiftStage0Idx2_uid222_i_pml_s179_memwrite_memwrite162_shift_x_q, c_i96_0gr_q)
    BEGIN
        CASE (rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q <= i_reduction_memwrite_0_memwrite_q;
            WHEN "01" => rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q <= rightShiftStage0Idx1_uid219_i_pml_s179_memwrite_memwrite162_shift_x_q;
            WHEN "10" => rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q <= rightShiftStage0Idx2_uid222_i_pml_s179_memwrite_memwrite162_shift_x_q;
            WHEN "11" => rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q <= c_i96_0gr_q;
            WHEN OTHERS => rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx1Rng4_uid209_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x(BITSELECT,208)@13
    leftShiftStage0Idx1Rng4_uid209_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_in <= i_idxprom114_memwrite_vt_join_q(59 downto 0);
    leftShiftStage0Idx1Rng4_uid209_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_b <= leftShiftStage0Idx1Rng4_uid209_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_in(59 downto 0);

    -- leftShiftStage0Idx1_uid210_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x(BITJOIN,209)@13
    leftShiftStage0Idx1_uid210_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q <= leftShiftStage0Idx1Rng4_uid209_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_idxprom114_memwrite_vt_const_63(CONSTANT,185)
    i_idxprom114_memwrite_vt_const_63_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- i_mask124_memwrite_vt_const_7(CONSTANT,189)
    i_mask124_memwrite_vt_const_7_q <= "00000";

    -- c_i8_7gr(CONSTANT,155)
    c_i8_7gr_q <= "00000111";

    -- i_mask124_memwrite(LOGICAL,188)@13
    i_mask124_memwrite_q <= in_c1_eni9_17 and c_i8_7gr_q;

    -- i_mask124_memwrite_vt_select_2(BITSELECT,191)@13
    i_mask124_memwrite_vt_select_2_b <= i_mask124_memwrite_q(2 downto 0);

    -- i_mask124_memwrite_vt_join(BITJOIN,190)@13
    i_mask124_memwrite_vt_join_q <= i_mask124_memwrite_vt_const_7_q & i_mask124_memwrite_vt_select_2_b;

    -- i_idxprom114_memwrite_sel_x(BITSELECT,18)@13
    i_idxprom114_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_mask124_memwrite_vt_join_q(7 downto 0)), 64));

    -- i_idxprom114_memwrite_vt_select_2(BITSELECT,187)@13
    i_idxprom114_memwrite_vt_select_2_b <= i_idxprom114_memwrite_sel_x_b(2 downto 0);

    -- i_idxprom114_memwrite_vt_join(BITJOIN,186)@13
    i_idxprom114_memwrite_vt_join_q <= i_idxprom114_memwrite_vt_const_63_q & i_idxprom114_memwrite_vt_select_2_b;

    -- leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x(MUX,211)@13
    leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_s <= VCC_q;
    leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_combproc: PROCESS (leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_s, i_idxprom114_memwrite_vt_join_q, leftShiftStage0Idx1_uid210_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q <= i_idxprom114_memwrite_vt_join_q;
            WHEN "1" => leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q <= leftShiftStage0Idx1_uid210_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_arrayidx123_pmg_s_memwrite_vt_select_6(BITSELECT,179)@13
    i_arrayidx123_pmg_s_memwrite_vt_select_6_b <= leftShiftStage0_uid212_i_arrayidx123_pmg_s_memwrite_memwrite161_shift_x_q(6 downto 4);

    -- i_arrayidx123_pmg_s_memwrite_vt_join(BITJOIN,178)@13
    i_arrayidx123_pmg_s_memwrite_vt_join_q <= i_arrayidx100_pmg_s_memwrite_vt_const_63_q & i_arrayidx123_pmg_s_memwrite_vt_select_6_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_arrayidx123_pmg_o_pml_ba_memwrite_sel_x(BITSELECT,12)@13
    i_arrayidx123_pmg_o_pml_ba_memwrite_sel_x_b <= std_logic_vector(resize(unsigned(i_arrayidx123_pmg_s_memwrite_vt_join_q(63 downto 0)), 96));

    -- i_arrayidx123_pmg_o_pml_ba_memwrite_vt_select_6(BITSELECT,175)@13
    i_arrayidx123_pmg_o_pml_ba_memwrite_vt_select_6_b <= i_arrayidx123_pmg_o_pml_ba_memwrite_sel_x_b(6 downto 4);

    -- i_arrayidx123_pmg_o_pml_ba_memwrite_vt_join(BITJOIN,174)@13
    i_arrayidx123_pmg_o_pml_ba_memwrite_vt_join_q <= i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_95_q & i_arrayidx123_pmg_o_pml_ba_memwrite_vt_select_6_b & i_arrayidx100_pmg_o_pml_ba_memwrite_vt_const_3_q;

    -- i_pml_s179_memwrite_memwrite162_shift_narrow_x(BITSELECT,22)@13
    i_pml_s179_memwrite_memwrite162_shift_narrow_x_b <= i_arrayidx123_pmg_o_pml_ba_memwrite_vt_join_q(6 downto 0);

    -- rightShiftStageSel6Dto5_uid224_i_pml_s179_memwrite_memwrite162_shift_x_merged_bit_select(BITSELECT,267)@13
    rightShiftStageSel6Dto5_uid224_i_pml_s179_memwrite_memwrite162_shift_x_merged_bit_select_b <= i_pml_s179_memwrite_memwrite162_shift_narrow_x_b(6 downto 5);
    rightShiftStageSel6Dto5_uid224_i_pml_s179_memwrite_memwrite162_shift_x_merged_bit_select_c <= i_pml_s179_memwrite_memwrite162_shift_narrow_x_b(4 downto 4);

    -- rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x(MUX,229)@13
    rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_s <= rightShiftStageSel6Dto5_uid224_i_pml_s179_memwrite_memwrite162_shift_x_merged_bit_select_c;
    rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_combproc: PROCESS (rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_s, rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q, rightShiftStage1Idx1_uid228_i_pml_s179_memwrite_memwrite162_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_q <= rightShiftStage0_uid225_i_pml_s179_memwrite_memwrite162_shift_x_q;
            WHEN "1" => rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_q <= rightShiftStage1Idx1_uid228_i_pml_s179_memwrite_memwrite162_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_pml_t180_memwrite_sel_x(BITSELECT,27)@13
    i_pml_t180_memwrite_sel_x_b <= rightShiftStage1_uid230_i_pml_s179_memwrite_memwrite162_shift_x_q(15 downto 0);

    -- i_acl_246_memwrite(MUX,157)@13 + 1
    i_acl_246_memwrite_s <= in_c1_eni9_18;
    i_acl_246_memwrite_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_246_memwrite_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_246_memwrite_s) IS
                WHEN "0" => i_acl_246_memwrite_q <= dupName_3_c_i16_0gr_x_q;
                WHEN "1" => i_acl_246_memwrite_q <= i_pml_t180_memwrite_sel_x_b;
                WHEN OTHERS => i_acl_246_memwrite_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_sync_in_aunroll_x_in_c1_eni9_19_1(DELAY,271)
    redist0_sync_in_aunroll_x_in_c1_eni9_19_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni9_19, xout => redist0_sync_in_aunroll_x_in_c1_eni9_19_1_q, clk => clock, aclr => resetn );

    -- i_acl_252_memwrite(MUX,158)@14
    i_acl_252_memwrite_s <= redist0_sync_in_aunroll_x_in_c1_eni9_19_1_q;
    i_acl_252_memwrite_combproc: PROCESS (i_acl_252_memwrite_s, i_acl_246_memwrite_q, redist2_i_pml_t_memwrite_sel_x_b_1_q)
    BEGIN
        CASE (i_acl_252_memwrite_s) IS
            WHEN "0" => i_acl_252_memwrite_q <= i_acl_246_memwrite_q;
            WHEN "1" => i_acl_252_memwrite_q <= redist2_i_pml_t_memwrite_sel_x_b_1_q;
            WHEN OTHERS => i_acl_252_memwrite_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select(BITSELECT,270)@14
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b <= i_acl_252_memwrite_q(0 downto 0);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c <= i_acl_252_memwrite_q(1 downto 1);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d <= i_acl_252_memwrite_q(10 downto 10);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e <= i_acl_252_memwrite_q(11 downto 11);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f <= i_acl_252_memwrite_q(12 downto 12);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g <= i_acl_252_memwrite_q(13 downto 13);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h <= i_acl_252_memwrite_q(14 downto 14);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i <= i_acl_252_memwrite_q(15 downto 15);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j <= i_acl_252_memwrite_q(2 downto 2);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k <= i_acl_252_memwrite_q(3 downto 3);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l <= i_acl_252_memwrite_q(4 downto 4);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m <= i_acl_252_memwrite_q(5 downto 5);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n <= i_acl_252_memwrite_q(6 downto 6);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o <= i_acl_252_memwrite_q(7 downto 7);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p <= i_acl_252_memwrite_q(8 downto 8);
    i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q <= i_acl_252_memwrite_q(9 downto 9);

    -- i_reduction_memwrite_60_compressed_memwrite_memwrite166_reduction_memWrite_60_shuffle_join_x(BITJOIN,144)@14
    i_reduction_memwrite_60_compressed_memwrite_memwrite166_reduction_memWrite_60_shuffle_join_x_q <= i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_i & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_h & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_g & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_f & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_e & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_d & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_q & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_p & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_o & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_n & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_m & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_l & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_k & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_j & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_c & i_reduction_memwrite_60_bitvec_memwrite_memwrite165_reduction_memWrite_60_bitvec_select_0_x_merged_bit_select_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,150)@14
    out_c1_exi1_0 <= GND_q;
    out_c1_exi1_1 <= i_reduction_memwrite_60_compressed_memwrite_memwrite166_reduction_memWrite_60_shuffle_join_x_q;
    out_o_valid <= redist1_sync_in_aunroll_x_in_i_valid_1_q;

END normal;
