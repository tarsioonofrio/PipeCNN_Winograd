# Initial 2 ns comparison target inherited from the FastConv ASIC flow.
# This design is sequential, so constrain its actual clock input.
create_clock -name clk -period 2.0 [get_ports clock]
set_input_delay 1.0 -clock clk [remove_from_collection [all_inputs] [get_ports clock]]
set_output_delay 1.0 -clock clk [all_outputs]
set_input_transition 0.05 [remove_from_collection [all_inputs] [get_ports clock]]
set_load 5.0 [all_outputs]
