set sdc_version 1.5
set_units -time ns -capacitance fF

# Virtual 500 MHz environment, inherited as the initial target from FastConv.
create_clock -name vclk -period 2.0
set_input_delay 1.0 -clock vclk [all_inputs]
set_output_delay 1.0 -clock vclk [all_outputs]
set_input_transition 0.05 [all_inputs]
set_load 5.0 [all_outputs]
