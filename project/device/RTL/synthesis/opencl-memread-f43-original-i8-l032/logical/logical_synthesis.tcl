set STAGE_ROOT [file normalize [file dirname [info script]]]
set CONFIG_ROOT [file normalize [file join $STAGE_ROOT ..]]
set RUN_ID $::env(RUN_ID)
set RUN_ROOT [file normalize [file join $CONFIG_ROOT runs $RUN_ID]]
set OUT_FILES [file join $RUN_ROOT logical]
set GIT_ROOT [exec git -C $CONFIG_ROOT rev-parse --show-toplevel]
set TOP_FILE [open [file join $CONFIG_ROOT top-module.txt] r]
set TOP_MODULE [string trim [read $TOP_FILE]]
close $TOP_FILE

source [file join $CONFIG_ROOT scripts mmmc.tcl]
set_db lp_default_probability 0.5
set_db syn_global_effort high
set_db auto_ungroup none
set_db hdl_error_on_latch true
set_db interconnect_mode ple

set HDL_FILES [list]
set fp_hdl [open [file join $CONFIG_ROOT list-file.txt] r]
while {[gets $fp_hdl line] >= 0} {
    set entry [string trim $line]
    if {$entry eq "" || [string match "#*" $entry]} { continue }
    if {[file pathtype $entry] eq "absolute"} {
        lappend HDL_FILES [file normalize $entry]
    } else {
        set candidate [file normalize [file join $GIT_ROOT $entry]]
        if {![file exists $candidate]} { error "Missing HDL source: $candidate" }
        lappend HDL_FILES $candidate
    }
}
close $fp_hdl
if {[llength $HDL_FILES] == 0} { error "list-file.txt contains no HDL sources" }

read_hdl -sv {*}$HDL_FILES
elaborate $TOP_MODULE
init_design
syn_generic
syn_map
syn_opt

file mkdir [file join $OUT_FILES reports]
file mkdir [file join $OUT_FILES gate_level]
report_gates > [file join $OUT_FILES reports ${TOP_MODULE}_gates.rpt]
report_area > [file join $OUT_FILES reports ${TOP_MODULE}_area.rpt]
report_timing > [file join $OUT_FILES reports ${TOP_MODULE}_timing.rpt]
report_power -unit mW > [file join $OUT_FILES reports ${TOP_MODULE}_power_no_activity.rpt]
write_hdl > [file join $OUT_FILES gate_level ${TOP_MODULE}_logic_mapped.v]
write_sdf > [file join $OUT_FILES gate_level ${TOP_MODULE}_nominal.sdf]
write_db [file join $OUT_FILES gate_level ${TOP_MODULE}_logic_mapped.db]
exit
