# OpenCL `memRead` compute-slice ASIC flow

This isolated flow synthesizes the source-level `VEC_SIZE=16`,
`W_VEC_SIZE=6`, `LANE_NUM=32` arithmetic reconstruction with the original
signed 16×8 four-product MAC contract, F(4,3) transforms, `conv_out`
accumulation, and fixed-point output stage. It is separate from the int16
experiment and is not the complete AOCL kernel.

The input is a preassembled 16-channel/six-position feature window and
pretransformed weights for 32 lanes. The flow excludes `win_buffer`,
`weight_buffer`, their banking, input/weight address generation, pooling,
channels, `memWrite`, and the AOCL-generated wrappers. Treat the result as a
compute-slice estimate, not full-kernel or system PPA.

The initial timing target is the 2 ns clock period used by the current
FastConv comparison flow, applied here to the actual `clock` port. Input/output
delays are each 1 ns and output load is 5 fF. The library/corner is TSMC 28 nm
TT, 0.90 V, 25 °C. These constraints need to remain consistent with the
comparison flow for a direct PPA comparison.

Run on Paxos after the source-level RTL and this flow are present in the
checkout:

```bash
cd project/device/RTL/synthesis/opencl-memread-f43-original-i8-l032
./run.sh
```

Each run uses a unique directory under `runs/$RUN_ID/` and refuses to overwrite
one. Genus writes mapped netlist, SDF, area/gate/timing reports and a
no-activity power estimate. Xcelium runs the mapped netlist with the integrated
testbench and writes SHM/VCD activity. Joules reads the mapped netlist, VCD and
TSMC TT library for a stimulus-based power report.

The VCD testbench contains three small arithmetic cases, not a representative
YOLO layer or the 3×32×32 workload. Any Joules power number is specific to this
stimulus and slice boundary. No area, timing, power or energy result is claimed
until the remote run completes and its artifacts are inspected. This flow does
not prove AOCL temporal equivalence or full-kernel PPAE.
