set STAGE_ROOT [file normalize [file dirname [info script]]]
set CONFIG_ROOT [file normalize [file join $STAGE_ROOT ..]]
set RUN_ID $::env(RUN_ID)
set RUN_ROOT [file normalize [file join $CONFIG_ROOT runs $RUN_ID]]
set POWER_ROOT [file join $RUN_ROOT power_genus]
set TOP_MODULE pipecnn_memread_conv_slice
set DB [file join $RUN_ROOT logical gate_level ${TOP_MODULE}_logic_mapped.db]
set VCD [file join $RUN_ROOT sim dut.vcd]

if {![file exists $DB]} { error "Missing Genus database: $DB" }
if {![file exists $VCD]} { error "Missing Xcelium VCD: $VCD" }

read_db $DB
read_vcd -vcd_scope tb_memread_conv_slice/dut $VCD
report_power -unit mW > [file join $POWER_ROOT power_evaluation.txt]
exit
