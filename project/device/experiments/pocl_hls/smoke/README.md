# PoCL-HLS RTL smoke

This fixture isolates the compiler path from PipeCNN-specific constructs.
It uses standard OpenCL C, four output elements, a global ID, and no Intel
channels or local-memory attributes.

The verified smoke emitted `parallel_hls.mlir` and `parallel_hls.cpp` through
PoCL-HLS/ScaleHLS, then Vitis HLS synthesized the C++ and wrote Verilog after
`csynth_design`. The Tcl uses the dedicated `vitis_hls` executable, the
`vivado` HLS flow, and `xc7z020clg400-1` because the Vitis platform database is
not installed on the Paxos module. This part is only an HLS synthesis
parameter; no `.xo`, `.xclbin`, hardware platform, or physical FPGA execution
is used.

The C++ and RTL expose a four-element memory interface and calculate
`out[gid] = gid * 3 + 90`. The PoCL harness finalizes a command buffer to
trigger compilation and does not enqueue it, so functional output values have
not been checked. The integrated HLS run produced four Verilog files, but the
PoCL process later aborted in emulator code generation; this fixture is not a
runtime correctness test.

The generated Verilog and its original integrated-run log are archived in
[`generated-rtl/`](generated-rtl/README.md), with SHA-256 checksums. The files
were copied from the Paxos HLS cache after their hashes were checked.
