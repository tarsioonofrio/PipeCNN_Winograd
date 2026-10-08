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

-- VHDL created from i_sfc_logic_c0_entry_memread_c0_enter_memread2
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

entity i_sfc_logic_c0_entry_memread_c0_enter_memread2 is
    port (
        out_intel_reserved_ffwd_0_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_1_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memRead3_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_group_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(7 downto 0);  -- ufix8
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_entry_memread_c0_enter_memread2;

architecture normal of i_sfc_logic_c0_entry_memread_c0_enter_memread2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_ffwd_src_unnamed_memread1_memread8 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_0_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_memread2_memread10 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_1_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_group_size_x_sync_buffer_memread4 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_stride_sync_buffer_memread6 is
        port (
            in_buffer_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_mul_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv19_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv20_memread_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv20_memread_vt_join_narrowed_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mul_memread_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_memread_multconst_x_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_conv19_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv20_memread_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_conv20_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv20_memread_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_memread1_memread_out_intel_reserved_ffwd_0_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_src_unnamed_memread2_memread_out_intel_reserved_ffwd_1_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_memread_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mul_memread_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mul_memread_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul_memread_pr : UNSIGNED (15 downto 0);
    signal i_mul_memread_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul_memread_vt_const_31_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul_memread_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_memread_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_syncbuf_group_size_x_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_syncbuf_stride_sync_buffer_memread_out_buffer_out : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_sync_in_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist0_sync_in_in_i_valid_2(DELAY,35)
    redist0_sync_in_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist0_sync_in_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- i_mul_memread_vt_const_31(CONSTANT,26)
    i_mul_memread_vt_const_31_q <= "0000000000000000";

    -- i_mul_memread_multconst_x(CONSTANT,10)
    i_mul_memread_multconst_x_q <= "000000000000000000000000000000000000000000000000";

    -- i_syncbuf_group_size_x_sync_buffer_memread(BLACKBOX,29)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_group_size_x_sync_buffer_memread : i_syncbuf_group_size_x_sync_buffer_memread4
    PORT MAP (
        in_buffer_in => in_group_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_group_size_x_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv19_memread_sel_x(BITSELECT,6)@1
    i_conv19_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_group_size_x_sync_buffer_memread_out_buffer_out(7 downto 0)), 32));

    -- i_conv19_memread_vt_select_7(BITSELECT,18)@1
    i_conv19_memread_vt_select_7_b <= i_conv19_memread_sel_x_b(7 downto 0);

    -- i_conv20_memread_vt_const_31(CONSTANT,20)
    i_conv20_memread_vt_const_31_q <= "000000000000000000000000";

    -- i_syncbuf_stride_sync_buffer_memread(BLACKBOX,30)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_stride_sync_buffer_memread : i_syncbuf_stride_sync_buffer_memread6
    PORT MAP (
        in_buffer_in => in_stride,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_stride_sync_buffer_memread_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_conv20_memread_sel_x(BITSELECT,7)@1
    i_conv20_memread_sel_x_b <= std_logic_vector(resize(unsigned(i_syncbuf_stride_sync_buffer_memread_out_buffer_out(7 downto 0)), 32));

    -- i_conv20_memread_vt_select_7(BITSELECT,22)@1
    i_conv20_memread_vt_select_7_b <= i_conv20_memread_sel_x_b(7 downto 0);

    -- i_conv20_memread_vt_join(BITJOIN,21)@1
    i_conv20_memread_vt_join_q <= i_conv20_memread_vt_const_31_q & i_conv20_memread_vt_select_7_b;

    -- i_conv20_memread_vt_join_narrowed_x(BITSELECT,8)@1
    i_conv20_memread_vt_join_narrowed_x_b <= i_conv20_memread_vt_join_q(7 downto 0);

    -- i_mul_memread(MULT,25)@1 + 2
    i_mul_memread_pr <= UNSIGNED(UNSIGNED(i_mul_memread_a0) * UNSIGNED(i_mul_memread_b0));
    i_mul_memread_component: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_memread_a0 <= (others => '0');
            i_mul_memread_b0 <= (others => '0');
            i_mul_memread_s1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_mul_memread_a0 <= i_conv20_memread_vt_join_narrowed_x_b;
            i_mul_memread_b0 <= i_conv19_memread_vt_select_7_b;
            i_mul_memread_s1 <= STD_LOGIC_VECTOR(i_mul_memread_pr);
        END IF;
    END PROCESS;
    i_mul_memread_q <= i_mul_memread_s1;

    -- i_mul_memread_extender_x(BITJOIN,9)@3
    i_mul_memread_extender_x_q <= i_mul_memread_multconst_x_q & i_mul_memread_q;

    -- bgTrunc_i_mul_memread_sel_x(BITSELECT,2)@3
    bgTrunc_i_mul_memread_sel_x_b <= i_mul_memread_extender_x_q(31 downto 0);

    -- i_mul_memread_vt_select_15(BITSELECT,28)@3
    i_mul_memread_vt_select_15_b <= bgTrunc_i_mul_memread_sel_x_b(15 downto 0);

    -- i_mul_memread_vt_join(BITJOIN,27)@3
    i_mul_memread_vt_join_q <= i_mul_memread_vt_const_31_q & i_mul_memread_vt_select_15_b;

    -- i_ffwd_src_unnamed_memread2_memread(BLACKBOX,24)@3
    -- out out_intel_reserved_ffwd_1_0@20000000
    thei_ffwd_src_unnamed_memread2_memread : i_ffwd_src_unnamed_memread2_memread10
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_1_0 => i_mul_memread_vt_join_q,
        in_stall_in => GND_q,
        in_valid_in => redist0_sync_in_in_i_valid_2_q,
        out_intel_reserved_ffwd_1_0 => i_ffwd_src_unnamed_memread2_memread_out_intel_reserved_ffwd_1_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_memread1_memread(BLACKBOX,23)@1
    -- out out_intel_reserved_ffwd_0_0@20000000
    thei_ffwd_src_unnamed_memread1_memread : i_ffwd_src_unnamed_memread1_memread8
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_0_0 => i_conv20_memread_vt_join_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_intel_reserved_ffwd_0_0 => i_ffwd_src_unnamed_memread1_memread_out_intel_reserved_ffwd_0_0,
        clock => clock,
        resetn => resetn
    );

    -- sync_out_aunroll_x(GPOUT,11)@3
    out_intel_reserved_ffwd_0_0 <= i_ffwd_src_unnamed_memread1_memread_out_intel_reserved_ffwd_0_0;
    out_intel_reserved_ffwd_1_0 <= i_ffwd_src_unnamed_memread2_memread_out_intel_reserved_ffwd_1_0;
    out_o_valid <= redist0_sync_in_in_i_valid_2_q;
    out_unnamed_memRead3_0 <= GND_q;

END normal;
