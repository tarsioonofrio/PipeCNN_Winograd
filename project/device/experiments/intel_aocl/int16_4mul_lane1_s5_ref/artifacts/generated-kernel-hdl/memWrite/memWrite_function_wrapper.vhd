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

-- VHDL created from memWrite_function_wrapper
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

entity memWrite_function_wrapper is
    port (
        avm_unnamed_memWrite2_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_memWrite2_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_memWrite2_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_memWrite2_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_bypass_ch_data : in std_logic_vector(95 downto 0);  -- ufix96
        avst_iord_bl_bypass_ch_valid : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_pool_ch_data : in std_logic_vector(95 downto 0);  -- ufix96
        avst_iord_bl_pool_ch_valid : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(351 downto 0);  -- ufix352
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_memWrite2_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_memWrite2_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_memWrite2_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_memWrite2_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_memWrite2_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_memWrite2_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_memWrite2_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avst_iord_bl_bypass_ch_ready : out std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_pool_ch_ready : out std_logic_vector(0 downto 0);  -- ufix1
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end memWrite_function_wrapper;

architecture normal of memWrite_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memWrite_function is
        port (
            in_arg_bypass : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_dim_z_edge_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_layer_num : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_next_layer_padding : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_out_dim1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_out_dim1_div_q_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_out_dim1xdim2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_out_dim2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_out_dim3_div_lane_numxscal : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_out_num : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_q_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_rem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scal : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scal_rem_z : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scal_rem_zxq_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scal_rem_zxrem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scal_rem_zxstart_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scalxq_vec : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scalxrem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_scalxstart_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_start_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_top : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_iord_bl_bypass_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_iord_bl_bypass_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_pool_ch_i_fifodata : in std_logic_vector(95 downto 0);  -- Fixed Point
            in_iord_bl_pool_ch_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_memWrite2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_bypass_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_pool_ch_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_memWrite2 : out std_logic_vector(0 downto 0);  -- Fixed Point
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_17_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_18_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_19_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_20_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_bypass_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_dim_z_edge_num_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_layer_num_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_next_layer_padding_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_out_dim1_div_q_vec_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_out_dim1_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_out_dim1xdim2_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_out_dim2_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_out_dim3_div_lane_numxscal_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_out_num_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_q_vec_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_rem_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scal_rem_z_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scal_rem_zxq_vec_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scal_rem_zxrem_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scal_rem_zxstart_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scal_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scalxq_vec_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scalxrem_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_scalxstart_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_start_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_top_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (7 downto 0);
    signal memWrite_function_out_iord_bl_bypass_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_function_out_iord_bl_pool_ch_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_function_out_o_active_unnamed_memWrite2 : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_function_out_unnamed_memWrite2_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal memWrite_function_out_unnamed_memWrite2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal memWrite_function_out_unnamed_memWrite2_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memWrite_function_out_unnamed_memWrite2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_function_out_unnamed_memWrite2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_function_out_unnamed_memWrite2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memWrite_function_out_unnamed_memWrite2_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memWrite_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_top_select(BITSELECT,45)
    arg_top_select_b <= kernel_arguments(327 downto 264);

    -- dupName_20_ip_dsdk_adapt_cast_x(BITSELECT,22)
    dupName_20_ip_dsdk_adapt_cast_x_b <= arg_top_select_b(63 downto 0);

    -- arg_start_size_x_select(BITSELECT,44)
    arg_start_size_x_select_b <= kernel_arguments(63 downto 56);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_start_size_x_select_b(7 downto 0);

    -- arg_scalxstart_size_x_select(BITSELECT,43)
    arg_scalxstart_size_x_select_b <= kernel_arguments(207 downto 200);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,17)
    dupName_15_ip_dsdk_adapt_cast_x_b <= arg_scalxstart_size_x_select_b(7 downto 0);

    -- arg_scalxrem_size_x_select(BITSELECT,42)
    arg_scalxrem_size_x_select_b <= kernel_arguments(199 downto 192);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,16)
    dupName_14_ip_dsdk_adapt_cast_x_b <= arg_scalxrem_size_x_select_b(7 downto 0);

    -- arg_scalxq_vec_select(BITSELECT,41)
    arg_scalxq_vec_select_b <= kernel_arguments(191 downto 184);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,15)
    dupName_13_ip_dsdk_adapt_cast_x_b <= arg_scalxq_vec_select_b(7 downto 0);

    -- arg_scal_rem_zxstart_size_x_select(BITSELECT,39)
    arg_scal_rem_zxstart_size_x_select_b <= kernel_arguments(231 downto 224);

    -- dupName_18_ip_dsdk_adapt_cast_x(BITSELECT,20)
    dupName_18_ip_dsdk_adapt_cast_x_b <= arg_scal_rem_zxstart_size_x_select_b(7 downto 0);

    -- arg_scal_rem_zxrem_size_x_select(BITSELECT,38)
    arg_scal_rem_zxrem_size_x_select_b <= kernel_arguments(223 downto 216);

    -- dupName_17_ip_dsdk_adapt_cast_x(BITSELECT,19)
    dupName_17_ip_dsdk_adapt_cast_x_b <= arg_scal_rem_zxrem_size_x_select_b(7 downto 0);

    -- arg_scal_rem_zxq_vec_select(BITSELECT,37)
    arg_scal_rem_zxq_vec_select_b <= kernel_arguments(215 downto 208);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,18)
    dupName_16_ip_dsdk_adapt_cast_x_b <= arg_scal_rem_zxq_vec_select_b(7 downto 0);

    -- arg_scal_rem_z_select(BITSELECT,36)
    arg_scal_rem_z_select_b <= kernel_arguments(183 downto 176);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,14)
    dupName_12_ip_dsdk_adapt_cast_x_b <= arg_scal_rem_z_select_b(7 downto 0);

    -- arg_scal_select(BITSELECT,40)
    arg_scal_select_b <= kernel_arguments(175 downto 168);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,13)
    dupName_11_ip_dsdk_adapt_cast_x_b <= arg_scal_select_b(7 downto 0);

    -- arg_rem_size_x_select(BITSELECT,35)
    arg_rem_size_x_select_b <= kernel_arguments(55 downto 48);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_rem_size_x_select_b(7 downto 0);

    -- arg_q_vec_select(BITSELECT,34)
    arg_q_vec_select_b <= kernel_arguments(47 downto 40);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_q_vec_select_b(7 downto 0);

    -- arg_out_num_select(BITSELECT,33)
    arg_out_num_select_b <= kernel_arguments(39 downto 8);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_out_num_select_b(31 downto 0);

    -- arg_out_dim3_div_lane_numxscal_select(BITSELECT,32)
    arg_out_dim3_div_lane_numxscal_select_b <= kernel_arguments(95 downto 80);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,8)
    dupName_6_ip_dsdk_adapt_cast_x_b <= arg_out_dim3_div_lane_numxscal_select_b(15 downto 0);

    -- arg_out_dim2_select(BITSELECT,31)
    arg_out_dim2_select_b <= kernel_arguments(127 downto 112);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,10)
    dupName_8_ip_dsdk_adapt_cast_x_b <= arg_out_dim2_select_b(15 downto 0);

    -- arg_out_dim1xdim2_select(BITSELECT,30)
    arg_out_dim1xdim2_select_b <= kernel_arguments(159 downto 128);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,11)
    dupName_9_ip_dsdk_adapt_cast_x_b <= arg_out_dim1xdim2_select_b(31 downto 0);

    -- arg_out_dim1_div_q_vec_select(BITSELECT,28)
    arg_out_dim1_div_q_vec_select_b <= kernel_arguments(71 downto 64);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_out_dim1_div_q_vec_select_b(7 downto 0);

    -- arg_out_dim1_select(BITSELECT,29)
    arg_out_dim1_select_b <= kernel_arguments(111 downto 96);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_7_ip_dsdk_adapt_cast_x_b <= arg_out_dim1_select_b(15 downto 0);

    -- arg_next_layer_padding_select(BITSELECT,27)
    arg_next_layer_padding_select_b <= kernel_arguments(79 downto 72);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,7)
    dupName_5_ip_dsdk_adapt_cast_x_b <= arg_next_layer_padding_select_b(7 downto 0);

    -- arg_layer_num_select(BITSELECT,26)
    arg_layer_num_select_b <= kernel_arguments(7 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,86)
    ip_dsdk_adapt_cast_b <= arg_layer_num_select_b(7 downto 0);

    -- arg_dim_z_edge_num_select(BITSELECT,25)
    arg_dim_z_edge_num_select_b <= kernel_arguments(263 downto 232);

    -- dupName_19_ip_dsdk_adapt_cast_x(BITSELECT,21)
    dupName_19_ip_dsdk_adapt_cast_x_b <= arg_dim_z_edge_num_select_b(31 downto 0);

    -- arg_bypass_select(BITSELECT,24)
    arg_bypass_select_b <= kernel_arguments(167 downto 160);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,12)
    dupName_10_ip_dsdk_adapt_cast_x_b <= arg_bypass_select_b(7 downto 0);

    -- memWrite_function(BLACKBOX,87)
    thememWrite_function : memWrite_function
    PORT MAP (
        in_arg_bypass => dupName_10_ip_dsdk_adapt_cast_x_b,
        in_arg_dim_z_edge_num => dupName_19_ip_dsdk_adapt_cast_x_b,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_layer_num => ip_dsdk_adapt_cast_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_next_layer_padding => dupName_5_ip_dsdk_adapt_cast_x_b,
        in_arg_out_dim1 => dupName_7_ip_dsdk_adapt_cast_x_b,
        in_arg_out_dim1_div_q_vec => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_out_dim1xdim2 => dupName_9_ip_dsdk_adapt_cast_x_b,
        in_arg_out_dim2 => dupName_8_ip_dsdk_adapt_cast_x_b,
        in_arg_out_dim3_div_lane_numxscal => dupName_6_ip_dsdk_adapt_cast_x_b,
        in_arg_out_num => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_q_vec => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_rem_size_x => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_scal => dupName_11_ip_dsdk_adapt_cast_x_b,
        in_arg_scal_rem_z => dupName_12_ip_dsdk_adapt_cast_x_b,
        in_arg_scal_rem_zxq_vec => dupName_16_ip_dsdk_adapt_cast_x_b,
        in_arg_scal_rem_zxrem_size_x => dupName_17_ip_dsdk_adapt_cast_x_b,
        in_arg_scal_rem_zxstart_size_x => dupName_18_ip_dsdk_adapt_cast_x_b,
        in_arg_scalxq_vec => dupName_13_ip_dsdk_adapt_cast_x_b,
        in_arg_scalxrem_size_x => dupName_14_ip_dsdk_adapt_cast_x_b,
        in_arg_scalxstart_size_x => dupName_15_ip_dsdk_adapt_cast_x_b,
        in_arg_start_size_x => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_arg_top => dupName_20_ip_dsdk_adapt_cast_x_b,
        in_iord_bl_bypass_ch_i_fifodata => avst_iord_bl_bypass_ch_data,
        in_iord_bl_bypass_ch_i_fifovalid => avst_iord_bl_bypass_ch_valid,
        in_iord_bl_pool_ch_i_fifodata => avst_iord_bl_pool_ch_data,
        in_iord_bl_pool_ch_i_fifovalid => avst_iord_bl_pool_ch_valid,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_memWrite2_avm_readdata => avm_unnamed_memWrite2_readdata,
        in_unnamed_memWrite2_avm_readdatavalid => avm_unnamed_memWrite2_readdatavalid,
        in_unnamed_memWrite2_avm_waitrequest => avm_unnamed_memWrite2_waitrequest,
        in_unnamed_memWrite2_avm_writeack => avm_unnamed_memWrite2_writeack,
        in_valid_in => kernel_valid_in,
        out_iord_bl_bypass_ch_o_fifoready => memWrite_function_out_iord_bl_bypass_ch_o_fifoready,
        out_iord_bl_pool_ch_o_fifoready => memWrite_function_out_iord_bl_pool_ch_o_fifoready,
        out_o_active_unnamed_memWrite2 => memWrite_function_out_o_active_unnamed_memWrite2,
        out_stall_out => memWrite_function_out_stall_out,
        out_unnamed_memWrite2_avm_address => memWrite_function_out_unnamed_memWrite2_avm_address,
        out_unnamed_memWrite2_avm_burstcount => memWrite_function_out_unnamed_memWrite2_avm_burstcount,
        out_unnamed_memWrite2_avm_byteenable => memWrite_function_out_unnamed_memWrite2_avm_byteenable,
        out_unnamed_memWrite2_avm_enable => memWrite_function_out_unnamed_memWrite2_avm_enable,
        out_unnamed_memWrite2_avm_read => memWrite_function_out_unnamed_memWrite2_avm_read,
        out_unnamed_memWrite2_avm_write => memWrite_function_out_unnamed_memWrite2_avm_write,
        out_unnamed_memWrite2_avm_writedata => memWrite_function_out_unnamed_memWrite2_avm_writedata,
        out_valid_out => memWrite_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_unnamed_memWrite2_address(GPOUT,88)
    avm_unnamed_memWrite2_address <= memWrite_function_out_unnamed_memWrite2_avm_address;

    -- avm_unnamed_memWrite2_burstcount(GPOUT,89)
    avm_unnamed_memWrite2_burstcount <= memWrite_function_out_unnamed_memWrite2_avm_burstcount;

    -- avm_unnamed_memWrite2_byteenable(GPOUT,90)
    avm_unnamed_memWrite2_byteenable <= memWrite_function_out_unnamed_memWrite2_avm_byteenable;

    -- avm_unnamed_memWrite2_enable(GPOUT,91)
    avm_unnamed_memWrite2_enable <= memWrite_function_out_unnamed_memWrite2_avm_enable;

    -- avm_unnamed_memWrite2_read(GPOUT,92)
    avm_unnamed_memWrite2_read <= memWrite_function_out_unnamed_memWrite2_avm_read;

    -- avm_unnamed_memWrite2_write(GPOUT,93)
    avm_unnamed_memWrite2_write <= memWrite_function_out_unnamed_memWrite2_avm_write;

    -- avm_unnamed_memWrite2_writedata(GPOUT,94)
    avm_unnamed_memWrite2_writedata <= memWrite_function_out_unnamed_memWrite2_avm_writedata;

    -- avst_iord_bl_bypass_ch_ready(GPOUT,95)
    avst_iord_bl_bypass_ch_ready <= memWrite_function_out_iord_bl_bypass_ch_o_fifoready;

    -- avst_iord_bl_pool_ch_ready(GPOUT,96)
    avst_iord_bl_pool_ch_ready <= memWrite_function_out_iord_bl_pool_ch_o_fifoready;

    -- acl_clock2x_dummy_consumer(EXTIFACE,23)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,97)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,98)
    has_a_lsu_active <= memWrite_function_out_o_active_unnamed_memWrite2;

    -- has_a_write_pending(GPOUT,99)
    has_a_write_pending <= memWrite_function_out_o_active_unnamed_memWrite2;

    -- kernel_stall_out(GPOUT,100)
    kernel_stall_out <= memWrite_function_out_stall_out;

    -- kernel_valid_out(GPOUT,101)
    kernel_valid_out <= memWrite_function_out_valid_out;

END normal;
