# OpenCL pooling reconstruction

`pipecnn_pool_2x2.sv` follows the active `pool_size=2`, `pool_stride=2` path in
`conv_pipe.cl`: it computes two signed horizontal maxima from input positions
0–3, combines them with the previous row's stored maxima, writes the current
row maxima into a one-line buffer, and emits output only on every second row.
The output token carries the two pooled values per lane in positions 0 and 1;
positions 2–5 are zero, matching `pool_final`.

The active `layer_config.h` entries that enable pooling use 2×2/stride-2. The
OpenCL source parameter comment allows a size up to three, but the shown
arithmetic still combines only two horizontal pairs and one previous row. This
module therefore models the active 2×2 configuration only; it does not claim
3×3 pooling support or AOCL cycle equivalence. The one-line buffer has
read-before-write semantics for the same column, and its first-row contents
are not initialized. No output is generated until the previous row has been
written.

`run_test.sh` checks signed max values, row/column progression, line-buffer
reuse, stride-2 output rows, unused output bytes, and output backpressure in a
small configuration.

`pipecnn_pool_memwrite_system.sv` connects the pooling block to the functional
`memWrite` reconstruction using ready/valid flow control. Its integrated test
checks the resulting write addresses and pooled output bytes over a small
two-row, two-column workload, including backpressure. Run it with
`./run_system_test.sh`.
