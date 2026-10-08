# PipeCNN Winograd int16 / 4 multipliers per output channel

This isolated experiment is derived from `project/device/conv_pipe.cl`. It
forms four signed 16x16 products per output channel per reduction iteration.
Each product is kept at 32 bits; the four-product sum, running MAC accumulator,
and MAC output are 32-bit signed values. Overflow wraps modulo 2^32.

The active types are `DPTYPE=short`, `CONVTYPE=short`, and `MACTYPE=int`, with
`LANE_NUM=32` and `EXP_MULTIPLIERS_PER_CHANNEL=4`. The reduction covers
`VEC_SIZE=16` terms in groups of four. Across all lanes, this expresses 128
products per reduction iteration if AOCL maps all lanes in parallel. AOCL
synthesis must confirm the physical resource count and schedule.

The Winograd transforms, memory-read flow, output path, and other architecture
parameters remain as in the two-multiplier experiment. This is a kernel-source
experiment, not an end-to-end runnable configuration: the host and model
preparation still use the original `char` format, and the existing AOCL custom
RTL library implements a 4-product 16x8 operator. Host buffers, serialized
model weights, output checks, and any required AOCL RTL library interface
changes must be handled before compiling or running this variant.

AOCL 18.1.0 Standard was located on the Paxos at
`/soft64/altera/ferramentas/quartus/18.1/hld/bin/aoc`; loading
`quartus/18.1` alone does not put it on `PATH`. This source as stored here has
not been compiled. A one-lane scratch copy passed `aoc -c` after the recorded
initializer and bank-width adjustments; its separate `-rtl` stage timed out
without `.aocr`. See
[`../int16_4mul_lane1_s5_ref/README.md`](../int16_4mul_lane1_s5_ref/README.md).
No full RTL generation, emulation, or FPGA run is claimed for this variant.
