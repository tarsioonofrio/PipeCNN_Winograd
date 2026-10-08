# OpenCL `memWrite` output reconstruction

`pipecnn_memwrite_output.sv` translates the source-level token selection,
spatial padding, lane extraction, output address, and coordinate counters from
`conv_pipe.cl::memWrite` for the active OpenCL widths. It exposes ready/valid
interfaces for the selected `pool_ch` or `bypass_ch` token and for writes to an
abstract output memory.

The wrapper holds one channel token while its output writes are stalled and
keeps the address and data stable until each write is accepted. AOCL does not
specify these handshakes or the cycle schedule in the OpenCL source, so this is
a functional reconstruction with an ASIC wrapper, not recovered AOCL RTL or
cycle-equivalent behavior. The host parameters must remain stable until `done`.

The focused Verilator test checks the source ordering for a small configuration
with two x-groups, left/right padding, a full z-group, a residual z-group, and
output backpressure. It does not test full YOLOv2 integration or AOCL timing.

Run with:

```bash
./run_test.sh
```
