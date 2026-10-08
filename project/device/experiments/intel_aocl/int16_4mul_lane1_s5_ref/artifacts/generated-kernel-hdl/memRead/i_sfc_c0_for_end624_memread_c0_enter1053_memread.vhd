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

-- VHDL created from i_sfc_c0_for_end624_memread_c0_enter1053_memread
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

entity i_sfc_c0_for_end624_memread_c0_enter1053_memread is
    port (
        in_c0_eni191052_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni191052_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni191052_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni191052_14 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni191052_15 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni191052_16 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni191052_17 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni191052_18 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni191052_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1081_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1081_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1081_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1081_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1081_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1081_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1081_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1081_7 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_8 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_9 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_10 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_11 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_12 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_13 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_14 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_15 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_16 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_17 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit1081_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_frac_b : in std_logic_vector(7 downto 0);  -- ufix8
        out_memcoalesce_null_load_0152_avm_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        in_frac_din : in std_logic_vector(7 downto 0);  -- ufix8
        out_memcoalesce_null_load_0152_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        in_frac_dout : in std_logic_vector(7 downto 0);  -- ufix8
        out_memcoalesce_null_load_0152_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        in_frac_w : in std_logic_vector(7 downto 0);  -- ufix8
        out_memcoalesce_null_load_0152_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0152_avm_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_16_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        in_control : in std_logic_vector(7 downto 0);  -- ufix8
        out_memcoalesce_null_load_0152_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_for_end624_memread_c0_enter1053_memread;

architecture normal of i_sfc_c0_for_end624_memread_c0_enter1053_memread is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread2583 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dec_pipelined_thread : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_inc_pipelined_thread : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523 is
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
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi81080_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi81080_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi81080_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi81080_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi81080_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi81080_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi81080_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi81080_7 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_8 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_9 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_10 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_11 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_12 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_13 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_14 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_15 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_16 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_17 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi81080_18 : out std_logic_vector(15 downto 0);  -- Fixed Point
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
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_7 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_8 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_9 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_10 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_11 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_12 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_13 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_16 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_17 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- not_stall_out(LOGICAL,35)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,34)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x(BLACKBOX,31)@0
    -- out out_c0_exi81080_0@10
    -- out out_c0_exi81080_1@10
    -- out out_c0_exi81080_2@10
    -- out out_c0_exi81080_3@10
    -- out out_c0_exi81080_4@10
    -- out out_c0_exi81080_5@10
    -- out out_c0_exi81080_6@10
    -- out out_c0_exi81080_7@10
    -- out out_c0_exi81080_8@10
    -- out out_c0_exi81080_9@10
    -- out out_c0_exi81080_10@10
    -- out out_c0_exi81080_11@10
    -- out out_c0_exi81080_12@10
    -- out out_c0_exi81080_13@10
    -- out out_c0_exi81080_14@10
    -- out out_c0_exi81080_15@10
    -- out out_c0_exi81080_16@10
    -- out out_c0_exi81080_17@10
    -- out out_c0_exi81080_18@10
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
    -- out out_o_valid@10
    thei_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x : i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523
    PORT MAP (
        in_c0_eni191052_0 => in_c0_eni191052_0,
        in_c0_eni191052_1 => in_c0_eni191052_1,
        in_c0_eni191052_2 => in_c0_eni191052_2,
        in_c0_eni191052_3 => in_c0_eni191052_3,
        in_c0_eni191052_4 => in_c0_eni191052_4,
        in_c0_eni191052_5 => in_c0_eni191052_5,
        in_c0_eni191052_6 => in_c0_eni191052_6,
        in_c0_eni191052_7 => in_c0_eni191052_7,
        in_c0_eni191052_8 => in_c0_eni191052_8,
        in_c0_eni191052_9 => in_c0_eni191052_9,
        in_c0_eni191052_10 => in_c0_eni191052_10,
        in_c0_eni191052_11 => in_c0_eni191052_11,
        in_c0_eni191052_12 => in_c0_eni191052_12,
        in_c0_eni191052_13 => in_c0_eni191052_13,
        in_c0_eni191052_14 => in_c0_eni191052_14,
        in_c0_eni191052_15 => in_c0_eni191052_15,
        in_c0_eni191052_16 => in_c0_eni191052_16,
        in_c0_eni191052_17 => in_c0_eni191052_17,
        in_c0_eni191052_18 => in_c0_eni191052_18,
        in_c0_eni191052_19 => in_c0_eni191052_19,
        in_control => in_control,
        in_flush => in_flush,
        in_frac_b => in_frac_b,
        in_frac_din => in_frac_din,
        in_frac_dout => in_frac_dout,
        in_frac_w => in_frac_w,
        in_i_valid => input_accepted_and_q,
        in_memcoalesce_null_load_0152_avm_readdata => in_memcoalesce_null_load_0152_avm_readdata,
        in_memcoalesce_null_load_0152_avm_readdatavalid => in_memcoalesce_null_load_0152_avm_readdatavalid,
        in_memcoalesce_null_load_0152_avm_waitrequest => in_memcoalesce_null_load_0152_avm_waitrequest,
        in_memcoalesce_null_load_0152_avm_writeack => in_memcoalesce_null_load_0152_avm_writeack,
        in_memdep_16_avm_readdata => in_memdep_16_avm_readdata,
        in_memdep_16_avm_readdatavalid => in_memdep_16_avm_readdatavalid,
        in_memdep_16_avm_waitrequest => in_memdep_16_avm_waitrequest,
        in_memdep_16_avm_writeack => in_memdep_16_avm_writeack,
        out_c0_exi81080_0 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_0,
        out_c0_exi81080_1 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_1,
        out_c0_exi81080_2 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_2,
        out_c0_exi81080_3 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_3,
        out_c0_exi81080_4 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_4,
        out_c0_exi81080_5 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_5,
        out_c0_exi81080_6 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_6,
        out_c0_exi81080_7 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_7,
        out_c0_exi81080_8 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_8,
        out_c0_exi81080_9 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_9,
        out_c0_exi81080_10 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_10,
        out_c0_exi81080_11 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_11,
        out_c0_exi81080_12 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_12,
        out_c0_exi81080_13 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_13,
        out_c0_exi81080_14 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_14,
        out_c0_exi81080_15 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_15,
        out_c0_exi81080_16 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_16,
        out_c0_exi81080_17 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_17,
        out_c0_exi81080_18 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_18,
        out_memcoalesce_null_load_0152_avm_address => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_address,
        out_memcoalesce_null_load_0152_avm_burstcount => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount,
        out_memcoalesce_null_load_0152_avm_byteenable => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable,
        out_memcoalesce_null_load_0152_avm_enable => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_enable,
        out_memcoalesce_null_load_0152_avm_read => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_read,
        out_memcoalesce_null_load_0152_avm_write => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_write,
        out_memcoalesce_null_load_0152_avm_writedata => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata,
        out_memdep_16_avm_address => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_address,
        out_memdep_16_avm_burstcount => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_burstcount,
        out_memdep_16_avm_byteenable => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_byteenable,
        out_memdep_16_avm_enable => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_enable,
        out_memdep_16_avm_read => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_read,
        out_memdep_16_avm_write => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_write,
        out_memdep_16_avm_writedata => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_writedata,
        out_o_valid => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x(BLACKBOX,30)@20000000
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
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x : i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread2583
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_0,
        in_data_in_1 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_1,
        in_data_in_2 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_2,
        in_data_in_3 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_3,
        in_data_in_4 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_4,
        in_data_in_5 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_5,
        in_data_in_6 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_6,
        in_data_in_7 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_7,
        in_data_in_8 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_8,
        in_data_in_9 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_9,
        in_data_in_10 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_10,
        in_data_in_11 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_11,
        in_data_in_12 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_12,
        in_data_in_13 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_13,
        in_data_in_14 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_14,
        in_data_in_15 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_15,
        in_data_in_16 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_16,
        in_data_in_17 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_17,
        in_data_in_18 => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_c0_exi81080_18,
        in_dec_pipelined_thread => VCC_q,
        in_inc_pipelined_thread => GND_q,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_18,
        out_stall_entry => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@13
    out_c0_exit1081_0 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_0;
    out_c0_exit1081_1 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_1;
    out_c0_exit1081_2 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_2;
    out_c0_exit1081_3 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_3;
    out_c0_exit1081_4 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_4;
    out_c0_exit1081_5 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_5;
    out_c0_exit1081_6 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_6;
    out_c0_exit1081_7 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_7;
    out_c0_exit1081_8 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_8;
    out_c0_exit1081_9 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_9;
    out_c0_exit1081_10 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_10;
    out_c0_exit1081_11 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_11;
    out_c0_exit1081_12 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_12;
    out_c0_exit1081_13 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_13;
    out_c0_exit1081_14 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_14;
    out_c0_exit1081_15 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_15;
    out_c0_exit1081_16 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_16;
    out_c0_exit1081_17 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_17;
    out_c0_exit1081_18 <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_data_out_18;
    out_o_valid <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_valid_out;

    -- dupName_0_regfree_osync_x(GPOUT,5)
    out_memcoalesce_null_load_0152_avm_burstcount <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount;

    -- dupName_1_regfree_osync_x(GPOUT,7)
    out_memcoalesce_null_load_0152_avm_byteenable <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable;

    -- dupName_2_regfree_osync_x(GPOUT,9)
    out_memcoalesce_null_load_0152_avm_enable <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_enable;

    -- dupName_3_regfree_osync_x(GPOUT,11)
    out_memcoalesce_null_load_0152_avm_read <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_read;

    -- dupName_4_regfree_osync_x(GPOUT,13)
    out_memcoalesce_null_load_0152_avm_write <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_write;

    -- dupName_5_regfree_osync_x(GPOUT,15)
    out_memcoalesce_null_load_0152_avm_writedata <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata;

    -- dupName_6_regfree_osync_x(GPOUT,17)
    out_memdep_16_avm_address <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_address;

    -- dupName_7_regfree_osync_x(GPOUT,19)
    out_memdep_16_avm_burstcount <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_burstcount;

    -- dupName_8_regfree_osync_x(GPOUT,21)
    out_memdep_16_avm_byteenable <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_byteenable;

    -- dupName_9_regfree_osync_x(GPOUT,23)
    out_memdep_16_avm_enable <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_enable;

    -- dupName_10_regfree_osync_x(GPOUT,25)
    out_memdep_16_avm_read <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_read;

    -- dupName_11_regfree_osync_x(GPOUT,27)
    out_memdep_16_avm_write <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_write;

    -- dupName_12_regfree_osync_x(GPOUT,29)
    out_memdep_16_avm_writedata <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memdep_16_avm_writedata;

    -- regfree_osync(GPOUT,37)
    out_memcoalesce_null_load_0152_avm_address <= i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523_aunroll_x_out_memcoalesce_null_load_0152_avm_address;

    -- sync_out(GPOUT,39)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_for_end624_memread_c0_exit1081_memread_aunroll_x_out_stall_entry;

END normal;
