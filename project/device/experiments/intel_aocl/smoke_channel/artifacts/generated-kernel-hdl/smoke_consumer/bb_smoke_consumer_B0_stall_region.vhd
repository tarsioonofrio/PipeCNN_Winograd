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

-- VHDL created from bb_smoke_consumer_B0_stall_region
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

entity bb_smoke_consumer_B0_stall_region is
    port (
        in_lsu_unnamed_smoke_consumer1_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_smoke_consumer1_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_smoke_consumer1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_consumer1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_consumer1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_consumer1_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_smoke_consumer1_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_smoke_consumer1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_smoke_consumer1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_smoke_consumer1_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_consumer1_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_smoke_consumer1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_consumer1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_consumer1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_smoke_channel_i_fifodata : in std_logic_vector(31 downto 0);  -- ufix32
        in_iord_bl_smoke_channel_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_smoke_channel_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        in_dst : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_smoke_consumer_B0_stall_region;

architecture normal of bb_smoke_consumer_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component smoke_consumer_B0_merge_reg is
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


    component i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer0 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_smoke_channel_i_fifodata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_iord_bl_smoke_channel_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_smoke_channel_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_smoke_consumer1_smoke_consumer4 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_smoke_consumer1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_smoke_consumer1_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_smoke_consumer1_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_smoke_consumer1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_consumer1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_consumer1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_smoke_consumer1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_consumer1_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_smoke_consumer1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_smoke_consumer1_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_smoke_consumer1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_consumer1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_consumer1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_consumer1_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_dst_sync_buffer_smoke_consumer1 is
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
    signal i_arrayidx_smoke_consumer_smoke_consumer3_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_smoke_consumer_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal smoke_consumer_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal smoke_consumer_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal smoke_consumer_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_iord_bl_smoke_channel_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_data : STD_LOGIC_VECTOR (31 downto 0);
    signal i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_lsu_unnamed_smoke_consumer1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_syncbuf_dst_sync_buffer_smoke_consumer_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_dst_sync_buffer_smoke_consumer_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_dst_sync_buffer_smoke_consumer_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_12_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_12_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_13_q : STD_LOGIC_VECTOR (50 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_14_q : STD_LOGIC_VECTOR (34 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_14_qint : STD_LOGIC_VECTOR (34 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_15_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_smoke_consumer_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_smoke_consumer_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_dst_sync_buffer_smoke_consumer_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_dst_sync_buffer_smoke_consumer_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_smoke_consumer_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_smoke_consumer_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_smoke_consumer_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- i_syncbuf_dst_sync_buffer_smoke_consumer(BLACKBOX,37)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_dst_sync_buffer_smoke_consumer : i_syncbuf_dst_sync_buffer_smoke_consumer1
    PORT MAP (
        in_buffer_in => in_dst,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_backStall,
        in_valid_in => SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V2,
        out_buffer_out => i_syncbuf_dst_sync_buffer_smoke_consumer_out_buffer_out,
        out_stall_out => i_syncbuf_dst_sync_buffer_smoke_consumer_out_stall_out,
        out_valid_out => i_syncbuf_dst_sync_buffer_smoke_consumer_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,101)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= smoke_consumer_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,85)
    bubble_join_stall_entry_q <= in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,86)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));

    -- smoke_consumer_B0_merge_reg_aunroll_x(BLACKBOX,27)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thesmoke_consumer_B0_merge_reg_aunroll_x : smoke_consumer_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_smoke_consumer_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => smoke_consumer_B0_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => smoke_consumer_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => smoke_consumer_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_smoke_consumer_B0_merge_reg_aunroll_x(STALLENABLE,94)
    -- Valid signal propagation
    SE_out_smoke_consumer_B0_merge_reg_aunroll_x_V0 <= SE_out_smoke_consumer_B0_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_smoke_consumer_B0_merge_reg_aunroll_x_backStall <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backStall or not (SE_out_smoke_consumer_B0_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_smoke_consumer_B0_merge_reg_aunroll_x_wireValid <= smoke_consumer_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0(STALLENABLE,114)
    -- Valid signal propagation
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V0 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V1 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_1;
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V2 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_2;
    -- Stall signal propagation
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_backStall and SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_1 <= i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_stall and SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_1;
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_2 <= i_syncbuf_dst_sync_buffer_smoke_consumer_out_stall_out and SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_2;
    -- Backward Enable generation
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_or0 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_or1 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_1 or SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_or0;
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backEN <= not (SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_2 or SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_or1);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_v_s_0 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backEN and SE_out_smoke_consumer_B0_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backStall <= not (SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_v_s_0);
    SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
            SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_0 and SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_1 and SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_2 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_2 and SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_s_tv_2;
            ELSE
                SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_R_v_2 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer(BLACKBOX,35)@2
    -- in in_i_stall@20000000
    -- out out_iord_bl_smoke_channel_o_fifoready@20000000
    -- out out_o_stall@20000000
    thei_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer : i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer0
    PORT MAP (
        in_i_stall => SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_backStall,
        in_i_valid => SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V1,
        in_iord_bl_smoke_channel_i_fifodata => in_iord_bl_smoke_channel_i_fifodata,
        in_iord_bl_smoke_channel_i_fifovalid => in_iord_bl_smoke_channel_i_fifovalid,
        out_iord_bl_smoke_channel_o_fifoready => i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_iord_bl_smoke_channel_o_fifoready,
        out_o_data => i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_data,
        out_o_stall => i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_stall,
        out_o_valid => i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer(BITJOIN,78)
    bubble_join_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_q <= i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_data;

    -- bubble_select_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer(BITSELECT,79)
    bubble_select_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_b <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_q(31 downto 0));

    -- SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer(STALLENABLE,100)
    -- Valid signal propagation
    SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_V0 <= SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_backStall <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_o_stall or not (SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_and0 <= i_syncbuf_dst_sync_buffer_smoke_consumer_out_valid_out;
    SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_and1 <= SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_and0;
    SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_wireValid <= i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_o_valid and SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_and1;

    -- SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer(STALLENABLE,98)
    -- Valid signal propagation
    SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_V0 <= SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_backStall <= in_stall_in or not (SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_wireValid <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_o_valid;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_multconst_x(CONSTANT,20)
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- bubble_join_smoke_consumer_B0_merge_reg_aunroll_x(BITJOIN,73)
    bubble_join_smoke_consumer_B0_merge_reg_aunroll_x_q <= smoke_consumer_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_smoke_consumer_B0_merge_reg_aunroll_x(BITSELECT,74)
    bubble_select_smoke_consumer_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_smoke_consumer_B0_merge_reg_aunroll_x_q(31 downto 0));

    -- i_idxprom_smoke_consumer_sel_x(BITSELECT,26)@1
    i_idxprom_smoke_consumer_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_smoke_consumer_B0_merge_reg_aunroll_x_b(31 downto 0)), 64)));

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select(BITSELECT,69)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_b <= i_idxprom_smoke_consumer_sel_x_b(15 downto 0);
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_c <= i_idxprom_smoke_consumer_sel_x_b(31 downto 16);
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_d <= i_idxprom_smoke_consumer_sel_x_b(47 downto 32);
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_e <= i_idxprom_smoke_consumer_sel_x_b(63 downto 48);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im9_shift0(BITSHIFT,68)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im9_shift0_qint <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im9_shift0_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im9_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_15(BITSHIFT,61)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im9_shift0_q) & "0000000000000";
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_15_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_15_qint(31 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im3_shift0(BITSHIFT,66)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im3_shift0_qint <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im3_shift0_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im3_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_14(BITSHIFT,60)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im3_shift0_q) & "0000000000000000";
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_14_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_14_qint(34 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_16(BITJOIN,62)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_16_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_15_q & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_14_q;

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im6_shift0(BITSHIFT,67)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im6_shift0_qint <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im6_shift0_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im6_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_12(BITSHIFT,58)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im6_shift0_q) & "0000000000000";
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_12_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_12_qint(31 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im0_shift0(BITSHIFT,65)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im0_shift0_qint <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im0_shift0_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im0_shift0_qint(17 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_13(BITJOIN,59)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_13_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_im0_shift0_q);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0(ADD,63)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000000" & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_13_q);
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_join_16_q);
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_b));
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_mult_extender_x(BITJOIN,19)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_mult_extender_x_q <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_multconst_x_q & i_arrayidx_smoke_consumer_smoke_consumer3_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x(BITSELECT,21)@1
    i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b <= i_arrayidx_smoke_consumer_smoke_consumer3_mult_extender_x_q(63 downto 0);

    -- redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0(REG,71)
    redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_dst_sync_buffer_smoke_consumer(BITJOIN,82)
    bubble_join_i_syncbuf_dst_sync_buffer_smoke_consumer_q <= i_syncbuf_dst_sync_buffer_smoke_consumer_out_buffer_out;

    -- bubble_select_i_syncbuf_dst_sync_buffer_smoke_consumer(BITSELECT,83)
    bubble_select_i_syncbuf_dst_sync_buffer_smoke_consumer_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_dst_sync_buffer_smoke_consumer_q(63 downto 0));

    -- i_arrayidx_smoke_consumer_smoke_consumer3_add_x(ADD,22)@2
    i_arrayidx_smoke_consumer_smoke_consumer3_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_dst_sync_buffer_smoke_consumer_b);
    i_arrayidx_smoke_consumer_smoke_consumer3_add_x_b <= STD_LOGIC_VECTOR("0" & redist0_i_arrayidx_smoke_consumer_smoke_consumer3_trunc_sel_x_b_1_0_q);
    i_arrayidx_smoke_consumer_smoke_consumer3_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_smoke_consumer_smoke_consumer3_add_x_a) + UNSIGNED(i_arrayidx_smoke_consumer_smoke_consumer3_add_x_b));
    i_arrayidx_smoke_consumer_smoke_consumer3_add_x_q <= i_arrayidx_smoke_consumer_smoke_consumer3_add_x_o(64 downto 0);

    -- i_arrayidx_smoke_consumer_smoke_consumer3_dupName_0_trunc_sel_x(BITSELECT,16)@2
    i_arrayidx_smoke_consumer_smoke_consumer3_dupName_0_trunc_sel_x_b <= i_arrayidx_smoke_consumer_smoke_consumer3_add_x_q(63 downto 0);

    -- i_store_unnamed_smoke_consumer1_smoke_consumer(BLACKBOX,36)@2
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_smoke_consumer1_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@3
    -- out out_unnamed_smoke_consumer1_avm_address@20000000
    -- out out_unnamed_smoke_consumer1_avm_burstcount@20000000
    -- out out_unnamed_smoke_consumer1_avm_byteenable@20000000
    -- out out_unnamed_smoke_consumer1_avm_enable@20000000
    -- out out_unnamed_smoke_consumer1_avm_read@20000000
    -- out out_unnamed_smoke_consumer1_avm_write@20000000
    -- out out_unnamed_smoke_consumer1_avm_writedata@20000000
    thei_store_unnamed_smoke_consumer1_smoke_consumer : i_store_unnamed_smoke_consumer1_smoke_consumer4
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_smoke_consumer_smoke_consumer3_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_backStall,
        in_i_valid => SE_out_i_syncbuf_dst_sync_buffer_smoke_consumer_V0,
        in_i_writedata => bubble_select_i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_b,
        in_lsu_unnamed_smoke_consumer1_streset_stream_reset => in_lsu_unnamed_smoke_consumer1_streset_stream_reset,
        in_lsu_unnamed_smoke_consumer1_sts_stream_size => in_lsu_unnamed_smoke_consumer1_sts_stream_size,
        in_stream_base_addr => i_arrayidx_smoke_consumer_smoke_consumer3_dupName_0_trunc_sel_x_b,
        in_unnamed_smoke_consumer1_avm_readdata => in_unnamed_smoke_consumer1_avm_readdata,
        in_unnamed_smoke_consumer1_avm_readdatavalid => in_unnamed_smoke_consumer1_avm_readdatavalid,
        in_unnamed_smoke_consumer1_avm_waitrequest => in_unnamed_smoke_consumer1_avm_waitrequest,
        in_unnamed_smoke_consumer1_avm_writeack => in_unnamed_smoke_consumer1_avm_writeack,
        out_lsu_unnamed_smoke_consumer1_o_active => i_store_unnamed_smoke_consumer1_smoke_consumer_out_lsu_unnamed_smoke_consumer1_o_active,
        out_o_stall => i_store_unnamed_smoke_consumer1_smoke_consumer_out_o_stall,
        out_o_valid => i_store_unnamed_smoke_consumer1_smoke_consumer_out_o_valid,
        out_unnamed_smoke_consumer1_avm_address => i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_address,
        out_unnamed_smoke_consumer1_avm_burstcount => i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_burstcount,
        out_unnamed_smoke_consumer1_avm_byteenable => i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_byteenable,
        out_unnamed_smoke_consumer1_avm_enable => i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_enable,
        out_unnamed_smoke_consumer1_avm_read => i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_read,
        out_unnamed_smoke_consumer1_avm_write => i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_write,
        out_unnamed_smoke_consumer1_avm_writedata => i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_unnamed_smoke_consumer1_avm_address <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_address;
    out_unnamed_smoke_consumer1_avm_enable <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_enable;
    out_unnamed_smoke_consumer1_avm_read <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_read;
    out_unnamed_smoke_consumer1_avm_write <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_write;
    out_unnamed_smoke_consumer1_avm_writedata <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_writedata;
    out_unnamed_smoke_consumer1_avm_byteenable <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_byteenable;
    out_unnamed_smoke_consumer1_avm_burstcount <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_unnamed_smoke_consumer1_avm_burstcount;

    -- dupName_0_sync_out_x(GPOUT,8)@3
    out_valid_out <= SE_out_i_store_unnamed_smoke_consumer1_smoke_consumer_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,10)
    out_lsu_unnamed_smoke_consumer1_o_active <= i_store_unnamed_smoke_consumer1_smoke_consumer_out_lsu_unnamed_smoke_consumer1_o_active;

    -- ext_sig_sync_out(GPOUT,32)
    out_iord_bl_smoke_channel_o_fifoready <= i_iord_bl_smoke_channel_unnamed_smoke_consumer0_smoke_consumer_out_iord_bl_smoke_channel_o_fifoready;

    -- sync_out(GPOUT,45)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
