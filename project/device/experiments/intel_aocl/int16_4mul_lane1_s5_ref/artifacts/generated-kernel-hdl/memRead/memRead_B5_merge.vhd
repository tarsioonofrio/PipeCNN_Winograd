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

-- VHDL created from memRead_B5_merge
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

entity memRead_B5_merge is
    port (
        in_c0_exit100843_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit100843_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit102044_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit102044_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exit103245_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit103245_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c3_exit46_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exit46_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c4_exit47_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c4_exit47_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c5_exit48_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c5_exit48_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe109775_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe119787_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe129799_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1398011_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1498113_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1598215_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1698317_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1798419_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1898521_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe1998623_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2098725_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2198827_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2298929_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2399031_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2499133_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2599235_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2699337_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe2799439_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi121_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit100843_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit100843_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit102044_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit102044_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exit103245_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit103245_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c3_exit46_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exit46_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c4_exit47_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c4_exit47_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c5_exit48_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c5_exit48_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe109775 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe119787 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe129799 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1398011 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1498113 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1598215 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1698317 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1798419 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1898521 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe1998623 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2098725 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2198827 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2298929 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2399031 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2499133 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2599235 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2699337 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exe2799439 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi121 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end memRead_B5_merge;

architecture normal of memRead_B5_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exit100843_0(GPOUT,35)
    out_c0_exit100843_0 <= in_c0_exit100843_0_0;

    -- out_c0_exit100843_1(GPOUT,36)
    out_c0_exit100843_1 <= in_c0_exit100843_0_1;

    -- out_c1_exit102044_0(GPOUT,37)
    out_c1_exit102044_0 <= in_c1_exit102044_0_0;

    -- out_c1_exit102044_1(GPOUT,38)
    out_c1_exit102044_1 <= in_c1_exit102044_0_1;

    -- out_c2_exit103245_0(GPOUT,39)
    out_c2_exit103245_0 <= in_c2_exit103245_0_0;

    -- out_c2_exit103245_1(GPOUT,40)
    out_c2_exit103245_1 <= in_c2_exit103245_0_1;

    -- out_c3_exit46_0(GPOUT,41)
    out_c3_exit46_0 <= in_c3_exit46_0_0;

    -- out_c3_exit46_1(GPOUT,42)
    out_c3_exit46_1 <= in_c3_exit46_0_1;

    -- out_c4_exit47_0(GPOUT,43)
    out_c4_exit47_0 <= in_c4_exit47_0_0;

    -- out_c4_exit47_1(GPOUT,44)
    out_c4_exit47_1 <= in_c4_exit47_0_1;

    -- out_c5_exit48_0(GPOUT,45)
    out_c5_exit48_0 <= in_c5_exit48_0_0;

    -- out_c5_exit48_1(GPOUT,46)
    out_c5_exit48_1 <= in_c5_exit48_0_1;

    -- out_c0_exe109775(GPOUT,47)
    out_c0_exe109775 <= in_c0_exe109775_0;

    -- out_c0_exe119787(GPOUT,48)
    out_c0_exe119787 <= in_c0_exe119787_0;

    -- out_c0_exe129799(GPOUT,49)
    out_c0_exe129799 <= in_c0_exe129799_0;

    -- out_c0_exe1398011(GPOUT,50)
    out_c0_exe1398011 <= in_c0_exe1398011_0;

    -- out_c0_exe1498113(GPOUT,51)
    out_c0_exe1498113 <= in_c0_exe1498113_0;

    -- out_c0_exe1598215(GPOUT,52)
    out_c0_exe1598215 <= in_c0_exe1598215_0;

    -- out_c0_exe1698317(GPOUT,53)
    out_c0_exe1698317 <= in_c0_exe1698317_0;

    -- out_c0_exe1798419(GPOUT,54)
    out_c0_exe1798419 <= in_c0_exe1798419_0;

    -- out_c0_exe1898521(GPOUT,55)
    out_c0_exe1898521 <= in_c0_exe1898521_0;

    -- out_c0_exe1998623(GPOUT,56)
    out_c0_exe1998623 <= in_c0_exe1998623_0;

    -- out_c0_exe2098725(GPOUT,57)
    out_c0_exe2098725 <= in_c0_exe2098725_0;

    -- out_c0_exe2198827(GPOUT,58)
    out_c0_exe2198827 <= in_c0_exe2198827_0;

    -- out_c0_exe2298929(GPOUT,59)
    out_c0_exe2298929 <= in_c0_exe2298929_0;

    -- out_c0_exe2399031(GPOUT,60)
    out_c0_exe2399031 <= in_c0_exe2399031_0;

    -- out_c0_exe2499133(GPOUT,61)
    out_c0_exe2499133 <= in_c0_exe2499133_0;

    -- out_c0_exe2599235(GPOUT,62)
    out_c0_exe2599235 <= in_c0_exe2599235_0;

    -- out_c0_exe2699337(GPOUT,63)
    out_c0_exe2699337 <= in_c0_exe2699337_0;

    -- out_c0_exe2799439(GPOUT,64)
    out_c0_exe2799439 <= in_c0_exe2799439_0;

    -- out_memdep_phi121(GPOUT,65)
    out_memdep_phi121 <= in_memdep_phi121_0;

    -- stall_out(LOGICAL,68)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,66)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,67)
    out_valid_out <= in_valid_in_0;

END normal;
