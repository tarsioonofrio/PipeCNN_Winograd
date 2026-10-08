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

-- VHDL created from memRead_B3_branch
-- VHDL created on Thu Oct  8 10:49:41 2026


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

entity memRead_B3_branch is
    port (
        in_c0_exit967_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit967_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit967_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit967_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit967_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit967_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit967_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit967_18 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exit967_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_20 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_21 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_22 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_23 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_24 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_25 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_26 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exit967_27 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_28 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_29 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit967_30 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe10977 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11978 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe12979 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13980 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe14981 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe15982 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe16983 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe17984 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe18985 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe19986 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe20987 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe21988 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe22989 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe23990 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe24991 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe25992 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe26993 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe27994 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe28995 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe30997 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe7974 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe9976 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit967_19 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_20 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_21 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_22 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_23 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_24 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_25 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_26 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit967_27 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_28 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_29 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_30 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10977 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11978 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12979 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13980 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14981 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe15982 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe16983 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17984 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe18985 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe19986 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe20987 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe21988 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe22989 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe23990 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe24991 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe25992 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe26993 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe27994 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe28995 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe30997 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7974 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_phi12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end memRead_B3_branch;

architecture normal of memRead_B3_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_2_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_3_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_4_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_5_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_6_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit967_reg_8_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_9_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_10_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_11_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit967_reg_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit967_reg_14_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit967_reg_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit967_reg_16_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit967_reg_17_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit967_reg_18_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c0_exit967_reg_19_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_20_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_21_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_22_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_23_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_24_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_25_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_26_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c0_exit967_reg_27_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_28_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_29_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit967_reg_30_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe10977_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11978_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe12979_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe13980_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe14981_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe15982_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe16983_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe17984_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe18985_reg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c0_exe19986_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe20987_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe21988_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe22989_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe23990_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe24991_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe25992_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe26993_reg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c0_exe27994_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe28995_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe30997_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe7974_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe9976_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B3_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B3_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi12_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,172)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe9976_cmp(LOGICAL,167)
    c0_exe9976_cmp_q <= not (in_c0_exe9976);

    -- valid_out_1_and(LOGICAL,180)
    valid_out_1_and_q <= in_valid_in and c0_exe9976_cmp_q;

    -- valid_1_reg(REG,178)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,174)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,176)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,171)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,179)
    valid_out_0_and_q <= in_valid_in and in_c0_exe9976;

    -- valid_0_reg(REG,177)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,173)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,175)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- memRead_B3_branch_enable(LOGICAL,168)
    memRead_B3_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exit967_reg_0_x(REG,2)
    c0_exit967_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_0_x_q <= in_c0_exit967_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_0(GPOUT,90)
    out_c0_exit967_0 <= c0_exit967_reg_0_x_q;

    -- c0_exit967_reg_1_x(REG,3)
    c0_exit967_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_1_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_1_x_q <= in_c0_exit967_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_1(GPOUT,91)
    out_c0_exit967_1 <= c0_exit967_reg_1_x_q;

    -- c0_exit967_reg_2_x(REG,4)
    c0_exit967_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_2_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_2_x_q <= in_c0_exit967_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_2(GPOUT,92)
    out_c0_exit967_2 <= c0_exit967_reg_2_x_q;

    -- c0_exit967_reg_3_x(REG,5)
    c0_exit967_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_3_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_3_x_q <= in_c0_exit967_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_3(GPOUT,93)
    out_c0_exit967_3 <= c0_exit967_reg_3_x_q;

    -- c0_exit967_reg_4_x(REG,6)
    c0_exit967_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_4_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_4_x_q <= in_c0_exit967_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_4(GPOUT,94)
    out_c0_exit967_4 <= c0_exit967_reg_4_x_q;

    -- c0_exit967_reg_5_x(REG,7)
    c0_exit967_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_5_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_5_x_q <= in_c0_exit967_5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_5(GPOUT,95)
    out_c0_exit967_5 <= c0_exit967_reg_5_x_q;

    -- c0_exit967_reg_6_x(REG,8)
    c0_exit967_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_6_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_6_x_q <= in_c0_exit967_6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_6(GPOUT,96)
    out_c0_exit967_6 <= c0_exit967_reg_6_x_q;

    -- c0_exit967_reg_7_x(REG,9)
    c0_exit967_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_7_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_7_x_q <= in_c0_exit967_7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_7(GPOUT,97)
    out_c0_exit967_7 <= c0_exit967_reg_7_x_q;

    -- c0_exit967_reg_8_x(REG,10)
    c0_exit967_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_8_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_8_x_q <= in_c0_exit967_8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_8(GPOUT,98)
    out_c0_exit967_8 <= c0_exit967_reg_8_x_q;

    -- c0_exit967_reg_9_x(REG,11)
    c0_exit967_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_9_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_9_x_q <= in_c0_exit967_9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_9(GPOUT,99)
    out_c0_exit967_9 <= c0_exit967_reg_9_x_q;

    -- c0_exit967_reg_10_x(REG,12)
    c0_exit967_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_10_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_10_x_q <= in_c0_exit967_10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_10(GPOUT,100)
    out_c0_exit967_10 <= c0_exit967_reg_10_x_q;

    -- c0_exit967_reg_11_x(REG,13)
    c0_exit967_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_11_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_11_x_q <= in_c0_exit967_11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_11(GPOUT,101)
    out_c0_exit967_11 <= c0_exit967_reg_11_x_q;

    -- c0_exit967_reg_12_x(REG,14)
    c0_exit967_reg_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_12_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_12_x_q <= in_c0_exit967_12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_12(GPOUT,102)
    out_c0_exit967_12 <= c0_exit967_reg_12_x_q;

    -- c0_exit967_reg_13_x(REG,15)
    c0_exit967_reg_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_13_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_13_x_q <= in_c0_exit967_13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_13(GPOUT,103)
    out_c0_exit967_13 <= c0_exit967_reg_13_x_q;

    -- c0_exit967_reg_14_x(REG,16)
    c0_exit967_reg_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_14_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_14_x_q <= in_c0_exit967_14;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_14(GPOUT,104)
    out_c0_exit967_14 <= c0_exit967_reg_14_x_q;

    -- c0_exit967_reg_15_x(REG,17)
    c0_exit967_reg_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_15_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_15_x_q <= in_c0_exit967_15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_15(GPOUT,105)
    out_c0_exit967_15 <= c0_exit967_reg_15_x_q;

    -- c0_exit967_reg_16_x(REG,18)
    c0_exit967_reg_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_16_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_16_x_q <= in_c0_exit967_16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_16(GPOUT,106)
    out_c0_exit967_16 <= c0_exit967_reg_16_x_q;

    -- c0_exit967_reg_17_x(REG,19)
    c0_exit967_reg_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_17_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_17_x_q <= in_c0_exit967_17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_17(GPOUT,107)
    out_c0_exit967_17 <= c0_exit967_reg_17_x_q;

    -- c0_exit967_reg_18_x(REG,20)
    c0_exit967_reg_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_18_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_18_x_q <= in_c0_exit967_18;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_18(GPOUT,108)
    out_c0_exit967_18 <= c0_exit967_reg_18_x_q;

    -- c0_exit967_reg_19_x(REG,21)
    c0_exit967_reg_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_19_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_19_x_q <= in_c0_exit967_19;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_19(GPOUT,109)
    out_c0_exit967_19 <= c0_exit967_reg_19_x_q;

    -- c0_exit967_reg_20_x(REG,22)
    c0_exit967_reg_20_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_20_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_20_x_q <= in_c0_exit967_20;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_20(GPOUT,110)
    out_c0_exit967_20 <= c0_exit967_reg_20_x_q;

    -- c0_exit967_reg_21_x(REG,23)
    c0_exit967_reg_21_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_21_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_21_x_q <= in_c0_exit967_21;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_21(GPOUT,111)
    out_c0_exit967_21 <= c0_exit967_reg_21_x_q;

    -- c0_exit967_reg_22_x(REG,24)
    c0_exit967_reg_22_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_22_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_22_x_q <= in_c0_exit967_22;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_22(GPOUT,112)
    out_c0_exit967_22 <= c0_exit967_reg_22_x_q;

    -- c0_exit967_reg_23_x(REG,25)
    c0_exit967_reg_23_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_23_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_23_x_q <= in_c0_exit967_23;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_23(GPOUT,113)
    out_c0_exit967_23 <= c0_exit967_reg_23_x_q;

    -- c0_exit967_reg_24_x(REG,26)
    c0_exit967_reg_24_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_24_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_24_x_q <= in_c0_exit967_24;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_24(GPOUT,114)
    out_c0_exit967_24 <= c0_exit967_reg_24_x_q;

    -- c0_exit967_reg_25_x(REG,27)
    c0_exit967_reg_25_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_25_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_25_x_q <= in_c0_exit967_25;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_25(GPOUT,115)
    out_c0_exit967_25 <= c0_exit967_reg_25_x_q;

    -- c0_exit967_reg_26_x(REG,28)
    c0_exit967_reg_26_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_26_x_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_26_x_q <= in_c0_exit967_26;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_26(GPOUT,116)
    out_c0_exit967_26 <= c0_exit967_reg_26_x_q;

    -- c0_exit967_reg_27_x(REG,29)
    c0_exit967_reg_27_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_27_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_27_x_q <= in_c0_exit967_27;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_27(GPOUT,117)
    out_c0_exit967_27 <= c0_exit967_reg_27_x_q;

    -- c0_exit967_reg_28_x(REG,30)
    c0_exit967_reg_28_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_28_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_28_x_q <= in_c0_exit967_28;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_28(GPOUT,118)
    out_c0_exit967_28 <= c0_exit967_reg_28_x_q;

    -- c0_exit967_reg_29_x(REG,31)
    c0_exit967_reg_29_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_29_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_29_x_q <= in_c0_exit967_29;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_29(GPOUT,119)
    out_c0_exit967_29 <= c0_exit967_reg_29_x_q;

    -- c0_exit967_reg_30_x(REG,32)
    c0_exit967_reg_30_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit967_reg_30_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exit967_reg_30_x_q <= in_c0_exit967_30;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit967_30(GPOUT,120)
    out_c0_exit967_30 <= c0_exit967_reg_30_x_q;

    -- c0_exe10977_reg(REG,146)
    c0_exe10977_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe10977_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe10977_reg_q <= in_c0_exe10977;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe10977(GPOUT,121)
    out_c0_exe10977 <= c0_exe10977_reg_q;

    -- c0_exe11978_reg(REG,147)
    c0_exe11978_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11978_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe11978_reg_q <= in_c0_exe11978;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11978(GPOUT,122)
    out_c0_exe11978 <= c0_exe11978_reg_q;

    -- c0_exe12979_reg(REG,148)
    c0_exe12979_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe12979_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe12979_reg_q <= in_c0_exe12979;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe12979(GPOUT,123)
    out_c0_exe12979 <= c0_exe12979_reg_q;

    -- c0_exe13980_reg(REG,149)
    c0_exe13980_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe13980_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe13980_reg_q <= in_c0_exe13980;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe13980(GPOUT,124)
    out_c0_exe13980 <= c0_exe13980_reg_q;

    -- c0_exe14981_reg(REG,150)
    c0_exe14981_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe14981_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe14981_reg_q <= in_c0_exe14981;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe14981(GPOUT,125)
    out_c0_exe14981 <= c0_exe14981_reg_q;

    -- c0_exe15982_reg(REG,151)
    c0_exe15982_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe15982_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe15982_reg_q <= in_c0_exe15982;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe15982(GPOUT,126)
    out_c0_exe15982 <= c0_exe15982_reg_q;

    -- c0_exe16983_reg(REG,152)
    c0_exe16983_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe16983_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe16983_reg_q <= in_c0_exe16983;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe16983(GPOUT,127)
    out_c0_exe16983 <= c0_exe16983_reg_q;

    -- c0_exe17984_reg(REG,153)
    c0_exe17984_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe17984_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe17984_reg_q <= in_c0_exe17984;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe17984(GPOUT,128)
    out_c0_exe17984 <= c0_exe17984_reg_q;

    -- c0_exe18985_reg(REG,154)
    c0_exe18985_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe18985_reg_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe18985_reg_q <= in_c0_exe18985;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe18985(GPOUT,129)
    out_c0_exe18985 <= c0_exe18985_reg_q;

    -- c0_exe19986_reg(REG,155)
    c0_exe19986_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe19986_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe19986_reg_q <= in_c0_exe19986;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe19986(GPOUT,130)
    out_c0_exe19986 <= c0_exe19986_reg_q;

    -- c0_exe20987_reg(REG,156)
    c0_exe20987_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe20987_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe20987_reg_q <= in_c0_exe20987;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe20987(GPOUT,131)
    out_c0_exe20987 <= c0_exe20987_reg_q;

    -- c0_exe21988_reg(REG,157)
    c0_exe21988_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe21988_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe21988_reg_q <= in_c0_exe21988;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe21988(GPOUT,132)
    out_c0_exe21988 <= c0_exe21988_reg_q;

    -- c0_exe22989_reg(REG,158)
    c0_exe22989_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe22989_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe22989_reg_q <= in_c0_exe22989;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe22989(GPOUT,133)
    out_c0_exe22989 <= c0_exe22989_reg_q;

    -- c0_exe23990_reg(REG,159)
    c0_exe23990_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe23990_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe23990_reg_q <= in_c0_exe23990;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe23990(GPOUT,134)
    out_c0_exe23990 <= c0_exe23990_reg_q;

    -- c0_exe24991_reg(REG,160)
    c0_exe24991_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe24991_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe24991_reg_q <= in_c0_exe24991;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe24991(GPOUT,135)
    out_c0_exe24991 <= c0_exe24991_reg_q;

    -- c0_exe25992_reg(REG,161)
    c0_exe25992_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe25992_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe25992_reg_q <= in_c0_exe25992;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe25992(GPOUT,136)
    out_c0_exe25992 <= c0_exe25992_reg_q;

    -- c0_exe26993_reg(REG,162)
    c0_exe26993_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe26993_reg_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe26993_reg_q <= in_c0_exe26993;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe26993(GPOUT,137)
    out_c0_exe26993 <= c0_exe26993_reg_q;

    -- c0_exe27994_reg(REG,163)
    c0_exe27994_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe27994_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe27994_reg_q <= in_c0_exe27994;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe27994(GPOUT,138)
    out_c0_exe27994 <= c0_exe27994_reg_q;

    -- c0_exe28995_reg(REG,164)
    c0_exe28995_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe28995_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe28995_reg_q <= in_c0_exe28995;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe28995(GPOUT,139)
    out_c0_exe28995 <= c0_exe28995_reg_q;

    -- c0_exe30997_reg(REG,165)
    c0_exe30997_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe30997_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe30997_reg_q <= in_c0_exe30997;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe30997(GPOUT,140)
    out_c0_exe30997 <= c0_exe30997_reg_q;

    -- c0_exe7974_reg(REG,166)
    c0_exe7974_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe7974_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                c0_exe7974_reg_q <= in_c0_exe7974;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe7974(GPOUT,141)
    out_c0_exe7974 <= c0_exe7974_reg_q;

    -- memdep_phi12_reg(REG,170)
    memdep_phi12_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi12_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B3_branch_enable_q = "1") THEN
                memdep_phi12_reg_q <= in_memdep_phi12;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi12(GPOUT,142)
    out_memdep_phi12 <= memdep_phi12_reg_q;

    -- memRead_B3_branch_enable_not(LOGICAL,169)
    memRead_B3_branch_enable_not_q <= not (memRead_B3_branch_enable_q);

    -- out_stall_out(GPOUT,143)
    out_stall_out <= memRead_B3_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,144)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,145)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
