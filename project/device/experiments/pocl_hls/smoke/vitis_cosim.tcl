# Run from a fresh, empty working directory. The script refuses to reset or
# overwrite an existing Vitis HLS project so previous results stay intact.
set script_dir [file dirname [file normalize [info script]]]
set project_dir [file normalize [file join [pwd] vitis_cosim_project]]

if {[file exists $project_dir]} {
  error "Refusing to overwrite existing project: $project_dir"
}

open_project $project_dir
set_top pocl_mlir_command_buffer
add_files [file join $script_dir generated-rtl parallel_hls.cpp]
add_files -tb [file join $script_dir pocl_hls_smoke_tb.cpp]

open_solution -flow_target vivado solution1
set_part {xc7z020clg400-1}
create_clock -period 4 -name default

csim_design
csynth_design
cosim_design -rtl verilog

exit
