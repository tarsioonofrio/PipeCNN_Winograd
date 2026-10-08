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

-- VHDL created from bb_memRead_B0_stall_region
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

entity bb_memRead_B0_stall_region is
    port (
        in_stride : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_1_0 : out std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_group_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_0_0 : out std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_memRead_B0_stall_region;

architecture normal of bb_memRead_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_entry_memread_c0_enter_memread is
        port (
            in_unnamed_memRead0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_group_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_0_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_1_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_throttle_pop_memread0 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memRead_B0_merge_reg is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_intel_reserved_ffwd_0_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_intel_reserved_ffwd_1_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_memread_out_feedback_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_memread_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_memread_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B0_merge_reg_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B0_merge_reg_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_memread_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_memread_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_memread_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_memread_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memRead_B0_merge_reg_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_memRead_B0_merge_reg_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_memRead_B0_merge_reg_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_memRead_B0_merge_reg_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_memRead_B0_merge_reg_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_memRead_B0_merge_reg_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_memRead_B0_merge_reg_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_memRead_B0_merge_reg_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_memRead_B0_merge_reg_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_memRead_B0_merge_reg_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_memRead_B0_merge_reg_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_memRead_B0_merge_reg_1_reg_stall_out_bitsignaltemp : std_logic;

begin


    -- i_acl_pop_i1_throttle_pop_memread(BLACKBOX,19)@5
    -- in in_stall_in@20000000
    -- out out_data_out@6
    -- out out_feedback_stall_out_0@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@6
    thei_acl_pop_i1_throttle_pop_memread : i_acl_pop_i1_throttle_pop_memread0
    PORT MAP (
        in_data_in => GND_q,
        in_dir => GND_q,
        in_feedback_in_0 => in_feedback_in_0,
        in_feedback_valid_in_0 => in_feedback_valid_in_0,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_acl_pop_i1_throttle_pop_memread_backStall,
        in_valid_in => SE_out_bubble_out_memRead_B0_merge_reg_1_V0,
        out_feedback_stall_out_0 => i_acl_pop_i1_throttle_pop_memread_out_feedback_stall_out_0,
        out_stall_out => i_acl_pop_i1_throttle_pop_memread_out_stall_out,
        out_valid_out => i_acl_pop_i1_throttle_pop_memread_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_memRead_B0_merge_reg_1(STALLENABLE,47)
    -- Valid signal propagation
    SE_out_bubble_out_memRead_B0_merge_reg_1_V0 <= SE_out_bubble_out_memRead_B0_merge_reg_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_memRead_B0_merge_reg_1_backStall <= i_acl_pop_i1_throttle_pop_memread_out_stall_out or not (SE_out_bubble_out_memRead_B0_merge_reg_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_memRead_B0_merge_reg_1_wireValid <= bubble_out_memRead_B0_merge_reg_1_reg_valid_out;

    -- bubble_out_memRead_B0_merge_reg_1_reg(STALLFIFO,52)
    bubble_out_memRead_B0_merge_reg_1_reg_valid_in <= SE_out_memRead_B0_merge_reg_V1;
    bubble_out_memRead_B0_merge_reg_1_reg_stall_in <= SE_out_bubble_out_memRead_B0_merge_reg_1_backStall;
    bubble_out_memRead_B0_merge_reg_1_reg_valid_in_bitsignaltemp <= bubble_out_memRead_B0_merge_reg_1_reg_valid_in(0);
    bubble_out_memRead_B0_merge_reg_1_reg_stall_in_bitsignaltemp <= bubble_out_memRead_B0_merge_reg_1_reg_stall_in(0);
    bubble_out_memRead_B0_merge_reg_1_reg_valid_out(0) <= bubble_out_memRead_B0_merge_reg_1_reg_valid_out_bitsignaltemp;
    bubble_out_memRead_B0_merge_reg_1_reg_stall_out(0) <= bubble_out_memRead_B0_merge_reg_1_reg_stall_out_bitsignaltemp;
    thebubble_out_memRead_B0_merge_reg_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 5,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_memRead_B0_merge_reg_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_memRead_B0_merge_reg_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_memRead_B0_merge_reg_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_memRead_B0_merge_reg_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,40)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= memRead_B0_merge_reg_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- memRead_B0_merge_reg(BLACKBOX,21)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thememRead_B0_merge_reg : memRead_B0_merge_reg
    PORT MAP (
        in_data_in => GND_q,
        in_stall_in => SE_out_memRead_B0_merge_reg_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_stall_out => memRead_B0_merge_reg_out_stall_out,
        out_valid_out => memRead_B0_merge_reg_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_memRead_B0_merge_reg(STALLENABLE,39)
    SE_out_memRead_B0_merge_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_memRead_B0_merge_reg_fromReg0 <= (others => '0');
            SE_out_memRead_B0_merge_reg_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_memRead_B0_merge_reg_fromReg0 <= SE_out_memRead_B0_merge_reg_toReg0;
            -- Succesor 1
            SE_out_memRead_B0_merge_reg_fromReg1 <= SE_out_memRead_B0_merge_reg_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_memRead_B0_merge_reg_consumed0 <= (not (i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_o_stall) and SE_out_memRead_B0_merge_reg_wireValid) or SE_out_memRead_B0_merge_reg_fromReg0;
    SE_out_memRead_B0_merge_reg_consumed1 <= (not (bubble_out_memRead_B0_merge_reg_1_reg_stall_out) and SE_out_memRead_B0_merge_reg_wireValid) or SE_out_memRead_B0_merge_reg_fromReg1;
    -- Consuming
    SE_out_memRead_B0_merge_reg_StallValid <= SE_out_memRead_B0_merge_reg_backStall and SE_out_memRead_B0_merge_reg_wireValid;
    SE_out_memRead_B0_merge_reg_toReg0 <= SE_out_memRead_B0_merge_reg_StallValid and SE_out_memRead_B0_merge_reg_consumed0;
    SE_out_memRead_B0_merge_reg_toReg1 <= SE_out_memRead_B0_merge_reg_StallValid and SE_out_memRead_B0_merge_reg_consumed1;
    -- Backward Stall generation
    SE_out_memRead_B0_merge_reg_or0 <= SE_out_memRead_B0_merge_reg_consumed0;
    SE_out_memRead_B0_merge_reg_wireStall <= not (SE_out_memRead_B0_merge_reg_consumed1 and SE_out_memRead_B0_merge_reg_or0);
    SE_out_memRead_B0_merge_reg_backStall <= SE_out_memRead_B0_merge_reg_wireStall;
    -- Valid signal propagation
    SE_out_memRead_B0_merge_reg_V0 <= SE_out_memRead_B0_merge_reg_wireValid and not (SE_out_memRead_B0_merge_reg_fromReg0);
    SE_out_memRead_B0_merge_reg_V1 <= SE_out_memRead_B0_merge_reg_wireValid and not (SE_out_memRead_B0_merge_reg_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_memRead_B0_merge_reg_wireValid <= memRead_B0_merge_reg_out_valid_out;

    -- SE_out_i_acl_pop_i1_throttle_pop_memread(STALLENABLE,37)
    -- Valid signal propagation
    SE_out_i_acl_pop_i1_throttle_pop_memread_V0 <= SE_out_i_acl_pop_i1_throttle_pop_memread_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_pop_i1_throttle_pop_memread_backStall <= in_stall_in or not (SE_out_i_acl_pop_i1_throttle_pop_memread_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_pop_i1_throttle_pop_memread_and0 <= i_acl_pop_i1_throttle_pop_memread_out_valid_out;
    SE_out_i_acl_pop_i1_throttle_pop_memread_wireValid <= i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_o_valid and SE_out_i_acl_pop_i1_throttle_pop_memread_and0;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x(BLACKBOX,10)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@6
    -- out out_intel_reserved_ffwd_0_0@20000000
    -- out out_intel_reserved_ffwd_1_0@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@6
    thei_sfc_c0_entry_memread_c0_enter_memread_aunroll_x : i_sfc_c0_entry_memread_c0_enter_memread
    PORT MAP (
        in_unnamed_memRead0_0 => GND_q,
        in_group_size_x => in_group_size_x,
        in_i_stall => SE_out_i_acl_pop_i1_throttle_pop_memread_backStall,
        in_i_valid => SE_out_memRead_B0_merge_reg_V0,
        in_stride => in_stride,
        out_intel_reserved_ffwd_0_0 => i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_intel_reserved_ffwd_0_0,
        out_intel_reserved_ffwd_1_0 => i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_intel_reserved_ffwd_1_0,
        out_o_stall => i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,5)
    out_intel_reserved_ffwd_1_0 <= i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_intel_reserved_ffwd_1_0;

    -- dupName_0_sync_out_x(GPOUT,7)@6
    out_valid_out <= SE_out_i_acl_pop_i1_throttle_pop_memread_V0;

    -- feedback_stall_out_0_sync(GPOUT,17)
    out_feedback_stall_out_0 <= i_acl_pop_i1_throttle_pop_memread_out_feedback_stall_out_0;

    -- regfree_osync(GPOUT,24)
    out_intel_reserved_ffwd_0_0 <= i_sfc_c0_entry_memread_c0_enter_memread_aunroll_x_out_intel_reserved_ffwd_0_0;

    -- sync_out(GPOUT,28)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
