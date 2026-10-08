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

-- VHDL created from i_load_memcoalesce_bottom_load_0_memread163
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

entity i_load_memcoalesce_bottom_load_0_memread163 is
    port (
        out_o_readdata_0_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_1_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_2_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_3_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_4_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_5_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_6_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_7_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_8_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_9_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_10_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_11_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_12_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_13_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_14_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_15_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_0_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_1_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_2_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_3_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_4_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_5_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_6_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_7_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_8_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_9_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_10_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_11_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_12_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_13_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_14_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_15_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_0_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_1_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_2_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_3_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_4_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_5_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_6_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_7_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_8_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_9_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_10_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_11_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_12_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_13_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_14_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_15_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_0_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_1_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_2_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_3_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_4_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_5_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_6_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_7_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_8_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_9_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_10_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_11_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_12_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_13_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_14_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_15_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_bottom_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        out_memcoalesce_bottom_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_i_address : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_predicate : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_bottom_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_bottom_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        in_memcoalesce_bottom_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_bottom_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_bottom_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_bottom_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_bottom_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_bottom_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_bottom_load_0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_load_memcoalesce_bottom_load_0_memread163;

architecture normal of i_load_memcoalesce_bottom_load_0_memread163 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component readdata_reg_memcoalesce_bottom_load_0_memRead0 is
        port (
            in_data_in_0_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_0_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_0_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_0_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_1_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_1_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_1_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_1_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_2_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_2_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_2_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_2_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_3_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_3_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_3_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_3_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_4_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_4_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_4_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_4_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_5_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_5_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_5_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_5_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_6_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_6_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_6_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_6_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_7_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_7_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_7_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_7_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_8_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_8_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_8_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_8_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_9_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_9_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_9_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_9_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_10_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_10_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_10_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_10_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_11_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_11_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_11_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_11_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_12_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_12_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_12_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_12_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_13_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_13_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_13_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_13_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_14_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_14_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_14_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_14_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_15_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_15_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_15_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_15_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_0_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_0_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_0_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_1_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_1_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_1_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_1_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_2_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_2_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_2_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_2_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_3_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_3_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_3_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_3_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_4_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_4_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_4_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_4_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_5_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_5_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_5_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_5_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_6_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_6_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_6_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_6_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_7_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_7_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_7_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_7_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_8_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_8_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_8_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_8_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_9_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_9_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_9_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_9_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_10_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_10_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_10_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_10_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_11_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_11_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_11_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_11_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_12_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_12_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_12_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_12_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_13_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_13_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_13_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_13_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_14_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_14_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_14_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_14_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_15_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_15_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_15_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_15_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component lsu_top is
        generic (
            ABITS_PER_LMEM_BANK : INTEGER;
            ADDRSPACE : INTEGER := 1;
            ALIGNMENT_BYTES : INTEGER := 128;
            ATOMIC : INTEGER := 0;
            ATOMIC_WIDTH : INTEGER := 3;
            AWIDTH : INTEGER := 33;
            BURSTCOUNT_WIDTH : INTEGER := 5;
            ENABLE_BANKED_MEMORY : INTEGER := 0;
            FORCE_NOP_SUPPORT : INTEGER := 0;
            HIGH_FMAX : INTEGER := 1;
            INPUTFIFO_USEDW_MAXBITS : INTEGER := 5;
            KERNEL_SIDE_MEM_LATENCY : INTEGER := 207;
            LMEM_ADDR_PERMUTATION_STYLE : INTEGER := 0;
            MEMORY_SIDE_MEM_LATENCY : INTEGER := 246;
            MWIDTH : INTEGER := 512;
            MWIDTH_BYTES : INTEGER := 64;
            NUMBER_BANKS : INTEGER := 1;
            PROFILE_ADDR_TOGGLE : INTEGER := 0;
            READ : INTEGER := 1;
            STALLFREE : INTEGER := 0;
            STYLE : STRING := "BURST-COALESCED";
            SYNCHRONIZE_RESET : INTEGER := 1;
            USECACHING : INTEGER := 0;
            USEINPUTFIFO : INTEGER := 0;
            USEOUTPUTFIFO : INTEGER := 1;
            USE_BYTE_EN : INTEGER := 0;
            USE_WRITE_ACK : INTEGER := 0;
            WIDTH : INTEGER := 1024;
            WIDTH_BYTES : INTEGER := 128;
            WRITEDATAWIDTH_BYTES : INTEGER := 64
        );
        port (
            avm_readdata : in std_logic_vector(511 downto 0);
            avm_readdatavalid : in std_logic;
            avm_waitrequest : in std_logic;
            avm_writeack : in std_logic;
            clock2x : in std_logic;
            flush : in std_logic;
            i_address : in std_logic_vector(32 downto 0);
            i_atomic_op : in std_logic_vector(2 downto 0);
            i_bitwiseor : in std_logic_vector(32 downto 0);
            i_byteenable : in std_logic_vector(127 downto 0);
            i_cmpdata : in std_logic_vector(1023 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_valid : in std_logic;
            i_writedata : in std_logic_vector(1023 downto 0);
            stream_base_addr : in std_logic_vector(32 downto 0);
            stream_reset : in std_logic;
            stream_size : in std_logic_vector(31 downto 0);
            avm_address : out std_logic_vector(32 downto 0);
            avm_burstcount : out std_logic_vector(4 downto 0);
            avm_byteenable : out std_logic_vector(63 downto 0);
            avm_enable : out std_logic;
            avm_read : out std_logic;
            avm_write : out std_logic;
            avm_writedata : out std_logic_vector(511 downto 0);
            o_input_fifo_depth : out std_logic_vector(4 downto 0);
            o_readdata : out std_logic_vector(1023 downto 0);
            o_stall : out std_logic;
            o_valid : out std_logic;
            o_writeack : out std_logic;
            profile_avm_burstcount_total_incr : out std_logic_vector(31 downto 0);
            profile_bw_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i1024_0gr_x_q : STD_LOGIC_VECTOR (1023 downto 0);
    signal dupName_0_c_i33_0gr_x_q : STD_LOGIC_VECTOR (32 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_15_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_16_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (255 downto 0);
    signal dupName_17_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_18_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_19_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_20_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_21_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_22_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_23_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_24_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_25_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_26_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (255 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_36_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_37_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_38_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_39_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_40_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_41_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_42_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_43_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_44_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_45_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_46_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_47_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_48_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_49_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_50_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (255 downto 0);
    signal dupName_51_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_52_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_53_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_54_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_55_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_56_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_57_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_58_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_59_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_60_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_61_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_62_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_63_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_64_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_65_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_66_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal addr_trunc_in : STD_LOGIC_VECTOR (32 downto 0);
    signal addr_trunc_q : STD_LOGIC_VECTOR (32 downto 0);
    signal c_i128_0gr_q : STD_LOGIC_VECTOR (127 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_0gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_readdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_readdatavalid_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_waitrequest : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_waitrequest_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_writeack_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_clock2x_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_flush : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_flush_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_i_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_atomic_op : STD_LOGIC_VECTOR (2 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_bitwiseor : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_byteenable : STD_LOGIC_VECTOR (127 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_cmpdata : STD_LOGIC_VECTOR (1023 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_predicate_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_stall_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_i_valid_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_i_writedata : STD_LOGIC_VECTOR (1023 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_stream_base_addr : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_stream_reset : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_stream_reset_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_stream_size : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_enable_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_read_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_write_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_o_input_fifo_depth : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_o_readdata : STD_LOGIC_VECTOR (1023 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_o_stall_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_o_valid_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_o_writeack_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_bottom_load_0_memread164_profile_avm_burstcount_total_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_bottom_load_0_memread164_profile_bw_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (255 downto 0);

begin


    -- c_i32_0gr(CONSTANT,88)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- dupName_0_c_i1024_0gr_x(CONSTANT,4)
    dupName_0_c_i1024_0gr_x_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- c_i128_0gr(CONSTANT,86)
    c_i128_0gr_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- dupName_0_c_i33_0gr_x(CONSTANT,5)
    dupName_0_c_i33_0gr_x_q <= "000000000000000000000000000000000";

    -- c_i3_0gr(CONSTANT,90)
    c_i3_0gr_q <= "000";

    -- addr_trunc(ROUND,84)
    addr_trunc_in <= in_i_address(32 downto 0);
    addr_trunc_q <= addr_trunc_in(32 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_load_memcoalesce_bottom_load_0_memread164(EXTIFACE,91)
    i_load_memcoalesce_bottom_load_0_memread164_avm_readdata <= in_memcoalesce_bottom_load_0_avm_readdata;
    i_load_memcoalesce_bottom_load_0_memread164_avm_readdatavalid <= in_memcoalesce_bottom_load_0_avm_readdatavalid;
    i_load_memcoalesce_bottom_load_0_memread164_avm_waitrequest <= in_memcoalesce_bottom_load_0_avm_waitrequest;
    i_load_memcoalesce_bottom_load_0_memread164_avm_writeack <= in_memcoalesce_bottom_load_0_avm_writeack;
    i_load_memcoalesce_bottom_load_0_memread164_clock2x <= GND_q;
    i_load_memcoalesce_bottom_load_0_memread164_flush <= in_flush;
    i_load_memcoalesce_bottom_load_0_memread164_i_address <= addr_trunc_q;
    i_load_memcoalesce_bottom_load_0_memread164_i_atomic_op <= c_i3_0gr_q;
    i_load_memcoalesce_bottom_load_0_memread164_i_bitwiseor <= dupName_0_c_i33_0gr_x_q;
    i_load_memcoalesce_bottom_load_0_memread164_i_byteenable <= c_i128_0gr_q;
    i_load_memcoalesce_bottom_load_0_memread164_i_cmpdata <= dupName_0_c_i1024_0gr_x_q;
    i_load_memcoalesce_bottom_load_0_memread164_i_predicate <= in_i_predicate;
    i_load_memcoalesce_bottom_load_0_memread164_i_stall <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_stall_out;
    i_load_memcoalesce_bottom_load_0_memread164_i_valid <= in_i_valid;
    i_load_memcoalesce_bottom_load_0_memread164_i_writedata <= dupName_0_c_i1024_0gr_x_q;
    i_load_memcoalesce_bottom_load_0_memread164_stream_base_addr <= dupName_0_c_i33_0gr_x_q;
    i_load_memcoalesce_bottom_load_0_memread164_stream_reset <= GND_q;
    i_load_memcoalesce_bottom_load_0_memread164_stream_size <= c_i32_0gr_q;
    i_load_memcoalesce_bottom_load_0_memread164_avm_readdatavalid_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_avm_readdatavalid(0);
    i_load_memcoalesce_bottom_load_0_memread164_avm_waitrequest_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_avm_waitrequest(0);
    i_load_memcoalesce_bottom_load_0_memread164_avm_writeack_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_avm_writeack(0);
    i_load_memcoalesce_bottom_load_0_memread164_clock2x_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_clock2x(0);
    i_load_memcoalesce_bottom_load_0_memread164_flush_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_flush(0);
    i_load_memcoalesce_bottom_load_0_memread164_i_predicate_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_i_predicate(0);
    i_load_memcoalesce_bottom_load_0_memread164_i_stall_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_i_stall(0);
    i_load_memcoalesce_bottom_load_0_memread164_i_valid_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_i_valid(0);
    i_load_memcoalesce_bottom_load_0_memread164_stream_reset_bitsignaltemp <= i_load_memcoalesce_bottom_load_0_memread164_stream_reset(0);
    i_load_memcoalesce_bottom_load_0_memread164_avm_enable(0) <= i_load_memcoalesce_bottom_load_0_memread164_avm_enable_bitsignaltemp;
    i_load_memcoalesce_bottom_load_0_memread164_avm_read(0) <= i_load_memcoalesce_bottom_load_0_memread164_avm_read_bitsignaltemp;
    i_load_memcoalesce_bottom_load_0_memread164_avm_write(0) <= i_load_memcoalesce_bottom_load_0_memread164_avm_write_bitsignaltemp;
    i_load_memcoalesce_bottom_load_0_memread164_o_stall(0) <= i_load_memcoalesce_bottom_load_0_memread164_o_stall_bitsignaltemp;
    i_load_memcoalesce_bottom_load_0_memread164_o_valid(0) <= i_load_memcoalesce_bottom_load_0_memread164_o_valid_bitsignaltemp;
    i_load_memcoalesce_bottom_load_0_memread164_o_writeack(0) <= i_load_memcoalesce_bottom_load_0_memread164_o_writeack_bitsignaltemp;
    thei_load_memcoalesce_bottom_load_0_memread164 : lsu_top
    GENERIC MAP (
        ABITS_PER_LMEM_BANK => 0,
        ADDRSPACE => 1,
        ALIGNMENT_BYTES => 128,
        ATOMIC => 0,
        ATOMIC_WIDTH => 3,
        AWIDTH => 33,
        BURSTCOUNT_WIDTH => 5,
        ENABLE_BANKED_MEMORY => 0,
        FORCE_NOP_SUPPORT => 0,
        HIGH_FMAX => 1,
        INPUTFIFO_USEDW_MAXBITS => 5,
        KERNEL_SIDE_MEM_LATENCY => 207,
        LMEM_ADDR_PERMUTATION_STYLE => 0,
        MEMORY_SIDE_MEM_LATENCY => 246,
        MWIDTH => 512,
        MWIDTH_BYTES => 64,
        NUMBER_BANKS => 1,
        PROFILE_ADDR_TOGGLE => 0,
        READ => 1,
        STALLFREE => 0,
        STYLE => "BURST-COALESCED",
        SYNCHRONIZE_RESET => 1,
        USECACHING => 0,
        USEINPUTFIFO => 0,
        USEOUTPUTFIFO => 1,
        USE_BYTE_EN => 0,
        USE_WRITE_ACK => 0,
        WIDTH => 1024,
        WIDTH_BYTES => 128,
        WRITEDATAWIDTH_BYTES => 64
    )
    PORT MAP (
        avm_readdata => in_memcoalesce_bottom_load_0_avm_readdata,
        avm_readdatavalid => i_load_memcoalesce_bottom_load_0_memread164_avm_readdatavalid_bitsignaltemp,
        avm_waitrequest => i_load_memcoalesce_bottom_load_0_memread164_avm_waitrequest_bitsignaltemp,
        avm_writeack => i_load_memcoalesce_bottom_load_0_memread164_avm_writeack_bitsignaltemp,
        clock2x => i_load_memcoalesce_bottom_load_0_memread164_clock2x_bitsignaltemp,
        flush => i_load_memcoalesce_bottom_load_0_memread164_flush_bitsignaltemp,
        i_address => addr_trunc_q,
        i_atomic_op => c_i3_0gr_q,
        i_bitwiseor => dupName_0_c_i33_0gr_x_q,
        i_byteenable => c_i128_0gr_q,
        i_cmpdata => dupName_0_c_i1024_0gr_x_q,
        i_predicate => i_load_memcoalesce_bottom_load_0_memread164_i_predicate_bitsignaltemp,
        i_stall => i_load_memcoalesce_bottom_load_0_memread164_i_stall_bitsignaltemp,
        i_valid => i_load_memcoalesce_bottom_load_0_memread164_i_valid_bitsignaltemp,
        i_writedata => dupName_0_c_i1024_0gr_x_q,
        stream_base_addr => dupName_0_c_i33_0gr_x_q,
        stream_reset => i_load_memcoalesce_bottom_load_0_memread164_stream_reset_bitsignaltemp,
        stream_size => c_i32_0gr_q,
        avm_address => i_load_memcoalesce_bottom_load_0_memread164_avm_address,
        avm_burstcount => i_load_memcoalesce_bottom_load_0_memread164_avm_burstcount,
        avm_byteenable => i_load_memcoalesce_bottom_load_0_memread164_avm_byteenable,
        avm_enable => i_load_memcoalesce_bottom_load_0_memread164_avm_enable_bitsignaltemp,
        avm_read => i_load_memcoalesce_bottom_load_0_memread164_avm_read_bitsignaltemp,
        avm_write => i_load_memcoalesce_bottom_load_0_memread164_avm_write_bitsignaltemp,
        avm_writedata => i_load_memcoalesce_bottom_load_0_memread164_avm_writedata,
        o_readdata => i_load_memcoalesce_bottom_load_0_memread164_o_readdata,
        o_stall => i_load_memcoalesce_bottom_load_0_memread164_o_stall_bitsignaltemp,
        o_valid => i_load_memcoalesce_bottom_load_0_memread164_o_valid_bitsignaltemp,
        o_writeack => i_load_memcoalesce_bottom_load_0_memread164_o_writeack_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_50_ip_dsdk_adapt_bitselect_x(BITSELECT,67)
    dupName_50_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_bottom_load_0_memread164_o_readdata(1023 downto 768);

    -- dupName_66_ip_dsdk_adapt_bitselect_x(BITSELECT,83)
    dupName_66_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(255 downto 240);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,50)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_bottom_load_0_memread164_o_readdata(767 downto 512);

    -- dupName_49_ip_dsdk_adapt_bitselect_x(BITSELECT,66)
    dupName_49_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(255 downto 240);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,33)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_bottom_load_0_memread164_o_readdata(511 downto 256);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,49)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(255 downto 240);

    -- ip_dsdk_adapt_bitselect(BITSELECT,92)
    ip_dsdk_adapt_bitselect_b <= i_load_memcoalesce_bottom_load_0_memread164_o_readdata(255 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,32)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(255 downto 240);

    -- dupName_65_ip_dsdk_adapt_bitselect_x(BITSELECT,82)
    dupName_65_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(239 downto 224);

    -- dupName_48_ip_dsdk_adapt_bitselect_x(BITSELECT,65)
    dupName_48_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(239 downto 224);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,48)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(239 downto 224);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,31)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(239 downto 224);

    -- dupName_64_ip_dsdk_adapt_bitselect_x(BITSELECT,81)
    dupName_64_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(223 downto 208);

    -- dupName_47_ip_dsdk_adapt_bitselect_x(BITSELECT,64)
    dupName_47_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(223 downto 208);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,47)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(223 downto 208);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,30)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(223 downto 208);

    -- dupName_63_ip_dsdk_adapt_bitselect_x(BITSELECT,80)
    dupName_63_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(207 downto 192);

    -- dupName_46_ip_dsdk_adapt_bitselect_x(BITSELECT,63)
    dupName_46_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(207 downto 192);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,46)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(207 downto 192);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,29)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(207 downto 192);

    -- dupName_62_ip_dsdk_adapt_bitselect_x(BITSELECT,79)
    dupName_62_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(191 downto 176);

    -- dupName_45_ip_dsdk_adapt_bitselect_x(BITSELECT,62)
    dupName_45_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(191 downto 176);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,45)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(191 downto 176);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,28)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(191 downto 176);

    -- dupName_61_ip_dsdk_adapt_bitselect_x(BITSELECT,78)
    dupName_61_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(175 downto 160);

    -- dupName_44_ip_dsdk_adapt_bitselect_x(BITSELECT,61)
    dupName_44_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(175 downto 160);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,44)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(175 downto 160);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,27)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(175 downto 160);

    -- dupName_60_ip_dsdk_adapt_bitselect_x(BITSELECT,77)
    dupName_60_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(159 downto 144);

    -- dupName_43_ip_dsdk_adapt_bitselect_x(BITSELECT,60)
    dupName_43_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(159 downto 144);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,43)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(159 downto 144);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,26)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(159 downto 144);

    -- dupName_59_ip_dsdk_adapt_bitselect_x(BITSELECT,76)
    dupName_59_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(143 downto 128);

    -- dupName_42_ip_dsdk_adapt_bitselect_x(BITSELECT,59)
    dupName_42_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(143 downto 128);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,42)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(143 downto 128);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,25)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(143 downto 128);

    -- dupName_58_ip_dsdk_adapt_bitselect_x(BITSELECT,75)
    dupName_58_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(127 downto 112);

    -- dupName_41_ip_dsdk_adapt_bitselect_x(BITSELECT,58)
    dupName_41_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(127 downto 112);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,41)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(127 downto 112);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,24)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(127 downto 112);

    -- dupName_57_ip_dsdk_adapt_bitselect_x(BITSELECT,74)
    dupName_57_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(111 downto 96);

    -- dupName_40_ip_dsdk_adapt_bitselect_x(BITSELECT,57)
    dupName_40_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(111 downto 96);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,40)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(111 downto 96);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,23)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(111 downto 96);

    -- dupName_56_ip_dsdk_adapt_bitselect_x(BITSELECT,73)
    dupName_56_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(95 downto 80);

    -- dupName_39_ip_dsdk_adapt_bitselect_x(BITSELECT,56)
    dupName_39_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(95 downto 80);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,39)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(95 downto 80);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,21)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(95 downto 80);

    -- dupName_55_ip_dsdk_adapt_bitselect_x(BITSELECT,72)
    dupName_55_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(79 downto 64);

    -- dupName_38_ip_dsdk_adapt_bitselect_x(BITSELECT,55)
    dupName_38_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(79 downto 64);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,38)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(79 downto 64);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,19)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(79 downto 64);

    -- dupName_54_ip_dsdk_adapt_bitselect_x(BITSELECT,71)
    dupName_54_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(63 downto 48);

    -- dupName_37_ip_dsdk_adapt_bitselect_x(BITSELECT,54)
    dupName_37_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(63 downto 48);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,37)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(63 downto 48);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,16)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(63 downto 48);

    -- dupName_53_ip_dsdk_adapt_bitselect_x(BITSELECT,70)
    dupName_53_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(47 downto 32);

    -- dupName_36_ip_dsdk_adapt_bitselect_x(BITSELECT,53)
    dupName_36_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(47 downto 32);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,36)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(47 downto 32);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,13)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(47 downto 32);

    -- dupName_52_ip_dsdk_adapt_bitselect_x(BITSELECT,69)
    dupName_52_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(31 downto 16);

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,52)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(31 downto 16);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,35)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(31 downto 16);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,10)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(31 downto 16);

    -- dupName_51_ip_dsdk_adapt_bitselect_x(BITSELECT,68)
    dupName_51_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,51)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,34)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,6)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(15 downto 0);

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x(BLACKBOX,3)@20000000
    -- out out_data_out_0_0@20000001
    -- out out_data_out_0_1@20000001
    -- out out_data_out_0_2@20000001
    -- out out_data_out_0_3@20000001
    -- out out_data_out_1_0@20000001
    -- out out_data_out_1_1@20000001
    -- out out_data_out_1_2@20000001
    -- out out_data_out_1_3@20000001
    -- out out_data_out_2_0@20000001
    -- out out_data_out_2_1@20000001
    -- out out_data_out_2_2@20000001
    -- out out_data_out_2_3@20000001
    -- out out_data_out_3_0@20000001
    -- out out_data_out_3_1@20000001
    -- out out_data_out_3_2@20000001
    -- out out_data_out_3_3@20000001
    -- out out_data_out_4_0@20000001
    -- out out_data_out_4_1@20000001
    -- out out_data_out_4_2@20000001
    -- out out_data_out_4_3@20000001
    -- out out_data_out_5_0@20000001
    -- out out_data_out_5_1@20000001
    -- out out_data_out_5_2@20000001
    -- out out_data_out_5_3@20000001
    -- out out_data_out_6_0@20000001
    -- out out_data_out_6_1@20000001
    -- out out_data_out_6_2@20000001
    -- out out_data_out_6_3@20000001
    -- out out_data_out_7_0@20000001
    -- out out_data_out_7_1@20000001
    -- out out_data_out_7_2@20000001
    -- out out_data_out_7_3@20000001
    -- out out_data_out_8_0@20000001
    -- out out_data_out_8_1@20000001
    -- out out_data_out_8_2@20000001
    -- out out_data_out_8_3@20000001
    -- out out_data_out_9_0@20000001
    -- out out_data_out_9_1@20000001
    -- out out_data_out_9_2@20000001
    -- out out_data_out_9_3@20000001
    -- out out_data_out_10_0@20000001
    -- out out_data_out_10_1@20000001
    -- out out_data_out_10_2@20000001
    -- out out_data_out_10_3@20000001
    -- out out_data_out_11_0@20000001
    -- out out_data_out_11_1@20000001
    -- out out_data_out_11_2@20000001
    -- out out_data_out_11_3@20000001
    -- out out_data_out_12_0@20000001
    -- out out_data_out_12_1@20000001
    -- out out_data_out_12_2@20000001
    -- out out_data_out_12_3@20000001
    -- out out_data_out_13_0@20000001
    -- out out_data_out_13_1@20000001
    -- out out_data_out_13_2@20000001
    -- out out_data_out_13_3@20000001
    -- out out_data_out_14_0@20000001
    -- out out_data_out_14_1@20000001
    -- out out_data_out_14_2@20000001
    -- out out_data_out_14_3@20000001
    -- out out_data_out_15_0@20000001
    -- out out_data_out_15_1@20000001
    -- out out_data_out_15_2@20000001
    -- out out_data_out_15_3@20000001
    -- out out_valid_out@20000001
    thereaddata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x : readdata_reg_memcoalesce_bottom_load_0_memRead0
    PORT MAP (
        in_data_in_0_0 => dupName_0_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_0_1 => dupName_17_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_0_2 => dupName_34_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_0_3 => dupName_51_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_1_0 => dupName_1_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_1_1 => dupName_18_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_1_2 => dupName_35_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_1_3 => dupName_52_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_2_0 => dupName_2_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_2_1 => dupName_19_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_2_2 => dupName_36_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_2_3 => dupName_53_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_3_0 => dupName_3_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_3_1 => dupName_20_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_3_2 => dupName_37_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_3_3 => dupName_54_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_4_0 => dupName_4_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_4_1 => dupName_21_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_4_2 => dupName_38_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_4_3 => dupName_55_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_5_0 => dupName_5_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_5_1 => dupName_22_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_5_2 => dupName_39_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_5_3 => dupName_56_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_6_0 => dupName_6_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_6_1 => dupName_23_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_6_2 => dupName_40_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_6_3 => dupName_57_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_7_0 => dupName_7_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_7_1 => dupName_24_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_7_2 => dupName_41_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_7_3 => dupName_58_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_8_0 => dupName_8_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_8_1 => dupName_25_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_8_2 => dupName_42_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_8_3 => dupName_59_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_9_0 => dupName_9_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_9_1 => dupName_26_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_9_2 => dupName_43_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_9_3 => dupName_60_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_10_0 => dupName_10_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_10_1 => dupName_27_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_10_2 => dupName_44_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_10_3 => dupName_61_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_11_0 => dupName_11_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_11_1 => dupName_28_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_11_2 => dupName_45_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_11_3 => dupName_62_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_12_0 => dupName_12_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_12_1 => dupName_29_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_12_2 => dupName_46_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_12_3 => dupName_63_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_13_0 => dupName_13_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_13_1 => dupName_30_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_13_2 => dupName_47_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_13_3 => dupName_64_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_14_0 => dupName_14_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_14_1 => dupName_31_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_14_2 => dupName_48_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_14_3 => dupName_65_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_15_0 => dupName_15_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_15_1 => dupName_32_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_15_2 => dupName_49_ip_dsdk_adapt_bitselect_x_b,
        in_data_in_15_3 => dupName_66_ip_dsdk_adapt_bitselect_x_b,
        in_stall_in => in_i_stall,
        in_valid_in => i_load_memcoalesce_bottom_load_0_memread164_o_valid,
        out_data_out_0_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_0,
        out_data_out_0_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_1,
        out_data_out_0_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_2,
        out_data_out_0_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_3,
        out_data_out_1_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_0,
        out_data_out_1_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_1,
        out_data_out_1_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_2,
        out_data_out_1_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_3,
        out_data_out_2_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_0,
        out_data_out_2_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_1,
        out_data_out_2_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_2,
        out_data_out_2_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_3,
        out_data_out_3_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_0,
        out_data_out_3_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_1,
        out_data_out_3_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_2,
        out_data_out_3_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_3,
        out_data_out_4_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_0,
        out_data_out_4_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_1,
        out_data_out_4_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_2,
        out_data_out_4_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_3,
        out_data_out_5_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_0,
        out_data_out_5_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_1,
        out_data_out_5_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_2,
        out_data_out_5_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_3,
        out_data_out_6_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_0,
        out_data_out_6_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_1,
        out_data_out_6_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_2,
        out_data_out_6_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_3,
        out_data_out_7_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_0,
        out_data_out_7_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_1,
        out_data_out_7_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_2,
        out_data_out_7_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_3,
        out_data_out_8_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_0,
        out_data_out_8_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_1,
        out_data_out_8_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_2,
        out_data_out_8_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_3,
        out_data_out_9_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_0,
        out_data_out_9_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_1,
        out_data_out_9_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_2,
        out_data_out_9_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_3,
        out_data_out_10_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_0,
        out_data_out_10_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_1,
        out_data_out_10_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_2,
        out_data_out_10_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_3,
        out_data_out_11_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_0,
        out_data_out_11_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_1,
        out_data_out_11_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_2,
        out_data_out_11_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_3,
        out_data_out_12_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_0,
        out_data_out_12_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_1,
        out_data_out_12_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_2,
        out_data_out_12_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_3,
        out_data_out_13_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_0,
        out_data_out_13_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_1,
        out_data_out_13_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_2,
        out_data_out_13_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_3,
        out_data_out_14_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_0,
        out_data_out_14_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_1,
        out_data_out_14_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_2,
        out_data_out_14_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_3,
        out_data_out_15_0 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_0,
        out_data_out_15_1 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_1,
        out_data_out_15_2 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_2,
        out_data_out_15_3 => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_3,
        out_stall_out => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_stall_out,
        out_valid_out => readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_vunroll_x(GPOUT,2)@268
    out_o_readdata_0_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_0;
    out_o_readdata_1_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_0;
    out_o_readdata_2_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_0;
    out_o_readdata_3_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_0;
    out_o_readdata_4_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_0;
    out_o_readdata_5_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_0;
    out_o_readdata_6_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_0;
    out_o_readdata_7_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_0;
    out_o_readdata_8_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_0;
    out_o_readdata_9_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_0;
    out_o_readdata_10_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_0;
    out_o_readdata_11_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_0;
    out_o_readdata_12_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_0;
    out_o_readdata_13_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_0;
    out_o_readdata_14_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_0;
    out_o_readdata_15_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_0;
    out_o_readdata_0_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_1;
    out_o_readdata_1_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_1;
    out_o_readdata_2_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_1;
    out_o_readdata_3_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_1;
    out_o_readdata_4_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_1;
    out_o_readdata_5_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_1;
    out_o_readdata_6_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_1;
    out_o_readdata_7_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_1;
    out_o_readdata_8_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_1;
    out_o_readdata_9_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_1;
    out_o_readdata_10_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_1;
    out_o_readdata_11_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_1;
    out_o_readdata_12_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_1;
    out_o_readdata_13_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_1;
    out_o_readdata_14_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_1;
    out_o_readdata_15_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_1;
    out_o_readdata_0_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_2;
    out_o_readdata_1_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_2;
    out_o_readdata_2_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_2;
    out_o_readdata_3_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_2;
    out_o_readdata_4_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_2;
    out_o_readdata_5_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_2;
    out_o_readdata_6_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_2;
    out_o_readdata_7_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_2;
    out_o_readdata_8_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_2;
    out_o_readdata_9_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_2;
    out_o_readdata_10_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_2;
    out_o_readdata_11_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_2;
    out_o_readdata_12_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_2;
    out_o_readdata_13_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_2;
    out_o_readdata_14_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_2;
    out_o_readdata_15_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_2;
    out_o_readdata_0_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_0_3;
    out_o_readdata_1_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_1_3;
    out_o_readdata_2_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_2_3;
    out_o_readdata_3_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_3_3;
    out_o_readdata_4_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_4_3;
    out_o_readdata_5_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_5_3;
    out_o_readdata_6_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_6_3;
    out_o_readdata_7_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_7_3;
    out_o_readdata_8_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_8_3;
    out_o_readdata_9_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_9_3;
    out_o_readdata_10_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_10_3;
    out_o_readdata_11_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_11_3;
    out_o_readdata_12_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_12_3;
    out_o_readdata_13_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_13_3;
    out_o_readdata_14_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_14_3;
    out_o_readdata_15_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_data_out_15_3;
    out_o_valid <= readdata_reg_memcoalesce_bottom_load_0_memRead0_aunroll_vunroll_x_out_valid_out;

    -- dupName_0_regfree_osync_x(GPOUT,8)
    out_memcoalesce_bottom_load_0_avm_burstcount <= i_load_memcoalesce_bottom_load_0_memread164_avm_burstcount;

    -- dupName_1_regfree_osync_x(GPOUT,12)
    out_memcoalesce_bottom_load_0_avm_byteenable <= i_load_memcoalesce_bottom_load_0_memread164_avm_byteenable;

    -- dupName_2_regfree_osync_x(GPOUT,15)
    out_memcoalesce_bottom_load_0_avm_enable <= i_load_memcoalesce_bottom_load_0_memread164_avm_enable;

    -- dupName_3_regfree_osync_x(GPOUT,18)
    out_memcoalesce_bottom_load_0_avm_read <= i_load_memcoalesce_bottom_load_0_memread164_avm_read;

    -- dupName_4_regfree_osync_x(GPOUT,20)
    out_memcoalesce_bottom_load_0_avm_write <= i_load_memcoalesce_bottom_load_0_memread164_avm_write;

    -- dupName_5_regfree_osync_x(GPOUT,22)
    out_memcoalesce_bottom_load_0_avm_writedata <= i_load_memcoalesce_bottom_load_0_memread164_avm_writedata;

    -- regfree_osync(GPOUT,94)
    out_memcoalesce_bottom_load_0_avm_address <= i_load_memcoalesce_bottom_load_0_memread164_avm_address;

    -- sync_out(GPOUT,96)@20000000
    out_o_stall <= i_load_memcoalesce_bottom_load_0_memread164_o_stall;

END normal;
