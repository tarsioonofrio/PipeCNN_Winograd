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

-- VHDL created from readdata_reg_memcoalesce_weights_load_0_memRead1
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

entity readdata_reg_memcoalesce_weights_load_0_memRead1 is
    port (
        in_data_in_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_4 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_5 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_6 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_7 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_8 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_9 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_10 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_11 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_12 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_13 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_14 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_15 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_16 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_17 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_18 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_19 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_20 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_21 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_22 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_23 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_24 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_25 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_26 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_27 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_28 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_29 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_30 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_31 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_32 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_33 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_34 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_35 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_36 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_37 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_38 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_39 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_40 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_41 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_42 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_43 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_44 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_45 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_46 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_47 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_48 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_49 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_50 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_51 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_52 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_53 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_54 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_55 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_56 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_57 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_58 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_59 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_60 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_61 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_62 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_63 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_64 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_65 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_66 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_67 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_68 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_69 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_70 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_71 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_72 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_73 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_74 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_75 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_76 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_77 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_78 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_79 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_80 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_81 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_82 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_83 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_84 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_85 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_86 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_87 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_88 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_89 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_90 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_91 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_92 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_93 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_94 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_95 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_96 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_97 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_98 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_99 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_100 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_101 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_102 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_103 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_4 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_5 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_6 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_7 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_8 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_9 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_10 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_11 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_12 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_13 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_14 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_15 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_16 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_17 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_19 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_20 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_21 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_22 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_23 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_24 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_25 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_26 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_27 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_28 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_29 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_30 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_31 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_32 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_33 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_34 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_35 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_36 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_37 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_38 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_39 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_40 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_41 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_42 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_43 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_44 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_45 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_46 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_47 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_48 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_49 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_50 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_51 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_52 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_53 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_54 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_55 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_56 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_57 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_58 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_59 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_60 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_61 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_62 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_63 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_64 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_65 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_66 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_67 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_68 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_69 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_70 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_71 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_72 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_73 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_74 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_75 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_76 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_77 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_78 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_79 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_80 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_81 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_82 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_83 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_84 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_85 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_86 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_87 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_88 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_89 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_90 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_91 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_92 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_93 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_94 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_95 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_96 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_97 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_98 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_99 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_100 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_101 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_102 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_103 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end readdata_reg_memcoalesce_weights_load_0_memRead1;

architecture normal of readdata_reg_memcoalesce_weights_load_0_memRead1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_0_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_1_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_2_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_3_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_4_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_5_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_6_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_7_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_8_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_9_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_10_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_11_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_12_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_13_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_14_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_15_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_16_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_17_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_18_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_19_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_20_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_21_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_22_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_23_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_24_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_25_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_26_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_27_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_28_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_29_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_30_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_31_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_32_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_33_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_34_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_35_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_36_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_37_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_38_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_39_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_40_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_41_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_42_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_43_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_44_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_45_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_46_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_47_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_48_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_49_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_50_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_51_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_52_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_53_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_54_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_55_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_56_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_57_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_58_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_59_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_60_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_61_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_62_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_63_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_64_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_65_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_66_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_67_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_68_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_69_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_70_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_71_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_72_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_73_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_74_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_75_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_76_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_77_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_78_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_79_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_80_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_81_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_82_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_83_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_84_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_85_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_86_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_87_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_88_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_89_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_90_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_91_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_92_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_93_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_94_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_95_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_96_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_97_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_98_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_99_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_100_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_101_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_102_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_103_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_and_stall_in_q : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- stall_in_not(LOGICAL,111)
    stall_in_not_q <= not (in_stall_in);

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_not(LOGICAL,110)
    readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_not_q <= not (readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q);

    -- stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg(LOGICAL,112)
    stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q <= readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_not_q or stall_in_not_q;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg(REG,108)
    readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q <= in_valid_in;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_103_x(REG,107)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_103_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_103_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_103_x_q <= in_data_in_103;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_102_x(REG,106)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_102_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_102_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_102_x_q <= in_data_in_102;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_101_x(REG,105)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_101_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_101_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_101_x_q <= in_data_in_101;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_100_x(REG,104)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_100_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_100_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_100_x_q <= in_data_in_100;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_99_x(REG,103)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_99_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_99_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_99_x_q <= in_data_in_99;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_98_x(REG,102)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_98_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_98_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_98_x_q <= in_data_in_98;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_97_x(REG,101)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_97_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_97_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_97_x_q <= in_data_in_97;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_96_x(REG,100)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_96_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_96_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_96_x_q <= in_data_in_96;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_95_x(REG,99)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_95_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_95_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_95_x_q <= in_data_in_95;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_94_x(REG,98)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_94_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_94_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_94_x_q <= in_data_in_94;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_93_x(REG,97)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_93_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_93_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_93_x_q <= in_data_in_93;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_92_x(REG,96)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_92_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_92_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_92_x_q <= in_data_in_92;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_91_x(REG,95)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_91_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_91_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_91_x_q <= in_data_in_91;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_90_x(REG,94)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_90_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_90_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_90_x_q <= in_data_in_90;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_89_x(REG,93)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_89_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_89_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_89_x_q <= in_data_in_89;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_88_x(REG,92)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_88_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_88_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_88_x_q <= in_data_in_88;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_87_x(REG,91)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_87_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_87_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_87_x_q <= in_data_in_87;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_86_x(REG,90)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_86_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_86_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_86_x_q <= in_data_in_86;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_85_x(REG,89)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_85_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_85_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_85_x_q <= in_data_in_85;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_84_x(REG,88)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_84_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_84_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_84_x_q <= in_data_in_84;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_83_x(REG,87)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_83_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_83_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_83_x_q <= in_data_in_83;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_82_x(REG,86)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_82_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_82_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_82_x_q <= in_data_in_82;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_81_x(REG,85)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_81_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_81_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_81_x_q <= in_data_in_81;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_80_x(REG,84)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_80_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_80_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_80_x_q <= in_data_in_80;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_79_x(REG,83)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_79_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_79_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_79_x_q <= in_data_in_79;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_78_x(REG,82)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_78_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_78_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_78_x_q <= in_data_in_78;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_77_x(REG,81)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_77_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_77_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_77_x_q <= in_data_in_77;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_76_x(REG,80)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_76_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_76_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_76_x_q <= in_data_in_76;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_75_x(REG,79)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_75_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_75_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_75_x_q <= in_data_in_75;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_74_x(REG,78)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_74_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_74_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_74_x_q <= in_data_in_74;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_73_x(REG,77)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_73_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_73_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_73_x_q <= in_data_in_73;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_72_x(REG,76)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_72_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_72_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_72_x_q <= in_data_in_72;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_71_x(REG,75)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_71_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_71_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_71_x_q <= in_data_in_71;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_70_x(REG,74)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_70_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_70_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_70_x_q <= in_data_in_70;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_69_x(REG,73)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_69_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_69_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_69_x_q <= in_data_in_69;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_68_x(REG,72)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_68_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_68_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_68_x_q <= in_data_in_68;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_67_x(REG,71)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_67_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_67_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_67_x_q <= in_data_in_67;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_66_x(REG,70)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_66_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_66_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_66_x_q <= in_data_in_66;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_65_x(REG,69)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_65_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_65_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_65_x_q <= in_data_in_65;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_64_x(REG,68)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_64_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_64_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_64_x_q <= in_data_in_64;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_63_x(REG,67)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_63_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_63_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_63_x_q <= in_data_in_63;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_62_x(REG,66)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_62_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_62_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_62_x_q <= in_data_in_62;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_61_x(REG,65)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_61_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_61_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_61_x_q <= in_data_in_61;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_60_x(REG,64)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_60_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_60_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_60_x_q <= in_data_in_60;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_59_x(REG,63)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_59_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_59_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_59_x_q <= in_data_in_59;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_58_x(REG,62)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_58_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_58_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_58_x_q <= in_data_in_58;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_57_x(REG,61)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_57_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_57_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_57_x_q <= in_data_in_57;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_56_x(REG,60)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_56_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_56_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_56_x_q <= in_data_in_56;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_55_x(REG,59)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_55_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_55_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_55_x_q <= in_data_in_55;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_54_x(REG,58)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_54_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_54_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_54_x_q <= in_data_in_54;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_53_x(REG,57)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_53_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_53_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_53_x_q <= in_data_in_53;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_52_x(REG,56)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_52_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_52_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_52_x_q <= in_data_in_52;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_51_x(REG,55)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_51_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_51_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_51_x_q <= in_data_in_51;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_50_x(REG,54)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_50_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_50_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_50_x_q <= in_data_in_50;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_49_x(REG,53)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_49_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_49_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_49_x_q <= in_data_in_49;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_48_x(REG,52)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_48_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_48_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_48_x_q <= in_data_in_48;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_47_x(REG,51)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_47_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_47_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_47_x_q <= in_data_in_47;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_46_x(REG,50)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_46_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_46_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_46_x_q <= in_data_in_46;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_45_x(REG,49)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_45_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_45_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_45_x_q <= in_data_in_45;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_44_x(REG,48)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_44_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_44_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_44_x_q <= in_data_in_44;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_43_x(REG,47)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_43_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_43_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_43_x_q <= in_data_in_43;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_42_x(REG,46)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_42_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_42_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_42_x_q <= in_data_in_42;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_41_x(REG,45)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_41_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_41_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_41_x_q <= in_data_in_41;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_40_x(REG,44)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_40_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_40_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_40_x_q <= in_data_in_40;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_39_x(REG,43)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_39_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_39_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_39_x_q <= in_data_in_39;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_38_x(REG,42)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_38_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_38_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_38_x_q <= in_data_in_38;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_37_x(REG,41)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_37_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_37_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_37_x_q <= in_data_in_37;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_36_x(REG,40)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_36_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_36_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_36_x_q <= in_data_in_36;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_35_x(REG,39)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_35_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_35_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_35_x_q <= in_data_in_35;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_34_x(REG,38)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_34_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_34_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_34_x_q <= in_data_in_34;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_33_x(REG,37)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_33_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_33_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_33_x_q <= in_data_in_33;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_32_x(REG,36)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_32_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_32_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_32_x_q <= in_data_in_32;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_31_x(REG,35)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_31_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_31_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_31_x_q <= in_data_in_31;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_30_x(REG,34)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_30_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_30_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_30_x_q <= in_data_in_30;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_29_x(REG,33)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_29_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_29_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_29_x_q <= in_data_in_29;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_28_x(REG,32)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_28_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_28_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_28_x_q <= in_data_in_28;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_27_x(REG,31)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_27_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_27_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_27_x_q <= in_data_in_27;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_26_x(REG,30)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_26_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_26_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_26_x_q <= in_data_in_26;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_25_x(REG,29)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_25_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_25_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_25_x_q <= in_data_in_25;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_24_x(REG,28)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_24_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_24_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_24_x_q <= in_data_in_24;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_23_x(REG,27)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_23_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_23_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_23_x_q <= in_data_in_23;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_22_x(REG,26)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_22_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_22_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_22_x_q <= in_data_in_22;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_21_x(REG,25)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_21_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_21_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_21_x_q <= in_data_in_21;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_20_x(REG,24)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_20_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_20_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_20_x_q <= in_data_in_20;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_19_x(REG,23)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_19_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_19_x_q <= in_data_in_19;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_18_x(REG,22)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_18_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_18_x_q <= in_data_in_18;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_17_x(REG,21)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_17_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_17_x_q <= in_data_in_17;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_16_x(REG,20)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_16_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_16_x_q <= in_data_in_16;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_15_x(REG,19)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_15_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_15_x_q <= in_data_in_15;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_14_x(REG,18)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_14_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_14_x_q <= in_data_in_14;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_13_x(REG,17)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_13_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_13_x_q <= in_data_in_13;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_12_x(REG,16)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_12_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_12_x_q <= in_data_in_12;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_11_x(REG,15)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_11_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_11_x_q <= in_data_in_11;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_10_x(REG,14)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_10_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_10_x_q <= in_data_in_10;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_9_x(REG,13)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_9_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_9_x_q <= in_data_in_9;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_8_x(REG,12)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_8_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_8_x_q <= in_data_in_8;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_7_x(REG,11)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_7_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_7_x_q <= in_data_in_7;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_6_x(REG,10)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_6_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_6_x_q <= in_data_in_6;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_5_x(REG,9)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_5_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_5_x_q <= in_data_in_5;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_4_x(REG,8)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_4_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_4_x_q <= in_data_in_4;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_3_x(REG,7)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_3_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_3_x_q <= in_data_in_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_2_x(REG,6)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_2_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_2_x_q <= in_data_in_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_1_x(REG,5)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_1_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_1_x_q <= in_data_in_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_0_x(REG,4)
    readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_0_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_0_x_q <= in_data_in_0;
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000001
    out_data_out_0 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_0_x_q;
    out_data_out_1 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_1_x_q;
    out_data_out_2 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_2_x_q;
    out_data_out_3 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_3_x_q;
    out_data_out_4 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_4_x_q;
    out_data_out_5 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_5_x_q;
    out_data_out_6 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_6_x_q;
    out_data_out_7 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_7_x_q;
    out_data_out_8 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_8_x_q;
    out_data_out_9 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_9_x_q;
    out_data_out_10 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_10_x_q;
    out_data_out_11 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_11_x_q;
    out_data_out_12 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_12_x_q;
    out_data_out_13 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_13_x_q;
    out_data_out_14 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_14_x_q;
    out_data_out_15 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_15_x_q;
    out_data_out_16 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_16_x_q;
    out_data_out_17 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_17_x_q;
    out_data_out_18 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_18_x_q;
    out_data_out_19 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_19_x_q;
    out_data_out_20 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_20_x_q;
    out_data_out_21 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_21_x_q;
    out_data_out_22 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_22_x_q;
    out_data_out_23 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_23_x_q;
    out_data_out_24 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_24_x_q;
    out_data_out_25 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_25_x_q;
    out_data_out_26 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_26_x_q;
    out_data_out_27 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_27_x_q;
    out_data_out_28 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_28_x_q;
    out_data_out_29 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_29_x_q;
    out_data_out_30 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_30_x_q;
    out_data_out_31 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_31_x_q;
    out_data_out_32 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_32_x_q;
    out_data_out_33 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_33_x_q;
    out_data_out_34 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_34_x_q;
    out_data_out_35 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_35_x_q;
    out_data_out_36 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_36_x_q;
    out_data_out_37 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_37_x_q;
    out_data_out_38 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_38_x_q;
    out_data_out_39 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_39_x_q;
    out_data_out_40 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_40_x_q;
    out_data_out_41 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_41_x_q;
    out_data_out_42 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_42_x_q;
    out_data_out_43 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_43_x_q;
    out_data_out_44 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_44_x_q;
    out_data_out_45 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_45_x_q;
    out_data_out_46 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_46_x_q;
    out_data_out_47 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_47_x_q;
    out_data_out_48 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_48_x_q;
    out_data_out_49 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_49_x_q;
    out_data_out_50 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_50_x_q;
    out_data_out_51 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_51_x_q;
    out_data_out_52 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_52_x_q;
    out_data_out_53 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_53_x_q;
    out_data_out_54 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_54_x_q;
    out_data_out_55 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_55_x_q;
    out_data_out_56 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_56_x_q;
    out_data_out_57 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_57_x_q;
    out_data_out_58 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_58_x_q;
    out_data_out_59 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_59_x_q;
    out_data_out_60 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_60_x_q;
    out_data_out_61 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_61_x_q;
    out_data_out_62 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_62_x_q;
    out_data_out_63 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_63_x_q;
    out_data_out_64 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_64_x_q;
    out_data_out_65 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_65_x_q;
    out_data_out_66 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_66_x_q;
    out_data_out_67 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_67_x_q;
    out_data_out_68 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_68_x_q;
    out_data_out_69 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_69_x_q;
    out_data_out_70 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_70_x_q;
    out_data_out_71 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_71_x_q;
    out_data_out_72 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_72_x_q;
    out_data_out_73 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_73_x_q;
    out_data_out_74 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_74_x_q;
    out_data_out_75 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_75_x_q;
    out_data_out_76 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_76_x_q;
    out_data_out_77 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_77_x_q;
    out_data_out_78 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_78_x_q;
    out_data_out_79 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_79_x_q;
    out_data_out_80 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_80_x_q;
    out_data_out_81 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_81_x_q;
    out_data_out_82 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_82_x_q;
    out_data_out_83 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_83_x_q;
    out_data_out_84 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_84_x_q;
    out_data_out_85 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_85_x_q;
    out_data_out_86 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_86_x_q;
    out_data_out_87 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_87_x_q;
    out_data_out_88 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_88_x_q;
    out_data_out_89 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_89_x_q;
    out_data_out_90 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_90_x_q;
    out_data_out_91 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_91_x_q;
    out_data_out_92 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_92_x_q;
    out_data_out_93 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_93_x_q;
    out_data_out_94 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_94_x_q;
    out_data_out_95 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_95_x_q;
    out_data_out_96 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_96_x_q;
    out_data_out_97 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_97_x_q;
    out_data_out_98 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_98_x_q;
    out_data_out_99 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_99_x_q;
    out_data_out_100 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_100_x_q;
    out_data_out_101 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_101_x_q;
    out_data_out_102 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_102_x_q;
    out_data_out_103 <= readdata_reg_memcoalesce_weights_load_0_memRead1_data_reg_103_x_q;
    out_valid_out <= readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q;

    -- readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_and_stall_in(LOGICAL,109)
    readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_and_stall_in_q <= readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_q and in_stall_in;

    -- sync_out(GPOUT,114)@20000000
    out_stall_out <= readdata_reg_memcoalesce_weights_load_0_memRead1_valid_reg_and_stall_in_q;

END normal;
