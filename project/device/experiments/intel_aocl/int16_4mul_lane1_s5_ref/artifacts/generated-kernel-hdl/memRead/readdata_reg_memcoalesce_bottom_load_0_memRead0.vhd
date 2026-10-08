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

-- VHDL created from readdata_reg_memcoalesce_bottom_load_0_memRead0
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

entity readdata_reg_memcoalesce_bottom_load_0_memRead0 is
    port (
        in_data_in_0_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_1_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_2_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_3_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_4_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_5_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_6_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_7_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_8_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_9_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_10_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_11_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_12_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_13_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_14_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_15_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_0_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_1_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_2_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_3_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_4_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_5_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_6_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_7_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_8_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_9_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_10_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_11_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_12_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_13_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_14_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_15_1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_0_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_1_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_2_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_3_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_4_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_5_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_6_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_7_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_8_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_9_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_10_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_11_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_12_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_13_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_14_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_15_2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_0_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_1_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_2_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_3_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_4_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_5_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_6_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_7_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_8_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_9_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_10_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_11_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_12_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_13_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_14_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_15_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_1_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_2_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_3_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_4_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_5_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_6_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_7_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_8_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_9_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_10_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_11_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_12_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_13_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_14_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_15_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_0_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_1_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_2_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_3_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_4_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_5_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_6_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_7_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_8_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_9_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_10_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_11_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_12_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_13_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_14_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_15_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_0_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_1_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_2_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_3_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_4_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_5_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_6_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_7_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_8_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_9_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_10_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_11_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_12_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_13_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_14_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_15_2 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_0_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_1_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_2_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_3_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_4_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_5_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_6_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_7_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_8_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_9_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_10_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_11_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_12_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_13_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_14_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_15_3 : out std_logic_vector(15 downto 0);  -- ufix16
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end readdata_reg_memcoalesce_bottom_load_0_memRead0;

architecture normal of readdata_reg_memcoalesce_bottom_load_0_memRead0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_0_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_1_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_2_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_3_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_4_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_5_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_6_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_7_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_8_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_9_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_10_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_11_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_12_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_13_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_14_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_15_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_0_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_1_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_2_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_3_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_4_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_5_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_6_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_7_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_8_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_9_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_10_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_11_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_12_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_13_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_14_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_15_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_0_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_1_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_2_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_3_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_4_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_5_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_6_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_7_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_8_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_9_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_10_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_11_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_12_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_13_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_14_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_15_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_0_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_1_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_2_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_3_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_4_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_5_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_6_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_7_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_8_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_9_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_10_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_11_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_12_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_13_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_14_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_15_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_and_stall_in_q : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- stall_in_not(LOGICAL,71)
    stall_in_not_q <= not (in_stall_in);

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_not(LOGICAL,70)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_not_q <= not (readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q);

    -- stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg(LOGICAL,72)
    stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q <= readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_not_q or stall_in_not_q;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg(REG,68)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q <= in_valid_in;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_15_x(REG,67)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_15_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_15_x_q <= in_data_in_15_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_14_x(REG,66)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_14_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_14_x_q <= in_data_in_14_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_13_x(REG,65)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_13_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_13_x_q <= in_data_in_13_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_12_x(REG,64)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_12_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_12_x_q <= in_data_in_12_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_11_x(REG,63)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_11_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_11_x_q <= in_data_in_11_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_10_x(REG,62)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_10_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_10_x_q <= in_data_in_10_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_9_x(REG,61)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_9_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_9_x_q <= in_data_in_9_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_8_x(REG,60)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_8_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_8_x_q <= in_data_in_8_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_7_x(REG,59)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_7_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_7_x_q <= in_data_in_7_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_6_x(REG,58)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_6_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_6_x_q <= in_data_in_6_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_5_x(REG,57)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_5_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_5_x_q <= in_data_in_5_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_4_x(REG,56)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_4_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_4_x_q <= in_data_in_4_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_3_x(REG,55)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_3_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_3_x_q <= in_data_in_3_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_2_x(REG,54)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_2_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_2_x_q <= in_data_in_2_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_1_x(REG,53)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_1_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_1_x_q <= in_data_in_1_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_0_x(REG,52)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_0_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_0_x_q <= in_data_in_0_3;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_15_x(REG,51)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_15_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_15_x_q <= in_data_in_15_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_14_x(REG,50)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_14_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_14_x_q <= in_data_in_14_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_13_x(REG,49)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_13_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_13_x_q <= in_data_in_13_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_12_x(REG,48)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_12_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_12_x_q <= in_data_in_12_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_11_x(REG,47)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_11_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_11_x_q <= in_data_in_11_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_10_x(REG,46)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_10_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_10_x_q <= in_data_in_10_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_9_x(REG,45)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_9_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_9_x_q <= in_data_in_9_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_8_x(REG,44)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_8_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_8_x_q <= in_data_in_8_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_7_x(REG,43)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_7_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_7_x_q <= in_data_in_7_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_6_x(REG,42)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_6_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_6_x_q <= in_data_in_6_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_5_x(REG,41)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_5_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_5_x_q <= in_data_in_5_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_4_x(REG,40)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_4_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_4_x_q <= in_data_in_4_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_3_x(REG,39)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_3_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_3_x_q <= in_data_in_3_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_2_x(REG,38)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_2_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_2_x_q <= in_data_in_2_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_1_x(REG,37)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_1_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_1_x_q <= in_data_in_1_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_0_x(REG,36)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_0_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_0_x_q <= in_data_in_0_2;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_15_x(REG,35)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_15_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_15_x_q <= in_data_in_15_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_14_x(REG,34)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_14_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_14_x_q <= in_data_in_14_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_13_x(REG,33)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_13_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_13_x_q <= in_data_in_13_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_12_x(REG,32)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_12_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_12_x_q <= in_data_in_12_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_11_x(REG,31)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_11_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_11_x_q <= in_data_in_11_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_10_x(REG,30)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_10_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_10_x_q <= in_data_in_10_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_9_x(REG,29)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_9_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_9_x_q <= in_data_in_9_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_8_x(REG,28)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_8_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_8_x_q <= in_data_in_8_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_7_x(REG,27)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_7_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_7_x_q <= in_data_in_7_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_6_x(REG,26)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_6_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_6_x_q <= in_data_in_6_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_5_x(REG,25)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_5_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_5_x_q <= in_data_in_5_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_4_x(REG,24)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_4_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_4_x_q <= in_data_in_4_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_3_x(REG,23)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_3_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_3_x_q <= in_data_in_3_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_2_x(REG,22)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_2_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_2_x_q <= in_data_in_2_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_1_x(REG,21)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_1_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_1_x_q <= in_data_in_1_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_0_x(REG,20)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_0_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_0_x_q <= in_data_in_0_1;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_15_x(REG,19)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_15_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_15_x_q <= in_data_in_15_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_14_x(REG,18)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_14_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_14_x_q <= in_data_in_14_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_13_x(REG,17)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_13_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_13_x_q <= in_data_in_13_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_12_x(REG,16)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_12_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_12_x_q <= in_data_in_12_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_11_x(REG,15)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_11_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_11_x_q <= in_data_in_11_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_10_x(REG,14)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_10_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_10_x_q <= in_data_in_10_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_9_x(REG,13)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_9_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_9_x_q <= in_data_in_9_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_8_x(REG,12)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_8_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_8_x_q <= in_data_in_8_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_7_x(REG,11)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_7_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_7_x_q <= in_data_in_7_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_6_x(REG,10)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_6_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_6_x_q <= in_data_in_6_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_5_x(REG,9)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_5_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_5_x_q <= in_data_in_5_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_4_x(REG,8)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_4_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_4_x_q <= in_data_in_4_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_3_x(REG,7)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_3_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_3_x_q <= in_data_in_3_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_2_x(REG,6)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_2_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_2_x_q <= in_data_in_2_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_1_x(REG,5)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_1_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_1_x_q <= in_data_in_1_0;
            END IF;
        END IF;
    END PROCESS;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_0_x(REG,4)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_0_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q = "1") THEN
                readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_0_x_q <= in_data_in_0_0;
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_aunroll_vunroll_x(GPOUT,3)@20000001
    out_data_out_0_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_0_x_q;
    out_data_out_1_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_1_x_q;
    out_data_out_2_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_2_x_q;
    out_data_out_3_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_3_x_q;
    out_data_out_4_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_4_x_q;
    out_data_out_5_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_5_x_q;
    out_data_out_6_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_6_x_q;
    out_data_out_7_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_7_x_q;
    out_data_out_8_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_8_x_q;
    out_data_out_9_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_9_x_q;
    out_data_out_10_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_10_x_q;
    out_data_out_11_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_11_x_q;
    out_data_out_12_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_12_x_q;
    out_data_out_13_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_13_x_q;
    out_data_out_14_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_14_x_q;
    out_data_out_15_0 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_0_15_x_q;
    out_data_out_0_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_0_x_q;
    out_data_out_1_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_1_x_q;
    out_data_out_2_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_2_x_q;
    out_data_out_3_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_3_x_q;
    out_data_out_4_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_4_x_q;
    out_data_out_5_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_5_x_q;
    out_data_out_6_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_6_x_q;
    out_data_out_7_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_7_x_q;
    out_data_out_8_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_8_x_q;
    out_data_out_9_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_9_x_q;
    out_data_out_10_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_10_x_q;
    out_data_out_11_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_11_x_q;
    out_data_out_12_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_12_x_q;
    out_data_out_13_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_13_x_q;
    out_data_out_14_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_14_x_q;
    out_data_out_15_1 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_1_15_x_q;
    out_data_out_0_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_0_x_q;
    out_data_out_1_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_1_x_q;
    out_data_out_2_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_2_x_q;
    out_data_out_3_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_3_x_q;
    out_data_out_4_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_4_x_q;
    out_data_out_5_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_5_x_q;
    out_data_out_6_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_6_x_q;
    out_data_out_7_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_7_x_q;
    out_data_out_8_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_8_x_q;
    out_data_out_9_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_9_x_q;
    out_data_out_10_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_10_x_q;
    out_data_out_11_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_11_x_q;
    out_data_out_12_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_12_x_q;
    out_data_out_13_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_13_x_q;
    out_data_out_14_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_14_x_q;
    out_data_out_15_2 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_2_15_x_q;
    out_data_out_0_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_0_x_q;
    out_data_out_1_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_1_x_q;
    out_data_out_2_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_2_x_q;
    out_data_out_3_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_3_x_q;
    out_data_out_4_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_4_x_q;
    out_data_out_5_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_5_x_q;
    out_data_out_6_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_6_x_q;
    out_data_out_7_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_7_x_q;
    out_data_out_8_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_8_x_q;
    out_data_out_9_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_9_x_q;
    out_data_out_10_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_10_x_q;
    out_data_out_11_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_11_x_q;
    out_data_out_12_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_12_x_q;
    out_data_out_13_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_13_x_q;
    out_data_out_14_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_14_x_q;
    out_data_out_15_3 <= readdata_reg_memcoalesce_bottom_load_0_memRead0_data_reg_3_15_x_q;
    out_valid_out <= readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q;

    -- readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_and_stall_in(LOGICAL,69)
    readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_and_stall_in_q <= readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_q and in_stall_in;

    -- sync_out(GPOUT,74)@20000000
    out_stall_out <= readdata_reg_memcoalesce_bottom_load_0_memRead0_valid_reg_and_stall_in_q;

END normal;
