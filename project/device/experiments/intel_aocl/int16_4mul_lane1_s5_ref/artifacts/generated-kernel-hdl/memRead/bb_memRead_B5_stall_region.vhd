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

-- VHDL created from bb_memRead_B5_stall_region
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

entity bb_memRead_B5_stall_region is
    port (
        in_c0_exe109775 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe119787 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe129799 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1398011 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1498113 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1598215 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1698317 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1798419 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1898521 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe1998623 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2098725 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2298929 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2399031 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2499133 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2599235 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2699337 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe2799439 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit100843_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit100843_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit102044_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit102044_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exit103245_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit103245_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c3_exit46_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exit46_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c4_exit47_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c4_exit47_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c5_exit48_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c5_exit48_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi121 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_16_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_16_avm_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        out_memdep_16_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2098725 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_iowr_bl_bypass_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_bypass_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- ufix96
        out_iowr_bl_bypass_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        in_frac_b : in std_logic_vector(7 downto 0);  -- ufix8
        in_iowr_bl_pool_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_pool_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- ufix96
        out_iowr_bl_pool_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        in_frac_din : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_dout : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_w : in std_logic_vector(7 downto 0);  -- ufix8
        in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0152_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0152_avm_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        out_memcoalesce_null_load_0152_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_out_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_29 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_9 : out std_logic_vector(31 downto 0);  -- ufix32
        in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_29 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_9 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_29 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_9 : out std_logic_vector(0 downto 0);  -- ufix1
        in_control : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_memRead_B5_stall_region;

architecture normal of bb_memRead_B5_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_iowr_bl_bypass_ch_unnamed_memread8_memread2596 is
        port (
            in_i_data_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_cmp12532_phi_decision2458_or2462 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iowr_bl_bypass_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_bypass_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_iowr_bl_bypass_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_ack : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_iowr_bl_pool_ch_unnamed_memread9_memread2597 is
        port (
            in_i_data_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_cmp12532_phi_decision2458_or2463 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iowr_bl_pool_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_pool_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_iowr_bl_pool_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_ack : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_end624_memread_c0_enter1053_memread is
        port (
            in_c0_eni191052_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni191052_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni191052_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni191052_14 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni191052_15 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni191052_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni191052_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni191052_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni191052_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_control : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_frac_b : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_frac_din : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_frac_dout : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_frac_w : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1081_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1081_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1081_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1081_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1081_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1081_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1081_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1081_7 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_8 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_9 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_10 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_11 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_12 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_13 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_14 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_15 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_16 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_17 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exit1081_18 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_16_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_16_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memdep_16_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi10_push29_memread2521 is
        port (
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_29 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread2584 is
        port (
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread2586 is
        port (
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread2588 is
        port (
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread2590 is
        port (
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread2592 is
        port (
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread2594 is
        port (
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;





    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_iowr_bl_bypass_ch_o_fifodata : STD_LOGIC_VECTOR (95 downto 0);
    signal i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_iowr_bl_bypass_ch_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_iowr_bl_pool_ch_o_fifodata : STD_LOGIC_VECTOR (95 downto 0);
    signal i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_iowr_bl_pool_ch_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_7 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_8 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_9 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_10 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_11 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_12 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_13 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_16 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_17 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2136_xor_or_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2137_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2138_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2138_xor_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi10_push29_memread_out_feedback_out_29 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi10_push29_memread_out_feedback_valid_out_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi10_push29_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi10_push29_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_feedback_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_feedback_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_feedback_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_feedback_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_feedback_valid_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_feedback_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_feedback_valid_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_feedback_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_feedback_valid_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2458_or2462_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2458_or2462_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2458_or2463_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2458_or2463_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o14_13_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o14_13_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o14_13_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o14_13_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o14_13_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o14_13_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o14_13_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o14_13_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o14_13_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o14_13_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o15_13_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o15_13_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o15_13_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o15_13_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o15_13_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o15_13_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o15_13_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o15_13_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o15_13_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o15_13_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q : STD_LOGIC_VECTOR (383 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_h : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_i : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_j : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_k : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_l : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_m : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_n : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_o : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_p : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_r : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_s : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (426 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_j : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_stall_entry_aunroll_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_n : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_o : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_p : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_r : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_stall_entry_aunroll_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_z : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist0_stall_entry_aunroll_o14_13_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_stall_entry_aunroll_o14_13_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_stall_entry_aunroll_o15_13_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi10_push29_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi10_push29_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi10_push29_memread_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp12532_phi_decision2458_or2462_memread_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_out_bitsignaltemp : std_logic;

begin


    -- i_acl_2136_xor_or_memread(LOGICAL,63)@0
    i_acl_2136_xor_or_memread_q <= bubble_select_stall_entry_aunroll_o or bubble_select_stall_entry_aunroll_q;

    -- i_cmp12532_phi_decision2458_or2462_memread(LOGICAL,74)@0 + 1
    i_cmp12532_phi_decision2458_or2462_memread_qi <= i_acl_2136_xor_or_memread_q or bubble_select_stall_entry_aunroll_c;
    i_cmp12532_phi_decision2458_or2462_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp12532_phi_decision2458_or2462_memread_qi, xout => i_cmp12532_phi_decision2458_or2462_memread_q, ena => SE_i_cmp12532_phi_decision2458_or2462_memread_backEN(0), clk => clock, aclr => resetn );

    -- redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo(STALLFIFO,90)
    redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_in <= SE_i_cmp12532_phi_decision2458_or2462_memread_V1;
    redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_in <= SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_backStall;
    redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_data_in <= i_cmp12532_phi_decision2458_or2462_memread_q;
    redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_in_bitsignaltemp <= redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_in(0);
    redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_in_bitsignaltemp <= redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_in(0);
    redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_out(0) <= redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_out_bitsignaltemp;
    redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_out(0) <= redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_out_bitsignaltemp;
    theredist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp12532_phi_decision2458_or2462_memread_q,
        valid_out => redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo(STALLENABLE,149)
    -- Valid signal propagation
    SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_V0 <= SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_backStall <= i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_o_stall or not (SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_and0 <= redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_valid_out;
    SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_wireValid <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V0 and SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_and0;

    -- bubble_join_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo(BITJOIN,112)
    bubble_join_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_q <= redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_data_out;

    -- bubble_select_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo(BITSELECT,113)
    bubble_select_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x(BITJOIN,94)
    bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_18 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_17 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_16 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_15 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_14 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_13 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_12 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_11 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_10 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_9 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_8 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_7 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_6 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_5 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_4 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_3 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_2 & i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_1;

    -- bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x(BITSELECT,95)
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(63 downto 32));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(95 downto 64));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(127 downto 96));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(159 downto 128));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(191 downto 160));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(207 downto 192));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(223 downto 208));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(239 downto 224));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(255 downto 240));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(271 downto 256));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(287 downto 272));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(303 downto 288));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(319 downto 304));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(335 downto 320));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(351 downto 336));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(367 downto 352));
    bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q(383 downto 368));

    -- i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x(BLACKBOX,33)@13
    -- in in_i_stall@20000000
    -- out out_iowr_bl_bypass_ch_o_fifodata@20000000
    -- out out_iowr_bl_bypass_ch_o_fifovalid@20000000
    -- out out_o_stall@20000000
    thei_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x : i_iowr_bl_bypass_ch_unnamed_memread8_memread2596
    PORT MAP (
        in_i_data_0 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_h,
        in_i_data_1 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_i,
        in_i_data_2 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_j,
        in_i_data_3 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_k,
        in_i_data_4 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_l,
        in_i_data_5 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_m,
        in_cmp12532_phi_decision2458_or2462 => bubble_select_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_b,
        in_i_stall => SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_backStall,
        in_i_valid => SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_V0,
        in_iowr_bl_bypass_ch_i_fifoready => in_iowr_bl_bypass_ch_i_fifoready,
        out_iowr_bl_bypass_ch_o_fifodata => i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_iowr_bl_bypass_ch_o_fifodata,
        out_iowr_bl_bypass_ch_o_fifovalid => i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_iowr_bl_bypass_ch_o_fifovalid,
        out_o_stall => i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_o_stall,
        out_o_valid => i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_acl_2137_memread(LOGICAL,64)@0
    i_acl_2137_memread_q <= bubble_select_stall_entry_aunroll_o and bubble_select_stall_entry_aunroll_s;

    -- i_acl_2138_memread(LOGICAL,65)@0
    i_acl_2138_memread_q <= bubble_select_stall_entry_aunroll_n and i_acl_2137_memread_q;

    -- i_acl_2138_xor_memread(LOGICAL,66)@0
    i_acl_2138_xor_memread_q <= i_acl_2138_memread_q xor VCC_q;

    -- i_cmp12532_phi_decision2458_or2463_memread(LOGICAL,75)@0 + 1
    i_cmp12532_phi_decision2458_or2463_memread_qi <= bubble_select_stall_entry_aunroll_c or i_acl_2138_xor_memread_q;
    i_cmp12532_phi_decision2458_or2463_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp12532_phi_decision2458_or2463_memread_qi, xout => i_cmp12532_phi_decision2458_or2463_memread_q, ena => SE_i_cmp12532_phi_decision2458_or2462_memread_backEN(0), clk => clock, aclr => resetn );

    -- redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo(STALLFIFO,89)
    redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_in <= SE_i_cmp12532_phi_decision2458_or2462_memread_V0;
    redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_in <= SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_backStall;
    redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_data_in <= i_cmp12532_phi_decision2458_or2463_memread_q;
    redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_in_bitsignaltemp <= redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_in(0);
    redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_in_bitsignaltemp <= redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_in(0);
    redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_out(0) <= redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_out_bitsignaltemp;
    redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_out(0) <= redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_out_bitsignaltemp;
    theredist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp12532_phi_decision2458_or2463_memread_q,
        valid_out => redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo(STALLENABLE,147)
    -- Valid signal propagation
    SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_V0 <= SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_backStall <= i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_o_stall or not (SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_and0 <= redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_valid_out;
    SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_wireValid <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V1 and SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_and0;

    -- bubble_join_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo(BITJOIN,109)
    bubble_join_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_q <= redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_data_out;

    -- bubble_select_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo(BITSELECT,110)
    bubble_select_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_q(0 downto 0));

    -- i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x(BLACKBOX,34)@13
    -- in in_i_stall@20000000
    -- out out_iowr_bl_pool_ch_o_fifodata@20000000
    -- out out_iowr_bl_pool_ch_o_fifovalid@20000000
    -- out out_o_stall@20000000
    thei_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x : i_iowr_bl_pool_ch_unnamed_memread9_memread2597
    PORT MAP (
        in_i_data_0 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_n,
        in_i_data_1 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_o,
        in_i_data_2 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_p,
        in_i_data_3 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_q,
        in_i_data_4 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_r,
        in_i_data_5 => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_s,
        in_cmp12532_phi_decision2458_or2463 => bubble_select_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_b,
        in_i_stall => SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_backStall,
        in_i_valid => SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_V0,
        in_iowr_bl_pool_ch_i_fifoready => in_iowr_bl_pool_ch_i_fifoready,
        out_iowr_bl_pool_ch_o_fifodata => i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_iowr_bl_pool_ch_o_fifodata,
        out_iowr_bl_pool_ch_o_fifovalid => i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_iowr_bl_pool_ch_o_fifovalid,
        out_o_stall => i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_o_stall,
        out_o_valid => i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1(STALLENABLE,159)
    -- Valid signal propagation
    SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_V0 <= SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and0 <= bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_out;
    SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and1 <= redist0_stall_entry_aunroll_o14_13_fifo_valid_out and SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and0;
    SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and2 <= i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_o_valid and SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and1;
    SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_wireValid <= i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_o_valid and SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_and2;

    -- bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg(STALLFIFO,184)
    bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_in <= SE_out_i_acl_push_i1_memdep_phi10_push29_memread_V0;
    bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_in <= SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_backStall;
    bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_in_bitsignaltemp <= bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_in(0);
    bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_in_bitsignaltemp <= bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_in(0);
    bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_out(0) <= bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_out(0) <= bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i1_memdep_phi10_push29_memread(STALLENABLE,125)
    -- Valid signal propagation
    SE_out_i_acl_push_i1_memdep_phi10_push29_memread_V0 <= SE_out_i_acl_push_i1_memdep_phi10_push29_memread_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_push_i1_memdep_phi10_push29_memread_backStall <= bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_reg_stall_out or not (SE_out_i_acl_push_i1_memdep_phi10_push29_memread_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i1_memdep_phi10_push29_memread_wireValid <= i_acl_push_i1_memdep_phi10_push29_memread_out_valid_out;

    -- i_acl_push_i1_memdep_phi10_push29_memread(BLACKBOX,67)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_29@20000000
    -- out out_feedback_valid_out_29@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi10_push29_memread : i_acl_push_i1_memdep_phi10_push29_memread2521
    PORT MAP (
        in_c0_exe2198827 => bubble_select_stall_entry_aunroll_m,
        in_data_in => bubble_select_stall_entry_aunroll_z,
        in_feedback_stall_in_29 => in_feedback_stall_in_29,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi10_push29_memread_backStall,
        in_valid_in => SE_stall_entry_aunroll_V4,
        out_feedback_out_29 => i_acl_push_i1_memdep_phi10_push29_memread_out_feedback_out_29,
        out_feedback_valid_out_29 => i_acl_push_i1_memdep_phi10_push29_memread_out_feedback_valid_out_29,
        out_stall_out => i_acl_push_i1_memdep_phi10_push29_memread_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi10_push29_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread(STALLENABLE,137)
    -- Backward Stall generation
    SE_out_i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_wireValid <= i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_valid_out;

    -- bubble_join_redist1_stall_entry_aunroll_o15_13_fifo(BITJOIN,106)
    bubble_join_redist1_stall_entry_aunroll_o15_13_fifo_q <= redist1_stall_entry_aunroll_o15_13_fifo_data_out;

    -- bubble_select_redist1_stall_entry_aunroll_o15_13_fifo(BITSELECT,107)
    bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_stall_entry_aunroll_o15_13_fifo_q(0 downto 0));

    -- i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread(BLACKBOX,73)@13
    -- in in_stall_in@20000000
    -- out out_data_out@14
    -- out out_feedback_out_7@20000000
    -- out out_feedback_valid_out_7@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@14
    thei_acl_push_i32_conv_out_0_0_0_5_0_push7_memread : i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread2594
    PORT MAP (
        in_c0_exe2198827 => bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b,
        in_data_in => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_g,
        in_feedback_stall_in_7 => in_feedback_stall_in_7,
        in_stall_in => SE_out_i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_backStall,
        in_valid_in => SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V5,
        out_feedback_out_7 => i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_feedback_out_7,
        out_feedback_valid_out_7 => i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_feedback_valid_out_7,
        out_stall_out => i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_stall_out,
        out_valid_out => i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread(STALLENABLE,135)
    -- Backward Stall generation
    SE_out_i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_wireValid <= i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_valid_out;

    -- i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread(BLACKBOX,72)@13
    -- in in_stall_in@20000000
    -- out out_data_out@14
    -- out out_feedback_out_8@20000000
    -- out out_feedback_valid_out_8@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@14
    thei_acl_push_i32_conv_out_0_0_0_4_0_push8_memread : i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread2592
    PORT MAP (
        in_c0_exe2198827 => bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b,
        in_data_in => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_f,
        in_feedback_stall_in_8 => in_feedback_stall_in_8,
        in_stall_in => SE_out_i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_backStall,
        in_valid_in => SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V4,
        out_feedback_out_8 => i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_feedback_out_8,
        out_feedback_valid_out_8 => i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_feedback_valid_out_8,
        out_stall_out => i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_stall_out,
        out_valid_out => i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread(STALLENABLE,133)
    -- Backward Stall generation
    SE_out_i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_wireValid <= i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_valid_out;

    -- i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread(BLACKBOX,71)@13
    -- in in_stall_in@20000000
    -- out out_data_out@14
    -- out out_feedback_out_9@20000000
    -- out out_feedback_valid_out_9@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@14
    thei_acl_push_i32_conv_out_0_0_0_3_0_push9_memread : i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread2590
    PORT MAP (
        in_c0_exe2198827 => bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b,
        in_data_in => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_e,
        in_feedback_stall_in_9 => in_feedback_stall_in_9,
        in_stall_in => SE_out_i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_backStall,
        in_valid_in => SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V3,
        out_feedback_out_9 => i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_feedback_out_9,
        out_feedback_valid_out_9 => i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_feedback_valid_out_9,
        out_stall_out => i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_stall_out,
        out_valid_out => i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread(STALLENABLE,131)
    -- Backward Stall generation
    SE_out_i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_wireValid <= i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_valid_out;

    -- i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread(BLACKBOX,70)@13
    -- in in_stall_in@20000000
    -- out out_data_out@14
    -- out out_feedback_out_10@20000000
    -- out out_feedback_valid_out_10@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@14
    thei_acl_push_i32_conv_out_0_0_0_2_0_push10_memread : i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread2588
    PORT MAP (
        in_c0_exe2198827 => bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b,
        in_data_in => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_d,
        in_feedback_stall_in_10 => in_feedback_stall_in_10,
        in_stall_in => SE_out_i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_backStall,
        in_valid_in => SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V2,
        out_feedback_out_10 => i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_feedback_out_10,
        out_feedback_valid_out_10 => i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_feedback_valid_out_10,
        out_stall_out => i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_stall_out,
        out_valid_out => i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread(STALLENABLE,129)
    -- Backward Stall generation
    SE_out_i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_wireValid <= i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_valid_out;

    -- i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread(BLACKBOX,69)@13
    -- in in_stall_in@20000000
    -- out out_data_out@14
    -- out out_feedback_out_11@20000000
    -- out out_feedback_valid_out_11@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@14
    thei_acl_push_i32_conv_out_0_0_0_1_0_push11_memread : i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread2586
    PORT MAP (
        in_c0_exe2198827 => bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b,
        in_data_in => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_c,
        in_feedback_stall_in_11 => in_feedback_stall_in_11,
        in_stall_in => SE_out_i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_backStall,
        in_valid_in => SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V1,
        out_feedback_out_11 => i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_feedback_out_11,
        out_feedback_valid_out_11 => i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_feedback_valid_out_11,
        out_stall_out => i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_stall_out,
        out_valid_out => i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread(STALLENABLE,127)
    -- Backward Stall generation
    SE_out_i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_wireValid <= i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_valid_out;

    -- i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread(BLACKBOX,68)@13
    -- in in_stall_in@20000000
    -- out out_data_out@14
    -- out out_feedback_out_12@20000000
    -- out out_feedback_valid_out_12@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@14
    thei_acl_push_i32_conv_out_0_0_0_0_0_push12_memread : i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread2584
    PORT MAP (
        in_c0_exe2198827 => bubble_select_redist1_stall_entry_aunroll_o15_13_fifo_b,
        in_data_in => bubble_select_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_b,
        in_feedback_stall_in_12 => in_feedback_stall_in_12,
        in_stall_in => SE_out_i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_backStall,
        in_valid_in => SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V0,
        out_feedback_out_12 => i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_feedback_out_12,
        out_feedback_valid_out_12 => i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_feedback_valid_out_12,
        out_stall_out => i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_stall_out,
        out_valid_out => i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist1_stall_entry_aunroll_o15_13_fifo(STALLENABLE,145)
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg1 <= (others => '0');
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg2 <= (others => '0');
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg3 <= (others => '0');
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg4 <= (others => '0');
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg5 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg0 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg1 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg1;
            -- Succesor 2
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg2 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg2;
            -- Succesor 3
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg3 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg3;
            -- Succesor 4
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg4 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg4;
            -- Succesor 5
            SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg5 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg5;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed0 <= (not (i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_stall_out) and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid) or SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg0;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed1 <= (not (i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_stall_out) and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid) or SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg1;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed2 <= (not (i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_stall_out) and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid) or SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg2;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed3 <= (not (i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_stall_out) and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid) or SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg3;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed4 <= (not (i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_stall_out) and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid) or SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg4;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed5 <= (not (i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_stall_out) and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid) or SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg5;
    -- Consuming
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_backStall and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg0 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed0;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg1 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed1;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg2 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed2;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg3 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed3;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg4 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed4;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_toReg5 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_StallValid and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed5;
    -- Backward Stall generation
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or0 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed0;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or1 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed1 and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or0;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or2 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed2 and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or1;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or3 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed3 and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or2;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or4 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed4 and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or3;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireStall <= not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_consumed5 and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_or4);
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_backStall <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V0 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid and not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg0);
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V1 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid and not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg1);
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V2 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid and not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg2);
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V3 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid and not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg3);
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V4 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid and not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg4);
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_V5 <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid and not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_fromReg5);
    -- Computing multiple Valid(s)
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_and0 <= redist1_stall_entry_aunroll_o15_13_fifo_valid_out;
    SE_out_redist1_stall_entry_aunroll_o15_13_fifo_wireValid <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V2 and SE_out_redist1_stall_entry_aunroll_o15_13_fifo_and0;

    -- redist1_stall_entry_aunroll_o15_13_fifo(STALLFIFO,88)
    redist1_stall_entry_aunroll_o15_13_fifo_valid_in <= SE_stall_entry_aunroll_V2;
    redist1_stall_entry_aunroll_o15_13_fifo_stall_in <= SE_out_redist1_stall_entry_aunroll_o15_13_fifo_backStall;
    redist1_stall_entry_aunroll_o15_13_fifo_data_in <= bubble_select_stall_entry_aunroll_m;
    redist1_stall_entry_aunroll_o15_13_fifo_valid_in_bitsignaltemp <= redist1_stall_entry_aunroll_o15_13_fifo_valid_in(0);
    redist1_stall_entry_aunroll_o15_13_fifo_stall_in_bitsignaltemp <= redist1_stall_entry_aunroll_o15_13_fifo_stall_in(0);
    redist1_stall_entry_aunroll_o15_13_fifo_valid_out(0) <= redist1_stall_entry_aunroll_o15_13_fifo_valid_out_bitsignaltemp;
    redist1_stall_entry_aunroll_o15_13_fifo_stall_out(0) <= redist1_stall_entry_aunroll_o15_13_fifo_stall_out_bitsignaltemp;
    theredist1_stall_entry_aunroll_o15_13_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 14,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_stall_entry_aunroll_o15_13_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_stall_entry_aunroll_o15_13_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_m,
        valid_out => redist1_stall_entry_aunroll_o15_13_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_stall_entry_aunroll_o15_13_fifo_stall_out_bitsignaltemp,
        data_out => redist1_stall_entry_aunroll_o15_13_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_stall_entry_aunroll_o14_13_fifo(STALLFIFO,87)
    redist0_stall_entry_aunroll_o14_13_fifo_valid_in <= SE_stall_entry_aunroll_V1;
    redist0_stall_entry_aunroll_o14_13_fifo_stall_in <= SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_backStall;
    redist0_stall_entry_aunroll_o14_13_fifo_data_in <= bubble_select_stall_entry_aunroll_l;
    redist0_stall_entry_aunroll_o14_13_fifo_valid_in_bitsignaltemp <= redist0_stall_entry_aunroll_o14_13_fifo_valid_in(0);
    redist0_stall_entry_aunroll_o14_13_fifo_stall_in_bitsignaltemp <= redist0_stall_entry_aunroll_o14_13_fifo_stall_in(0);
    redist0_stall_entry_aunroll_o14_13_fifo_valid_out(0) <= redist0_stall_entry_aunroll_o14_13_fifo_valid_out_bitsignaltemp;
    redist0_stall_entry_aunroll_o14_13_fifo_stall_out(0) <= redist0_stall_entry_aunroll_o14_13_fifo_stall_out_bitsignaltemp;
    theredist0_stall_entry_aunroll_o14_13_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 14,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_stall_entry_aunroll_o14_13_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_stall_entry_aunroll_o14_13_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_l,
        valid_out => redist0_stall_entry_aunroll_o14_13_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_stall_entry_aunroll_o14_13_fifo_stall_out_bitsignaltemp,
        data_out => redist0_stall_entry_aunroll_o14_13_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_cmp12532_phi_decision2458_or2462_memread(STALLENABLE,138)
    -- Valid signal propagation
    SE_i_cmp12532_phi_decision2458_or2462_memread_V0 <= SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_0;
    SE_i_cmp12532_phi_decision2458_or2462_memread_V1 <= SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_1;
    -- Stall signal propagation
    SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_0 <= redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_stall_out and SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_0;
    SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_1 <= redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_stall_out and SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_1;
    -- Backward Enable generation
    SE_i_cmp12532_phi_decision2458_or2462_memread_or0 <= SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_0;
    SE_i_cmp12532_phi_decision2458_or2462_memread_backEN <= not (SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_1 or SE_i_cmp12532_phi_decision2458_or2462_memread_or0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp12532_phi_decision2458_or2462_memread_v_s_0 <= SE_i_cmp12532_phi_decision2458_or2462_memread_backEN and SE_stall_entry_aunroll_V0;
    -- Backward Stall generation
    SE_i_cmp12532_phi_decision2458_or2462_memread_backStall <= not (SE_i_cmp12532_phi_decision2458_or2462_memread_v_s_0);
    SE_i_cmp12532_phi_decision2458_or2462_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_0 <= (others => '0');
            SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp12532_phi_decision2458_or2462_memread_backEN = "0") THEN
                SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_0 <= SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_0 and SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_0;
            ELSE
                SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_0 <= SE_i_cmp12532_phi_decision2458_or2462_memread_v_s_0;
            END IF;

            IF (SE_i_cmp12532_phi_decision2458_or2462_memread_backEN = "0") THEN
                SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_1 <= SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_1 and SE_i_cmp12532_phi_decision2458_or2462_memread_s_tv_1;
            ELSE
                SE_i_cmp12532_phi_decision2458_or2462_memread_R_v_1 <= SE_i_cmp12532_phi_decision2458_or2462_memread_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry_aunroll(STALLENABLE,140)
    SE_stall_entry_aunroll_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_aunroll_fromReg0 <= (others => '0');
            SE_stall_entry_aunroll_fromReg1 <= (others => '0');
            SE_stall_entry_aunroll_fromReg2 <= (others => '0');
            SE_stall_entry_aunroll_fromReg3 <= (others => '0');
            SE_stall_entry_aunroll_fromReg4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_aunroll_fromReg0 <= SE_stall_entry_aunroll_toReg0;
            -- Succesor 1
            SE_stall_entry_aunroll_fromReg1 <= SE_stall_entry_aunroll_toReg1;
            -- Succesor 2
            SE_stall_entry_aunroll_fromReg2 <= SE_stall_entry_aunroll_toReg2;
            -- Succesor 3
            SE_stall_entry_aunroll_fromReg3 <= SE_stall_entry_aunroll_toReg3;
            -- Succesor 4
            SE_stall_entry_aunroll_fromReg4 <= SE_stall_entry_aunroll_toReg4;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_aunroll_consumed0 <= (not (SE_i_cmp12532_phi_decision2458_or2462_memread_backStall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg0;
    SE_stall_entry_aunroll_consumed1 <= (not (redist0_stall_entry_aunroll_o14_13_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg1;
    SE_stall_entry_aunroll_consumed2 <= (not (redist1_stall_entry_aunroll_o15_13_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg2;
    SE_stall_entry_aunroll_consumed3 <= (not (i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_o_stall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg3;
    SE_stall_entry_aunroll_consumed4 <= (not (i_acl_push_i1_memdep_phi10_push29_memread_out_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg4;
    -- Consuming
    SE_stall_entry_aunroll_StallValid <= SE_stall_entry_aunroll_backStall and SE_stall_entry_aunroll_wireValid;
    SE_stall_entry_aunroll_toReg0 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_toReg1 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed1;
    SE_stall_entry_aunroll_toReg2 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed2;
    SE_stall_entry_aunroll_toReg3 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed3;
    SE_stall_entry_aunroll_toReg4 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed4;
    -- Backward Stall generation
    SE_stall_entry_aunroll_or0 <= SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_or1 <= SE_stall_entry_aunroll_consumed1 and SE_stall_entry_aunroll_or0;
    SE_stall_entry_aunroll_or2 <= SE_stall_entry_aunroll_consumed2 and SE_stall_entry_aunroll_or1;
    SE_stall_entry_aunroll_or3 <= SE_stall_entry_aunroll_consumed3 and SE_stall_entry_aunroll_or2;
    SE_stall_entry_aunroll_wireStall <= not (SE_stall_entry_aunroll_consumed4 and SE_stall_entry_aunroll_or3);
    SE_stall_entry_aunroll_backStall <= SE_stall_entry_aunroll_wireStall;
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg0);
    SE_stall_entry_aunroll_V1 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg1);
    SE_stall_entry_aunroll_V2 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg2);
    SE_stall_entry_aunroll_V3 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg3);
    SE_stall_entry_aunroll_V4 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg4);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x(STALLENABLE,119)
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed0 <= (not (SE_out_redist3_i_cmp12532_phi_decision2458_or2462_memread_q_13_fifo_backStall) and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed1 <= (not (SE_out_redist2_i_cmp12532_phi_decision2458_or2463_memread_q_13_fifo_backStall) and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed2 <= (not (SE_out_redist1_stall_entry_aunroll_o15_13_fifo_backStall) and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg2;
    -- Consuming
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_backStall and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_StallValid and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_StallValid and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed1;
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_toReg2 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_StallValid and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_or0 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_or1 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_or0;
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_consumed2 and SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_or1);
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_backStall <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V0 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V1 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_V2 <= SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_wireValid <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_o_valid;

    -- bubble_join_stall_entry_aunroll(BITJOIN,98)
    bubble_join_stall_entry_aunroll_q <= in_memdep_phi121 & in_c5_exit48_1 & in_c4_exit47_1 & in_c3_exit46_1 & in_c2_exit103245_1 & in_c1_exit102044_1 & in_c0_exit100843_1 & in_c0_exe2799439 & in_c0_exe2699337 & in_c0_exe2599235 & in_c0_exe2499133 & in_c0_exe2399031 & in_c0_exe2298929 & in_c0_exe2198827 & in_c0_exe2098725 & in_c0_exe1998623 & in_c0_exe1898521 & in_c0_exe1798419 & in_c0_exe1698317 & in_c0_exe1598215 & in_c0_exe1498113 & in_c0_exe1398011 & in_c0_exe129799 & in_c0_exe119787 & in_c0_exe109775;

    -- bubble_select_stall_entry_aunroll(BITSELECT,99)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(0 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(1 downto 1));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(33 downto 2));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(65 downto 34));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(97 downto 66));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(129 downto 98));
    bubble_select_stall_entry_aunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(161 downto 130));
    bubble_select_stall_entry_aunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(193 downto 162));
    bubble_select_stall_entry_aunroll_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(209 downto 194));
    bubble_select_stall_entry_aunroll_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(210 downto 210));
    bubble_select_stall_entry_aunroll_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(211 downto 211));
    bubble_select_stall_entry_aunroll_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(212 downto 212));
    bubble_select_stall_entry_aunroll_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(213 downto 213));
    bubble_select_stall_entry_aunroll_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(214 downto 214));
    bubble_select_stall_entry_aunroll_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(215 downto 215));
    bubble_select_stall_entry_aunroll_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(216 downto 216));
    bubble_select_stall_entry_aunroll_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(232 downto 217));
    bubble_select_stall_entry_aunroll_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(233 downto 233));
    bubble_select_stall_entry_aunroll_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(265 downto 234));
    bubble_select_stall_entry_aunroll_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(297 downto 266));
    bubble_select_stall_entry_aunroll_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(329 downto 298));
    bubble_select_stall_entry_aunroll_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(361 downto 330));
    bubble_select_stall_entry_aunroll_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(393 downto 362));
    bubble_select_stall_entry_aunroll_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(425 downto 394));
    bubble_select_stall_entry_aunroll_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(426 downto 426));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x(BLACKBOX,35)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit1081_0@13
    -- out out_c0_exit1081_1@13
    -- out out_c0_exit1081_2@13
    -- out out_c0_exit1081_3@13
    -- out out_c0_exit1081_4@13
    -- out out_c0_exit1081_5@13
    -- out out_c0_exit1081_6@13
    -- out out_c0_exit1081_7@13
    -- out out_c0_exit1081_8@13
    -- out out_c0_exit1081_9@13
    -- out out_c0_exit1081_10@13
    -- out out_c0_exit1081_11@13
    -- out out_c0_exit1081_12@13
    -- out out_c0_exit1081_13@13
    -- out out_c0_exit1081_14@13
    -- out out_c0_exit1081_15@13
    -- out out_c0_exit1081_16@13
    -- out out_c0_exit1081_17@13
    -- out out_c0_exit1081_18@13
    -- out out_memcoalesce_null_load_0152_avm_address@20000000
    -- out out_memcoalesce_null_load_0152_avm_burstcount@20000000
    -- out out_memcoalesce_null_load_0152_avm_byteenable@20000000
    -- out out_memcoalesce_null_load_0152_avm_enable@20000000
    -- out out_memcoalesce_null_load_0152_avm_read@20000000
    -- out out_memcoalesce_null_load_0152_avm_write@20000000
    -- out out_memcoalesce_null_load_0152_avm_writedata@20000000
    -- out out_memdep_16_avm_address@20000000
    -- out out_memdep_16_avm_burstcount@20000000
    -- out out_memdep_16_avm_byteenable@20000000
    -- out out_memdep_16_avm_enable@20000000
    -- out out_memdep_16_avm_read@20000000
    -- out out_memdep_16_avm_write@20000000
    -- out out_memdep_16_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@13
    thei_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x : i_sfc_c0_for_end624_memread_c0_enter1053_memread
    PORT MAP (
        in_c0_eni191052_0 => GND_q,
        in_c0_eni191052_1 => bubble_select_stall_entry_aunroll_k,
        in_c0_eni191052_2 => bubble_select_stall_entry_aunroll_x,
        in_c0_eni191052_3 => bubble_select_stall_entry_aunroll_y,
        in_c0_eni191052_4 => bubble_select_stall_entry_aunroll_u,
        in_c0_eni191052_5 => bubble_select_stall_entry_aunroll_t,
        in_c0_eni191052_6 => bubble_select_stall_entry_aunroll_v,
        in_c0_eni191052_7 => bubble_select_stall_entry_aunroll_w,
        in_c0_eni191052_8 => bubble_select_stall_entry_aunroll_i,
        in_c0_eni191052_9 => bubble_select_stall_entry_aunroll_h,
        in_c0_eni191052_10 => bubble_select_stall_entry_aunroll_g,
        in_c0_eni191052_11 => bubble_select_stall_entry_aunroll_f,
        in_c0_eni191052_12 => bubble_select_stall_entry_aunroll_e,
        in_c0_eni191052_13 => bubble_select_stall_entry_aunroll_d,
        in_c0_eni191052_14 => bubble_select_stall_entry_aunroll_j,
        in_c0_eni191052_15 => bubble_select_stall_entry_aunroll_r,
        in_c0_eni191052_16 => bubble_select_stall_entry_aunroll_p,
        in_c0_eni191052_17 => bubble_select_stall_entry_aunroll_c,
        in_c0_eni191052_18 => bubble_select_stall_entry_aunroll_b,
        in_c0_eni191052_19 => bubble_select_stall_entry_aunroll_m,
        in_control => in_control,
        in_flush => in_flush,
        in_frac_b => in_frac_b,
        in_frac_din => in_frac_din,
        in_frac_dout => in_frac_dout,
        in_frac_w => in_frac_w,
        in_i_stall => SE_out_i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_backStall,
        in_i_valid => SE_stall_entry_aunroll_V3,
        in_memcoalesce_null_load_0152_avm_readdata => in_memcoalesce_null_load_0152_avm_readdata,
        in_memcoalesce_null_load_0152_avm_readdatavalid => in_memcoalesce_null_load_0152_avm_readdatavalid,
        in_memcoalesce_null_load_0152_avm_waitrequest => in_memcoalesce_null_load_0152_avm_waitrequest,
        in_memcoalesce_null_load_0152_avm_writeack => in_memcoalesce_null_load_0152_avm_writeack,
        in_memdep_16_avm_readdata => in_memdep_16_avm_readdata,
        in_memdep_16_avm_readdatavalid => in_memdep_16_avm_readdatavalid,
        in_memdep_16_avm_waitrequest => in_memdep_16_avm_waitrequest,
        in_memdep_16_avm_writeack => in_memdep_16_avm_writeack,
        out_c0_exit1081_1 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_1,
        out_c0_exit1081_2 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_2,
        out_c0_exit1081_3 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_3,
        out_c0_exit1081_4 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_4,
        out_c0_exit1081_5 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_5,
        out_c0_exit1081_6 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_6,
        out_c0_exit1081_7 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_7,
        out_c0_exit1081_8 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_8,
        out_c0_exit1081_9 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_9,
        out_c0_exit1081_10 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_10,
        out_c0_exit1081_11 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_11,
        out_c0_exit1081_12 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_12,
        out_c0_exit1081_13 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_13,
        out_c0_exit1081_14 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_14,
        out_c0_exit1081_15 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_15,
        out_c0_exit1081_16 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_16,
        out_c0_exit1081_17 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_17,
        out_c0_exit1081_18 => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_c0_exit1081_18,
        out_memcoalesce_null_load_0152_avm_address => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_address,
        out_memcoalesce_null_load_0152_avm_burstcount => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount,
        out_memcoalesce_null_load_0152_avm_byteenable => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable,
        out_memcoalesce_null_load_0152_avm_enable => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_enable,
        out_memcoalesce_null_load_0152_avm_read => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_read,
        out_memcoalesce_null_load_0152_avm_write => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_write,
        out_memcoalesce_null_load_0152_avm_writedata => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata,
        out_memdep_16_avm_address => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_address,
        out_memdep_16_avm_burstcount => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_burstcount,
        out_memdep_16_avm_byteenable => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_byteenable,
        out_memdep_16_avm_enable => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_enable,
        out_memdep_16_avm_read => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_read,
        out_memdep_16_avm_write => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_write,
        out_memdep_16_avm_writedata => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_writedata,
        out_o_stall => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_memdep_16_avm_address <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_address;
    out_memdep_16_avm_enable <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_enable;
    out_memdep_16_avm_read <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_read;
    out_memdep_16_avm_write <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_write;
    out_memdep_16_avm_writedata <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_writedata;
    out_memdep_16_avm_byteenable <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_byteenable;
    out_memdep_16_avm_burstcount <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memdep_16_avm_burstcount;

    -- bubble_join_redist0_stall_entry_aunroll_o14_13_fifo(BITJOIN,103)
    bubble_join_redist0_stall_entry_aunroll_o14_13_fifo_q <= redist0_stall_entry_aunroll_o14_13_fifo_data_out;

    -- bubble_select_redist0_stall_entry_aunroll_o14_13_fifo(BITSELECT,104)
    bubble_select_redist0_stall_entry_aunroll_o14_13_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_stall_entry_aunroll_o14_13_fifo_q(0 downto 0));

    -- dupName_0_sync_out_x(GPOUT,8)@13
    out_c0_exe2098725 <= bubble_select_redist0_stall_entry_aunroll_o14_13_fifo_b;
    out_valid_out <= SE_out_bubble_out_i_acl_push_i1_memdep_phi10_push29_memread_1_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,10)
    out_iowr_bl_bypass_ch_o_fifodata <= i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_iowr_bl_bypass_ch_o_fifodata;
    out_iowr_bl_bypass_ch_o_fifovalid <= i_iowr_bl_bypass_ch_unnamed_memread8_memread_aunroll_x_out_iowr_bl_bypass_ch_o_fifovalid;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,15)
    out_iowr_bl_pool_ch_o_fifodata <= i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_iowr_bl_pool_ch_o_fifodata;
    out_iowr_bl_pool_ch_o_fifovalid <= i_iowr_bl_pool_ch_unnamed_memread9_memread_aunroll_x_out_iowr_bl_pool_ch_o_fifovalid;

    -- ext_sig_sync_out(GPOUT,41)
    out_memcoalesce_null_load_0152_avm_address <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_address;
    out_memcoalesce_null_load_0152_avm_enable <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_enable;
    out_memcoalesce_null_load_0152_avm_read <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_read;
    out_memcoalesce_null_load_0152_avm_write <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_write;
    out_memcoalesce_null_load_0152_avm_writedata <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata;
    out_memcoalesce_null_load_0152_avm_byteenable <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable;
    out_memcoalesce_null_load_0152_avm_burstcount <= i_sfc_c0_for_end624_memread_c0_enter1053_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount;

    -- feedback_out_10_sync(GPOUT,42)
    out_feedback_out_10 <= i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_feedback_out_10;

    -- feedback_out_11_sync(GPOUT,43)
    out_feedback_out_11 <= i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_feedback_out_11;

    -- feedback_out_12_sync(GPOUT,44)
    out_feedback_out_12 <= i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_feedback_out_12;

    -- feedback_out_29_sync(GPOUT,45)
    out_feedback_out_29 <= i_acl_push_i1_memdep_phi10_push29_memread_out_feedback_out_29;

    -- feedback_out_7_sync(GPOUT,46)
    out_feedback_out_7 <= i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_feedback_out_7;

    -- feedback_out_8_sync(GPOUT,47)
    out_feedback_out_8 <= i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_feedback_out_8;

    -- feedback_out_9_sync(GPOUT,48)
    out_feedback_out_9 <= i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_feedback_out_9;

    -- feedback_valid_out_10_sync(GPOUT,56)
    out_feedback_valid_out_10 <= i_acl_push_i32_conv_out_0_0_0_2_0_push10_memread_out_feedback_valid_out_10;

    -- feedback_valid_out_11_sync(GPOUT,57)
    out_feedback_valid_out_11 <= i_acl_push_i32_conv_out_0_0_0_1_0_push11_memread_out_feedback_valid_out_11;

    -- feedback_valid_out_12_sync(GPOUT,58)
    out_feedback_valid_out_12 <= i_acl_push_i32_conv_out_0_0_0_0_0_push12_memread_out_feedback_valid_out_12;

    -- feedback_valid_out_29_sync(GPOUT,59)
    out_feedback_valid_out_29 <= i_acl_push_i1_memdep_phi10_push29_memread_out_feedback_valid_out_29;

    -- feedback_valid_out_7_sync(GPOUT,60)
    out_feedback_valid_out_7 <= i_acl_push_i32_conv_out_0_0_0_5_0_push7_memread_out_feedback_valid_out_7;

    -- feedback_valid_out_8_sync(GPOUT,61)
    out_feedback_valid_out_8 <= i_acl_push_i32_conv_out_0_0_0_4_0_push8_memread_out_feedback_valid_out_8;

    -- feedback_valid_out_9_sync(GPOUT,62)
    out_feedback_valid_out_9 <= i_acl_push_i32_conv_out_0_0_0_3_0_push9_memread_out_feedback_valid_out_9;

    -- sync_out(GPOUT,82)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
