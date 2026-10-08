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

-- VHDL created from memRead_B4_merge
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

entity memRead_B4_merge is
    port (
        in_c0_exit9673_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit9673_0_18 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exit9673_0_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_20 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_21 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_22 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_23 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_24 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_25 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_26 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exit9673_0_27 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_28 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_29 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit9673_0_30 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe109776_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe119788_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1297910_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1398012_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1498114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1598216_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1698318_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1798420_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1898522_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe1998624_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2098726_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2198828_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2298930_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2399032_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2499134_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2599236_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2699338_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe2799440_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2899541_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe3099742_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe79744_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi122_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit9673_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit9673_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit9673_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit9673_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit9673_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit9673_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit9673_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit9673_19 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_20 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_21 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_22 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_23 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_24 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_25 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_26 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit9673_27 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_28 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_29 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit9673_30 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe109776 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe119788 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1297910 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1398012 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1498114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1598216 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1698318 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1798420 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1898522 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe1998624 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2098726 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2198828 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2298930 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2399032 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2499134 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2599236 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2699338 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe2799440 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2899541 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe3099742 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe79744 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_phi122 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end memRead_B4_merge;

architecture normal of memRead_B4_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exit9673_0(GPOUT,57)
    out_c0_exit9673_0 <= in_c0_exit9673_0_0;

    -- out_c0_exit9673_1(GPOUT,58)
    out_c0_exit9673_1 <= in_c0_exit9673_0_1;

    -- out_c0_exit9673_2(GPOUT,59)
    out_c0_exit9673_2 <= in_c0_exit9673_0_2;

    -- out_c0_exit9673_3(GPOUT,60)
    out_c0_exit9673_3 <= in_c0_exit9673_0_3;

    -- out_c0_exit9673_4(GPOUT,61)
    out_c0_exit9673_4 <= in_c0_exit9673_0_4;

    -- out_c0_exit9673_5(GPOUT,62)
    out_c0_exit9673_5 <= in_c0_exit9673_0_5;

    -- out_c0_exit9673_6(GPOUT,63)
    out_c0_exit9673_6 <= in_c0_exit9673_0_6;

    -- out_c0_exit9673_7(GPOUT,64)
    out_c0_exit9673_7 <= in_c0_exit9673_0_7;

    -- out_c0_exit9673_8(GPOUT,65)
    out_c0_exit9673_8 <= in_c0_exit9673_0_8;

    -- out_c0_exit9673_9(GPOUT,66)
    out_c0_exit9673_9 <= in_c0_exit9673_0_9;

    -- out_c0_exit9673_10(GPOUT,67)
    out_c0_exit9673_10 <= in_c0_exit9673_0_10;

    -- out_c0_exit9673_11(GPOUT,68)
    out_c0_exit9673_11 <= in_c0_exit9673_0_11;

    -- out_c0_exit9673_12(GPOUT,69)
    out_c0_exit9673_12 <= in_c0_exit9673_0_12;

    -- out_c0_exit9673_13(GPOUT,70)
    out_c0_exit9673_13 <= in_c0_exit9673_0_13;

    -- out_c0_exit9673_14(GPOUT,71)
    out_c0_exit9673_14 <= in_c0_exit9673_0_14;

    -- out_c0_exit9673_15(GPOUT,72)
    out_c0_exit9673_15 <= in_c0_exit9673_0_15;

    -- out_c0_exit9673_16(GPOUT,73)
    out_c0_exit9673_16 <= in_c0_exit9673_0_16;

    -- out_c0_exit9673_17(GPOUT,74)
    out_c0_exit9673_17 <= in_c0_exit9673_0_17;

    -- out_c0_exit9673_18(GPOUT,75)
    out_c0_exit9673_18 <= in_c0_exit9673_0_18;

    -- out_c0_exit9673_19(GPOUT,76)
    out_c0_exit9673_19 <= in_c0_exit9673_0_19;

    -- out_c0_exit9673_20(GPOUT,77)
    out_c0_exit9673_20 <= in_c0_exit9673_0_20;

    -- out_c0_exit9673_21(GPOUT,78)
    out_c0_exit9673_21 <= in_c0_exit9673_0_21;

    -- out_c0_exit9673_22(GPOUT,79)
    out_c0_exit9673_22 <= in_c0_exit9673_0_22;

    -- out_c0_exit9673_23(GPOUT,80)
    out_c0_exit9673_23 <= in_c0_exit9673_0_23;

    -- out_c0_exit9673_24(GPOUT,81)
    out_c0_exit9673_24 <= in_c0_exit9673_0_24;

    -- out_c0_exit9673_25(GPOUT,82)
    out_c0_exit9673_25 <= in_c0_exit9673_0_25;

    -- out_c0_exit9673_26(GPOUT,83)
    out_c0_exit9673_26 <= in_c0_exit9673_0_26;

    -- out_c0_exit9673_27(GPOUT,84)
    out_c0_exit9673_27 <= in_c0_exit9673_0_27;

    -- out_c0_exit9673_28(GPOUT,85)
    out_c0_exit9673_28 <= in_c0_exit9673_0_28;

    -- out_c0_exit9673_29(GPOUT,86)
    out_c0_exit9673_29 <= in_c0_exit9673_0_29;

    -- out_c0_exit9673_30(GPOUT,87)
    out_c0_exit9673_30 <= in_c0_exit9673_0_30;

    -- out_c0_exe109776(GPOUT,88)
    out_c0_exe109776 <= in_c0_exe109776_0;

    -- out_c0_exe119788(GPOUT,89)
    out_c0_exe119788 <= in_c0_exe119788_0;

    -- out_c0_exe1297910(GPOUT,90)
    out_c0_exe1297910 <= in_c0_exe1297910_0;

    -- out_c0_exe1398012(GPOUT,91)
    out_c0_exe1398012 <= in_c0_exe1398012_0;

    -- out_c0_exe1498114(GPOUT,92)
    out_c0_exe1498114 <= in_c0_exe1498114_0;

    -- out_c0_exe1598216(GPOUT,93)
    out_c0_exe1598216 <= in_c0_exe1598216_0;

    -- out_c0_exe1698318(GPOUT,94)
    out_c0_exe1698318 <= in_c0_exe1698318_0;

    -- out_c0_exe1798420(GPOUT,95)
    out_c0_exe1798420 <= in_c0_exe1798420_0;

    -- out_c0_exe1898522(GPOUT,96)
    out_c0_exe1898522 <= in_c0_exe1898522_0;

    -- out_c0_exe1998624(GPOUT,97)
    out_c0_exe1998624 <= in_c0_exe1998624_0;

    -- out_c0_exe2098726(GPOUT,98)
    out_c0_exe2098726 <= in_c0_exe2098726_0;

    -- out_c0_exe2198828(GPOUT,99)
    out_c0_exe2198828 <= in_c0_exe2198828_0;

    -- out_c0_exe2298930(GPOUT,100)
    out_c0_exe2298930 <= in_c0_exe2298930_0;

    -- out_c0_exe2399032(GPOUT,101)
    out_c0_exe2399032 <= in_c0_exe2399032_0;

    -- out_c0_exe2499134(GPOUT,102)
    out_c0_exe2499134 <= in_c0_exe2499134_0;

    -- out_c0_exe2599236(GPOUT,103)
    out_c0_exe2599236 <= in_c0_exe2599236_0;

    -- out_c0_exe2699338(GPOUT,104)
    out_c0_exe2699338 <= in_c0_exe2699338_0;

    -- out_c0_exe2799440(GPOUT,105)
    out_c0_exe2799440 <= in_c0_exe2799440_0;

    -- out_c0_exe2899541(GPOUT,106)
    out_c0_exe2899541 <= in_c0_exe2899541_0;

    -- out_c0_exe3099742(GPOUT,107)
    out_c0_exe3099742 <= in_c0_exe3099742_0;

    -- out_c0_exe79744(GPOUT,108)
    out_c0_exe79744 <= in_c0_exe79744_0;

    -- out_memdep_phi122(GPOUT,109)
    out_memdep_phi122 <= in_memdep_phi122_0;

    -- stall_out(LOGICAL,112)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,110)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,111)
    out_valid_out <= in_valid_in_0;

END normal;
