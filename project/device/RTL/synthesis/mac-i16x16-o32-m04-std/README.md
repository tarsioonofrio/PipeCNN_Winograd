# Joules power flow for the four-product int16 MAC

This flow adapts the Genus -> Xcelium -> Joules sequence used by
`FastConv_SystemVerilog` to the standalone `mac4_int16` RTL block in this
repository. It synthesizes four signed 16x16 multipliers and their signed
32-bit sum. It does not synthesize the full OpenCL convolution kernel.

Run the stages on Paxos, where the Cadence modules and TSMC 28 nm libraries
are available. The default PDK root follows the FastConv flow; set
`TSMC28_HOME` to override it.

Run all three stages with one unique run directory:

```bash
cd project/device/RTL/synthesis/mac-i16x16-o32-m04-std
./run.sh
```

Or run an individual stage with the same run ID:

```bash
RUN_ID=mac4-baseline ./logical/run.sh
RUN_ID=mac4-baseline ./sim/run.sh
RUN_ID=mac4-baseline ./power/run.sh
```

Each run writes under `runs/$RUN_ID/`. Existing run directories are never
overwritten. Genus writes the mapped netlist and SDF. Xcelium checks the
gate-level result against a 64-bit reference and records activity in both
`dut.shm` and `dut.vcd`. Joules reads the mapped netlist, the TSMC 28 nm
typical library, and the VCD stimulus to produce `power_evaluation.txt`.

The SDC uses a 2 ns virtual clock and 5 fF output loads, matching the starting
timing assumption in the referenced FastConv configuration. This is a
combinational block, so clock power is expected to be zero; reported dynamic
power depends on the testbench vector activity. Treat the result as power for
this MAC block under this stimulus, not as power for the full PipeCNN design.

The RTL is also used by the int16 OpenCL experiment, but it is not registered
in `rtl_lib.xml`; the AOCL FPGA kernel does not instantiate this ASIC flow's
standalone module.
