# Original PipeCNN ASIC MAC candidate

This isolated experiment replaces the original `mult_add_fix8bx16bx4` Intel IP
with synthesizable SystemVerilog while preserving its wrapper interface:
four simultaneous signed 16x8 products, a signed 26-bit sum extended to 32
bits, input and output registers, fixed latency, and the always-valid/
always-ready handshake behavior. `resetn`, `ivalid`, and `iready` remain ignored,
matching the original wrapper.

The candidate is deliberately not wired into `rtl_lib.xml` or the OpenCL build.
It is not a recovered `memRead`/`memWrite` hierarchy and does not establish
full-kernel equivalence. Integrate it only after the AOCL-generated kernel RTL
is recovered and its complete timing contract is available.

`tb.sv` compares continuous signed inputs, extrema, cancellation cases, and
varying `ivalid`/`iready` against a 32-bit software dot-product model while
checking the two-stage registered timing contract.

Run the local candidate simulation with:

```bash
./project/device/reconstructions/asic_mac4_i16_i8/run_test.sh
```

The candidate passed 39 cycle checks over 32 vectors with Verilator 5.050.
Separately, the original Intel wrapper and Quartus 18.1 `altera_mult_add`
simulation model passed the same arithmetic and timing reference in Xcelium
23.03-s003 on Paxos. That run emitted warnings from stale paths in the user's
global `cds.lib` and one SystemVerilog style warning in Intel's model, but had
zero compile errors, no mismatches, and exited with status 0. These results
validate only the MAC primitive, not its physical ASIC mapping or the complete
OpenCL kernel.
