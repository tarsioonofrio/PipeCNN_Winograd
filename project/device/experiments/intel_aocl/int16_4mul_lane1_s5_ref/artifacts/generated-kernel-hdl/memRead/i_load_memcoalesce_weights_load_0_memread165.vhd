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

-- VHDL created from i_load_memcoalesce_weights_load_0_memread165
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

entity i_load_memcoalesce_weights_load_0_memread165 is
    port (
        out_o_readdata_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_4 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_5 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_6 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_7 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_8 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_9 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_10 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_11 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_12 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_13 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_14 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_15 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_16 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_17 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_19 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_20 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_21 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_22 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_23 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_24 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_25 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_26 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_27 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_28 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_29 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_30 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_31 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_32 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_33 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_34 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_35 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_36 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_37 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_38 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_39 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_40 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_41 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_42 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_43 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_44 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_45 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_46 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_47 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_48 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_49 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_50 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_51 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_52 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_53 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_54 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_55 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_56 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_57 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_58 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_59 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_60 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_61 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_62 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_63 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_64 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_65 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_66 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_67 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_68 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_69 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_70 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_71 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_72 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_73 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_74 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_75 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_76 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_77 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_78 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_79 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_80 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_81 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_82 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_83 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_84 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_85 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_86 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_87 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_88 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_89 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_90 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_91 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_92 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_93 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_94 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_95 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_readdata_96 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_readdata_97 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_readdata_98 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_readdata_99 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_readdata_100 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_readdata_101 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_readdata_102 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_readdata_103 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_weights_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        out_memcoalesce_weights_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_i_address : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_predicate : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_weights_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_weights_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        in_memcoalesce_weights_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_weights_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_weights_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_weights_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_weights_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_weights_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_weights_load_0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_load_memcoalesce_weights_load_0_memread165;

architecture normal of i_load_memcoalesce_weights_load_0_memread165 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component readdata_reg_memcoalesce_weights_load_0_memRead1 is
        port (
            in_data_in_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(15 downto 0);  -- Fixed Point
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
            in_data_in_19 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_31 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_32 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_33 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_34 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_35 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_36 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_37 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_38 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_39 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_40 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_41 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_42 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_43 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_44 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_45 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_46 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_47 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_48 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_49 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_50 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_51 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_52 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_53 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_54 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_55 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_56 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_57 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_58 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_59 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_60 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_61 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_62 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_63 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_64 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_65 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_66 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_67 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_68 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_69 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_70 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_71 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_72 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_73 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_74 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_75 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_76 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_77 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_78 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_79 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_80 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_81 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_82 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_83 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_84 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_85 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_86 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_87 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_88 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_89 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_90 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_91 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_92 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_93 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_94 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_95 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_96 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_97 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_98 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_99 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_100 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_101 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_102 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_103 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(15 downto 0);  -- Fixed Point
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
            out_data_out_19 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_31 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_32 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_33 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_34 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_35 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_36 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_37 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_38 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_39 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_40 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_41 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_42 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_43 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_44 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_45 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_46 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_47 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_48 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_49 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_50 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_51 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_52 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_53 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_54 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_55 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_56 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_57 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_58 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_59 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_60 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_61 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_62 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_63 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_64 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_65 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_66 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_67 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_68 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_69 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_70 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_71 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_72 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_73 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_74 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_75 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_76 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_77 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_78 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_79 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_80 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_81 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_82 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_83 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_84 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_85 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_86 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_87 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_88 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_89 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_90 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_91 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_92 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_93 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_94 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_95 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_96 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_97 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_98 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_99 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_100 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_101 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_102 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_103 : out std_logic_vector(63 downto 0);  -- Fixed Point
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
            ALIGNMENT_BYTES : INTEGER := 64;
            ATOMIC : INTEGER := 0;
            ATOMIC_WIDTH : INTEGER := 3;
            AWIDTH : INTEGER := 33;
            BURSTCOUNT_WIDTH : INTEGER := 5;
            ENABLE_BANKED_MEMORY : INTEGER := 0;
            FORCE_NOP_SUPPORT : INTEGER := 0;
            HIGH_FMAX : INTEGER := 1;
            INPUTFIFO_USEDW_MAXBITS : INTEGER := 5;
            KERNEL_SIDE_MEM_LATENCY : INTEGER := 255;
            LMEM_ADDR_PERMUTATION_STYLE : INTEGER := 0;
            MEMORY_SIDE_MEM_LATENCY : INTEGER := 255;
            MWIDTH : INTEGER := 512;
            MWIDTH_BYTES : INTEGER := 64;
            NUMBER_BANKS : INTEGER := 1;
            PROFILE_ADDR_TOGGLE : INTEGER := 0;
            READ : INTEGER := 1;
            STALLFREE : INTEGER := 0;
            STYLE : STRING := "BURST-NON-ALIGNED";
            SYNCHRONIZE_RESET : INTEGER := 1;
            USECACHING : INTEGER := 0;
            USEINPUTFIFO : INTEGER := 0;
            USEOUTPUTFIFO : INTEGER := 1;
            USE_BYTE_EN : INTEGER := 0;
            USE_WRITE_ACK : INTEGER := 0;
            WIDTH : INTEGER := 2048;
            WIDTH_BYTES : INTEGER := 256;
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
            i_byteenable : in std_logic_vector(255 downto 0);
            i_cmpdata : in std_logic_vector(2047 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_valid : in std_logic;
            i_writedata : in std_logic_vector(2047 downto 0);
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
            o_readdata : out std_logic_vector(2047 downto 0);
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
    signal dupName_0_c_i2048_0gr_x_q : STD_LOGIC_VECTOR (2047 downto 0);
    signal dupName_0_c_i33_0gr_x_q : STD_LOGIC_VECTOR (32 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_13_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_14_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_15_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_16_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_17_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_17_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_18_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_18_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_19_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_19_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_20_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_20_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_21_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_21_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_22_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_22_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_23_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_23_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_24_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_24_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_25_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_25_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_26_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_26_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_27_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_28_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_29_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_30_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_31_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_32_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_33_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_34_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_35_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_36_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_36_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_37_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_37_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_38_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_38_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_39_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_39_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_40_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_40_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_41_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_41_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_42_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_42_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_43_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_43_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_44_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_44_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_45_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_45_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_46_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_46_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_47_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_47_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_48_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_48_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_49_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_49_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_50_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_50_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_51_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_51_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_52_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_52_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_53_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_53_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_54_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_54_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_55_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_55_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_56_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_56_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_57_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_57_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_58_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_58_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_59_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_59_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_60_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_60_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_61_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_61_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_62_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_62_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_63_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_63_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_64_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_64_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_65_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_65_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_66_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_66_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_67_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_67_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_68_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_68_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_69_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_69_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_70_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_70_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_71_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_71_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_72_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_72_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_73_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_73_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_74_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_74_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_75_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_75_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_76_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_76_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_77_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_77_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_78_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_78_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_79_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_79_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_80_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_80_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_81_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_81_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_82_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_82_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_83_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_83_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_84_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_84_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_85_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_85_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_86_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_86_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_87_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_87_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_88_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_88_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_89_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_89_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_90_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_90_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_91_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_91_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_92_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_92_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_93_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_93_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_94_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_94_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_95_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_95_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_96_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_96_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_97_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_97_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_98_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_98_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_99_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_99_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_100_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_100_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_101_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_101_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_102_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_102_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_38 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_39 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_40 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_41 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_42 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_43 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_44 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_45 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_46 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_47 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_48 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_49 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_50 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_51 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_52 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_53 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_54 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_55 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_56 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_57 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_58 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_59 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_60 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_61 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_62 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_63 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_64 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_65 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_66 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_67 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_68 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_69 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_70 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_71 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_72 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_73 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_74 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_75 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_76 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_77 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_78 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_79 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_80 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_81 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_82 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_83 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_84 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_85 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_86 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_87 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_88 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_89 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_90 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_91 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_92 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_93 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_94 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_95 : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_96 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_97 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_98 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_99 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_100 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_101 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_102 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_103 : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal addr_trunc_in : STD_LOGIC_VECTOR (32 downto 0);
    signal addr_trunc_q : STD_LOGIC_VECTOR (32 downto 0);
    signal c_i256_0gr_q : STD_LOGIC_VECTOR (255 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_0gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_readdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_readdatavalid_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_avm_waitrequest : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_waitrequest_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_avm_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_writeack_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_clock2x_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_flush : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_flush_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_i_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_atomic_op : STD_LOGIC_VECTOR (2 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_bitwiseor : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_byteenable : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_cmpdata : STD_LOGIC_VECTOR (2047 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_predicate_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_stall_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_i_valid_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_i_writedata : STD_LOGIC_VECTOR (2047 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_stream_base_addr : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_stream_reset : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_stream_reset_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_stream_size : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_enable_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_read_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_avm_write_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_o_input_fifo_depth : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_o_readdata : STD_LOGIC_VECTOR (2047 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_o_stall_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_o_valid_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_o_writeack_bitsignaltemp : std_logic;
    signal i_load_memcoalesce_weights_load_0_memread166_profile_avm_burstcount_total_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_weights_load_0_memread166_profile_bw_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (15 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (15 downto 0);

begin


    -- c_i32_0gr(CONSTANT,227)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- dupName_0_c_i2048_0gr_x(CONSTANT,3)
    dupName_0_c_i2048_0gr_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- c_i256_0gr(CONSTANT,226)
    c_i256_0gr_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- dupName_0_c_i33_0gr_x(CONSTANT,4)
    dupName_0_c_i33_0gr_x_q <= "000000000000000000000000000000000";

    -- c_i3_0gr(CONSTANT,229)
    c_i3_0gr_q <= "000";

    -- addr_trunc(ROUND,223)
    addr_trunc_in <= in_i_address(32 downto 0);
    addr_trunc_q <= addr_trunc_in(32 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_load_memcoalesce_weights_load_0_memread166(EXTIFACE,230)
    i_load_memcoalesce_weights_load_0_memread166_avm_readdata <= in_memcoalesce_weights_load_0_avm_readdata;
    i_load_memcoalesce_weights_load_0_memread166_avm_readdatavalid <= in_memcoalesce_weights_load_0_avm_readdatavalid;
    i_load_memcoalesce_weights_load_0_memread166_avm_waitrequest <= in_memcoalesce_weights_load_0_avm_waitrequest;
    i_load_memcoalesce_weights_load_0_memread166_avm_writeack <= in_memcoalesce_weights_load_0_avm_writeack;
    i_load_memcoalesce_weights_load_0_memread166_clock2x <= GND_q;
    i_load_memcoalesce_weights_load_0_memread166_flush <= in_flush;
    i_load_memcoalesce_weights_load_0_memread166_i_address <= addr_trunc_q;
    i_load_memcoalesce_weights_load_0_memread166_i_atomic_op <= c_i3_0gr_q;
    i_load_memcoalesce_weights_load_0_memread166_i_bitwiseor <= dupName_0_c_i33_0gr_x_q;
    i_load_memcoalesce_weights_load_0_memread166_i_byteenable <= c_i256_0gr_q;
    i_load_memcoalesce_weights_load_0_memread166_i_cmpdata <= dupName_0_c_i2048_0gr_x_q;
    i_load_memcoalesce_weights_load_0_memread166_i_predicate <= in_i_predicate;
    i_load_memcoalesce_weights_load_0_memread166_i_stall <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_stall_out;
    i_load_memcoalesce_weights_load_0_memread166_i_valid <= in_i_valid;
    i_load_memcoalesce_weights_load_0_memread166_i_writedata <= dupName_0_c_i2048_0gr_x_q;
    i_load_memcoalesce_weights_load_0_memread166_stream_base_addr <= dupName_0_c_i33_0gr_x_q;
    i_load_memcoalesce_weights_load_0_memread166_stream_reset <= GND_q;
    i_load_memcoalesce_weights_load_0_memread166_stream_size <= c_i32_0gr_q;
    i_load_memcoalesce_weights_load_0_memread166_avm_readdatavalid_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_avm_readdatavalid(0);
    i_load_memcoalesce_weights_load_0_memread166_avm_waitrequest_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_avm_waitrequest(0);
    i_load_memcoalesce_weights_load_0_memread166_avm_writeack_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_avm_writeack(0);
    i_load_memcoalesce_weights_load_0_memread166_clock2x_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_clock2x(0);
    i_load_memcoalesce_weights_load_0_memread166_flush_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_flush(0);
    i_load_memcoalesce_weights_load_0_memread166_i_predicate_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_i_predicate(0);
    i_load_memcoalesce_weights_load_0_memread166_i_stall_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_i_stall(0);
    i_load_memcoalesce_weights_load_0_memread166_i_valid_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_i_valid(0);
    i_load_memcoalesce_weights_load_0_memread166_stream_reset_bitsignaltemp <= i_load_memcoalesce_weights_load_0_memread166_stream_reset(0);
    i_load_memcoalesce_weights_load_0_memread166_avm_enable(0) <= i_load_memcoalesce_weights_load_0_memread166_avm_enable_bitsignaltemp;
    i_load_memcoalesce_weights_load_0_memread166_avm_read(0) <= i_load_memcoalesce_weights_load_0_memread166_avm_read_bitsignaltemp;
    i_load_memcoalesce_weights_load_0_memread166_avm_write(0) <= i_load_memcoalesce_weights_load_0_memread166_avm_write_bitsignaltemp;
    i_load_memcoalesce_weights_load_0_memread166_o_stall(0) <= i_load_memcoalesce_weights_load_0_memread166_o_stall_bitsignaltemp;
    i_load_memcoalesce_weights_load_0_memread166_o_valid(0) <= i_load_memcoalesce_weights_load_0_memread166_o_valid_bitsignaltemp;
    i_load_memcoalesce_weights_load_0_memread166_o_writeack(0) <= i_load_memcoalesce_weights_load_0_memread166_o_writeack_bitsignaltemp;
    thei_load_memcoalesce_weights_load_0_memread166 : lsu_top
    GENERIC MAP (
        ABITS_PER_LMEM_BANK => 0,
        ADDRSPACE => 1,
        ALIGNMENT_BYTES => 64,
        ATOMIC => 0,
        ATOMIC_WIDTH => 3,
        AWIDTH => 33,
        BURSTCOUNT_WIDTH => 5,
        ENABLE_BANKED_MEMORY => 0,
        FORCE_NOP_SUPPORT => 0,
        HIGH_FMAX => 1,
        INPUTFIFO_USEDW_MAXBITS => 5,
        KERNEL_SIDE_MEM_LATENCY => 255,
        LMEM_ADDR_PERMUTATION_STYLE => 0,
        MEMORY_SIDE_MEM_LATENCY => 255,
        MWIDTH => 512,
        MWIDTH_BYTES => 64,
        NUMBER_BANKS => 1,
        PROFILE_ADDR_TOGGLE => 0,
        READ => 1,
        STALLFREE => 0,
        STYLE => "BURST-NON-ALIGNED",
        SYNCHRONIZE_RESET => 1,
        USECACHING => 0,
        USEINPUTFIFO => 0,
        USEOUTPUTFIFO => 1,
        USE_BYTE_EN => 0,
        USE_WRITE_ACK => 0,
        WIDTH => 2048,
        WIDTH_BYTES => 256,
        WRITEDATAWIDTH_BYTES => 64
    )
    PORT MAP (
        avm_readdata => in_memcoalesce_weights_load_0_avm_readdata,
        avm_readdatavalid => i_load_memcoalesce_weights_load_0_memread166_avm_readdatavalid_bitsignaltemp,
        avm_waitrequest => i_load_memcoalesce_weights_load_0_memread166_avm_waitrequest_bitsignaltemp,
        avm_writeack => i_load_memcoalesce_weights_load_0_memread166_avm_writeack_bitsignaltemp,
        clock2x => i_load_memcoalesce_weights_load_0_memread166_clock2x_bitsignaltemp,
        flush => i_load_memcoalesce_weights_load_0_memread166_flush_bitsignaltemp,
        i_address => addr_trunc_q,
        i_atomic_op => c_i3_0gr_q,
        i_bitwiseor => dupName_0_c_i33_0gr_x_q,
        i_byteenable => c_i256_0gr_q,
        i_cmpdata => dupName_0_c_i2048_0gr_x_q,
        i_predicate => i_load_memcoalesce_weights_load_0_memread166_i_predicate_bitsignaltemp,
        i_stall => i_load_memcoalesce_weights_load_0_memread166_i_stall_bitsignaltemp,
        i_valid => i_load_memcoalesce_weights_load_0_memread166_i_valid_bitsignaltemp,
        i_writedata => dupName_0_c_i2048_0gr_x_q,
        stream_base_addr => dupName_0_c_i33_0gr_x_q,
        stream_reset => i_load_memcoalesce_weights_load_0_memread166_stream_reset_bitsignaltemp,
        stream_size => c_i32_0gr_q,
        avm_address => i_load_memcoalesce_weights_load_0_memread166_avm_address,
        avm_burstcount => i_load_memcoalesce_weights_load_0_memread166_avm_burstcount,
        avm_byteenable => i_load_memcoalesce_weights_load_0_memread166_avm_byteenable,
        avm_enable => i_load_memcoalesce_weights_load_0_memread166_avm_enable_bitsignaltemp,
        avm_read => i_load_memcoalesce_weights_load_0_memread166_avm_read_bitsignaltemp,
        avm_write => i_load_memcoalesce_weights_load_0_memread166_avm_write_bitsignaltemp,
        avm_writedata => i_load_memcoalesce_weights_load_0_memread166_avm_writedata,
        o_readdata => i_load_memcoalesce_weights_load_0_memread166_o_readdata,
        o_stall => i_load_memcoalesce_weights_load_0_memread166_o_stall_bitsignaltemp,
        o_valid => i_load_memcoalesce_weights_load_0_memread166_o_valid_bitsignaltemp,
        o_writeack => i_load_memcoalesce_weights_load_0_memread166_o_writeack_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_102_ip_dsdk_adapt_bitselect_x(BITSELECT,220)
    dupName_102_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(2047 downto 1984);

    -- dupName_102_ip_dsdk_adapt_cast_x(BITSELECT,221)
    dupName_102_ip_dsdk_adapt_cast_x_b <= dupName_102_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_101_ip_dsdk_adapt_bitselect_x(BITSELECT,218)
    dupName_101_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1983 downto 1920);

    -- dupName_101_ip_dsdk_adapt_cast_x(BITSELECT,219)
    dupName_101_ip_dsdk_adapt_cast_x_b <= dupName_101_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_100_ip_dsdk_adapt_bitselect_x(BITSELECT,216)
    dupName_100_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1919 downto 1856);

    -- dupName_100_ip_dsdk_adapt_cast_x(BITSELECT,217)
    dupName_100_ip_dsdk_adapt_cast_x_b <= dupName_100_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_99_ip_dsdk_adapt_bitselect_x(BITSELECT,214)
    dupName_99_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1855 downto 1792);

    -- dupName_99_ip_dsdk_adapt_cast_x(BITSELECT,215)
    dupName_99_ip_dsdk_adapt_cast_x_b <= dupName_99_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_98_ip_dsdk_adapt_bitselect_x(BITSELECT,212)
    dupName_98_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1791 downto 1728);

    -- dupName_98_ip_dsdk_adapt_cast_x(BITSELECT,213)
    dupName_98_ip_dsdk_adapt_cast_x_b <= dupName_98_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_97_ip_dsdk_adapt_bitselect_x(BITSELECT,210)
    dupName_97_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1727 downto 1664);

    -- dupName_97_ip_dsdk_adapt_cast_x(BITSELECT,211)
    dupName_97_ip_dsdk_adapt_cast_x_b <= dupName_97_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_96_ip_dsdk_adapt_bitselect_x(BITSELECT,208)
    dupName_96_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1663 downto 1600);

    -- dupName_96_ip_dsdk_adapt_cast_x(BITSELECT,209)
    dupName_96_ip_dsdk_adapt_cast_x_b <= dupName_96_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_95_ip_dsdk_adapt_bitselect_x(BITSELECT,206)
    dupName_95_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1599 downto 1536);

    -- dupName_95_ip_dsdk_adapt_cast_x(BITSELECT,207)
    dupName_95_ip_dsdk_adapt_cast_x_b <= dupName_95_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_94_ip_dsdk_adapt_bitselect_x(BITSELECT,204)
    dupName_94_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1535 downto 1520);

    -- dupName_94_ip_dsdk_adapt_cast_x(BITSELECT,205)
    dupName_94_ip_dsdk_adapt_cast_x_b <= dupName_94_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_93_ip_dsdk_adapt_bitselect_x(BITSELECT,202)
    dupName_93_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1519 downto 1504);

    -- dupName_93_ip_dsdk_adapt_cast_x(BITSELECT,203)
    dupName_93_ip_dsdk_adapt_cast_x_b <= dupName_93_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_92_ip_dsdk_adapt_bitselect_x(BITSELECT,200)
    dupName_92_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1503 downto 1488);

    -- dupName_92_ip_dsdk_adapt_cast_x(BITSELECT,201)
    dupName_92_ip_dsdk_adapt_cast_x_b <= dupName_92_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_91_ip_dsdk_adapt_bitselect_x(BITSELECT,198)
    dupName_91_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1487 downto 1472);

    -- dupName_91_ip_dsdk_adapt_cast_x(BITSELECT,199)
    dupName_91_ip_dsdk_adapt_cast_x_b <= dupName_91_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_90_ip_dsdk_adapt_bitselect_x(BITSELECT,196)
    dupName_90_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1471 downto 1456);

    -- dupName_90_ip_dsdk_adapt_cast_x(BITSELECT,197)
    dupName_90_ip_dsdk_adapt_cast_x_b <= dupName_90_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_89_ip_dsdk_adapt_bitselect_x(BITSELECT,194)
    dupName_89_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1455 downto 1440);

    -- dupName_89_ip_dsdk_adapt_cast_x(BITSELECT,195)
    dupName_89_ip_dsdk_adapt_cast_x_b <= dupName_89_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_88_ip_dsdk_adapt_bitselect_x(BITSELECT,192)
    dupName_88_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1439 downto 1424);

    -- dupName_88_ip_dsdk_adapt_cast_x(BITSELECT,193)
    dupName_88_ip_dsdk_adapt_cast_x_b <= dupName_88_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_87_ip_dsdk_adapt_bitselect_x(BITSELECT,190)
    dupName_87_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1423 downto 1408);

    -- dupName_87_ip_dsdk_adapt_cast_x(BITSELECT,191)
    dupName_87_ip_dsdk_adapt_cast_x_b <= dupName_87_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_86_ip_dsdk_adapt_bitselect_x(BITSELECT,188)
    dupName_86_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1407 downto 1392);

    -- dupName_86_ip_dsdk_adapt_cast_x(BITSELECT,189)
    dupName_86_ip_dsdk_adapt_cast_x_b <= dupName_86_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_85_ip_dsdk_adapt_bitselect_x(BITSELECT,186)
    dupName_85_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1391 downto 1376);

    -- dupName_85_ip_dsdk_adapt_cast_x(BITSELECT,187)
    dupName_85_ip_dsdk_adapt_cast_x_b <= dupName_85_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_84_ip_dsdk_adapt_bitselect_x(BITSELECT,184)
    dupName_84_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1375 downto 1360);

    -- dupName_84_ip_dsdk_adapt_cast_x(BITSELECT,185)
    dupName_84_ip_dsdk_adapt_cast_x_b <= dupName_84_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_83_ip_dsdk_adapt_bitselect_x(BITSELECT,182)
    dupName_83_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1359 downto 1344);

    -- dupName_83_ip_dsdk_adapt_cast_x(BITSELECT,183)
    dupName_83_ip_dsdk_adapt_cast_x_b <= dupName_83_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_82_ip_dsdk_adapt_bitselect_x(BITSELECT,180)
    dupName_82_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1343 downto 1328);

    -- dupName_82_ip_dsdk_adapt_cast_x(BITSELECT,181)
    dupName_82_ip_dsdk_adapt_cast_x_b <= dupName_82_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_81_ip_dsdk_adapt_bitselect_x(BITSELECT,178)
    dupName_81_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1327 downto 1312);

    -- dupName_81_ip_dsdk_adapt_cast_x(BITSELECT,179)
    dupName_81_ip_dsdk_adapt_cast_x_b <= dupName_81_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_80_ip_dsdk_adapt_bitselect_x(BITSELECT,176)
    dupName_80_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1311 downto 1296);

    -- dupName_80_ip_dsdk_adapt_cast_x(BITSELECT,177)
    dupName_80_ip_dsdk_adapt_cast_x_b <= dupName_80_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_79_ip_dsdk_adapt_bitselect_x(BITSELECT,174)
    dupName_79_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1295 downto 1280);

    -- dupName_79_ip_dsdk_adapt_cast_x(BITSELECT,175)
    dupName_79_ip_dsdk_adapt_cast_x_b <= dupName_79_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_78_ip_dsdk_adapt_bitselect_x(BITSELECT,172)
    dupName_78_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1279 downto 1264);

    -- dupName_78_ip_dsdk_adapt_cast_x(BITSELECT,173)
    dupName_78_ip_dsdk_adapt_cast_x_b <= dupName_78_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_77_ip_dsdk_adapt_bitselect_x(BITSELECT,170)
    dupName_77_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1263 downto 1248);

    -- dupName_77_ip_dsdk_adapt_cast_x(BITSELECT,171)
    dupName_77_ip_dsdk_adapt_cast_x_b <= dupName_77_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_76_ip_dsdk_adapt_bitselect_x(BITSELECT,168)
    dupName_76_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1247 downto 1232);

    -- dupName_76_ip_dsdk_adapt_cast_x(BITSELECT,169)
    dupName_76_ip_dsdk_adapt_cast_x_b <= dupName_76_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_75_ip_dsdk_adapt_bitselect_x(BITSELECT,166)
    dupName_75_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1231 downto 1216);

    -- dupName_75_ip_dsdk_adapt_cast_x(BITSELECT,167)
    dupName_75_ip_dsdk_adapt_cast_x_b <= dupName_75_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_74_ip_dsdk_adapt_bitselect_x(BITSELECT,164)
    dupName_74_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1215 downto 1200);

    -- dupName_74_ip_dsdk_adapt_cast_x(BITSELECT,165)
    dupName_74_ip_dsdk_adapt_cast_x_b <= dupName_74_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_73_ip_dsdk_adapt_bitselect_x(BITSELECT,162)
    dupName_73_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1199 downto 1184);

    -- dupName_73_ip_dsdk_adapt_cast_x(BITSELECT,163)
    dupName_73_ip_dsdk_adapt_cast_x_b <= dupName_73_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_72_ip_dsdk_adapt_bitselect_x(BITSELECT,160)
    dupName_72_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1183 downto 1168);

    -- dupName_72_ip_dsdk_adapt_cast_x(BITSELECT,161)
    dupName_72_ip_dsdk_adapt_cast_x_b <= dupName_72_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_71_ip_dsdk_adapt_bitselect_x(BITSELECT,158)
    dupName_71_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1167 downto 1152);

    -- dupName_71_ip_dsdk_adapt_cast_x(BITSELECT,159)
    dupName_71_ip_dsdk_adapt_cast_x_b <= dupName_71_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_70_ip_dsdk_adapt_bitselect_x(BITSELECT,156)
    dupName_70_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1151 downto 1136);

    -- dupName_70_ip_dsdk_adapt_cast_x(BITSELECT,157)
    dupName_70_ip_dsdk_adapt_cast_x_b <= dupName_70_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_69_ip_dsdk_adapt_bitselect_x(BITSELECT,154)
    dupName_69_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1135 downto 1120);

    -- dupName_69_ip_dsdk_adapt_cast_x(BITSELECT,155)
    dupName_69_ip_dsdk_adapt_cast_x_b <= dupName_69_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_68_ip_dsdk_adapt_bitselect_x(BITSELECT,152)
    dupName_68_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1119 downto 1104);

    -- dupName_68_ip_dsdk_adapt_cast_x(BITSELECT,153)
    dupName_68_ip_dsdk_adapt_cast_x_b <= dupName_68_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_67_ip_dsdk_adapt_bitselect_x(BITSELECT,150)
    dupName_67_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1103 downto 1088);

    -- dupName_67_ip_dsdk_adapt_cast_x(BITSELECT,151)
    dupName_67_ip_dsdk_adapt_cast_x_b <= dupName_67_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_66_ip_dsdk_adapt_bitselect_x(BITSELECT,148)
    dupName_66_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1087 downto 1072);

    -- dupName_66_ip_dsdk_adapt_cast_x(BITSELECT,149)
    dupName_66_ip_dsdk_adapt_cast_x_b <= dupName_66_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_65_ip_dsdk_adapt_bitselect_x(BITSELECT,146)
    dupName_65_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1071 downto 1056);

    -- dupName_65_ip_dsdk_adapt_cast_x(BITSELECT,147)
    dupName_65_ip_dsdk_adapt_cast_x_b <= dupName_65_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_64_ip_dsdk_adapt_bitselect_x(BITSELECT,144)
    dupName_64_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1055 downto 1040);

    -- dupName_64_ip_dsdk_adapt_cast_x(BITSELECT,145)
    dupName_64_ip_dsdk_adapt_cast_x_b <= dupName_64_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_63_ip_dsdk_adapt_bitselect_x(BITSELECT,142)
    dupName_63_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1039 downto 1024);

    -- dupName_63_ip_dsdk_adapt_cast_x(BITSELECT,143)
    dupName_63_ip_dsdk_adapt_cast_x_b <= dupName_63_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_62_ip_dsdk_adapt_bitselect_x(BITSELECT,140)
    dupName_62_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1023 downto 1008);

    -- dupName_62_ip_dsdk_adapt_cast_x(BITSELECT,141)
    dupName_62_ip_dsdk_adapt_cast_x_b <= dupName_62_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_61_ip_dsdk_adapt_bitselect_x(BITSELECT,138)
    dupName_61_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(1007 downto 992);

    -- dupName_61_ip_dsdk_adapt_cast_x(BITSELECT,139)
    dupName_61_ip_dsdk_adapt_cast_x_b <= dupName_61_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_60_ip_dsdk_adapt_bitselect_x(BITSELECT,136)
    dupName_60_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(991 downto 976);

    -- dupName_60_ip_dsdk_adapt_cast_x(BITSELECT,137)
    dupName_60_ip_dsdk_adapt_cast_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_59_ip_dsdk_adapt_bitselect_x(BITSELECT,134)
    dupName_59_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(975 downto 960);

    -- dupName_59_ip_dsdk_adapt_cast_x(BITSELECT,135)
    dupName_59_ip_dsdk_adapt_cast_x_b <= dupName_59_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_58_ip_dsdk_adapt_bitselect_x(BITSELECT,132)
    dupName_58_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(959 downto 944);

    -- dupName_58_ip_dsdk_adapt_cast_x(BITSELECT,133)
    dupName_58_ip_dsdk_adapt_cast_x_b <= dupName_58_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_57_ip_dsdk_adapt_bitselect_x(BITSELECT,130)
    dupName_57_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(943 downto 928);

    -- dupName_57_ip_dsdk_adapt_cast_x(BITSELECT,131)
    dupName_57_ip_dsdk_adapt_cast_x_b <= dupName_57_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_56_ip_dsdk_adapt_bitselect_x(BITSELECT,128)
    dupName_56_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(927 downto 912);

    -- dupName_56_ip_dsdk_adapt_cast_x(BITSELECT,129)
    dupName_56_ip_dsdk_adapt_cast_x_b <= dupName_56_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_55_ip_dsdk_adapt_bitselect_x(BITSELECT,126)
    dupName_55_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(911 downto 896);

    -- dupName_55_ip_dsdk_adapt_cast_x(BITSELECT,127)
    dupName_55_ip_dsdk_adapt_cast_x_b <= dupName_55_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_54_ip_dsdk_adapt_bitselect_x(BITSELECT,124)
    dupName_54_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(895 downto 880);

    -- dupName_54_ip_dsdk_adapt_cast_x(BITSELECT,125)
    dupName_54_ip_dsdk_adapt_cast_x_b <= dupName_54_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_53_ip_dsdk_adapt_bitselect_x(BITSELECT,122)
    dupName_53_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(879 downto 864);

    -- dupName_53_ip_dsdk_adapt_cast_x(BITSELECT,123)
    dupName_53_ip_dsdk_adapt_cast_x_b <= dupName_53_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_52_ip_dsdk_adapt_bitselect_x(BITSELECT,120)
    dupName_52_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(863 downto 848);

    -- dupName_52_ip_dsdk_adapt_cast_x(BITSELECT,121)
    dupName_52_ip_dsdk_adapt_cast_x_b <= dupName_52_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_51_ip_dsdk_adapt_bitselect_x(BITSELECT,118)
    dupName_51_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(847 downto 832);

    -- dupName_51_ip_dsdk_adapt_cast_x(BITSELECT,119)
    dupName_51_ip_dsdk_adapt_cast_x_b <= dupName_51_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_50_ip_dsdk_adapt_bitselect_x(BITSELECT,116)
    dupName_50_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(831 downto 816);

    -- dupName_50_ip_dsdk_adapt_cast_x(BITSELECT,117)
    dupName_50_ip_dsdk_adapt_cast_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_49_ip_dsdk_adapt_bitselect_x(BITSELECT,114)
    dupName_49_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(815 downto 800);

    -- dupName_49_ip_dsdk_adapt_cast_x(BITSELECT,115)
    dupName_49_ip_dsdk_adapt_cast_x_b <= dupName_49_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_48_ip_dsdk_adapt_bitselect_x(BITSELECT,112)
    dupName_48_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(799 downto 784);

    -- dupName_48_ip_dsdk_adapt_cast_x(BITSELECT,113)
    dupName_48_ip_dsdk_adapt_cast_x_b <= dupName_48_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_47_ip_dsdk_adapt_bitselect_x(BITSELECT,110)
    dupName_47_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(783 downto 768);

    -- dupName_47_ip_dsdk_adapt_cast_x(BITSELECT,111)
    dupName_47_ip_dsdk_adapt_cast_x_b <= dupName_47_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_46_ip_dsdk_adapt_bitselect_x(BITSELECT,108)
    dupName_46_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(767 downto 752);

    -- dupName_46_ip_dsdk_adapt_cast_x(BITSELECT,109)
    dupName_46_ip_dsdk_adapt_cast_x_b <= dupName_46_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_45_ip_dsdk_adapt_bitselect_x(BITSELECT,106)
    dupName_45_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(751 downto 736);

    -- dupName_45_ip_dsdk_adapt_cast_x(BITSELECT,107)
    dupName_45_ip_dsdk_adapt_cast_x_b <= dupName_45_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_44_ip_dsdk_adapt_bitselect_x(BITSELECT,104)
    dupName_44_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(735 downto 720);

    -- dupName_44_ip_dsdk_adapt_cast_x(BITSELECT,105)
    dupName_44_ip_dsdk_adapt_cast_x_b <= dupName_44_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_43_ip_dsdk_adapt_bitselect_x(BITSELECT,102)
    dupName_43_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(719 downto 704);

    -- dupName_43_ip_dsdk_adapt_cast_x(BITSELECT,103)
    dupName_43_ip_dsdk_adapt_cast_x_b <= dupName_43_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_42_ip_dsdk_adapt_bitselect_x(BITSELECT,100)
    dupName_42_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(703 downto 688);

    -- dupName_42_ip_dsdk_adapt_cast_x(BITSELECT,101)
    dupName_42_ip_dsdk_adapt_cast_x_b <= dupName_42_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_41_ip_dsdk_adapt_bitselect_x(BITSELECT,98)
    dupName_41_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(687 downto 672);

    -- dupName_41_ip_dsdk_adapt_cast_x(BITSELECT,99)
    dupName_41_ip_dsdk_adapt_cast_x_b <= dupName_41_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_40_ip_dsdk_adapt_bitselect_x(BITSELECT,96)
    dupName_40_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(671 downto 656);

    -- dupName_40_ip_dsdk_adapt_cast_x(BITSELECT,97)
    dupName_40_ip_dsdk_adapt_cast_x_b <= dupName_40_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_39_ip_dsdk_adapt_bitselect_x(BITSELECT,94)
    dupName_39_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(655 downto 640);

    -- dupName_39_ip_dsdk_adapt_cast_x(BITSELECT,95)
    dupName_39_ip_dsdk_adapt_cast_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_38_ip_dsdk_adapt_bitselect_x(BITSELECT,92)
    dupName_38_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(639 downto 624);

    -- dupName_38_ip_dsdk_adapt_cast_x(BITSELECT,93)
    dupName_38_ip_dsdk_adapt_cast_x_b <= dupName_38_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_37_ip_dsdk_adapt_bitselect_x(BITSELECT,90)
    dupName_37_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(623 downto 608);

    -- dupName_37_ip_dsdk_adapt_cast_x(BITSELECT,91)
    dupName_37_ip_dsdk_adapt_cast_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_36_ip_dsdk_adapt_bitselect_x(BITSELECT,88)
    dupName_36_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(607 downto 592);

    -- dupName_36_ip_dsdk_adapt_cast_x(BITSELECT,89)
    dupName_36_ip_dsdk_adapt_cast_x_b <= dupName_36_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,86)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(591 downto 576);

    -- dupName_35_ip_dsdk_adapt_cast_x(BITSELECT,87)
    dupName_35_ip_dsdk_adapt_cast_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,84)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(575 downto 560);

    -- dupName_34_ip_dsdk_adapt_cast_x(BITSELECT,85)
    dupName_34_ip_dsdk_adapt_cast_x_b <= dupName_34_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,82)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(559 downto 544);

    -- dupName_33_ip_dsdk_adapt_cast_x(BITSELECT,83)
    dupName_33_ip_dsdk_adapt_cast_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,80)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(543 downto 528);

    -- dupName_32_ip_dsdk_adapt_cast_x(BITSELECT,81)
    dupName_32_ip_dsdk_adapt_cast_x_b <= dupName_32_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,78)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(527 downto 512);

    -- dupName_31_ip_dsdk_adapt_cast_x(BITSELECT,79)
    dupName_31_ip_dsdk_adapt_cast_x_b <= dupName_31_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,76)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(511 downto 496);

    -- dupName_30_ip_dsdk_adapt_cast_x(BITSELECT,77)
    dupName_30_ip_dsdk_adapt_cast_x_b <= dupName_30_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,74)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(495 downto 480);

    -- dupName_29_ip_dsdk_adapt_cast_x(BITSELECT,75)
    dupName_29_ip_dsdk_adapt_cast_x_b <= dupName_29_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,72)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(479 downto 464);

    -- dupName_28_ip_dsdk_adapt_cast_x(BITSELECT,73)
    dupName_28_ip_dsdk_adapt_cast_x_b <= dupName_28_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,70)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(463 downto 448);

    -- dupName_27_ip_dsdk_adapt_cast_x(BITSELECT,71)
    dupName_27_ip_dsdk_adapt_cast_x_b <= dupName_27_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,68)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(447 downto 432);

    -- dupName_26_ip_dsdk_adapt_cast_x(BITSELECT,69)
    dupName_26_ip_dsdk_adapt_cast_x_b <= dupName_26_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,66)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(431 downto 416);

    -- dupName_25_ip_dsdk_adapt_cast_x(BITSELECT,67)
    dupName_25_ip_dsdk_adapt_cast_x_b <= dupName_25_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,64)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(415 downto 400);

    -- dupName_24_ip_dsdk_adapt_cast_x(BITSELECT,65)
    dupName_24_ip_dsdk_adapt_cast_x_b <= dupName_24_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,62)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(399 downto 384);

    -- dupName_23_ip_dsdk_adapt_cast_x(BITSELECT,63)
    dupName_23_ip_dsdk_adapt_cast_x_b <= dupName_23_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,60)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(383 downto 368);

    -- dupName_22_ip_dsdk_adapt_cast_x(BITSELECT,61)
    dupName_22_ip_dsdk_adapt_cast_x_b <= dupName_22_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,58)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(367 downto 352);

    -- dupName_21_ip_dsdk_adapt_cast_x(BITSELECT,59)
    dupName_21_ip_dsdk_adapt_cast_x_b <= dupName_21_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,56)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(351 downto 336);

    -- dupName_20_ip_dsdk_adapt_cast_x(BITSELECT,57)
    dupName_20_ip_dsdk_adapt_cast_x_b <= dupName_20_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,54)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(335 downto 320);

    -- dupName_19_ip_dsdk_adapt_cast_x(BITSELECT,55)
    dupName_19_ip_dsdk_adapt_cast_x_b <= dupName_19_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,52)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(319 downto 304);

    -- dupName_18_ip_dsdk_adapt_cast_x(BITSELECT,53)
    dupName_18_ip_dsdk_adapt_cast_x_b <= dupName_18_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,50)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(303 downto 288);

    -- dupName_17_ip_dsdk_adapt_cast_x(BITSELECT,51)
    dupName_17_ip_dsdk_adapt_cast_x_b <= dupName_17_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,48)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(287 downto 272);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,49)
    dupName_16_ip_dsdk_adapt_cast_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,46)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(271 downto 256);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,47)
    dupName_15_ip_dsdk_adapt_cast_x_b <= dupName_15_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,44)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(255 downto 240);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,45)
    dupName_14_ip_dsdk_adapt_cast_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,42)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(239 downto 224);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,43)
    dupName_13_ip_dsdk_adapt_cast_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,40)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(223 downto 208);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,41)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,38)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(207 downto 192);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,39)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,36)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(191 downto 176);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,37)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,34)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(175 downto 160);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,35)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,32)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(159 downto 144);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,33)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,30)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(143 downto 128);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,31)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,28)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(127 downto 112);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,29)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_6_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,25)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(111 downto 96);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,26)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,22)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(95 downto 80);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,23)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_4_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,18)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(79 downto 64);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,19)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,14)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(63 downto 48);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,15)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,10)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(47 downto 32);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,11)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,5)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(31 downto 16);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,231)
    ip_dsdk_adapt_bitselect_b <= i_load_memcoalesce_weights_load_0_memread166_o_readdata(15 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,232)
    ip_dsdk_adapt_cast_b <= ip_dsdk_adapt_bitselect_b(15 downto 0);

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x(BLACKBOX,222)@20000000
    -- out out_data_out_0@20000001
    -- out out_data_out_1@20000001
    -- out out_data_out_2@20000001
    -- out out_data_out_3@20000001
    -- out out_data_out_4@20000001
    -- out out_data_out_5@20000001
    -- out out_data_out_6@20000001
    -- out out_data_out_7@20000001
    -- out out_data_out_8@20000001
    -- out out_data_out_9@20000001
    -- out out_data_out_10@20000001
    -- out out_data_out_11@20000001
    -- out out_data_out_12@20000001
    -- out out_data_out_13@20000001
    -- out out_data_out_14@20000001
    -- out out_data_out_15@20000001
    -- out out_data_out_16@20000001
    -- out out_data_out_17@20000001
    -- out out_data_out_18@20000001
    -- out out_data_out_19@20000001
    -- out out_data_out_20@20000001
    -- out out_data_out_21@20000001
    -- out out_data_out_22@20000001
    -- out out_data_out_23@20000001
    -- out out_data_out_24@20000001
    -- out out_data_out_25@20000001
    -- out out_data_out_26@20000001
    -- out out_data_out_27@20000001
    -- out out_data_out_28@20000001
    -- out out_data_out_29@20000001
    -- out out_data_out_30@20000001
    -- out out_data_out_31@20000001
    -- out out_data_out_32@20000001
    -- out out_data_out_33@20000001
    -- out out_data_out_34@20000001
    -- out out_data_out_35@20000001
    -- out out_data_out_36@20000001
    -- out out_data_out_37@20000001
    -- out out_data_out_38@20000001
    -- out out_data_out_39@20000001
    -- out out_data_out_40@20000001
    -- out out_data_out_41@20000001
    -- out out_data_out_42@20000001
    -- out out_data_out_43@20000001
    -- out out_data_out_44@20000001
    -- out out_data_out_45@20000001
    -- out out_data_out_46@20000001
    -- out out_data_out_47@20000001
    -- out out_data_out_48@20000001
    -- out out_data_out_49@20000001
    -- out out_data_out_50@20000001
    -- out out_data_out_51@20000001
    -- out out_data_out_52@20000001
    -- out out_data_out_53@20000001
    -- out out_data_out_54@20000001
    -- out out_data_out_55@20000001
    -- out out_data_out_56@20000001
    -- out out_data_out_57@20000001
    -- out out_data_out_58@20000001
    -- out out_data_out_59@20000001
    -- out out_data_out_60@20000001
    -- out out_data_out_61@20000001
    -- out out_data_out_62@20000001
    -- out out_data_out_63@20000001
    -- out out_data_out_64@20000001
    -- out out_data_out_65@20000001
    -- out out_data_out_66@20000001
    -- out out_data_out_67@20000001
    -- out out_data_out_68@20000001
    -- out out_data_out_69@20000001
    -- out out_data_out_70@20000001
    -- out out_data_out_71@20000001
    -- out out_data_out_72@20000001
    -- out out_data_out_73@20000001
    -- out out_data_out_74@20000001
    -- out out_data_out_75@20000001
    -- out out_data_out_76@20000001
    -- out out_data_out_77@20000001
    -- out out_data_out_78@20000001
    -- out out_data_out_79@20000001
    -- out out_data_out_80@20000001
    -- out out_data_out_81@20000001
    -- out out_data_out_82@20000001
    -- out out_data_out_83@20000001
    -- out out_data_out_84@20000001
    -- out out_data_out_85@20000001
    -- out out_data_out_86@20000001
    -- out out_data_out_87@20000001
    -- out out_data_out_88@20000001
    -- out out_data_out_89@20000001
    -- out out_data_out_90@20000001
    -- out out_data_out_91@20000001
    -- out out_data_out_92@20000001
    -- out out_data_out_93@20000001
    -- out out_data_out_94@20000001
    -- out out_data_out_95@20000001
    -- out out_data_out_96@20000001
    -- out out_data_out_97@20000001
    -- out out_data_out_98@20000001
    -- out out_data_out_99@20000001
    -- out out_data_out_100@20000001
    -- out out_data_out_101@20000001
    -- out out_data_out_102@20000001
    -- out out_data_out_103@20000001
    -- out out_valid_out@20000001
    thereaddata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x : readdata_reg_memcoalesce_weights_load_0_memRead1
    PORT MAP (
        in_data_in_0 => ip_dsdk_adapt_cast_b,
        in_data_in_1 => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_data_in_2 => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_data_in_3 => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_data_in_4 => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_data_in_5 => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_data_in_6 => dupName_5_ip_dsdk_adapt_cast_x_b,
        in_data_in_7 => dupName_6_ip_dsdk_adapt_cast_x_b,
        in_data_in_8 => dupName_7_ip_dsdk_adapt_cast_x_b,
        in_data_in_9 => dupName_8_ip_dsdk_adapt_cast_x_b,
        in_data_in_10 => dupName_9_ip_dsdk_adapt_cast_x_b,
        in_data_in_11 => dupName_10_ip_dsdk_adapt_cast_x_b,
        in_data_in_12 => dupName_11_ip_dsdk_adapt_cast_x_b,
        in_data_in_13 => dupName_12_ip_dsdk_adapt_cast_x_b,
        in_data_in_14 => dupName_13_ip_dsdk_adapt_cast_x_b,
        in_data_in_15 => dupName_14_ip_dsdk_adapt_cast_x_b,
        in_data_in_16 => dupName_15_ip_dsdk_adapt_cast_x_b,
        in_data_in_17 => dupName_16_ip_dsdk_adapt_cast_x_b,
        in_data_in_18 => dupName_17_ip_dsdk_adapt_cast_x_b,
        in_data_in_19 => dupName_18_ip_dsdk_adapt_cast_x_b,
        in_data_in_20 => dupName_19_ip_dsdk_adapt_cast_x_b,
        in_data_in_21 => dupName_20_ip_dsdk_adapt_cast_x_b,
        in_data_in_22 => dupName_21_ip_dsdk_adapt_cast_x_b,
        in_data_in_23 => dupName_22_ip_dsdk_adapt_cast_x_b,
        in_data_in_24 => dupName_23_ip_dsdk_adapt_cast_x_b,
        in_data_in_25 => dupName_24_ip_dsdk_adapt_cast_x_b,
        in_data_in_26 => dupName_25_ip_dsdk_adapt_cast_x_b,
        in_data_in_27 => dupName_26_ip_dsdk_adapt_cast_x_b,
        in_data_in_28 => dupName_27_ip_dsdk_adapt_cast_x_b,
        in_data_in_29 => dupName_28_ip_dsdk_adapt_cast_x_b,
        in_data_in_30 => dupName_29_ip_dsdk_adapt_cast_x_b,
        in_data_in_31 => dupName_30_ip_dsdk_adapt_cast_x_b,
        in_data_in_32 => dupName_31_ip_dsdk_adapt_cast_x_b,
        in_data_in_33 => dupName_32_ip_dsdk_adapt_cast_x_b,
        in_data_in_34 => dupName_33_ip_dsdk_adapt_cast_x_b,
        in_data_in_35 => dupName_34_ip_dsdk_adapt_cast_x_b,
        in_data_in_36 => dupName_35_ip_dsdk_adapt_cast_x_b,
        in_data_in_37 => dupName_36_ip_dsdk_adapt_cast_x_b,
        in_data_in_38 => dupName_37_ip_dsdk_adapt_cast_x_b,
        in_data_in_39 => dupName_38_ip_dsdk_adapt_cast_x_b,
        in_data_in_40 => dupName_39_ip_dsdk_adapt_cast_x_b,
        in_data_in_41 => dupName_40_ip_dsdk_adapt_cast_x_b,
        in_data_in_42 => dupName_41_ip_dsdk_adapt_cast_x_b,
        in_data_in_43 => dupName_42_ip_dsdk_adapt_cast_x_b,
        in_data_in_44 => dupName_43_ip_dsdk_adapt_cast_x_b,
        in_data_in_45 => dupName_44_ip_dsdk_adapt_cast_x_b,
        in_data_in_46 => dupName_45_ip_dsdk_adapt_cast_x_b,
        in_data_in_47 => dupName_46_ip_dsdk_adapt_cast_x_b,
        in_data_in_48 => dupName_47_ip_dsdk_adapt_cast_x_b,
        in_data_in_49 => dupName_48_ip_dsdk_adapt_cast_x_b,
        in_data_in_50 => dupName_49_ip_dsdk_adapt_cast_x_b,
        in_data_in_51 => dupName_50_ip_dsdk_adapt_cast_x_b,
        in_data_in_52 => dupName_51_ip_dsdk_adapt_cast_x_b,
        in_data_in_53 => dupName_52_ip_dsdk_adapt_cast_x_b,
        in_data_in_54 => dupName_53_ip_dsdk_adapt_cast_x_b,
        in_data_in_55 => dupName_54_ip_dsdk_adapt_cast_x_b,
        in_data_in_56 => dupName_55_ip_dsdk_adapt_cast_x_b,
        in_data_in_57 => dupName_56_ip_dsdk_adapt_cast_x_b,
        in_data_in_58 => dupName_57_ip_dsdk_adapt_cast_x_b,
        in_data_in_59 => dupName_58_ip_dsdk_adapt_cast_x_b,
        in_data_in_60 => dupName_59_ip_dsdk_adapt_cast_x_b,
        in_data_in_61 => dupName_60_ip_dsdk_adapt_cast_x_b,
        in_data_in_62 => dupName_61_ip_dsdk_adapt_cast_x_b,
        in_data_in_63 => dupName_62_ip_dsdk_adapt_cast_x_b,
        in_data_in_64 => dupName_63_ip_dsdk_adapt_cast_x_b,
        in_data_in_65 => dupName_64_ip_dsdk_adapt_cast_x_b,
        in_data_in_66 => dupName_65_ip_dsdk_adapt_cast_x_b,
        in_data_in_67 => dupName_66_ip_dsdk_adapt_cast_x_b,
        in_data_in_68 => dupName_67_ip_dsdk_adapt_cast_x_b,
        in_data_in_69 => dupName_68_ip_dsdk_adapt_cast_x_b,
        in_data_in_70 => dupName_69_ip_dsdk_adapt_cast_x_b,
        in_data_in_71 => dupName_70_ip_dsdk_adapt_cast_x_b,
        in_data_in_72 => dupName_71_ip_dsdk_adapt_cast_x_b,
        in_data_in_73 => dupName_72_ip_dsdk_adapt_cast_x_b,
        in_data_in_74 => dupName_73_ip_dsdk_adapt_cast_x_b,
        in_data_in_75 => dupName_74_ip_dsdk_adapt_cast_x_b,
        in_data_in_76 => dupName_75_ip_dsdk_adapt_cast_x_b,
        in_data_in_77 => dupName_76_ip_dsdk_adapt_cast_x_b,
        in_data_in_78 => dupName_77_ip_dsdk_adapt_cast_x_b,
        in_data_in_79 => dupName_78_ip_dsdk_adapt_cast_x_b,
        in_data_in_80 => dupName_79_ip_dsdk_adapt_cast_x_b,
        in_data_in_81 => dupName_80_ip_dsdk_adapt_cast_x_b,
        in_data_in_82 => dupName_81_ip_dsdk_adapt_cast_x_b,
        in_data_in_83 => dupName_82_ip_dsdk_adapt_cast_x_b,
        in_data_in_84 => dupName_83_ip_dsdk_adapt_cast_x_b,
        in_data_in_85 => dupName_84_ip_dsdk_adapt_cast_x_b,
        in_data_in_86 => dupName_85_ip_dsdk_adapt_cast_x_b,
        in_data_in_87 => dupName_86_ip_dsdk_adapt_cast_x_b,
        in_data_in_88 => dupName_87_ip_dsdk_adapt_cast_x_b,
        in_data_in_89 => dupName_88_ip_dsdk_adapt_cast_x_b,
        in_data_in_90 => dupName_89_ip_dsdk_adapt_cast_x_b,
        in_data_in_91 => dupName_90_ip_dsdk_adapt_cast_x_b,
        in_data_in_92 => dupName_91_ip_dsdk_adapt_cast_x_b,
        in_data_in_93 => dupName_92_ip_dsdk_adapt_cast_x_b,
        in_data_in_94 => dupName_93_ip_dsdk_adapt_cast_x_b,
        in_data_in_95 => dupName_94_ip_dsdk_adapt_cast_x_b,
        in_data_in_96 => dupName_95_ip_dsdk_adapt_cast_x_b,
        in_data_in_97 => dupName_96_ip_dsdk_adapt_cast_x_b,
        in_data_in_98 => dupName_97_ip_dsdk_adapt_cast_x_b,
        in_data_in_99 => dupName_98_ip_dsdk_adapt_cast_x_b,
        in_data_in_100 => dupName_99_ip_dsdk_adapt_cast_x_b,
        in_data_in_101 => dupName_100_ip_dsdk_adapt_cast_x_b,
        in_data_in_102 => dupName_101_ip_dsdk_adapt_cast_x_b,
        in_data_in_103 => dupName_102_ip_dsdk_adapt_cast_x_b,
        in_stall_in => in_i_stall,
        in_valid_in => i_load_memcoalesce_weights_load_0_memread166_o_valid,
        out_data_out_0 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_0,
        out_data_out_1 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_1,
        out_data_out_2 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_2,
        out_data_out_3 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_3,
        out_data_out_4 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_4,
        out_data_out_5 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_5,
        out_data_out_6 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_6,
        out_data_out_7 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_7,
        out_data_out_8 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_8,
        out_data_out_9 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_9,
        out_data_out_10 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_10,
        out_data_out_11 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_11,
        out_data_out_12 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_12,
        out_data_out_13 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_13,
        out_data_out_14 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_14,
        out_data_out_15 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_15,
        out_data_out_16 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_16,
        out_data_out_17 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_17,
        out_data_out_18 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_18,
        out_data_out_19 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_19,
        out_data_out_20 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_20,
        out_data_out_21 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_21,
        out_data_out_22 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_22,
        out_data_out_23 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_23,
        out_data_out_24 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_24,
        out_data_out_25 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_25,
        out_data_out_26 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_26,
        out_data_out_27 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_27,
        out_data_out_28 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_28,
        out_data_out_29 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_29,
        out_data_out_30 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_30,
        out_data_out_31 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_31,
        out_data_out_32 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_32,
        out_data_out_33 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_33,
        out_data_out_34 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_34,
        out_data_out_35 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_35,
        out_data_out_36 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_36,
        out_data_out_37 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_37,
        out_data_out_38 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_38,
        out_data_out_39 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_39,
        out_data_out_40 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_40,
        out_data_out_41 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_41,
        out_data_out_42 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_42,
        out_data_out_43 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_43,
        out_data_out_44 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_44,
        out_data_out_45 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_45,
        out_data_out_46 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_46,
        out_data_out_47 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_47,
        out_data_out_48 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_48,
        out_data_out_49 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_49,
        out_data_out_50 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_50,
        out_data_out_51 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_51,
        out_data_out_52 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_52,
        out_data_out_53 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_53,
        out_data_out_54 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_54,
        out_data_out_55 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_55,
        out_data_out_56 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_56,
        out_data_out_57 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_57,
        out_data_out_58 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_58,
        out_data_out_59 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_59,
        out_data_out_60 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_60,
        out_data_out_61 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_61,
        out_data_out_62 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_62,
        out_data_out_63 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_63,
        out_data_out_64 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_64,
        out_data_out_65 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_65,
        out_data_out_66 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_66,
        out_data_out_67 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_67,
        out_data_out_68 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_68,
        out_data_out_69 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_69,
        out_data_out_70 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_70,
        out_data_out_71 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_71,
        out_data_out_72 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_72,
        out_data_out_73 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_73,
        out_data_out_74 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_74,
        out_data_out_75 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_75,
        out_data_out_76 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_76,
        out_data_out_77 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_77,
        out_data_out_78 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_78,
        out_data_out_79 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_79,
        out_data_out_80 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_80,
        out_data_out_81 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_81,
        out_data_out_82 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_82,
        out_data_out_83 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_83,
        out_data_out_84 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_84,
        out_data_out_85 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_85,
        out_data_out_86 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_86,
        out_data_out_87 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_87,
        out_data_out_88 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_88,
        out_data_out_89 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_89,
        out_data_out_90 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_90,
        out_data_out_91 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_91,
        out_data_out_92 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_92,
        out_data_out_93 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_93,
        out_data_out_94 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_94,
        out_data_out_95 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_95,
        out_data_out_96 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_96,
        out_data_out_97 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_97,
        out_data_out_98 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_98,
        out_data_out_99 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_99,
        out_data_out_100 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_100,
        out_data_out_101 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_101,
        out_data_out_102 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_102,
        out_data_out_103 => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_103,
        out_stall_out => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_stall_out,
        out_valid_out => readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@268
    out_o_readdata_0 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_0;
    out_o_readdata_1 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_1;
    out_o_readdata_2 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_2;
    out_o_readdata_3 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_3;
    out_o_readdata_4 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_4;
    out_o_readdata_5 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_5;
    out_o_readdata_6 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_6;
    out_o_readdata_7 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_7;
    out_o_readdata_8 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_8;
    out_o_readdata_9 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_9;
    out_o_readdata_10 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_10;
    out_o_readdata_11 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_11;
    out_o_readdata_12 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_12;
    out_o_readdata_13 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_13;
    out_o_readdata_14 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_14;
    out_o_readdata_15 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_15;
    out_o_readdata_16 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_16;
    out_o_readdata_17 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_17;
    out_o_readdata_18 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_18;
    out_o_readdata_19 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_19;
    out_o_readdata_20 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_20;
    out_o_readdata_21 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_21;
    out_o_readdata_22 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_22;
    out_o_readdata_23 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_23;
    out_o_readdata_24 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_24;
    out_o_readdata_25 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_25;
    out_o_readdata_26 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_26;
    out_o_readdata_27 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_27;
    out_o_readdata_28 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_28;
    out_o_readdata_29 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_29;
    out_o_readdata_30 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_30;
    out_o_readdata_31 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_31;
    out_o_readdata_32 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_32;
    out_o_readdata_33 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_33;
    out_o_readdata_34 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_34;
    out_o_readdata_35 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_35;
    out_o_readdata_36 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_36;
    out_o_readdata_37 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_37;
    out_o_readdata_38 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_38;
    out_o_readdata_39 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_39;
    out_o_readdata_40 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_40;
    out_o_readdata_41 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_41;
    out_o_readdata_42 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_42;
    out_o_readdata_43 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_43;
    out_o_readdata_44 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_44;
    out_o_readdata_45 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_45;
    out_o_readdata_46 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_46;
    out_o_readdata_47 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_47;
    out_o_readdata_48 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_48;
    out_o_readdata_49 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_49;
    out_o_readdata_50 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_50;
    out_o_readdata_51 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_51;
    out_o_readdata_52 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_52;
    out_o_readdata_53 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_53;
    out_o_readdata_54 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_54;
    out_o_readdata_55 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_55;
    out_o_readdata_56 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_56;
    out_o_readdata_57 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_57;
    out_o_readdata_58 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_58;
    out_o_readdata_59 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_59;
    out_o_readdata_60 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_60;
    out_o_readdata_61 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_61;
    out_o_readdata_62 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_62;
    out_o_readdata_63 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_63;
    out_o_readdata_64 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_64;
    out_o_readdata_65 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_65;
    out_o_readdata_66 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_66;
    out_o_readdata_67 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_67;
    out_o_readdata_68 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_68;
    out_o_readdata_69 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_69;
    out_o_readdata_70 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_70;
    out_o_readdata_71 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_71;
    out_o_readdata_72 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_72;
    out_o_readdata_73 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_73;
    out_o_readdata_74 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_74;
    out_o_readdata_75 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_75;
    out_o_readdata_76 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_76;
    out_o_readdata_77 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_77;
    out_o_readdata_78 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_78;
    out_o_readdata_79 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_79;
    out_o_readdata_80 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_80;
    out_o_readdata_81 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_81;
    out_o_readdata_82 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_82;
    out_o_readdata_83 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_83;
    out_o_readdata_84 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_84;
    out_o_readdata_85 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_85;
    out_o_readdata_86 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_86;
    out_o_readdata_87 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_87;
    out_o_readdata_88 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_88;
    out_o_readdata_89 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_89;
    out_o_readdata_90 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_90;
    out_o_readdata_91 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_91;
    out_o_readdata_92 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_92;
    out_o_readdata_93 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_93;
    out_o_readdata_94 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_94;
    out_o_readdata_95 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_95;
    out_o_readdata_96 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_96;
    out_o_readdata_97 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_97;
    out_o_readdata_98 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_98;
    out_o_readdata_99 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_99;
    out_o_readdata_100 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_100;
    out_o_readdata_101 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_101;
    out_o_readdata_102 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_102;
    out_o_readdata_103 <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_data_out_103;
    out_o_valid <= readdata_reg_memcoalesce_weights_load_0_memRead1_aunroll_x_out_valid_out;

    -- dupName_0_regfree_osync_x(GPOUT,8)
    out_memcoalesce_weights_load_0_avm_burstcount <= i_load_memcoalesce_weights_load_0_memread166_avm_burstcount;

    -- dupName_1_regfree_osync_x(GPOUT,13)
    out_memcoalesce_weights_load_0_avm_byteenable <= i_load_memcoalesce_weights_load_0_memread166_avm_byteenable;

    -- dupName_2_regfree_osync_x(GPOUT,17)
    out_memcoalesce_weights_load_0_avm_enable <= i_load_memcoalesce_weights_load_0_memread166_avm_enable;

    -- dupName_3_regfree_osync_x(GPOUT,21)
    out_memcoalesce_weights_load_0_avm_read <= i_load_memcoalesce_weights_load_0_memread166_avm_read;

    -- dupName_4_regfree_osync_x(GPOUT,24)
    out_memcoalesce_weights_load_0_avm_write <= i_load_memcoalesce_weights_load_0_memread166_avm_write;

    -- dupName_5_regfree_osync_x(GPOUT,27)
    out_memcoalesce_weights_load_0_avm_writedata <= i_load_memcoalesce_weights_load_0_memread166_avm_writedata;

    -- regfree_osync(GPOUT,234)
    out_memcoalesce_weights_load_0_avm_address <= i_load_memcoalesce_weights_load_0_memread166_avm_address;

    -- sync_out(GPOUT,236)@20000000
    out_o_stall <= i_load_memcoalesce_weights_load_0_memread166_o_stall;

END normal;
