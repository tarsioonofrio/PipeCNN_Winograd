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

-- VHDL created from i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523
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

entity i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523 is
    port (
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
        in_control : in std_logic_vector(7 downto 0);  -- ufix8
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_frac_b : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_din : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_dout : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_w : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi81080_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi81080_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi81080_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi81080_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi81080_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi81080_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi81080_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi81080_7 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_8 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_9 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_10 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_11 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_12 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_13 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_14 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_15 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_16 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_17 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exi81080_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
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
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523;

architecture normal of i_sfc_logic_c0_for_end624_memread_c0_enter1053_memread2523 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_load_memcoalesce_null_load_0152_memread2574 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_readdata_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_16_memread2579 is
        port (
            in_i_writedata_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_16_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memdep_16_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_control_sync_buffer_memread2554 is
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


    component i_syncbuf_frac_b_sync_buffer_memread2533 is
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


    component i_syncbuf_frac_din_sync_buffer_memread2541 is
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


    component i_syncbuf_frac_dout_sync_buffer_memread2535 is
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


    component i_syncbuf_frac_w_sync_buffer_memread2539 is
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
    signal bgTrunc_i_add676_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add706_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add713_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add736_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add749_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add816_1_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add816_2_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add816_3_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add816_4_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add816_5_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add816_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add853_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memread_4_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memread_5_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memread_6_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_reduction_memread_7_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1126_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1126_off_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1127_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1127_off_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1128_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1128_off_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1129_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1129_off_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1130_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge1130_off_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_storemerge_v_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub669_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub683_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub743_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub855_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub856_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub874_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub892_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub917_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_tmp513_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i16_128_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_256_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_2gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv851_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv852_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv854_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv872_rm_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv888_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv976_1_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv976_2_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv976_3_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv976_4_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv976_5_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_conv976_memread_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_idxprom1062_memread_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl918_memread_memread2538_shift_narrow_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal i_shr893_memread_memread2537_shift_narrow_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal i_shr_1_memread_memread2544_shift_narrow_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2573_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_memread2573_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_memread2573_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unnamed_memread2573_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_unnamed_memread2573_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i16_0gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i16_127_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i16_128_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_255_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_256_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_257_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_512_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i8_0gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_1gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_1131_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1131_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_1419_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1419_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_1420_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1420_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_1421_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1421_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_1422_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1422_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_1423_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1423_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_1424_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1424_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2061_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2061_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2062_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2063_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2063_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2064_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2064_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2066_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2066_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2067_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2067_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2067_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2067_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2068_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2068_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2069_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2069_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2071_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2071_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2072_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2072_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2072_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2072_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2073_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2073_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2074_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2074_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2076_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2076_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2077_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2077_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2077_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2077_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2078_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2078_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2079_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2079_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2081_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2081_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2082_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2082_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2082_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2082_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2083_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2083_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2084_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2084_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2086_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2086_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2087_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2087_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2087_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_2087_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2088_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2088_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2089_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2089_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_2132_xor_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_483_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_483_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_memread_memread2577_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_memread_memread2577_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_add653_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add653_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add676_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add676_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add676_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add676_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add706_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add706_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add706_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add706_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add713_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add713_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add713_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add713_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add713_memread_memread2531_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add713_memread_memread2531_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add736_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add736_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add736_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add736_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add749_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add749_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add749_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add749_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_1_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_1_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_1_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_1_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_2_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_2_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_2_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_2_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_3_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_3_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_3_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_3_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_4_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_4_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_4_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_4_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_5_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_5_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_5_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_5_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add816_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add853_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add853_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add853_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add853_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_and884_1_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_1_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_1_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_and884_2_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_2_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_2_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_and884_3_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_3_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_3_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_and884_4_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_4_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_4_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_and884_5_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_5_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_5_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_and884_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and884_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_and986_rm_memread_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and986_rm_memread_vt_const_7_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_and986_rm_memread_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and986_rm_memread_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and997_1_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_1_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_1_memread_vt_select_7_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and997_2_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_2_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_2_memread_vt_select_7_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and997_3_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_3_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_3_memread_vt_select_7_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and997_4_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_4_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_4_memread_vt_select_7_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and997_5_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_5_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_5_memread_vt_select_7_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and997_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_memread_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and997_memread_vt_select_7_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2458_or_or_memread_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp12532_phi_decision2458_or_or_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp875_rm_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp875_rm_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp875_rm_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp875_rm_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp943_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp943_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp943_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp943_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp959_1_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_1_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_1_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_1_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp959_2_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_2_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_2_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_2_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp959_3_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_3_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_3_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_3_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp959_4_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_4_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_4_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_4_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp959_5_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_5_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_5_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_5_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp959_not_memread_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_not_memread_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_not_memread_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp959_not_memread_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp987_rm_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp998_1_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp998_2_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp998_3_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp998_4_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp998_5_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp998_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i10_memread_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i10_memread_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i10_memread_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i10_memread_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i17_memread_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i17_memread_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i17_memread_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i17_memread_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i3_memread_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i3_memread_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i3_memread_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i3_memread_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_memread_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_memread_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_memread_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_memread_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond788_5_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond788_5_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_idxprom1062_memread_vt_const_63_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_idxprom1062_memread_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom1062_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_max_value_0_i20_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_max_value_0_i20_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_max_value_0_i6_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_max_value_0_i6_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_memcoalesce_null_bitcast_0151_memread_vt_const_63_q : STD_LOGIC_VECTOR (45 downto 0);
    signal i_memcoalesce_null_bitcast_0151_memread_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_not_cmp943_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_memread_4_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_4_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_4_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_4_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_5_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_5_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_5_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_5_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_6_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_6_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_6_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_6_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_7_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_7_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_7_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_reduction_memread_7_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_shl675_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl675_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shl682_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl682_memread_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shl735_memread_vt_const_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_shl735_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl735_memread_vt_select_31_b : STD_LOGIC_VECTOR (28 downto 0);
    signal i_shl742_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl742_memread_vt_select_31_b : STD_LOGIC_VECTOR (28 downto 0);
    signal i_shr975485_1_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr975485_1_memread_vt_select_30_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shr975485_2_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr975485_2_memread_vt_select_30_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shr975485_3_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr975485_3_memread_vt_select_30_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shr975485_4_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr975485_4_memread_vt_select_30_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shr975485_5_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr975485_5_memread_vt_select_30_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shr975485_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr975485_memread_vt_select_30_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_storemerge1126_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1126_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1126_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1126_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1126_off_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1126_off_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1126_off_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1126_off_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_off_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_off_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_off_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1127_off_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_off_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_off_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_off_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1128_off_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_off_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_off_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_off_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1129_off_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_off_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_off_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_off_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge1130_off_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_v_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_v_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_v_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_v_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_storemerge_v_v_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_storemerge_v_v_memread_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sub669_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub669_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub669_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub669_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub683_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub683_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub683_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub683_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub743_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub743_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub743_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub743_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub855_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub855_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub855_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub855_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub856_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub856_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub856_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub856_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub874_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub874_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub874_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub874_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub892_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub892_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub892_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub892_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub917_rm_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub917_rm_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub917_rm_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub917_rm_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_control_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_frac_b_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_frac_din_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_frac_dout_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_frac_w_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_tmp513_memread_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp513_memread_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp513_memread_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp513_memread_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp514_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_tmp514_memread_vt_select_31_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_unnamed_memread2530_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memread2530_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2532_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memread2532_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2572_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_memread2572_vt_select_17_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng1_uid500_i_shl675_memread_memread2525_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid500_i_shl675_memread_memread2525_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid501_i_shl675_memread_memread2525_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng1_uid509_i_shl682_memread_memread2526_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid509_i_shl682_memread_memread2526_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid510_i_shl682_memread_memread2526_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng2_uid518_i_shl735_memread_memread2528_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1Rng2_uid518_i_shl735_memread_memread2528_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1_uid519_i_shl735_memread_memread2528_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid523_i_shl735_memread_memread2528_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid523_i_shl735_memread_memread2528_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid524_i_shl735_memread_memread2528_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng2_uid532_i_shl742_memread_memread2529_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1Rng2_uid532_i_shl742_memread_memread2529_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1_uid533_i_shl742_memread_memread2529_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid537_i_shl742_memread_memread2529_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid537_i_shl742_memread_memread2529_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid538_i_shl742_memread_memread2529_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng8_uid546_i_shl918_memread_memread2538_shift_x_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid546_i_shl918_memread_memread2538_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid547_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx2Rng16_uid549_i_shl918_memread_memread2538_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2Rng16_uid549_i_shl918_memread_memread2538_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2_uid550_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx3Pad24_uid551_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx3Rng24_uid552_i_shl918_memread_memread2538_shift_x_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3Rng24_uid552_i_shl918_memread_memread2538_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3_uid553_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng2_uid557_i_shl918_memread_memread2538_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1Rng2_uid557_i_shl918_memread_memread2538_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1_uid558_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Pad4_uid559_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage1Idx2Rng4_uid560_i_shl918_memread_memread2538_shift_x_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng4_uid560_i_shl918_memread_memread2538_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2_uid561_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Pad6_uid562_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx3Rng6_uid563_i_shl918_memread_memread2538_shift_x_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx3Rng6_uid563_i_shl918_memread_memread2538_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx3_uid564_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx1Rng1_uid568_i_shl918_memread_memread2538_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1Rng1_uid568_i_shl918_memread_memread2538_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1_uid569_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid574_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to8_uid576_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid576_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng8_uid577_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx1_uid578_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to16_uid579_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid579_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2Rng16_uid580_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid581_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to24_uid582_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid582_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3Rng24_uid583_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid584_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid587_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid587_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1Rng2_uid588_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid589_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid590_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid590_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2Rng4_uid591_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx2_uid592_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to6_uid593_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid593_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng6_uid594_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3_uid595_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid598_i_shr893_memread_memread2537_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid599_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng1_uid606_i_shr975485_1_memread_memread2558_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid608_i_shr975485_1_memread_memread2558_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng1_uid615_i_shr975485_2_memread_memread2561_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid617_i_shr975485_2_memread_memread2561_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng1_uid624_i_shr975485_3_memread_memread2564_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid626_i_shr975485_3_memread_memread2564_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng1_uid633_i_shr975485_4_memread_memread2567_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid635_i_shr975485_4_memread_memread2567_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng1_uid642_i_shr975485_5_memread_memread2570_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid644_i_shr975485_5_memread_memread2570_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng1_uid651_i_shr975485_memread_memread2552_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid653_i_shr975485_memread_memread2552_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to8_uid660_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid660_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng8_uid661_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx1_uid662_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to16_uid663_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid663_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2Rng16_uid664_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid665_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to24_uid666_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid666_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3Rng24_uid667_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid668_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid671_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid671_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1Rng2_uid672_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid673_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid674_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid674_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2Rng4_uid675_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx2_uid676_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to6_uid677_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid677_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng6_uid678_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3_uid679_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid682_i_shr_1_memread_memread2544_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid683_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to8_uid690_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid690_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng8_uid691_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx1_uid692_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to16_uid693_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid693_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2Rng16_uid694_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid695_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to24_uid696_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid696_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3Rng24_uid697_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid698_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid701_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid701_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1Rng2_uid702_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid703_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid704_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid704_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2Rng4_uid705_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx2_uid706_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to6_uid707_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid707_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng6_uid708_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3_uid709_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid712_i_shr_2_memread_memread2545_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid713_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to8_uid720_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid720_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng8_uid721_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx1_uid722_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to16_uid723_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid723_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2Rng16_uid724_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid725_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to24_uid726_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid726_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3Rng24_uid727_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid728_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid731_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid731_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1Rng2_uid732_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid733_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid734_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid734_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2Rng4_uid735_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx2_uid736_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to6_uid737_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid737_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng6_uid738_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3_uid739_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid742_i_shr_3_memread_memread2546_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid743_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to8_uid750_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid750_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng8_uid751_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx1_uid752_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to16_uid753_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid753_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2Rng16_uid754_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid755_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to24_uid756_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid756_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3Rng24_uid757_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid758_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid761_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid761_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1Rng2_uid762_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid763_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid764_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid764_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2Rng4_uid765_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx2_uid766_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to6_uid767_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid767_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng6_uid768_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3_uid769_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid772_i_shr_4_memread_memread2547_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid773_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to8_uid780_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid780_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng8_uid781_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx1_uid782_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to16_uid783_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid783_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2Rng16_uid784_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid785_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to24_uid786_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid786_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3Rng24_uid787_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid788_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid791_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid791_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1Rng2_uid792_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid793_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid794_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid794_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2Rng4_uid795_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx2_uid796_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to6_uid797_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid797_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng6_uid798_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3_uid799_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid802_i_shr_5_memread_memread2548_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid803_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid808_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to8_uid810_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid810_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng8_uid811_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx1_uid812_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to16_uid813_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid813_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2Rng16_uid814_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid815_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to24_uid816_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid816_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3Rng24_uid817_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid818_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid821_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid821_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1Rng2_uid822_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid823_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid824_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid824_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2Rng4_uid825_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx2_uid826_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to6_uid827_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid827_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng6_uid828_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3_uid829_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid832_i_shr_memread_memread2543_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid833_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng2_uid841_i_tmp514_memread_memread2527_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1Rng2_uid841_i_tmp514_memread_memread2527_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1_uid842_i_tmp514_memread_memread2527_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2573_mult_x_align_12_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2573_mult_x_align_12_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2573_mult_x_join_13_q : STD_LOGIC_VECTOR (50 downto 0);
    signal i_unnamed_memread2573_mult_x_align_14_q : STD_LOGIC_VECTOR (34 downto 0);
    signal i_unnamed_memread2573_mult_x_align_14_qint : STD_LOGIC_VECTOR (34 downto 0);
    signal i_unnamed_memread2573_mult_x_align_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2573_mult_x_align_15_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_memread2573_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_unnamed_memread2573_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_unnamed_memread2573_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_unnamed_memread2573_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_unnamed_memread2573_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_unnamed_memread2573_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_unnamed_memread2573_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_unnamed_memread2573_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_unnamed_memread2573_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_unnamed_memread2573_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_unnamed_memread2573_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_unnamed_memread2573_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_unnamed_memread2573_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_memread2573_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_unnamed_memread2573_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal i_unnamed_memread2573_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (15 downto 0);
    signal i_unnamed_memread2573_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (15 downto 0);
    signal redist1_i_max_value_0_i20_memread_q_4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist2_i_cmp12532_phi_decision2458_or_or_memread_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_acl_memread_memread2577_q_4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_sync_in_aunroll_x_in_c0_eni191052_1_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni191052_3_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni191052_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni191052_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_sync_in_aunroll_x_in_c0_eni191052_6_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_sync_in_aunroll_x_in_c0_eni191052_7_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_sync_in_aunroll_x_in_c0_eni191052_8_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_sync_in_aunroll_x_in_c0_eni191052_9_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_sync_in_aunroll_x_in_c0_eni191052_10_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_sync_in_aunroll_x_in_c0_eni191052_11_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_sync_in_aunroll_x_in_c0_eni191052_12_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_sync_in_aunroll_x_in_c0_eni191052_13_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_sync_in_aunroll_x_in_c0_eni191052_14_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist25_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_sync_in_aunroll_x_in_i_valid_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_sync_in_aunroll_x_in_i_valid_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_i_shr_1_memread_memread2544_shift_narrow_x_b_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist30_i_shr893_memread_memread2537_shift_narrow_x_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist31_i_shl918_memread_memread2538_shift_narrow_x_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist32_i_conv976_5_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist33_i_conv976_4_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist34_i_conv976_3_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist35_i_conv976_2_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist36_i_conv976_1_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_bgTrunc_i_reduction_memread_6_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist44_bgTrunc_i_add853_rm_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_bgTrunc_i_add816_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist57_bgTrunc_i_add749_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist58_bgTrunc_i_add736_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist59_bgTrunc_i_add713_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist60_bgTrunc_i_add676_memread_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_inputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_outputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_reset0 : std_logic;
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i : signal is true;
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_eq : std_logic;
    attribute preserve of redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_eq : signal is true;
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena_q : signal is true;
    signal redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_max_value_0_i20_memread_q_4_inputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist1_i_max_value_0_i20_memread_q_4_outputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist3_i_acl_memread_memread2577_q_4_inputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist3_i_acl_memread_memread2577_q_4_outputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_i_acl_2089_memread_q_5_mem_reset0 : std_logic;
    signal redist4_i_acl_2089_memread_q_5_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_i_acl_2089_memread_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_i_acl_2089_memread_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_i_acl_2089_memread_q_5_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_i_acl_2089_memread_q_5_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_i_acl_2089_memread_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_i_acl_2089_memread_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist4_i_acl_2089_memread_q_5_rdcnt_i : signal is true;
    signal redist4_i_acl_2089_memread_q_5_rdcnt_eq : std_logic;
    attribute preserve of redist4_i_acl_2089_memread_q_5_rdcnt_eq : signal is true;
    signal redist4_i_acl_2089_memread_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_i_acl_2089_memread_q_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_i_acl_2089_memread_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_acl_2089_memread_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_acl_2089_memread_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_acl_2089_memread_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_acl_2089_memread_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist4_i_acl_2089_memread_q_5_sticky_ena_q : signal is true;
    signal redist4_i_acl_2089_memread_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_acl_2084_memread_q_5_mem_reset0 : std_logic;
    signal redist5_i_acl_2084_memread_q_5_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist5_i_acl_2084_memread_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_i_acl_2084_memread_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_i_acl_2084_memread_q_5_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist5_i_acl_2084_memread_q_5_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist5_i_acl_2084_memread_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_i_acl_2084_memread_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist5_i_acl_2084_memread_q_5_rdcnt_i : signal is true;
    signal redist5_i_acl_2084_memread_q_5_rdcnt_eq : std_logic;
    attribute preserve of redist5_i_acl_2084_memread_q_5_rdcnt_eq : signal is true;
    signal redist5_i_acl_2084_memread_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_i_acl_2084_memread_q_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_i_acl_2084_memread_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_acl_2084_memread_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_acl_2084_memread_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_acl_2084_memread_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_acl_2084_memread_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist5_i_acl_2084_memread_q_5_sticky_ena_q : signal is true;
    signal redist5_i_acl_2084_memread_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_acl_2079_memread_q_5_mem_reset0 : std_logic;
    signal redist6_i_acl_2079_memread_q_5_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_i_acl_2079_memread_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_i_acl_2079_memread_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_i_acl_2079_memread_q_5_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_i_acl_2079_memread_q_5_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_i_acl_2079_memread_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_i_acl_2079_memread_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist6_i_acl_2079_memread_q_5_rdcnt_i : signal is true;
    signal redist6_i_acl_2079_memread_q_5_rdcnt_eq : std_logic;
    attribute preserve of redist6_i_acl_2079_memread_q_5_rdcnt_eq : signal is true;
    signal redist6_i_acl_2079_memread_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_i_acl_2079_memread_q_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_i_acl_2079_memread_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_acl_2079_memread_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_acl_2079_memread_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_acl_2079_memread_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_acl_2079_memread_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist6_i_acl_2079_memread_q_5_sticky_ena_q : signal is true;
    signal redist6_i_acl_2079_memread_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_2074_memread_q_5_mem_reset0 : std_logic;
    signal redist7_i_acl_2074_memread_q_5_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist7_i_acl_2074_memread_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_i_acl_2074_memread_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_i_acl_2074_memread_q_5_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist7_i_acl_2074_memread_q_5_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist7_i_acl_2074_memread_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_i_acl_2074_memread_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist7_i_acl_2074_memread_q_5_rdcnt_i : signal is true;
    signal redist7_i_acl_2074_memread_q_5_rdcnt_eq : std_logic;
    attribute preserve of redist7_i_acl_2074_memread_q_5_rdcnt_eq : signal is true;
    signal redist7_i_acl_2074_memread_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_i_acl_2074_memread_q_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_i_acl_2074_memread_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_2074_memread_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_2074_memread_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_2074_memread_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_2074_memread_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist7_i_acl_2074_memread_q_5_sticky_ena_q : signal is true;
    signal redist7_i_acl_2074_memread_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_acl_2069_memread_q_5_mem_reset0 : std_logic;
    signal redist8_i_acl_2069_memread_q_5_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist8_i_acl_2069_memread_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_i_acl_2069_memread_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_i_acl_2069_memread_q_5_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist8_i_acl_2069_memread_q_5_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist8_i_acl_2069_memread_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_i_acl_2069_memread_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist8_i_acl_2069_memread_q_5_rdcnt_i : signal is true;
    signal redist8_i_acl_2069_memread_q_5_rdcnt_eq : std_logic;
    attribute preserve of redist8_i_acl_2069_memread_q_5_rdcnt_eq : signal is true;
    signal redist8_i_acl_2069_memread_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_i_acl_2069_memread_q_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_i_acl_2069_memread_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_acl_2069_memread_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_acl_2069_memread_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_acl_2069_memread_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_acl_2069_memread_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist8_i_acl_2069_memread_q_5_sticky_ena_q : signal is true;
    signal redist8_i_acl_2069_memread_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_acl_2064_memread_q_5_mem_reset0 : std_logic;
    signal redist9_i_acl_2064_memread_q_5_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist9_i_acl_2064_memread_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_i_acl_2064_memread_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_i_acl_2064_memread_q_5_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist9_i_acl_2064_memread_q_5_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist9_i_acl_2064_memread_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_i_acl_2064_memread_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist9_i_acl_2064_memread_q_5_rdcnt_i : signal is true;
    signal redist9_i_acl_2064_memread_q_5_rdcnt_eq : std_logic;
    attribute preserve of redist9_i_acl_2064_memread_q_5_rdcnt_eq : signal is true;
    signal redist9_i_acl_2064_memread_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_i_acl_2064_memread_q_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_i_acl_2064_memread_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_acl_2064_memread_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_acl_2064_memread_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_acl_2064_memread_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_acl_2064_memread_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist9_i_acl_2064_memread_q_5_sticky_ena_q : signal is true;
    signal redist9_i_acl_2064_memread_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_reset0 : std_logic;
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_i : signal is true;
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena_q : signal is true;
    signal redist46_bgTrunc_i_add816_memread_sel_x_b_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_reset0 : std_logic;
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_i : signal is true;
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena_q : signal is true;
    signal redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_reset0 : std_logic;
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_i : signal is true;
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena_q : signal is true;
    signal redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_reset0 : std_logic;
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_i : signal is true;
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena_q : signal is true;
    signal redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_reset0 : std_logic;
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_i : signal is true;
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena_q : signal is true;
    signal redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_reset0 : std_logic;
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_i : signal is true;
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena_q : signal is true;
    signal redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist25_sync_in_aunroll_x_in_i_valid_1(DELAY,945)
    redist25_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist25_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist26_sync_in_aunroll_x_in_i_valid_5(DELAY,946)
    redist26_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist25_sync_in_aunroll_x_in_i_valid_1_q, xout => redist26_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- redist27_sync_in_aunroll_x_in_i_valid_6(DELAY,947)
    redist27_sync_in_aunroll_x_in_i_valid_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist26_sync_in_aunroll_x_in_i_valid_5_q, xout => redist27_sync_in_aunroll_x_in_i_valid_6_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_acl_2132_xor_memread(LOGICAL,257)@0
    i_acl_2132_xor_memread_q <= in_c0_eni191052_16 xor VCC_q;

    -- i_cmp12532_phi_decision2458_or_or_memread(LOGICAL,332)@0 + 1
    i_cmp12532_phi_decision2458_or_or_memread_qi <= in_c0_eni191052_17 or i_acl_2132_xor_memread_q;
    i_cmp12532_phi_decision2458_or_or_memread_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp12532_phi_decision2458_or_or_memread_qi, xout => i_cmp12532_phi_decision2458_or_or_memread_q, clk => clock, aclr => resetn );

    -- redist2_i_cmp12532_phi_decision2458_or_or_memread_q_6(DELAY,922)
    redist2_i_cmp12532_phi_decision2458_or_or_memread_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp12532_phi_decision2458_or_or_memread_q, xout => redist2_i_cmp12532_phi_decision2458_or_or_memread_q_6_q, clk => clock, aclr => resetn );

    -- i_memcoalesce_null_bitcast_0151_memread_vt_const_63(CONSTANT,377)
    i_memcoalesce_null_bitcast_0151_memread_vt_const_63_q <= "0000000000000000000000000000000000000000000000";

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_notEnable(LOGICAL,989)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_nor(LOGICAL,990)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_nor_q <= not (redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_notEnable_q or redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena_q);

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_last(CONSTANT,986)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_last_q <= "01";

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmp(LOGICAL,987)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmp_q <= "1" WHEN redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_last_q = redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_q ELSE "0";

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmpReg(REG,988)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmpReg_q <= STD_LOGIC_VECTOR(redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena(REG,991)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_nor_q = "1") THEN
                redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_enaAnd(LOGICAL,992)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_enaAnd_q <= redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_sticky_ena_q and VCC_q;

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt(COUNTER,984)
    -- low=0, high=2, step=1, init=0
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_eq <= '1';
            ELSE
                redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_eq <= '0';
            END IF;
            IF (redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_eq = '1') THEN
                redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i <= redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i + 2;
            ELSE
                redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i <= redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_i, 2)));

    -- i_unnamed_memread2573_mult_multconst_x(CONSTANT,163)
    i_unnamed_memread2573_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- i_idxprom1062_memread_vt_const_63(CONSTANT,370)
    i_idxprom1062_memread_vt_const_63_q <= "000000000000000000000000000000000000000000000000";

    -- i_idxprom1062_memread_sel_x(BITSELECT,66)@0
    i_idxprom1062_memread_sel_x_b <= std_logic_vector(resize(unsigned(in_c0_eni191052_15(15 downto 0)), 64));

    -- i_idxprom1062_memread_vt_select_15(BITSELECT,372)@0
    i_idxprom1062_memread_vt_select_15_b <= i_idxprom1062_memread_sel_x_b(15 downto 0);

    -- i_idxprom1062_memread_vt_join(BITJOIN,371)@0
    i_idxprom1062_memread_vt_join_q <= i_idxprom1062_memread_vt_const_63_q & i_idxprom1062_memread_vt_select_15_b;

    -- i_unnamed_memread2573_mult_x_bs1_merged_bit_select(BITSELECT,919)@0
    i_unnamed_memread2573_mult_x_bs1_merged_bit_select_b <= i_idxprom1062_memread_vt_join_q(15 downto 0);
    i_unnamed_memread2573_mult_x_bs1_merged_bit_select_c <= i_idxprom1062_memread_vt_join_q(31 downto 16);
    i_unnamed_memread2573_mult_x_bs1_merged_bit_select_d <= i_idxprom1062_memread_vt_join_q(47 downto 32);
    i_unnamed_memread2573_mult_x_bs1_merged_bit_select_e <= i_idxprom1062_memread_vt_join_q(63 downto 48);

    -- i_unnamed_memread2573_mult_x_im9_shift0(BITSHIFT,915)@0
    i_unnamed_memread2573_mult_x_im9_shift0_qint <= i_unnamed_memread2573_mult_x_bs1_merged_bit_select_e & "00";
    i_unnamed_memread2573_mult_x_im9_shift0_q <= i_unnamed_memread2573_mult_x_im9_shift0_qint(17 downto 0);

    -- i_unnamed_memread2573_mult_x_align_15(BITSHIFT,860)@0
    i_unnamed_memread2573_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_unnamed_memread2573_mult_x_im9_shift0_q) & "0000000000000";
    i_unnamed_memread2573_mult_x_align_15_q <= i_unnamed_memread2573_mult_x_align_15_qint(31 downto 0);

    -- i_unnamed_memread2573_mult_x_im3_shift0(BITSHIFT,913)@0
    i_unnamed_memread2573_mult_x_im3_shift0_qint <= i_unnamed_memread2573_mult_x_bs1_merged_bit_select_c & "00";
    i_unnamed_memread2573_mult_x_im3_shift0_q <= i_unnamed_memread2573_mult_x_im3_shift0_qint(17 downto 0);

    -- i_unnamed_memread2573_mult_x_align_14(BITSHIFT,859)@0
    i_unnamed_memread2573_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_unnamed_memread2573_mult_x_im3_shift0_q) & "0000000000000000";
    i_unnamed_memread2573_mult_x_align_14_q <= i_unnamed_memread2573_mult_x_align_14_qint(34 downto 0);

    -- i_unnamed_memread2573_mult_x_join_16(BITJOIN,861)@0
    i_unnamed_memread2573_mult_x_join_16_q <= i_unnamed_memread2573_mult_x_align_15_q & i_unnamed_memread2573_mult_x_align_14_q;

    -- i_unnamed_memread2573_mult_x_im6_shift0(BITSHIFT,914)@0
    i_unnamed_memread2573_mult_x_im6_shift0_qint <= i_unnamed_memread2573_mult_x_bs1_merged_bit_select_d & "00";
    i_unnamed_memread2573_mult_x_im6_shift0_q <= i_unnamed_memread2573_mult_x_im6_shift0_qint(17 downto 0);

    -- i_unnamed_memread2573_mult_x_align_12(BITSHIFT,857)@0
    i_unnamed_memread2573_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_unnamed_memread2573_mult_x_im6_shift0_q) & "0000000000000";
    i_unnamed_memread2573_mult_x_align_12_q <= i_unnamed_memread2573_mult_x_align_12_qint(31 downto 0);

    -- i_unnamed_memread2573_mult_x_im0_shift0(BITSHIFT,912)@0
    i_unnamed_memread2573_mult_x_im0_shift0_qint <= i_unnamed_memread2573_mult_x_bs1_merged_bit_select_b & "00";
    i_unnamed_memread2573_mult_x_im0_shift0_q <= i_unnamed_memread2573_mult_x_im0_shift0_qint(17 downto 0);

    -- i_unnamed_memread2573_mult_x_join_13(BITJOIN,858)@0
    i_unnamed_memread2573_mult_x_join_13_q <= i_unnamed_memread2573_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_unnamed_memread2573_mult_x_im0_shift0_q);

    -- i_unnamed_memread2573_mult_x_result_add_0_0(ADD,862)@0
    i_unnamed_memread2573_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000000" & i_unnamed_memread2573_mult_x_join_13_q);
    i_unnamed_memread2573_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_unnamed_memread2573_mult_x_join_16_q);
    i_unnamed_memread2573_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_unnamed_memread2573_mult_x_result_add_0_0_a) + UNSIGNED(i_unnamed_memread2573_mult_x_result_add_0_0_b));
    i_unnamed_memread2573_mult_x_result_add_0_0_q <= i_unnamed_memread2573_mult_x_result_add_0_0_o(67 downto 0);

    -- i_unnamed_memread2573_mult_extender_x(BITJOIN,162)@0
    i_unnamed_memread2573_mult_extender_x_q <= i_unnamed_memread2573_mult_multconst_x_q & i_unnamed_memread2573_mult_x_result_add_0_0_q(66 downto 0);

    -- i_unnamed_memread2573_trunc_sel_x(BITSELECT,164)@0
    i_unnamed_memread2573_trunc_sel_x_b <= i_unnamed_memread2573_mult_extender_x_q(63 downto 0);

    -- i_unnamed_memread2573_dupName_0_trunc_sel_x(BITSELECT,159)@0
    i_unnamed_memread2573_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_unnamed_memread2573_trunc_sel_x_b);
    i_unnamed_memread2573_dupName_0_trunc_sel_x_b <= i_unnamed_memread2573_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_unnamed_memread2572_vt_select_17(BITSELECT,455)@0
    i_unnamed_memread2572_vt_select_17_b <= i_unnamed_memread2573_dupName_0_trunc_sel_x_b(17 downto 2);

    -- i_unnamed_memread2572_vt_join(BITJOIN,454)@0
    i_unnamed_memread2572_vt_join_q <= i_memcoalesce_null_bitcast_0151_memread_vt_const_63_q & i_unnamed_memread2572_vt_select_17_b & i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q;

    -- i_memcoalesce_null_bitcast_0151_memread_vt_select_17(BITSELECT,379)@0
    i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b <= i_unnamed_memread2572_vt_join_q(17 downto 2);

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_inputreg(DELAY,981)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b, xout => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_inputreg_q, clk => clock, aclr => resetn );

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_wraddr(REG,985)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_wraddr_q <= STD_LOGIC_VECTOR(redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem(DUALMEM,983)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_ia <= STD_LOGIC_VECTOR(redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_inputreg_q);
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_aa <= redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_wraddr_q;
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_ab <= redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_rdcnt_q;
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_reset0 <= not (resetn);
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_dmem : altera_syncram
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
        clocken1 => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_reset0,
        clock1 => clock,
        address_a => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_aa,
        data_a => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_ab,
        q_b => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_iq
    );
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_q <= redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_iq(15 downto 0);

    -- redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_outputreg(DELAY,982)
    redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_outputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_mem_q, xout => redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_outputreg_q, clk => clock, aclr => resetn );

    -- i_memcoalesce_null_bitcast_0151_memread_vt_const_1(CONSTANT,376)
    i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q <= "00";

    -- i_memcoalesce_null_bitcast_0151_memread_vt_join(BITJOIN,378)@6
    i_memcoalesce_null_bitcast_0151_memread_vt_join_q <= i_memcoalesce_null_bitcast_0151_memread_vt_const_63_q & redist0_i_memcoalesce_null_bitcast_0151_memread_vt_select_17_b_6_outputreg_q & i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q;

    -- rightShiftStage0Idx1Rng1_uid615_i_shr975485_2_memread_memread2561_shift_x(BITSELECT,614)@4
    rightShiftStage0Idx1Rng1_uid615_i_shr975485_2_memread_memread2561_shift_x_b <= redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q(31 downto 1);

    -- rightShiftStage0Idx1_uid617_i_shr975485_2_memread_memread2561_shift_x(BITJOIN,616)@4
    rightShiftStage0Idx1_uid617_i_shr975485_2_memread_memread2561_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid615_i_shr975485_2_memread_memread2561_shift_x_b;

    -- dupName_0_c_i32_2gr_x(CONSTANT,43)
    dupName_0_c_i32_2gr_x_q <= "11111111111111111111111111111110";

    -- redist20_sync_in_aunroll_x_in_c0_eni191052_10_1(DELAY,940)
    redist20_sync_in_aunroll_x_in_c0_eni191052_10_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_10, xout => redist20_sync_in_aunroll_x_in_c0_eni191052_10_1_q, clk => clock, aclr => resetn );

    -- leftShiftStage0Idx1Rng2_uid841_i_tmp514_memread_memread2527_shift_x(BITSELECT,840)@0
    leftShiftStage0Idx1Rng2_uid841_i_tmp514_memread_memread2527_shift_x_in <= bgTrunc_i_tmp513_memread_sel_x_b(29 downto 0);
    leftShiftStage0Idx1Rng2_uid841_i_tmp514_memread_memread2527_shift_x_b <= leftShiftStage0Idx1Rng2_uid841_i_tmp514_memread_memread2527_shift_x_in(29 downto 0);

    -- leftShiftStage0Idx1_uid842_i_tmp514_memread_memread2527_shift_x(BITJOIN,841)@0
    leftShiftStage0Idx1_uid842_i_tmp514_memread_memread2527_shift_x_q <= leftShiftStage0Idx1Rng2_uid841_i_tmp514_memread_memread2527_shift_x_b & i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q;

    -- i_tmp513_memread(ADD,446)@0
    i_tmp513_memread_a <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_2);
    i_tmp513_memread_b <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_7);
    i_tmp513_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_tmp513_memread_a) + UNSIGNED(i_tmp513_memread_b));
    i_tmp513_memread_q <= i_tmp513_memread_o(32 downto 0);

    -- bgTrunc_i_tmp513_memread_sel_x(BITSELECT,38)@0
    bgTrunc_i_tmp513_memread_sel_x_b <= i_tmp513_memread_q(31 downto 0);

    -- leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x(MUX,843)@0
    leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_s <= VCC_q;
    leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_combproc: PROCESS (leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_s, bgTrunc_i_tmp513_memread_sel_x_b, leftShiftStage0Idx1_uid842_i_tmp514_memread_memread2527_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_q <= bgTrunc_i_tmp513_memread_sel_x_b;
            WHEN "1" => leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_q <= leftShiftStage0Idx1_uid842_i_tmp514_memread_memread2527_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_tmp514_memread_vt_select_31(BITSELECT,449)@0
    i_tmp514_memread_vt_select_31_b <= leftShiftStage0_uid844_i_tmp514_memread_memread2527_shift_x_q(31 downto 2);

    -- i_tmp514_memread_vt_join(BITJOIN,448)@0
    i_tmp514_memread_vt_join_q <= i_tmp514_memread_vt_select_31_b & i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q;

    -- i_add706_memread(ADD,262)@0
    i_add706_memread_a <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_6);
    i_add706_memread_b <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_4);
    i_add706_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add706_memread_a) + UNSIGNED(i_add706_memread_b));
    i_add706_memread_q <= i_add706_memread_o(32 downto 0);

    -- bgTrunc_i_add706_memread_sel_x(BITSELECT,3)@0
    bgTrunc_i_add706_memread_sel_x_b <= i_add706_memread_q(31 downto 0);

    -- i_add713_memread(ADD,263)@0
    i_add713_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_add706_memread_sel_x_b);
    i_add713_memread_b <= STD_LOGIC_VECTOR("0" & i_tmp514_memread_vt_join_q);
    i_add713_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add713_memread_a) + UNSIGNED(i_add713_memread_b));
    i_add713_memread_q <= i_add713_memread_o(32 downto 0);

    -- bgTrunc_i_add713_memread_sel_x(BITSELECT,4)@0
    bgTrunc_i_add713_memread_sel_x_b <= i_add713_memread_q(31 downto 0);

    -- redist59_bgTrunc_i_add713_memread_sel_x_b_1(DELAY,979)
    redist59_bgTrunc_i_add713_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add713_memread_sel_x_b, xout => redist59_bgTrunc_i_add713_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist16_sync_in_aunroll_x_in_c0_eni191052_6_1(DELAY,936)
    redist16_sync_in_aunroll_x_in_c0_eni191052_6_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_6, xout => redist16_sync_in_aunroll_x_in_c0_eni191052_6_1_q, clk => clock, aclr => resetn );

    -- redist10_sync_in_aunroll_x_in_c0_eni191052_1_1(DELAY,930)
    redist10_sync_in_aunroll_x_in_c0_eni191052_1_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_1, xout => redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q, clk => clock, aclr => resetn );

    -- i_add713_memread_memread2531(MUX,264)@1
    i_add713_memread_memread2531_s <= redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q;
    i_add713_memread_memread2531_combproc: PROCESS (i_add713_memread_memread2531_s, redist16_sync_in_aunroll_x_in_c0_eni191052_6_1_q, redist59_bgTrunc_i_add713_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_add713_memread_memread2531_s) IS
            WHEN "0" => i_add713_memread_memread2531_q <= redist16_sync_in_aunroll_x_in_c0_eni191052_6_1_q;
            WHEN "1" => i_add713_memread_memread2531_q <= redist59_bgTrunc_i_add713_memread_sel_x_b_1_q;
            WHEN OTHERS => i_add713_memread_memread2531_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_add816_2_memread(ADD,268)@1
    i_add816_2_memread_a <= STD_LOGIC_VECTOR("0" & i_add713_memread_memread2531_q);
    i_add816_2_memread_b <= STD_LOGIC_VECTOR("0" & redist20_sync_in_aunroll_x_in_c0_eni191052_10_1_q);
    i_add816_2_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add816_2_memread_a) + UNSIGNED(i_add816_2_memread_b));
    i_add816_2_memread_q <= i_add816_2_memread_o(32 downto 0);

    -- bgTrunc_i_add816_2_memread_sel_x(BITSELECT,8)@1
    bgTrunc_i_add816_2_memread_sel_x_b <= i_add816_2_memread_q(31 downto 0);

    -- redist53_bgTrunc_i_add816_2_memread_sel_x_b_2(DELAY,973)
    redist53_bgTrunc_i_add816_2_memread_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add816_2_memread_sel_x_b, xout => redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- xMSB_uid688_i_shr_2_memread_memread2545_shift_x(BITSELECT,687)@3
    xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b <= STD_LOGIC_VECTOR(redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q(31 downto 31));

    -- rightShiftStage2Idx1Rng1_uid712_i_shr_2_memread_memread2545_shift_x(BITSELECT,711)@3
    rightShiftStage2Idx1Rng1_uid712_i_shr_2_memread_memread2545_shift_x_b <= rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q(31 downto 1);

    -- rightShiftStage2Idx1_uid713_i_shr_2_memread_memread2545_shift_x(BITJOIN,712)@3
    rightShiftStage2Idx1_uid713_i_shr_2_memread_memread2545_shift_x_q <= xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b & rightShiftStage2Idx1Rng1_uid712_i_shr_2_memread_memread2545_shift_x_b;

    -- seMsb_to6_uid707(BITSELECT,706)@3
    seMsb_to6_uid707_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b(0)) & xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b));
    seMsb_to6_uid707_b <= STD_LOGIC_VECTOR(seMsb_to6_uid707_in(5 downto 0));

    -- rightShiftStage1Idx3Rng6_uid708_i_shr_2_memread_memread2545_shift_x(BITSELECT,707)@3
    rightShiftStage1Idx3Rng6_uid708_i_shr_2_memread_memread2545_shift_x_b <= rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q(31 downto 6);

    -- rightShiftStage1Idx3_uid709_i_shr_2_memread_memread2545_shift_x(BITJOIN,708)@3
    rightShiftStage1Idx3_uid709_i_shr_2_memread_memread2545_shift_x_q <= seMsb_to6_uid707_b & rightShiftStage1Idx3Rng6_uid708_i_shr_2_memread_memread2545_shift_x_b;

    -- seMsb_to4_uid704(BITSELECT,703)@3
    seMsb_to4_uid704_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b(0)) & xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b));
    seMsb_to4_uid704_b <= STD_LOGIC_VECTOR(seMsb_to4_uid704_in(3 downto 0));

    -- rightShiftStage1Idx2Rng4_uid705_i_shr_2_memread_memread2545_shift_x(BITSELECT,704)@3
    rightShiftStage1Idx2Rng4_uid705_i_shr_2_memread_memread2545_shift_x_b <= rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx2_uid706_i_shr_2_memread_memread2545_shift_x(BITJOIN,705)@3
    rightShiftStage1Idx2_uid706_i_shr_2_memread_memread2545_shift_x_q <= seMsb_to4_uid704_b & rightShiftStage1Idx2Rng4_uid705_i_shr_2_memread_memread2545_shift_x_b;

    -- seMsb_to2_uid701(BITSELECT,700)@3
    seMsb_to2_uid701_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b(0)) & xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b));
    seMsb_to2_uid701_b <= STD_LOGIC_VECTOR(seMsb_to2_uid701_in(1 downto 0));

    -- rightShiftStage1Idx1Rng2_uid702_i_shr_2_memread_memread2545_shift_x(BITSELECT,701)@3
    rightShiftStage1Idx1Rng2_uid702_i_shr_2_memread_memread2545_shift_x_b <= rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q(31 downto 2);

    -- rightShiftStage1Idx1_uid703_i_shr_2_memread_memread2545_shift_x(BITJOIN,702)@3
    rightShiftStage1Idx1_uid703_i_shr_2_memread_memread2545_shift_x_q <= seMsb_to2_uid701_b & rightShiftStage1Idx1Rng2_uid702_i_shr_2_memread_memread2545_shift_x_b;

    -- seMsb_to24_uid696(BITSELECT,695)@3
    seMsb_to24_uid696_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b(0)) & xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b));
    seMsb_to24_uid696_b <= STD_LOGIC_VECTOR(seMsb_to24_uid696_in(23 downto 0));

    -- rightShiftStage0Idx3Rng24_uid697_i_shr_2_memread_memread2545_shift_x(BITSELECT,696)@3
    rightShiftStage0Idx3Rng24_uid697_i_shr_2_memread_memread2545_shift_x_b <= redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q(31 downto 24);

    -- rightShiftStage0Idx3_uid698_i_shr_2_memread_memread2545_shift_x(BITJOIN,697)@3
    rightShiftStage0Idx3_uid698_i_shr_2_memread_memread2545_shift_x_q <= seMsb_to24_uid696_b & rightShiftStage0Idx3Rng24_uid697_i_shr_2_memread_memread2545_shift_x_b;

    -- seMsb_to16_uid693(BITSELECT,692)@3
    seMsb_to16_uid693_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b(0)) & xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b));
    seMsb_to16_uid693_b <= STD_LOGIC_VECTOR(seMsb_to16_uid693_in(15 downto 0));

    -- rightShiftStage0Idx2Rng16_uid694_i_shr_2_memread_memread2545_shift_x(BITSELECT,693)@3
    rightShiftStage0Idx2Rng16_uid694_i_shr_2_memread_memread2545_shift_x_b <= redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q(31 downto 16);

    -- rightShiftStage0Idx2_uid695_i_shr_2_memread_memread2545_shift_x(BITJOIN,694)@3
    rightShiftStage0Idx2_uid695_i_shr_2_memread_memread2545_shift_x_q <= seMsb_to16_uid693_b & rightShiftStage0Idx2Rng16_uid694_i_shr_2_memread_memread2545_shift_x_b;

    -- seMsb_to8_uid690(BITSELECT,689)@3
    seMsb_to8_uid690_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b(0)) & xMSB_uid688_i_shr_2_memread_memread2545_shift_x_b));
    seMsb_to8_uid690_b <= STD_LOGIC_VECTOR(seMsb_to8_uid690_in(7 downto 0));

    -- rightShiftStage0Idx1Rng8_uid691_i_shr_2_memread_memread2545_shift_x(BITSELECT,690)@3
    rightShiftStage0Idx1Rng8_uid691_i_shr_2_memread_memread2545_shift_x_b <= redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q(31 downto 8);

    -- rightShiftStage0Idx1_uid692_i_shr_2_memread_memread2545_shift_x(BITJOIN,691)@3
    rightShiftStage0Idx1_uid692_i_shr_2_memread_memread2545_shift_x_q <= seMsb_to8_uid690_b & rightShiftStage0Idx1Rng8_uid691_i_shr_2_memread_memread2545_shift_x_b;

    -- rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x(MUX,699)@3
    rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b;
    rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_combproc: PROCESS (rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_s, redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q, rightShiftStage0Idx1_uid692_i_shr_2_memread_memread2545_shift_x_q, rightShiftStage0Idx2_uid695_i_shr_2_memread_memread2545_shift_x_q, rightShiftStage0Idx3_uid698_i_shr_2_memread_memread2545_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q <= redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q;
            WHEN "01" => rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage0Idx1_uid692_i_shr_2_memread_memread2545_shift_x_q;
            WHEN "10" => rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage0Idx2_uid695_i_shr_2_memread_memread2545_shift_x_q;
            WHEN "11" => rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage0Idx3_uid698_i_shr_2_memread_memread2545_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x(MUX,710)@3
    rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c;
    rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_combproc: PROCESS (rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_s, rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q, rightShiftStage1Idx1_uid703_i_shr_2_memread_memread2545_shift_x_q, rightShiftStage1Idx2_uid706_i_shr_2_memread_memread2545_shift_x_q, rightShiftStage1Idx3_uid709_i_shr_2_memread_memread2545_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_s) IS
            WHEN "00" => rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage0_uid700_i_shr_2_memread_memread2545_shift_x_q;
            WHEN "01" => rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage1Idx1_uid703_i_shr_2_memread_memread2545_shift_x_q;
            WHEN "10" => rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage1Idx2_uid706_i_shr_2_memread_memread2545_shift_x_q;
            WHEN "11" => rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage1Idx3_uid709_i_shr_2_memread_memread2545_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_syncbuf_frac_dout_sync_buffer_memread(BLACKBOX,444)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_frac_dout_sync_buffer_memread : i_syncbuf_frac_dout_sync_buffer_memread2535
    PORT MAP (
        in_buffer_in => in_frac_dout,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist25_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_frac_dout_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv854_rm_memread_sel_x(BITSELECT,57)@1
    i_conv854_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(i_syncbuf_frac_dout_sync_buffer_memread_out_buffer_out(7 downto 0)), 32)));

    -- i_syncbuf_frac_din_sync_buffer_memread(BLACKBOX,443)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_frac_din_sync_buffer_memread : i_syncbuf_frac_din_sync_buffer_memread2541
    PORT MAP (
        in_buffer_in => in_frac_din,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist25_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_frac_din_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv852_rm_memread_sel_x(BITSELECT,56)@1
    i_conv852_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(i_syncbuf_frac_din_sync_buffer_memread_out_buffer_out(7 downto 0)), 32)));

    -- dupName_0_c_i32_1gr_x(CONSTANT,41)
    dupName_0_c_i32_1gr_x_q <= "11111111111111111111111111111111";

    -- i_syncbuf_frac_w_sync_buffer_memread(BLACKBOX,445)@0
    thei_syncbuf_frac_w_sync_buffer_memread : i_syncbuf_frac_w_sync_buffer_memread2539
    PORT MAP (
        in_buffer_in => in_frac_w,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_frac_w_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv851_rm_memread_sel_x(BITSELECT,55)@0
    i_conv851_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(i_syncbuf_frac_w_sync_buffer_memread_out_buffer_out(7 downto 0)), 32)));

    -- i_add853_rm_memread(ADD,273)@0
    i_add853_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv851_rm_memread_sel_x_b);
    i_add853_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_add853_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add853_rm_memread_a) + UNSIGNED(i_add853_rm_memread_b));
    i_add853_rm_memread_q <= i_add853_rm_memread_o(32 downto 0);

    -- bgTrunc_i_add853_rm_memread_sel_x(BITSELECT,13)@0
    bgTrunc_i_add853_rm_memread_sel_x_b <= i_add853_rm_memread_q(31 downto 0);

    -- redist44_bgTrunc_i_add853_rm_memread_sel_x_b_1(DELAY,964)
    redist44_bgTrunc_i_add853_rm_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add853_rm_memread_sel_x_b, xout => redist44_bgTrunc_i_add853_rm_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_sub855_rm_memread(ADD,436)@1
    i_sub855_rm_memread_a <= STD_LOGIC_VECTOR("0" & redist44_bgTrunc_i_add853_rm_memread_sel_x_b_1_q);
    i_sub855_rm_memread_b <= STD_LOGIC_VECTOR("0" & i_conv852_rm_memread_sel_x_b);
    i_sub855_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub855_rm_memread_a) + UNSIGNED(i_sub855_rm_memread_b));
    i_sub855_rm_memread_q <= i_sub855_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub855_rm_memread_sel_x(BITSELECT,33)@1
    bgTrunc_i_sub855_rm_memread_sel_x_b <= i_sub855_rm_memread_q(31 downto 0);

    -- i_sub856_rm_memread(SUB,437)@1
    i_sub856_rm_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_sub855_rm_memread_sel_x_b);
    i_sub856_rm_memread_b <= STD_LOGIC_VECTOR("0" & i_conv854_rm_memread_sel_x_b);
    i_sub856_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub856_rm_memread_a) - UNSIGNED(i_sub856_rm_memread_b));
    i_sub856_rm_memread_q <= i_sub856_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub856_rm_memread_sel_x(BITSELECT,34)@1
    bgTrunc_i_sub856_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(i_sub856_rm_memread_q(31 downto 0));

    -- i_shr_1_memread_memread2544_shift_narrow_x(BITSELECT,123)@1
    i_shr_1_memread_memread2544_shift_narrow_x_b <= bgTrunc_i_sub856_rm_memread_sel_x_b(4 downto 0);

    -- redist29_i_shr_1_memread_memread2544_shift_narrow_x_b_2(DELAY,949)
    redist29_i_shr_1_memread_memread2544_shift_narrow_x_b_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_shr_1_memread_memread2544_shift_narrow_x_b, xout => redist29_i_shr_1_memread_memread2544_shift_narrow_x_b_2_q, clk => clock, aclr => resetn );

    -- rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select(BITSELECT,918)@3
    rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b <= redist29_i_shr_1_memread_memread2544_shift_narrow_x_b_2_q(4 downto 3);
    rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c <= redist29_i_shr_1_memread_memread2544_shift_narrow_x_b_2_q(2 downto 1);
    rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d <= redist29_i_shr_1_memread_memread2544_shift_narrow_x_b_2_q(0 downto 0);

    -- rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x(MUX,714)@3
    rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d;
    rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_combproc: PROCESS (rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_s, rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q, rightShiftStage2Idx1_uid713_i_shr_2_memread_memread2545_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage1_uid711_i_shr_2_memread_memread2545_shift_x_q;
            WHEN "1" => rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_q <= rightShiftStage2Idx1_uid713_i_shr_2_memread_memread2545_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and884_2_memread(LOGICAL,278)@3
    i_and884_2_memread_q <= rightShiftStage2_uid715_i_shr_2_memread_memread2545_shift_x_q and dupName_0_c_i32_2gr_x_q;

    -- i_and884_2_memread_vt_select_31(BITSELECT,281)@3
    i_and884_2_memread_vt_select_31_b <= i_and884_2_memread_q(31 downto 1);

    -- i_and884_2_memread_vt_join(BITJOIN,280)@3
    i_and884_2_memread_vt_join_q <= i_and884_2_memread_vt_select_31_b & GND_q;

    -- c_i32_1gr(CONSTANT,215)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- redist24_sync_in_aunroll_x_in_c0_eni191052_14_2(DELAY,944)
    redist24_sync_in_aunroll_x_in_c0_eni191052_14_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_14, xout => redist24_sync_in_aunroll_x_in_c0_eni191052_14_2_q, clk => clock, aclr => resetn );

    -- i_conv888_memread_sel_x(BITSELECT,59)@2
    i_conv888_memread_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist24_sync_in_aunroll_x_in_c0_eni191052_14_2_q(15 downto 0)), 32)));

    -- xMSB_uid574_i_shr893_memread_memread2537_shift_x(BITSELECT,573)@2
    xMSB_uid574_i_shr893_memread_memread2537_shift_x_b <= STD_LOGIC_VECTOR(i_conv888_memread_sel_x_b(31 downto 31));

    -- rightShiftStage2Idx1Rng1_uid598_i_shr893_memread_memread2537_shift_x(BITSELECT,597)@2
    rightShiftStage2Idx1Rng1_uid598_i_shr893_memread_memread2537_shift_x_b <= rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q(31 downto 1);

    -- rightShiftStage2Idx1_uid599_i_shr893_memread_memread2537_shift_x(BITJOIN,598)@2
    rightShiftStage2Idx1_uid599_i_shr893_memread_memread2537_shift_x_q <= xMSB_uid574_i_shr893_memread_memread2537_shift_x_b & rightShiftStage2Idx1Rng1_uid598_i_shr893_memread_memread2537_shift_x_b;

    -- seMsb_to6_uid593(BITSELECT,592)@2
    seMsb_to6_uid593_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid574_i_shr893_memread_memread2537_shift_x_b(0)) & xMSB_uid574_i_shr893_memread_memread2537_shift_x_b));
    seMsb_to6_uid593_b <= STD_LOGIC_VECTOR(seMsb_to6_uid593_in(5 downto 0));

    -- rightShiftStage1Idx3Rng6_uid594_i_shr893_memread_memread2537_shift_x(BITSELECT,593)@2
    rightShiftStage1Idx3Rng6_uid594_i_shr893_memread_memread2537_shift_x_b <= rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q(31 downto 6);

    -- rightShiftStage1Idx3_uid595_i_shr893_memread_memread2537_shift_x(BITJOIN,594)@2
    rightShiftStage1Idx3_uid595_i_shr893_memread_memread2537_shift_x_q <= seMsb_to6_uid593_b & rightShiftStage1Idx3Rng6_uid594_i_shr893_memread_memread2537_shift_x_b;

    -- seMsb_to4_uid590(BITSELECT,589)@2
    seMsb_to4_uid590_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid574_i_shr893_memread_memread2537_shift_x_b(0)) & xMSB_uid574_i_shr893_memread_memread2537_shift_x_b));
    seMsb_to4_uid590_b <= STD_LOGIC_VECTOR(seMsb_to4_uid590_in(3 downto 0));

    -- rightShiftStage1Idx2Rng4_uid591_i_shr893_memread_memread2537_shift_x(BITSELECT,590)@2
    rightShiftStage1Idx2Rng4_uid591_i_shr893_memread_memread2537_shift_x_b <= rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx2_uid592_i_shr893_memread_memread2537_shift_x(BITJOIN,591)@2
    rightShiftStage1Idx2_uid592_i_shr893_memread_memread2537_shift_x_q <= seMsb_to4_uid590_b & rightShiftStage1Idx2Rng4_uid591_i_shr893_memread_memread2537_shift_x_b;

    -- seMsb_to2_uid587(BITSELECT,586)@2
    seMsb_to2_uid587_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid574_i_shr893_memread_memread2537_shift_x_b(0)) & xMSB_uid574_i_shr893_memread_memread2537_shift_x_b));
    seMsb_to2_uid587_b <= STD_LOGIC_VECTOR(seMsb_to2_uid587_in(1 downto 0));

    -- rightShiftStage1Idx1Rng2_uid588_i_shr893_memread_memread2537_shift_x(BITSELECT,587)@2
    rightShiftStage1Idx1Rng2_uid588_i_shr893_memread_memread2537_shift_x_b <= rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q(31 downto 2);

    -- rightShiftStage1Idx1_uid589_i_shr893_memread_memread2537_shift_x(BITJOIN,588)@2
    rightShiftStage1Idx1_uid589_i_shr893_memread_memread2537_shift_x_q <= seMsb_to2_uid587_b & rightShiftStage1Idx1Rng2_uid588_i_shr893_memread_memread2537_shift_x_b;

    -- seMsb_to24_uid582(BITSELECT,581)@2
    seMsb_to24_uid582_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid574_i_shr893_memread_memread2537_shift_x_b(0)) & xMSB_uid574_i_shr893_memread_memread2537_shift_x_b));
    seMsb_to24_uid582_b <= STD_LOGIC_VECTOR(seMsb_to24_uid582_in(23 downto 0));

    -- rightShiftStage0Idx3Rng24_uid583_i_shr893_memread_memread2537_shift_x(BITSELECT,582)@2
    rightShiftStage0Idx3Rng24_uid583_i_shr893_memread_memread2537_shift_x_b <= i_conv888_memread_sel_x_b(31 downto 24);

    -- rightShiftStage0Idx3_uid584_i_shr893_memread_memread2537_shift_x(BITJOIN,583)@2
    rightShiftStage0Idx3_uid584_i_shr893_memread_memread2537_shift_x_q <= seMsb_to24_uid582_b & rightShiftStage0Idx3Rng24_uid583_i_shr893_memread_memread2537_shift_x_b;

    -- seMsb_to16_uid579(BITSELECT,578)@2
    seMsb_to16_uid579_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid574_i_shr893_memread_memread2537_shift_x_b(0)) & xMSB_uid574_i_shr893_memread_memread2537_shift_x_b));
    seMsb_to16_uid579_b <= STD_LOGIC_VECTOR(seMsb_to16_uid579_in(15 downto 0));

    -- rightShiftStage0Idx2Rng16_uid580_i_shr893_memread_memread2537_shift_x(BITSELECT,579)@2
    rightShiftStage0Idx2Rng16_uid580_i_shr893_memread_memread2537_shift_x_b <= i_conv888_memread_sel_x_b(31 downto 16);

    -- rightShiftStage0Idx2_uid581_i_shr893_memread_memread2537_shift_x(BITJOIN,580)@2
    rightShiftStage0Idx2_uid581_i_shr893_memread_memread2537_shift_x_q <= seMsb_to16_uid579_b & rightShiftStage0Idx2Rng16_uid580_i_shr893_memread_memread2537_shift_x_b;

    -- seMsb_to8_uid576(BITSELECT,575)@2
    seMsb_to8_uid576_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid574_i_shr893_memread_memread2537_shift_x_b(0)) & xMSB_uid574_i_shr893_memread_memread2537_shift_x_b));
    seMsb_to8_uid576_b <= STD_LOGIC_VECTOR(seMsb_to8_uid576_in(7 downto 0));

    -- rightShiftStage0Idx1Rng8_uid577_i_shr893_memread_memread2537_shift_x(BITSELECT,576)@2
    rightShiftStage0Idx1Rng8_uid577_i_shr893_memread_memread2537_shift_x_b <= i_conv888_memread_sel_x_b(31 downto 8);

    -- rightShiftStage0Idx1_uid578_i_shr893_memread_memread2537_shift_x(BITJOIN,577)@2
    rightShiftStage0Idx1_uid578_i_shr893_memread_memread2537_shift_x_q <= seMsb_to8_uid576_b & rightShiftStage0Idx1Rng8_uid577_i_shr893_memread_memread2537_shift_x_b;

    -- rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x(MUX,585)@2
    rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_s <= rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_b;
    rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_combproc: PROCESS (rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_s, i_conv888_memread_sel_x_b, rightShiftStage0Idx1_uid578_i_shr893_memread_memread2537_shift_x_q, rightShiftStage0Idx2_uid581_i_shr893_memread_memread2537_shift_x_q, rightShiftStage0Idx3_uid584_i_shr893_memread_memread2537_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q <= i_conv888_memread_sel_x_b;
            WHEN "01" => rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage0Idx1_uid578_i_shr893_memread_memread2537_shift_x_q;
            WHEN "10" => rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage0Idx2_uid581_i_shr893_memread_memread2537_shift_x_q;
            WHEN "11" => rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage0Idx3_uid584_i_shr893_memread_memread2537_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x(MUX,596)@2
    rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_s <= rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_c;
    rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_combproc: PROCESS (rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_s, rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q, rightShiftStage1Idx1_uid589_i_shr893_memread_memread2537_shift_x_q, rightShiftStage1Idx2_uid592_i_shr893_memread_memread2537_shift_x_q, rightShiftStage1Idx3_uid595_i_shr893_memread_memread2537_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_s) IS
            WHEN "00" => rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage0_uid586_i_shr893_memread_memread2537_shift_x_q;
            WHEN "01" => rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage1Idx1_uid589_i_shr893_memread_memread2537_shift_x_q;
            WHEN "10" => rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage1Idx2_uid592_i_shr893_memread_memread2537_shift_x_q;
            WHEN "11" => rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage1Idx3_uid595_i_shr893_memread_memread2537_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_syncbuf_frac_b_sync_buffer_memread(BLACKBOX,442)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_frac_b_sync_buffer_memread : i_syncbuf_frac_b_sync_buffer_memread2533
    PORT MAP (
        in_buffer_in => in_frac_b,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist25_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_frac_b_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv872_rm_memread_sel_x(BITSELECT,58)@1
    i_conv872_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(i_syncbuf_frac_b_sync_buffer_memread_out_buffer_out(7 downto 0)), 32)));

    -- i_sub874_rm_memread(SUB,438)@1
    i_sub874_rm_memread_a <= STD_LOGIC_VECTOR("0" & i_conv872_rm_memread_sel_x_b);
    i_sub874_rm_memread_b <= STD_LOGIC_VECTOR("0" & i_conv854_rm_memread_sel_x_b);
    i_sub874_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub874_rm_memread_a) - UNSIGNED(i_sub874_rm_memread_b));
    i_sub874_rm_memread_q <= i_sub874_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub874_rm_memread_sel_x(BITSELECT,35)@1
    bgTrunc_i_sub874_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(i_sub874_rm_memread_q(31 downto 0));

    -- i_sub892_rm_memread(ADD,439)@1
    i_sub892_rm_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_sub874_rm_memread_sel_x_b);
    i_sub892_rm_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub892_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub892_rm_memread_a) + UNSIGNED(i_sub892_rm_memread_b));
    i_sub892_rm_memread_q <= i_sub892_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub892_rm_memread_sel_x(BITSELECT,36)@1
    bgTrunc_i_sub892_rm_memread_sel_x_b <= i_sub892_rm_memread_q(31 downto 0);

    -- i_shr893_memread_memread2537_shift_narrow_x(BITSELECT,93)@1
    i_shr893_memread_memread2537_shift_narrow_x_b <= bgTrunc_i_sub892_rm_memread_sel_x_b(4 downto 0);

    -- redist30_i_shr893_memread_memread2537_shift_narrow_x_b_1(DELAY,950)
    redist30_i_shr893_memread_memread2537_shift_narrow_x_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_shr893_memread_memread2537_shift_narrow_x_b, xout => redist30_i_shr893_memread_memread2537_shift_narrow_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select(BITSELECT,917)@2
    rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_b <= redist30_i_shr893_memread_memread2537_shift_narrow_x_b_1_q(4 downto 3);
    rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_c <= redist30_i_shr893_memread_memread2537_shift_narrow_x_b_1_q(2 downto 1);
    rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_d <= redist30_i_shr893_memread_memread2537_shift_narrow_x_b_1_q(0 downto 0);

    -- rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x(MUX,600)@2
    rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_s <= rightShiftStageSel4Dto3_uid585_i_shr893_memread_memread2537_shift_x_merged_bit_select_d;
    rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_combproc: PROCESS (rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_s, rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q, rightShiftStage2Idx1_uid599_i_shr893_memread_memread2537_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage1_uid597_i_shr893_memread_memread2537_shift_x_q;
            WHEN "1" => rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_q <= rightShiftStage2Idx1_uid599_i_shr893_memread_memread2537_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage2Idx1Rng1_uid568_i_shl918_memread_memread2538_shift_x(BITSELECT,567)@2
    leftShiftStage2Idx1Rng1_uid568_i_shl918_memread_memread2538_shift_x_in <= leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q(30 downto 0);
    leftShiftStage2Idx1Rng1_uid568_i_shl918_memread_memread2538_shift_x_b <= leftShiftStage2Idx1Rng1_uid568_i_shl918_memread_memread2538_shift_x_in(30 downto 0);

    -- leftShiftStage2Idx1_uid569_i_shl918_memread_memread2538_shift_x(BITJOIN,568)@2
    leftShiftStage2Idx1_uid569_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage2Idx1Rng1_uid568_i_shl918_memread_memread2538_shift_x_b & GND_q;

    -- leftShiftStage1Idx3Rng6_uid563_i_shl918_memread_memread2538_shift_x(BITSELECT,562)@2
    leftShiftStage1Idx3Rng6_uid563_i_shl918_memread_memread2538_shift_x_in <= leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q(25 downto 0);
    leftShiftStage1Idx3Rng6_uid563_i_shl918_memread_memread2538_shift_x_b <= leftShiftStage1Idx3Rng6_uid563_i_shl918_memread_memread2538_shift_x_in(25 downto 0);

    -- leftShiftStage1Idx3Pad6_uid562_i_shl918_memread_memread2538_shift_x(CONSTANT,561)
    leftShiftStage1Idx3Pad6_uid562_i_shl918_memread_memread2538_shift_x_q <= "000000";

    -- leftShiftStage1Idx3_uid564_i_shl918_memread_memread2538_shift_x(BITJOIN,563)@2
    leftShiftStage1Idx3_uid564_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage1Idx3Rng6_uid563_i_shl918_memread_memread2538_shift_x_b & leftShiftStage1Idx3Pad6_uid562_i_shl918_memread_memread2538_shift_x_q;

    -- leftShiftStage1Idx2Rng4_uid560_i_shl918_memread_memread2538_shift_x(BITSELECT,559)@2
    leftShiftStage1Idx2Rng4_uid560_i_shl918_memread_memread2538_shift_x_in <= leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q(27 downto 0);
    leftShiftStage1Idx2Rng4_uid560_i_shl918_memread_memread2538_shift_x_b <= leftShiftStage1Idx2Rng4_uid560_i_shl918_memread_memread2538_shift_x_in(27 downto 0);

    -- leftShiftStage1Idx2Pad4_uid559_i_shl918_memread_memread2538_shift_x(CONSTANT,558)
    leftShiftStage1Idx2Pad4_uid559_i_shl918_memread_memread2538_shift_x_q <= "0000";

    -- leftShiftStage1Idx2_uid561_i_shl918_memread_memread2538_shift_x(BITJOIN,560)@2
    leftShiftStage1Idx2_uid561_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage1Idx2Rng4_uid560_i_shl918_memread_memread2538_shift_x_b & leftShiftStage1Idx2Pad4_uid559_i_shl918_memread_memread2538_shift_x_q;

    -- leftShiftStage1Idx1Rng2_uid557_i_shl918_memread_memread2538_shift_x(BITSELECT,556)@2
    leftShiftStage1Idx1Rng2_uid557_i_shl918_memread_memread2538_shift_x_in <= leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q(29 downto 0);
    leftShiftStage1Idx1Rng2_uid557_i_shl918_memread_memread2538_shift_x_b <= leftShiftStage1Idx1Rng2_uid557_i_shl918_memread_memread2538_shift_x_in(29 downto 0);

    -- leftShiftStage1Idx1_uid558_i_shl918_memread_memread2538_shift_x(BITJOIN,557)@2
    leftShiftStage1Idx1_uid558_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage1Idx1Rng2_uid557_i_shl918_memread_memread2538_shift_x_b & i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q;

    -- leftShiftStage0Idx3Rng24_uid552_i_shl918_memread_memread2538_shift_x(BITSELECT,551)@2
    leftShiftStage0Idx3Rng24_uid552_i_shl918_memread_memread2538_shift_x_in <= i_conv888_memread_sel_x_b(7 downto 0);
    leftShiftStage0Idx3Rng24_uid552_i_shl918_memread_memread2538_shift_x_b <= leftShiftStage0Idx3Rng24_uid552_i_shl918_memread_memread2538_shift_x_in(7 downto 0);

    -- leftShiftStage0Idx3Pad24_uid551_i_shl918_memread_memread2538_shift_x(CONSTANT,550)
    leftShiftStage0Idx3Pad24_uid551_i_shl918_memread_memread2538_shift_x_q <= "000000000000000000000000";

    -- leftShiftStage0Idx3_uid553_i_shl918_memread_memread2538_shift_x(BITJOIN,552)@2
    leftShiftStage0Idx3_uid553_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage0Idx3Rng24_uid552_i_shl918_memread_memread2538_shift_x_b & leftShiftStage0Idx3Pad24_uid551_i_shl918_memread_memread2538_shift_x_q;

    -- leftShiftStage0Idx2Rng16_uid549_i_shl918_memread_memread2538_shift_x(BITSELECT,548)@2
    leftShiftStage0Idx2Rng16_uid549_i_shl918_memread_memread2538_shift_x_in <= i_conv888_memread_sel_x_b(15 downto 0);
    leftShiftStage0Idx2Rng16_uid549_i_shl918_memread_memread2538_shift_x_b <= leftShiftStage0Idx2Rng16_uid549_i_shl918_memread_memread2538_shift_x_in(15 downto 0);

    -- c_i16_0gr(CONSTANT,209)
    c_i16_0gr_q <= "0000000000000000";

    -- leftShiftStage0Idx2_uid550_i_shl918_memread_memread2538_shift_x(BITJOIN,549)@2
    leftShiftStage0Idx2_uid550_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage0Idx2Rng16_uid549_i_shl918_memread_memread2538_shift_x_b & c_i16_0gr_q;

    -- leftShiftStage0Idx1Rng8_uid546_i_shl918_memread_memread2538_shift_x(BITSELECT,545)@2
    leftShiftStage0Idx1Rng8_uid546_i_shl918_memread_memread2538_shift_x_in <= i_conv888_memread_sel_x_b(23 downto 0);
    leftShiftStage0Idx1Rng8_uid546_i_shl918_memread_memread2538_shift_x_b <= leftShiftStage0Idx1Rng8_uid546_i_shl918_memread_memread2538_shift_x_in(23 downto 0);

    -- c_i8_0gr(CONSTANT,222)
    c_i8_0gr_q <= "00000000";

    -- leftShiftStage0Idx1_uid547_i_shl918_memread_memread2538_shift_x(BITJOIN,546)@2
    leftShiftStage0Idx1_uid547_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage0Idx1Rng8_uid546_i_shl918_memread_memread2538_shift_x_b & c_i8_0gr_q;

    -- leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x(MUX,554)@2
    leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_s <= leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_b;
    leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_combproc: PROCESS (leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_s, i_conv888_memread_sel_x_b, leftShiftStage0Idx1_uid547_i_shl918_memread_memread2538_shift_x_q, leftShiftStage0Idx2_uid550_i_shl918_memread_memread2538_shift_x_q, leftShiftStage0Idx3_uid553_i_shl918_memread_memread2538_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_s) IS
            WHEN "00" => leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q <= i_conv888_memread_sel_x_b;
            WHEN "01" => leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage0Idx1_uid547_i_shl918_memread_memread2538_shift_x_q;
            WHEN "10" => leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage0Idx2_uid550_i_shl918_memread_memread2538_shift_x_q;
            WHEN "11" => leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage0Idx3_uid553_i_shl918_memread_memread2538_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x(MUX,565)@2
    leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_s <= leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_c;
    leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_combproc: PROCESS (leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_s, leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q, leftShiftStage1Idx1_uid558_i_shl918_memread_memread2538_shift_x_q, leftShiftStage1Idx2_uid561_i_shl918_memread_memread2538_shift_x_q, leftShiftStage1Idx3_uid564_i_shl918_memread_memread2538_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_s) IS
            WHEN "00" => leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage0_uid555_i_shl918_memread_memread2538_shift_x_q;
            WHEN "01" => leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage1Idx1_uid558_i_shl918_memread_memread2538_shift_x_q;
            WHEN "10" => leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage1Idx2_uid561_i_shl918_memread_memread2538_shift_x_q;
            WHEN "11" => leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage1Idx3_uid564_i_shl918_memread_memread2538_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_sub917_rm_memread(SUB,440)@1
    i_sub917_rm_memread_a <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_sub917_rm_memread_b <= STD_LOGIC_VECTOR("0" & bgTrunc_i_sub874_rm_memread_sel_x_b);
    i_sub917_rm_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub917_rm_memread_a) - UNSIGNED(i_sub917_rm_memread_b));
    i_sub917_rm_memread_q <= i_sub917_rm_memread_o(32 downto 0);

    -- bgTrunc_i_sub917_rm_memread_sel_x(BITSELECT,37)@1
    bgTrunc_i_sub917_rm_memread_sel_x_b <= STD_LOGIC_VECTOR(i_sub917_rm_memread_q(31 downto 0));

    -- i_shl918_memread_memread2538_shift_narrow_x(BITSELECT,87)@1
    i_shl918_memread_memread2538_shift_narrow_x_b <= bgTrunc_i_sub917_rm_memread_sel_x_b(4 downto 0);

    -- redist31_i_shl918_memread_memread2538_shift_narrow_x_b_1(DELAY,951)
    redist31_i_shl918_memread_memread2538_shift_narrow_x_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_shl918_memread_memread2538_shift_narrow_x_b, xout => redist31_i_shl918_memread_memread2538_shift_narrow_x_b_1_q, clk => clock, aclr => resetn );

    -- leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select(BITSELECT,916)@2
    leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_b <= redist31_i_shl918_memread_memread2538_shift_narrow_x_b_1_q(4 downto 3);
    leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_c <= redist31_i_shl918_memread_memread2538_shift_narrow_x_b_1_q(2 downto 1);
    leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_d <= redist31_i_shl918_memread_memread2538_shift_narrow_x_b_1_q(0 downto 0);

    -- leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x(MUX,570)@2
    leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_s <= leftShiftStageSel4Dto3_uid554_i_shl918_memread_memread2538_shift_x_merged_bit_select_d;
    leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_combproc: PROCESS (leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_s, leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q, leftShiftStage2Idx1_uid569_i_shl918_memread_memread2538_shift_x_q)
    BEGIN
        CASE (leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_s) IS
            WHEN "0" => leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage1_uid566_i_shl918_memread_memread2538_shift_x_q;
            WHEN "1" => leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_q <= leftShiftStage2Idx1_uid569_i_shl918_memread_memread2538_shift_x_q;
            WHEN OTHERS => leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp875_rm_memread(COMPARE,333)@1 + 1
    i_cmp875_rm_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp875_rm_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bgTrunc_i_sub874_rm_memread_sel_x_b(31)) & bgTrunc_i_sub874_rm_memread_sel_x_b));
    i_cmp875_rm_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp875_rm_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp875_rm_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp875_rm_memread_a) - SIGNED(i_cmp875_rm_memread_b));
        END IF;
    END PROCESS;
    i_cmp875_rm_memread_c(0) <= i_cmp875_rm_memread_o(33);

    -- i_storemerge_v_v_memread(MUX,432)@2 + 1
    i_storemerge_v_v_memread_s <= i_cmp875_rm_memread_c;
    i_storemerge_v_v_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_storemerge_v_v_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_storemerge_v_v_memread_s) IS
                WHEN "0" => i_storemerge_v_v_memread_q <= leftShiftStage2_uid571_i_shl918_memread_memread2538_shift_x_q;
                WHEN "1" => i_storemerge_v_v_memread_q <= rightShiftStage2_uid601_i_shr893_memread_memread2537_shift_x_q;
                WHEN OTHERS => i_storemerge_v_v_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_storemerge_v_memread(ADD,431)@3
    i_storemerge_v_memread_a <= STD_LOGIC_VECTOR("0" & i_storemerge_v_v_memread_q);
    i_storemerge_v_memread_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_storemerge_v_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge_v_memread_a) + UNSIGNED(i_storemerge_v_memread_b));
    i_storemerge_v_memread_q <= i_storemerge_v_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge_v_memread_sel_x(BITSELECT,29)@3
    bgTrunc_i_storemerge_v_memread_sel_x_b <= i_storemerge_v_memread_q(31 downto 0);

    -- i_storemerge1127_memread(ADD,422)@3
    i_storemerge1127_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_storemerge_v_memread_sel_x_b);
    i_storemerge1127_memread_b <= STD_LOGIC_VECTOR("0" & i_and884_2_memread_vt_join_q);
    i_storemerge1127_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1127_memread_a) + UNSIGNED(i_storemerge1127_memread_b));
    i_storemerge1127_memread_q <= i_storemerge1127_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1127_memread_sel_x(BITSELECT,20)@3
    bgTrunc_i_storemerge1127_memread_sel_x_b <= i_storemerge1127_memread_q(31 downto 0);

    -- redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1(DELAY,961)
    redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_storemerge1127_memread_sel_x_b, xout => redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x(MUX,618)@4
    rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_s <= VCC_q;
    rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_combproc: PROCESS (rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_s, redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid617_i_shr975485_2_memread_memread2561_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_q <= redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q;
            WHEN "1" => rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_q <= rightShiftStage0Idx1_uid617_i_shr975485_2_memread_memread2561_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr975485_2_memread_vt_select_30(BITSELECT,407)@4
    i_shr975485_2_memread_vt_select_30_b <= rightShiftStage0_uid619_i_shr975485_2_memread_memread2561_shift_x_q(30 downto 0);

    -- i_shr975485_2_memread_vt_join(BITJOIN,406)@4
    i_shr975485_2_memread_vt_join_q <= GND_q & i_shr975485_2_memread_vt_select_30_b;

    -- i_conv976_2_memread_sel_x(BITSELECT,61)@4
    i_conv976_2_memread_sel_x_b <= i_shr975485_2_memread_vt_join_q(15 downto 0);

    -- redist35_i_conv976_2_memread_sel_x_b_1(DELAY,955)
    redist35_i_conv976_2_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv976_2_memread_sel_x_b, xout => redist35_i_conv976_2_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- c_i16_128(CONSTANT,211)
    c_i16_128_q <= "1111111110000000";

    -- c_i16_127(CONSTANT,210)
    c_i16_127_q <= "0000000001111111";

    -- c_i32_256(CONSTANT,217)
    c_i32_256_q <= "11111111111111111111111100000000";

    -- i_cmp959_2_memread(COMPARE,336)@4 + 1
    i_cmp959_2_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q(31)) & redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q));
    i_cmp959_2_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_256_q(31)) & c_i32_256_q));
    i_cmp959_2_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp959_2_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp959_2_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp959_2_memread_a) - SIGNED(i_cmp959_2_memread_b));
        END IF;
    END PROCESS;
    i_cmp959_2_memread_c(0) <= i_cmp959_2_memread_o(33);

    -- i_acl_2071_memread(MUX,241)@5
    i_acl_2071_memread_s <= i_cmp959_2_memread_c;
    i_acl_2071_memread_combproc: PROCESS (i_acl_2071_memread_s, c_i16_127_q, c_i16_128_q)
    BEGIN
        CASE (i_acl_2071_memread_s) IS
            WHEN "0" => i_acl_2071_memread_q <= c_i16_127_q;
            WHEN "1" => i_acl_2071_memread_q <= c_i16_128_q;
            WHEN OTHERS => i_acl_2071_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- c_i32_512(CONSTANT,221)
    c_i32_512_q <= "00000000000000000000001000000000";

    -- dupName_0_c_i32_256_x(CONSTANT,42)
    dupName_0_c_i32_256_x_q <= "00000000000000000000000100000000";

    -- i_storemerge1127_off_memread(ADD,423)@4
    i_storemerge1127_off_memread_a <= STD_LOGIC_VECTOR("0" & redist41_bgTrunc_i_storemerge1127_memread_sel_x_b_1_q);
    i_storemerge1127_off_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_256_x_q);
    i_storemerge1127_off_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1127_off_memread_a) + UNSIGNED(i_storemerge1127_off_memread_b));
    i_storemerge1127_off_memread_q <= i_storemerge1127_off_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1127_off_memread_sel_x(BITSELECT,21)@4
    bgTrunc_i_storemerge1127_off_memread_sel_x_b <= i_storemerge1127_off_memread_q(31 downto 0);

    -- i_acl_2072_memread(COMPARE,242)@4 + 1
    i_acl_2072_memread_a <= STD_LOGIC_VECTOR("00" & bgTrunc_i_storemerge1127_off_memread_sel_x_b);
    i_acl_2072_memread_b <= STD_LOGIC_VECTOR("00" & c_i32_512_q);
    i_acl_2072_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2072_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_acl_2072_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_2072_memread_a) - UNSIGNED(i_acl_2072_memread_b));
        END IF;
    END PROCESS;
    i_acl_2072_memread_c(0) <= i_acl_2072_memread_o(33);

    -- i_acl_2073_memread(MUX,243)@5
    i_acl_2073_memread_s <= i_acl_2072_memread_c;
    i_acl_2073_memread_combproc: PROCESS (i_acl_2073_memread_s, i_acl_2071_memread_q, redist35_i_conv976_2_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_acl_2073_memread_s) IS
            WHEN "0" => i_acl_2073_memread_q <= i_acl_2071_memread_q;
            WHEN "1" => i_acl_2073_memread_q <= redist35_i_conv976_2_memread_sel_x_b_1_q;
            WHEN OTHERS => i_acl_2073_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- dupName_0_c_i16_128_x(CONSTANT,39)
    dupName_0_c_i16_128_x_q <= "0000000010000000";

    -- i_and997_2_memread(LOGICAL,307)@5
    i_and997_2_memread_q <= i_acl_2073_memread_q and dupName_0_c_i16_128_x_q;

    -- i_and997_2_memread_vt_select_7(BITSELECT,311)@5
    i_and997_2_memread_vt_select_7_b <= i_and997_2_memread_q(7 downto 7);

    -- i_and986_rm_memread_vt_const_7(CONSTANT,299)
    i_and986_rm_memread_vt_const_7_q <= "0000000";

    -- i_and997_2_memread_vt_join(BITJOIN,310)@5
    i_and997_2_memread_vt_join_q <= c_i8_0gr_q & i_and997_2_memread_vt_select_7_b & i_and986_rm_memread_vt_const_7_q;

    -- i_cmp998_2_memread(LOGICAL,343)@5
    i_cmp998_2_memread_q <= "1" WHEN i_and997_2_memread_vt_join_q = c_i16_0gr_q ELSE "0";

    -- i_acl_1421_memread(MUX,229)@5
    i_acl_1421_memread_s <= i_cmp998_2_memread_q;
    i_acl_1421_memread_combproc: PROCESS (i_acl_1421_memread_s, c_i16_0gr_q, i_acl_2073_memread_q)
    BEGIN
        CASE (i_acl_1421_memread_s) IS
            WHEN "0" => i_acl_1421_memread_q <= c_i16_0gr_q;
            WHEN "1" => i_acl_1421_memread_q <= i_acl_2073_memread_q;
            WHEN OTHERS => i_acl_1421_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- c_i8_1gr(CONSTANT,223)
    c_i8_1gr_q <= "00000001";

    -- i_syncbuf_control_sync_buffer_memread(BLACKBOX,441)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_control_sync_buffer_memread : i_syncbuf_control_sync_buffer_memread2554
    PORT MAP (
        in_buffer_in => in_control,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist26_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_control_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_and986_rm_memread(LOGICAL,298)@5
    i_and986_rm_memread_q <= i_syncbuf_control_sync_buffer_memread_out_buffer_out and c_i8_1gr_q;

    -- i_and986_rm_memread_vt_select_0(BITSELECT,301)@5
    i_and986_rm_memread_vt_select_0_b <= i_and986_rm_memread_q(0 downto 0);

    -- i_and986_rm_memread_vt_join(BITJOIN,300)@5
    i_and986_rm_memread_vt_join_q <= i_and986_rm_memread_vt_const_7_q & i_and986_rm_memread_vt_select_0_b;

    -- i_cmp987_rm_memread(LOGICAL,341)@5
    i_cmp987_rm_memread_q <= "1" WHEN i_and986_rm_memread_vt_join_q = c_i8_0gr_q ELSE "0";

    -- i_acl_2074_memread(MUX,244)@5 + 1
    i_acl_2074_memread_s <= i_cmp987_rm_memread_q;
    i_acl_2074_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2074_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_2074_memread_s) IS
                WHEN "0" => i_acl_2074_memread_q <= i_acl_1421_memread_q;
                WHEN "1" => i_acl_2074_memread_q <= i_acl_2073_memread_q;
                WHEN OTHERS => i_acl_2074_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage0Idx1Rng1_uid624_i_shr975485_3_memread_memread2564_shift_x(BITSELECT,623)@4
    rightShiftStage0Idx1Rng1_uid624_i_shr975485_3_memread_memread2564_shift_x_b <= redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q(31 downto 1);

    -- rightShiftStage0Idx1_uid626_i_shr975485_3_memread_memread2564_shift_x(BITJOIN,625)@4
    rightShiftStage0Idx1_uid626_i_shr975485_3_memread_memread2564_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid624_i_shr975485_3_memread_memread2564_shift_x_b;

    -- redist21_sync_in_aunroll_x_in_c0_eni191052_11_2(DELAY,941)
    redist21_sync_in_aunroll_x_in_c0_eni191052_11_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_11, xout => redist21_sync_in_aunroll_x_in_c0_eni191052_11_2_q, clk => clock, aclr => resetn );

    -- leftShiftStage1Idx1Rng1_uid537_i_shl742_memread_memread2529_shift_x(BITSELECT,536)@1
    leftShiftStage1Idx1Rng1_uid537_i_shl742_memread_memread2529_shift_x_in <= leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid537_i_shl742_memread_memread2529_shift_x_b <= leftShiftStage1Idx1Rng1_uid537_i_shl742_memread_memread2529_shift_x_in(30 downto 0);

    -- leftShiftStage1Idx1_uid538_i_shl742_memread_memread2529_shift_x(BITJOIN,537)@1
    leftShiftStage1Idx1_uid538_i_shl742_memread_memread2529_shift_x_q <= leftShiftStage1Idx1Rng1_uid537_i_shl742_memread_memread2529_shift_x_b & GND_q;

    -- leftShiftStage0Idx1Rng2_uid532_i_shl742_memread_memread2529_shift_x(BITSELECT,531)@1
    leftShiftStage0Idx1Rng2_uid532_i_shl742_memread_memread2529_shift_x_in <= redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q(29 downto 0);
    leftShiftStage0Idx1Rng2_uid532_i_shl742_memread_memread2529_shift_x_b <= leftShiftStage0Idx1Rng2_uid532_i_shl742_memread_memread2529_shift_x_in(29 downto 0);

    -- leftShiftStage0Idx1_uid533_i_shl742_memread_memread2529_shift_x(BITJOIN,532)@1
    leftShiftStage0Idx1_uid533_i_shl742_memread_memread2529_shift_x_q <= leftShiftStage0Idx1Rng2_uid532_i_shl742_memread_memread2529_shift_x_b & i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q;

    -- redist12_sync_in_aunroll_x_in_c0_eni191052_2_1(DELAY,932)
    redist12_sync_in_aunroll_x_in_c0_eni191052_2_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_2, xout => redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q, clk => clock, aclr => resetn );

    -- leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x(MUX,534)@1
    leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_s <= VCC_q;
    leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_combproc: PROCESS (leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_s, redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q, leftShiftStage0Idx1_uid533_i_shl742_memread_memread2529_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_q <= redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q;
            WHEN "1" => leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_q <= leftShiftStage0Idx1_uid533_i_shl742_memread_memread2529_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x(MUX,539)@1
    leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_s <= VCC_q;
    leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_combproc: PROCESS (leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_s, leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_q, leftShiftStage1Idx1_uid538_i_shl742_memread_memread2529_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_q <= leftShiftStage0_uid535_i_shl742_memread_memread2529_shift_x_q;
            WHEN "1" => leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_q <= leftShiftStage1Idx1_uid538_i_shl742_memread_memread2529_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl742_memread_vt_select_31(BITSELECT,401)@1
    i_shl742_memread_vt_select_31_b <= leftShiftStage1_uid540_i_shl742_memread_memread2529_shift_x_q(31 downto 3);

    -- i_shl735_memread_vt_const_2(CONSTANT,396)
    i_shl735_memread_vt_const_2_q <= "000";

    -- i_shl742_memread_vt_join(BITJOIN,400)@1
    i_shl742_memread_vt_join_q <= i_shl742_memread_vt_select_31_b & i_shl735_memread_vt_const_2_q;

    -- redist13_sync_in_aunroll_x_in_c0_eni191052_3_1(DELAY,933)
    redist13_sync_in_aunroll_x_in_c0_eni191052_3_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_3, xout => redist13_sync_in_aunroll_x_in_c0_eni191052_3_1_q, clk => clock, aclr => resetn );

    -- leftShiftStage1Idx1Rng1_uid523_i_shl735_memread_memread2528_shift_x(BITSELECT,522)@0
    leftShiftStage1Idx1Rng1_uid523_i_shl735_memread_memread2528_shift_x_in <= leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid523_i_shl735_memread_memread2528_shift_x_b <= leftShiftStage1Idx1Rng1_uid523_i_shl735_memread_memread2528_shift_x_in(30 downto 0);

    -- leftShiftStage1Idx1_uid524_i_shl735_memread_memread2528_shift_x(BITJOIN,523)@0
    leftShiftStage1Idx1_uid524_i_shl735_memread_memread2528_shift_x_q <= leftShiftStage1Idx1Rng1_uid523_i_shl735_memread_memread2528_shift_x_b & GND_q;

    -- leftShiftStage0Idx1Rng2_uid518_i_shl735_memread_memread2528_shift_x(BITSELECT,517)@0
    leftShiftStage0Idx1Rng2_uid518_i_shl735_memread_memread2528_shift_x_in <= in_c0_eni191052_7(29 downto 0);
    leftShiftStage0Idx1Rng2_uid518_i_shl735_memread_memread2528_shift_x_b <= leftShiftStage0Idx1Rng2_uid518_i_shl735_memread_memread2528_shift_x_in(29 downto 0);

    -- leftShiftStage0Idx1_uid519_i_shl735_memread_memread2528_shift_x(BITJOIN,518)@0
    leftShiftStage0Idx1_uid519_i_shl735_memread_memread2528_shift_x_q <= leftShiftStage0Idx1Rng2_uid518_i_shl735_memread_memread2528_shift_x_b & i_memcoalesce_null_bitcast_0151_memread_vt_const_1_q;

    -- leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x(MUX,520)@0
    leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_s <= VCC_q;
    leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_combproc: PROCESS (leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_s, in_c0_eni191052_7, leftShiftStage0Idx1_uid519_i_shl735_memread_memread2528_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_q <= in_c0_eni191052_7;
            WHEN "1" => leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_q <= leftShiftStage0Idx1_uid519_i_shl735_memread_memread2528_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x(MUX,525)@0
    leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_s <= VCC_q;
    leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_combproc: PROCESS (leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_s, leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_q, leftShiftStage1Idx1_uid524_i_shl735_memread_memread2528_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_q <= leftShiftStage0_uid521_i_shl735_memread_memread2528_shift_x_q;
            WHEN "1" => leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_q <= leftShiftStage1Idx1_uid524_i_shl735_memread_memread2528_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl735_memread_vt_select_31(BITSELECT,398)@0
    i_shl735_memread_vt_select_31_b <= leftShiftStage1_uid526_i_shl735_memread_memread2528_shift_x_q(31 downto 3);

    -- i_shl735_memread_vt_join(BITJOIN,397)@0
    i_shl735_memread_vt_join_q <= i_shl735_memread_vt_select_31_b & i_shl735_memread_vt_const_2_q;

    -- i_sub669_memread(SUB,433)@0
    i_sub669_memread_a <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_4);
    i_sub669_memread_b <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_6);
    i_sub669_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub669_memread_a) - UNSIGNED(i_sub669_memread_b));
    i_sub669_memread_q <= i_sub669_memread_o(32 downto 0);

    -- bgTrunc_i_sub669_memread_sel_x(BITSELECT,30)@0
    bgTrunc_i_sub669_memread_sel_x_b <= STD_LOGIC_VECTOR(i_sub669_memread_q(31 downto 0));

    -- i_add736_memread(ADD,265)@0
    i_add736_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_sub669_memread_sel_x_b);
    i_add736_memread_b <= STD_LOGIC_VECTOR("0" & i_shl735_memread_vt_join_q);
    i_add736_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add736_memread_a) + UNSIGNED(i_add736_memread_b));
    i_add736_memread_q <= i_add736_memread_o(32 downto 0);

    -- bgTrunc_i_add736_memread_sel_x(BITSELECT,5)@0
    bgTrunc_i_add736_memread_sel_x_b <= i_add736_memread_q(31 downto 0);

    -- redist58_bgTrunc_i_add736_memread_sel_x_b_1(DELAY,978)
    redist58_bgTrunc_i_add736_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add736_memread_sel_x_b, xout => redist58_bgTrunc_i_add736_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_sub743_memread(ADD,435)@1
    i_sub743_memread_a <= STD_LOGIC_VECTOR("0" & redist58_bgTrunc_i_add736_memread_sel_x_b_1_q);
    i_sub743_memread_b <= STD_LOGIC_VECTOR("0" & redist13_sync_in_aunroll_x_in_c0_eni191052_3_1_q);
    i_sub743_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub743_memread_a) + UNSIGNED(i_sub743_memread_b));
    i_sub743_memread_q <= i_sub743_memread_o(32 downto 0);

    -- bgTrunc_i_sub743_memread_sel_x(BITSELECT,32)@1
    bgTrunc_i_sub743_memread_sel_x_b <= i_sub743_memread_q(31 downto 0);

    -- i_add749_memread(SUB,266)@1
    i_add749_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_sub743_memread_sel_x_b);
    i_add749_memread_b <= STD_LOGIC_VECTOR("0" & i_shl742_memread_vt_join_q);
    i_add749_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add749_memread_a) - UNSIGNED(i_add749_memread_b));
    i_add749_memread_q <= i_add749_memread_o(32 downto 0);

    -- bgTrunc_i_add749_memread_sel_x(BITSELECT,6)@1
    bgTrunc_i_add749_memread_sel_x_b <= STD_LOGIC_VECTOR(i_add749_memread_q(31 downto 0));

    -- redist57_bgTrunc_i_add749_memread_sel_x_b_1(DELAY,977)
    redist57_bgTrunc_i_add749_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add749_memread_sel_x_b, xout => redist57_bgTrunc_i_add749_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist17_sync_in_aunroll_x_in_c0_eni191052_7_2(DELAY,937)
    redist17_sync_in_aunroll_x_in_c0_eni191052_7_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_7, xout => redist17_sync_in_aunroll_x_in_c0_eni191052_7_2_q, clk => clock, aclr => resetn );

    -- redist11_sync_in_aunroll_x_in_c0_eni191052_1_2(DELAY,931)
    redist11_sync_in_aunroll_x_in_c0_eni191052_1_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q, xout => redist11_sync_in_aunroll_x_in_c0_eni191052_1_2_q, clk => clock, aclr => resetn );

    -- i_unnamed_memread2532(MUX,451)@2
    i_unnamed_memread2532_s <= redist11_sync_in_aunroll_x_in_c0_eni191052_1_2_q;
    i_unnamed_memread2532_combproc: PROCESS (i_unnamed_memread2532_s, redist17_sync_in_aunroll_x_in_c0_eni191052_7_2_q, redist57_bgTrunc_i_add749_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_unnamed_memread2532_s) IS
            WHEN "0" => i_unnamed_memread2532_q <= redist17_sync_in_aunroll_x_in_c0_eni191052_7_2_q;
            WHEN "1" => i_unnamed_memread2532_q <= redist57_bgTrunc_i_add749_memread_sel_x_b_1_q;
            WHEN OTHERS => i_unnamed_memread2532_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_add816_3_memread(ADD,269)@2
    i_add816_3_memread_a <= STD_LOGIC_VECTOR("0" & i_unnamed_memread2532_q);
    i_add816_3_memread_b <= STD_LOGIC_VECTOR("0" & redist21_sync_in_aunroll_x_in_c0_eni191052_11_2_q);
    i_add816_3_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add816_3_memread_a) + UNSIGNED(i_add816_3_memread_b));
    i_add816_3_memread_q <= i_add816_3_memread_o(32 downto 0);

    -- bgTrunc_i_add816_3_memread_sel_x(BITSELECT,9)@2
    bgTrunc_i_add816_3_memread_sel_x_b <= i_add816_3_memread_q(31 downto 0);

    -- redist51_bgTrunc_i_add816_3_memread_sel_x_b_1(DELAY,971)
    redist51_bgTrunc_i_add816_3_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add816_3_memread_sel_x_b, xout => redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- xMSB_uid718_i_shr_3_memread_memread2546_shift_x(BITSELECT,717)@3
    xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b <= STD_LOGIC_VECTOR(redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q(31 downto 31));

    -- rightShiftStage2Idx1Rng1_uid742_i_shr_3_memread_memread2546_shift_x(BITSELECT,741)@3
    rightShiftStage2Idx1Rng1_uid742_i_shr_3_memread_memread2546_shift_x_b <= rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q(31 downto 1);

    -- rightShiftStage2Idx1_uid743_i_shr_3_memread_memread2546_shift_x(BITJOIN,742)@3
    rightShiftStage2Idx1_uid743_i_shr_3_memread_memread2546_shift_x_q <= xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b & rightShiftStage2Idx1Rng1_uid742_i_shr_3_memread_memread2546_shift_x_b;

    -- seMsb_to6_uid737(BITSELECT,736)@3
    seMsb_to6_uid737_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b(0)) & xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b));
    seMsb_to6_uid737_b <= STD_LOGIC_VECTOR(seMsb_to6_uid737_in(5 downto 0));

    -- rightShiftStage1Idx3Rng6_uid738_i_shr_3_memread_memread2546_shift_x(BITSELECT,737)@3
    rightShiftStage1Idx3Rng6_uid738_i_shr_3_memread_memread2546_shift_x_b <= rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q(31 downto 6);

    -- rightShiftStage1Idx3_uid739_i_shr_3_memread_memread2546_shift_x(BITJOIN,738)@3
    rightShiftStage1Idx3_uid739_i_shr_3_memread_memread2546_shift_x_q <= seMsb_to6_uid737_b & rightShiftStage1Idx3Rng6_uid738_i_shr_3_memread_memread2546_shift_x_b;

    -- seMsb_to4_uid734(BITSELECT,733)@3
    seMsb_to4_uid734_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b(0)) & xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b));
    seMsb_to4_uid734_b <= STD_LOGIC_VECTOR(seMsb_to4_uid734_in(3 downto 0));

    -- rightShiftStage1Idx2Rng4_uid735_i_shr_3_memread_memread2546_shift_x(BITSELECT,734)@3
    rightShiftStage1Idx2Rng4_uid735_i_shr_3_memread_memread2546_shift_x_b <= rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx2_uid736_i_shr_3_memread_memread2546_shift_x(BITJOIN,735)@3
    rightShiftStage1Idx2_uid736_i_shr_3_memread_memread2546_shift_x_q <= seMsb_to4_uid734_b & rightShiftStage1Idx2Rng4_uid735_i_shr_3_memread_memread2546_shift_x_b;

    -- seMsb_to2_uid731(BITSELECT,730)@3
    seMsb_to2_uid731_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b(0)) & xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b));
    seMsb_to2_uid731_b <= STD_LOGIC_VECTOR(seMsb_to2_uid731_in(1 downto 0));

    -- rightShiftStage1Idx1Rng2_uid732_i_shr_3_memread_memread2546_shift_x(BITSELECT,731)@3
    rightShiftStage1Idx1Rng2_uid732_i_shr_3_memread_memread2546_shift_x_b <= rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q(31 downto 2);

    -- rightShiftStage1Idx1_uid733_i_shr_3_memread_memread2546_shift_x(BITJOIN,732)@3
    rightShiftStage1Idx1_uid733_i_shr_3_memread_memread2546_shift_x_q <= seMsb_to2_uid731_b & rightShiftStage1Idx1Rng2_uid732_i_shr_3_memread_memread2546_shift_x_b;

    -- seMsb_to24_uid726(BITSELECT,725)@3
    seMsb_to24_uid726_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b(0)) & xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b));
    seMsb_to24_uid726_b <= STD_LOGIC_VECTOR(seMsb_to24_uid726_in(23 downto 0));

    -- rightShiftStage0Idx3Rng24_uid727_i_shr_3_memread_memread2546_shift_x(BITSELECT,726)@3
    rightShiftStage0Idx3Rng24_uid727_i_shr_3_memread_memread2546_shift_x_b <= redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q(31 downto 24);

    -- rightShiftStage0Idx3_uid728_i_shr_3_memread_memread2546_shift_x(BITJOIN,727)@3
    rightShiftStage0Idx3_uid728_i_shr_3_memread_memread2546_shift_x_q <= seMsb_to24_uid726_b & rightShiftStage0Idx3Rng24_uid727_i_shr_3_memread_memread2546_shift_x_b;

    -- seMsb_to16_uid723(BITSELECT,722)@3
    seMsb_to16_uid723_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b(0)) & xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b));
    seMsb_to16_uid723_b <= STD_LOGIC_VECTOR(seMsb_to16_uid723_in(15 downto 0));

    -- rightShiftStage0Idx2Rng16_uid724_i_shr_3_memread_memread2546_shift_x(BITSELECT,723)@3
    rightShiftStage0Idx2Rng16_uid724_i_shr_3_memread_memread2546_shift_x_b <= redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q(31 downto 16);

    -- rightShiftStage0Idx2_uid725_i_shr_3_memread_memread2546_shift_x(BITJOIN,724)@3
    rightShiftStage0Idx2_uid725_i_shr_3_memread_memread2546_shift_x_q <= seMsb_to16_uid723_b & rightShiftStage0Idx2Rng16_uid724_i_shr_3_memread_memread2546_shift_x_b;

    -- seMsb_to8_uid720(BITSELECT,719)@3
    seMsb_to8_uid720_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b(0)) & xMSB_uid718_i_shr_3_memread_memread2546_shift_x_b));
    seMsb_to8_uid720_b <= STD_LOGIC_VECTOR(seMsb_to8_uid720_in(7 downto 0));

    -- rightShiftStage0Idx1Rng8_uid721_i_shr_3_memread_memread2546_shift_x(BITSELECT,720)@3
    rightShiftStage0Idx1Rng8_uid721_i_shr_3_memread_memread2546_shift_x_b <= redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q(31 downto 8);

    -- rightShiftStage0Idx1_uid722_i_shr_3_memread_memread2546_shift_x(BITJOIN,721)@3
    rightShiftStage0Idx1_uid722_i_shr_3_memread_memread2546_shift_x_q <= seMsb_to8_uid720_b & rightShiftStage0Idx1Rng8_uid721_i_shr_3_memread_memread2546_shift_x_b;

    -- rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x(MUX,729)@3
    rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b;
    rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_combproc: PROCESS (rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_s, redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid722_i_shr_3_memread_memread2546_shift_x_q, rightShiftStage0Idx2_uid725_i_shr_3_memread_memread2546_shift_x_q, rightShiftStage0Idx3_uid728_i_shr_3_memread_memread2546_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q <= redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q;
            WHEN "01" => rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage0Idx1_uid722_i_shr_3_memread_memread2546_shift_x_q;
            WHEN "10" => rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage0Idx2_uid725_i_shr_3_memread_memread2546_shift_x_q;
            WHEN "11" => rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage0Idx3_uid728_i_shr_3_memread_memread2546_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x(MUX,740)@3
    rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c;
    rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_combproc: PROCESS (rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_s, rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q, rightShiftStage1Idx1_uid733_i_shr_3_memread_memread2546_shift_x_q, rightShiftStage1Idx2_uid736_i_shr_3_memread_memread2546_shift_x_q, rightShiftStage1Idx3_uid739_i_shr_3_memread_memread2546_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_s) IS
            WHEN "00" => rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage0_uid730_i_shr_3_memread_memread2546_shift_x_q;
            WHEN "01" => rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage1Idx1_uid733_i_shr_3_memread_memread2546_shift_x_q;
            WHEN "10" => rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage1Idx2_uid736_i_shr_3_memread_memread2546_shift_x_q;
            WHEN "11" => rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage1Idx3_uid739_i_shr_3_memread_memread2546_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x(MUX,744)@3
    rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d;
    rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_combproc: PROCESS (rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_s, rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q, rightShiftStage2Idx1_uid743_i_shr_3_memread_memread2546_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage1_uid741_i_shr_3_memread_memread2546_shift_x_q;
            WHEN "1" => rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_q <= rightShiftStage2Idx1_uid743_i_shr_3_memread_memread2546_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and884_3_memread(LOGICAL,282)@3
    i_and884_3_memread_q <= rightShiftStage2_uid745_i_shr_3_memread_memread2546_shift_x_q and dupName_0_c_i32_2gr_x_q;

    -- i_and884_3_memread_vt_select_31(BITSELECT,285)@3
    i_and884_3_memread_vt_select_31_b <= i_and884_3_memread_q(31 downto 1);

    -- i_and884_3_memread_vt_join(BITJOIN,284)@3
    i_and884_3_memread_vt_join_q <= i_and884_3_memread_vt_select_31_b & GND_q;

    -- i_storemerge1128_memread(ADD,424)@3
    i_storemerge1128_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_storemerge_v_memread_sel_x_b);
    i_storemerge1128_memread_b <= STD_LOGIC_VECTOR("0" & i_and884_3_memread_vt_join_q);
    i_storemerge1128_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1128_memread_a) + UNSIGNED(i_storemerge1128_memread_b));
    i_storemerge1128_memread_q <= i_storemerge1128_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1128_memread_sel_x(BITSELECT,22)@3
    bgTrunc_i_storemerge1128_memread_sel_x_b <= i_storemerge1128_memread_q(31 downto 0);

    -- redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1(DELAY,960)
    redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_storemerge1128_memread_sel_x_b, xout => redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x(MUX,627)@4
    rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_s <= VCC_q;
    rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_combproc: PROCESS (rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_s, redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid626_i_shr975485_3_memread_memread2564_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_q <= redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q;
            WHEN "1" => rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_q <= rightShiftStage0Idx1_uid626_i_shr975485_3_memread_memread2564_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr975485_3_memread_vt_select_30(BITSELECT,410)@4
    i_shr975485_3_memread_vt_select_30_b <= rightShiftStage0_uid628_i_shr975485_3_memread_memread2564_shift_x_q(30 downto 0);

    -- i_shr975485_3_memread_vt_join(BITJOIN,409)@4
    i_shr975485_3_memread_vt_join_q <= GND_q & i_shr975485_3_memread_vt_select_30_b;

    -- i_conv976_3_memread_sel_x(BITSELECT,62)@4
    i_conv976_3_memread_sel_x_b <= i_shr975485_3_memread_vt_join_q(15 downto 0);

    -- redist34_i_conv976_3_memread_sel_x_b_1(DELAY,954)
    redist34_i_conv976_3_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv976_3_memread_sel_x_b, xout => redist34_i_conv976_3_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp959_3_memread(COMPARE,337)@4 + 1
    i_cmp959_3_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q(31)) & redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q));
    i_cmp959_3_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_256_q(31)) & c_i32_256_q));
    i_cmp959_3_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp959_3_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp959_3_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp959_3_memread_a) - SIGNED(i_cmp959_3_memread_b));
        END IF;
    END PROCESS;
    i_cmp959_3_memread_c(0) <= i_cmp959_3_memread_o(33);

    -- i_acl_2076_memread(MUX,245)@5
    i_acl_2076_memread_s <= i_cmp959_3_memread_c;
    i_acl_2076_memread_combproc: PROCESS (i_acl_2076_memread_s, c_i16_127_q, c_i16_128_q)
    BEGIN
        CASE (i_acl_2076_memread_s) IS
            WHEN "0" => i_acl_2076_memread_q <= c_i16_127_q;
            WHEN "1" => i_acl_2076_memread_q <= c_i16_128_q;
            WHEN OTHERS => i_acl_2076_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_storemerge1128_off_memread(ADD,425)@4
    i_storemerge1128_off_memread_a <= STD_LOGIC_VECTOR("0" & redist40_bgTrunc_i_storemerge1128_memread_sel_x_b_1_q);
    i_storemerge1128_off_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_256_x_q);
    i_storemerge1128_off_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1128_off_memread_a) + UNSIGNED(i_storemerge1128_off_memread_b));
    i_storemerge1128_off_memread_q <= i_storemerge1128_off_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1128_off_memread_sel_x(BITSELECT,23)@4
    bgTrunc_i_storemerge1128_off_memread_sel_x_b <= i_storemerge1128_off_memread_q(31 downto 0);

    -- i_acl_2077_memread(COMPARE,246)@4 + 1
    i_acl_2077_memread_a <= STD_LOGIC_VECTOR("00" & bgTrunc_i_storemerge1128_off_memread_sel_x_b);
    i_acl_2077_memread_b <= STD_LOGIC_VECTOR("00" & c_i32_512_q);
    i_acl_2077_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2077_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_acl_2077_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_2077_memread_a) - UNSIGNED(i_acl_2077_memread_b));
        END IF;
    END PROCESS;
    i_acl_2077_memread_c(0) <= i_acl_2077_memread_o(33);

    -- i_acl_2078_memread(MUX,247)@5
    i_acl_2078_memread_s <= i_acl_2077_memread_c;
    i_acl_2078_memread_combproc: PROCESS (i_acl_2078_memread_s, i_acl_2076_memread_q, redist34_i_conv976_3_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_acl_2078_memread_s) IS
            WHEN "0" => i_acl_2078_memread_q <= i_acl_2076_memread_q;
            WHEN "1" => i_acl_2078_memread_q <= redist34_i_conv976_3_memread_sel_x_b_1_q;
            WHEN OTHERS => i_acl_2078_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and997_3_memread(LOGICAL,312)@5
    i_and997_3_memread_q <= i_acl_2078_memread_q and dupName_0_c_i16_128_x_q;

    -- i_and997_3_memread_vt_select_7(BITSELECT,316)@5
    i_and997_3_memread_vt_select_7_b <= i_and997_3_memread_q(7 downto 7);

    -- i_and997_3_memread_vt_join(BITJOIN,315)@5
    i_and997_3_memread_vt_join_q <= c_i8_0gr_q & i_and997_3_memread_vt_select_7_b & i_and986_rm_memread_vt_const_7_q;

    -- i_cmp998_3_memread(LOGICAL,344)@5
    i_cmp998_3_memread_q <= "1" WHEN i_and997_3_memread_vt_join_q = c_i16_0gr_q ELSE "0";

    -- i_acl_1422_memread(MUX,230)@5
    i_acl_1422_memread_s <= i_cmp998_3_memread_q;
    i_acl_1422_memread_combproc: PROCESS (i_acl_1422_memread_s, c_i16_0gr_q, i_acl_2078_memread_q)
    BEGIN
        CASE (i_acl_1422_memread_s) IS
            WHEN "0" => i_acl_1422_memread_q <= c_i16_0gr_q;
            WHEN "1" => i_acl_1422_memread_q <= i_acl_2078_memread_q;
            WHEN OTHERS => i_acl_1422_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2079_memread(MUX,248)@5 + 1
    i_acl_2079_memread_s <= i_cmp987_rm_memread_q;
    i_acl_2079_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2079_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_2079_memread_s) IS
                WHEN "0" => i_acl_2079_memread_q <= i_acl_1422_memread_q;
                WHEN "1" => i_acl_2079_memread_q <= i_acl_2078_memread_q;
                WHEN OTHERS => i_acl_2079_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i17_memread(COMPARE,349)@6
    i_cmp_i17_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => i_acl_2074_memread_q(15)) & i_acl_2074_memread_q));
    i_cmp_i17_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => i_acl_2079_memread_q(15)) & i_acl_2079_memread_q));
    i_cmp_i17_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp_i17_memread_a) - SIGNED(i_cmp_i17_memread_b));
    i_cmp_i17_memread_n(0) <= not (i_cmp_i17_memread_o(17));

    -- i_max_value_0_i20_memread(MUX,373)@6
    i_max_value_0_i20_memread_s <= i_cmp_i17_memread_n;
    i_max_value_0_i20_memread_combproc: PROCESS (i_max_value_0_i20_memread_s, i_acl_2079_memread_q, i_acl_2074_memread_q)
    BEGIN
        CASE (i_max_value_0_i20_memread_s) IS
            WHEN "0" => i_max_value_0_i20_memread_q <= i_acl_2079_memread_q;
            WHEN "1" => i_max_value_0_i20_memread_q <= i_acl_2074_memread_q;
            WHEN OTHERS => i_max_value_0_i20_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx1Rng1_uid651_i_shr975485_memread_memread2552_shift_x(BITSELECT,650)@4
    rightShiftStage0Idx1Rng1_uid651_i_shr975485_memread_memread2552_shift_x_b <= redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q(31 downto 1);

    -- rightShiftStage0Idx1_uid653_i_shr975485_memread_memread2552_shift_x(BITJOIN,652)@4
    rightShiftStage0Idx1_uid653_i_shr975485_memread_memread2552_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid651_i_shr975485_memread_memread2552_shift_x_b;

    -- redist18_sync_in_aunroll_x_in_c0_eni191052_8_2(DELAY,938)
    redist18_sync_in_aunroll_x_in_c0_eni191052_8_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_8, xout => redist18_sync_in_aunroll_x_in_c0_eni191052_8_2_q, clk => clock, aclr => resetn );

    -- i_reduction_memread_5_memread(ADD,387)@0
    i_reduction_memread_5_memread_a <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_6);
    i_reduction_memread_5_memread_b <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_7);
    i_reduction_memread_5_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memread_5_memread_a) + UNSIGNED(i_reduction_memread_5_memread_b));
    i_reduction_memread_5_memread_q <= i_reduction_memread_5_memread_o(32 downto 0);

    -- bgTrunc_i_reduction_memread_5_memread_sel_x(BITSELECT,15)@0
    bgTrunc_i_reduction_memread_5_memread_sel_x_b <= i_reduction_memread_5_memread_q(31 downto 0);

    -- i_reduction_memread_4_memread(ADD,386)@0
    i_reduction_memread_4_memread_a <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_4);
    i_reduction_memread_4_memread_b <= STD_LOGIC_VECTOR("0" & in_c0_eni191052_5);
    i_reduction_memread_4_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memread_4_memread_a) + UNSIGNED(i_reduction_memread_4_memread_b));
    i_reduction_memread_4_memread_q <= i_reduction_memread_4_memread_o(32 downto 0);

    -- bgTrunc_i_reduction_memread_4_memread_sel_x(BITSELECT,14)@0
    bgTrunc_i_reduction_memread_4_memread_sel_x_b <= i_reduction_memread_4_memread_q(31 downto 0);

    -- i_reduction_memread_6_memread(ADD,388)@0
    i_reduction_memread_6_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_reduction_memread_4_memread_sel_x_b);
    i_reduction_memread_6_memread_b <= STD_LOGIC_VECTOR("0" & bgTrunc_i_reduction_memread_5_memread_sel_x_b);
    i_reduction_memread_6_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memread_6_memread_a) + UNSIGNED(i_reduction_memread_6_memread_b));
    i_reduction_memread_6_memread_q <= i_reduction_memread_6_memread_o(32 downto 0);

    -- bgTrunc_i_reduction_memread_6_memread_sel_x(BITSELECT,16)@0
    bgTrunc_i_reduction_memread_6_memread_sel_x_b <= i_reduction_memread_6_memread_q(31 downto 0);

    -- redist43_bgTrunc_i_reduction_memread_6_memread_sel_x_b_1(DELAY,963)
    redist43_bgTrunc_i_reduction_memread_6_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_reduction_memread_6_memread_sel_x_b, xout => redist43_bgTrunc_i_reduction_memread_6_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_reduction_memread_7_memread(ADD,389)@1
    i_reduction_memread_7_memread_a <= STD_LOGIC_VECTOR("0" & redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q);
    i_reduction_memread_7_memread_b <= STD_LOGIC_VECTOR("0" & redist43_bgTrunc_i_reduction_memread_6_memread_sel_x_b_1_q);
    i_reduction_memread_7_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_reduction_memread_7_memread_a) + UNSIGNED(i_reduction_memread_7_memread_b));
    i_reduction_memread_7_memread_q <= i_reduction_memread_7_memread_o(32 downto 0);

    -- bgTrunc_i_reduction_memread_7_memread_sel_x(BITSELECT,17)@1
    bgTrunc_i_reduction_memread_7_memread_sel_x_b <= i_reduction_memread_7_memread_q(31 downto 0);

    -- redist15_sync_in_aunroll_x_in_c0_eni191052_5_1(DELAY,935)
    redist15_sync_in_aunroll_x_in_c0_eni191052_5_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_5, xout => redist15_sync_in_aunroll_x_in_c0_eni191052_5_1_q, clk => clock, aclr => resetn );

    -- i_add653_memread(MUX,260)@1 + 1
    i_add653_memread_s <= redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q;
    i_add653_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add653_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_add653_memread_s) IS
                WHEN "0" => i_add653_memread_q <= redist15_sync_in_aunroll_x_in_c0_eni191052_5_1_q;
                WHEN "1" => i_add653_memread_q <= bgTrunc_i_reduction_memread_7_memread_sel_x_b;
                WHEN OTHERS => i_add653_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_add816_memread(ADD,272)@2
    i_add816_memread_a <= STD_LOGIC_VECTOR("0" & i_add653_memread_q);
    i_add816_memread_b <= STD_LOGIC_VECTOR("0" & redist18_sync_in_aunroll_x_in_c0_eni191052_8_2_q);
    i_add816_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add816_memread_a) + UNSIGNED(i_add816_memread_b));
    i_add816_memread_q <= i_add816_memread_o(32 downto 0);

    -- bgTrunc_i_add816_memread_sel_x(BITSELECT,12)@2
    bgTrunc_i_add816_memread_sel_x_b <= i_add816_memread_q(31 downto 0);

    -- redist45_bgTrunc_i_add816_memread_sel_x_b_1(DELAY,965)
    redist45_bgTrunc_i_add816_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add816_memread_sel_x_b, xout => redist45_bgTrunc_i_add816_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- xMSB_uid808_i_shr_memread_memread2543_shift_x(BITSELECT,807)@3
    xMSB_uid808_i_shr_memread_memread2543_shift_x_b <= STD_LOGIC_VECTOR(redist45_bgTrunc_i_add816_memread_sel_x_b_1_q(31 downto 31));

    -- rightShiftStage2Idx1Rng1_uid832_i_shr_memread_memread2543_shift_x(BITSELECT,831)@3
    rightShiftStage2Idx1Rng1_uid832_i_shr_memread_memread2543_shift_x_b <= rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q(31 downto 1);

    -- rightShiftStage2Idx1_uid833_i_shr_memread_memread2543_shift_x(BITJOIN,832)@3
    rightShiftStage2Idx1_uid833_i_shr_memread_memread2543_shift_x_q <= xMSB_uid808_i_shr_memread_memread2543_shift_x_b & rightShiftStage2Idx1Rng1_uid832_i_shr_memread_memread2543_shift_x_b;

    -- seMsb_to6_uid827(BITSELECT,826)@3
    seMsb_to6_uid827_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid808_i_shr_memread_memread2543_shift_x_b(0)) & xMSB_uid808_i_shr_memread_memread2543_shift_x_b));
    seMsb_to6_uid827_b <= STD_LOGIC_VECTOR(seMsb_to6_uid827_in(5 downto 0));

    -- rightShiftStage1Idx3Rng6_uid828_i_shr_memread_memread2543_shift_x(BITSELECT,827)@3
    rightShiftStage1Idx3Rng6_uid828_i_shr_memread_memread2543_shift_x_b <= rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q(31 downto 6);

    -- rightShiftStage1Idx3_uid829_i_shr_memread_memread2543_shift_x(BITJOIN,828)@3
    rightShiftStage1Idx3_uid829_i_shr_memread_memread2543_shift_x_q <= seMsb_to6_uid827_b & rightShiftStage1Idx3Rng6_uid828_i_shr_memread_memread2543_shift_x_b;

    -- seMsb_to4_uid824(BITSELECT,823)@3
    seMsb_to4_uid824_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid808_i_shr_memread_memread2543_shift_x_b(0)) & xMSB_uid808_i_shr_memread_memread2543_shift_x_b));
    seMsb_to4_uid824_b <= STD_LOGIC_VECTOR(seMsb_to4_uid824_in(3 downto 0));

    -- rightShiftStage1Idx2Rng4_uid825_i_shr_memread_memread2543_shift_x(BITSELECT,824)@3
    rightShiftStage1Idx2Rng4_uid825_i_shr_memread_memread2543_shift_x_b <= rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx2_uid826_i_shr_memread_memread2543_shift_x(BITJOIN,825)@3
    rightShiftStage1Idx2_uid826_i_shr_memread_memread2543_shift_x_q <= seMsb_to4_uid824_b & rightShiftStage1Idx2Rng4_uid825_i_shr_memread_memread2543_shift_x_b;

    -- seMsb_to2_uid821(BITSELECT,820)@3
    seMsb_to2_uid821_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid808_i_shr_memread_memread2543_shift_x_b(0)) & xMSB_uid808_i_shr_memread_memread2543_shift_x_b));
    seMsb_to2_uid821_b <= STD_LOGIC_VECTOR(seMsb_to2_uid821_in(1 downto 0));

    -- rightShiftStage1Idx1Rng2_uid822_i_shr_memread_memread2543_shift_x(BITSELECT,821)@3
    rightShiftStage1Idx1Rng2_uid822_i_shr_memread_memread2543_shift_x_b <= rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q(31 downto 2);

    -- rightShiftStage1Idx1_uid823_i_shr_memread_memread2543_shift_x(BITJOIN,822)@3
    rightShiftStage1Idx1_uid823_i_shr_memread_memread2543_shift_x_q <= seMsb_to2_uid821_b & rightShiftStage1Idx1Rng2_uid822_i_shr_memread_memread2543_shift_x_b;

    -- seMsb_to24_uid816(BITSELECT,815)@3
    seMsb_to24_uid816_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid808_i_shr_memread_memread2543_shift_x_b(0)) & xMSB_uid808_i_shr_memread_memread2543_shift_x_b));
    seMsb_to24_uid816_b <= STD_LOGIC_VECTOR(seMsb_to24_uid816_in(23 downto 0));

    -- rightShiftStage0Idx3Rng24_uid817_i_shr_memread_memread2543_shift_x(BITSELECT,816)@3
    rightShiftStage0Idx3Rng24_uid817_i_shr_memread_memread2543_shift_x_b <= redist45_bgTrunc_i_add816_memread_sel_x_b_1_q(31 downto 24);

    -- rightShiftStage0Idx3_uid818_i_shr_memread_memread2543_shift_x(BITJOIN,817)@3
    rightShiftStage0Idx3_uid818_i_shr_memread_memread2543_shift_x_q <= seMsb_to24_uid816_b & rightShiftStage0Idx3Rng24_uid817_i_shr_memread_memread2543_shift_x_b;

    -- seMsb_to16_uid813(BITSELECT,812)@3
    seMsb_to16_uid813_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid808_i_shr_memread_memread2543_shift_x_b(0)) & xMSB_uid808_i_shr_memread_memread2543_shift_x_b));
    seMsb_to16_uid813_b <= STD_LOGIC_VECTOR(seMsb_to16_uid813_in(15 downto 0));

    -- rightShiftStage0Idx2Rng16_uid814_i_shr_memread_memread2543_shift_x(BITSELECT,813)@3
    rightShiftStage0Idx2Rng16_uid814_i_shr_memread_memread2543_shift_x_b <= redist45_bgTrunc_i_add816_memread_sel_x_b_1_q(31 downto 16);

    -- rightShiftStage0Idx2_uid815_i_shr_memread_memread2543_shift_x(BITJOIN,814)@3
    rightShiftStage0Idx2_uid815_i_shr_memread_memread2543_shift_x_q <= seMsb_to16_uid813_b & rightShiftStage0Idx2Rng16_uid814_i_shr_memread_memread2543_shift_x_b;

    -- seMsb_to8_uid810(BITSELECT,809)@3
    seMsb_to8_uid810_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid808_i_shr_memread_memread2543_shift_x_b(0)) & xMSB_uid808_i_shr_memread_memread2543_shift_x_b));
    seMsb_to8_uid810_b <= STD_LOGIC_VECTOR(seMsb_to8_uid810_in(7 downto 0));

    -- rightShiftStage0Idx1Rng8_uid811_i_shr_memread_memread2543_shift_x(BITSELECT,810)@3
    rightShiftStage0Idx1Rng8_uid811_i_shr_memread_memread2543_shift_x_b <= redist45_bgTrunc_i_add816_memread_sel_x_b_1_q(31 downto 8);

    -- rightShiftStage0Idx1_uid812_i_shr_memread_memread2543_shift_x(BITJOIN,811)@3
    rightShiftStage0Idx1_uid812_i_shr_memread_memread2543_shift_x_q <= seMsb_to8_uid810_b & rightShiftStage0Idx1Rng8_uid811_i_shr_memread_memread2543_shift_x_b;

    -- rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x(MUX,819)@3
    rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b;
    rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_combproc: PROCESS (rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_s, redist45_bgTrunc_i_add816_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid812_i_shr_memread_memread2543_shift_x_q, rightShiftStage0Idx2_uid815_i_shr_memread_memread2543_shift_x_q, rightShiftStage0Idx3_uid818_i_shr_memread_memread2543_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q <= redist45_bgTrunc_i_add816_memread_sel_x_b_1_q;
            WHEN "01" => rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q <= rightShiftStage0Idx1_uid812_i_shr_memread_memread2543_shift_x_q;
            WHEN "10" => rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q <= rightShiftStage0Idx2_uid815_i_shr_memread_memread2543_shift_x_q;
            WHEN "11" => rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q <= rightShiftStage0Idx3_uid818_i_shr_memread_memread2543_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x(MUX,830)@3
    rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c;
    rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_combproc: PROCESS (rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_s, rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q, rightShiftStage1Idx1_uid823_i_shr_memread_memread2543_shift_x_q, rightShiftStage1Idx2_uid826_i_shr_memread_memread2543_shift_x_q, rightShiftStage1Idx3_uid829_i_shr_memread_memread2543_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_s) IS
            WHEN "00" => rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q <= rightShiftStage0_uid820_i_shr_memread_memread2543_shift_x_q;
            WHEN "01" => rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q <= rightShiftStage1Idx1_uid823_i_shr_memread_memread2543_shift_x_q;
            WHEN "10" => rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q <= rightShiftStage1Idx2_uid826_i_shr_memread_memread2543_shift_x_q;
            WHEN "11" => rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q <= rightShiftStage1Idx3_uid829_i_shr_memread_memread2543_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x(MUX,834)@3
    rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d;
    rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_combproc: PROCESS (rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_s, rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q, rightShiftStage2Idx1_uid833_i_shr_memread_memread2543_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_q <= rightShiftStage1_uid831_i_shr_memread_memread2543_shift_x_q;
            WHEN "1" => rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_q <= rightShiftStage2Idx1_uid833_i_shr_memread_memread2543_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and884_memread(LOGICAL,294)@3
    i_and884_memread_q <= rightShiftStage2_uid835_i_shr_memread_memread2543_shift_x_q and dupName_0_c_i32_2gr_x_q;

    -- i_and884_memread_vt_select_31(BITSELECT,297)@3
    i_and884_memread_vt_select_31_b <= i_and884_memread_q(31 downto 1);

    -- i_and884_memread_vt_join(BITJOIN,296)@3
    i_and884_memread_vt_join_q <= i_and884_memread_vt_select_31_b & GND_q;

    -- i_storemerge_memread(ADD,430)@3
    i_storemerge_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_storemerge_v_memread_sel_x_b);
    i_storemerge_memread_b <= STD_LOGIC_VECTOR("0" & i_and884_memread_vt_join_q);
    i_storemerge_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge_memread_a) + UNSIGNED(i_storemerge_memread_b));
    i_storemerge_memread_q <= i_storemerge_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge_memread_sel_x(BITSELECT,28)@3
    bgTrunc_i_storemerge_memread_sel_x_b <= i_storemerge_memread_q(31 downto 0);

    -- redist37_bgTrunc_i_storemerge_memread_sel_x_b_1(DELAY,957)
    redist37_bgTrunc_i_storemerge_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_storemerge_memread_sel_x_b, xout => redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x(MUX,654)@4
    rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_s <= VCC_q;
    rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_combproc: PROCESS (rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_s, redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid653_i_shr975485_memread_memread2552_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_q <= redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q;
            WHEN "1" => rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_q <= rightShiftStage0Idx1_uid653_i_shr975485_memread_memread2552_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr975485_memread_vt_select_30(BITSELECT,419)@4
    i_shr975485_memread_vt_select_30_b <= rightShiftStage0_uid655_i_shr975485_memread_memread2552_shift_x_q(30 downto 0);

    -- i_shr975485_memread_vt_join(BITJOIN,418)@4
    i_shr975485_memread_vt_join_q <= GND_q & i_shr975485_memread_vt_select_30_b;

    -- i_conv976_memread_sel_x(BITSELECT,65)@4
    i_conv976_memread_sel_x_b <= i_shr975485_memread_vt_join_q(15 downto 0);

    -- c_i32_255(CONSTANT,216)
    c_i32_255_q <= "00000000000000000000000011111111";

    -- i_cmp943_memread(COMPARE,334)@4
    i_cmp943_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_255_q(31)) & c_i32_255_q));
    i_cmp943_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q(31)) & redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q));
    i_cmp943_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp943_memread_a) - SIGNED(i_cmp943_memread_b));
    i_cmp943_memread_c(0) <= i_cmp943_memread_o(33);

    -- i_acl_2061_memread(MUX,233)@4
    i_acl_2061_memread_s <= i_cmp943_memread_c;
    i_acl_2061_memread_combproc: PROCESS (i_acl_2061_memread_s, c_i16_128_q, c_i16_127_q)
    BEGIN
        CASE (i_acl_2061_memread_s) IS
            WHEN "0" => i_acl_2061_memread_q <= c_i16_128_q;
            WHEN "1" => i_acl_2061_memread_q <= c_i16_127_q;
            WHEN OTHERS => i_acl_2061_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_not_cmp943_memread(LOGICAL,385)@4
    i_not_cmp943_memread_q <= i_cmp943_memread_c xor VCC_q;

    -- c_i32_257(CONSTANT,218)
    c_i32_257_q <= "11111111111111111111111011111111";

    -- i_cmp959_not_memread(COMPARE,340)@4
    i_cmp959_not_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_257_q(31)) & c_i32_257_q));
    i_cmp959_not_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q(31)) & redist37_bgTrunc_i_storemerge_memread_sel_x_b_1_q));
    i_cmp959_not_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp959_not_memread_a) - SIGNED(i_cmp959_not_memread_b));
    i_cmp959_not_memread_c(0) <= i_cmp959_not_memread_o(33);

    -- i_acl_2062_memread(LOGICAL,234)@4
    i_acl_2062_memread_q <= i_cmp959_not_memread_c and i_not_cmp943_memread_q;

    -- i_acl_2063_memread(MUX,235)@4 + 1
    i_acl_2063_memread_s <= i_acl_2062_memread_q;
    i_acl_2063_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2063_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_2063_memread_s) IS
                WHEN "0" => i_acl_2063_memread_q <= i_acl_2061_memread_q;
                WHEN "1" => i_acl_2063_memread_q <= i_conv976_memread_sel_x_b;
                WHEN OTHERS => i_acl_2063_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_and997_memread(LOGICAL,327)@5
    i_and997_memread_q <= i_acl_2063_memread_q and dupName_0_c_i16_128_x_q;

    -- i_and997_memread_vt_select_7(BITSELECT,331)@5
    i_and997_memread_vt_select_7_b <= i_and997_memread_q(7 downto 7);

    -- i_and997_memread_vt_join(BITJOIN,330)@5
    i_and997_memread_vt_join_q <= c_i8_0gr_q & i_and997_memread_vt_select_7_b & i_and986_rm_memread_vt_const_7_q;

    -- i_cmp998_memread(LOGICAL,347)@5
    i_cmp998_memread_q <= "1" WHEN i_and997_memread_vt_join_q = c_i16_0gr_q ELSE "0";

    -- i_acl_1419_memread(MUX,227)@5
    i_acl_1419_memread_s <= i_cmp998_memread_q;
    i_acl_1419_memread_combproc: PROCESS (i_acl_1419_memread_s, c_i16_0gr_q, i_acl_2063_memread_q)
    BEGIN
        CASE (i_acl_1419_memread_s) IS
            WHEN "0" => i_acl_1419_memread_q <= c_i16_0gr_q;
            WHEN "1" => i_acl_1419_memread_q <= i_acl_2063_memread_q;
            WHEN OTHERS => i_acl_1419_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2064_memread(MUX,236)@5 + 1
    i_acl_2064_memread_s <= i_cmp987_rm_memread_q;
    i_acl_2064_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2064_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_2064_memread_s) IS
                WHEN "0" => i_acl_2064_memread_q <= i_acl_1419_memread_q;
                WHEN "1" => i_acl_2064_memread_q <= i_acl_2063_memread_q;
                WHEN OTHERS => i_acl_2064_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage0Idx1Rng1_uid606_i_shr975485_1_memread_memread2558_shift_x(BITSELECT,605)@4
    rightShiftStage0Idx1Rng1_uid606_i_shr975485_1_memread_memread2558_shift_x_b <= redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q(31 downto 1);

    -- rightShiftStage0Idx1_uid608_i_shr975485_1_memread_memread2558_shift_x(BITJOIN,607)@4
    rightShiftStage0Idx1_uid608_i_shr975485_1_memread_memread2558_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid606_i_shr975485_1_memread_memread2558_shift_x_b;

    -- redist19_sync_in_aunroll_x_in_c0_eni191052_9_2(DELAY,939)
    redist19_sync_in_aunroll_x_in_c0_eni191052_9_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_9, xout => redist19_sync_in_aunroll_x_in_c0_eni191052_9_2_q, clk => clock, aclr => resetn );

    -- leftShiftStage0Idx1Rng1_uid509_i_shl682_memread_memread2526_shift_x(BITSELECT,508)@1
    leftShiftStage0Idx1Rng1_uid509_i_shl682_memread_memread2526_shift_x_in <= redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q(30 downto 0);
    leftShiftStage0Idx1Rng1_uid509_i_shl682_memread_memread2526_shift_x_b <= leftShiftStage0Idx1Rng1_uid509_i_shl682_memread_memread2526_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid510_i_shl682_memread_memread2526_shift_x(BITJOIN,509)@1
    leftShiftStage0Idx1_uid510_i_shl682_memread_memread2526_shift_x_q <= leftShiftStage0Idx1Rng1_uid509_i_shl682_memread_memread2526_shift_x_b & GND_q;

    -- leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x(MUX,511)@1
    leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_s <= VCC_q;
    leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_combproc: PROCESS (leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_s, redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q, leftShiftStage0Idx1_uid510_i_shl682_memread_memread2526_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_q <= redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q;
            WHEN "1" => leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_q <= leftShiftStage0Idx1_uid510_i_shl682_memread_memread2526_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl682_memread_vt_select_31(BITSELECT,395)@1
    i_shl682_memread_vt_select_31_b <= leftShiftStage0_uid512_i_shl682_memread_memread2526_shift_x_q(31 downto 1);

    -- i_shl682_memread_vt_join(BITJOIN,394)@1
    i_shl682_memread_vt_join_q <= i_shl682_memread_vt_select_31_b & GND_q;

    -- leftShiftStage0Idx1Rng1_uid500_i_shl675_memread_memread2525_shift_x(BITSELECT,499)@0
    leftShiftStage0Idx1Rng1_uid500_i_shl675_memread_memread2525_shift_x_in <= in_c0_eni191052_7(30 downto 0);
    leftShiftStage0Idx1Rng1_uid500_i_shl675_memread_memread2525_shift_x_b <= leftShiftStage0Idx1Rng1_uid500_i_shl675_memread_memread2525_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid501_i_shl675_memread_memread2525_shift_x(BITJOIN,500)@0
    leftShiftStage0Idx1_uid501_i_shl675_memread_memread2525_shift_x_q <= leftShiftStage0Idx1Rng1_uid500_i_shl675_memread_memread2525_shift_x_b & GND_q;

    -- leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x(MUX,502)@0
    leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_s <= VCC_q;
    leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_combproc: PROCESS (leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_s, in_c0_eni191052_7, leftShiftStage0Idx1_uid501_i_shl675_memread_memread2525_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_q <= in_c0_eni191052_7;
            WHEN "1" => leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_q <= leftShiftStage0Idx1_uid501_i_shl675_memread_memread2525_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl675_memread_vt_select_31(BITSELECT,392)@0
    i_shl675_memread_vt_select_31_b <= leftShiftStage0_uid503_i_shl675_memread_memread2525_shift_x_q(31 downto 1);

    -- i_shl675_memread_vt_join(BITJOIN,391)@0
    i_shl675_memread_vt_join_q <= i_shl675_memread_vt_select_31_b & GND_q;

    -- i_add676_memread(ADD,261)@0
    i_add676_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_sub669_memread_sel_x_b);
    i_add676_memread_b <= STD_LOGIC_VECTOR("0" & i_shl675_memread_vt_join_q);
    i_add676_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add676_memread_a) + UNSIGNED(i_add676_memread_b));
    i_add676_memread_q <= i_add676_memread_o(32 downto 0);

    -- bgTrunc_i_add676_memread_sel_x(BITSELECT,2)@0
    bgTrunc_i_add676_memread_sel_x_b <= i_add676_memread_q(31 downto 0);

    -- redist60_bgTrunc_i_add676_memread_sel_x_b_1(DELAY,980)
    redist60_bgTrunc_i_add676_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add676_memread_sel_x_b, xout => redist60_bgTrunc_i_add676_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_sub683_memread(SUB,434)@1
    i_sub683_memread_a <= STD_LOGIC_VECTOR("0" & redist60_bgTrunc_i_add676_memread_sel_x_b_1_q);
    i_sub683_memread_b <= STD_LOGIC_VECTOR("0" & i_shl682_memread_vt_join_q);
    i_sub683_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub683_memread_a) - UNSIGNED(i_sub683_memread_b));
    i_sub683_memread_q <= i_sub683_memread_o(32 downto 0);

    -- bgTrunc_i_sub683_memread_sel_x(BITSELECT,31)@1
    bgTrunc_i_sub683_memread_sel_x_b <= STD_LOGIC_VECTOR(i_sub683_memread_q(31 downto 0));

    -- redist14_sync_in_aunroll_x_in_c0_eni191052_4_1(DELAY,934)
    redist14_sync_in_aunroll_x_in_c0_eni191052_4_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_4, xout => redist14_sync_in_aunroll_x_in_c0_eni191052_4_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_memread2530(MUX,450)@1 + 1
    i_unnamed_memread2530_s <= redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q;
    i_unnamed_memread2530_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_unnamed_memread2530_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_unnamed_memread2530_s) IS
                WHEN "0" => i_unnamed_memread2530_q <= redist14_sync_in_aunroll_x_in_c0_eni191052_4_1_q;
                WHEN "1" => i_unnamed_memread2530_q <= bgTrunc_i_sub683_memread_sel_x_b;
                WHEN OTHERS => i_unnamed_memread2530_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_add816_1_memread(ADD,267)@2
    i_add816_1_memread_a <= STD_LOGIC_VECTOR("0" & i_unnamed_memread2530_q);
    i_add816_1_memread_b <= STD_LOGIC_VECTOR("0" & redist19_sync_in_aunroll_x_in_c0_eni191052_9_2_q);
    i_add816_1_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add816_1_memread_a) + UNSIGNED(i_add816_1_memread_b));
    i_add816_1_memread_q <= i_add816_1_memread_o(32 downto 0);

    -- bgTrunc_i_add816_1_memread_sel_x(BITSELECT,7)@2
    bgTrunc_i_add816_1_memread_sel_x_b <= i_add816_1_memread_q(31 downto 0);

    -- redist55_bgTrunc_i_add816_1_memread_sel_x_b_1(DELAY,975)
    redist55_bgTrunc_i_add816_1_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add816_1_memread_sel_x_b, xout => redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- xMSB_uid658_i_shr_1_memread_memread2544_shift_x(BITSELECT,657)@3
    xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b <= STD_LOGIC_VECTOR(redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q(31 downto 31));

    -- rightShiftStage2Idx1Rng1_uid682_i_shr_1_memread_memread2544_shift_x(BITSELECT,681)@3
    rightShiftStage2Idx1Rng1_uid682_i_shr_1_memread_memread2544_shift_x_b <= rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q(31 downto 1);

    -- rightShiftStage2Idx1_uid683_i_shr_1_memread_memread2544_shift_x(BITJOIN,682)@3
    rightShiftStage2Idx1_uid683_i_shr_1_memread_memread2544_shift_x_q <= xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b & rightShiftStage2Idx1Rng1_uid682_i_shr_1_memread_memread2544_shift_x_b;

    -- seMsb_to6_uid677(BITSELECT,676)@3
    seMsb_to6_uid677_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b(0)) & xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b));
    seMsb_to6_uid677_b <= STD_LOGIC_VECTOR(seMsb_to6_uid677_in(5 downto 0));

    -- rightShiftStage1Idx3Rng6_uid678_i_shr_1_memread_memread2544_shift_x(BITSELECT,677)@3
    rightShiftStage1Idx3Rng6_uid678_i_shr_1_memread_memread2544_shift_x_b <= rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q(31 downto 6);

    -- rightShiftStage1Idx3_uid679_i_shr_1_memread_memread2544_shift_x(BITJOIN,678)@3
    rightShiftStage1Idx3_uid679_i_shr_1_memread_memread2544_shift_x_q <= seMsb_to6_uid677_b & rightShiftStage1Idx3Rng6_uid678_i_shr_1_memread_memread2544_shift_x_b;

    -- seMsb_to4_uid674(BITSELECT,673)@3
    seMsb_to4_uid674_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b(0)) & xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b));
    seMsb_to4_uid674_b <= STD_LOGIC_VECTOR(seMsb_to4_uid674_in(3 downto 0));

    -- rightShiftStage1Idx2Rng4_uid675_i_shr_1_memread_memread2544_shift_x(BITSELECT,674)@3
    rightShiftStage1Idx2Rng4_uid675_i_shr_1_memread_memread2544_shift_x_b <= rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx2_uid676_i_shr_1_memread_memread2544_shift_x(BITJOIN,675)@3
    rightShiftStage1Idx2_uid676_i_shr_1_memread_memread2544_shift_x_q <= seMsb_to4_uid674_b & rightShiftStage1Idx2Rng4_uid675_i_shr_1_memread_memread2544_shift_x_b;

    -- seMsb_to2_uid671(BITSELECT,670)@3
    seMsb_to2_uid671_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b(0)) & xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b));
    seMsb_to2_uid671_b <= STD_LOGIC_VECTOR(seMsb_to2_uid671_in(1 downto 0));

    -- rightShiftStage1Idx1Rng2_uid672_i_shr_1_memread_memread2544_shift_x(BITSELECT,671)@3
    rightShiftStage1Idx1Rng2_uid672_i_shr_1_memread_memread2544_shift_x_b <= rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q(31 downto 2);

    -- rightShiftStage1Idx1_uid673_i_shr_1_memread_memread2544_shift_x(BITJOIN,672)@3
    rightShiftStage1Idx1_uid673_i_shr_1_memread_memread2544_shift_x_q <= seMsb_to2_uid671_b & rightShiftStage1Idx1Rng2_uid672_i_shr_1_memread_memread2544_shift_x_b;

    -- seMsb_to24_uid666(BITSELECT,665)@3
    seMsb_to24_uid666_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b(0)) & xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b));
    seMsb_to24_uid666_b <= STD_LOGIC_VECTOR(seMsb_to24_uid666_in(23 downto 0));

    -- rightShiftStage0Idx3Rng24_uid667_i_shr_1_memread_memread2544_shift_x(BITSELECT,666)@3
    rightShiftStage0Idx3Rng24_uid667_i_shr_1_memread_memread2544_shift_x_b <= redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q(31 downto 24);

    -- rightShiftStage0Idx3_uid668_i_shr_1_memread_memread2544_shift_x(BITJOIN,667)@3
    rightShiftStage0Idx3_uid668_i_shr_1_memread_memread2544_shift_x_q <= seMsb_to24_uid666_b & rightShiftStage0Idx3Rng24_uid667_i_shr_1_memread_memread2544_shift_x_b;

    -- seMsb_to16_uid663(BITSELECT,662)@3
    seMsb_to16_uid663_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b(0)) & xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b));
    seMsb_to16_uid663_b <= STD_LOGIC_VECTOR(seMsb_to16_uid663_in(15 downto 0));

    -- rightShiftStage0Idx2Rng16_uid664_i_shr_1_memread_memread2544_shift_x(BITSELECT,663)@3
    rightShiftStage0Idx2Rng16_uid664_i_shr_1_memread_memread2544_shift_x_b <= redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q(31 downto 16);

    -- rightShiftStage0Idx2_uid665_i_shr_1_memread_memread2544_shift_x(BITJOIN,664)@3
    rightShiftStage0Idx2_uid665_i_shr_1_memread_memread2544_shift_x_q <= seMsb_to16_uid663_b & rightShiftStage0Idx2Rng16_uid664_i_shr_1_memread_memread2544_shift_x_b;

    -- seMsb_to8_uid660(BITSELECT,659)@3
    seMsb_to8_uid660_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b(0)) & xMSB_uid658_i_shr_1_memread_memread2544_shift_x_b));
    seMsb_to8_uid660_b <= STD_LOGIC_VECTOR(seMsb_to8_uid660_in(7 downto 0));

    -- rightShiftStage0Idx1Rng8_uid661_i_shr_1_memread_memread2544_shift_x(BITSELECT,660)@3
    rightShiftStage0Idx1Rng8_uid661_i_shr_1_memread_memread2544_shift_x_b <= redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q(31 downto 8);

    -- rightShiftStage0Idx1_uid662_i_shr_1_memread_memread2544_shift_x(BITJOIN,661)@3
    rightShiftStage0Idx1_uid662_i_shr_1_memread_memread2544_shift_x_q <= seMsb_to8_uid660_b & rightShiftStage0Idx1Rng8_uid661_i_shr_1_memread_memread2544_shift_x_b;

    -- rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x(MUX,669)@3
    rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b;
    rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_combproc: PROCESS (rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_s, redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid662_i_shr_1_memread_memread2544_shift_x_q, rightShiftStage0Idx2_uid665_i_shr_1_memread_memread2544_shift_x_q, rightShiftStage0Idx3_uid668_i_shr_1_memread_memread2544_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q <= redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q;
            WHEN "01" => rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage0Idx1_uid662_i_shr_1_memread_memread2544_shift_x_q;
            WHEN "10" => rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage0Idx2_uid665_i_shr_1_memread_memread2544_shift_x_q;
            WHEN "11" => rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage0Idx3_uid668_i_shr_1_memread_memread2544_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x(MUX,680)@3
    rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c;
    rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_combproc: PROCESS (rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_s, rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q, rightShiftStage1Idx1_uid673_i_shr_1_memread_memread2544_shift_x_q, rightShiftStage1Idx2_uid676_i_shr_1_memread_memread2544_shift_x_q, rightShiftStage1Idx3_uid679_i_shr_1_memread_memread2544_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_s) IS
            WHEN "00" => rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage0_uid670_i_shr_1_memread_memread2544_shift_x_q;
            WHEN "01" => rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage1Idx1_uid673_i_shr_1_memread_memread2544_shift_x_q;
            WHEN "10" => rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage1Idx2_uid676_i_shr_1_memread_memread2544_shift_x_q;
            WHEN "11" => rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage1Idx3_uid679_i_shr_1_memread_memread2544_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x(MUX,684)@3
    rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d;
    rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_combproc: PROCESS (rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_s, rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q, rightShiftStage2Idx1_uid683_i_shr_1_memread_memread2544_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage1_uid681_i_shr_1_memread_memread2544_shift_x_q;
            WHEN "1" => rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_q <= rightShiftStage2Idx1_uid683_i_shr_1_memread_memread2544_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and884_1_memread(LOGICAL,274)@3
    i_and884_1_memread_q <= rightShiftStage2_uid685_i_shr_1_memread_memread2544_shift_x_q and dupName_0_c_i32_2gr_x_q;

    -- i_and884_1_memread_vt_select_31(BITSELECT,277)@3
    i_and884_1_memread_vt_select_31_b <= i_and884_1_memread_q(31 downto 1);

    -- i_and884_1_memread_vt_join(BITJOIN,276)@3
    i_and884_1_memread_vt_join_q <= i_and884_1_memread_vt_select_31_b & GND_q;

    -- i_storemerge1126_memread(ADD,420)@3
    i_storemerge1126_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_storemerge_v_memread_sel_x_b);
    i_storemerge1126_memread_b <= STD_LOGIC_VECTOR("0" & i_and884_1_memread_vt_join_q);
    i_storemerge1126_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1126_memread_a) + UNSIGNED(i_storemerge1126_memread_b));
    i_storemerge1126_memread_q <= i_storemerge1126_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1126_memread_sel_x(BITSELECT,18)@3
    bgTrunc_i_storemerge1126_memread_sel_x_b <= i_storemerge1126_memread_q(31 downto 0);

    -- redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1(DELAY,962)
    redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_storemerge1126_memread_sel_x_b, xout => redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x(MUX,609)@4
    rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_s <= VCC_q;
    rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_combproc: PROCESS (rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_s, redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid608_i_shr975485_1_memread_memread2558_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_q <= redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q;
            WHEN "1" => rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_q <= rightShiftStage0Idx1_uid608_i_shr975485_1_memread_memread2558_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr975485_1_memread_vt_select_30(BITSELECT,404)@4
    i_shr975485_1_memread_vt_select_30_b <= rightShiftStage0_uid610_i_shr975485_1_memread_memread2558_shift_x_q(30 downto 0);

    -- i_shr975485_1_memread_vt_join(BITJOIN,403)@4
    i_shr975485_1_memread_vt_join_q <= GND_q & i_shr975485_1_memread_vt_select_30_b;

    -- i_conv976_1_memread_sel_x(BITSELECT,60)@4
    i_conv976_1_memread_sel_x_b <= i_shr975485_1_memread_vt_join_q(15 downto 0);

    -- redist36_i_conv976_1_memread_sel_x_b_1(DELAY,956)
    redist36_i_conv976_1_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv976_1_memread_sel_x_b, xout => redist36_i_conv976_1_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp959_1_memread(COMPARE,335)@4 + 1
    i_cmp959_1_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q(31)) & redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q));
    i_cmp959_1_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_256_q(31)) & c_i32_256_q));
    i_cmp959_1_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp959_1_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp959_1_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp959_1_memread_a) - SIGNED(i_cmp959_1_memread_b));
        END IF;
    END PROCESS;
    i_cmp959_1_memread_c(0) <= i_cmp959_1_memread_o(33);

    -- i_acl_2066_memread(MUX,237)@5
    i_acl_2066_memread_s <= i_cmp959_1_memread_c;
    i_acl_2066_memread_combproc: PROCESS (i_acl_2066_memread_s, c_i16_127_q, c_i16_128_q)
    BEGIN
        CASE (i_acl_2066_memread_s) IS
            WHEN "0" => i_acl_2066_memread_q <= c_i16_127_q;
            WHEN "1" => i_acl_2066_memread_q <= c_i16_128_q;
            WHEN OTHERS => i_acl_2066_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_storemerge1126_off_memread(ADD,421)@4
    i_storemerge1126_off_memread_a <= STD_LOGIC_VECTOR("0" & redist42_bgTrunc_i_storemerge1126_memread_sel_x_b_1_q);
    i_storemerge1126_off_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_256_x_q);
    i_storemerge1126_off_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1126_off_memread_a) + UNSIGNED(i_storemerge1126_off_memread_b));
    i_storemerge1126_off_memread_q <= i_storemerge1126_off_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1126_off_memread_sel_x(BITSELECT,19)@4
    bgTrunc_i_storemerge1126_off_memread_sel_x_b <= i_storemerge1126_off_memread_q(31 downto 0);

    -- i_acl_2067_memread(COMPARE,238)@4 + 1
    i_acl_2067_memread_a <= STD_LOGIC_VECTOR("00" & bgTrunc_i_storemerge1126_off_memread_sel_x_b);
    i_acl_2067_memread_b <= STD_LOGIC_VECTOR("00" & c_i32_512_q);
    i_acl_2067_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2067_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_acl_2067_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_2067_memread_a) - UNSIGNED(i_acl_2067_memread_b));
        END IF;
    END PROCESS;
    i_acl_2067_memread_c(0) <= i_acl_2067_memread_o(33);

    -- i_acl_2068_memread(MUX,239)@5
    i_acl_2068_memread_s <= i_acl_2067_memread_c;
    i_acl_2068_memread_combproc: PROCESS (i_acl_2068_memread_s, i_acl_2066_memread_q, redist36_i_conv976_1_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_acl_2068_memread_s) IS
            WHEN "0" => i_acl_2068_memread_q <= i_acl_2066_memread_q;
            WHEN "1" => i_acl_2068_memread_q <= redist36_i_conv976_1_memread_sel_x_b_1_q;
            WHEN OTHERS => i_acl_2068_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and997_1_memread(LOGICAL,302)@5
    i_and997_1_memread_q <= i_acl_2068_memread_q and dupName_0_c_i16_128_x_q;

    -- i_and997_1_memread_vt_select_7(BITSELECT,306)@5
    i_and997_1_memread_vt_select_7_b <= i_and997_1_memread_q(7 downto 7);

    -- i_and997_1_memread_vt_join(BITJOIN,305)@5
    i_and997_1_memread_vt_join_q <= c_i8_0gr_q & i_and997_1_memread_vt_select_7_b & i_and986_rm_memread_vt_const_7_q;

    -- i_cmp998_1_memread(LOGICAL,342)@5
    i_cmp998_1_memread_q <= "1" WHEN i_and997_1_memread_vt_join_q = c_i16_0gr_q ELSE "0";

    -- i_acl_1420_memread(MUX,228)@5
    i_acl_1420_memread_s <= i_cmp998_1_memread_q;
    i_acl_1420_memread_combproc: PROCESS (i_acl_1420_memread_s, c_i16_0gr_q, i_acl_2068_memread_q)
    BEGIN
        CASE (i_acl_1420_memread_s) IS
            WHEN "0" => i_acl_1420_memread_q <= c_i16_0gr_q;
            WHEN "1" => i_acl_1420_memread_q <= i_acl_2068_memread_q;
            WHEN OTHERS => i_acl_1420_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2069_memread(MUX,240)@5 + 1
    i_acl_2069_memread_s <= i_cmp987_rm_memread_q;
    i_acl_2069_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2069_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_2069_memread_s) IS
                WHEN "0" => i_acl_2069_memread_q <= i_acl_1420_memread_q;
                WHEN "1" => i_acl_2069_memread_q <= i_acl_2068_memread_q;
                WHEN OTHERS => i_acl_2069_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_memread(COMPARE,351)@6
    i_cmp_i_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => i_acl_2064_memread_q(15)) & i_acl_2064_memread_q));
    i_cmp_i_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => i_acl_2069_memread_q(15)) & i_acl_2069_memread_q));
    i_cmp_i_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp_i_memread_a) - SIGNED(i_cmp_i_memread_b));
    i_cmp_i_memread_n(0) <= not (i_cmp_i_memread_o(17));

    -- i_acl_memread_memread2577(MUX,259)@6
    i_acl_memread_memread2577_s <= i_cmp_i_memread_n;
    i_acl_memread_memread2577_combproc: PROCESS (i_acl_memread_memread2577_s, i_acl_2069_memread_q, i_acl_2064_memread_q)
    BEGIN
        CASE (i_acl_memread_memread2577_s) IS
            WHEN "0" => i_acl_memread_memread2577_q <= i_acl_2069_memread_q;
            WHEN "1" => i_acl_memread_memread2577_q <= i_acl_2064_memread_q;
            WHEN OTHERS => i_acl_memread_memread2577_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_store_memdep_16_memread_aunroll_x(BLACKBOX,154)@6
    -- out out_memdep_16_avm_address@20000000
    -- out out_memdep_16_avm_burstcount@20000000
    -- out out_memdep_16_avm_byteenable@20000000
    -- out out_memdep_16_avm_enable@20000000
    -- out out_memdep_16_avm_read@20000000
    -- out out_memdep_16_avm_write@20000000
    -- out out_memdep_16_avm_writedata@20000000
    -- out out_o_stall@7
    -- out out_o_valid@7
    -- out out_o_writeack@7
    thei_store_memdep_16_memread_aunroll_x : i_store_memdep_16_memread2579
    PORT MAP (
        in_i_writedata_0 => i_acl_memread_memread2577_q,
        in_i_writedata_1 => i_max_value_0_i20_memread_q,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_0151_memread_vt_join_q,
        in_i_predicate => redist2_i_cmp12532_phi_decision2458_or_or_memread_q_6_q,
        in_i_stall => GND_q,
        in_i_valid => redist27_sync_in_aunroll_x_in_i_valid_6_q,
        in_memdep_16_avm_readdata => in_memdep_16_avm_readdata,
        in_memdep_16_avm_readdatavalid => in_memdep_16_avm_readdatavalid,
        in_memdep_16_avm_waitrequest => in_memdep_16_avm_waitrequest,
        in_memdep_16_avm_writeack => in_memdep_16_avm_writeack,
        out_memdep_16_avm_address => i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_address,
        out_memdep_16_avm_burstcount => i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_burstcount,
        out_memdep_16_avm_byteenable => i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_byteenable,
        out_memdep_16_avm_enable => i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_enable,
        out_memdep_16_avm_read => i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_read,
        out_memdep_16_avm_write => i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_write,
        out_memdep_16_avm_writedata => i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,45)
    out_memdep_16_avm_address <= i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_address;
    out_memdep_16_avm_enable <= i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_enable;
    out_memdep_16_avm_read <= i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_read;
    out_memdep_16_avm_write <= i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_write;
    out_memdep_16_avm_writedata <= i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_writedata;
    out_memdep_16_avm_byteenable <= i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_byteenable;
    out_memdep_16_avm_burstcount <= i_store_memdep_16_memread_aunroll_x_out_memdep_16_avm_burstcount;

    -- redist28_sync_in_aunroll_x_in_i_valid_10(DELAY,948)
    redist28_sync_in_aunroll_x_in_i_valid_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist27_sync_in_aunroll_x_in_i_valid_6_q, xout => redist28_sync_in_aunroll_x_in_i_valid_10_q, clk => clock, aclr => resetn );

    -- i_load_memcoalesce_null_load_0152_memread_aunroll_x(BLACKBOX,67)@6
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@10
    -- out out_o_readdata_1@10
    -- out out_memcoalesce_null_load_0152_avm_address@20000000
    -- out out_memcoalesce_null_load_0152_avm_burstcount@20000000
    -- out out_memcoalesce_null_load_0152_avm_byteenable@20000000
    -- out out_memcoalesce_null_load_0152_avm_enable@20000000
    -- out out_memcoalesce_null_load_0152_avm_read@20000000
    -- out out_memcoalesce_null_load_0152_avm_write@20000000
    -- out out_memcoalesce_null_load_0152_avm_writedata@20000000
    -- out out_o_stall@9
    -- out out_o_valid@10
    thei_load_memcoalesce_null_load_0152_memread_aunroll_x : i_load_memcoalesce_null_load_0152_memread2574
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_0151_memread_vt_join_q,
        in_i_predicate => redist2_i_cmp12532_phi_decision2458_or_or_memread_q_6_q,
        in_i_stall => GND_q,
        in_i_valid => redist27_sync_in_aunroll_x_in_i_valid_6_q,
        in_memcoalesce_null_load_0152_avm_readdata => in_memcoalesce_null_load_0152_avm_readdata,
        in_memcoalesce_null_load_0152_avm_readdatavalid => in_memcoalesce_null_load_0152_avm_readdatavalid,
        in_memcoalesce_null_load_0152_avm_waitrequest => in_memcoalesce_null_load_0152_avm_waitrequest,
        in_memcoalesce_null_load_0152_avm_writeack => in_memcoalesce_null_load_0152_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_1,
        out_memcoalesce_null_load_0152_avm_address => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_address,
        out_memcoalesce_null_load_0152_avm_burstcount => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount,
        out_memcoalesce_null_load_0152_avm_byteenable => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable,
        out_memcoalesce_null_load_0152_avm_enable => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_enable,
        out_memcoalesce_null_load_0152_avm_read => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_read,
        out_memcoalesce_null_load_0152_avm_write => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_write,
        out_memcoalesce_null_load_0152_avm_writedata => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_max_value_0_i20_memread_q_4_inputreg(DELAY,993)
    redist1_i_max_value_0_i20_memread_q_4_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_max_value_0_i20_memread_q, xout => redist1_i_max_value_0_i20_memread_q_4_inputreg_q, clk => clock, aclr => resetn );

    -- redist1_i_max_value_0_i20_memread_q_4(DELAY,921)
    redist1_i_max_value_0_i20_memread_q_4 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_max_value_0_i20_memread_q_4_inputreg_q, xout => redist1_i_max_value_0_i20_memread_q_4_q, clk => clock, aclr => resetn );

    -- redist1_i_max_value_0_i20_memread_q_4_outputreg(DELAY,994)
    redist1_i_max_value_0_i20_memread_q_4_outputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_max_value_0_i20_memread_q_4_q, xout => redist1_i_max_value_0_i20_memread_q_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_cmp_i3_memread(COMPARE,350)@10
    i_cmp_i3_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_1(15)) & i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_1));
    i_cmp_i3_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => redist1_i_max_value_0_i20_memread_q_4_outputreg_q(15)) & redist1_i_max_value_0_i20_memread_q_4_outputreg_q));
    i_cmp_i3_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp_i3_memread_a) - SIGNED(i_cmp_i3_memread_b));
    i_cmp_i3_memread_n(0) <= not (i_cmp_i3_memread_o(17));

    -- i_max_value_0_i6_memread(MUX,374)@10
    i_max_value_0_i6_memread_s <= i_cmp_i3_memread_n;
    i_max_value_0_i6_memread_combproc: PROCESS (i_max_value_0_i6_memread_s, redist1_i_max_value_0_i20_memread_q_4_outputreg_q, i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_1)
    BEGIN
        CASE (i_max_value_0_i6_memread_s) IS
            WHEN "0" => i_max_value_0_i6_memread_q <= redist1_i_max_value_0_i20_memread_q_4_outputreg_q;
            WHEN "1" => i_max_value_0_i6_memread_q <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_1;
            WHEN OTHERS => i_max_value_0_i6_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_i_acl_memread_memread2577_q_4_inputreg(DELAY,995)
    redist3_i_acl_memread_memread2577_q_4_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_memread_memread2577_q, xout => redist3_i_acl_memread_memread2577_q_4_inputreg_q, clk => clock, aclr => resetn );

    -- redist3_i_acl_memread_memread2577_q_4(DELAY,923)
    redist3_i_acl_memread_memread2577_q_4 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_acl_memread_memread2577_q_4_inputreg_q, xout => redist3_i_acl_memread_memread2577_q_4_q, clk => clock, aclr => resetn );

    -- redist3_i_acl_memread_memread2577_q_4_outputreg(DELAY,996)
    redist3_i_acl_memread_memread2577_q_4_outputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_acl_memread_memread2577_q_4_q, xout => redist3_i_acl_memread_memread2577_q_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_cmp_i10_memread(COMPARE,348)@10
    i_cmp_i10_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_0(15)) & i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_0));
    i_cmp_i10_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => redist3_i_acl_memread_memread2577_q_4_outputreg_q(15)) & redist3_i_acl_memread_memread2577_q_4_outputreg_q));
    i_cmp_i10_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp_i10_memread_a) - SIGNED(i_cmp_i10_memread_b));
    i_cmp_i10_memread_n(0) <= not (i_cmp_i10_memread_o(17));

    -- i_acl_483_memread(MUX,258)@10
    i_acl_483_memread_s <= i_cmp_i10_memread_n;
    i_acl_483_memread_combproc: PROCESS (i_acl_483_memread_s, redist3_i_acl_memread_memread2577_q_4_outputreg_q, i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_0)
    BEGIN
        CASE (i_acl_483_memread_s) IS
            WHEN "0" => i_acl_483_memread_q <= redist3_i_acl_memread_memread2577_q_4_outputreg_q;
            WHEN "1" => i_acl_483_memread_q <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_o_readdata_0;
            WHEN OTHERS => i_acl_483_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist4_i_acl_2089_memread_q_5_notEnable(LOGICAL,1003)
    redist4_i_acl_2089_memread_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_i_acl_2089_memread_q_5_nor(LOGICAL,1004)
    redist4_i_acl_2089_memread_q_5_nor_q <= not (redist4_i_acl_2089_memread_q_5_notEnable_q or redist4_i_acl_2089_memread_q_5_sticky_ena_q);

    -- redist4_i_acl_2089_memread_q_5_mem_last(CONSTANT,1000)
    redist4_i_acl_2089_memread_q_5_mem_last_q <= "01";

    -- redist4_i_acl_2089_memread_q_5_cmp(LOGICAL,1001)
    redist4_i_acl_2089_memread_q_5_cmp_q <= "1" WHEN redist4_i_acl_2089_memread_q_5_mem_last_q = redist4_i_acl_2089_memread_q_5_rdcnt_q ELSE "0";

    -- redist4_i_acl_2089_memread_q_5_cmpReg(REG,1002)
    redist4_i_acl_2089_memread_q_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_acl_2089_memread_q_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_i_acl_2089_memread_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist4_i_acl_2089_memread_q_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_i_acl_2089_memread_q_5_sticky_ena(REG,1005)
    redist4_i_acl_2089_memread_q_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_acl_2089_memread_q_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_i_acl_2089_memread_q_5_nor_q = "1") THEN
                redist4_i_acl_2089_memread_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_i_acl_2089_memread_q_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_acl_2089_memread_q_5_enaAnd(LOGICAL,1006)
    redist4_i_acl_2089_memread_q_5_enaAnd_q <= redist4_i_acl_2089_memread_q_5_sticky_ena_q and VCC_q;

    -- redist4_i_acl_2089_memread_q_5_rdcnt(COUNTER,998)
    -- low=0, high=2, step=1, init=0
    redist4_i_acl_2089_memread_q_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_acl_2089_memread_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist4_i_acl_2089_memread_q_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_i_acl_2089_memread_q_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist4_i_acl_2089_memread_q_5_rdcnt_eq <= '1';
            ELSE
                redist4_i_acl_2089_memread_q_5_rdcnt_eq <= '0';
            END IF;
            IF (redist4_i_acl_2089_memread_q_5_rdcnt_eq = '1') THEN
                redist4_i_acl_2089_memread_q_5_rdcnt_i <= redist4_i_acl_2089_memread_q_5_rdcnt_i + 2;
            ELSE
                redist4_i_acl_2089_memread_q_5_rdcnt_i <= redist4_i_acl_2089_memread_q_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist4_i_acl_2089_memread_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_i_acl_2089_memread_q_5_rdcnt_i, 2)));

    -- rightShiftStage0Idx1Rng1_uid642_i_shr975485_5_memread_memread2570_shift_x(BITSELECT,641)@4
    rightShiftStage0Idx1Rng1_uid642_i_shr975485_5_memread_memread2570_shift_x_b <= redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q(31 downto 1);

    -- rightShiftStage0Idx1_uid644_i_shr975485_5_memread_memread2570_shift_x(BITJOIN,643)@4
    rightShiftStage0Idx1_uid644_i_shr975485_5_memread_memread2570_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid642_i_shr975485_5_memread_memread2570_shift_x_b;

    -- redist23_sync_in_aunroll_x_in_c0_eni191052_13_1(DELAY,943)
    redist23_sync_in_aunroll_x_in_c0_eni191052_13_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_13, xout => redist23_sync_in_aunroll_x_in_c0_eni191052_13_1_q, clk => clock, aclr => resetn );

    -- c_i32_0gr(CONSTANT,214)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_cond788_5_memread(MUX,352)@1
    i_cond788_5_memread_s <= redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q;
    i_cond788_5_memread_combproc: PROCESS (i_cond788_5_memread_s, redist13_sync_in_aunroll_x_in_c0_eni191052_3_1_q, c_i32_0gr_q)
    BEGIN
        CASE (i_cond788_5_memread_s) IS
            WHEN "0" => i_cond788_5_memread_q <= redist13_sync_in_aunroll_x_in_c0_eni191052_3_1_q;
            WHEN "1" => i_cond788_5_memread_q <= c_i32_0gr_q;
            WHEN OTHERS => i_cond788_5_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_add816_5_memread(ADD,271)@1
    i_add816_5_memread_a <= STD_LOGIC_VECTOR("0" & i_cond788_5_memread_q);
    i_add816_5_memread_b <= STD_LOGIC_VECTOR("0" & redist23_sync_in_aunroll_x_in_c0_eni191052_13_1_q);
    i_add816_5_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add816_5_memread_a) + UNSIGNED(i_add816_5_memread_b));
    i_add816_5_memread_q <= i_add816_5_memread_o(32 downto 0);

    -- bgTrunc_i_add816_5_memread_sel_x(BITSELECT,11)@1
    bgTrunc_i_add816_5_memread_sel_x_b <= i_add816_5_memread_q(31 downto 0);

    -- redist47_bgTrunc_i_add816_5_memread_sel_x_b_2(DELAY,967)
    redist47_bgTrunc_i_add816_5_memread_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add816_5_memread_sel_x_b, xout => redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- xMSB_uid778_i_shr_5_memread_memread2548_shift_x(BITSELECT,777)@3
    xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b <= STD_LOGIC_VECTOR(redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q(31 downto 31));

    -- rightShiftStage2Idx1Rng1_uid802_i_shr_5_memread_memread2548_shift_x(BITSELECT,801)@3
    rightShiftStage2Idx1Rng1_uid802_i_shr_5_memread_memread2548_shift_x_b <= rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q(31 downto 1);

    -- rightShiftStage2Idx1_uid803_i_shr_5_memread_memread2548_shift_x(BITJOIN,802)@3
    rightShiftStage2Idx1_uid803_i_shr_5_memread_memread2548_shift_x_q <= xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b & rightShiftStage2Idx1Rng1_uid802_i_shr_5_memread_memread2548_shift_x_b;

    -- seMsb_to6_uid797(BITSELECT,796)@3
    seMsb_to6_uid797_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b(0)) & xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b));
    seMsb_to6_uid797_b <= STD_LOGIC_VECTOR(seMsb_to6_uid797_in(5 downto 0));

    -- rightShiftStage1Idx3Rng6_uid798_i_shr_5_memread_memread2548_shift_x(BITSELECT,797)@3
    rightShiftStage1Idx3Rng6_uid798_i_shr_5_memread_memread2548_shift_x_b <= rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q(31 downto 6);

    -- rightShiftStage1Idx3_uid799_i_shr_5_memread_memread2548_shift_x(BITJOIN,798)@3
    rightShiftStage1Idx3_uid799_i_shr_5_memread_memread2548_shift_x_q <= seMsb_to6_uid797_b & rightShiftStage1Idx3Rng6_uid798_i_shr_5_memread_memread2548_shift_x_b;

    -- seMsb_to4_uid794(BITSELECT,793)@3
    seMsb_to4_uid794_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b(0)) & xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b));
    seMsb_to4_uid794_b <= STD_LOGIC_VECTOR(seMsb_to4_uid794_in(3 downto 0));

    -- rightShiftStage1Idx2Rng4_uid795_i_shr_5_memread_memread2548_shift_x(BITSELECT,794)@3
    rightShiftStage1Idx2Rng4_uid795_i_shr_5_memread_memread2548_shift_x_b <= rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx2_uid796_i_shr_5_memread_memread2548_shift_x(BITJOIN,795)@3
    rightShiftStage1Idx2_uid796_i_shr_5_memread_memread2548_shift_x_q <= seMsb_to4_uid794_b & rightShiftStage1Idx2Rng4_uid795_i_shr_5_memread_memread2548_shift_x_b;

    -- seMsb_to2_uid791(BITSELECT,790)@3
    seMsb_to2_uid791_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b(0)) & xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b));
    seMsb_to2_uid791_b <= STD_LOGIC_VECTOR(seMsb_to2_uid791_in(1 downto 0));

    -- rightShiftStage1Idx1Rng2_uid792_i_shr_5_memread_memread2548_shift_x(BITSELECT,791)@3
    rightShiftStage1Idx1Rng2_uid792_i_shr_5_memread_memread2548_shift_x_b <= rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q(31 downto 2);

    -- rightShiftStage1Idx1_uid793_i_shr_5_memread_memread2548_shift_x(BITJOIN,792)@3
    rightShiftStage1Idx1_uid793_i_shr_5_memread_memread2548_shift_x_q <= seMsb_to2_uid791_b & rightShiftStage1Idx1Rng2_uid792_i_shr_5_memread_memread2548_shift_x_b;

    -- seMsb_to24_uid786(BITSELECT,785)@3
    seMsb_to24_uid786_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b(0)) & xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b));
    seMsb_to24_uid786_b <= STD_LOGIC_VECTOR(seMsb_to24_uid786_in(23 downto 0));

    -- rightShiftStage0Idx3Rng24_uid787_i_shr_5_memread_memread2548_shift_x(BITSELECT,786)@3
    rightShiftStage0Idx3Rng24_uid787_i_shr_5_memread_memread2548_shift_x_b <= redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q(31 downto 24);

    -- rightShiftStage0Idx3_uid788_i_shr_5_memread_memread2548_shift_x(BITJOIN,787)@3
    rightShiftStage0Idx3_uid788_i_shr_5_memread_memread2548_shift_x_q <= seMsb_to24_uid786_b & rightShiftStage0Idx3Rng24_uid787_i_shr_5_memread_memread2548_shift_x_b;

    -- seMsb_to16_uid783(BITSELECT,782)@3
    seMsb_to16_uid783_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b(0)) & xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b));
    seMsb_to16_uid783_b <= STD_LOGIC_VECTOR(seMsb_to16_uid783_in(15 downto 0));

    -- rightShiftStage0Idx2Rng16_uid784_i_shr_5_memread_memread2548_shift_x(BITSELECT,783)@3
    rightShiftStage0Idx2Rng16_uid784_i_shr_5_memread_memread2548_shift_x_b <= redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q(31 downto 16);

    -- rightShiftStage0Idx2_uid785_i_shr_5_memread_memread2548_shift_x(BITJOIN,784)@3
    rightShiftStage0Idx2_uid785_i_shr_5_memread_memread2548_shift_x_q <= seMsb_to16_uid783_b & rightShiftStage0Idx2Rng16_uid784_i_shr_5_memread_memread2548_shift_x_b;

    -- seMsb_to8_uid780(BITSELECT,779)@3
    seMsb_to8_uid780_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b(0)) & xMSB_uid778_i_shr_5_memread_memread2548_shift_x_b));
    seMsb_to8_uid780_b <= STD_LOGIC_VECTOR(seMsb_to8_uid780_in(7 downto 0));

    -- rightShiftStage0Idx1Rng8_uid781_i_shr_5_memread_memread2548_shift_x(BITSELECT,780)@3
    rightShiftStage0Idx1Rng8_uid781_i_shr_5_memread_memread2548_shift_x_b <= redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q(31 downto 8);

    -- rightShiftStage0Idx1_uid782_i_shr_5_memread_memread2548_shift_x(BITJOIN,781)@3
    rightShiftStage0Idx1_uid782_i_shr_5_memread_memread2548_shift_x_q <= seMsb_to8_uid780_b & rightShiftStage0Idx1Rng8_uid781_i_shr_5_memread_memread2548_shift_x_b;

    -- rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x(MUX,789)@3
    rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b;
    rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_combproc: PROCESS (rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_s, redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q, rightShiftStage0Idx1_uid782_i_shr_5_memread_memread2548_shift_x_q, rightShiftStage0Idx2_uid785_i_shr_5_memread_memread2548_shift_x_q, rightShiftStage0Idx3_uid788_i_shr_5_memread_memread2548_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q <= redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q;
            WHEN "01" => rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage0Idx1_uid782_i_shr_5_memread_memread2548_shift_x_q;
            WHEN "10" => rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage0Idx2_uid785_i_shr_5_memread_memread2548_shift_x_q;
            WHEN "11" => rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage0Idx3_uid788_i_shr_5_memread_memread2548_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x(MUX,800)@3
    rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c;
    rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_combproc: PROCESS (rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_s, rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q, rightShiftStage1Idx1_uid793_i_shr_5_memread_memread2548_shift_x_q, rightShiftStage1Idx2_uid796_i_shr_5_memread_memread2548_shift_x_q, rightShiftStage1Idx3_uid799_i_shr_5_memread_memread2548_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_s) IS
            WHEN "00" => rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage0_uid790_i_shr_5_memread_memread2548_shift_x_q;
            WHEN "01" => rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage1Idx1_uid793_i_shr_5_memread_memread2548_shift_x_q;
            WHEN "10" => rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage1Idx2_uid796_i_shr_5_memread_memread2548_shift_x_q;
            WHEN "11" => rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage1Idx3_uid799_i_shr_5_memread_memread2548_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x(MUX,804)@3
    rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d;
    rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_combproc: PROCESS (rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_s, rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q, rightShiftStage2Idx1_uid803_i_shr_5_memread_memread2548_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage1_uid801_i_shr_5_memread_memread2548_shift_x_q;
            WHEN "1" => rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_q <= rightShiftStage2Idx1_uid803_i_shr_5_memread_memread2548_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and884_5_memread(LOGICAL,290)@3
    i_and884_5_memread_q <= rightShiftStage2_uid805_i_shr_5_memread_memread2548_shift_x_q and dupName_0_c_i32_2gr_x_q;

    -- i_and884_5_memread_vt_select_31(BITSELECT,293)@3
    i_and884_5_memread_vt_select_31_b <= i_and884_5_memread_q(31 downto 1);

    -- i_and884_5_memread_vt_join(BITJOIN,292)@3
    i_and884_5_memread_vt_join_q <= i_and884_5_memread_vt_select_31_b & GND_q;

    -- i_storemerge1130_memread(ADD,428)@3
    i_storemerge1130_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_storemerge_v_memread_sel_x_b);
    i_storemerge1130_memread_b <= STD_LOGIC_VECTOR("0" & i_and884_5_memread_vt_join_q);
    i_storemerge1130_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1130_memread_a) + UNSIGNED(i_storemerge1130_memread_b));
    i_storemerge1130_memread_q <= i_storemerge1130_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1130_memread_sel_x(BITSELECT,26)@3
    bgTrunc_i_storemerge1130_memread_sel_x_b <= i_storemerge1130_memread_q(31 downto 0);

    -- redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1(DELAY,958)
    redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_storemerge1130_memread_sel_x_b, xout => redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x(MUX,645)@4
    rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_s <= VCC_q;
    rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_combproc: PROCESS (rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_s, redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid644_i_shr975485_5_memread_memread2570_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_q <= redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q;
            WHEN "1" => rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_q <= rightShiftStage0Idx1_uid644_i_shr975485_5_memread_memread2570_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr975485_5_memread_vt_select_30(BITSELECT,416)@4
    i_shr975485_5_memread_vt_select_30_b <= rightShiftStage0_uid646_i_shr975485_5_memread_memread2570_shift_x_q(30 downto 0);

    -- i_shr975485_5_memread_vt_join(BITJOIN,415)@4
    i_shr975485_5_memread_vt_join_q <= GND_q & i_shr975485_5_memread_vt_select_30_b;

    -- i_conv976_5_memread_sel_x(BITSELECT,64)@4
    i_conv976_5_memread_sel_x_b <= i_shr975485_5_memread_vt_join_q(15 downto 0);

    -- redist32_i_conv976_5_memread_sel_x_b_1(DELAY,952)
    redist32_i_conv976_5_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv976_5_memread_sel_x_b, xout => redist32_i_conv976_5_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp959_5_memread(COMPARE,339)@4 + 1
    i_cmp959_5_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q(31)) & redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q));
    i_cmp959_5_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_256_q(31)) & c_i32_256_q));
    i_cmp959_5_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp959_5_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp959_5_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp959_5_memread_a) - SIGNED(i_cmp959_5_memread_b));
        END IF;
    END PROCESS;
    i_cmp959_5_memread_c(0) <= i_cmp959_5_memread_o(33);

    -- i_acl_2086_memread(MUX,253)@5
    i_acl_2086_memread_s <= i_cmp959_5_memread_c;
    i_acl_2086_memread_combproc: PROCESS (i_acl_2086_memread_s, c_i16_127_q, c_i16_128_q)
    BEGIN
        CASE (i_acl_2086_memread_s) IS
            WHEN "0" => i_acl_2086_memread_q <= c_i16_127_q;
            WHEN "1" => i_acl_2086_memread_q <= c_i16_128_q;
            WHEN OTHERS => i_acl_2086_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_storemerge1130_off_memread(ADD,429)@4
    i_storemerge1130_off_memread_a <= STD_LOGIC_VECTOR("0" & redist38_bgTrunc_i_storemerge1130_memread_sel_x_b_1_q);
    i_storemerge1130_off_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_256_x_q);
    i_storemerge1130_off_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1130_off_memread_a) + UNSIGNED(i_storemerge1130_off_memread_b));
    i_storemerge1130_off_memread_q <= i_storemerge1130_off_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1130_off_memread_sel_x(BITSELECT,27)@4
    bgTrunc_i_storemerge1130_off_memread_sel_x_b <= i_storemerge1130_off_memread_q(31 downto 0);

    -- i_acl_2087_memread(COMPARE,254)@4 + 1
    i_acl_2087_memread_a <= STD_LOGIC_VECTOR("00" & bgTrunc_i_storemerge1130_off_memread_sel_x_b);
    i_acl_2087_memread_b <= STD_LOGIC_VECTOR("00" & c_i32_512_q);
    i_acl_2087_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2087_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_acl_2087_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_2087_memread_a) - UNSIGNED(i_acl_2087_memread_b));
        END IF;
    END PROCESS;
    i_acl_2087_memread_c(0) <= i_acl_2087_memread_o(33);

    -- i_acl_2088_memread(MUX,255)@5
    i_acl_2088_memread_s <= i_acl_2087_memread_c;
    i_acl_2088_memread_combproc: PROCESS (i_acl_2088_memread_s, i_acl_2086_memread_q, redist32_i_conv976_5_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_acl_2088_memread_s) IS
            WHEN "0" => i_acl_2088_memread_q <= i_acl_2086_memread_q;
            WHEN "1" => i_acl_2088_memread_q <= redist32_i_conv976_5_memread_sel_x_b_1_q;
            WHEN OTHERS => i_acl_2088_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and997_5_memread(LOGICAL,322)@5
    i_and997_5_memread_q <= i_acl_2088_memread_q and dupName_0_c_i16_128_x_q;

    -- i_and997_5_memread_vt_select_7(BITSELECT,326)@5
    i_and997_5_memread_vt_select_7_b <= i_and997_5_memread_q(7 downto 7);

    -- i_and997_5_memread_vt_join(BITJOIN,325)@5
    i_and997_5_memread_vt_join_q <= c_i8_0gr_q & i_and997_5_memread_vt_select_7_b & i_and986_rm_memread_vt_const_7_q;

    -- i_cmp998_5_memread(LOGICAL,346)@5
    i_cmp998_5_memread_q <= "1" WHEN i_and997_5_memread_vt_join_q = c_i16_0gr_q ELSE "0";

    -- i_acl_1424_memread(MUX,232)@5
    i_acl_1424_memread_s <= i_cmp998_5_memread_q;
    i_acl_1424_memread_combproc: PROCESS (i_acl_1424_memread_s, c_i16_0gr_q, i_acl_2088_memread_q)
    BEGIN
        CASE (i_acl_1424_memread_s) IS
            WHEN "0" => i_acl_1424_memread_q <= c_i16_0gr_q;
            WHEN "1" => i_acl_1424_memread_q <= i_acl_2088_memread_q;
            WHEN OTHERS => i_acl_1424_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2089_memread(MUX,256)@5 + 1
    i_acl_2089_memread_s <= i_cmp987_rm_memread_q;
    i_acl_2089_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2089_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_2089_memread_s) IS
                WHEN "0" => i_acl_2089_memread_q <= i_acl_1424_memread_q;
                WHEN "1" => i_acl_2089_memread_q <= i_acl_2088_memread_q;
                WHEN OTHERS => i_acl_2089_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist4_i_acl_2089_memread_q_5_wraddr(REG,999)
    redist4_i_acl_2089_memread_q_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_acl_2089_memread_q_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_i_acl_2089_memread_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist4_i_acl_2089_memread_q_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_i_acl_2089_memread_q_5_mem(DUALMEM,997)
    redist4_i_acl_2089_memread_q_5_mem_ia <= STD_LOGIC_VECTOR(i_acl_2089_memread_q);
    redist4_i_acl_2089_memread_q_5_mem_aa <= redist4_i_acl_2089_memread_q_5_wraddr_q;
    redist4_i_acl_2089_memread_q_5_mem_ab <= redist4_i_acl_2089_memread_q_5_rdcnt_q;
    redist4_i_acl_2089_memread_q_5_mem_reset0 <= not (resetn);
    redist4_i_acl_2089_memread_q_5_mem_dmem : altera_syncram
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
        clocken1 => redist4_i_acl_2089_memread_q_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_i_acl_2089_memread_q_5_mem_reset0,
        clock1 => clock,
        address_a => redist4_i_acl_2089_memread_q_5_mem_aa,
        data_a => redist4_i_acl_2089_memread_q_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_i_acl_2089_memread_q_5_mem_ab,
        q_b => redist4_i_acl_2089_memread_q_5_mem_iq
    );
    redist4_i_acl_2089_memread_q_5_mem_q <= redist4_i_acl_2089_memread_q_5_mem_iq(15 downto 0);

    -- redist5_i_acl_2084_memread_q_5_notEnable(LOGICAL,1013)
    redist5_i_acl_2084_memread_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist5_i_acl_2084_memread_q_5_nor(LOGICAL,1014)
    redist5_i_acl_2084_memread_q_5_nor_q <= not (redist5_i_acl_2084_memread_q_5_notEnable_q or redist5_i_acl_2084_memread_q_5_sticky_ena_q);

    -- redist5_i_acl_2084_memread_q_5_mem_last(CONSTANT,1010)
    redist5_i_acl_2084_memread_q_5_mem_last_q <= "01";

    -- redist5_i_acl_2084_memread_q_5_cmp(LOGICAL,1011)
    redist5_i_acl_2084_memread_q_5_cmp_q <= "1" WHEN redist5_i_acl_2084_memread_q_5_mem_last_q = redist5_i_acl_2084_memread_q_5_rdcnt_q ELSE "0";

    -- redist5_i_acl_2084_memread_q_5_cmpReg(REG,1012)
    redist5_i_acl_2084_memread_q_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_acl_2084_memread_q_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_i_acl_2084_memread_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist5_i_acl_2084_memread_q_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist5_i_acl_2084_memread_q_5_sticky_ena(REG,1015)
    redist5_i_acl_2084_memread_q_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_acl_2084_memread_q_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist5_i_acl_2084_memread_q_5_nor_q = "1") THEN
                redist5_i_acl_2084_memread_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist5_i_acl_2084_memread_q_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_i_acl_2084_memread_q_5_enaAnd(LOGICAL,1016)
    redist5_i_acl_2084_memread_q_5_enaAnd_q <= redist5_i_acl_2084_memread_q_5_sticky_ena_q and VCC_q;

    -- redist5_i_acl_2084_memread_q_5_rdcnt(COUNTER,1008)
    -- low=0, high=2, step=1, init=0
    redist5_i_acl_2084_memread_q_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_acl_2084_memread_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist5_i_acl_2084_memread_q_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist5_i_acl_2084_memread_q_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist5_i_acl_2084_memread_q_5_rdcnt_eq <= '1';
            ELSE
                redist5_i_acl_2084_memread_q_5_rdcnt_eq <= '0';
            END IF;
            IF (redist5_i_acl_2084_memread_q_5_rdcnt_eq = '1') THEN
                redist5_i_acl_2084_memread_q_5_rdcnt_i <= redist5_i_acl_2084_memread_q_5_rdcnt_i + 2;
            ELSE
                redist5_i_acl_2084_memread_q_5_rdcnt_i <= redist5_i_acl_2084_memread_q_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist5_i_acl_2084_memread_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist5_i_acl_2084_memread_q_5_rdcnt_i, 2)));

    -- rightShiftStage0Idx1Rng1_uid633_i_shr975485_4_memread_memread2567_shift_x(BITSELECT,632)@4
    rightShiftStage0Idx1Rng1_uid633_i_shr975485_4_memread_memread2567_shift_x_b <= redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q(31 downto 1);

    -- rightShiftStage0Idx1_uid635_i_shr975485_4_memread_memread2567_shift_x(BITJOIN,634)@4
    rightShiftStage0Idx1_uid635_i_shr975485_4_memread_memread2567_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid633_i_shr975485_4_memread_memread2567_shift_x_b;

    -- redist22_sync_in_aunroll_x_in_c0_eni191052_12_1(DELAY,942)
    redist22_sync_in_aunroll_x_in_c0_eni191052_12_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni191052_12, xout => redist22_sync_in_aunroll_x_in_c0_eni191052_12_1_q, clk => clock, aclr => resetn );

    -- i_acl_1131_memread(MUX,226)@1
    i_acl_1131_memread_s <= redist10_sync_in_aunroll_x_in_c0_eni191052_1_1_q;
    i_acl_1131_memread_combproc: PROCESS (i_acl_1131_memread_s, redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q, c_i32_0gr_q)
    BEGIN
        CASE (i_acl_1131_memread_s) IS
            WHEN "0" => i_acl_1131_memread_q <= redist12_sync_in_aunroll_x_in_c0_eni191052_2_1_q;
            WHEN "1" => i_acl_1131_memread_q <= c_i32_0gr_q;
            WHEN OTHERS => i_acl_1131_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_add816_4_memread(ADD,270)@1
    i_add816_4_memread_a <= STD_LOGIC_VECTOR("0" & i_acl_1131_memread_q);
    i_add816_4_memread_b <= STD_LOGIC_VECTOR("0" & redist22_sync_in_aunroll_x_in_c0_eni191052_12_1_q);
    i_add816_4_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add816_4_memread_a) + UNSIGNED(i_add816_4_memread_b));
    i_add816_4_memread_q <= i_add816_4_memread_o(32 downto 0);

    -- bgTrunc_i_add816_4_memread_sel_x(BITSELECT,10)@1
    bgTrunc_i_add816_4_memread_sel_x_b <= i_add816_4_memread_q(31 downto 0);

    -- redist49_bgTrunc_i_add816_4_memread_sel_x_b_2(DELAY,969)
    redist49_bgTrunc_i_add816_4_memread_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add816_4_memread_sel_x_b, xout => redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- xMSB_uid748_i_shr_4_memread_memread2547_shift_x(BITSELECT,747)@3
    xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b <= STD_LOGIC_VECTOR(redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q(31 downto 31));

    -- rightShiftStage2Idx1Rng1_uid772_i_shr_4_memread_memread2547_shift_x(BITSELECT,771)@3
    rightShiftStage2Idx1Rng1_uid772_i_shr_4_memread_memread2547_shift_x_b <= rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q(31 downto 1);

    -- rightShiftStage2Idx1_uid773_i_shr_4_memread_memread2547_shift_x(BITJOIN,772)@3
    rightShiftStage2Idx1_uid773_i_shr_4_memread_memread2547_shift_x_q <= xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b & rightShiftStage2Idx1Rng1_uid772_i_shr_4_memread_memread2547_shift_x_b;

    -- seMsb_to6_uid767(BITSELECT,766)@3
    seMsb_to6_uid767_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b(0)) & xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b));
    seMsb_to6_uid767_b <= STD_LOGIC_VECTOR(seMsb_to6_uid767_in(5 downto 0));

    -- rightShiftStage1Idx3Rng6_uid768_i_shr_4_memread_memread2547_shift_x(BITSELECT,767)@3
    rightShiftStage1Idx3Rng6_uid768_i_shr_4_memread_memread2547_shift_x_b <= rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q(31 downto 6);

    -- rightShiftStage1Idx3_uid769_i_shr_4_memread_memread2547_shift_x(BITJOIN,768)@3
    rightShiftStage1Idx3_uid769_i_shr_4_memread_memread2547_shift_x_q <= seMsb_to6_uid767_b & rightShiftStage1Idx3Rng6_uid768_i_shr_4_memread_memread2547_shift_x_b;

    -- seMsb_to4_uid764(BITSELECT,763)@3
    seMsb_to4_uid764_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b(0)) & xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b));
    seMsb_to4_uid764_b <= STD_LOGIC_VECTOR(seMsb_to4_uid764_in(3 downto 0));

    -- rightShiftStage1Idx2Rng4_uid765_i_shr_4_memread_memread2547_shift_x(BITSELECT,764)@3
    rightShiftStage1Idx2Rng4_uid765_i_shr_4_memread_memread2547_shift_x_b <= rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx2_uid766_i_shr_4_memread_memread2547_shift_x(BITJOIN,765)@3
    rightShiftStage1Idx2_uid766_i_shr_4_memread_memread2547_shift_x_q <= seMsb_to4_uid764_b & rightShiftStage1Idx2Rng4_uid765_i_shr_4_memread_memread2547_shift_x_b;

    -- seMsb_to2_uid761(BITSELECT,760)@3
    seMsb_to2_uid761_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b(0)) & xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b));
    seMsb_to2_uid761_b <= STD_LOGIC_VECTOR(seMsb_to2_uid761_in(1 downto 0));

    -- rightShiftStage1Idx1Rng2_uid762_i_shr_4_memread_memread2547_shift_x(BITSELECT,761)@3
    rightShiftStage1Idx1Rng2_uid762_i_shr_4_memread_memread2547_shift_x_b <= rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q(31 downto 2);

    -- rightShiftStage1Idx1_uid763_i_shr_4_memread_memread2547_shift_x(BITJOIN,762)@3
    rightShiftStage1Idx1_uid763_i_shr_4_memread_memread2547_shift_x_q <= seMsb_to2_uid761_b & rightShiftStage1Idx1Rng2_uid762_i_shr_4_memread_memread2547_shift_x_b;

    -- seMsb_to24_uid756(BITSELECT,755)@3
    seMsb_to24_uid756_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b(0)) & xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b));
    seMsb_to24_uid756_b <= STD_LOGIC_VECTOR(seMsb_to24_uid756_in(23 downto 0));

    -- rightShiftStage0Idx3Rng24_uid757_i_shr_4_memread_memread2547_shift_x(BITSELECT,756)@3
    rightShiftStage0Idx3Rng24_uid757_i_shr_4_memread_memread2547_shift_x_b <= redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q(31 downto 24);

    -- rightShiftStage0Idx3_uid758_i_shr_4_memread_memread2547_shift_x(BITJOIN,757)@3
    rightShiftStage0Idx3_uid758_i_shr_4_memread_memread2547_shift_x_q <= seMsb_to24_uid756_b & rightShiftStage0Idx3Rng24_uid757_i_shr_4_memread_memread2547_shift_x_b;

    -- seMsb_to16_uid753(BITSELECT,752)@3
    seMsb_to16_uid753_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b(0)) & xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b));
    seMsb_to16_uid753_b <= STD_LOGIC_VECTOR(seMsb_to16_uid753_in(15 downto 0));

    -- rightShiftStage0Idx2Rng16_uid754_i_shr_4_memread_memread2547_shift_x(BITSELECT,753)@3
    rightShiftStage0Idx2Rng16_uid754_i_shr_4_memread_memread2547_shift_x_b <= redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q(31 downto 16);

    -- rightShiftStage0Idx2_uid755_i_shr_4_memread_memread2547_shift_x(BITJOIN,754)@3
    rightShiftStage0Idx2_uid755_i_shr_4_memread_memread2547_shift_x_q <= seMsb_to16_uid753_b & rightShiftStage0Idx2Rng16_uid754_i_shr_4_memread_memread2547_shift_x_b;

    -- seMsb_to8_uid750(BITSELECT,749)@3
    seMsb_to8_uid750_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b(0)) & xMSB_uid748_i_shr_4_memread_memread2547_shift_x_b));
    seMsb_to8_uid750_b <= STD_LOGIC_VECTOR(seMsb_to8_uid750_in(7 downto 0));

    -- rightShiftStage0Idx1Rng8_uid751_i_shr_4_memread_memread2547_shift_x(BITSELECT,750)@3
    rightShiftStage0Idx1Rng8_uid751_i_shr_4_memread_memread2547_shift_x_b <= redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q(31 downto 8);

    -- rightShiftStage0Idx1_uid752_i_shr_4_memread_memread2547_shift_x(BITJOIN,751)@3
    rightShiftStage0Idx1_uid752_i_shr_4_memread_memread2547_shift_x_q <= seMsb_to8_uid750_b & rightShiftStage0Idx1Rng8_uid751_i_shr_4_memread_memread2547_shift_x_b;

    -- rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x(MUX,759)@3
    rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_b;
    rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_combproc: PROCESS (rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_s, redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q, rightShiftStage0Idx1_uid752_i_shr_4_memread_memread2547_shift_x_q, rightShiftStage0Idx2_uid755_i_shr_4_memread_memread2547_shift_x_q, rightShiftStage0Idx3_uid758_i_shr_4_memread_memread2547_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_s) IS
            WHEN "00" => rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q <= redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q;
            WHEN "01" => rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage0Idx1_uid752_i_shr_4_memread_memread2547_shift_x_q;
            WHEN "10" => rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage0Idx2_uid755_i_shr_4_memread_memread2547_shift_x_q;
            WHEN "11" => rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage0Idx3_uid758_i_shr_4_memread_memread2547_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x(MUX,770)@3
    rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_c;
    rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_combproc: PROCESS (rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_s, rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q, rightShiftStage1Idx1_uid763_i_shr_4_memread_memread2547_shift_x_q, rightShiftStage1Idx2_uid766_i_shr_4_memread_memread2547_shift_x_q, rightShiftStage1Idx3_uid769_i_shr_4_memread_memread2547_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_s) IS
            WHEN "00" => rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage0_uid760_i_shr_4_memread_memread2547_shift_x_q;
            WHEN "01" => rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage1Idx1_uid763_i_shr_4_memread_memread2547_shift_x_q;
            WHEN "10" => rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage1Idx2_uid766_i_shr_4_memread_memread2547_shift_x_q;
            WHEN "11" => rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage1Idx3_uid769_i_shr_4_memread_memread2547_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x(MUX,774)@3
    rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_s <= rightShiftStageSel4Dto3_uid669_i_shr_1_memread_memread2544_shift_x_merged_bit_select_d;
    rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_combproc: PROCESS (rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_s, rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q, rightShiftStage2Idx1_uid773_i_shr_4_memread_memread2547_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage1_uid771_i_shr_4_memread_memread2547_shift_x_q;
            WHEN "1" => rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_q <= rightShiftStage2Idx1_uid773_i_shr_4_memread_memread2547_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and884_4_memread(LOGICAL,286)@3
    i_and884_4_memread_q <= rightShiftStage2_uid775_i_shr_4_memread_memread2547_shift_x_q and dupName_0_c_i32_2gr_x_q;

    -- i_and884_4_memread_vt_select_31(BITSELECT,289)@3
    i_and884_4_memread_vt_select_31_b <= i_and884_4_memread_q(31 downto 1);

    -- i_and884_4_memread_vt_join(BITJOIN,288)@3
    i_and884_4_memread_vt_join_q <= i_and884_4_memread_vt_select_31_b & GND_q;

    -- i_storemerge1129_memread(ADD,426)@3
    i_storemerge1129_memread_a <= STD_LOGIC_VECTOR("0" & bgTrunc_i_storemerge_v_memread_sel_x_b);
    i_storemerge1129_memread_b <= STD_LOGIC_VECTOR("0" & i_and884_4_memread_vt_join_q);
    i_storemerge1129_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1129_memread_a) + UNSIGNED(i_storemerge1129_memread_b));
    i_storemerge1129_memread_q <= i_storemerge1129_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1129_memread_sel_x(BITSELECT,24)@3
    bgTrunc_i_storemerge1129_memread_sel_x_b <= i_storemerge1129_memread_q(31 downto 0);

    -- redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1(DELAY,959)
    redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_storemerge1129_memread_sel_x_b, xout => redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x(MUX,636)@4
    rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_s <= VCC_q;
    rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_combproc: PROCESS (rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_s, redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q, rightShiftStage0Idx1_uid635_i_shr975485_4_memread_memread2567_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_q <= redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q;
            WHEN "1" => rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_q <= rightShiftStage0Idx1_uid635_i_shr975485_4_memread_memread2567_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr975485_4_memread_vt_select_30(BITSELECT,413)@4
    i_shr975485_4_memread_vt_select_30_b <= rightShiftStage0_uid637_i_shr975485_4_memread_memread2567_shift_x_q(30 downto 0);

    -- i_shr975485_4_memread_vt_join(BITJOIN,412)@4
    i_shr975485_4_memread_vt_join_q <= GND_q & i_shr975485_4_memread_vt_select_30_b;

    -- i_conv976_4_memread_sel_x(BITSELECT,63)@4
    i_conv976_4_memread_sel_x_b <= i_shr975485_4_memread_vt_join_q(15 downto 0);

    -- redist33_i_conv976_4_memread_sel_x_b_1(DELAY,953)
    redist33_i_conv976_4_memread_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv976_4_memread_sel_x_b, xout => redist33_i_conv976_4_memread_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp959_4_memread(COMPARE,338)@4 + 1
    i_cmp959_4_memread_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q(31)) & redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q));
    i_cmp959_4_memread_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_256_q(31)) & c_i32_256_q));
    i_cmp959_4_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp959_4_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp959_4_memread_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp959_4_memread_a) - SIGNED(i_cmp959_4_memread_b));
        END IF;
    END PROCESS;
    i_cmp959_4_memread_c(0) <= i_cmp959_4_memread_o(33);

    -- i_acl_2081_memread(MUX,249)@5
    i_acl_2081_memread_s <= i_cmp959_4_memread_c;
    i_acl_2081_memread_combproc: PROCESS (i_acl_2081_memread_s, c_i16_127_q, c_i16_128_q)
    BEGIN
        CASE (i_acl_2081_memread_s) IS
            WHEN "0" => i_acl_2081_memread_q <= c_i16_127_q;
            WHEN "1" => i_acl_2081_memread_q <= c_i16_128_q;
            WHEN OTHERS => i_acl_2081_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_storemerge1129_off_memread(ADD,427)@4
    i_storemerge1129_off_memread_a <= STD_LOGIC_VECTOR("0" & redist39_bgTrunc_i_storemerge1129_memread_sel_x_b_1_q);
    i_storemerge1129_off_memread_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_256_x_q);
    i_storemerge1129_off_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_storemerge1129_off_memread_a) + UNSIGNED(i_storemerge1129_off_memread_b));
    i_storemerge1129_off_memread_q <= i_storemerge1129_off_memread_o(32 downto 0);

    -- bgTrunc_i_storemerge1129_off_memread_sel_x(BITSELECT,25)@4
    bgTrunc_i_storemerge1129_off_memread_sel_x_b <= i_storemerge1129_off_memread_q(31 downto 0);

    -- i_acl_2082_memread(COMPARE,250)@4 + 1
    i_acl_2082_memread_a <= STD_LOGIC_VECTOR("00" & bgTrunc_i_storemerge1129_off_memread_sel_x_b);
    i_acl_2082_memread_b <= STD_LOGIC_VECTOR("00" & c_i32_512_q);
    i_acl_2082_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2082_memread_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_acl_2082_memread_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_2082_memread_a) - UNSIGNED(i_acl_2082_memread_b));
        END IF;
    END PROCESS;
    i_acl_2082_memread_c(0) <= i_acl_2082_memread_o(33);

    -- i_acl_2083_memread(MUX,251)@5
    i_acl_2083_memread_s <= i_acl_2082_memread_c;
    i_acl_2083_memread_combproc: PROCESS (i_acl_2083_memread_s, i_acl_2081_memread_q, redist33_i_conv976_4_memread_sel_x_b_1_q)
    BEGIN
        CASE (i_acl_2083_memread_s) IS
            WHEN "0" => i_acl_2083_memread_q <= i_acl_2081_memread_q;
            WHEN "1" => i_acl_2083_memread_q <= redist33_i_conv976_4_memread_sel_x_b_1_q;
            WHEN OTHERS => i_acl_2083_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and997_4_memread(LOGICAL,317)@5
    i_and997_4_memread_q <= i_acl_2083_memread_q and dupName_0_c_i16_128_x_q;

    -- i_and997_4_memread_vt_select_7(BITSELECT,321)@5
    i_and997_4_memread_vt_select_7_b <= i_and997_4_memread_q(7 downto 7);

    -- i_and997_4_memread_vt_join(BITJOIN,320)@5
    i_and997_4_memread_vt_join_q <= c_i8_0gr_q & i_and997_4_memread_vt_select_7_b & i_and986_rm_memread_vt_const_7_q;

    -- i_cmp998_4_memread(LOGICAL,345)@5
    i_cmp998_4_memread_q <= "1" WHEN i_and997_4_memread_vt_join_q = c_i16_0gr_q ELSE "0";

    -- i_acl_1423_memread(MUX,231)@5
    i_acl_1423_memread_s <= i_cmp998_4_memread_q;
    i_acl_1423_memread_combproc: PROCESS (i_acl_1423_memread_s, c_i16_0gr_q, i_acl_2083_memread_q)
    BEGIN
        CASE (i_acl_1423_memread_s) IS
            WHEN "0" => i_acl_1423_memread_q <= c_i16_0gr_q;
            WHEN "1" => i_acl_1423_memread_q <= i_acl_2083_memread_q;
            WHEN OTHERS => i_acl_1423_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_2084_memread(MUX,252)@5 + 1
    i_acl_2084_memread_s <= i_cmp987_rm_memread_q;
    i_acl_2084_memread_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_2084_memread_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_2084_memread_s) IS
                WHEN "0" => i_acl_2084_memread_q <= i_acl_1423_memread_q;
                WHEN "1" => i_acl_2084_memread_q <= i_acl_2083_memread_q;
                WHEN OTHERS => i_acl_2084_memread_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_i_acl_2084_memread_q_5_wraddr(REG,1009)
    redist5_i_acl_2084_memread_q_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_acl_2084_memread_q_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_i_acl_2084_memread_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist5_i_acl_2084_memread_q_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist5_i_acl_2084_memread_q_5_mem(DUALMEM,1007)
    redist5_i_acl_2084_memread_q_5_mem_ia <= STD_LOGIC_VECTOR(i_acl_2084_memread_q);
    redist5_i_acl_2084_memread_q_5_mem_aa <= redist5_i_acl_2084_memread_q_5_wraddr_q;
    redist5_i_acl_2084_memread_q_5_mem_ab <= redist5_i_acl_2084_memread_q_5_rdcnt_q;
    redist5_i_acl_2084_memread_q_5_mem_reset0 <= not (resetn);
    redist5_i_acl_2084_memread_q_5_mem_dmem : altera_syncram
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
        clocken1 => redist5_i_acl_2084_memread_q_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist5_i_acl_2084_memread_q_5_mem_reset0,
        clock1 => clock,
        address_a => redist5_i_acl_2084_memread_q_5_mem_aa,
        data_a => redist5_i_acl_2084_memread_q_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist5_i_acl_2084_memread_q_5_mem_ab,
        q_b => redist5_i_acl_2084_memread_q_5_mem_iq
    );
    redist5_i_acl_2084_memread_q_5_mem_q <= redist5_i_acl_2084_memread_q_5_mem_iq(15 downto 0);

    -- redist6_i_acl_2079_memread_q_5_notEnable(LOGICAL,1023)
    redist6_i_acl_2079_memread_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist6_i_acl_2079_memread_q_5_nor(LOGICAL,1024)
    redist6_i_acl_2079_memread_q_5_nor_q <= not (redist6_i_acl_2079_memread_q_5_notEnable_q or redist6_i_acl_2079_memread_q_5_sticky_ena_q);

    -- redist6_i_acl_2079_memread_q_5_mem_last(CONSTANT,1020)
    redist6_i_acl_2079_memread_q_5_mem_last_q <= "01";

    -- redist6_i_acl_2079_memread_q_5_cmp(LOGICAL,1021)
    redist6_i_acl_2079_memread_q_5_cmp_q <= "1" WHEN redist6_i_acl_2079_memread_q_5_mem_last_q = redist6_i_acl_2079_memread_q_5_rdcnt_q ELSE "0";

    -- redist6_i_acl_2079_memread_q_5_cmpReg(REG,1022)
    redist6_i_acl_2079_memread_q_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_acl_2079_memread_q_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_i_acl_2079_memread_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist6_i_acl_2079_memread_q_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist6_i_acl_2079_memread_q_5_sticky_ena(REG,1025)
    redist6_i_acl_2079_memread_q_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_acl_2079_memread_q_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_i_acl_2079_memread_q_5_nor_q = "1") THEN
                redist6_i_acl_2079_memread_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_i_acl_2079_memread_q_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_acl_2079_memread_q_5_enaAnd(LOGICAL,1026)
    redist6_i_acl_2079_memread_q_5_enaAnd_q <= redist6_i_acl_2079_memread_q_5_sticky_ena_q and VCC_q;

    -- redist6_i_acl_2079_memread_q_5_rdcnt(COUNTER,1018)
    -- low=0, high=2, step=1, init=0
    redist6_i_acl_2079_memread_q_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_acl_2079_memread_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist6_i_acl_2079_memread_q_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_i_acl_2079_memread_q_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist6_i_acl_2079_memread_q_5_rdcnt_eq <= '1';
            ELSE
                redist6_i_acl_2079_memread_q_5_rdcnt_eq <= '0';
            END IF;
            IF (redist6_i_acl_2079_memread_q_5_rdcnt_eq = '1') THEN
                redist6_i_acl_2079_memread_q_5_rdcnt_i <= redist6_i_acl_2079_memread_q_5_rdcnt_i + 2;
            ELSE
                redist6_i_acl_2079_memread_q_5_rdcnt_i <= redist6_i_acl_2079_memread_q_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist6_i_acl_2079_memread_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_i_acl_2079_memread_q_5_rdcnt_i, 2)));

    -- redist6_i_acl_2079_memread_q_5_wraddr(REG,1019)
    redist6_i_acl_2079_memread_q_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_acl_2079_memread_q_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_i_acl_2079_memread_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist6_i_acl_2079_memread_q_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist6_i_acl_2079_memread_q_5_mem(DUALMEM,1017)
    redist6_i_acl_2079_memread_q_5_mem_ia <= STD_LOGIC_VECTOR(i_acl_2079_memread_q);
    redist6_i_acl_2079_memread_q_5_mem_aa <= redist6_i_acl_2079_memread_q_5_wraddr_q;
    redist6_i_acl_2079_memread_q_5_mem_ab <= redist6_i_acl_2079_memread_q_5_rdcnt_q;
    redist6_i_acl_2079_memread_q_5_mem_reset0 <= not (resetn);
    redist6_i_acl_2079_memread_q_5_mem_dmem : altera_syncram
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
        clocken1 => redist6_i_acl_2079_memread_q_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist6_i_acl_2079_memread_q_5_mem_reset0,
        clock1 => clock,
        address_a => redist6_i_acl_2079_memread_q_5_mem_aa,
        data_a => redist6_i_acl_2079_memread_q_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist6_i_acl_2079_memread_q_5_mem_ab,
        q_b => redist6_i_acl_2079_memread_q_5_mem_iq
    );
    redist6_i_acl_2079_memread_q_5_mem_q <= redist6_i_acl_2079_memread_q_5_mem_iq(15 downto 0);

    -- redist7_i_acl_2074_memread_q_5_notEnable(LOGICAL,1033)
    redist7_i_acl_2074_memread_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist7_i_acl_2074_memread_q_5_nor(LOGICAL,1034)
    redist7_i_acl_2074_memread_q_5_nor_q <= not (redist7_i_acl_2074_memread_q_5_notEnable_q or redist7_i_acl_2074_memread_q_5_sticky_ena_q);

    -- redist7_i_acl_2074_memread_q_5_mem_last(CONSTANT,1030)
    redist7_i_acl_2074_memread_q_5_mem_last_q <= "01";

    -- redist7_i_acl_2074_memread_q_5_cmp(LOGICAL,1031)
    redist7_i_acl_2074_memread_q_5_cmp_q <= "1" WHEN redist7_i_acl_2074_memread_q_5_mem_last_q = redist7_i_acl_2074_memread_q_5_rdcnt_q ELSE "0";

    -- redist7_i_acl_2074_memread_q_5_cmpReg(REG,1032)
    redist7_i_acl_2074_memread_q_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_acl_2074_memread_q_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_i_acl_2074_memread_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist7_i_acl_2074_memread_q_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist7_i_acl_2074_memread_q_5_sticky_ena(REG,1035)
    redist7_i_acl_2074_memread_q_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_acl_2074_memread_q_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_i_acl_2074_memread_q_5_nor_q = "1") THEN
                redist7_i_acl_2074_memread_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist7_i_acl_2074_memread_q_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_i_acl_2074_memread_q_5_enaAnd(LOGICAL,1036)
    redist7_i_acl_2074_memread_q_5_enaAnd_q <= redist7_i_acl_2074_memread_q_5_sticky_ena_q and VCC_q;

    -- redist7_i_acl_2074_memread_q_5_rdcnt(COUNTER,1028)
    -- low=0, high=2, step=1, init=0
    redist7_i_acl_2074_memread_q_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_acl_2074_memread_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist7_i_acl_2074_memread_q_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_i_acl_2074_memread_q_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist7_i_acl_2074_memread_q_5_rdcnt_eq <= '1';
            ELSE
                redist7_i_acl_2074_memread_q_5_rdcnt_eq <= '0';
            END IF;
            IF (redist7_i_acl_2074_memread_q_5_rdcnt_eq = '1') THEN
                redist7_i_acl_2074_memread_q_5_rdcnt_i <= redist7_i_acl_2074_memread_q_5_rdcnt_i + 2;
            ELSE
                redist7_i_acl_2074_memread_q_5_rdcnt_i <= redist7_i_acl_2074_memread_q_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist7_i_acl_2074_memread_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist7_i_acl_2074_memread_q_5_rdcnt_i, 2)));

    -- redist7_i_acl_2074_memread_q_5_wraddr(REG,1029)
    redist7_i_acl_2074_memread_q_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_acl_2074_memread_q_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_i_acl_2074_memread_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist7_i_acl_2074_memread_q_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist7_i_acl_2074_memread_q_5_mem(DUALMEM,1027)
    redist7_i_acl_2074_memread_q_5_mem_ia <= STD_LOGIC_VECTOR(i_acl_2074_memread_q);
    redist7_i_acl_2074_memread_q_5_mem_aa <= redist7_i_acl_2074_memread_q_5_wraddr_q;
    redist7_i_acl_2074_memread_q_5_mem_ab <= redist7_i_acl_2074_memread_q_5_rdcnt_q;
    redist7_i_acl_2074_memread_q_5_mem_reset0 <= not (resetn);
    redist7_i_acl_2074_memread_q_5_mem_dmem : altera_syncram
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
        clocken1 => redist7_i_acl_2074_memread_q_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist7_i_acl_2074_memread_q_5_mem_reset0,
        clock1 => clock,
        address_a => redist7_i_acl_2074_memread_q_5_mem_aa,
        data_a => redist7_i_acl_2074_memread_q_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist7_i_acl_2074_memread_q_5_mem_ab,
        q_b => redist7_i_acl_2074_memread_q_5_mem_iq
    );
    redist7_i_acl_2074_memread_q_5_mem_q <= redist7_i_acl_2074_memread_q_5_mem_iq(15 downto 0);

    -- redist8_i_acl_2069_memread_q_5_notEnable(LOGICAL,1043)
    redist8_i_acl_2069_memread_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist8_i_acl_2069_memread_q_5_nor(LOGICAL,1044)
    redist8_i_acl_2069_memread_q_5_nor_q <= not (redist8_i_acl_2069_memread_q_5_notEnable_q or redist8_i_acl_2069_memread_q_5_sticky_ena_q);

    -- redist8_i_acl_2069_memread_q_5_mem_last(CONSTANT,1040)
    redist8_i_acl_2069_memread_q_5_mem_last_q <= "01";

    -- redist8_i_acl_2069_memread_q_5_cmp(LOGICAL,1041)
    redist8_i_acl_2069_memread_q_5_cmp_q <= "1" WHEN redist8_i_acl_2069_memread_q_5_mem_last_q = redist8_i_acl_2069_memread_q_5_rdcnt_q ELSE "0";

    -- redist8_i_acl_2069_memread_q_5_cmpReg(REG,1042)
    redist8_i_acl_2069_memread_q_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_acl_2069_memread_q_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_i_acl_2069_memread_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist8_i_acl_2069_memread_q_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist8_i_acl_2069_memread_q_5_sticky_ena(REG,1045)
    redist8_i_acl_2069_memread_q_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_acl_2069_memread_q_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist8_i_acl_2069_memread_q_5_nor_q = "1") THEN
                redist8_i_acl_2069_memread_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist8_i_acl_2069_memread_q_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_i_acl_2069_memread_q_5_enaAnd(LOGICAL,1046)
    redist8_i_acl_2069_memread_q_5_enaAnd_q <= redist8_i_acl_2069_memread_q_5_sticky_ena_q and VCC_q;

    -- redist8_i_acl_2069_memread_q_5_rdcnt(COUNTER,1038)
    -- low=0, high=2, step=1, init=0
    redist8_i_acl_2069_memread_q_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_acl_2069_memread_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist8_i_acl_2069_memread_q_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist8_i_acl_2069_memread_q_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist8_i_acl_2069_memread_q_5_rdcnt_eq <= '1';
            ELSE
                redist8_i_acl_2069_memread_q_5_rdcnt_eq <= '0';
            END IF;
            IF (redist8_i_acl_2069_memread_q_5_rdcnt_eq = '1') THEN
                redist8_i_acl_2069_memread_q_5_rdcnt_i <= redist8_i_acl_2069_memread_q_5_rdcnt_i + 2;
            ELSE
                redist8_i_acl_2069_memread_q_5_rdcnt_i <= redist8_i_acl_2069_memread_q_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist8_i_acl_2069_memread_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist8_i_acl_2069_memread_q_5_rdcnt_i, 2)));

    -- redist8_i_acl_2069_memread_q_5_wraddr(REG,1039)
    redist8_i_acl_2069_memread_q_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_acl_2069_memread_q_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_i_acl_2069_memread_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist8_i_acl_2069_memread_q_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist8_i_acl_2069_memread_q_5_mem(DUALMEM,1037)
    redist8_i_acl_2069_memread_q_5_mem_ia <= STD_LOGIC_VECTOR(i_acl_2069_memread_q);
    redist8_i_acl_2069_memread_q_5_mem_aa <= redist8_i_acl_2069_memread_q_5_wraddr_q;
    redist8_i_acl_2069_memread_q_5_mem_ab <= redist8_i_acl_2069_memread_q_5_rdcnt_q;
    redist8_i_acl_2069_memread_q_5_mem_reset0 <= not (resetn);
    redist8_i_acl_2069_memread_q_5_mem_dmem : altera_syncram
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
        clocken1 => redist8_i_acl_2069_memread_q_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist8_i_acl_2069_memread_q_5_mem_reset0,
        clock1 => clock,
        address_a => redist8_i_acl_2069_memread_q_5_mem_aa,
        data_a => redist8_i_acl_2069_memread_q_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist8_i_acl_2069_memread_q_5_mem_ab,
        q_b => redist8_i_acl_2069_memread_q_5_mem_iq
    );
    redist8_i_acl_2069_memread_q_5_mem_q <= redist8_i_acl_2069_memread_q_5_mem_iq(15 downto 0);

    -- redist9_i_acl_2064_memread_q_5_notEnable(LOGICAL,1053)
    redist9_i_acl_2064_memread_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist9_i_acl_2064_memread_q_5_nor(LOGICAL,1054)
    redist9_i_acl_2064_memread_q_5_nor_q <= not (redist9_i_acl_2064_memread_q_5_notEnable_q or redist9_i_acl_2064_memread_q_5_sticky_ena_q);

    -- redist9_i_acl_2064_memread_q_5_mem_last(CONSTANT,1050)
    redist9_i_acl_2064_memread_q_5_mem_last_q <= "01";

    -- redist9_i_acl_2064_memread_q_5_cmp(LOGICAL,1051)
    redist9_i_acl_2064_memread_q_5_cmp_q <= "1" WHEN redist9_i_acl_2064_memread_q_5_mem_last_q = redist9_i_acl_2064_memread_q_5_rdcnt_q ELSE "0";

    -- redist9_i_acl_2064_memread_q_5_cmpReg(REG,1052)
    redist9_i_acl_2064_memread_q_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_acl_2064_memread_q_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist9_i_acl_2064_memread_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist9_i_acl_2064_memread_q_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist9_i_acl_2064_memread_q_5_sticky_ena(REG,1055)
    redist9_i_acl_2064_memread_q_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_acl_2064_memread_q_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist9_i_acl_2064_memread_q_5_nor_q = "1") THEN
                redist9_i_acl_2064_memread_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist9_i_acl_2064_memread_q_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_i_acl_2064_memread_q_5_enaAnd(LOGICAL,1056)
    redist9_i_acl_2064_memread_q_5_enaAnd_q <= redist9_i_acl_2064_memread_q_5_sticky_ena_q and VCC_q;

    -- redist9_i_acl_2064_memread_q_5_rdcnt(COUNTER,1048)
    -- low=0, high=2, step=1, init=0
    redist9_i_acl_2064_memread_q_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_acl_2064_memread_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist9_i_acl_2064_memread_q_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist9_i_acl_2064_memread_q_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist9_i_acl_2064_memread_q_5_rdcnt_eq <= '1';
            ELSE
                redist9_i_acl_2064_memread_q_5_rdcnt_eq <= '0';
            END IF;
            IF (redist9_i_acl_2064_memread_q_5_rdcnt_eq = '1') THEN
                redist9_i_acl_2064_memread_q_5_rdcnt_i <= redist9_i_acl_2064_memread_q_5_rdcnt_i + 2;
            ELSE
                redist9_i_acl_2064_memread_q_5_rdcnt_i <= redist9_i_acl_2064_memread_q_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist9_i_acl_2064_memread_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist9_i_acl_2064_memread_q_5_rdcnt_i, 2)));

    -- redist9_i_acl_2064_memread_q_5_wraddr(REG,1049)
    redist9_i_acl_2064_memread_q_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_acl_2064_memread_q_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist9_i_acl_2064_memread_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist9_i_acl_2064_memread_q_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist9_i_acl_2064_memread_q_5_mem(DUALMEM,1047)
    redist9_i_acl_2064_memread_q_5_mem_ia <= STD_LOGIC_VECTOR(i_acl_2064_memread_q);
    redist9_i_acl_2064_memread_q_5_mem_aa <= redist9_i_acl_2064_memread_q_5_wraddr_q;
    redist9_i_acl_2064_memread_q_5_mem_ab <= redist9_i_acl_2064_memread_q_5_rdcnt_q;
    redist9_i_acl_2064_memread_q_5_mem_reset0 <= not (resetn);
    redist9_i_acl_2064_memread_q_5_mem_dmem : altera_syncram
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
        clocken1 => redist9_i_acl_2064_memread_q_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist9_i_acl_2064_memread_q_5_mem_reset0,
        clock1 => clock,
        address_a => redist9_i_acl_2064_memread_q_5_mem_aa,
        data_a => redist9_i_acl_2064_memread_q_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist9_i_acl_2064_memread_q_5_mem_ab,
        q_b => redist9_i_acl_2064_memread_q_5_mem_iq
    );
    redist9_i_acl_2064_memread_q_5_mem_q <= redist9_i_acl_2064_memread_q_5_mem_iq(15 downto 0);

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_notEnable(LOGICAL,1077)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_nor(LOGICAL,1078)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_nor_q <= not (redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_notEnable_q or redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena_q);

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_last(CONSTANT,1074)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_last_q <= "010";

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmp(LOGICAL,1075)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_q);
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmp_q <= "1" WHEN redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_last_q = redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmp_b ELSE "0";

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmpReg(REG,1076)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmpReg_q <= STD_LOGIC_VECTOR(redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena(REG,1079)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_nor_q = "1") THEN
                redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_enaAnd(LOGICAL,1080)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_enaAnd_q <= redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_sticky_ena_q and VCC_q;

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt(COUNTER,1072)
    -- low=0, high=3, step=1, init=0
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_i <= redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_i, 2)));

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_inputreg(DELAY,1069)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist47_bgTrunc_i_add816_5_memread_sel_x_b_2_q, xout => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_inputreg_q, clk => clock, aclr => resetn );

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_wraddr(REG,1073)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_wraddr_q <= STD_LOGIC_VECTOR(redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem(DUALMEM,1071)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_ia <= STD_LOGIC_VECTOR(redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_inputreg_q);
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_aa <= redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_wraddr_q;
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_ab <= redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_rdcnt_q;
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_reset0 <= not (resetn);
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
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
        clocken1 => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_reset0,
        clock1 => clock,
        address_a => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_aa,
        data_a => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_ab,
        q_b => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_iq
    );
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_q <= redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_iq(31 downto 0);

    -- redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_outputreg(DELAY,1070)
    redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_mem_q, xout => redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_outputreg_q, clk => clock, aclr => resetn );

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_notEnable(LOGICAL,1089)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_nor(LOGICAL,1090)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_nor_q <= not (redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_notEnable_q or redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena_q);

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_last(CONSTANT,1086)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_last_q <= "010";

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmp(LOGICAL,1087)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_q);
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmp_q <= "1" WHEN redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_last_q = redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmp_b ELSE "0";

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmpReg(REG,1088)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmpReg_q <= STD_LOGIC_VECTOR(redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena(REG,1091)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_nor_q = "1") THEN
                redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_enaAnd(LOGICAL,1092)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_enaAnd_q <= redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_sticky_ena_q and VCC_q;

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt(COUNTER,1084)
    -- low=0, high=3, step=1, init=0
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_i <= redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_i, 2)));

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_inputreg(DELAY,1081)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist49_bgTrunc_i_add816_4_memread_sel_x_b_2_q, xout => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_inputreg_q, clk => clock, aclr => resetn );

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_wraddr(REG,1085)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_wraddr_q <= STD_LOGIC_VECTOR(redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem(DUALMEM,1083)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_ia <= STD_LOGIC_VECTOR(redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_inputreg_q);
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_aa <= redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_wraddr_q;
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_ab <= redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_rdcnt_q;
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_reset0 <= not (resetn);
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
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
        clocken1 => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_reset0,
        clock1 => clock,
        address_a => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_aa,
        data_a => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_ab,
        q_b => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_iq
    );
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_q <= redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_iq(31 downto 0);

    -- redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_outputreg(DELAY,1082)
    redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_mem_q, xout => redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_outputreg_q, clk => clock, aclr => resetn );

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_notEnable(LOGICAL,1101)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_nor(LOGICAL,1102)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_nor_q <= not (redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_notEnable_q or redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena_q);

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_last(CONSTANT,1098)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_last_q <= "010";

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmp(LOGICAL,1099)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_q);
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmp_q <= "1" WHEN redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_last_q = redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmp_b ELSE "0";

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmpReg(REG,1100)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmpReg_q <= STD_LOGIC_VECTOR(redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena(REG,1103)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_nor_q = "1") THEN
                redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_enaAnd(LOGICAL,1104)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_enaAnd_q <= redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_sticky_ena_q and VCC_q;

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt(COUNTER,1096)
    -- low=0, high=3, step=1, init=0
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_i <= redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_i, 2)));

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_inputreg(DELAY,1093)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist51_bgTrunc_i_add816_3_memread_sel_x_b_1_q, xout => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_inputreg_q, clk => clock, aclr => resetn );

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_wraddr(REG,1097)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_wraddr_q <= STD_LOGIC_VECTOR(redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem(DUALMEM,1095)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_ia <= STD_LOGIC_VECTOR(redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_inputreg_q);
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_aa <= redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_wraddr_q;
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_ab <= redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_rdcnt_q;
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_reset0 <= not (resetn);
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
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
        clocken1 => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_reset0,
        clock1 => clock,
        address_a => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_aa,
        data_a => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_ab,
        q_b => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_iq
    );
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_q <= redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_iq(31 downto 0);

    -- redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_outputreg(DELAY,1094)
    redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_mem_q, xout => redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_outputreg_q, clk => clock, aclr => resetn );

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_notEnable(LOGICAL,1113)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_nor(LOGICAL,1114)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_nor_q <= not (redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_notEnable_q or redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena_q);

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_last(CONSTANT,1110)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_last_q <= "010";

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmp(LOGICAL,1111)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_q);
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmp_q <= "1" WHEN redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_last_q = redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmp_b ELSE "0";

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmpReg(REG,1112)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmpReg_q <= STD_LOGIC_VECTOR(redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena(REG,1115)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_nor_q = "1") THEN
                redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_enaAnd(LOGICAL,1116)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_enaAnd_q <= redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_sticky_ena_q and VCC_q;

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt(COUNTER,1108)
    -- low=0, high=3, step=1, init=0
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_i <= redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_i, 2)));

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_inputreg(DELAY,1105)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist53_bgTrunc_i_add816_2_memread_sel_x_b_2_q, xout => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_inputreg_q, clk => clock, aclr => resetn );

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_wraddr(REG,1109)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_wraddr_q <= STD_LOGIC_VECTOR(redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem(DUALMEM,1107)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_ia <= STD_LOGIC_VECTOR(redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_inputreg_q);
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_aa <= redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_wraddr_q;
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_ab <= redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_rdcnt_q;
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_reset0 <= not (resetn);
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
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
        clocken1 => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_reset0,
        clock1 => clock,
        address_a => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_aa,
        data_a => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_ab,
        q_b => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_iq
    );
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_q <= redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_iq(31 downto 0);

    -- redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_outputreg(DELAY,1106)
    redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_mem_q, xout => redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_outputreg_q, clk => clock, aclr => resetn );

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_notEnable(LOGICAL,1125)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_nor(LOGICAL,1126)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_nor_q <= not (redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_notEnable_q or redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena_q);

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_last(CONSTANT,1122)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_last_q <= "010";

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmp(LOGICAL,1123)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_q);
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmp_q <= "1" WHEN redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_last_q = redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmp_b ELSE "0";

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmpReg(REG,1124)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmpReg_q <= STD_LOGIC_VECTOR(redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena(REG,1127)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_nor_q = "1") THEN
                redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_enaAnd(LOGICAL,1128)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_enaAnd_q <= redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_sticky_ena_q and VCC_q;

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt(COUNTER,1120)
    -- low=0, high=3, step=1, init=0
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_i <= redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_i, 2)));

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_inputreg(DELAY,1117)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist55_bgTrunc_i_add816_1_memread_sel_x_b_1_q, xout => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_inputreg_q, clk => clock, aclr => resetn );

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_wraddr(REG,1121)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_wraddr_q <= STD_LOGIC_VECTOR(redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem(DUALMEM,1119)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_ia <= STD_LOGIC_VECTOR(redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_inputreg_q);
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_aa <= redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_wraddr_q;
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_ab <= redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_rdcnt_q;
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_reset0 <= not (resetn);
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
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
        clocken1 => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_reset0,
        clock1 => clock,
        address_a => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_aa,
        data_a => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_ab,
        q_b => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_iq
    );
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_q <= redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_iq(31 downto 0);

    -- redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_outputreg(DELAY,1118)
    redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_mem_q, xout => redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_outputreg_q, clk => clock, aclr => resetn );

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_notEnable(LOGICAL,1065)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_nor(LOGICAL,1066)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_nor_q <= not (redist46_bgTrunc_i_add816_memread_sel_x_b_8_notEnable_q or redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena_q);

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_last(CONSTANT,1062)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_last_q <= "010";

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmp(LOGICAL,1063)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_q);
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmp_q <= "1" WHEN redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_last_q = redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmp_b ELSE "0";

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmpReg(REG,1064)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmpReg_q <= STD_LOGIC_VECTOR(redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena(REG,1067)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist46_bgTrunc_i_add816_memread_sel_x_b_8_nor_q = "1") THEN
                redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist46_bgTrunc_i_add816_memread_sel_x_b_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_enaAnd(LOGICAL,1068)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_enaAnd_q <= redist46_bgTrunc_i_add816_memread_sel_x_b_8_sticky_ena_q and VCC_q;

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt(COUNTER,1060)
    -- low=0, high=3, step=1, init=0
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_i <= redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_i, 2)));

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_inputreg(DELAY,1057)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist45_bgTrunc_i_add816_memread_sel_x_b_1_q, xout => redist46_bgTrunc_i_add816_memread_sel_x_b_8_inputreg_q, clk => clock, aclr => resetn );

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_wraddr(REG,1061)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist46_bgTrunc_i_add816_memread_sel_x_b_8_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist46_bgTrunc_i_add816_memread_sel_x_b_8_wraddr_q <= STD_LOGIC_VECTOR(redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem(DUALMEM,1059)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_ia <= STD_LOGIC_VECTOR(redist46_bgTrunc_i_add816_memread_sel_x_b_8_inputreg_q);
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_aa <= redist46_bgTrunc_i_add816_memread_sel_x_b_8_wraddr_q;
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_ab <= redist46_bgTrunc_i_add816_memread_sel_x_b_8_rdcnt_q;
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_reset0 <= not (resetn);
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
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
        clocken1 => redist46_bgTrunc_i_add816_memread_sel_x_b_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_reset0,
        clock1 => clock,
        address_a => redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_aa,
        data_a => redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_ab,
        q_b => redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_iq
    );
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_q <= redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_iq(31 downto 0);

    -- redist46_bgTrunc_i_add816_memread_sel_x_b_8_outputreg(DELAY,1058)
    redist46_bgTrunc_i_add816_memread_sel_x_b_8_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist46_bgTrunc_i_add816_memread_sel_x_b_8_mem_q, xout => redist46_bgTrunc_i_add816_memread_sel_x_b_8_outputreg_q, clk => clock, aclr => resetn );

    -- sync_out_aunroll_x(GPOUT,170)@10
    out_c0_exi81080_0 <= GND_q;
    out_c0_exi81080_1 <= redist46_bgTrunc_i_add816_memread_sel_x_b_8_outputreg_q;
    out_c0_exi81080_2 <= redist56_bgTrunc_i_add816_1_memread_sel_x_b_8_outputreg_q;
    out_c0_exi81080_3 <= redist54_bgTrunc_i_add816_2_memread_sel_x_b_9_outputreg_q;
    out_c0_exi81080_4 <= redist52_bgTrunc_i_add816_3_memread_sel_x_b_8_outputreg_q;
    out_c0_exi81080_5 <= redist50_bgTrunc_i_add816_4_memread_sel_x_b_9_outputreg_q;
    out_c0_exi81080_6 <= redist48_bgTrunc_i_add816_5_memread_sel_x_b_9_outputreg_q;
    out_c0_exi81080_7 <= redist9_i_acl_2064_memread_q_5_mem_q;
    out_c0_exi81080_8 <= redist8_i_acl_2069_memread_q_5_mem_q;
    out_c0_exi81080_9 <= redist7_i_acl_2074_memread_q_5_mem_q;
    out_c0_exi81080_10 <= redist6_i_acl_2079_memread_q_5_mem_q;
    out_c0_exi81080_11 <= redist5_i_acl_2084_memread_q_5_mem_q;
    out_c0_exi81080_12 <= redist4_i_acl_2089_memread_q_5_mem_q;
    out_c0_exi81080_13 <= i_acl_483_memread_q;
    out_c0_exi81080_14 <= i_max_value_0_i6_memread_q;
    out_c0_exi81080_15 <= c_i16_0gr_q;
    out_c0_exi81080_16 <= c_i16_0gr_q;
    out_c0_exi81080_17 <= c_i16_0gr_q;
    out_c0_exi81080_18 <= c_i16_0gr_q;
    out_o_valid <= redist28_sync_in_aunroll_x_in_i_valid_10_q;

    -- ext_sig_sync_out(GPOUT,225)
    out_memcoalesce_null_load_0152_avm_address <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_address;
    out_memcoalesce_null_load_0152_avm_enable <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_enable;
    out_memcoalesce_null_load_0152_avm_read <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_read;
    out_memcoalesce_null_load_0152_avm_write <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_write;
    out_memcoalesce_null_load_0152_avm_writedata <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_writedata;
    out_memcoalesce_null_load_0152_avm_byteenable <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_byteenable;
    out_memcoalesce_null_load_0152_avm_burstcount <= i_load_memcoalesce_null_load_0152_memread_aunroll_x_out_memcoalesce_null_load_0152_avm_burstcount;

END normal;
