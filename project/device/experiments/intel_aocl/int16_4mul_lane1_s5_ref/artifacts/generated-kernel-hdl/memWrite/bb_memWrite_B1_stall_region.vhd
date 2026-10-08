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

-- VHDL created from bb_memWrite_B1_stall_region
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

entity bb_memWrite_B1_stall_region is
    port (
        in_iord_bl_bypass_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- ufix96
        in_iord_bl_bypass_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_pool_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        in_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_memWrite2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_bypass_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_memWrite2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_memWrite2_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_memWrite2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_next_layer_padding : in std_logic_vector(7 downto 0);  -- ufix8
        out_lsu_unnamed_memWrite2_o_active : out std_logic_vector(0 downto 0);  -- ufix1
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
        in_start_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_top : in std_logic_vector(63 downto 0);  -- ufix64
        in_iord_bl_pool_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- ufix96
        in_iord_bl_pool_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_bypass : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_memWrite_B1_stall_region;

architecture normal of bb_memWrite_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite149 is
        port (
            in_c0_exe4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_bypass_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_iord_bl_bypass_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_iord_bl_bypass_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_iord_bl_pool_ch_unnamed_memwrite0_memwrite148 is
        port (
            in_c0_exe2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_pool_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_iord_bl_pool_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_iord_bl_pool_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_while_body_memwrite_c0_enter_memwrite is
        port (
            in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni1_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_bypass : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_start_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_top : in std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_while_body_memwrite_c1_enter_memwrite is
        port (
            in_c1_eni9_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni9_1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_4 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_5 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_6 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_7 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_8 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_9 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_10 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_11 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_12 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni9_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni9_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni9_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni9_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni9_17 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c1_eni9_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni9_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memWrite_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_memwrite2_memwrite168 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_memWrite2_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_iord_bl_bypass_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_iord_bl_pool_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (255 downto 0);
    signal i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_lsu_unnamed_memWrite2_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_c : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_d : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_e : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_f : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_g : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_c : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_d : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_e : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_f : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_g : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q : STD_LOGIC_VECTOR (80 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_g : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_b : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_join_memWrite_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_memWrite_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_memWrite_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_memwrite2_memwrite_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_memwrite2_memwrite_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_memwrite2_memwrite_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_memwrite2_memwrite_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_D0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x(BLACKBOX,39)@13
    -- in in_i_stall@20000000
    -- out out_iord_bl_bypass_ch_o_fifoready@20000000
    -- out out_o_stall@20000000
    thei_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x : i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite149
    PORT MAP (
        in_c0_exe4 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_e,
        in_i_stall => SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V2,
        in_iord_bl_bypass_ch_i_fifodata => in_iord_bl_bypass_ch_i_fifodata,
        in_iord_bl_bypass_ch_i_fifovalid => in_iord_bl_bypass_ch_i_fifovalid,
        out_o_data_0 => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_0,
        out_o_data_1 => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_1,
        out_o_data_2 => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_2,
        out_o_data_3 => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_3,
        out_o_data_4 => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_4,
        out_o_data_5 => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_5,
        out_iord_bl_bypass_ch_o_fifoready => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_iord_bl_bypass_ch_o_fifoready,
        out_o_stall => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_stall,
        out_o_valid => i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_0(REG,72)
    redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backEN = "1") THEN
                redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_l);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_1(REG,73)
    redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backEN = "1") THEN
                redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_1_q <= STD_LOGIC_VECTOR(redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_2(REG,74)
    redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backEN = "1") THEN
                redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_2_q <= STD_LOGIC_VECTOR(redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_3(REG,75)
    redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN = "1") THEN
                redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_3_q <= STD_LOGIC_VECTOR(redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_stall_entry(STALLENABLE,113)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= memWrite_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,95)
    bubble_join_stall_entry_q <= in_forked;

    -- bubble_select_stall_entry(BITSELECT,96)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));

    -- memWrite_B1_merge_reg_aunroll_x(BLACKBOX,43)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thememWrite_B1_merge_reg_aunroll_x : memWrite_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_memWrite_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => memWrite_B1_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => memWrite_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => memWrite_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_memWrite_B1_merge_reg_aunroll_x(BITJOIN,91)
    bubble_join_memWrite_B1_merge_reg_aunroll_x_q <= memWrite_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_memWrite_B1_merge_reg_aunroll_x(BITSELECT,92)
    bubble_select_memWrite_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_memWrite_B1_merge_reg_aunroll_x_q(0 downto 0));

    -- SE_out_memWrite_B1_merge_reg_aunroll_x(STALLENABLE,110)
    SE_out_memWrite_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_memWrite_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_memWrite_B1_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_memWrite_B1_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_o_stall) and SE_out_memWrite_B1_merge_reg_aunroll_x_wireValid) or SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_memWrite_B1_merge_reg_aunroll_x_consumed1 <= (not (redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out) and SE_out_memWrite_B1_merge_reg_aunroll_x_wireValid) or SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_memWrite_B1_merge_reg_aunroll_x_StallValid <= SE_out_memWrite_B1_merge_reg_aunroll_x_backStall and SE_out_memWrite_B1_merge_reg_aunroll_x_wireValid;
    SE_out_memWrite_B1_merge_reg_aunroll_x_toReg0 <= SE_out_memWrite_B1_merge_reg_aunroll_x_StallValid and SE_out_memWrite_B1_merge_reg_aunroll_x_consumed0;
    SE_out_memWrite_B1_merge_reg_aunroll_x_toReg1 <= SE_out_memWrite_B1_merge_reg_aunroll_x_StallValid and SE_out_memWrite_B1_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_memWrite_B1_merge_reg_aunroll_x_or0 <= SE_out_memWrite_B1_merge_reg_aunroll_x_consumed0;
    SE_out_memWrite_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_memWrite_B1_merge_reg_aunroll_x_consumed1 and SE_out_memWrite_B1_merge_reg_aunroll_x_or0);
    SE_out_memWrite_B1_merge_reg_aunroll_x_backStall <= SE_out_memWrite_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_memWrite_B1_merge_reg_aunroll_x_V0 <= SE_out_memWrite_B1_merge_reg_aunroll_x_wireValid and not (SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_memWrite_B1_merge_reg_aunroll_x_V1 <= SE_out_memWrite_B1_merge_reg_aunroll_x_wireValid and not (SE_out_memWrite_B1_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_memWrite_B1_merge_reg_aunroll_x_wireValid <= memWrite_B1_merge_reg_aunroll_x_out_valid_out;

    -- redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo(STALLFIFO,63)
    redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in <= SE_out_memWrite_B1_merge_reg_aunroll_x_V1;
    redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in <= SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_backStall;
    redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_in <= bubble_select_memWrite_B1_merge_reg_aunroll_x_b;
    redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in_bitsignaltemp <= redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in(0);
    redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in_bitsignaltemp <= redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in(0);
    redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out(0) <= redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out_bitsignaltemp;
    redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out(0) <= redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out_bitsignaltemp;
    theredist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_memWrite_B1_merge_reg_aunroll_x_b,
        valid_out => redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out_bitsignaltemp,
        data_out => redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo(BITJOIN,99)
    bubble_join_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_q <= redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_out;

    -- bubble_select_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo(BITSELECT,100)
    bubble_select_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_q(0 downto 0));

    -- bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x(BITJOIN,79)
    bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q <= i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_5 & i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_4 & i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_3 & i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_2 & i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_1 & i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_data_0;

    -- bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x(BITSELECT,80)
    bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q(15 downto 0));
    bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q(31 downto 16));
    bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q(47 downto 32));
    bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q(63 downto 48));
    bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q(79 downto 64));
    bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_q(95 downto 80));

    -- bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x(BITJOIN,82)
    bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q <= i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_5 & i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_4 & i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_3 & i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_2 & i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_1 & i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_0;

    -- bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x(BITSELECT,83)
    bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q(15 downto 0));
    bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q(31 downto 16));
    bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q(47 downto 32));
    bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q(63 downto 48));
    bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q(79 downto 64));
    bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_q(95 downto 80));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x(BLACKBOX,42)@13
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@17
    -- out out_c1_exit_1@17
    -- out out_o_stall@20000000
    -- out out_o_valid@17
    thei_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x : i_sfc_c1_while_body_memwrite_c1_enter_memwrite
    PORT MAP (
        in_c1_eni9_0 => GND_q,
        in_c1_eni9_1 => bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_b,
        in_c1_eni9_2 => bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_c,
        in_c1_eni9_3 => bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_d,
        in_c1_eni9_4 => bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_e,
        in_c1_eni9_5 => bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_f,
        in_c1_eni9_6 => bubble_select_i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_g,
        in_c1_eni9_7 => bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_b,
        in_c1_eni9_8 => bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_c,
        in_c1_eni9_9 => bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_d,
        in_c1_eni9_10 => bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_e,
        in_c1_eni9_11 => bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_f,
        in_c1_eni9_12 => bubble_select_i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_g,
        in_c1_eni9_13 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_d,
        in_c1_eni9_14 => bubble_select_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_b,
        in_c1_eni9_15 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_f,
        in_c1_eni9_16 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_b,
        in_c1_eni9_17 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_g,
        in_c1_eni9_18 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_h,
        in_c1_eni9_19 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_i,
        in_c0_exe1 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_b,
        in_forked => bubble_select_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_b,
        in_i_stall => SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_backStall,
        in_i_valid => SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_V0,
        out_c1_exit_1 => i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_c1_exit_1,
        out_o_stall => i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x(BITJOIN,88)
    bubble_join_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_q <= i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_c1_exit_1;

    -- bubble_select_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x(BITSELECT,89)
    bubble_select_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_q(255 downto 0));

    -- redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_0(REG,68)
    redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backEN = "1") THEN
                redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_k);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_1(REG,69)
    redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backEN = "1") THEN
                redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_1_q <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_2(REG,70)
    redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backEN = "1") THEN
                redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_2_q <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_3(REG,71)
    redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN = "1") THEN
                redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_3_q <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0(REG,64)
    redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backEN = "1") THEN
                redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_j);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1(REG,65)
    redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backEN = "1") THEN
                redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_q <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2(REG,66)
    redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backEN = "1") THEN
                redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_q <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3(REG,67)
    redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN = "1") THEN
                redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_q <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_store_unnamed_memwrite2_memwrite(BLACKBOX,49)@17
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_memWrite2_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@19
    -- out out_unnamed_memWrite2_avm_address@20000000
    -- out out_unnamed_memWrite2_avm_burstcount@20000000
    -- out out_unnamed_memWrite2_avm_byteenable@20000000
    -- out out_unnamed_memWrite2_avm_enable@20000000
    -- out out_unnamed_memWrite2_avm_read@20000000
    -- out out_unnamed_memWrite2_avm_write@20000000
    -- out out_unnamed_memWrite2_avm_writedata@20000000
    thei_store_unnamed_memwrite2_memwrite : i_store_unnamed_memwrite2_memwrite168
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_q,
        in_i_predicate => redist2_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10_4_3_q,
        in_i_stall => SE_out_i_store_unnamed_memwrite2_memwrite_backStall,
        in_i_valid => SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_V0,
        in_i_writedata => bubble_select_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_b,
        in_unnamed_memWrite2_avm_readdata => in_unnamed_memWrite2_avm_readdata,
        in_unnamed_memWrite2_avm_readdatavalid => in_unnamed_memWrite2_avm_readdatavalid,
        in_unnamed_memWrite2_avm_waitrequest => in_unnamed_memWrite2_avm_waitrequest,
        in_unnamed_memWrite2_avm_writeack => in_unnamed_memWrite2_avm_writeack,
        out_lsu_unnamed_memWrite2_o_active => i_store_unnamed_memwrite2_memwrite_out_lsu_unnamed_memWrite2_o_active,
        out_o_stall => i_store_unnamed_memwrite2_memwrite_out_o_stall,
        out_o_valid => i_store_unnamed_memwrite2_memwrite_out_o_valid,
        out_unnamed_memWrite2_avm_address => i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_address,
        out_unnamed_memWrite2_avm_burstcount => i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_burstcount,
        out_unnamed_memWrite2_avm_byteenable => i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_byteenable,
        out_unnamed_memWrite2_avm_enable => i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_enable,
        out_unnamed_memWrite2_avm_read => i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_read,
        out_unnamed_memWrite2_avm_write => i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_write,
        out_unnamed_memWrite2_avm_writedata => i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_store_unnamed_memwrite2_memwrite(STALLENABLE,112)
    -- Valid signal propagation
    SE_out_i_store_unnamed_memwrite2_memwrite_V0 <= SE_out_i_store_unnamed_memwrite2_memwrite_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_memwrite2_memwrite_backStall <= in_stall_in or not (SE_out_i_store_unnamed_memwrite2_memwrite_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_memwrite2_memwrite_and0 <= i_store_unnamed_memwrite2_memwrite_out_o_valid;
    SE_out_i_store_unnamed_memwrite2_memwrite_wireValid <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_V0 and SE_out_i_store_unnamed_memwrite2_memwrite_and0;

    -- SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5(STALLENABLE,130)
    -- Valid signal propagation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_V0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_R_v_0;
    -- Stall signal propagation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_s_tv_0 <= SE_out_i_store_unnamed_memwrite2_memwrite_backStall and SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_R_v_0;
    -- Backward Enable generation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backEN <= not (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_v_s_0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backEN and SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_V0;
    -- Backward Stall generation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backStall <= not (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_v_s_0);
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backEN = "0") THEN
                SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_R_v_0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_R_v_0 and SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_s_tv_0;
            ELSE
                SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_R_v_0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4(STALLENABLE,129)
    -- Valid signal propagation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_V0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_R_v_0;
    -- Stall signal propagation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_s_tv_0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backStall and SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_R_v_0;
    -- Backward Enable generation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backEN <= not (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_v_s_0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backEN and SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_V;
    -- Backward Stall generation
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backStall <= not (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backEN);
    SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backEN = "0") THEN
                SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_R_v_0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_R_v_0 and SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_s_tv_0;
            ELSE
                SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_R_v_0 <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4(STALLREG,163)
    SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid <= (others => '0');
            SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid <= SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backStall and (SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid or SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_i_valid);

            IF (SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_data0 <= STD_LOGIC_VECTOR(redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_i_valid <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_V1;
    -- Stall signal propagation
    SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backStall <= SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid or not (SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_i_valid);

    -- Valid
    SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_V <= SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid WHEN SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid = "1" ELSE SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_i_valid;

    SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_D0 <= SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_data0 WHEN SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_r_valid = "1" ELSE redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_3_q;

    -- SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x(STALLENABLE,108)
    -- Valid signal propagation
    SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_V0 <= SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_backStall <= i_store_unnamed_memwrite2_memwrite_out_o_stall or not (SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_and0 <= i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_o_valid;
    SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_wireValid <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_V0 and SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_and0;

    -- SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3(STALLENABLE,120)
    -- Valid signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_V0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_0;
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_V1 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_1;
    -- Stall signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_0 <= SE_out_i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_backStall and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_0;
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_1 <= SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backStall and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_1;
    -- Backward Enable generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_or0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_0;
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_1 or SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_v_s_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_V0;
    -- Backward Stall generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backStall <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_v_s_0);
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_0 <= (others => '0');
            SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN = "0") THEN
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_0 and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_0;
            ELSE
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_v_s_0;
            END IF;

            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backEN = "0") THEN
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_1 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_1 and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_s_tv_1;
            ELSE
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_R_v_1 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2(STALLENABLE,119)
    -- Valid signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_V0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_R_v_0;
    -- Stall signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_s_tv_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_3_backStall and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_R_v_0;
    -- Backward Enable generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backEN <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_v_s_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backEN and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_V0;
    -- Backward Stall generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backStall <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_v_s_0);
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backEN = "0") THEN
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_R_v_0 and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_s_tv_0;
            ELSE
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1(STALLENABLE,118)
    -- Valid signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_V0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_R_v_0;
    -- Stall signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_s_tv_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_2_backStall and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_R_v_0;
    -- Backward Enable generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backEN <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_v_s_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backEN and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_V0;
    -- Backward Stall generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backStall <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_v_s_0);
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backEN = "0") THEN
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_R_v_0 and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_s_tv_0;
            ELSE
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0(STALLENABLE,117)
    -- Valid signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_V0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_s_tv_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_1_backStall and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backEN <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_v_s_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backEN and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backStall <= not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_v_s_0);
    SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backEN = "0") THEN
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_R_v_0 and SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_s_tv_0;
            ELSE
                SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_R_v_0 <= SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x(BLACKBOX,41)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@13
    -- out out_c0_exit_1@13
    -- out out_c0_exit_2@13
    -- out out_c0_exit_3@13
    -- out out_c0_exit_4@13
    -- out out_c0_exit_5@13
    -- out out_c0_exit_6@13
    -- out out_c0_exit_7@13
    -- out out_c0_exit_8@13
    -- out out_c0_exit_9@13
    -- out out_c0_exit_10@13
    -- out out_c0_exit_11@13
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@13
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x : i_sfc_c0_while_body_memwrite_c0_enter_memwrite
    PORT MAP (
        in_c0_eni1_0 => GND_q,
        in_c0_eni1_1 => bubble_select_memWrite_B1_merge_reg_aunroll_x_b,
        in_bypass => in_bypass,
        in_dim_z_edge_num => in_dim_z_edge_num,
        in_i_stall => SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_backStall,
        in_i_valid => SE_out_memWrite_B1_merge_reg_aunroll_x_V0,
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
        in_start_size_x => in_start_size_x,
        in_top => in_top,
        out_c0_exit_1 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_1,
        out_c0_exit_2 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_2,
        out_c0_exit_3 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_3,
        out_c0_exit_4 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_4,
        out_c0_exit_5 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_5,
        out_c0_exit_6 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_6,
        out_c0_exit_7 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_7,
        out_c0_exit_8 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_8,
        out_c0_exit_9 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9,
        out_c0_exit_10 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10,
        out_c0_exit_11 => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out,
        out_o_stall => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x(STALLENABLE,106)
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg3 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed0 <= (not (SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_backStall) and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid) or SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed1 <= (not (SE_redist1_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9_4_0_backStall) and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid) or SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed2 <= (not (i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_stall) and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid) or SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg2;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed3 <= (not (i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_stall) and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid) or SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg3;
    -- Consuming
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_StallValid <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_backStall and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg0 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_StallValid and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed0;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg1 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_StallValid and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed1;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg2 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_StallValid and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed2;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_toReg3 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_StallValid and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed3;
    -- Backward Stall generation
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or0 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed0;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or1 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed1 and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or0;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or2 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed2 and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or1;
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_consumed3 and SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_or2);
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_backStall <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V0 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid and not (SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V1 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid and not (SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V2 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid and not (SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg2);
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V3 <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid and not (SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_fromReg3);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_wireValid <= i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_o_valid;

    -- SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo(STALLENABLE,116)
    -- Valid signal propagation
    SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_V0 <= SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_backStall <= i_sfc_c1_while_body_memwrite_c1_enter_memwrite_aunroll_x_out_o_stall or not (SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and0 <= redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out;
    SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and1 <= i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_valid and SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and0;
    SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and2 <= i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_o_valid and SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and1;
    SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_wireValid <= SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V0 and SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_and2;

    -- bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x(BITJOIN,85)
    bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q <= i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_10 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_9 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_8 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_7 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_6 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_5 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_4 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_3 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_2 & i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x(BITSELECT,86)
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(1 downto 1));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(2 downto 2));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(3 downto 3));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(4 downto 4));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(12 downto 5));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(13 downto 13));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(14 downto 14));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(78 downto 15));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(79 downto 79));
    bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_q(80 downto 80));

    -- i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x(BLACKBOX,40)@13
    -- in in_i_stall@20000000
    -- out out_iord_bl_pool_ch_o_fifoready@20000000
    -- out out_o_stall@20000000
    thei_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x : i_iord_bl_pool_ch_unnamed_memwrite0_memwrite148
    PORT MAP (
        in_c0_exe2 => bubble_select_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_c,
        in_i_stall => SE_out_redist0_memWrite_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_V3,
        in_iord_bl_pool_ch_i_fifodata => in_iord_bl_pool_ch_i_fifodata,
        in_iord_bl_pool_ch_i_fifovalid => in_iord_bl_pool_ch_i_fifovalid,
        out_o_data_0 => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_0,
        out_o_data_1 => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_1,
        out_o_data_2 => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_2,
        out_o_data_3 => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_3,
        out_o_data_4 => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_4,
        out_o_data_5 => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_data_5,
        out_iord_bl_pool_ch_o_fifoready => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_iord_bl_pool_ch_o_fifoready,
        out_o_stall => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_stall,
        out_o_valid => i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_iord_bl_pool_ch_o_fifoready <= i_iord_bl_pool_ch_unnamed_memwrite0_memwrite_aunroll_x_out_iord_bl_pool_ch_o_fifoready;

    -- redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4(REG,76)
    redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_backEN = "1") THEN
                redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5(REG,77)
    redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_backEN = "1") THEN
                redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_q <= STD_LOGIC_VECTOR(redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,8)@19
    out_c0_exe11 <= redist3_i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_c0_exit_11_6_5_q;
    out_valid_out <= SE_out_i_store_unnamed_memwrite2_memwrite_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,10)
    out_iord_bl_bypass_ch_o_fifoready <= i_iord_bl_bypass_ch_unnamed_memwrite1_memwrite_aunroll_x_out_iord_bl_bypass_ch_o_fifoready;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,14)
    out_unnamed_memWrite2_avm_address <= i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_address;
    out_unnamed_memWrite2_avm_enable <= i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_enable;
    out_unnamed_memWrite2_avm_read <= i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_read;
    out_unnamed_memWrite2_avm_write <= i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_write;
    out_unnamed_memWrite2_avm_writedata <= i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_writedata;
    out_unnamed_memWrite2_avm_byteenable <= i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_byteenable;
    out_unnamed_memWrite2_avm_burstcount <= i_store_unnamed_memwrite2_memwrite_out_unnamed_memWrite2_avm_burstcount;

    -- dupName_3_ext_sig_sync_out_x(GPOUT,18)
    out_lsu_unnamed_memWrite2_o_active <= i_store_unnamed_memwrite2_memwrite_out_lsu_unnamed_memWrite2_o_active;

    -- ext_sig_sync_out(GPOUT,48)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out <= i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out <= i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memwrite_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,53)
    out_pipeline_valid_out <= i_sfc_c0_while_body_memwrite_c0_enter_memwrite_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,58)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
