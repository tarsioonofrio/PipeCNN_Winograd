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

-- VHDL created from bb_memRead_B5
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

entity bb_memRead_B5 is
    port (
        in_c0_exit100843_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit100843_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit102044_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit102044_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exit103245_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit103245_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c3_exit46_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exit46_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c4_exit47_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c4_exit47_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c5_exit48_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c5_exit48_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_bottom : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe109775_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe119787_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe129799_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1398011_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1498113_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1598215_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1698317_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1798419_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1898521_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe1998623_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2098725_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2198827_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2298929_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2399031_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2499133_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2599235_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2699337_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_exe2799439_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_col_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_control : in std_logic_vector(7 downto 0);  -- ufix8
        in_conv_loop_cnt : in std_logic_vector(31 downto 0);  -- ufix32
        in_conv_row_rem : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_dim1 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_dim1xdim2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_dim2 : in std_logic_vector(15 downto 0);  -- ufix16
        in_fc_en : in std_logic_vector(7 downto 0);  -- ufix8
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_frac_b : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_din : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_dout : in std_logic_vector(7 downto 0);  -- ufix8
        in_frac_w : in std_logic_vector(7 downto 0);  -- ufix8
        in_group_num_mul_win_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_group_num_x : in std_logic_vector(7 downto 0);  -- ufix8
        in_group_num_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_iowr_bl_bypass_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        in_iowr_bl_pool_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        in_line_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi121_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_padding : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_size : in std_logic_vector(7 downto 0);  -- ufix8
        in_pool_stride : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_weight_dim1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_weight_dim3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_weight_dim4_div_lane : in std_logic_vector(15 downto 0);  -- ufix16
        in_weights : in std_logic_vector(63 downto 0);  -- ufix64
        in_win_size : in std_logic_vector(15 downto 0);  -- ufix16
        in_win_size_y : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_29 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_feedback_out_9 : out std_logic_vector(31 downto 0);  -- ufix32
        in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_29 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_9 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_29 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_bypass_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- ufix96
        out_iowr_bl_bypass_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_pool_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- ufix96
        out_iowr_bl_pool_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0152_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        out_memcoalesce_null_load_0152_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0152_avm_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_16_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_16_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_byteenable : out std_logic_vector(3 downto 0);  -- ufix4
        out_memdep_16_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_16_avm_writedata : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_memRead_B5;

architecture normal of bb_memRead_B5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component memRead_B5_merge is
        port (
            in_c0_exit100843_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit100843_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit102044_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit102044_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exit103245_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit103245_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c3_exit46_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exit46_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c4_exit47_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c4_exit47_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c5_exit48_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c5_exit48_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe109775_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe119787_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe129799_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1398011_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1498113_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1598215_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1698317_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1798419_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1898521_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe1998623_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2098725_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2198827_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2298929_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2399031_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2499133_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2599235_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2699337_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe2799439_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi121_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit100843_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit100843_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit102044_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit102044_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exit103245_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit103245_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c3_exit46_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exit46_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c4_exit47_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c4_exit47_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c5_exit48_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c5_exit48_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe109775 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe119787 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe129799 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1398011 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1498113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1598215 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1698317 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1798419 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1898521 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe1998623 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2098725 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2198827 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2298929 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2399031 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2499133 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2599235 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2699337 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exe2799439 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi121 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_memRead_B5_stall_region is
        port (
            in_c0_exit100843_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit100843_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit102044_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit102044_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exit103245_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit103245_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c3_exit46_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exit46_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c4_exit47_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c4_exit47_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c5_exit48_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c5_exit48_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe109775 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe119787 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe129799 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1398011 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1498113 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1598215 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1698317 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1798419 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1898521 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe1998623 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2098725 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2198827 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2298929 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2399031 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2499133 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2599235 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2699337 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_exe2799439 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_control : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_frac_b : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_frac_din : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_frac_dout : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_frac_w : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_iowr_bl_bypass_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iowr_bl_pool_ch_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_16_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi121 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2098725 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_29 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_bypass_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_iowr_bl_bypass_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_pool_ch_o_fifodata : out std_logic_vector(95 downto 0);  -- Fixed Point
            out_iowr_bl_pool_ch_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0152_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_16_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_16_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_byteenable : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_memdep_16_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_16_avm_writedata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component memRead_B5_branch is
        port (
            in_c0_exe2098725 : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    signal memRead_B5_merge_aunroll_x_out_c0_exit100843_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exit100843_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c1_exit102044_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c1_exit102044_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c2_exit103245_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c2_exit103245_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c3_exit46_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c3_exit46_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c4_exit47_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c4_exit47_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c5_exit48_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c5_exit48_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe109775 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe119787 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe129799 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe1398011 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe1498113 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe1598215 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe1698317 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe1798419 : STD_LOGIC_VECTOR (31 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe1898521 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe1998623 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2098725 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2198827 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2298929 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2399031 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2499133 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2599235 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2699337 : STD_LOGIC_VECTOR (15 downto 0);
    signal memRead_B5_merge_aunroll_x_out_c0_exe2799439 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_memdep_phi121 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_c0_exe2098725 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_out_29 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_valid_out_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_valid_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_valid_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_feedback_valid_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_iowr_bl_bypass_ch_o_fifodata : STD_LOGIC_VECTOR (95 downto 0);
    signal bb_memRead_B5_stall_region_out_iowr_bl_bypass_ch_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_iowr_bl_pool_ch_o_fifodata : STD_LOGIC_VECTOR (95 downto 0);
    signal bb_memRead_B5_stall_region_out_iowr_bl_pool_ch_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_memdep_16_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_memdep_16_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memdep_16_avm_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_memRead_B5_stall_region_out_memdep_16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memdep_16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memdep_16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_memdep_16_avm_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_memRead_B5_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_memRead_B5_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal memRead_B5_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- memRead_B5_branch(BLACKBOX,97)
    thememRead_B5_branch : memRead_B5_branch
    PORT MAP (
        in_c0_exe2098725 => bb_memRead_B5_stall_region_out_c0_exe2098725,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_memRead_B5_stall_region_out_valid_out,
        out_stall_out => memRead_B5_branch_out_stall_out,
        out_valid_out_0 => memRead_B5_branch_out_valid_out_0,
        out_valid_out_1 => memRead_B5_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- memRead_B5_merge_aunroll_x(BLACKBOX,74)
    thememRead_B5_merge_aunroll_x : memRead_B5_merge
    PORT MAP (
        in_c0_exit100843_0_0 => in_c0_exit100843_0_0,
        in_c0_exit100843_0_1 => in_c0_exit100843_0_1,
        in_c1_exit102044_0_0 => in_c1_exit102044_0_0,
        in_c1_exit102044_0_1 => in_c1_exit102044_0_1,
        in_c2_exit103245_0_0 => in_c2_exit103245_0_0,
        in_c2_exit103245_0_1 => in_c2_exit103245_0_1,
        in_c3_exit46_0_0 => in_c3_exit46_0_0,
        in_c3_exit46_0_1 => in_c3_exit46_0_1,
        in_c4_exit47_0_0 => in_c4_exit47_0_0,
        in_c4_exit47_0_1 => in_c4_exit47_0_1,
        in_c5_exit48_0_0 => in_c5_exit48_0_0,
        in_c5_exit48_0_1 => in_c5_exit48_0_1,
        in_c0_exe109775_0 => in_c0_exe109775_0,
        in_c0_exe119787_0 => in_c0_exe119787_0,
        in_c0_exe129799_0 => in_c0_exe129799_0,
        in_c0_exe1398011_0 => in_c0_exe1398011_0,
        in_c0_exe1498113_0 => in_c0_exe1498113_0,
        in_c0_exe1598215_0 => in_c0_exe1598215_0,
        in_c0_exe1698317_0 => in_c0_exe1698317_0,
        in_c0_exe1798419_0 => in_c0_exe1798419_0,
        in_c0_exe1898521_0 => in_c0_exe1898521_0,
        in_c0_exe1998623_0 => in_c0_exe1998623_0,
        in_c0_exe2098725_0 => in_c0_exe2098725_0,
        in_c0_exe2198827_0 => in_c0_exe2198827_0,
        in_c0_exe2298929_0 => in_c0_exe2298929_0,
        in_c0_exe2399031_0 => in_c0_exe2399031_0,
        in_c0_exe2499133_0 => in_c0_exe2499133_0,
        in_c0_exe2599235_0 => in_c0_exe2599235_0,
        in_c0_exe2699337_0 => in_c0_exe2699337_0,
        in_c0_exe2799439_0 => in_c0_exe2799439_0,
        in_memdep_phi121_0 => in_memdep_phi121_0,
        in_stall_in => bb_memRead_B5_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit100843_0 => memRead_B5_merge_aunroll_x_out_c0_exit100843_0,
        out_c0_exit100843_1 => memRead_B5_merge_aunroll_x_out_c0_exit100843_1,
        out_c1_exit102044_0 => memRead_B5_merge_aunroll_x_out_c1_exit102044_0,
        out_c1_exit102044_1 => memRead_B5_merge_aunroll_x_out_c1_exit102044_1,
        out_c2_exit103245_0 => memRead_B5_merge_aunroll_x_out_c2_exit103245_0,
        out_c2_exit103245_1 => memRead_B5_merge_aunroll_x_out_c2_exit103245_1,
        out_c3_exit46_0 => memRead_B5_merge_aunroll_x_out_c3_exit46_0,
        out_c3_exit46_1 => memRead_B5_merge_aunroll_x_out_c3_exit46_1,
        out_c4_exit47_0 => memRead_B5_merge_aunroll_x_out_c4_exit47_0,
        out_c4_exit47_1 => memRead_B5_merge_aunroll_x_out_c4_exit47_1,
        out_c5_exit48_0 => memRead_B5_merge_aunroll_x_out_c5_exit48_0,
        out_c5_exit48_1 => memRead_B5_merge_aunroll_x_out_c5_exit48_1,
        out_c0_exe109775 => memRead_B5_merge_aunroll_x_out_c0_exe109775,
        out_c0_exe119787 => memRead_B5_merge_aunroll_x_out_c0_exe119787,
        out_c0_exe129799 => memRead_B5_merge_aunroll_x_out_c0_exe129799,
        out_c0_exe1398011 => memRead_B5_merge_aunroll_x_out_c0_exe1398011,
        out_c0_exe1498113 => memRead_B5_merge_aunroll_x_out_c0_exe1498113,
        out_c0_exe1598215 => memRead_B5_merge_aunroll_x_out_c0_exe1598215,
        out_c0_exe1698317 => memRead_B5_merge_aunroll_x_out_c0_exe1698317,
        out_c0_exe1798419 => memRead_B5_merge_aunroll_x_out_c0_exe1798419,
        out_c0_exe1898521 => memRead_B5_merge_aunroll_x_out_c0_exe1898521,
        out_c0_exe1998623 => memRead_B5_merge_aunroll_x_out_c0_exe1998623,
        out_c0_exe2098725 => memRead_B5_merge_aunroll_x_out_c0_exe2098725,
        out_c0_exe2198827 => memRead_B5_merge_aunroll_x_out_c0_exe2198827,
        out_c0_exe2298929 => memRead_B5_merge_aunroll_x_out_c0_exe2298929,
        out_c0_exe2399031 => memRead_B5_merge_aunroll_x_out_c0_exe2399031,
        out_c0_exe2499133 => memRead_B5_merge_aunroll_x_out_c0_exe2499133,
        out_c0_exe2599235 => memRead_B5_merge_aunroll_x_out_c0_exe2599235,
        out_c0_exe2699337 => memRead_B5_merge_aunroll_x_out_c0_exe2699337,
        out_c0_exe2799439 => memRead_B5_merge_aunroll_x_out_c0_exe2799439,
        out_memdep_phi121 => memRead_B5_merge_aunroll_x_out_memdep_phi121,
        out_stall_out_0 => memRead_B5_merge_aunroll_x_out_stall_out_0,
        out_valid_out => memRead_B5_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_memRead_B5_stall_region(BLACKBOX,75)
    thebb_memRead_B5_stall_region : bb_memRead_B5_stall_region
    PORT MAP (
        in_c0_exit100843_0 => memRead_B5_merge_aunroll_x_out_c0_exit100843_0,
        in_c0_exit100843_1 => memRead_B5_merge_aunroll_x_out_c0_exit100843_1,
        in_c1_exit102044_0 => memRead_B5_merge_aunroll_x_out_c1_exit102044_0,
        in_c1_exit102044_1 => memRead_B5_merge_aunroll_x_out_c1_exit102044_1,
        in_c2_exit103245_0 => memRead_B5_merge_aunroll_x_out_c2_exit103245_0,
        in_c2_exit103245_1 => memRead_B5_merge_aunroll_x_out_c2_exit103245_1,
        in_c3_exit46_0 => memRead_B5_merge_aunroll_x_out_c3_exit46_0,
        in_c3_exit46_1 => memRead_B5_merge_aunroll_x_out_c3_exit46_1,
        in_c4_exit47_0 => memRead_B5_merge_aunroll_x_out_c4_exit47_0,
        in_c4_exit47_1 => memRead_B5_merge_aunroll_x_out_c4_exit47_1,
        in_c5_exit48_0 => memRead_B5_merge_aunroll_x_out_c5_exit48_0,
        in_c5_exit48_1 => memRead_B5_merge_aunroll_x_out_c5_exit48_1,
        in_c0_exe109775 => memRead_B5_merge_aunroll_x_out_c0_exe109775,
        in_c0_exe119787 => memRead_B5_merge_aunroll_x_out_c0_exe119787,
        in_c0_exe129799 => memRead_B5_merge_aunroll_x_out_c0_exe129799,
        in_c0_exe1398011 => memRead_B5_merge_aunroll_x_out_c0_exe1398011,
        in_c0_exe1498113 => memRead_B5_merge_aunroll_x_out_c0_exe1498113,
        in_c0_exe1598215 => memRead_B5_merge_aunroll_x_out_c0_exe1598215,
        in_c0_exe1698317 => memRead_B5_merge_aunroll_x_out_c0_exe1698317,
        in_c0_exe1798419 => memRead_B5_merge_aunroll_x_out_c0_exe1798419,
        in_c0_exe1898521 => memRead_B5_merge_aunroll_x_out_c0_exe1898521,
        in_c0_exe1998623 => memRead_B5_merge_aunroll_x_out_c0_exe1998623,
        in_c0_exe2098725 => memRead_B5_merge_aunroll_x_out_c0_exe2098725,
        in_c0_exe2198827 => memRead_B5_merge_aunroll_x_out_c0_exe2198827,
        in_c0_exe2298929 => memRead_B5_merge_aunroll_x_out_c0_exe2298929,
        in_c0_exe2399031 => memRead_B5_merge_aunroll_x_out_c0_exe2399031,
        in_c0_exe2499133 => memRead_B5_merge_aunroll_x_out_c0_exe2499133,
        in_c0_exe2599235 => memRead_B5_merge_aunroll_x_out_c0_exe2599235,
        in_c0_exe2699337 => memRead_B5_merge_aunroll_x_out_c0_exe2699337,
        in_c0_exe2799439 => memRead_B5_merge_aunroll_x_out_c0_exe2799439,
        in_control => in_control,
        in_feedback_stall_in_10 => in_feedback_stall_in_10,
        in_feedback_stall_in_11 => in_feedback_stall_in_11,
        in_feedback_stall_in_12 => in_feedback_stall_in_12,
        in_feedback_stall_in_29 => in_feedback_stall_in_29,
        in_feedback_stall_in_7 => in_feedback_stall_in_7,
        in_feedback_stall_in_8 => in_feedback_stall_in_8,
        in_feedback_stall_in_9 => in_feedback_stall_in_9,
        in_flush => in_flush,
        in_frac_b => in_frac_b,
        in_frac_din => in_frac_din,
        in_frac_dout => in_frac_dout,
        in_frac_w => in_frac_w,
        in_iowr_bl_bypass_ch_i_fifoready => in_iowr_bl_bypass_ch_i_fifoready,
        in_iowr_bl_pool_ch_i_fifoready => in_iowr_bl_pool_ch_i_fifoready,
        in_memcoalesce_null_load_0152_avm_readdata => in_memcoalesce_null_load_0152_avm_readdata,
        in_memcoalesce_null_load_0152_avm_readdatavalid => in_memcoalesce_null_load_0152_avm_readdatavalid,
        in_memcoalesce_null_load_0152_avm_waitrequest => in_memcoalesce_null_load_0152_avm_waitrequest,
        in_memcoalesce_null_load_0152_avm_writeack => in_memcoalesce_null_load_0152_avm_writeack,
        in_memdep_16_avm_readdata => in_memdep_16_avm_readdata,
        in_memdep_16_avm_readdatavalid => in_memdep_16_avm_readdatavalid,
        in_memdep_16_avm_waitrequest => in_memdep_16_avm_waitrequest,
        in_memdep_16_avm_writeack => in_memdep_16_avm_writeack,
        in_memdep_phi121 => memRead_B5_merge_aunroll_x_out_memdep_phi121,
        in_stall_in => memRead_B5_branch_out_stall_out,
        in_valid_in => memRead_B5_merge_aunroll_x_out_valid_out,
        out_c0_exe2098725 => bb_memRead_B5_stall_region_out_c0_exe2098725,
        out_feedback_out_10 => bb_memRead_B5_stall_region_out_feedback_out_10,
        out_feedback_out_11 => bb_memRead_B5_stall_region_out_feedback_out_11,
        out_feedback_out_12 => bb_memRead_B5_stall_region_out_feedback_out_12,
        out_feedback_out_29 => bb_memRead_B5_stall_region_out_feedback_out_29,
        out_feedback_out_7 => bb_memRead_B5_stall_region_out_feedback_out_7,
        out_feedback_out_8 => bb_memRead_B5_stall_region_out_feedback_out_8,
        out_feedback_out_9 => bb_memRead_B5_stall_region_out_feedback_out_9,
        out_feedback_valid_out_10 => bb_memRead_B5_stall_region_out_feedback_valid_out_10,
        out_feedback_valid_out_11 => bb_memRead_B5_stall_region_out_feedback_valid_out_11,
        out_feedback_valid_out_12 => bb_memRead_B5_stall_region_out_feedback_valid_out_12,
        out_feedback_valid_out_29 => bb_memRead_B5_stall_region_out_feedback_valid_out_29,
        out_feedback_valid_out_7 => bb_memRead_B5_stall_region_out_feedback_valid_out_7,
        out_feedback_valid_out_8 => bb_memRead_B5_stall_region_out_feedback_valid_out_8,
        out_feedback_valid_out_9 => bb_memRead_B5_stall_region_out_feedback_valid_out_9,
        out_iowr_bl_bypass_ch_o_fifodata => bb_memRead_B5_stall_region_out_iowr_bl_bypass_ch_o_fifodata,
        out_iowr_bl_bypass_ch_o_fifovalid => bb_memRead_B5_stall_region_out_iowr_bl_bypass_ch_o_fifovalid,
        out_iowr_bl_pool_ch_o_fifodata => bb_memRead_B5_stall_region_out_iowr_bl_pool_ch_o_fifodata,
        out_iowr_bl_pool_ch_o_fifovalid => bb_memRead_B5_stall_region_out_iowr_bl_pool_ch_o_fifovalid,
        out_memcoalesce_null_load_0152_avm_address => bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_address,
        out_memcoalesce_null_load_0152_avm_burstcount => bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_burstcount,
        out_memcoalesce_null_load_0152_avm_byteenable => bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_byteenable,
        out_memcoalesce_null_load_0152_avm_enable => bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_enable,
        out_memcoalesce_null_load_0152_avm_read => bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_read,
        out_memcoalesce_null_load_0152_avm_write => bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_write,
        out_memcoalesce_null_load_0152_avm_writedata => bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_writedata,
        out_memdep_16_avm_address => bb_memRead_B5_stall_region_out_memdep_16_avm_address,
        out_memdep_16_avm_burstcount => bb_memRead_B5_stall_region_out_memdep_16_avm_burstcount,
        out_memdep_16_avm_byteenable => bb_memRead_B5_stall_region_out_memdep_16_avm_byteenable,
        out_memdep_16_avm_enable => bb_memRead_B5_stall_region_out_memdep_16_avm_enable,
        out_memdep_16_avm_read => bb_memRead_B5_stall_region_out_memdep_16_avm_read,
        out_memdep_16_avm_write => bb_memRead_B5_stall_region_out_memdep_16_avm_write,
        out_memdep_16_avm_writedata => bb_memRead_B5_stall_region_out_memdep_16_avm_writedata,
        out_stall_out => bb_memRead_B5_stall_region_out_stall_out,
        out_valid_out => bb_memRead_B5_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_out_10_sync(GPOUT,76)
    out_feedback_out_10 <= bb_memRead_B5_stall_region_out_feedback_out_10;

    -- feedback_out_11_sync(GPOUT,77)
    out_feedback_out_11 <= bb_memRead_B5_stall_region_out_feedback_out_11;

    -- feedback_out_12_sync(GPOUT,78)
    out_feedback_out_12 <= bb_memRead_B5_stall_region_out_feedback_out_12;

    -- feedback_out_29_sync(GPOUT,79)
    out_feedback_out_29 <= bb_memRead_B5_stall_region_out_feedback_out_29;

    -- feedback_out_7_sync(GPOUT,80)
    out_feedback_out_7 <= bb_memRead_B5_stall_region_out_feedback_out_7;

    -- feedback_out_8_sync(GPOUT,81)
    out_feedback_out_8 <= bb_memRead_B5_stall_region_out_feedback_out_8;

    -- feedback_out_9_sync(GPOUT,82)
    out_feedback_out_9 <= bb_memRead_B5_stall_region_out_feedback_out_9;

    -- feedback_valid_out_10_sync(GPOUT,90)
    out_feedback_valid_out_10 <= bb_memRead_B5_stall_region_out_feedback_valid_out_10;

    -- feedback_valid_out_11_sync(GPOUT,91)
    out_feedback_valid_out_11 <= bb_memRead_B5_stall_region_out_feedback_valid_out_11;

    -- feedback_valid_out_12_sync(GPOUT,92)
    out_feedback_valid_out_12 <= bb_memRead_B5_stall_region_out_feedback_valid_out_12;

    -- feedback_valid_out_29_sync(GPOUT,93)
    out_feedback_valid_out_29 <= bb_memRead_B5_stall_region_out_feedback_valid_out_29;

    -- feedback_valid_out_7_sync(GPOUT,94)
    out_feedback_valid_out_7 <= bb_memRead_B5_stall_region_out_feedback_valid_out_7;

    -- feedback_valid_out_8_sync(GPOUT,95)
    out_feedback_valid_out_8 <= bb_memRead_B5_stall_region_out_feedback_valid_out_8;

    -- feedback_valid_out_9_sync(GPOUT,96)
    out_feedback_valid_out_9 <= bb_memRead_B5_stall_region_out_feedback_valid_out_9;

    -- out_iowr_bl_bypass_ch_o_fifodata(GPOUT,98)
    out_iowr_bl_bypass_ch_o_fifodata <= bb_memRead_B5_stall_region_out_iowr_bl_bypass_ch_o_fifodata;

    -- out_iowr_bl_bypass_ch_o_fifovalid(GPOUT,99)
    out_iowr_bl_bypass_ch_o_fifovalid <= bb_memRead_B5_stall_region_out_iowr_bl_bypass_ch_o_fifovalid;

    -- out_iowr_bl_pool_ch_o_fifodata(GPOUT,100)
    out_iowr_bl_pool_ch_o_fifodata <= bb_memRead_B5_stall_region_out_iowr_bl_pool_ch_o_fifodata;

    -- out_iowr_bl_pool_ch_o_fifovalid(GPOUT,101)
    out_iowr_bl_pool_ch_o_fifovalid <= bb_memRead_B5_stall_region_out_iowr_bl_pool_ch_o_fifovalid;

    -- out_memcoalesce_null_load_0152_avm_address(GPOUT,102)
    out_memcoalesce_null_load_0152_avm_address <= bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_address;

    -- out_memcoalesce_null_load_0152_avm_burstcount(GPOUT,103)
    out_memcoalesce_null_load_0152_avm_burstcount <= bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_burstcount;

    -- out_memcoalesce_null_load_0152_avm_byteenable(GPOUT,104)
    out_memcoalesce_null_load_0152_avm_byteenable <= bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_byteenable;

    -- out_memcoalesce_null_load_0152_avm_enable(GPOUT,105)
    out_memcoalesce_null_load_0152_avm_enable <= bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_enable;

    -- out_memcoalesce_null_load_0152_avm_read(GPOUT,106)
    out_memcoalesce_null_load_0152_avm_read <= bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_read;

    -- out_memcoalesce_null_load_0152_avm_write(GPOUT,107)
    out_memcoalesce_null_load_0152_avm_write <= bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_write;

    -- out_memcoalesce_null_load_0152_avm_writedata(GPOUT,108)
    out_memcoalesce_null_load_0152_avm_writedata <= bb_memRead_B5_stall_region_out_memcoalesce_null_load_0152_avm_writedata;

    -- out_memdep_16_avm_address(GPOUT,109)
    out_memdep_16_avm_address <= bb_memRead_B5_stall_region_out_memdep_16_avm_address;

    -- out_memdep_16_avm_burstcount(GPOUT,110)
    out_memdep_16_avm_burstcount <= bb_memRead_B5_stall_region_out_memdep_16_avm_burstcount;

    -- out_memdep_16_avm_byteenable(GPOUT,111)
    out_memdep_16_avm_byteenable <= bb_memRead_B5_stall_region_out_memdep_16_avm_byteenable;

    -- out_memdep_16_avm_enable(GPOUT,112)
    out_memdep_16_avm_enable <= bb_memRead_B5_stall_region_out_memdep_16_avm_enable;

    -- out_memdep_16_avm_read(GPOUT,113)
    out_memdep_16_avm_read <= bb_memRead_B5_stall_region_out_memdep_16_avm_read;

    -- out_memdep_16_avm_write(GPOUT,114)
    out_memdep_16_avm_write <= bb_memRead_B5_stall_region_out_memdep_16_avm_write;

    -- out_memdep_16_avm_writedata(GPOUT,115)
    out_memdep_16_avm_writedata <= bb_memRead_B5_stall_region_out_memdep_16_avm_writedata;

    -- out_stall_out_0(GPOUT,116)
    out_stall_out_0 <= memRead_B5_merge_aunroll_x_out_stall_out_0;

    -- out_valid_out_0(GPOUT,117)
    out_valid_out_0 <= memRead_B5_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,118)
    out_valid_out_1 <= memRead_B5_branch_out_valid_out_1;

END normal;
