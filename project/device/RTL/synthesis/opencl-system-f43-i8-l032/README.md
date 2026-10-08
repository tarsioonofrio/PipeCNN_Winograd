# OpenCL `memRead`/pool/`memWrite` system reconstruction ASIC flow

This flow synthesizes the current source-level system reconstruction with
Genus and the same TSMC 28 nm TT corner and 2 ns comparison constraints as the
compute-slice flow. The top is
`pipecnn_memread_pool_memwrite_system`: reconstructed `memRead` counters,
buffers and compute; the explicit result FIFO; selectable 2x2 pooling; and
`memWrite` output address/data generation.

This is the `opencl.md` controlled-reconstruction alternative. It is not
RTL recovered from AOCL and its ready/valid FIFO timing is an ASIC wrapper,
not the unknown Intel channel schedule. It includes the full reconstructed
logic boundary only: feature, weight and bias values are supplied through
wide top-level ports. There are no external RAM macros or memory-latency
models in this synthesis top. The FIFO is a register array, not a recovered
AOCL channel implementation.

Run on Paxos after the sources and this config are present in the checkout:

```bash
cd project/device/RTL/synthesis/opencl-system-f43-i8-l032
RUN_ID=system-f43-i8-l032-<unique-label> ./run.sh
```

The run creates a unique directory and refuses to overwrite it. Genus writes
the mapped netlist, database, SDF, gate/area/timing reports and vectorless
power report under `runs/$RUN_ID/logical/`. The vectorless estimate is not
stimulus-based power; it is kept as a diagnostic only. This initial flow
performs synthesis and does not run Xcelium, Joules, placement, CTS or routing.

The active host Layer-22 parameters are represented by the existing system
testbench. Its feature words are deterministic and nonzero, while weights and
bias remain zero, so the Layer-22 case checks control, routing, and addresses
without validating that workload's arithmetic values. Do not interpret this
synthesis run as a validated Layer-22 workload or as complete-system PPAE.
External memory timing, AOCL schedule equivalence, physical memories, and
fidelity to the original generated hierarchy remain unverified.
