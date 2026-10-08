if {[info exists ::env(TSMC28_HOME)] && $::env(TSMC28_HOME) ne ""} {
    set PDK_HOME [file normalize $::env(TSMC28_HOME)]
} else {
    set PDK_HOME /pdk/tsmc/PDK28/PDK_TSMC28_bv/tcbn28hpcplusbwp30p140_190a/TSMCHOME
}
set FE_PATH [file join $PDK_HOME digital Front_End]
set BE_PATH [file join $PDK_HOME digital Back_End]
set LIB_DIR [file join $FE_PATH timing_power_noise NLDM tcbn28hpcplusbwp30p140_180a]
set QRC_TYP [file join $BE_PATH qrc RC_QRC_crn28hpc+_1p09m+ut-alrdl_5x1y1z1u_typical qrcTechFile]

create_library_set -name libset_0p90v_25c \
    -timing [file join $LIB_DIR tcbn28hpcplusbwp30p140tt0p9v25c.lib]
create_opcond -name opcond_0p90v_25c -voltage 0.90 -temperature 25.0
create_timing_condition -name timing_cond_0p90v_25c \
    -opcond opcond_0p90v_25c -library_sets {libset_0p90v_25c}
create_rc_corner -name rc_corner_25c_captyp \
    -temperature 25.0 -qrc_tech $QRC_TYP
create_delay_corner -name delay_corner_0p90v_25c_captyp \
    -timing_condition timing_cond_0p90v_25c \
    -rc_corner rc_corner_25c_captyp
create_constraint_mode -name constraints_default \
    -sdc_files [file join $CONFIG_ROOT scripts constraints.sdc]
create_analysis_view -name analysis_view_0p90v_25c_captyp_nominal \
    -constraint_mode constraints_default \
    -delay_corner delay_corner_0p90v_25c_captyp
set_analysis_view -setup {analysis_view_0p90v_25c_captyp_nominal} \
                  -hold  {analysis_view_0p90v_25c_captyp_nominal}

set TECH_LEF [file join $BE_PATH lef tsmcn28_9lm5X1Y1Z1UUTRDL.tlef]
set CELL_LEF [file join $BE_PATH lef tcbn28hpcplusbwp30p140_110a lef tcbn28hpcplusbwp30p140.lef]
read_physical -lefs "$TECH_LEF $CELL_LEF"
set sdc_version 1.5
set_units -time ns -capacitance fF
