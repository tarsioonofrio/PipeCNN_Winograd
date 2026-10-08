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

-- VHDL created from smoke_producer_function_wrapper
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

entity smoke_producer_function_wrapper is
    port (
        avm_unnamed_smoke_producer0_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_smoke_producer0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_smoke_producer0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_smoke_producer0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_smoke_channel_almostfull : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_smoke_channel_ready : in std_logic_vector(0 downto 0);  -- ufix1
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
        kernel_arguments : in std_logic_vector(63 downto 0);  -- ufix64
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
        avm_unnamed_smoke_producer0_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_smoke_producer0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_smoke_producer0_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_smoke_producer0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_smoke_producer0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_smoke_producer0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_smoke_producer0_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avst_iowr_bl_smoke_channel_data : out std_logic_vector(31 downto 0);  -- ufix32
        avst_iowr_bl_smoke_channel_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end smoke_producer_function_wrapper;

architecture normal of smoke_producer_function_wrapper is

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


    component smoke_producer_function is
        port (
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_src : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_iowr_bl_smoke_channel_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_smoke_channel_o_fifodata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_iowr_bl_smoke_channel_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_src_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (63 downto 0);
    signal smoke_producer_function_out_iowr_bl_smoke_channel_o_fifodata : STD_LOGIC_VECTOR (31 downto 0);
    signal smoke_producer_function_out_iowr_bl_smoke_channel_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal smoke_producer_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal smoke_producer_function_out_unnamed_smoke_producer0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal smoke_producer_function_out_unnamed_smoke_producer0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal smoke_producer_function_out_unnamed_smoke_producer0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal smoke_producer_function_out_unnamed_smoke_producer0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal smoke_producer_function_out_unnamed_smoke_producer0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal smoke_producer_function_out_unnamed_smoke_producer0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal smoke_producer_function_out_unnamed_smoke_producer0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal smoke_producer_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_src_select(BITSELECT,3)
    arg_src_select_b <= kernel_arguments(63 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,42)
    ip_dsdk_adapt_cast_b <= arg_src_select_b(63 downto 0);

    -- smoke_producer_function(BLACKBOX,57)
    thesmoke_producer_function : smoke_producer_function
    PORT MAP (
        in_arg_global_id_0 => global_id_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_src => ip_dsdk_adapt_cast_b,
        in_iowr_bl_smoke_channel_i_fifoready => avst_iowr_bl_smoke_channel_ready,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_smoke_producer0_avm_readdata => avm_unnamed_smoke_producer0_readdata,
        in_unnamed_smoke_producer0_avm_readdatavalid => avm_unnamed_smoke_producer0_readdatavalid,
        in_unnamed_smoke_producer0_avm_waitrequest => avm_unnamed_smoke_producer0_waitrequest,
        in_unnamed_smoke_producer0_avm_writeack => avm_unnamed_smoke_producer0_writeack,
        in_valid_in => kernel_valid_in,
        out_iowr_bl_smoke_channel_o_fifodata => smoke_producer_function_out_iowr_bl_smoke_channel_o_fifodata,
        out_iowr_bl_smoke_channel_o_fifovalid => smoke_producer_function_out_iowr_bl_smoke_channel_o_fifovalid,
        out_stall_out => smoke_producer_function_out_stall_out,
        out_unnamed_smoke_producer0_avm_address => smoke_producer_function_out_unnamed_smoke_producer0_avm_address,
        out_unnamed_smoke_producer0_avm_burstcount => smoke_producer_function_out_unnamed_smoke_producer0_avm_burstcount,
        out_unnamed_smoke_producer0_avm_byteenable => smoke_producer_function_out_unnamed_smoke_producer0_avm_byteenable,
        out_unnamed_smoke_producer0_avm_enable => smoke_producer_function_out_unnamed_smoke_producer0_avm_enable,
        out_unnamed_smoke_producer0_avm_read => smoke_producer_function_out_unnamed_smoke_producer0_avm_read,
        out_unnamed_smoke_producer0_avm_write => smoke_producer_function_out_unnamed_smoke_producer0_avm_write,
        out_unnamed_smoke_producer0_avm_writedata => smoke_producer_function_out_unnamed_smoke_producer0_avm_writedata,
        out_valid_out => smoke_producer_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_unnamed_smoke_producer0_address(GPOUT,43)
    avm_unnamed_smoke_producer0_address <= smoke_producer_function_out_unnamed_smoke_producer0_avm_address;

    -- avm_unnamed_smoke_producer0_burstcount(GPOUT,44)
    avm_unnamed_smoke_producer0_burstcount <= smoke_producer_function_out_unnamed_smoke_producer0_avm_burstcount;

    -- avm_unnamed_smoke_producer0_byteenable(GPOUT,45)
    avm_unnamed_smoke_producer0_byteenable <= smoke_producer_function_out_unnamed_smoke_producer0_avm_byteenable;

    -- avm_unnamed_smoke_producer0_enable(GPOUT,46)
    avm_unnamed_smoke_producer0_enable <= smoke_producer_function_out_unnamed_smoke_producer0_avm_enable;

    -- avm_unnamed_smoke_producer0_read(GPOUT,47)
    avm_unnamed_smoke_producer0_read <= smoke_producer_function_out_unnamed_smoke_producer0_avm_read;

    -- avm_unnamed_smoke_producer0_write(GPOUT,48)
    avm_unnamed_smoke_producer0_write <= smoke_producer_function_out_unnamed_smoke_producer0_avm_write;

    -- avm_unnamed_smoke_producer0_writedata(GPOUT,49)
    avm_unnamed_smoke_producer0_writedata <= smoke_producer_function_out_unnamed_smoke_producer0_avm_writedata;

    -- avst_iowr_bl_smoke_channel_data(GPOUT,50)
    avst_iowr_bl_smoke_channel_data <= smoke_producer_function_out_iowr_bl_smoke_channel_o_fifodata;

    -- avst_iowr_bl_smoke_channel_valid(GPOUT,51)
    avst_iowr_bl_smoke_channel_valid <= smoke_producer_function_out_iowr_bl_smoke_channel_o_fifovalid;

    -- acl_clock2x_dummy_consumer(EXTIFACE,2)
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

    -- clock2x_output(GPOUT,52)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,53)
    has_a_lsu_active <= GND_q;

    -- has_a_write_pending(GPOUT,54)
    has_a_write_pending <= GND_q;

    -- kernel_stall_out(GPOUT,55)
    kernel_stall_out <= smoke_producer_function_out_stall_out;

    -- kernel_valid_out(GPOUT,56)
    kernel_valid_out <= smoke_producer_function_out_valid_out;

END normal;
