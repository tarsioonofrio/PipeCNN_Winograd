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

-- VHDL created from bb_memWrite_B1
-- VHDL created on Thu Oct  8 10:49:43 2026


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

entity bb_memWrite_B1 is
    port (
        in_bypass : in std_logic_vector(7 downto 0);  -- ufix8
        in_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_bypass_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- ufix96
        in_iord_bl_bypass_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_pool_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- ufix96
        in_iord_bl_pool_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_next_layer_padding : in std_logic_vector(7 downto 0);  -- ufix8
        in_out_dim1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_out_dim1_div_q_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_out_dim1xdim2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_out_dim2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_out_num : in std_logic_vector(31 downto 0);  -- ufix32
        in_q_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_rem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal_rem_zxq_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal_rem_zxrem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scal_rem_zxstart_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scalxq_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_scalxrem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_scalxstart_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_start_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_top : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_memWrite2_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_memWrite2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_bypass_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_pool_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_memWrite2_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_memWrite2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_memWrite2_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_memWrite2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_memWrite_B1;

architecture normal of bb_memWrite_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_memWrite_B1_stall_region is
        port (
            in_bypass : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_bypass_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_iord_bl_bypass_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_pool_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_iord_bl_pool_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_next_layer_padding : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_out_dim1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_out_dim1_div_q_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_out_dim1xdim2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_out_dim2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_out_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_q_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_rem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal_rem_zxq_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal_rem_zxrem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal_rem_zxstart_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scalxq_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scalxrem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scalxstart_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_top : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_bypass_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_pool_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_memWrite2_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memWrite_B1_branch is
        port (
            in_c0_exe11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memWrite_B1_merge is
        port (
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_memWrite_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_iord_bl_bypass_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_iord_bl_pool_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_lsu_unnamed_memWrite2_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_memWrite_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_merge_out_forked : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- memWrite_B1_branch(BLACKBOX,37)
    thememWrite_B1_branch : memWrite_B1_branch
    PORT MAP (
        in_c0_exe11 => bb_memWrite_B1_stall_region_out_c0_exe11,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_memWrite_B1_stall_region_out_valid_out,
        out_stall_out => memWrite_B1_branch_out_stall_out,
        out_valid_out_0 => memWrite_B1_branch_out_valid_out_0,
        out_valid_out_1 => memWrite_B1_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- memWrite_B1_merge(BLACKBOX,38)
    thememWrite_B1_merge : memWrite_B1_merge
    PORT MAP (
        in_forked_0 => in_forked_0,
        in_forked_1 => in_forked_1,
        in_stall_in => bb_memWrite_B1_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_forked => memWrite_B1_merge_out_forked,
        out_stall_out_0 => memWrite_B1_merge_out_stall_out_0,
        out_stall_out_1 => memWrite_B1_merge_out_stall_out_1,
        out_valid_out => memWrite_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_memWrite_B1_stall_region(BLACKBOX,2)
    thebb_memWrite_B1_stall_region : bb_memWrite_B1_stall_region
    PORT MAP (
        in_bypass => in_bypass,
        in_dim_z_edge_num => in_dim_z_edge_num,
        in_flush => in_flush,
        in_forked => memWrite_B1_merge_out_forked,
        in_iord_bl_bypass_ch_i_fifodata => in_iord_bl_bypass_ch_i_fifodata,
        in_iord_bl_bypass_ch_i_fifovalid => in_iord_bl_bypass_ch_i_fifovalid,
        in_iord_bl_pool_ch_i_fifodata => in_iord_bl_pool_ch_i_fifodata,
        in_iord_bl_pool_ch_i_fifovalid => in_iord_bl_pool_ch_i_fifovalid,
        in_next_layer_padding => in_next_layer_padding,
        in_out_dim1 => in_out_dim1,
        in_out_dim1_div_q_vec => in_out_dim1_div_q_vec,
        in_out_dim1xdim2 => in_out_dim1xdim2,
        in_out_dim2 => in_out_dim2,
        in_out_num => in_out_num,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_q_vec => in_q_vec,
        in_rem_size_x => in_rem_size_x,
        in_scal => in_scal,
        in_scal_rem_zxq_vec => in_scal_rem_zxq_vec,
        in_scal_rem_zxrem_size_x => in_scal_rem_zxrem_size_x,
        in_scal_rem_zxstart_size_x => in_scal_rem_zxstart_size_x,
        in_scalxq_vec => in_scalxq_vec,
        in_scalxrem_size_x => in_scalxrem_size_x,
        in_scalxstart_size_x => in_scalxstart_size_x,
        in_stall_in => memWrite_B1_branch_out_stall_out,
        in_start_size_x => in_start_size_x,
        in_top => in_top,
        in_unnamed_memWrite2_avm_readdata => in_unnamed_memWrite2_avm_readdata,
        in_unnamed_memWrite2_avm_readdatavalid => in_unnamed_memWrite2_avm_readdatavalid,
        in_unnamed_memWrite2_avm_waitrequest => in_unnamed_memWrite2_avm_waitrequest,
        in_unnamed_memWrite2_avm_writeack => in_unnamed_memWrite2_avm_writeack,
        in_valid_in => memWrite_B1_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out => bb_memWrite_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out => bb_memWrite_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out,
        out_c0_exe11 => bb_memWrite_B1_stall_region_out_c0_exe11,
        out_iord_bl_bypass_ch_o_fifoready => bb_memWrite_B1_stall_region_out_iord_bl_bypass_ch_o_fifoready,
        out_iord_bl_pool_ch_o_fifoready => bb_memWrite_B1_stall_region_out_iord_bl_pool_ch_o_fifoready,
        out_lsu_unnamed_memWrite2_o_active => bb_memWrite_B1_stall_region_out_lsu_unnamed_memWrite2_o_active,
        out_pipeline_valid_out => bb_memWrite_B1_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_memWrite_B1_stall_region_out_stall_out,
        out_unnamed_memWrite2_avm_address => bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_address,
        out_unnamed_memWrite2_avm_burstcount => bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_burstcount,
        out_unnamed_memWrite2_avm_byteenable => bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_byteenable,
        out_unnamed_memWrite2_avm_enable => bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_enable,
        out_unnamed_memWrite2_avm_read => bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_read,
        out_unnamed_memWrite2_avm_write => bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_write,
        out_unnamed_memWrite2_avm_writedata => bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_writedata,
        out_valid_out => bb_memWrite_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_exiting_stall_out(GPOUT,39)
    out_exiting_stall_out <= bb_memWrite_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,40)
    out_exiting_valid_out <= bb_memWrite_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out;

    -- out_iord_bl_bypass_ch_o_fifoready(GPOUT,41)
    out_iord_bl_bypass_ch_o_fifoready <= bb_memWrite_B1_stall_region_out_iord_bl_bypass_ch_o_fifoready;

    -- out_iord_bl_pool_ch_o_fifoready(GPOUT,42)
    out_iord_bl_pool_ch_o_fifoready <= bb_memWrite_B1_stall_region_out_iord_bl_pool_ch_o_fifoready;

    -- out_lsu_unnamed_memWrite2_o_active(GPOUT,43)
    out_lsu_unnamed_memWrite2_o_active <= bb_memWrite_B1_stall_region_out_lsu_unnamed_memWrite2_o_active;

    -- out_stall_out_0(GPOUT,44)
    out_stall_out_0 <= memWrite_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,45)
    out_stall_out_1 <= memWrite_B1_merge_out_stall_out_1;

    -- out_unnamed_memWrite2_avm_address(GPOUT,46)
    out_unnamed_memWrite2_avm_address <= bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_address;

    -- out_unnamed_memWrite2_avm_burstcount(GPOUT,47)
    out_unnamed_memWrite2_avm_burstcount <= bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_burstcount;

    -- out_unnamed_memWrite2_avm_byteenable(GPOUT,48)
    out_unnamed_memWrite2_avm_byteenable <= bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_byteenable;

    -- out_unnamed_memWrite2_avm_enable(GPOUT,49)
    out_unnamed_memWrite2_avm_enable <= bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_enable;

    -- out_unnamed_memWrite2_avm_read(GPOUT,50)
    out_unnamed_memWrite2_avm_read <= bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_read;

    -- out_unnamed_memWrite2_avm_write(GPOUT,51)
    out_unnamed_memWrite2_avm_write <= bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_write;

    -- out_unnamed_memWrite2_avm_writedata(GPOUT,52)
    out_unnamed_memWrite2_avm_writedata <= bb_memWrite_B1_stall_region_out_unnamed_memWrite2_avm_writedata;

    -- out_valid_out_0(GPOUT,53)
    out_valid_out_0 <= memWrite_B1_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,54)
    out_valid_out_1 <= memWrite_B1_branch_out_valid_out_1;

    -- pipeline_valid_out_sync(GPOUT,56)
    out_pipeline_valid_out <= bb_memWrite_B1_stall_region_out_pipeline_valid_out;

END normal;
