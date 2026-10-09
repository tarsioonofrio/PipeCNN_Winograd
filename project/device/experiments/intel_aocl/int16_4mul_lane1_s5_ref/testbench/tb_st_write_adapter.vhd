library ieee;
use ieee.std_logic_1164.all;

entity tb_st_write_adapter is
end entity;

architecture test of tb_st_write_adapter is
    signal clock : std_logic := '0';
    signal resetn : std_logic := '0';

    signal predicate : std_logic_vector(0 downto 0) := "0";
    signal data0 : std_logic_vector(15 downto 0) := (others => '0');
    signal data1 : std_logic_vector(15 downto 0) := (others => '0');
    signal data2 : std_logic_vector(15 downto 0) := (others => '0');
    signal data3 : std_logic_vector(15 downto 0) := (others => '0');
    signal data4 : std_logic_vector(15 downto 0) := (others => '0');
    signal data5 : std_logic_vector(15 downto 0) := (others => '0');
    signal valid : std_logic_vector(0 downto 0) := "0";
    signal fifo_ready : std_logic_vector(0 downto 0) := "0";
    signal pipeline_stall : std_logic_vector(0 downto 0) := "0";

    signal fifo_valid : std_logic_vector(0 downto 0);
    signal ack : std_logic_vector(0 downto 0);
    signal output_valid : std_logic_vector(0 downto 0);
    signal fifo_data : std_logic_vector(95 downto 0);
    signal output_stall : std_logic_vector(0 downto 0);
begin
    clock <= not clock after 5 ns;

    dut : entity work.i_iowr_bl_bypass_ch_unnamed_memread8_memread2596
        port map (
            in_cmp12532_phi_decision2458_or2462 => predicate,
            in_i_data_0 => data0,
            in_i_data_1 => data1,
            in_i_data_2 => data2,
            in_i_data_3 => data3,
            in_i_data_4 => data4,
            in_i_data_5 => data5,
            in_i_valid => valid,
            out_iowr_bl_bypass_ch_o_fifovalid => fifo_valid,
            out_o_ack => ack,
            out_o_valid => output_valid,
            in_iowr_bl_bypass_ch_i_fifoready => fifo_ready,
            out_iowr_bl_bypass_ch_o_fifodata => fifo_data,
            in_i_stall => pipeline_stall,
            out_o_stall => output_stall,
            clock => clock,
            resetn => resetn
        );

    stimulus : process
    begin
        resetn <= '0';
        wait for 20 ns;
        resetn <= '1';

        wait until falling_edge(clock);
        data0 <= x"0001";
        data1 <= x"0002";
        data2 <= x"0003";
        data3 <= x"0004";
        data4 <= x"0005";
        data5 <= x"0006";
        predicate <= "0";
        valid <= "1";
        fifo_ready <= "0";
        pipeline_stall <= "0";
        wait for 1 ns;

        assert fifo_data = x"000600050004000300020001"
            report "st_write adapter packed the six 16-bit words incorrectly"
            severity error;
        assert fifo_valid = "1" and ack = "0"
            report "st_write did not hold the write while the channel was not ready"
            severity error;
        assert output_stall = "1"
            report "st_write did not backpressure the upstream pipeline"
            severity error;

        wait until rising_edge(clock);
        wait for 1 ns;
        assert fifo_valid = "1" and ack = "0" and output_stall = "1"
            report "st_write did not retain the pending write under backpressure"
            severity error;
        assert fifo_data = x"000600050004000300020001"
            report "st_write changed data while the channel was stalled"
            severity error;

        wait until falling_edge(clock);
        fifo_ready <= "1";
        wait for 1 ns;
        assert fifo_valid = "1" and ack = "1" and output_stall = "0"
            report "st_write did not acknowledge the write when the channel became ready"
            severity error;
        assert fifo_data = x"000600050004000300020001"
            report "st_write changed data on the accepted write"
            severity error;

        wait until rising_edge(clock);
        wait for 1 ns;
        valid <= "0";
        wait for 1 ns;
        assert fifo_valid = "0" and ack = "0"
            report "st_write emitted a duplicate write after acceptance"
            severity error;

        report "PASS: st_write adapter packed, stalled, and accepted one channel word"
            severity note;
        wait;
    end process;
end architecture;
