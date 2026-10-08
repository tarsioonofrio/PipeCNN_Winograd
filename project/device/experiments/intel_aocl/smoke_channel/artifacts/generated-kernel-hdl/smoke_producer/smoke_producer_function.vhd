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

-- VHDL created from smoke_producer_function
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

entity smoke_producer_function is
    port (
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_src : in std_logic_vector(63 downto 0);  -- ufix64
        in_iowr_bl_smoke_channel_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_producer0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_smoke_producer0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_producer0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_smoke_producer0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_smoke_channel_o_fifodata : out std_logic_vector(31 downto 0);  -- ufix32
        out_iowr_bl_smoke_channel_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_producer0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_smoke_producer0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_smoke_producer0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_smoke_producer0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_producer0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_producer0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_smoke_producer0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end smoke_producer_function;

architecture normal of smoke_producer_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_smoke_producer_B0 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_iowr_bl_smoke_channel_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_smoke_producer0_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_src : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_smoke_producer0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_smoke_channel_o_fifodata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_iowr_bl_smoke_channel_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_smoke_producer0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_smoke_producer_B0_out_iowr_bl_smoke_channel_o_fifodata : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_smoke_producer_B0_out_iowr_bl_smoke_channel_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_smoke_producer_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_smoke_producer_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bb_smoke_producer_B0(BLACKBOX,2)
    thebb_smoke_producer_B0 : bb_smoke_producer_B0
    PORT MAP (
        in_flush => in_start,
        in_global_id_0_0 => in_arg_global_id_0,
        in_iowr_bl_smoke_channel_i_fifoready => in_iowr_bl_smoke_channel_i_fifoready,
        in_lsu_unnamed_smoke_producer0_sts_stream_size => in_arg_local_size_0,
        in_src => in_arg_src,
        in_stall_in_0 => in_stall_in,
        in_stream_reset => in_valid_in,
        in_unnamed_smoke_producer0_avm_readdata => in_unnamed_smoke_producer0_avm_readdata,
        in_unnamed_smoke_producer0_avm_readdatavalid => in_unnamed_smoke_producer0_avm_readdatavalid,
        in_unnamed_smoke_producer0_avm_waitrequest => in_unnamed_smoke_producer0_avm_waitrequest,
        in_unnamed_smoke_producer0_avm_writeack => in_unnamed_smoke_producer0_avm_writeack,
        in_valid_in_0 => in_valid_in,
        out_iowr_bl_smoke_channel_o_fifodata => bb_smoke_producer_B0_out_iowr_bl_smoke_channel_o_fifodata,
        out_iowr_bl_smoke_channel_o_fifovalid => bb_smoke_producer_B0_out_iowr_bl_smoke_channel_o_fifovalid,
        out_stall_out_0 => bb_smoke_producer_B0_out_stall_out_0,
        out_unnamed_smoke_producer0_avm_address => bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_address,
        out_unnamed_smoke_producer0_avm_burstcount => bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_burstcount,
        out_unnamed_smoke_producer0_avm_byteenable => bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_byteenable,
        out_unnamed_smoke_producer0_avm_enable => bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_enable,
        out_unnamed_smoke_producer0_avm_read => bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_read,
        out_unnamed_smoke_producer0_avm_write => bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_write,
        out_unnamed_smoke_producer0_avm_writedata => bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_writedata,
        out_valid_out_0 => bb_smoke_producer_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_iowr_bl_smoke_channel_o_fifodata(GPOUT,19)
    out_iowr_bl_smoke_channel_o_fifodata <= bb_smoke_producer_B0_out_iowr_bl_smoke_channel_o_fifodata;

    -- out_iowr_bl_smoke_channel_o_fifovalid(GPOUT,20)
    out_iowr_bl_smoke_channel_o_fifovalid <= bb_smoke_producer_B0_out_iowr_bl_smoke_channel_o_fifovalid;

    -- out_stall_out(GPOUT,21)
    out_stall_out <= bb_smoke_producer_B0_out_stall_out_0;

    -- out_unnamed_smoke_producer0_avm_address(GPOUT,22)
    out_unnamed_smoke_producer0_avm_address <= bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_address;

    -- out_unnamed_smoke_producer0_avm_burstcount(GPOUT,23)
    out_unnamed_smoke_producer0_avm_burstcount <= bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_burstcount;

    -- out_unnamed_smoke_producer0_avm_byteenable(GPOUT,24)
    out_unnamed_smoke_producer0_avm_byteenable <= bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_byteenable;

    -- out_unnamed_smoke_producer0_avm_enable(GPOUT,25)
    out_unnamed_smoke_producer0_avm_enable <= bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_enable;

    -- out_unnamed_smoke_producer0_avm_read(GPOUT,26)
    out_unnamed_smoke_producer0_avm_read <= bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_read;

    -- out_unnamed_smoke_producer0_avm_write(GPOUT,27)
    out_unnamed_smoke_producer0_avm_write <= bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_write;

    -- out_unnamed_smoke_producer0_avm_writedata(GPOUT,28)
    out_unnamed_smoke_producer0_avm_writedata <= bb_smoke_producer_B0_out_unnamed_smoke_producer0_avm_writedata;

    -- out_valid_out(GPOUT,29)
    out_valid_out <= bb_smoke_producer_B0_out_valid_out_0;

END normal;
