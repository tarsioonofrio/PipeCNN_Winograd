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

-- VHDL created from i_sfc_logic_c5_for_end615_memread_c5_enter_memread2514
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

entity i_sfc_logic_c5_for_end615_memread_c5_enter_memread2514 is
    port (
        in_c5_eni4_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c5_eni4_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c5_eni4_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c5_eni4_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c5_eni4_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c5_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c5_exi1_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c5_for_end615_memread_c5_enter_memread2514;

architecture normal of i_sfc_logic_c5_for_end615_memread_c5_enter_memread2514 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread2516 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_33 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread2518 is
        port (
            in_c5_ene4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_33 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_undef_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread_out_feedback_stall_out_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread_out_feedback_out_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread_out_feedback_valid_out_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mac_out_0_0_0_5_2_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mac_out_0_0_0_5_2_memread_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread(BLACKBOX,8)@0
    -- out out_feedback_out_33@20000000
    -- out out_feedback_valid_out_33@20000000
    thei_acl_push_i32_mac_out_0_0_0_5_1_push33_memread : i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread2518
    PORT MAP (
        in_c5_ene4 => in_c5_eni4_4,
        in_data_in => i_mac_out_0_0_0_5_2_memread_q,
        in_feedback_stall_in_33 => i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread_out_feedback_stall_out_33,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_33 => i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread_out_feedback_out_33,
        out_feedback_valid_out_33 => i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread_out_feedback_valid_out_33,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_undef(CONSTANT,6)
    c_i32_undef_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread(BLACKBOX,7)@0
    -- out out_feedback_stall_out_33@20000000
    thei_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread : i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread2516
    PORT MAP (
        in_data_in => c_i32_undef_q,
        in_dir => in_c5_eni4_1,
        in_feedback_in_33 => i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread_out_feedback_out_33,
        in_feedback_valid_in_33 => i_acl_push_i32_mac_out_0_0_0_5_1_push33_memread_out_feedback_valid_out_33,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread_out_data_out,
        out_feedback_stall_out_33 => i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread_out_feedback_stall_out_33,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_mac_out_0_0_0_5_2_memread(MUX,9)@0
    i_mac_out_0_0_0_5_2_memread_s <= in_c5_eni4_2;
    i_mac_out_0_0_0_5_2_memread_combproc: PROCESS (i_mac_out_0_0_0_5_2_memread_s, i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread_out_data_out, in_c5_eni4_3)
    BEGIN
        CASE (i_mac_out_0_0_0_5_2_memread_s) IS
            WHEN "0" => i_mac_out_0_0_0_5_2_memread_q <= i_acl_pop_i32_mac_out_0_0_0_5_1_pop33_memread_out_data_out;
            WHEN "1" => i_mac_out_0_0_0_5_2_memread_q <= in_c5_eni4_3;
            WHEN OTHERS => i_mac_out_0_0_0_5_2_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,4)@0
    out_c5_exi1_0 <= GND_q;
    out_c5_exi1_1 <= i_mac_out_0_0_0_5_2_memread_q;
    out_o_valid <= in_i_valid;

END normal;
