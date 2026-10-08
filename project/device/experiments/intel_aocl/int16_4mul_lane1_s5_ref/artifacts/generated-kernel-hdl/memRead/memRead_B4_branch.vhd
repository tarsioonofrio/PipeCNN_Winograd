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

-- VHDL created from memRead_B4_branch
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

entity memRead_B4_branch is
    port (
        in_c0_exit1008_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1008_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit1020_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit1020_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exit1032_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit1032_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c3_exit_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exit_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c4_exit_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c4_exit_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c5_exit_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c5_exit_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe109776 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe119788 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1297910 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1398012 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1498114 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1598216 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1698318 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1798420 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1898522 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe1998624 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2098726 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2198828 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2298930 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2399032 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2499134 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2599236 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2699338 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe2799440 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe29996 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi122 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1008_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1008_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit1020_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit1020_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exit1032_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit1032_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c3_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c4_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c4_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c5_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c5_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_memdep_phi122 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end memRead_B4_branch;

architecture normal of memRead_B4_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit1008_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit1008_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit1020_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit1020_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exit1032_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exit1032_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c3_exit_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c3_exit_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c4_exit_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c4_exit_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c5_exit_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c5_exit_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe109776_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe119788_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1297910_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1398012_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1498114_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1598216_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1698318_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1798420_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1898522_reg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c0_exe1998624_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2098726_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2198828_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2298930_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2399032_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2499134_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2599236_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2699338_reg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c0_exe2799440_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe29996_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B4_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi122_reg_q : STD_LOGIC_VECTOR (0 downto 0);
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

    -- not_stall_in_1(LOGICAL,106)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe29996_cmp(LOGICAL,101)
    c0_exe29996_cmp_q <= not (in_c0_exe29996);

    -- valid_out_1_and(LOGICAL,114)
    valid_out_1_and_q <= in_valid_in and c0_exe29996_cmp_q;

    -- valid_1_reg(REG,112)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,108)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,110)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,105)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,113)
    valid_out_0_and_q <= in_valid_in and in_c0_exe29996;

    -- valid_0_reg(REG,111)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,107)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,109)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- memRead_B4_branch_enable(LOGICAL,102)
    memRead_B4_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exit1008_reg_0_x(REG,2)
    c0_exit1008_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit1008_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exit1008_reg_0_x_q <= in_c0_exit1008_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit1008_0(GPOUT,49)
    out_c0_exit1008_0 <= c0_exit1008_reg_0_x_q;

    -- c0_exit1008_reg_1_x(REG,3)
    c0_exit1008_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit1008_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exit1008_reg_1_x_q <= in_c0_exit1008_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit1008_1(GPOUT,50)
    out_c0_exit1008_1 <= c0_exit1008_reg_1_x_q;

    -- c1_exit1020_reg_0_x(REG,4)
    c1_exit1020_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit1020_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c1_exit1020_reg_0_x_q <= in_c1_exit1020_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit1020_0(GPOUT,51)
    out_c1_exit1020_0 <= c1_exit1020_reg_0_x_q;

    -- c1_exit1020_reg_1_x(REG,5)
    c1_exit1020_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit1020_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c1_exit1020_reg_1_x_q <= in_c1_exit1020_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit1020_1(GPOUT,52)
    out_c1_exit1020_1 <= c1_exit1020_reg_1_x_q;

    -- c2_exit1032_reg_0_x(REG,6)
    c2_exit1032_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exit1032_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c2_exit1032_reg_0_x_q <= in_c2_exit1032_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exit1032_0(GPOUT,53)
    out_c2_exit1032_0 <= c2_exit1032_reg_0_x_q;

    -- c2_exit1032_reg_1_x(REG,7)
    c2_exit1032_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exit1032_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c2_exit1032_reg_1_x_q <= in_c2_exit1032_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exit1032_1(GPOUT,54)
    out_c2_exit1032_1 <= c2_exit1032_reg_1_x_q;

    -- c3_exit_reg_0_x(REG,8)
    c3_exit_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c3_exit_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c3_exit_reg_0_x_q <= in_c3_exit_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c3_exit_0(GPOUT,55)
    out_c3_exit_0 <= c3_exit_reg_0_x_q;

    -- c3_exit_reg_1_x(REG,9)
    c3_exit_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c3_exit_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c3_exit_reg_1_x_q <= in_c3_exit_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c3_exit_1(GPOUT,56)
    out_c3_exit_1 <= c3_exit_reg_1_x_q;

    -- c4_exit_reg_0_x(REG,10)
    c4_exit_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c4_exit_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c4_exit_reg_0_x_q <= in_c4_exit_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c4_exit_0(GPOUT,57)
    out_c4_exit_0 <= c4_exit_reg_0_x_q;

    -- c4_exit_reg_1_x(REG,11)
    c4_exit_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c4_exit_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c4_exit_reg_1_x_q <= in_c4_exit_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c4_exit_1(GPOUT,58)
    out_c4_exit_1 <= c4_exit_reg_1_x_q;

    -- c5_exit_reg_0_x(REG,12)
    c5_exit_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c5_exit_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c5_exit_reg_0_x_q <= in_c5_exit_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c5_exit_0(GPOUT,59)
    out_c5_exit_0 <= c5_exit_reg_0_x_q;

    -- c5_exit_reg_1_x(REG,13)
    c5_exit_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c5_exit_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c5_exit_reg_1_x_q <= in_c5_exit_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c5_exit_1(GPOUT,60)
    out_c5_exit_1 <= c5_exit_reg_1_x_q;

    -- c0_exe109776_reg(REG,83)
    c0_exe109776_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe109776_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe109776_reg_q <= in_c0_exe109776;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe109776(GPOUT,61)
    out_c0_exe109776 <= c0_exe109776_reg_q;

    -- c0_exe119788_reg(REG,84)
    c0_exe119788_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe119788_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe119788_reg_q <= in_c0_exe119788;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe119788(GPOUT,62)
    out_c0_exe119788 <= c0_exe119788_reg_q;

    -- c0_exe1297910_reg(REG,85)
    c0_exe1297910_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1297910_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1297910_reg_q <= in_c0_exe1297910;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1297910(GPOUT,63)
    out_c0_exe1297910 <= c0_exe1297910_reg_q;

    -- c0_exe1398012_reg(REG,86)
    c0_exe1398012_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1398012_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1398012_reg_q <= in_c0_exe1398012;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1398012(GPOUT,64)
    out_c0_exe1398012 <= c0_exe1398012_reg_q;

    -- c0_exe1498114_reg(REG,87)
    c0_exe1498114_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1498114_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1498114_reg_q <= in_c0_exe1498114;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1498114(GPOUT,65)
    out_c0_exe1498114 <= c0_exe1498114_reg_q;

    -- c0_exe1598216_reg(REG,88)
    c0_exe1598216_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1598216_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1598216_reg_q <= in_c0_exe1598216;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1598216(GPOUT,66)
    out_c0_exe1598216 <= c0_exe1598216_reg_q;

    -- c0_exe1698318_reg(REG,89)
    c0_exe1698318_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1698318_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1698318_reg_q <= in_c0_exe1698318;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1698318(GPOUT,67)
    out_c0_exe1698318 <= c0_exe1698318_reg_q;

    -- c0_exe1798420_reg(REG,90)
    c0_exe1798420_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1798420_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1798420_reg_q <= in_c0_exe1798420;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1798420(GPOUT,68)
    out_c0_exe1798420 <= c0_exe1798420_reg_q;

    -- c0_exe1898522_reg(REG,91)
    c0_exe1898522_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1898522_reg_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1898522_reg_q <= in_c0_exe1898522;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1898522(GPOUT,69)
    out_c0_exe1898522 <= c0_exe1898522_reg_q;

    -- c0_exe1998624_reg(REG,92)
    c0_exe1998624_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1998624_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe1998624_reg_q <= in_c0_exe1998624;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1998624(GPOUT,70)
    out_c0_exe1998624 <= c0_exe1998624_reg_q;

    -- c0_exe2098726_reg(REG,93)
    c0_exe2098726_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2098726_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2098726_reg_q <= in_c0_exe2098726;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2098726(GPOUT,71)
    out_c0_exe2098726 <= c0_exe2098726_reg_q;

    -- c0_exe2198828_reg(REG,94)
    c0_exe2198828_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2198828_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2198828_reg_q <= in_c0_exe2198828;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2198828(GPOUT,72)
    out_c0_exe2198828 <= c0_exe2198828_reg_q;

    -- c0_exe2298930_reg(REG,95)
    c0_exe2298930_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2298930_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2298930_reg_q <= in_c0_exe2298930;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2298930(GPOUT,73)
    out_c0_exe2298930 <= c0_exe2298930_reg_q;

    -- c0_exe2399032_reg(REG,96)
    c0_exe2399032_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2399032_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2399032_reg_q <= in_c0_exe2399032;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2399032(GPOUT,74)
    out_c0_exe2399032 <= c0_exe2399032_reg_q;

    -- c0_exe2499134_reg(REG,97)
    c0_exe2499134_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2499134_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2499134_reg_q <= in_c0_exe2499134;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2499134(GPOUT,75)
    out_c0_exe2499134 <= c0_exe2499134_reg_q;

    -- c0_exe2599236_reg(REG,98)
    c0_exe2599236_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2599236_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2599236_reg_q <= in_c0_exe2599236;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2599236(GPOUT,76)
    out_c0_exe2599236 <= c0_exe2599236_reg_q;

    -- c0_exe2699338_reg(REG,99)
    c0_exe2699338_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2699338_reg_q <= "0000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2699338_reg_q <= in_c0_exe2699338;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2699338(GPOUT,77)
    out_c0_exe2699338 <= c0_exe2699338_reg_q;

    -- c0_exe2799440_reg(REG,100)
    c0_exe2799440_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2799440_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                c0_exe2799440_reg_q <= in_c0_exe2799440;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2799440(GPOUT,78)
    out_c0_exe2799440 <= c0_exe2799440_reg_q;

    -- memdep_phi122_reg(REG,104)
    memdep_phi122_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi122_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (memRead_B4_branch_enable_q = "1") THEN
                memdep_phi122_reg_q <= in_memdep_phi122;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi122(GPOUT,79)
    out_memdep_phi122 <= memdep_phi122_reg_q;

    -- memRead_B4_branch_enable_not(LOGICAL,103)
    memRead_B4_branch_enable_not_q <= not (memRead_B4_branch_enable_q);

    -- out_stall_out(GPOUT,80)
    out_stall_out <= memRead_B4_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,81)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,82)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
