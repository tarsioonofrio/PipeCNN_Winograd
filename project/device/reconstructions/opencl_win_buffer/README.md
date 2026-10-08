# OpenCL `win_buffer` reconstruction

`pipecnn_win_buffer3.sv` models the active `[WIN_BUF_SIZE][3]` storage in
`conv_pipe.cl`: the flag rotates 0→1→2→0, each `intvec` word is written to the
current slot, and reads select the two other slots using the exact OpenCL
switch. The four vectors in the first word are followed by two vectors from
the second selected word. The source's border masks under
`gp_num_x==1 && weight_dim1==3` for `conv_row_rem==3` and `conv_row_rem==0`
are included. The condition itself is an input; this module does not derive
the group counters.

The source suppresses convolution work for the first `2*win_size` loop
iterations. The reconstruction uses that warm-up before asserting `tile_valid`.
Ready/valid holds results under backpressure; those handshakes add ASIC wrapper
behavior and do not claim AOCL cycle equivalence. The local `asb3_f43.sv` block
remains a separate experiment and is not used as this buffer implementation.

`run_test.sh` checks the three-slot selection over five groups, warm-up, both
source border masks, byte packing, and stalls with a reduced `win_size=2`. Its
synthetic input sequence asserts `gp_num_x==1` for the two border cases; it does
not validate the source group-counter schedule.

`pipecnn_win_buffer_compute.sv` transposes the six-vector tile into the
channel-major feature layout, selects weights from `pipecnn_weight_buffer.sv`,
and joins the source-level blocks. The logical weight memory models one load
and one read per iteration and forwards a same-address load/read. The lower
wrapper accepts the load gate and address; `pipecnn_memread_buffered_compute.sv`
derives them from the reconstructed group counters and connects `conv_z_cnt`
to first/last-term accumulation controls. The top wrapper still receives global
weight, feature, and bias words from its caller. Its integrated test checks
three output tiles in F(4,3) convolution mode with `conv_loop_cnt=2`, including
input/output transforms, two-term accumulation, fixed-point quantization, and
nonzero channel-0 weights on lanes 0 and 31. It does not establish AOCL memory
timing.

`pipecnn_memread_counters.sv` separately reconstructs the source iteration
counters for `gp_num_x`, `gp_num_y`, `out_idx_z`, `win_itm_xyz`, `win_itm_y/z`,
the three-slot flag, `read8_flag`, `conv_z_cnt`, feature coordinates and the
global weight address. `run_counter_test.sh` compares 20 iterations against
the source expressions in a reduced configuration. The higher-level
`pipecnn_memread_buffered_compute.sv` connects these counters to the feature
buffer, weight buffer, transpose, arithmetic, accumulation and postprocessing.
It stops at the caller-supplied `group_num_mul_win_size`. The active host-side
derivation of that total is reproduced separately by
`derive_memread_params.py`; the caller still supplies it to the RTL top.
Feature, weight and bias words remain caller-supplied for the reported logical
coordinates/address, so external RAM latency is not modeled.

`pipecnn_memread_pool_memwrite_system.sv` connects the source-level `memRead`
path through an eight-token result FIFO to either the active 2x2 pooling path
or the bypass path, then to `memWrite` address/data generation. The FIFO uses
an explicit ready/valid wrapper and reserves four slots for results already
in flight when upstream admission stops. `run_system_test.sh` exercises both
routes under output backpressure: six bypass writes and two pooled writes in
reduced cases. It also runs active host configuration row 22 through all
1,392 `memRead` iterations, observes 85 compute result tokens, and verifies
that each of the 578 output addresses is written exactly once before the FIFO
drains. The testbench derives deterministic nonzero feature words from the
captured `bottom_read_address`, honors `bottom_zero_fill`, and checks that the
address remains stable until the response is accepted. `run_system_test.sh`
reruns the full scenario with the default address-dependent 2–4 cycle delay and
fixed 0-, 1-, and 4-cycle delays selected with `+MEMORY_READ_LATENCY`. Each run
observes 1,428 source words; modeled wait is 4,282, 0, 1,428, and 5,712 cycles,
respectively. From reset release through output/FIFO drain, the testbench counts
6,965 cycles in default mode and 2,791, 4,184, and 8,360 cycles for fixed
latencies 0, 1, and 4. These are cycle counts of this reconstructed system under
its synthetic memory producer and output backpressure. The selected row is the
22nd active row (`--layer 22`); its `layer_config.h` comment says `Layer-23`,
while `output_config` and the final `precision_config` comments say
`Layer-22`. We identify it by active row number here and do not resolve the
model-layer naming from comments alone. Its weights and biases remain zero, so
that host-parameter case checks iteration
termination, source-side stalls, token routing and write addressing. A
separate reduced nonzero F(4,3) case uses an integer reference to check three
compute tokens and all six `memWrite` vectors after FIFO transfer and output
backpressure. The delayed producer models the reconstructed `word_valid/data`
boundary; the latency sweep probes ready/stall behavior but does not reproduce
an AOCL global-memory protocol or establish its latency. FIFO depth, reservation and handshake timing are reconstruction
choices because AOCL channel RTL is unavailable. These tests do not prove AOCL
cycle equivalence.

`derive_memread_params.py --layer 22` reproduces the active host derivation
from `main.cpp`, `layer_config.h`, and `hw_param.cl`, including channel padding,
group counts, `conv_loop_cnt`, and
`group_num_mul_win_size=(weight_dim4_div_lane*group_num_x*group_num_y+2)*win_size`.
For active host configuration row 22 it reports `win_size=16`, `group_num_x=5`,
`group_num_y=17`, and 1,392 memRead iterations. The RTL top still exposes these
values as inputs; this script is a reproducible host-parameter model, not
additional synthesized logic. Its two standard-library tests cover all 22
active rows and the first/final-layer padding cases:

```bash
python3 -m unittest discover -s project/device/reconstructions/opencl_win_buffer -p 'test_*.py' -v
```
