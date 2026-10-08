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

-- VHDL created from memWrite_function
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

entity memWrite_function is
    port (
        in_arg_bypass : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_layer_num : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_next_layer_padding : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_out_dim1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_arg_out_dim1_div_q_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_out_dim1xdim2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_out_dim2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_arg_out_dim3_div_lane_numxscal : in std_logic_vector(15 downto 0);  -- ufix16
        in_arg_out_num : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_q_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_rem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scal : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scal_rem_z : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scal_rem_zxq_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scal_rem_zxrem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scal_rem_zxstart_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scalxq_vec : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scalxrem_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_scalxstart_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_start_size_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_top : in std_logic_vector(63 downto 0);  -- ufix64
        in_iord_bl_bypass_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- ufix96
        in_iord_bl_bypass_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_pool_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- ufix96
        in_iord_bl_pool_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_memWrite2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_memWrite2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_bypass_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_pool_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_memWrite2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_memWrite2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_memWrite2_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_memWrite2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_memWrite2_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end memWrite_function;

architecture normal of memWrite_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_memWrite_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_memWrite_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_memWrite_B0 is
        port (
            in_bypass : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_next_layer_padding : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_out_dim1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_out_dim1_div_q_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_out_dim1xdim2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_out_dim2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_out_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_q_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_rem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal_rem_zxq_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal_rem_zxrem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scal_rem_zxstart_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scalxq_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scalxrem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_scalxstart_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_top : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_memWrite_B1 is
        port (
            in_bypass : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_top : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_bypass_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_pool_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_memWrite2_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_memWrite2_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_memWrite_B2 is
        port (
            in_feedback_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_memwrite_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_memwrite_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B0_out_feedback_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_iord_bl_bypass_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_iord_bl_pool_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_lsu_unnamed_memWrite2_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_unnamed_memWrite2_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_memWrite_B1_out_unnamed_memWrite2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_memWrite_B1_out_unnamed_memWrite2_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_memWrite_B1_out_unnamed_memWrite2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_unnamed_memWrite2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_unnamed_memWrite2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B1_out_unnamed_memWrite2_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_memWrite_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B2_out_feedback_out_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_memWrite_B2_out_feedback_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memWrite_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i2_0gr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_memwrite_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- c_i2_0gr(CONSTANT,12)
    c_i2_0gr_q <= "00";

    -- i_acl_pipeline_keep_going_memwrite_valid_fifo(BLACKBOX,14)
    thei_acl_pipeline_keep_going_memwrite_valid_fifo : i_acl_pipeline_keep_going_memwrite_valid_fifo
    PORT MAP (
        in_data_in => c_i2_0gr_q,
        in_stall_in => bb_memWrite_B1_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going_memwrite_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going_memwrite_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going_memwrite_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_memWrite_B0(BLACKBOX,7)
    thebb_memWrite_B0 : bb_memWrite_B0
    PORT MAP (
        in_bypass => in_arg_bypass,
        in_dim_z_edge_num => in_arg_dim_z_edge_num,
        in_feedback_in_0 => bb_memWrite_B2_out_feedback_out_0,
        in_feedback_valid_in_0 => bb_memWrite_B2_out_feedback_valid_out_0,
        in_next_layer_padding => in_arg_next_layer_padding,
        in_out_dim1 => in_arg_out_dim1,
        in_out_dim1_div_q_vec => in_arg_out_dim1_div_q_vec,
        in_out_dim1xdim2 => in_arg_out_dim1xdim2,
        in_out_dim2 => in_arg_out_dim2,
        in_out_num => in_arg_out_num,
        in_q_vec => in_arg_q_vec,
        in_rem_size_x => in_arg_rem_size_x,
        in_scal => in_arg_scal,
        in_scal_rem_zxq_vec => in_arg_scal_rem_zxq_vec,
        in_scal_rem_zxrem_size_x => in_arg_scal_rem_zxrem_size_x,
        in_scal_rem_zxstart_size_x => in_arg_scal_rem_zxstart_size_x,
        in_scalxq_vec => in_arg_scalxq_vec,
        in_scalxrem_size_x => in_arg_scalxrem_size_x,
        in_scalxstart_size_x => in_arg_scalxstart_size_x,
        in_stall_in_0 => bb_memWrite_B1_sr_1_aunroll_x_out_o_stall,
        in_start_size_x => in_arg_start_size_x,
        in_top => in_arg_top,
        in_valid_in_0 => in_valid_in,
        out_feedback_stall_out_0 => bb_memWrite_B0_out_feedback_stall_out_0,
        out_stall_out_0 => bb_memWrite_B0_out_stall_out_0,
        out_valid_out_0 => bb_memWrite_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_memWrite_B2(BLACKBOX,9)
    thebb_memWrite_B2 : bb_memWrite_B2
    PORT MAP (
        in_feedback_stall_in_0 => bb_memWrite_B0_out_feedback_stall_out_0,
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_memWrite_B2_sr_0_aunroll_x_out_o_valid,
        out_feedback_out_0 => bb_memWrite_B2_out_feedback_out_0,
        out_feedback_valid_out_0 => bb_memWrite_B2_out_feedback_valid_out_0,
        out_stall_out_0 => bb_memWrite_B2_out_stall_out_0,
        out_valid_out_0 => bb_memWrite_B2_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_memWrite_B2_sr_0_aunroll_x(BLACKBOX,3)
    thebb_memWrite_B2_sr_0_aunroll_x : bb_memWrite_B2_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_memWrite_B2_out_stall_out_0,
        in_i_valid => bb_memWrite_B1_out_valid_out_0,
        out_o_stall => bb_memWrite_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_memWrite_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_memwrite_sr(BLACKBOX,13)
    thei_acl_pipeline_keep_going_memwrite_sr : i_acl_pipeline_keep_going_memwrite_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going_memwrite_valid_fifo_out_stall_out,
        in_i_valid => bb_memWrite_B1_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going_memwrite_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going_memwrite_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- bb_memWrite_B1_sr_1_aunroll_x(BLACKBOX,2)
    thebb_memWrite_B1_sr_1_aunroll_x : bb_memWrite_B1_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_stall => bb_memWrite_B1_out_stall_out_1,
        in_i_valid => bb_memWrite_B0_out_valid_out_0,
        out_o_data_0 => bb_memWrite_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_stall => bb_memWrite_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_memWrite_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_memWrite_B1(BLACKBOX,8)
    thebb_memWrite_B1 : bb_memWrite_B1
    PORT MAP (
        in_bypass => in_arg_bypass,
        in_dim_z_edge_num => in_arg_dim_z_edge_num,
        in_flush => in_start,
        in_forked_0 => GND_q,
        in_forked_1 => bb_memWrite_B1_sr_1_aunroll_x_out_o_data_0,
        in_iord_bl_bypass_ch_i_fifodata => in_iord_bl_bypass_ch_i_fifodata,
        in_iord_bl_bypass_ch_i_fifovalid => in_iord_bl_bypass_ch_i_fifovalid,
        in_iord_bl_pool_ch_i_fifodata => in_iord_bl_pool_ch_i_fifodata,
        in_iord_bl_pool_ch_i_fifovalid => in_iord_bl_pool_ch_i_fifovalid,
        in_next_layer_padding => in_arg_next_layer_padding,
        in_out_dim1 => in_arg_out_dim1,
        in_out_dim1_div_q_vec => in_arg_out_dim1_div_q_vec,
        in_out_dim1xdim2 => in_arg_out_dim1xdim2,
        in_out_dim2 => in_arg_out_dim2,
        in_out_num => in_arg_out_num,
        in_pipeline_stall_in => i_acl_pipeline_keep_going_memwrite_sr_out_o_stall,
        in_q_vec => in_arg_q_vec,
        in_rem_size_x => in_arg_rem_size_x,
        in_scal => in_arg_scal,
        in_scal_rem_zxq_vec => in_arg_scal_rem_zxq_vec,
        in_scal_rem_zxrem_size_x => in_arg_scal_rem_zxrem_size_x,
        in_scal_rem_zxstart_size_x => in_arg_scal_rem_zxstart_size_x,
        in_scalxq_vec => in_arg_scalxq_vec,
        in_scalxrem_size_x => in_arg_scalxrem_size_x,
        in_scalxstart_size_x => in_arg_scalxstart_size_x,
        in_stall_in_0 => bb_memWrite_B2_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_start_size_x => in_arg_start_size_x,
        in_top => in_arg_top,
        in_unnamed_memWrite2_avm_readdata => in_unnamed_memWrite2_avm_readdata,
        in_unnamed_memWrite2_avm_readdatavalid => in_unnamed_memWrite2_avm_readdatavalid,
        in_unnamed_memWrite2_avm_waitrequest => in_unnamed_memWrite2_avm_waitrequest,
        in_unnamed_memWrite2_avm_writeack => in_unnamed_memWrite2_avm_writeack,
        in_valid_in_0 => i_acl_pipeline_keep_going_memwrite_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_memWrite_B1_sr_1_aunroll_x_out_o_valid,
        out_iord_bl_bypass_ch_o_fifoready => bb_memWrite_B1_out_iord_bl_bypass_ch_o_fifoready,
        out_iord_bl_pool_ch_o_fifoready => bb_memWrite_B1_out_iord_bl_pool_ch_o_fifoready,
        out_lsu_unnamed_memWrite2_o_active => bb_memWrite_B1_out_lsu_unnamed_memWrite2_o_active,
        out_pipeline_valid_out => bb_memWrite_B1_out_pipeline_valid_out,
        out_stall_out_0 => bb_memWrite_B1_out_stall_out_0,
        out_stall_out_1 => bb_memWrite_B1_out_stall_out_1,
        out_unnamed_memWrite2_avm_address => bb_memWrite_B1_out_unnamed_memWrite2_avm_address,
        out_unnamed_memWrite2_avm_burstcount => bb_memWrite_B1_out_unnamed_memWrite2_avm_burstcount,
        out_unnamed_memWrite2_avm_byteenable => bb_memWrite_B1_out_unnamed_memWrite2_avm_byteenable,
        out_unnamed_memWrite2_avm_enable => bb_memWrite_B1_out_unnamed_memWrite2_avm_enable,
        out_unnamed_memWrite2_avm_read => bb_memWrite_B1_out_unnamed_memWrite2_avm_read,
        out_unnamed_memWrite2_avm_write => bb_memWrite_B1_out_unnamed_memWrite2_avm_write,
        out_unnamed_memWrite2_avm_writedata => bb_memWrite_B1_out_unnamed_memWrite2_avm_writedata,
        out_valid_out_0 => bb_memWrite_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_iord_bl_bypass_ch_o_fifoready(GPOUT,54)
    out_iord_bl_bypass_ch_o_fifoready <= bb_memWrite_B1_out_iord_bl_bypass_ch_o_fifoready;

    -- out_iord_bl_pool_ch_o_fifoready(GPOUT,55)
    out_iord_bl_pool_ch_o_fifoready <= bb_memWrite_B1_out_iord_bl_pool_ch_o_fifoready;

    -- out_o_active_unnamed_memWrite2(GPOUT,56)
    out_o_active_unnamed_memWrite2 <= bb_memWrite_B1_out_lsu_unnamed_memWrite2_o_active;

    -- out_stall_out(GPOUT,57)
    out_stall_out <= bb_memWrite_B0_out_stall_out_0;

    -- out_unnamed_memWrite2_avm_address(GPOUT,58)
    out_unnamed_memWrite2_avm_address <= bb_memWrite_B1_out_unnamed_memWrite2_avm_address;

    -- out_unnamed_memWrite2_avm_burstcount(GPOUT,59)
    out_unnamed_memWrite2_avm_burstcount <= bb_memWrite_B1_out_unnamed_memWrite2_avm_burstcount;

    -- out_unnamed_memWrite2_avm_byteenable(GPOUT,60)
    out_unnamed_memWrite2_avm_byteenable <= bb_memWrite_B1_out_unnamed_memWrite2_avm_byteenable;

    -- out_unnamed_memWrite2_avm_enable(GPOUT,61)
    out_unnamed_memWrite2_avm_enable <= bb_memWrite_B1_out_unnamed_memWrite2_avm_enable;

    -- out_unnamed_memWrite2_avm_read(GPOUT,62)
    out_unnamed_memWrite2_avm_read <= bb_memWrite_B1_out_unnamed_memWrite2_avm_read;

    -- out_unnamed_memWrite2_avm_write(GPOUT,63)
    out_unnamed_memWrite2_avm_write <= bb_memWrite_B1_out_unnamed_memWrite2_avm_write;

    -- out_unnamed_memWrite2_avm_writedata(GPOUT,64)
    out_unnamed_memWrite2_avm_writedata <= bb_memWrite_B1_out_unnamed_memWrite2_avm_writedata;

    -- out_valid_out(GPOUT,65)
    out_valid_out <= bb_memWrite_B2_out_valid_out_0;

END normal;
