# PipeCNN Winograd int16 / 2 multipliers per output channel

This is an isolated first experiment derived from `project/device/conv_pipe.cl`.
It keeps the PipeCNN Winograd memory-read, transform, and post-processing flow,
while replacing the fixed 4-lane 16x8 custom MAC calls with signed 16-bit
products scheduled two at a time for each output channel.

The original `project/device/conv_pipe.cl`, `hw_param.cl`, and `type_def.cl`
remain unchanged. The experiment sets `DPTYPE`, `CONVTYPE`, and `MACTYPE` to
`short`; `LANE_NUM` remains 32, so this means two multipliers per output lane
(64 multiplier instances if AOCL maps all lanes in parallel).

## Current boundary

This is a kernel-source experiment, not yet a runnable end-to-end configuration.
The project host and its model/data preparation still use the original `char`
format, and the existing AOCL custom RTL library implements the original
8x16 four-product operator. The host buffers, serialized model weights, and
output checks must be adapted consistently before compiling and running this
variant against the requested 3x32x32 / 3x3x3x3 case.

The MAC loop uses `#pragma unroll 1` on the output-position and reduction loops
to encourage reuse of two multipliers. AOCL synthesis must confirm the actual
resource count and schedule; source code alone does not prove that the compiler
implemented exactly two physical multipliers per channel.

Each product is explicitly narrowed to signed 16 bits, and the running sum is
also narrowed after every pair. This gives the experiment 16-bit wraparound
semantics; it is not an exact full-precision 16x16 convolution.

AOCL 18.1.0 Standard was located on the Paxos at
`/soft64/altera/ferramentas/quartus/18.1/hld/bin/aoc`; loading
`quartus/18.1` alone does not put it on `PATH`. The Intel-channel smoke passed
the AOCL `-c` stage on `s5_ref`, but this 2mul source has not been compiled.
No RTL generation, emulation, or FPGA run is claimed for this variant.
