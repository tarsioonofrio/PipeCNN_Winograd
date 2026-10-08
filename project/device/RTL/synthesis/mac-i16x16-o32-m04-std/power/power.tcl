set STAGE_ROOT [file normalize [file dirname [info script]]]
set CONFIG_ROOT [file normalize [file join $STAGE_ROOT ..]]
set RUN_ID $::env(RUN_ID)
set RUN_ROOT [file normalize [file join $CONFIG_ROOT runs $RUN_ID]]
set POWER_ROOT [file join $RUN_ROOT power]
set NETLIST [file join $RUN_ROOT logical gate_level mac4_int16_logic_mapped.v]
set VCD [file join $RUN_ROOT sim dut.vcd]
set PDK_HOME /pdk/tsmc/PDK28/PDK_TSMC28_bv/tcbn28hpcplusbwp30p140_190a/TSMCHOME
if {[info exists ::env(TSMC28_HOME)] && $::env(TSMC28_HOME) ne ""} {
    set PDK_HOME [file normalize $::env(TSMC28_HOME)]
}
set LIB_FILE [file join $PDK_HOME digital Front_End timing_power_noise NLDM \
    tcbn28hpcplusbwp30p140_180a tcbn28hpcplusbwp30p140tt0p9v25c.lib]

if {![file exists $NETLIST]} { error "Missing mapped netlist: $NETLIST" }
if {![file exists $VCD]} { error "Missing VCD stimulus: $VCD" }
if {![file exists $LIB_FILE]} { error "Missing TSMC28 library: $LIB_FILE" }

read_libs $LIB_FILE
read_netlist -top mac4_int16 $NETLIST
read_stimulus -file $VCD -dut_instance tb.dut \
    -design_root mac4_int16 -format vcd -start 0ns
report_power -unit mW > [file join $POWER_ROOT power_evaluation.txt]
exit
