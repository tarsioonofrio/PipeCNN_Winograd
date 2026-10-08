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

-- VHDL created from bb_smoke_producer_B0_stall_region
-- VHDL created on Thu Oct  8 10:46:48 2026


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

entity bb_smoke_producer_B0_stall_region is
    port (
        in_lsu_unnamed_smoke_producer0_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_smoke_channel_o_fifodata : out std_logic_vector(31 downto 0);  -- ufix32
        out_iowr_bl_smoke_channel_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        in_src : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_producer0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_smoke_producer0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_producer0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_producer0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iowr_bl_smoke_channel_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_smoke_producer0_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_smoke_producer0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_smoke_producer0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_producer0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_producer0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_producer0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_smoke_producer0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_smoke_producer0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_smoke_producer_B0_stall_region;

architecture normal of bb_smoke_producer_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component smoke_producer_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer5 is
        port (
            in_i_data : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iowr_bl_smoke_channel_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_smoke_channel_o_fifodata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_iowr_bl_smoke_channel_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_ack : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_smoke_producer0_smoke_producer3 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_smoke_producer0_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_smoke_producer0_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_src_sync_buffer_smoke_producer0 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_smoke_producer_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal smoke_producer_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal smoke_producer_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal smoke_producer_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_iowr_bl_smoke_channel_o_fifodata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_iowr_bl_smoke_channel_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_syncbuf_src_sync_buffer_smoke_producer_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_src_sync_buffer_smoke_producer_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_src_sync_buffer_smoke_producer_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_12_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_12_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_13_q : STD_LOGIC_VECTOR (50 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_14_q : STD_LOGIC_VECTOR (34 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_14_qint : STD_LOGIC_VECTOR (34 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_15_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_smoke_producer_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_smoke_producer_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_smoke_producer0_smoke_producer_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_smoke_producer0_smoke_producer_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_src_sync_buffer_smoke_producer_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_src_sync_buffer_smoke_producer_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_smoke_producer_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_smoke_producer_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_smoke_producer_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_smoke_producer0_smoke_producer_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_smoke_producer0_smoke_producer_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_smoke_producer0_smoke_producer_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_src_sync_buffer_smoke_producer_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_src_sync_buffer_smoke_producer_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_src_sync_buffer_smoke_producer_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_src_sync_buffer_smoke_producer_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,99)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= smoke_producer_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,83)
    bubble_join_stall_entry_q <= in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,84)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));

    -- smoke_producer_B0_merge_reg_aunroll_x(BLACKBOX,26)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thesmoke_producer_B0_merge_reg_aunroll_x : smoke_producer_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_smoke_producer_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => smoke_producer_B0_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => smoke_producer_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => smoke_producer_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_smoke_producer_B0_merge_reg_aunroll_x(STALLENABLE,92)
    -- Valid signal propagation
    SE_out_smoke_producer_B0_merge_reg_aunroll_x_V0 <= SE_out_smoke_producer_B0_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_smoke_producer_B0_merge_reg_aunroll_x_backStall <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backStall or not (SE_out_smoke_producer_B0_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_smoke_producer_B0_merge_reg_aunroll_x_wireValid <= smoke_producer_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0(STALLENABLE,112)
    -- Valid signal propagation
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_V0 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_V1 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_src_sync_buffer_smoke_producer_backStall and SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_1 <= i_syncbuf_src_sync_buffer_smoke_producer_out_stall_out and SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_or0 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backEN <= not (SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_1 or SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_v_s_0 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backEN and SE_out_smoke_producer_B0_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backStall <= not (SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_v_s_0);
    SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_0 and SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_1 and SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_syncbuf_src_sync_buffer_smoke_producer(BLACKBOX,36)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_src_sync_buffer_smoke_producer : i_syncbuf_src_sync_buffer_smoke_producer0
    PORT MAP (
        in_buffer_in => in_src,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_src_sync_buffer_smoke_producer_backStall,
        in_valid_in => SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_V1,
        out_buffer_out => i_syncbuf_src_sync_buffer_smoke_producer_out_buffer_out,
        out_stall_out => i_syncbuf_src_sync_buffer_smoke_producer_out_stall_out,
        out_valid_out => i_syncbuf_src_sync_buffer_smoke_producer_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_src_sync_buffer_smoke_producer(STALLENABLE,98)
    -- Valid signal propagation
    SE_out_i_syncbuf_src_sync_buffer_smoke_producer_V0 <= SE_out_i_syncbuf_src_sync_buffer_smoke_producer_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_src_sync_buffer_smoke_producer_backStall <= i_load_unnamed_smoke_producer0_smoke_producer_out_o_stall or not (SE_out_i_syncbuf_src_sync_buffer_smoke_producer_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_src_sync_buffer_smoke_producer_and0 <= i_syncbuf_src_sync_buffer_smoke_producer_out_valid_out;
    SE_out_i_syncbuf_src_sync_buffer_smoke_producer_wireValid <= SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_src_sync_buffer_smoke_producer_and0;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_multconst_x(CONSTANT,19)
    i_arrayidx_smoke_producer_smoke_producer2_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- bubble_join_smoke_producer_B0_merge_reg_aunroll_x(BITJOIN,72)
    bubble_join_smoke_producer_B0_merge_reg_aunroll_x_q <= smoke_producer_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_smoke_producer_B0_merge_reg_aunroll_x(BITSELECT,73)
    bubble_select_smoke_producer_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_smoke_producer_B0_merge_reg_aunroll_x_q(31 downto 0));

    -- i_idxprom_smoke_producer_sel_x(BITSELECT,25)@1
    i_idxprom_smoke_producer_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_smoke_producer_B0_merge_reg_aunroll_x_b(31 downto 0)), 64)));

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select(BITSELECT,68)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_b <= i_idxprom_smoke_producer_sel_x_b(15 downto 0);
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_c <= i_idxprom_smoke_producer_sel_x_b(31 downto 16);
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_d <= i_idxprom_smoke_producer_sel_x_b(47 downto 32);
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_e <= i_idxprom_smoke_producer_sel_x_b(63 downto 48);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_im9_shift0(BITSHIFT,67)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im9_shift0_qint <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im9_shift0_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_im9_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_15(BITSHIFT,60)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_producer_smoke_producer2_mult_x_im9_shift0_q) & "0000000000000";
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_15_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_15_qint(31 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_im3_shift0(BITSHIFT,65)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im3_shift0_qint <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im3_shift0_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_im3_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_14(BITSHIFT,59)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_producer_smoke_producer2_mult_x_im3_shift0_q) & "0000000000000000";
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_14_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_14_qint(34 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_16(BITJOIN,61)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_16_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_15_q & i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_14_q;

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_im6_shift0(BITSHIFT,66)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im6_shift0_qint <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im6_shift0_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_im6_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_12(BITSHIFT,57)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_producer_smoke_producer2_mult_x_im6_shift0_q) & "0000000000000";
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_12_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_12_qint(31 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_im0_shift0(BITSHIFT,64)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im0_shift0_qint <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_im0_shift0_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_im0_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_13(BITJOIN,58)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_13_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_producer_smoke_producer2_mult_x_im0_shift0_q);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0(ADD,62)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000000" & i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_13_q);
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_producer_smoke_producer2_mult_x_join_16_q);
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_b));
    i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_mult_extender_x(BITJOIN,18)@1
    i_arrayidx_smoke_producer_smoke_producer2_mult_extender_x_q <= i_arrayidx_smoke_producer_smoke_producer2_mult_multconst_x_q & i_arrayidx_smoke_producer_smoke_producer2_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x(BITSELECT,20)@1
    i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b <= i_arrayidx_smoke_producer_smoke_producer2_mult_extender_x_q(63 downto 0);

    -- redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0(REG,70)
    redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_src_sync_buffer_smoke_producer(BITJOIN,80)
    bubble_join_i_syncbuf_src_sync_buffer_smoke_producer_q <= i_syncbuf_src_sync_buffer_smoke_producer_out_buffer_out;

    -- bubble_select_i_syncbuf_src_sync_buffer_smoke_producer(BITSELECT,81)
    bubble_select_i_syncbuf_src_sync_buffer_smoke_producer_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_src_sync_buffer_smoke_producer_q(63 downto 0));

    -- i_arrayidx_smoke_producer_smoke_producer2_add_x(ADD,21)@2
    i_arrayidx_smoke_producer_smoke_producer2_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_src_sync_buffer_smoke_producer_b);
    i_arrayidx_smoke_producer_smoke_producer2_add_x_b <= STD_LOGIC_VECTOR("0" & redist0_i_arrayidx_smoke_producer_smoke_producer2_trunc_sel_x_b_1_0_q);
    i_arrayidx_smoke_producer_smoke_producer2_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_smoke_producer_smoke_producer2_add_x_a) + UNSIGNED(i_arrayidx_smoke_producer_smoke_producer2_add_x_b));
    i_arrayidx_smoke_producer_smoke_producer2_add_x_q <= i_arrayidx_smoke_producer_smoke_producer2_add_x_o(64 downto 0);

    -- i_arrayidx_smoke_producer_smoke_producer2_dupName_0_trunc_sel_x(BITSELECT,15)@2
    i_arrayidx_smoke_producer_smoke_producer2_dupName_0_trunc_sel_x_b <= i_arrayidx_smoke_producer_smoke_producer2_add_x_q(63 downto 0);

    -- i_load_unnamed_smoke_producer0_smoke_producer(BLACKBOX,35)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata@4
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_unnamed_smoke_producer0_avm_address@20000000
    -- out out_unnamed_smoke_producer0_avm_burstcount@20000000
    -- out out_unnamed_smoke_producer0_avm_byteenable@20000000
    -- out out_unnamed_smoke_producer0_avm_enable@20000000
    -- out out_unnamed_smoke_producer0_avm_read@20000000
    -- out out_unnamed_smoke_producer0_avm_write@20000000
    -- out out_unnamed_smoke_producer0_avm_writedata@20000000
    thei_load_unnamed_smoke_producer0_smoke_producer : i_load_unnamed_smoke_producer0_smoke_producer3
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_smoke_producer_smoke_producer2_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_smoke_producer0_smoke_producer_backStall,
        in_i_valid => SE_out_i_syncbuf_src_sync_buffer_smoke_producer_V0,
        in_lsu_unnamed_smoke_producer0_streset_stream_reset => in_lsu_unnamed_smoke_producer0_streset_stream_reset,
        in_lsu_unnamed_smoke_producer0_sts_stream_size => in_lsu_unnamed_smoke_producer0_sts_stream_size,
        in_stream_base_addr => i_arrayidx_smoke_producer_smoke_producer2_dupName_0_trunc_sel_x_b,
        in_unnamed_smoke_producer0_avm_readdata => in_unnamed_smoke_producer0_avm_readdata,
        in_unnamed_smoke_producer0_avm_readdatavalid => in_unnamed_smoke_producer0_avm_readdatavalid,
        in_unnamed_smoke_producer0_avm_waitrequest => in_unnamed_smoke_producer0_avm_waitrequest,
        in_unnamed_smoke_producer0_avm_writeack => in_unnamed_smoke_producer0_avm_writeack,
        out_o_readdata => i_load_unnamed_smoke_producer0_smoke_producer_out_o_readdata,
        out_o_stall => i_load_unnamed_smoke_producer0_smoke_producer_out_o_stall,
        out_o_valid => i_load_unnamed_smoke_producer0_smoke_producer_out_o_valid,
        out_unnamed_smoke_producer0_avm_address => i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_address,
        out_unnamed_smoke_producer0_avm_burstcount => i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_burstcount,
        out_unnamed_smoke_producer0_avm_byteenable => i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_byteenable,
        out_unnamed_smoke_producer0_avm_enable => i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_enable,
        out_unnamed_smoke_producer0_avm_read => i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_read,
        out_unnamed_smoke_producer0_avm_write => i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_write,
        out_unnamed_smoke_producer0_avm_writedata => i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_unnamed_smoke_producer0_smoke_producer(STALLENABLE,96)
    -- Valid signal propagation
    SE_out_i_load_unnamed_smoke_producer0_smoke_producer_V0 <= SE_out_i_load_unnamed_smoke_producer0_smoke_producer_wireValid;
    -- Backward Stall generation
    SE_out_i_load_unnamed_smoke_producer0_smoke_producer_backStall <= i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_o_stall or not (SE_out_i_load_unnamed_smoke_producer0_smoke_producer_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_smoke_producer0_smoke_producer_wireValid <= i_load_unnamed_smoke_producer0_smoke_producer_out_o_valid;

    -- SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer(STALLENABLE,94)
    -- Valid signal propagation
    SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_V0 <= SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_wireValid;
    -- Backward Stall generation
    SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_backStall <= in_stall_in or not (SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_wireValid <= i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_o_valid;

    -- bubble_join_i_load_unnamed_smoke_producer0_smoke_producer(BITJOIN,77)
    bubble_join_i_load_unnamed_smoke_producer0_smoke_producer_q <= i_load_unnamed_smoke_producer0_smoke_producer_out_o_readdata;

    -- bubble_select_i_load_unnamed_smoke_producer0_smoke_producer(BITSELECT,78)
    bubble_select_i_load_unnamed_smoke_producer0_smoke_producer_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_smoke_producer0_smoke_producer_q(31 downto 0));

    -- i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer(BLACKBOX,34)@4
    -- in in_i_stall@20000000
    -- out out_iowr_bl_smoke_channel_o_fifodata@20000000
    -- out out_iowr_bl_smoke_channel_o_fifovalid@20000000
    -- out out_o_stall@20000000
    thei_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer : i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer5
    PORT MAP (
        in_i_data => bubble_select_i_load_unnamed_smoke_producer0_smoke_producer_b,
        in_i_stall => SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_backStall,
        in_i_valid => SE_out_i_load_unnamed_smoke_producer0_smoke_producer_V0,
        in_iowr_bl_smoke_channel_i_fifoready => in_iowr_bl_smoke_channel_i_fifoready,
        out_iowr_bl_smoke_channel_o_fifodata => i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_iowr_bl_smoke_channel_o_fifodata,
        out_iowr_bl_smoke_channel_o_fifovalid => i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_iowr_bl_smoke_channel_o_fifovalid,
        out_o_stall => i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_o_stall,
        out_o_valid => i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_iowr_bl_smoke_channel_o_fifodata <= i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_iowr_bl_smoke_channel_o_fifodata;
    out_iowr_bl_smoke_channel_o_fifovalid <= i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_out_iowr_bl_smoke_channel_o_fifovalid;

    -- dupName_0_sync_out_x(GPOUT,8)@4
    out_valid_out <= SE_out_i_iowr_bl_smoke_channel_unnamed_smoke_producer1_smoke_producer_V0;

    -- ext_sig_sync_out(GPOUT,31)
    out_unnamed_smoke_producer0_avm_address <= i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_address;
    out_unnamed_smoke_producer0_avm_enable <= i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_enable;
    out_unnamed_smoke_producer0_avm_read <= i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_read;
    out_unnamed_smoke_producer0_avm_write <= i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_write;
    out_unnamed_smoke_producer0_avm_writedata <= i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_writedata;
    out_unnamed_smoke_producer0_avm_byteenable <= i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_byteenable;
    out_unnamed_smoke_producer0_avm_burstcount <= i_load_unnamed_smoke_producer0_smoke_producer_out_unnamed_smoke_producer0_avm_burstcount;

    -- sync_out(GPOUT,44)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
