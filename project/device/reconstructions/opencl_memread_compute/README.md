# Reconstructed `memRead` compute slice

`pipecnn_memread_compute.sv` translates the active `VEC_SIZE=16`,
`W_VEC_SIZE=6`, `LANE_NUM=32` arithmetic around `mac_data`/`mac_weight` in
`project/device/conv_pipe.cl` into an isolated source-level RTL experiment.
It accepts one 16-channel, six-position input window and one set of
pretransformed signed 8-bit weights for 32 output lanes.

The slice preserves the source equations and widths:

- input samples are signed 8-bit; `BT*d` results wrap when assigned to signed
  16-bit `CONVTYPE`;
- each lane and Winograd position reduces 16 signed 16×8 products;
- lanes 0–30 use four instances of the original four-product, two-cycle MAC
  contract per position;
- lane 31 uses the direct 16-product expression selected by the source
  `FPGA_DSP_NUM` branch; two registers align this path with the MAC lanes;
- `A^T*m` produces four signed 32-bit results and zeroes positions 4 and 5;
- `fc_en` bypasses both input and output transforms as the OpenCL muxes do.
- the accumulator sums signed 32-bit terms modulo 2^32 and applies the source
  shift, `MASK9B`, bias alignment, rounding, signed-byte saturation and ReLU.

The resulting source-level structure has 744 four-product MAC instances
(2,976 product operators) plus 96 direct product operators: 3,072 products per
input iteration if synthesis preserves each expression. This is a count from
the parameterized OpenCL branch and this reconstruction; it is not a measured
post-synthesis physical count. The mapping of loop pipelining, resource sharing,
and the last lane still requires AOCL RTL or synthesis reports.

The testbench accepts 24 vectors on consecutive clock edges and checks all
lanes/positions, alternating FC/Winograd mode, full-range signed input/weight
values, the direct lane-31 branch, output ordering, and sideband alignment. It
asserts a two-cycle input-to-valid latency and an output initiation interval of
one cycle for this reconstructed arithmetic slice. These timing values do not
represent the complete OpenCL kernel or establish AOCL cycle equivalence. Run:

```bash
./project/device/reconstructions/opencl_memread_compute/run_test.sh
```

`pipecnn_conv_accumulator_postprocess.sv` implements the `conv_out` feedback
and output quantization; `pipecnn_memread_conv_slice.sv` aligns first/last,
bias, precision and ReLU sidebands with the two-cycle MAC path. The isolated
accumulator test runs all 22 fixed-point tuples from
`project/host/layer_config.h` over all 32 lanes and six positions. Run
`run_accumulator_test.sh` for that check and `run_slice_test.sh` for the
integrated compute/accumulation/postprocess slice.

The combined slice still does not implement `win_buffer`/`weight_buffer`
access, address and group counters, window-buffer fill/drain, pooling, channels,
`memWrite`, or the AOCL-generated control and memory interfaces. The source has
no active `#pragma ii`; `PIPE_DEPTH` is defined in `hw_param.cl` but is not
referenced by active kernel statements. So the unit checks are not evidence
for the complete kernel's latency or initiation interval. This RTL is an
explicitly labelled reconstruction, not recovered AOCL RTL or full-kernel
equivalence.
