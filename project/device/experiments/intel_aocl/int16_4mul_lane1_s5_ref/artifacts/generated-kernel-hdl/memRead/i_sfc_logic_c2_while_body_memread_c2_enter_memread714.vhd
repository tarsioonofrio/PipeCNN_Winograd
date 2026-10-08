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

-- VHDL created from i_sfc_logic_c2_while_body_memread_c2_enter_memread714
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

entity i_sfc_logic_c2_while_body_memread_c2_enter_memread714 is
    port (
        in_c2_eni5_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_eni5_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_eni5_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_eni5_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c2_eni5_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_eni5_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exi1_1 : out std_logic_vector(15 downto 0);  -- ufix16
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c2_while_body_memread_c2_enter_memread714;

architecture normal of i_sfc_logic_c2_while_body_memread_c2_enter_memread714 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread716 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_27 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread718 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_26 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread720 is
        port (
            in_c2_ene5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_27 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread722 is
        port (
            in_c2_ene5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_26 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i16_undef_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_1786_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1786_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_1865_memread_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1865_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread_out_feedback_stall_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread_out_feedback_stall_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread_out_feedback_out_27 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread_out_feedback_valid_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread_out_feedback_out_26 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread_out_feedback_valid_out_26 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread(BLACKBOX,13)@141
    -- out out_feedback_out_27@20000000
    -- out out_feedback_valid_out_27@20000000
    thei_acl_push_i16_bias_ch_in_0_0_0533_push27_memread : i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread720
    PORT MAP (
        in_c2_ene5 => in_c2_eni5_5,
        in_data_in => i_acl_1786_memread_q,
        in_feedback_stall_in_27 => i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread_out_feedback_stall_out_27,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_27 => i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread_out_feedback_out_27,
        out_feedback_valid_out_27 => i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread_out_feedback_valid_out_27,
        clock => clock,
        resetn => resetn
    );

    -- c_i16_undef(CONSTANT,7)
    c_i16_undef_q <= "0000000000000000";

    -- i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread(BLACKBOX,11)@141
    -- out out_feedback_stall_out_27@20000000
    thei_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread : i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread716
    PORT MAP (
        in_data_in => c_i16_undef_q,
        in_dir => in_c2_eni5_1,
        in_feedback_in_27 => i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread_out_feedback_out_27,
        in_feedback_valid_in_27 => i_acl_push_i16_bias_ch_in_0_0_0533_push27_memread_out_feedback_valid_out_27,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread_out_data_out,
        out_feedback_stall_out_27 => i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread_out_feedback_stall_out_27,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_1786_memread(MUX,9)@141
    i_acl_1786_memread_s <= in_c2_eni5_2;
    i_acl_1786_memread_combproc: PROCESS (i_acl_1786_memread_s, i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread_out_data_out, in_c2_eni5_3)
    BEGIN
        CASE (i_acl_1786_memread_s) IS
            WHEN "0" => i_acl_1786_memread_q <= i_acl_pop_i16_bias_ch_in_0_0_0533_pop27_memread_out_data_out;
            WHEN "1" => i_acl_1786_memread_q <= in_c2_eni5_3;
            WHEN OTHERS => i_acl_1786_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread(BLACKBOX,14)@141
    -- out out_feedback_out_26@20000000
    -- out out_feedback_valid_out_26@20000000
    thei_acl_push_i16_bias_ch_out_0_0_0534_push26_memread : i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread722
    PORT MAP (
        in_c2_ene5 => in_c2_eni5_5,
        in_data_in => i_acl_1865_memread_q,
        in_feedback_stall_in_26 => i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread_out_feedback_stall_out_26,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_26 => i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread_out_feedback_out_26,
        out_feedback_valid_out_26 => i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread_out_feedback_valid_out_26,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread(BLACKBOX,12)@141
    -- out out_feedback_stall_out_26@20000000
    thei_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread : i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread718
    PORT MAP (
        in_data_in => c_i16_undef_q,
        in_dir => in_c2_eni5_1,
        in_feedback_in_26 => i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread_out_feedback_out_26,
        in_feedback_valid_in_26 => i_acl_push_i16_bias_ch_out_0_0_0534_push26_memread_out_feedback_valid_out_26,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread_out_data_out,
        out_feedback_stall_out_26 => i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread_out_feedback_stall_out_26,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_acl_1865_memread(MUX,10)@141
    i_acl_1865_memread_s <= in_c2_eni5_4;
    i_acl_1865_memread_combproc: PROCESS (i_acl_1865_memread_s, i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread_out_data_out, i_acl_1786_memread_q)
    BEGIN
        CASE (i_acl_1865_memread_s) IS
            WHEN "0" => i_acl_1865_memread_q <= i_acl_pop_i16_bias_ch_out_0_0_0534_pop26_memread_out_data_out;
            WHEN "1" => i_acl_1865_memread_q <= i_acl_1786_memread_q;
            WHEN OTHERS => i_acl_1865_memread_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,6)@141
    out_c2_exi1_0 <= GND_q;
    out_c2_exi1_1 <= i_acl_1865_memread_q;
    out_o_valid <= in_i_valid;

END normal;
