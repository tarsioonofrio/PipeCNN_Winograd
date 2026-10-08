set probe_packed_limit 24576
database -open dut_vcd -vcd -into dut.vcd
probe -create -database dut_vcd -all -depth to_cells -packed 24576 tb_memread_conv_slice.dut
run
exit
