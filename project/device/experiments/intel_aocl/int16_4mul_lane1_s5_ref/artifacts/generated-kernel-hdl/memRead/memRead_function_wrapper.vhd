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

-- VHDL created from memRead_function_wrapper
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

entity memRead_function_wrapper is
    port (
        avm_memcoalesce_1793_load_0_readdata : in std_logic_vector(1023 downto 0);  -- ufix1024
        avm_memcoalesce_1793_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_1793_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_1793_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_bottom_load_0_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_bottom_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_bottom_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_bottom_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0117_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_null_load_0117_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0117_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0117_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0152_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_0152_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0152_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0152_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_082_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_null_load_082_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_082_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_082_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_null_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_weights_load_0_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_weights_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_weights_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_weights_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_16_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_16_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_16_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_16_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_5_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memdep_5_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_5_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_5_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_6_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memdep_6_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_6_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_6_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_7_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memdep_7_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_7_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_7_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_readdata : in std_logic_vector(1023 downto 0);  -- ufix1024
        avm_memdep_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1697_readdata : in std_logic_vector(1023 downto 0);  -- ufix1024
        avm_normls_load1697_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1697_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1697_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1702_readdata : in std_logic_vector(1023 downto 0);  -- ufix1024
        avm_normls_load1702_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1702_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1702_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load_readdata : in std_logic_vector(1023 downto 0);  -- ufix1024
        avm_normls_load_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_tmp420_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_tmp420_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_tmp420_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_tmp420_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_bypass_ch_almostfull : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_bypass_ch_ready : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_pool_ch_almostfull : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_pool_ch_ready : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_arguments : in std_logic_vector(767 downto 0);  -- ufix768
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_1793_load_0_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_1793_load_0_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_1793_load_0_byteenable : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_1793_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_1793_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_1793_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_1793_load_0_writedata : out std_logic_vector(1023 downto 0);  -- ufix1024
        avm_memcoalesce_bottom_load_0_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_memcoalesce_bottom_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_bottom_load_0_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_bottom_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_bottom_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_bottom_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_bottom_load_0_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_null_load_0117_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_0117_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0117_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_null_load_0117_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0117_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0117_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0117_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_null_load_0152_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_0152_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0152_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        avm_memcoalesce_null_load_0152_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0152_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0152_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0152_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_082_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_082_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_082_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_null_load_082_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_082_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_082_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_082_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_null_load_0_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_0_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_null_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_weights_load_0_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_memcoalesce_weights_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_weights_load_0_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_weights_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_weights_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_weights_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_weights_load_0_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memdep_16_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_16_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_16_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        avm_memdep_16_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_16_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_16_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_16_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_5_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_5_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_5_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memdep_5_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_5_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_5_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_5_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memdep_6_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_6_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_6_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memdep_6_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_6_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_6_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_6_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memdep_7_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_7_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_7_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memdep_7_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_7_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_7_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_7_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memdep_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_byteenable : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writedata : out std_logic_vector(1023 downto 0);  -- ufix1024
        avm_normls_load1697_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_normls_load1697_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1697_byteenable : out std_logic_vector(127 downto 0);  -- ufix128
        avm_normls_load1697_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1697_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1697_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1697_writedata : out std_logic_vector(1023 downto 0);  -- ufix1024
        avm_normls_load1702_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_normls_load1702_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1702_byteenable : out std_logic_vector(127 downto 0);  -- ufix128
        avm_normls_load1702_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1702_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1702_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load1702_writedata : out std_logic_vector(1023 downto 0);  -- ufix1024
        avm_normls_load_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_normls_load_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load_byteenable : out std_logic_vector(127 downto 0);  -- ufix128
        avm_normls_load_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_normls_load_writedata : out std_logic_vector(1023 downto 0);  -- ufix1024
        avm_tmp420_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_tmp420_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_tmp420_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_tmp420_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_tmp420_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_tmp420_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_tmp420_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avst_iowr_bl_bypass_ch_data : out std_logic_vector(95 downto 0);  -- ufix96
        avst_iowr_bl_bypass_ch_valid : out std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_pool_ch_data : out std_logic_vector(95 downto 0);  -- ufix96
        avst_iowr_bl_pool_ch_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end memRead_function_wrapper;

architecture normal of memRead_function_wrapper is

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


    component memRead_function is
        port (
            in_arg_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_bottom : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_col_size : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_control : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_conv_loop_cnt : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_conv_out_loopnum : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_conv_row_rem : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_conv_x : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_data_dim1 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_data_dim1xdim2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_data_dim2 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_fc_en : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_frac_b : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_frac_din : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_frac_dout : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_frac_w : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_group_num_mul_win_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_group_num_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_group_num_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_group_rem_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_group_rem_size_xyz : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_group_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_layer_num : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_line_size : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_padding : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_pool_size : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_pool_stride : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_split : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_stride : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_weight_dim1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_weight_dim1x2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_weight_dim1x2x3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_weight_dim2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_weight_dim3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_weight_dim4_div_lane : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_weights : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_win_size : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_arg_win_size_x : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_win_size_xyz : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_win_size_y : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_iowr_bl_bypass_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iowr_bl_pool_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_1793_load_0_avm_readdata : in std_logic_vector(1023 downto 0);  -- Fixed Point
            in_memcoalesce_1793_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_1793_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_1793_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_bottom_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_bottom_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_bottom_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_bottom_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0117_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0117_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0117_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0117_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_082_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_082_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_082_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_082_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_weights_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_weights_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_weights_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_weights_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memdep_5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_6_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memdep_6_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_6_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_6_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_7_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memdep_7_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_7_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_7_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(1023 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load1697_avm_readdata : in std_logic_vector(1023 downto 0);  -- Fixed Point
            in_normls_load1697_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load1697_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load1697_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load1702_avm_readdata : in std_logic_vector(1023 downto 0);  -- Fixed Point
            in_normls_load1702_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load1702_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load1702_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load_avm_readdata : in std_logic_vector(1023 downto 0);  -- Fixed Point
            in_normls_load_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_normls_load_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp420_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_tmp420_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp420_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp420_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_bypass_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_iowr_bl_bypass_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_pool_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_iowr_bl_pool_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_1793_load_0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_1793_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_1793_load_0_avm_byteenable : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memcoalesce_1793_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_1793_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_1793_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_1793_load_0_avm_writedata : out std_logic_vector(1023 downto 0);  -- Fixed Point
            out_memcoalesce_bottom_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_bottom_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_bottom_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_bottom_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_bottom_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_bottom_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_bottom_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0117_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0117_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0117_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0117_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0117_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0117_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0117_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_082_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_082_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_082_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_082_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_082_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_082_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_082_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memcoalesce_weights_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_weights_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_weights_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_weights_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_weights_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_weights_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_weights_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memdep_16_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_16_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memdep_16_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_5_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_5_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memdep_5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memdep_6_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_6_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_6_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memdep_6_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_6_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_6_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_6_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memdep_7_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_7_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_7_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memdep_7_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_7_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_7_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_7_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(1023 downto 0);  -- Fixed Point
            out_normls_load1697_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_normls_load1697_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1697_avm_byteenable : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_normls_load1697_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1697_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1697_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1697_avm_writedata : out std_logic_vector(1023 downto 0);  -- Fixed Point
            out_normls_load1702_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_normls_load1702_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1702_avm_byteenable : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_normls_load1702_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1702_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1702_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load1702_avm_writedata : out std_logic_vector(1023 downto 0);  -- Fixed Point
            out_normls_load_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_normls_load_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load_avm_byteenable : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_normls_load_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_normls_load_avm_writedata : out std_logic_vector(1023 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp420_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_tmp420_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_tmp420_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_tmp420_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp420_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp420_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp420_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_17_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_18_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_19_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_20_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_21_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_22_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_23_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_24_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_25_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_26_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_27_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_28_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_29_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_30_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_31_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_32_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_33_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_34_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_35_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_36_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_37_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_38_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_bias_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_bottom_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_col_size_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_control_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_conv_loop_cnt_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_conv_out_loopnum_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_conv_row_rem_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_conv_x_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_data_dim1_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_data_dim1xdim2_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_data_dim2_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_fc_en_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_frac_b_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_frac_din_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_frac_dout_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_frac_w_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_group_num_mul_win_size_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_group_num_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_group_num_y_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_group_rem_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_group_rem_size_xyz_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_group_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_layer_num_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_line_size_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_padding_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_pool_size_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_pool_stride_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_split_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_stride_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_weight_dim1_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_weight_dim1x2_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_weight_dim1x2x3_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_weight_dim2_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_weight_dim3_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_weight_dim4_div_lane_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_weights_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_win_size_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal arg_win_size_x_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal arg_win_size_xyz_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_win_size_y_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal const_32b_zero_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (7 downto 0);
    signal memRead_function_out_iowr_bl_bypass_ch_o_fifodata : STD_LOGIC_VECTOR (95 downto 0);
    signal memRead_function_out_iowr_bl_bypass_ch_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_iowr_bl_pool_ch_o_fifodata : STD_LOGIC_VECTOR (95 downto 0);
    signal memRead_function_out_iowr_bl_pool_ch_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_1793_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memcoalesce_1793_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_1793_load_0_avm_byteenable : STD_LOGIC_VECTOR (127 downto 0);
    signal memRead_function_out_memcoalesce_1793_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_1793_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_1793_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_1793_load_0_avm_writedata : STD_LOGIC_VECTOR (1023 downto 0);
    signal memRead_function_out_memcoalesce_bottom_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal memRead_function_out_memcoalesce_bottom_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal memRead_function_out_memcoalesce_bottom_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memcoalesce_bottom_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_bottom_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_bottom_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_bottom_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0117_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0117_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0117_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0117_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0117_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0117_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0117_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0152_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0152_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0152_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0152_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memcoalesce_null_load_082_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memcoalesce_null_load_082_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_082_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memcoalesce_null_load_082_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_082_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_082_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_082_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memcoalesce_weights_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal memRead_function_out_memcoalesce_weights_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal memRead_function_out_memcoalesce_weights_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memcoalesce_weights_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_weights_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_weights_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memcoalesce_weights_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memdep_16_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memdep_16_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_16_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal memRead_function_out_memdep_16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_16_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memdep_5_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memdep_5_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_5_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memdep_5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_5_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memdep_6_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memdep_6_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_6_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memdep_6_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_6_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_6_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_6_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memdep_7_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memdep_7_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_7_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_memdep_7_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_7_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_7_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_7_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (127 downto 0);
    signal memRead_function_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_memdep_avm_writedata : STD_LOGIC_VECTOR (1023 downto 0);
    signal memRead_function_out_normls_load1697_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_normls_load1697_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1697_avm_byteenable : STD_LOGIC_VECTOR (127 downto 0);
    signal memRead_function_out_normls_load1697_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1697_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1697_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1697_avm_writedata : STD_LOGIC_VECTOR (1023 downto 0);
    signal memRead_function_out_normls_load1702_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_normls_load1702_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1702_avm_byteenable : STD_LOGIC_VECTOR (127 downto 0);
    signal memRead_function_out_normls_load1702_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1702_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1702_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load1702_avm_writedata : STD_LOGIC_VECTOR (1023 downto 0);
    signal memRead_function_out_normls_load_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_function_out_normls_load_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load_avm_byteenable : STD_LOGIC_VECTOR (127 downto 0);
    signal memRead_function_out_normls_load_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_normls_load_avm_writedata : STD_LOGIC_VECTOR (1023 downto 0);
    signal memRead_function_out_tmp420_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal memRead_function_out_tmp420_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal memRead_function_out_tmp420_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal memRead_function_out_tmp420_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_tmp420_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_tmp420_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_function_out_tmp420_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal memRead_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_in_pulse_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_pulse_reg1_NO_SHIFT_REG_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_pulse_reg2_NO_SHIFT_REG_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- valid_pulse_reg2_NO_SHIFT_REG(REG,285)
    valid_pulse_reg2_NO_SHIFT_REG_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_pulse_reg2_NO_SHIFT_REG_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            valid_pulse_reg2_NO_SHIFT_REG_q <= valid_pulse_reg1_NO_SHIFT_REG_q;
        END IF;
    END PROCESS;

    -- valid_pulse_reg1_NO_SHIFT_REG(REG,284)
    valid_pulse_reg1_NO_SHIFT_REG_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_pulse_reg1_NO_SHIFT_REG_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            valid_pulse_reg1_NO_SHIFT_REG_q <= start;
        END IF;
    END PROCESS;

    -- valid_in_pulse(LOGICAL,283)
    valid_in_pulse_q <= valid_pulse_reg1_NO_SHIFT_REG_q and valid_pulse_reg2_NO_SHIFT_REG_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_win_size_y_select(BITSELECT,81)
    arg_win_size_y_select_b <= kernel_arguments(359 downto 352);

    -- dupName_22_ip_dsdk_adapt_cast_x(BITSELECT,24)
    dupName_22_ip_dsdk_adapt_cast_x_b <= arg_win_size_y_select_b(7 downto 0);

    -- arg_win_size_xyz_select(BITSELECT,80)
    arg_win_size_xyz_select_b <= kernel_arguments(391 downto 360);

    -- dupName_23_ip_dsdk_adapt_cast_x(BITSELECT,25)
    dupName_23_ip_dsdk_adapt_cast_x_b <= arg_win_size_xyz_select_b(31 downto 0);

    -- arg_win_size_x_select(BITSELECT,79)
    arg_win_size_x_select_b <= kernel_arguments(351 downto 344);

    -- dupName_21_ip_dsdk_adapt_cast_x(BITSELECT,23)
    dupName_21_ip_dsdk_adapt_cast_x_b <= arg_win_size_x_select_b(7 downto 0);

    -- arg_win_size_select(BITSELECT,78)
    arg_win_size_select_b <= kernel_arguments(343 downto 328);

    -- dupName_20_ip_dsdk_adapt_cast_x(BITSELECT,22)
    dupName_20_ip_dsdk_adapt_cast_x_b <= arg_win_size_select_b(15 downto 0);

    -- arg_weights_select(BITSELECT,77)
    arg_weights_select_b <= kernel_arguments(519 downto 456);

    -- dupName_25_ip_dsdk_adapt_cast_x(BITSELECT,27)
    dupName_25_ip_dsdk_adapt_cast_x_b <= arg_weights_select_b(63 downto 0);

    -- arg_weight_dim4_div_lane_select(BITSELECT,76)
    arg_weight_dim4_div_lane_select_b <= kernel_arguments(127 downto 112);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_7_ip_dsdk_adapt_cast_x_b <= arg_weight_dim4_div_lane_select_b(15 downto 0);

    -- arg_weight_dim3_select(BITSELECT,75)
    arg_weight_dim3_select_b <= kernel_arguments(111 downto 96);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,8)
    dupName_6_ip_dsdk_adapt_cast_x_b <= arg_weight_dim3_select_b(15 downto 0);

    -- arg_weight_dim2_select(BITSELECT,74)
    arg_weight_dim2_select_b <= kernel_arguments(95 downto 88);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,7)
    dupName_5_ip_dsdk_adapt_cast_x_b <= arg_weight_dim2_select_b(7 downto 0);

    -- arg_weight_dim1x2x3_select(BITSELECT,73)
    arg_weight_dim1x2x3_select_b <= kernel_arguments(167 downto 136);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,11)
    dupName_9_ip_dsdk_adapt_cast_x_b <= arg_weight_dim1x2x3_select_b(31 downto 0);

    -- arg_weight_dim1x2_select(BITSELECT,72)
    arg_weight_dim1x2_select_b <= kernel_arguments(135 downto 128);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,10)
    dupName_8_ip_dsdk_adapt_cast_x_b <= arg_weight_dim1x2_select_b(7 downto 0);

    -- arg_weight_dim1_select(BITSELECT,71)
    arg_weight_dim1_select_b <= kernel_arguments(87 downto 80);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_weight_dim1_select_b(7 downto 0);

    -- arg_stride_select(BITSELECT,70)
    arg_stride_select_b <= kernel_arguments(199 downto 192);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,14)
    dupName_12_ip_dsdk_adapt_cast_x_b <= arg_stride_select_b(7 downto 0);

    -- arg_split_select(BITSELECT,69)
    arg_split_select_b <= kernel_arguments(215 downto 208);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,16)
    dupName_14_ip_dsdk_adapt_cast_x_b <= arg_split_select_b(7 downto 0);

    -- arg_pool_stride_select(BITSELECT,68)
    arg_pool_stride_select_b <= kernel_arguments(743 downto 736);

    -- dupName_38_ip_dsdk_adapt_cast_x(BITSELECT,40)
    dupName_38_ip_dsdk_adapt_cast_x_b <= arg_pool_stride_select_b(7 downto 0);

    -- arg_pool_size_select(BITSELECT,67)
    arg_pool_size_select_b <= kernel_arguments(735 downto 728);

    -- dupName_37_ip_dsdk_adapt_cast_x(BITSELECT,39)
    dupName_37_ip_dsdk_adapt_cast_x_b <= arg_pool_size_select_b(7 downto 0);

    -- arg_padding_select(BITSELECT,66)
    arg_padding_select_b <= kernel_arguments(207 downto 200);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,15)
    dupName_13_ip_dsdk_adapt_cast_x_b <= arg_padding_select_b(7 downto 0);

    -- arg_line_size_select(BITSELECT,65)
    arg_line_size_select_b <= kernel_arguments(711 downto 696);

    -- dupName_35_ip_dsdk_adapt_cast_x(BITSELECT,37)
    dupName_35_ip_dsdk_adapt_cast_x_b <= arg_line_size_select_b(15 downto 0);

    -- arg_layer_num_select(BITSELECT,64)
    arg_layer_num_select_b <= kernel_arguments(7 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,160)
    ip_dsdk_adapt_cast_b <= arg_layer_num_select_b(7 downto 0);

    -- arg_group_size_x_select(BITSELECT,63)
    arg_group_size_x_select_b <= kernel_arguments(191 downto 184);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,13)
    dupName_11_ip_dsdk_adapt_cast_x_b <= arg_group_size_x_select_b(7 downto 0);

    -- arg_group_rem_size_xyz_select(BITSELECT,62)
    arg_group_rem_size_xyz_select_b <= kernel_arguments(327 downto 296);

    -- dupName_19_ip_dsdk_adapt_cast_x(BITSELECT,21)
    dupName_19_ip_dsdk_adapt_cast_x_b <= arg_group_rem_size_xyz_select_b(31 downto 0);

    -- arg_group_rem_size_x_select(BITSELECT,61)
    arg_group_rem_size_x_select_b <= kernel_arguments(263 downto 256);

    -- dupName_17_ip_dsdk_adapt_cast_x(BITSELECT,19)
    dupName_17_ip_dsdk_adapt_cast_x_b <= arg_group_rem_size_x_select_b(7 downto 0);

    -- arg_group_num_y_select(BITSELECT,60)
    arg_group_num_y_select_b <= kernel_arguments(255 downto 224);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,18)
    dupName_16_ip_dsdk_adapt_cast_x_b <= arg_group_num_y_select_b(31 downto 0);

    -- arg_group_num_x_select(BITSELECT,59)
    arg_group_num_x_select_b <= kernel_arguments(223 downto 216);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,17)
    dupName_15_ip_dsdk_adapt_cast_x_b <= arg_group_num_x_select_b(7 downto 0);

    -- arg_group_num_mul_win_size_select(BITSELECT,58)
    arg_group_num_mul_win_size_select_b <= kernel_arguments(295 downto 264);

    -- dupName_18_ip_dsdk_adapt_cast_x(BITSELECT,20)
    dupName_18_ip_dsdk_adapt_cast_x_b <= arg_group_num_mul_win_size_select_b(31 downto 0);

    -- const_32b_zero_0(CONSTANT,83)
    const_32b_zero_0_q <= "00000000000000000000000000000000";

    -- arg_frac_w_select(BITSELECT,57)
    arg_frac_w_select_b <= kernel_arguments(671 downto 664);

    -- dupName_31_ip_dsdk_adapt_cast_x(BITSELECT,33)
    dupName_31_ip_dsdk_adapt_cast_x_b <= arg_frac_w_select_b(7 downto 0);

    -- arg_frac_dout_select(BITSELECT,56)
    arg_frac_dout_select_b <= kernel_arguments(695 downto 688);

    -- dupName_34_ip_dsdk_adapt_cast_x(BITSELECT,36)
    dupName_34_ip_dsdk_adapt_cast_x_b <= arg_frac_dout_select_b(7 downto 0);

    -- arg_frac_din_select(BITSELECT,55)
    arg_frac_din_select_b <= kernel_arguments(687 downto 680);

    -- dupName_33_ip_dsdk_adapt_cast_x(BITSELECT,35)
    dupName_33_ip_dsdk_adapt_cast_x_b <= arg_frac_din_select_b(7 downto 0);

    -- arg_frac_b_select(BITSELECT,54)
    arg_frac_b_select_b <= kernel_arguments(679 downto 672);

    -- dupName_32_ip_dsdk_adapt_cast_x(BITSELECT,34)
    dupName_32_ip_dsdk_adapt_cast_x_b <= arg_frac_b_select_b(7 downto 0);

    -- arg_fc_en_select(BITSELECT,53)
    arg_fc_en_select_b <= kernel_arguments(663 downto 656);

    -- dupName_30_ip_dsdk_adapt_cast_x(BITSELECT,32)
    dupName_30_ip_dsdk_adapt_cast_x_b <= arg_fc_en_select_b(7 downto 0);

    -- arg_data_dim2_select(BITSELECT,52)
    arg_data_dim2_select_b <= kernel_arguments(47 downto 32);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_data_dim2_select_b(15 downto 0);

    -- arg_data_dim1xdim2_select(BITSELECT,51)
    arg_data_dim1xdim2_select_b <= kernel_arguments(79 downto 48);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_data_dim1xdim2_select_b(31 downto 0);

    -- arg_data_dim1_select(BITSELECT,50)
    arg_data_dim1_select_b <= kernel_arguments(31 downto 16);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_data_dim1_select_b(15 downto 0);

    -- arg_conv_x_select(BITSELECT,49)
    arg_conv_x_select_b <= kernel_arguments(183 downto 168);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,12)
    dupName_10_ip_dsdk_adapt_cast_x_b <= arg_conv_x_select_b(15 downto 0);

    -- arg_conv_row_rem_select(BITSELECT,48)
    arg_conv_row_rem_select_b <= kernel_arguments(15 downto 8);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_conv_row_rem_select_b(7 downto 0);

    -- arg_conv_out_loopnum_select(BITSELECT,47)
    arg_conv_out_loopnum_select_b <= kernel_arguments(615 downto 584);

    -- dupName_27_ip_dsdk_adapt_cast_x(BITSELECT,29)
    dupName_27_ip_dsdk_adapt_cast_x_b <= arg_conv_out_loopnum_select_b(31 downto 0);

    -- arg_conv_loop_cnt_select(BITSELECT,46)
    arg_conv_loop_cnt_select_b <= kernel_arguments(647 downto 616);

    -- dupName_28_ip_dsdk_adapt_cast_x(BITSELECT,30)
    dupName_28_ip_dsdk_adapt_cast_x_b <= arg_conv_loop_cnt_select_b(31 downto 0);

    -- arg_control_select(BITSELECT,45)
    arg_control_select_b <= kernel_arguments(655 downto 648);

    -- dupName_29_ip_dsdk_adapt_cast_x(BITSELECT,31)
    dupName_29_ip_dsdk_adapt_cast_x_b <= arg_control_select_b(7 downto 0);

    -- arg_col_size_select(BITSELECT,44)
    arg_col_size_select_b <= kernel_arguments(727 downto 712);

    -- dupName_36_ip_dsdk_adapt_cast_x(BITSELECT,38)
    dupName_36_ip_dsdk_adapt_cast_x_b <= arg_col_size_select_b(15 downto 0);

    -- arg_bottom_select(BITSELECT,43)
    arg_bottom_select_b <= kernel_arguments(455 downto 392);

    -- dupName_24_ip_dsdk_adapt_cast_x(BITSELECT,26)
    dupName_24_ip_dsdk_adapt_cast_x_b <= arg_bottom_select_b(63 downto 0);

    -- arg_bias_select(BITSELECT,42)
    arg_bias_select_b <= kernel_arguments(583 downto 520);

    -- dupName_26_ip_dsdk_adapt_cast_x(BITSELECT,28)
    dupName_26_ip_dsdk_adapt_cast_x_b <= arg_bias_select_b(63 downto 0);

    -- memRead_function(BLACKBOX,161)
    thememRead_function : memRead_function
    PORT MAP (
        in_arg_bias => dupName_26_ip_dsdk_adapt_cast_x_b,
        in_arg_bottom => dupName_24_ip_dsdk_adapt_cast_x_b,
        in_arg_col_size => dupName_36_ip_dsdk_adapt_cast_x_b,
        in_arg_control => dupName_29_ip_dsdk_adapt_cast_x_b,
        in_arg_conv_loop_cnt => dupName_28_ip_dsdk_adapt_cast_x_b,
        in_arg_conv_out_loopnum => dupName_27_ip_dsdk_adapt_cast_x_b,
        in_arg_conv_row_rem => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_conv_x => dupName_10_ip_dsdk_adapt_cast_x_b,
        in_arg_data_dim1 => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_data_dim1xdim2 => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_arg_data_dim2 => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_fc_en => dupName_30_ip_dsdk_adapt_cast_x_b,
        in_arg_frac_b => dupName_32_ip_dsdk_adapt_cast_x_b,
        in_arg_frac_din => dupName_33_ip_dsdk_adapt_cast_x_b,
        in_arg_frac_dout => dupName_34_ip_dsdk_adapt_cast_x_b,
        in_arg_frac_w => dupName_31_ip_dsdk_adapt_cast_x_b,
        in_arg_global_size_0 => const_32b_zero_0_q,
        in_arg_global_size_1 => const_32b_zero_0_q,
        in_arg_global_size_2 => const_32b_zero_0_q,
        in_arg_group_num_mul_win_size => dupName_18_ip_dsdk_adapt_cast_x_b,
        in_arg_group_num_x => dupName_15_ip_dsdk_adapt_cast_x_b,
        in_arg_group_num_y => dupName_16_ip_dsdk_adapt_cast_x_b,
        in_arg_group_rem_size_x => dupName_17_ip_dsdk_adapt_cast_x_b,
        in_arg_group_rem_size_xyz => dupName_19_ip_dsdk_adapt_cast_x_b,
        in_arg_group_size_x => dupName_11_ip_dsdk_adapt_cast_x_b,
        in_arg_layer_num => ip_dsdk_adapt_cast_b,
        in_arg_line_size => dupName_35_ip_dsdk_adapt_cast_x_b,
        in_arg_local_size_0 => const_32b_zero_0_q,
        in_arg_local_size_1 => const_32b_zero_0_q,
        in_arg_local_size_2 => const_32b_zero_0_q,
        in_arg_padding => dupName_13_ip_dsdk_adapt_cast_x_b,
        in_arg_pool_size => dupName_37_ip_dsdk_adapt_cast_x_b,
        in_arg_pool_stride => dupName_38_ip_dsdk_adapt_cast_x_b,
        in_arg_split => dupName_14_ip_dsdk_adapt_cast_x_b,
        in_arg_stride => dupName_12_ip_dsdk_adapt_cast_x_b,
        in_arg_weight_dim1 => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_weight_dim1x2 => dupName_8_ip_dsdk_adapt_cast_x_b,
        in_arg_weight_dim1x2x3 => dupName_9_ip_dsdk_adapt_cast_x_b,
        in_arg_weight_dim2 => dupName_5_ip_dsdk_adapt_cast_x_b,
        in_arg_weight_dim3 => dupName_6_ip_dsdk_adapt_cast_x_b,
        in_arg_weight_dim4_div_lane => dupName_7_ip_dsdk_adapt_cast_x_b,
        in_arg_weights => dupName_25_ip_dsdk_adapt_cast_x_b,
        in_arg_win_size => dupName_20_ip_dsdk_adapt_cast_x_b,
        in_arg_win_size_x => dupName_21_ip_dsdk_adapt_cast_x_b,
        in_arg_win_size_xyz => dupName_23_ip_dsdk_adapt_cast_x_b,
        in_arg_win_size_y => dupName_22_ip_dsdk_adapt_cast_x_b,
        in_iowr_bl_bypass_ch_i_fifoready => avst_iowr_bl_bypass_ch_ready,
        in_iowr_bl_pool_ch_i_fifoready => avst_iowr_bl_pool_ch_ready,
        in_memcoalesce_1793_load_0_avm_readdata => avm_memcoalesce_1793_load_0_readdata,
        in_memcoalesce_1793_load_0_avm_readdatavalid => avm_memcoalesce_1793_load_0_readdatavalid,
        in_memcoalesce_1793_load_0_avm_waitrequest => avm_memcoalesce_1793_load_0_waitrequest,
        in_memcoalesce_1793_load_0_avm_writeack => avm_memcoalesce_1793_load_0_writeack,
        in_memcoalesce_bottom_load_0_avm_readdata => avm_memcoalesce_bottom_load_0_readdata,
        in_memcoalesce_bottom_load_0_avm_readdatavalid => avm_memcoalesce_bottom_load_0_readdatavalid,
        in_memcoalesce_bottom_load_0_avm_waitrequest => avm_memcoalesce_bottom_load_0_waitrequest,
        in_memcoalesce_bottom_load_0_avm_writeack => avm_memcoalesce_bottom_load_0_writeack,
        in_memcoalesce_null_load_0117_avm_readdata => avm_memcoalesce_null_load_0117_readdata,
        in_memcoalesce_null_load_0117_avm_readdatavalid => avm_memcoalesce_null_load_0117_readdatavalid,
        in_memcoalesce_null_load_0117_avm_waitrequest => avm_memcoalesce_null_load_0117_waitrequest,
        in_memcoalesce_null_load_0117_avm_writeack => avm_memcoalesce_null_load_0117_writeack,
        in_memcoalesce_null_load_0152_avm_readdata => avm_memcoalesce_null_load_0152_readdata,
        in_memcoalesce_null_load_0152_avm_readdatavalid => avm_memcoalesce_null_load_0152_readdatavalid,
        in_memcoalesce_null_load_0152_avm_waitrequest => avm_memcoalesce_null_load_0152_waitrequest,
        in_memcoalesce_null_load_0152_avm_writeack => avm_memcoalesce_null_load_0152_writeack,
        in_memcoalesce_null_load_082_avm_readdata => avm_memcoalesce_null_load_082_readdata,
        in_memcoalesce_null_load_082_avm_readdatavalid => avm_memcoalesce_null_load_082_readdatavalid,
        in_memcoalesce_null_load_082_avm_waitrequest => avm_memcoalesce_null_load_082_waitrequest,
        in_memcoalesce_null_load_082_avm_writeack => avm_memcoalesce_null_load_082_writeack,
        in_memcoalesce_null_load_0_avm_readdata => avm_memcoalesce_null_load_0_readdata,
        in_memcoalesce_null_load_0_avm_readdatavalid => avm_memcoalesce_null_load_0_readdatavalid,
        in_memcoalesce_null_load_0_avm_waitrequest => avm_memcoalesce_null_load_0_waitrequest,
        in_memcoalesce_null_load_0_avm_writeack => avm_memcoalesce_null_load_0_writeack,
        in_memcoalesce_weights_load_0_avm_readdata => avm_memcoalesce_weights_load_0_readdata,
        in_memcoalesce_weights_load_0_avm_readdatavalid => avm_memcoalesce_weights_load_0_readdatavalid,
        in_memcoalesce_weights_load_0_avm_waitrequest => avm_memcoalesce_weights_load_0_waitrequest,
        in_memcoalesce_weights_load_0_avm_writeack => avm_memcoalesce_weights_load_0_writeack,
        in_memdep_16_avm_readdata => avm_memdep_16_readdata,
        in_memdep_16_avm_readdatavalid => avm_memdep_16_readdatavalid,
        in_memdep_16_avm_waitrequest => avm_memdep_16_waitrequest,
        in_memdep_16_avm_writeack => avm_memdep_16_writeack,
        in_memdep_5_avm_readdata => avm_memdep_5_readdata,
        in_memdep_5_avm_readdatavalid => avm_memdep_5_readdatavalid,
        in_memdep_5_avm_waitrequest => avm_memdep_5_waitrequest,
        in_memdep_5_avm_writeack => avm_memdep_5_writeack,
        in_memdep_6_avm_readdata => avm_memdep_6_readdata,
        in_memdep_6_avm_readdatavalid => avm_memdep_6_readdatavalid,
        in_memdep_6_avm_waitrequest => avm_memdep_6_waitrequest,
        in_memdep_6_avm_writeack => avm_memdep_6_writeack,
        in_memdep_7_avm_readdata => avm_memdep_7_readdata,
        in_memdep_7_avm_readdatavalid => avm_memdep_7_readdatavalid,
        in_memdep_7_avm_waitrequest => avm_memdep_7_waitrequest,
        in_memdep_7_avm_writeack => avm_memdep_7_writeack,
        in_memdep_avm_readdata => avm_memdep_readdata,
        in_memdep_avm_readdatavalid => avm_memdep_readdatavalid,
        in_memdep_avm_waitrequest => avm_memdep_waitrequest,
        in_memdep_avm_writeack => avm_memdep_writeack,
        in_normls_load1697_avm_readdata => avm_normls_load1697_readdata,
        in_normls_load1697_avm_readdatavalid => avm_normls_load1697_readdatavalid,
        in_normls_load1697_avm_waitrequest => avm_normls_load1697_waitrequest,
        in_normls_load1697_avm_writeack => avm_normls_load1697_writeack,
        in_normls_load1702_avm_readdata => avm_normls_load1702_readdata,
        in_normls_load1702_avm_readdatavalid => avm_normls_load1702_readdatavalid,
        in_normls_load1702_avm_waitrequest => avm_normls_load1702_waitrequest,
        in_normls_load1702_avm_writeack => avm_normls_load1702_writeack,
        in_normls_load_avm_readdata => avm_normls_load_readdata,
        in_normls_load_avm_readdatavalid => avm_normls_load_readdatavalid,
        in_normls_load_avm_waitrequest => avm_normls_load_waitrequest,
        in_normls_load_avm_writeack => avm_normls_load_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_tmp420_avm_readdata => avm_tmp420_readdata,
        in_tmp420_avm_readdatavalid => avm_tmp420_readdatavalid,
        in_tmp420_avm_waitrequest => avm_tmp420_waitrequest,
        in_tmp420_avm_writeack => avm_tmp420_writeack,
        in_valid_in => valid_in_pulse_q,
        out_iowr_bl_bypass_ch_o_fifodata => memRead_function_out_iowr_bl_bypass_ch_o_fifodata,
        out_iowr_bl_bypass_ch_o_fifovalid => memRead_function_out_iowr_bl_bypass_ch_o_fifovalid,
        out_iowr_bl_pool_ch_o_fifodata => memRead_function_out_iowr_bl_pool_ch_o_fifodata,
        out_iowr_bl_pool_ch_o_fifovalid => memRead_function_out_iowr_bl_pool_ch_o_fifovalid,
        out_memcoalesce_1793_load_0_avm_address => memRead_function_out_memcoalesce_1793_load_0_avm_address,
        out_memcoalesce_1793_load_0_avm_burstcount => memRead_function_out_memcoalesce_1793_load_0_avm_burstcount,
        out_memcoalesce_1793_load_0_avm_byteenable => memRead_function_out_memcoalesce_1793_load_0_avm_byteenable,
        out_memcoalesce_1793_load_0_avm_enable => memRead_function_out_memcoalesce_1793_load_0_avm_enable,
        out_memcoalesce_1793_load_0_avm_read => memRead_function_out_memcoalesce_1793_load_0_avm_read,
        out_memcoalesce_1793_load_0_avm_write => memRead_function_out_memcoalesce_1793_load_0_avm_write,
        out_memcoalesce_1793_load_0_avm_writedata => memRead_function_out_memcoalesce_1793_load_0_avm_writedata,
        out_memcoalesce_bottom_load_0_avm_address => memRead_function_out_memcoalesce_bottom_load_0_avm_address,
        out_memcoalesce_bottom_load_0_avm_burstcount => memRead_function_out_memcoalesce_bottom_load_0_avm_burstcount,
        out_memcoalesce_bottom_load_0_avm_byteenable => memRead_function_out_memcoalesce_bottom_load_0_avm_byteenable,
        out_memcoalesce_bottom_load_0_avm_enable => memRead_function_out_memcoalesce_bottom_load_0_avm_enable,
        out_memcoalesce_bottom_load_0_avm_read => memRead_function_out_memcoalesce_bottom_load_0_avm_read,
        out_memcoalesce_bottom_load_0_avm_write => memRead_function_out_memcoalesce_bottom_load_0_avm_write,
        out_memcoalesce_bottom_load_0_avm_writedata => memRead_function_out_memcoalesce_bottom_load_0_avm_writedata,
        out_memcoalesce_null_load_0117_avm_address => memRead_function_out_memcoalesce_null_load_0117_avm_address,
        out_memcoalesce_null_load_0117_avm_burstcount => memRead_function_out_memcoalesce_null_load_0117_avm_burstcount,
        out_memcoalesce_null_load_0117_avm_byteenable => memRead_function_out_memcoalesce_null_load_0117_avm_byteenable,
        out_memcoalesce_null_load_0117_avm_enable => memRead_function_out_memcoalesce_null_load_0117_avm_enable,
        out_memcoalesce_null_load_0117_avm_read => memRead_function_out_memcoalesce_null_load_0117_avm_read,
        out_memcoalesce_null_load_0117_avm_write => memRead_function_out_memcoalesce_null_load_0117_avm_write,
        out_memcoalesce_null_load_0117_avm_writedata => memRead_function_out_memcoalesce_null_load_0117_avm_writedata,
        out_memcoalesce_null_load_0152_avm_address => memRead_function_out_memcoalesce_null_load_0152_avm_address,
        out_memcoalesce_null_load_0152_avm_burstcount => memRead_function_out_memcoalesce_null_load_0152_avm_burstcount,
        out_memcoalesce_null_load_0152_avm_byteenable => memRead_function_out_memcoalesce_null_load_0152_avm_byteenable,
        out_memcoalesce_null_load_0152_avm_enable => memRead_function_out_memcoalesce_null_load_0152_avm_enable,
        out_memcoalesce_null_load_0152_avm_read => memRead_function_out_memcoalesce_null_load_0152_avm_read,
        out_memcoalesce_null_load_0152_avm_write => memRead_function_out_memcoalesce_null_load_0152_avm_write,
        out_memcoalesce_null_load_0152_avm_writedata => memRead_function_out_memcoalesce_null_load_0152_avm_writedata,
        out_memcoalesce_null_load_082_avm_address => memRead_function_out_memcoalesce_null_load_082_avm_address,
        out_memcoalesce_null_load_082_avm_burstcount => memRead_function_out_memcoalesce_null_load_082_avm_burstcount,
        out_memcoalesce_null_load_082_avm_byteenable => memRead_function_out_memcoalesce_null_load_082_avm_byteenable,
        out_memcoalesce_null_load_082_avm_enable => memRead_function_out_memcoalesce_null_load_082_avm_enable,
        out_memcoalesce_null_load_082_avm_read => memRead_function_out_memcoalesce_null_load_082_avm_read,
        out_memcoalesce_null_load_082_avm_write => memRead_function_out_memcoalesce_null_load_082_avm_write,
        out_memcoalesce_null_load_082_avm_writedata => memRead_function_out_memcoalesce_null_load_082_avm_writedata,
        out_memcoalesce_null_load_0_avm_address => memRead_function_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => memRead_function_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => memRead_function_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => memRead_function_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => memRead_function_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => memRead_function_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => memRead_function_out_memcoalesce_null_load_0_avm_writedata,
        out_memcoalesce_weights_load_0_avm_address => memRead_function_out_memcoalesce_weights_load_0_avm_address,
        out_memcoalesce_weights_load_0_avm_burstcount => memRead_function_out_memcoalesce_weights_load_0_avm_burstcount,
        out_memcoalesce_weights_load_0_avm_byteenable => memRead_function_out_memcoalesce_weights_load_0_avm_byteenable,
        out_memcoalesce_weights_load_0_avm_enable => memRead_function_out_memcoalesce_weights_load_0_avm_enable,
        out_memcoalesce_weights_load_0_avm_read => memRead_function_out_memcoalesce_weights_load_0_avm_read,
        out_memcoalesce_weights_load_0_avm_write => memRead_function_out_memcoalesce_weights_load_0_avm_write,
        out_memcoalesce_weights_load_0_avm_writedata => memRead_function_out_memcoalesce_weights_load_0_avm_writedata,
        out_memdep_16_avm_address => memRead_function_out_memdep_16_avm_address,
        out_memdep_16_avm_burstcount => memRead_function_out_memdep_16_avm_burstcount,
        out_memdep_16_avm_byteenable => memRead_function_out_memdep_16_avm_byteenable,
        out_memdep_16_avm_enable => memRead_function_out_memdep_16_avm_enable,
        out_memdep_16_avm_read => memRead_function_out_memdep_16_avm_read,
        out_memdep_16_avm_write => memRead_function_out_memdep_16_avm_write,
        out_memdep_16_avm_writedata => memRead_function_out_memdep_16_avm_writedata,
        out_memdep_5_avm_address => memRead_function_out_memdep_5_avm_address,
        out_memdep_5_avm_burstcount => memRead_function_out_memdep_5_avm_burstcount,
        out_memdep_5_avm_byteenable => memRead_function_out_memdep_5_avm_byteenable,
        out_memdep_5_avm_enable => memRead_function_out_memdep_5_avm_enable,
        out_memdep_5_avm_read => memRead_function_out_memdep_5_avm_read,
        out_memdep_5_avm_write => memRead_function_out_memdep_5_avm_write,
        out_memdep_5_avm_writedata => memRead_function_out_memdep_5_avm_writedata,
        out_memdep_6_avm_address => memRead_function_out_memdep_6_avm_address,
        out_memdep_6_avm_burstcount => memRead_function_out_memdep_6_avm_burstcount,
        out_memdep_6_avm_byteenable => memRead_function_out_memdep_6_avm_byteenable,
        out_memdep_6_avm_enable => memRead_function_out_memdep_6_avm_enable,
        out_memdep_6_avm_read => memRead_function_out_memdep_6_avm_read,
        out_memdep_6_avm_write => memRead_function_out_memdep_6_avm_write,
        out_memdep_6_avm_writedata => memRead_function_out_memdep_6_avm_writedata,
        out_memdep_7_avm_address => memRead_function_out_memdep_7_avm_address,
        out_memdep_7_avm_burstcount => memRead_function_out_memdep_7_avm_burstcount,
        out_memdep_7_avm_byteenable => memRead_function_out_memdep_7_avm_byteenable,
        out_memdep_7_avm_enable => memRead_function_out_memdep_7_avm_enable,
        out_memdep_7_avm_read => memRead_function_out_memdep_7_avm_read,
        out_memdep_7_avm_write => memRead_function_out_memdep_7_avm_write,
        out_memdep_7_avm_writedata => memRead_function_out_memdep_7_avm_writedata,
        out_memdep_avm_address => memRead_function_out_memdep_avm_address,
        out_memdep_avm_burstcount => memRead_function_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => memRead_function_out_memdep_avm_byteenable,
        out_memdep_avm_enable => memRead_function_out_memdep_avm_enable,
        out_memdep_avm_read => memRead_function_out_memdep_avm_read,
        out_memdep_avm_write => memRead_function_out_memdep_avm_write,
        out_memdep_avm_writedata => memRead_function_out_memdep_avm_writedata,
        out_normls_load1697_avm_address => memRead_function_out_normls_load1697_avm_address,
        out_normls_load1697_avm_burstcount => memRead_function_out_normls_load1697_avm_burstcount,
        out_normls_load1697_avm_byteenable => memRead_function_out_normls_load1697_avm_byteenable,
        out_normls_load1697_avm_enable => memRead_function_out_normls_load1697_avm_enable,
        out_normls_load1697_avm_read => memRead_function_out_normls_load1697_avm_read,
        out_normls_load1697_avm_write => memRead_function_out_normls_load1697_avm_write,
        out_normls_load1697_avm_writedata => memRead_function_out_normls_load1697_avm_writedata,
        out_normls_load1702_avm_address => memRead_function_out_normls_load1702_avm_address,
        out_normls_load1702_avm_burstcount => memRead_function_out_normls_load1702_avm_burstcount,
        out_normls_load1702_avm_byteenable => memRead_function_out_normls_load1702_avm_byteenable,
        out_normls_load1702_avm_enable => memRead_function_out_normls_load1702_avm_enable,
        out_normls_load1702_avm_read => memRead_function_out_normls_load1702_avm_read,
        out_normls_load1702_avm_write => memRead_function_out_normls_load1702_avm_write,
        out_normls_load1702_avm_writedata => memRead_function_out_normls_load1702_avm_writedata,
        out_normls_load_avm_address => memRead_function_out_normls_load_avm_address,
        out_normls_load_avm_burstcount => memRead_function_out_normls_load_avm_burstcount,
        out_normls_load_avm_byteenable => memRead_function_out_normls_load_avm_byteenable,
        out_normls_load_avm_enable => memRead_function_out_normls_load_avm_enable,
        out_normls_load_avm_read => memRead_function_out_normls_load_avm_read,
        out_normls_load_avm_write => memRead_function_out_normls_load_avm_write,
        out_normls_load_avm_writedata => memRead_function_out_normls_load_avm_writedata,
        out_tmp420_avm_address => memRead_function_out_tmp420_avm_address,
        out_tmp420_avm_burstcount => memRead_function_out_tmp420_avm_burstcount,
        out_tmp420_avm_byteenable => memRead_function_out_tmp420_avm_byteenable,
        out_tmp420_avm_enable => memRead_function_out_tmp420_avm_enable,
        out_tmp420_avm_read => memRead_function_out_tmp420_avm_read,
        out_tmp420_avm_write => memRead_function_out_tmp420_avm_write,
        out_tmp420_avm_writedata => memRead_function_out_tmp420_avm_writedata,
        out_valid_out => memRead_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_memcoalesce_1793_load_0_address(GPOUT,162)
    avm_memcoalesce_1793_load_0_address <= memRead_function_out_memcoalesce_1793_load_0_avm_address;

    -- avm_memcoalesce_1793_load_0_burstcount(GPOUT,163)
    avm_memcoalesce_1793_load_0_burstcount <= memRead_function_out_memcoalesce_1793_load_0_avm_burstcount;

    -- avm_memcoalesce_1793_load_0_byteenable(GPOUT,164)
    avm_memcoalesce_1793_load_0_byteenable <= memRead_function_out_memcoalesce_1793_load_0_avm_byteenable;

    -- avm_memcoalesce_1793_load_0_enable(GPOUT,165)
    avm_memcoalesce_1793_load_0_enable <= memRead_function_out_memcoalesce_1793_load_0_avm_enable;

    -- avm_memcoalesce_1793_load_0_read(GPOUT,166)
    avm_memcoalesce_1793_load_0_read <= memRead_function_out_memcoalesce_1793_load_0_avm_read;

    -- avm_memcoalesce_1793_load_0_write(GPOUT,167)
    avm_memcoalesce_1793_load_0_write <= memRead_function_out_memcoalesce_1793_load_0_avm_write;

    -- avm_memcoalesce_1793_load_0_writedata(GPOUT,168)
    avm_memcoalesce_1793_load_0_writedata <= memRead_function_out_memcoalesce_1793_load_0_avm_writedata;

    -- avm_memcoalesce_bottom_load_0_address(GPOUT,169)
    avm_memcoalesce_bottom_load_0_address <= memRead_function_out_memcoalesce_bottom_load_0_avm_address;

    -- avm_memcoalesce_bottom_load_0_burstcount(GPOUT,170)
    avm_memcoalesce_bottom_load_0_burstcount <= memRead_function_out_memcoalesce_bottom_load_0_avm_burstcount;

    -- avm_memcoalesce_bottom_load_0_byteenable(GPOUT,171)
    avm_memcoalesce_bottom_load_0_byteenable <= memRead_function_out_memcoalesce_bottom_load_0_avm_byteenable;

    -- avm_memcoalesce_bottom_load_0_enable(GPOUT,172)
    avm_memcoalesce_bottom_load_0_enable <= memRead_function_out_memcoalesce_bottom_load_0_avm_enable;

    -- avm_memcoalesce_bottom_load_0_read(GPOUT,173)
    avm_memcoalesce_bottom_load_0_read <= memRead_function_out_memcoalesce_bottom_load_0_avm_read;

    -- avm_memcoalesce_bottom_load_0_write(GPOUT,174)
    avm_memcoalesce_bottom_load_0_write <= memRead_function_out_memcoalesce_bottom_load_0_avm_write;

    -- avm_memcoalesce_bottom_load_0_writedata(GPOUT,175)
    avm_memcoalesce_bottom_load_0_writedata <= memRead_function_out_memcoalesce_bottom_load_0_avm_writedata;

    -- avm_memcoalesce_null_load_0117_address(GPOUT,176)
    avm_memcoalesce_null_load_0117_address <= memRead_function_out_memcoalesce_null_load_0117_avm_address;

    -- avm_memcoalesce_null_load_0117_burstcount(GPOUT,177)
    avm_memcoalesce_null_load_0117_burstcount <= memRead_function_out_memcoalesce_null_load_0117_avm_burstcount;

    -- avm_memcoalesce_null_load_0117_byteenable(GPOUT,178)
    avm_memcoalesce_null_load_0117_byteenable <= memRead_function_out_memcoalesce_null_load_0117_avm_byteenable;

    -- avm_memcoalesce_null_load_0117_enable(GPOUT,179)
    avm_memcoalesce_null_load_0117_enable <= memRead_function_out_memcoalesce_null_load_0117_avm_enable;

    -- avm_memcoalesce_null_load_0117_read(GPOUT,180)
    avm_memcoalesce_null_load_0117_read <= memRead_function_out_memcoalesce_null_load_0117_avm_read;

    -- avm_memcoalesce_null_load_0117_write(GPOUT,181)
    avm_memcoalesce_null_load_0117_write <= memRead_function_out_memcoalesce_null_load_0117_avm_write;

    -- avm_memcoalesce_null_load_0117_writedata(GPOUT,182)
    avm_memcoalesce_null_load_0117_writedata <= memRead_function_out_memcoalesce_null_load_0117_avm_writedata;

    -- avm_memcoalesce_null_load_0152_address(GPOUT,183)
    avm_memcoalesce_null_load_0152_address <= memRead_function_out_memcoalesce_null_load_0152_avm_address;

    -- avm_memcoalesce_null_load_0152_burstcount(GPOUT,184)
    avm_memcoalesce_null_load_0152_burstcount <= memRead_function_out_memcoalesce_null_load_0152_avm_burstcount;

    -- avm_memcoalesce_null_load_0152_byteenable(GPOUT,185)
    avm_memcoalesce_null_load_0152_byteenable <= memRead_function_out_memcoalesce_null_load_0152_avm_byteenable;

    -- avm_memcoalesce_null_load_0152_enable(GPOUT,186)
    avm_memcoalesce_null_load_0152_enable <= memRead_function_out_memcoalesce_null_load_0152_avm_enable;

    -- avm_memcoalesce_null_load_0152_read(GPOUT,187)
    avm_memcoalesce_null_load_0152_read <= memRead_function_out_memcoalesce_null_load_0152_avm_read;

    -- avm_memcoalesce_null_load_0152_write(GPOUT,188)
    avm_memcoalesce_null_load_0152_write <= memRead_function_out_memcoalesce_null_load_0152_avm_write;

    -- avm_memcoalesce_null_load_0152_writedata(GPOUT,189)
    avm_memcoalesce_null_load_0152_writedata <= memRead_function_out_memcoalesce_null_load_0152_avm_writedata;

    -- avm_memcoalesce_null_load_082_address(GPOUT,190)
    avm_memcoalesce_null_load_082_address <= memRead_function_out_memcoalesce_null_load_082_avm_address;

    -- avm_memcoalesce_null_load_082_burstcount(GPOUT,191)
    avm_memcoalesce_null_load_082_burstcount <= memRead_function_out_memcoalesce_null_load_082_avm_burstcount;

    -- avm_memcoalesce_null_load_082_byteenable(GPOUT,192)
    avm_memcoalesce_null_load_082_byteenable <= memRead_function_out_memcoalesce_null_load_082_avm_byteenable;

    -- avm_memcoalesce_null_load_082_enable(GPOUT,193)
    avm_memcoalesce_null_load_082_enable <= memRead_function_out_memcoalesce_null_load_082_avm_enable;

    -- avm_memcoalesce_null_load_082_read(GPOUT,194)
    avm_memcoalesce_null_load_082_read <= memRead_function_out_memcoalesce_null_load_082_avm_read;

    -- avm_memcoalesce_null_load_082_write(GPOUT,195)
    avm_memcoalesce_null_load_082_write <= memRead_function_out_memcoalesce_null_load_082_avm_write;

    -- avm_memcoalesce_null_load_082_writedata(GPOUT,196)
    avm_memcoalesce_null_load_082_writedata <= memRead_function_out_memcoalesce_null_load_082_avm_writedata;

    -- avm_memcoalesce_null_load_0_address(GPOUT,197)
    avm_memcoalesce_null_load_0_address <= memRead_function_out_memcoalesce_null_load_0_avm_address;

    -- avm_memcoalesce_null_load_0_burstcount(GPOUT,198)
    avm_memcoalesce_null_load_0_burstcount <= memRead_function_out_memcoalesce_null_load_0_avm_burstcount;

    -- avm_memcoalesce_null_load_0_byteenable(GPOUT,199)
    avm_memcoalesce_null_load_0_byteenable <= memRead_function_out_memcoalesce_null_load_0_avm_byteenable;

    -- avm_memcoalesce_null_load_0_enable(GPOUT,200)
    avm_memcoalesce_null_load_0_enable <= memRead_function_out_memcoalesce_null_load_0_avm_enable;

    -- avm_memcoalesce_null_load_0_read(GPOUT,201)
    avm_memcoalesce_null_load_0_read <= memRead_function_out_memcoalesce_null_load_0_avm_read;

    -- avm_memcoalesce_null_load_0_write(GPOUT,202)
    avm_memcoalesce_null_load_0_write <= memRead_function_out_memcoalesce_null_load_0_avm_write;

    -- avm_memcoalesce_null_load_0_writedata(GPOUT,203)
    avm_memcoalesce_null_load_0_writedata <= memRead_function_out_memcoalesce_null_load_0_avm_writedata;

    -- avm_memcoalesce_weights_load_0_address(GPOUT,204)
    avm_memcoalesce_weights_load_0_address <= memRead_function_out_memcoalesce_weights_load_0_avm_address;

    -- avm_memcoalesce_weights_load_0_burstcount(GPOUT,205)
    avm_memcoalesce_weights_load_0_burstcount <= memRead_function_out_memcoalesce_weights_load_0_avm_burstcount;

    -- avm_memcoalesce_weights_load_0_byteenable(GPOUT,206)
    avm_memcoalesce_weights_load_0_byteenable <= memRead_function_out_memcoalesce_weights_load_0_avm_byteenable;

    -- avm_memcoalesce_weights_load_0_enable(GPOUT,207)
    avm_memcoalesce_weights_load_0_enable <= memRead_function_out_memcoalesce_weights_load_0_avm_enable;

    -- avm_memcoalesce_weights_load_0_read(GPOUT,208)
    avm_memcoalesce_weights_load_0_read <= memRead_function_out_memcoalesce_weights_load_0_avm_read;

    -- avm_memcoalesce_weights_load_0_write(GPOUT,209)
    avm_memcoalesce_weights_load_0_write <= memRead_function_out_memcoalesce_weights_load_0_avm_write;

    -- avm_memcoalesce_weights_load_0_writedata(GPOUT,210)
    avm_memcoalesce_weights_load_0_writedata <= memRead_function_out_memcoalesce_weights_load_0_avm_writedata;

    -- avm_memdep_16_address(GPOUT,211)
    avm_memdep_16_address <= memRead_function_out_memdep_16_avm_address;

    -- avm_memdep_16_burstcount(GPOUT,212)
    avm_memdep_16_burstcount <= memRead_function_out_memdep_16_avm_burstcount;

    -- avm_memdep_16_byteenable(GPOUT,213)
    avm_memdep_16_byteenable <= memRead_function_out_memdep_16_avm_byteenable;

    -- avm_memdep_16_enable(GPOUT,214)
    avm_memdep_16_enable <= memRead_function_out_memdep_16_avm_enable;

    -- avm_memdep_16_read(GPOUT,215)
    avm_memdep_16_read <= memRead_function_out_memdep_16_avm_read;

    -- avm_memdep_16_write(GPOUT,216)
    avm_memdep_16_write <= memRead_function_out_memdep_16_avm_write;

    -- avm_memdep_16_writedata(GPOUT,217)
    avm_memdep_16_writedata <= memRead_function_out_memdep_16_avm_writedata;

    -- avm_memdep_5_address(GPOUT,218)
    avm_memdep_5_address <= memRead_function_out_memdep_5_avm_address;

    -- avm_memdep_5_burstcount(GPOUT,219)
    avm_memdep_5_burstcount <= memRead_function_out_memdep_5_avm_burstcount;

    -- avm_memdep_5_byteenable(GPOUT,220)
    avm_memdep_5_byteenable <= memRead_function_out_memdep_5_avm_byteenable;

    -- avm_memdep_5_enable(GPOUT,221)
    avm_memdep_5_enable <= memRead_function_out_memdep_5_avm_enable;

    -- avm_memdep_5_read(GPOUT,222)
    avm_memdep_5_read <= memRead_function_out_memdep_5_avm_read;

    -- avm_memdep_5_write(GPOUT,223)
    avm_memdep_5_write <= memRead_function_out_memdep_5_avm_write;

    -- avm_memdep_5_writedata(GPOUT,224)
    avm_memdep_5_writedata <= memRead_function_out_memdep_5_avm_writedata;

    -- avm_memdep_6_address(GPOUT,225)
    avm_memdep_6_address <= memRead_function_out_memdep_6_avm_address;

    -- avm_memdep_6_burstcount(GPOUT,226)
    avm_memdep_6_burstcount <= memRead_function_out_memdep_6_avm_burstcount;

    -- avm_memdep_6_byteenable(GPOUT,227)
    avm_memdep_6_byteenable <= memRead_function_out_memdep_6_avm_byteenable;

    -- avm_memdep_6_enable(GPOUT,228)
    avm_memdep_6_enable <= memRead_function_out_memdep_6_avm_enable;

    -- avm_memdep_6_read(GPOUT,229)
    avm_memdep_6_read <= memRead_function_out_memdep_6_avm_read;

    -- avm_memdep_6_write(GPOUT,230)
    avm_memdep_6_write <= memRead_function_out_memdep_6_avm_write;

    -- avm_memdep_6_writedata(GPOUT,231)
    avm_memdep_6_writedata <= memRead_function_out_memdep_6_avm_writedata;

    -- avm_memdep_7_address(GPOUT,232)
    avm_memdep_7_address <= memRead_function_out_memdep_7_avm_address;

    -- avm_memdep_7_burstcount(GPOUT,233)
    avm_memdep_7_burstcount <= memRead_function_out_memdep_7_avm_burstcount;

    -- avm_memdep_7_byteenable(GPOUT,234)
    avm_memdep_7_byteenable <= memRead_function_out_memdep_7_avm_byteenable;

    -- avm_memdep_7_enable(GPOUT,235)
    avm_memdep_7_enable <= memRead_function_out_memdep_7_avm_enable;

    -- avm_memdep_7_read(GPOUT,236)
    avm_memdep_7_read <= memRead_function_out_memdep_7_avm_read;

    -- avm_memdep_7_write(GPOUT,237)
    avm_memdep_7_write <= memRead_function_out_memdep_7_avm_write;

    -- avm_memdep_7_writedata(GPOUT,238)
    avm_memdep_7_writedata <= memRead_function_out_memdep_7_avm_writedata;

    -- avm_memdep_address(GPOUT,239)
    avm_memdep_address <= memRead_function_out_memdep_avm_address;

    -- avm_memdep_burstcount(GPOUT,240)
    avm_memdep_burstcount <= memRead_function_out_memdep_avm_burstcount;

    -- avm_memdep_byteenable(GPOUT,241)
    avm_memdep_byteenable <= memRead_function_out_memdep_avm_byteenable;

    -- avm_memdep_enable(GPOUT,242)
    avm_memdep_enable <= memRead_function_out_memdep_avm_enable;

    -- avm_memdep_read(GPOUT,243)
    avm_memdep_read <= memRead_function_out_memdep_avm_read;

    -- avm_memdep_write(GPOUT,244)
    avm_memdep_write <= memRead_function_out_memdep_avm_write;

    -- avm_memdep_writedata(GPOUT,245)
    avm_memdep_writedata <= memRead_function_out_memdep_avm_writedata;

    -- avm_normls_load1697_address(GPOUT,246)
    avm_normls_load1697_address <= memRead_function_out_normls_load1697_avm_address;

    -- avm_normls_load1697_burstcount(GPOUT,247)
    avm_normls_load1697_burstcount <= memRead_function_out_normls_load1697_avm_burstcount;

    -- avm_normls_load1697_byteenable(GPOUT,248)
    avm_normls_load1697_byteenable <= memRead_function_out_normls_load1697_avm_byteenable;

    -- avm_normls_load1697_enable(GPOUT,249)
    avm_normls_load1697_enable <= memRead_function_out_normls_load1697_avm_enable;

    -- avm_normls_load1697_read(GPOUT,250)
    avm_normls_load1697_read <= memRead_function_out_normls_load1697_avm_read;

    -- avm_normls_load1697_write(GPOUT,251)
    avm_normls_load1697_write <= memRead_function_out_normls_load1697_avm_write;

    -- avm_normls_load1697_writedata(GPOUT,252)
    avm_normls_load1697_writedata <= memRead_function_out_normls_load1697_avm_writedata;

    -- avm_normls_load1702_address(GPOUT,253)
    avm_normls_load1702_address <= memRead_function_out_normls_load1702_avm_address;

    -- avm_normls_load1702_burstcount(GPOUT,254)
    avm_normls_load1702_burstcount <= memRead_function_out_normls_load1702_avm_burstcount;

    -- avm_normls_load1702_byteenable(GPOUT,255)
    avm_normls_load1702_byteenable <= memRead_function_out_normls_load1702_avm_byteenable;

    -- avm_normls_load1702_enable(GPOUT,256)
    avm_normls_load1702_enable <= memRead_function_out_normls_load1702_avm_enable;

    -- avm_normls_load1702_read(GPOUT,257)
    avm_normls_load1702_read <= memRead_function_out_normls_load1702_avm_read;

    -- avm_normls_load1702_write(GPOUT,258)
    avm_normls_load1702_write <= memRead_function_out_normls_load1702_avm_write;

    -- avm_normls_load1702_writedata(GPOUT,259)
    avm_normls_load1702_writedata <= memRead_function_out_normls_load1702_avm_writedata;

    -- avm_normls_load_address(GPOUT,260)
    avm_normls_load_address <= memRead_function_out_normls_load_avm_address;

    -- avm_normls_load_burstcount(GPOUT,261)
    avm_normls_load_burstcount <= memRead_function_out_normls_load_avm_burstcount;

    -- avm_normls_load_byteenable(GPOUT,262)
    avm_normls_load_byteenable <= memRead_function_out_normls_load_avm_byteenable;

    -- avm_normls_load_enable(GPOUT,263)
    avm_normls_load_enable <= memRead_function_out_normls_load_avm_enable;

    -- avm_normls_load_read(GPOUT,264)
    avm_normls_load_read <= memRead_function_out_normls_load_avm_read;

    -- avm_normls_load_write(GPOUT,265)
    avm_normls_load_write <= memRead_function_out_normls_load_avm_write;

    -- avm_normls_load_writedata(GPOUT,266)
    avm_normls_load_writedata <= memRead_function_out_normls_load_avm_writedata;

    -- avm_tmp420_address(GPOUT,267)
    avm_tmp420_address <= memRead_function_out_tmp420_avm_address;

    -- avm_tmp420_burstcount(GPOUT,268)
    avm_tmp420_burstcount <= memRead_function_out_tmp420_avm_burstcount;

    -- avm_tmp420_byteenable(GPOUT,269)
    avm_tmp420_byteenable <= memRead_function_out_tmp420_avm_byteenable;

    -- avm_tmp420_enable(GPOUT,270)
    avm_tmp420_enable <= memRead_function_out_tmp420_avm_enable;

    -- avm_tmp420_read(GPOUT,271)
    avm_tmp420_read <= memRead_function_out_tmp420_avm_read;

    -- avm_tmp420_write(GPOUT,272)
    avm_tmp420_write <= memRead_function_out_tmp420_avm_write;

    -- avm_tmp420_writedata(GPOUT,273)
    avm_tmp420_writedata <= memRead_function_out_tmp420_avm_writedata;

    -- avst_iowr_bl_bypass_ch_data(GPOUT,274)
    avst_iowr_bl_bypass_ch_data <= memRead_function_out_iowr_bl_bypass_ch_o_fifodata;

    -- avst_iowr_bl_bypass_ch_valid(GPOUT,275)
    avst_iowr_bl_bypass_ch_valid <= memRead_function_out_iowr_bl_bypass_ch_o_fifovalid;

    -- avst_iowr_bl_pool_ch_data(GPOUT,276)
    avst_iowr_bl_pool_ch_data <= memRead_function_out_iowr_bl_pool_ch_o_fifodata;

    -- avst_iowr_bl_pool_ch_valid(GPOUT,277)
    avst_iowr_bl_pool_ch_valid <= memRead_function_out_iowr_bl_pool_ch_o_fifovalid;

    -- acl_clock2x_dummy_consumer(EXTIFACE,41)
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

    -- clock2x_output(GPOUT,278)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,279)
    has_a_lsu_active <= GND_q;

    -- has_a_write_pending(GPOUT,280)
    has_a_write_pending <= GND_q;

    -- kernel_valid_in(GPOUT,281)
    kernel_valid_in <= valid_in_pulse_q;

    -- kernel_valid_out(GPOUT,282)
    kernel_valid_out <= memRead_function_out_valid_out;

END normal;
