# PipeCNN_Winograd reports

## Organização dos artefatos

As reconstruções SystemVerilog feitas manualmente estão centralizadas em
`project/device/reconstructions/`; o índice em
`project/device/reconstructions/README.md` descreve cada uma. Experimentos de
conversão ficam em `project/device/experiments/<ferramenta>/`, como o MAC
isolado convertido com Bambu em `project/device/experiments/bambu/mac4_i16_i8/`.
Variantes OpenCL que ainda não foram convertidas ficam em
`project/device/experiments/intel_aocl/`.

Os relatórios datados abaixo preservam comandos e caminhos usados na época em
que cada execução ocorreu. Se um caminho histórico diferir da organização
atual, consulte os índices acima para localizar o artefato atual.

## Source and locations

`asic-recovery-audit.md` records the current static audit of the original
OpenCL architecture, including source-level output ordering in `memWrite`,
available AOCL artifacts, and the gaps before full-kernel RTL recovery. It is an
analysis report, not a compilation or ASIC result.

`local-verification-2026-10-07.md` records the commands and PASS summaries for
the current 14-runner Verilator regression and two host-parameter unit tests.
It describes the source-level scope and notes that temporary simulator build
directories were removed by the runners.

The read-only Paxos preflight, module versions, checked PDK paths, remote
checkout revision, and local transfer package checksum are recorded in
section Q of `asic-recovery-audit.md`. A later Genus run for a source-level
system reconstruction was launched on the Paxos; its current state and scope
are recorded separately below and in sections S–V of the audit.

The isolated source-level reconstruction of the active `memRead` arithmetic
is under `project/device/reconstructions/opencl_memread_compute/`. Its Verilator
runner and testbench are reproducible functional evidence for that compute
slice only; they do not establish AOCL schedule equivalence or ASIC PPA.

The active 2x2/stride-2 pooling reconstruction is under
`project/device/reconstructions/opencl_pool/`. It models the one-line buffer and
signed maxima in the source path; its test is functional evidence for that
reduced configuration. An integrated pool-to-`memWrite` test checks output
addresses and data under backpressure; neither test establishes AOCL timing or
full-kernel validation.

The functional `memWrite` output adaptation is under
`project/device/reconstructions/opencl_memwrite/`. It verifies source-level channel
selection, output ordering, padding, and a residual z-group under a small test
configuration; its ready/valid timing is an ASIC wrapper, not recovered AOCL
timing.

The three-slot `win_buffer` reconstruction is under
`project/device/reconstructions/opencl_win_buffer/`. It tests the source `flag`
rotation, two-group warm-up, selected slots, and `gp_num_x==1` border masks. The
`pipecnn_memread_buffered_compute.sv` wrapper connects the source-level group
counters, both logical buffers, explicit transpose into channel-major features,
F(4,3) convolution arithmetic, `conv_z_cnt`-driven two-term accumulation, and
fixed-point output. Its integrated test passes three output tiles with
`conv_loop_cnt=2` and the source weight-load gate. Feature, global weight, and
bias words remain external inputs; the wrapper does not model their memory
latency. The test does not establish AOCL timing, temporal equivalence, or
full-kernel integration. The counter block also passes a separate 20-iteration
test.

`derive_memread_params.py` reproduces the active `main.cpp`/`layer_config.h`
host calculations for the 22 configured layers. Active host configuration row 22
arguments include `win_size=16`, `group_num_x=5`, `group_num_y=17`, and
`group_num_mul_win_size=1392`. These are source/host-derived values, not an
AOCL-generated schedule. Two Python unit tests cover the active rows and the
first-layer channel padding; run them with the command documented in the
`opencl_win_buffer` experiment README.

`pipecnn_memread_pool_memwrite_system.sv` joins the source-level `memRead`
reconstruction to a bounded result FIFO, the optional 2x2 pooling path or
bypass path, and the functional `memWrite` output. Its testbench checks six
bypass writes and two pooled writes in reduced cases, then drives the active
host row 22 parameters for all 1,392 input iterations. That case observes 85
compute result tokens and verifies all 578 output addresses exactly once,
including output stalls and FIFO drain. The row-22 feature stimulus is
deterministic and nonzero, while weights and bias are zero, so it checks
iteration termination and routing/addressing but not that layer's arithmetic.
Nonzero arithmetic is checked separately by `run_compute_test.sh`. The FIFO
depth and four-entry reservation are wrapper choices, not recovered AOCL
channel parameters. External memory latency, AOCL timing equivalence, and PPAE
remain unverified.

An isolated Genus/Xcelium/Joules flow for that slice is under
`project/device/RTL/synthesis/opencl-memread-f43-original-i8-l032/`. Genus
completed on the source-level compute slice and its mapped netlist, SDF, area,
gate and timing reports are archived in
`paxos-run02-interim-20261007T172639/`. The Genus vectorless power report is
also preserved there and is not stimulus-based power.

Xcelium passed the slice test in runs 02, 03, 04 and 05. Runs 02/03/04 omitted
the 24,576-bit `transformed_weights` input from VCD. Run05 uses a Tcl probe with
the packed-array limit raised, and its complete VCD plus logs are in
`paxos-run05-vcd-probe-fixed-20261007/`; every input weight bit has value
transitions. Run05 annotated 100% of SDF path delays, 99.74% of setup/hold
checks and none of the width checks.

Genus 21.12 read the run05 gate-level VCD into the mapped database and completed
activity propagation with 100% annotation of primary inputs, primary outputs
and flops (478 of 1,284,005 driver nets are listed as unconnected). The report
in `paxos-run05-vcd-probe-fixed-20261007/power_genus/` estimates 147.830 mW
average over the 0–150 ns testbench window: 5.692 mW leakage, 57.067 mW
internal and 85.072 mW switching. This corresponds to 22.175 nJ over that
150 ns window. The Genus report uses its integrated Joules engine under the
Genus synthesis license; standalone Joules still cannot start because the
Paxos license server advertises neither `Joules_RTL_Power` nor
`Joules_Power_SP`.

This is a synthesis-stage estimate for the reconstructed compute slice and
three short test vectors. It excludes the full OpenCL kernel, YOLO workload,
physical clock tree and post-route parasitics. The library continues to report
LBR/PHYS warnings; see the raw Genus log beside the power report.

The broader source-level reconstruction uses top
`pipecnn_memread_pool_memwrite_system` and a 15-file RTL list in
`project/device/RTL/synthesis/opencl-system-f43-i8-l032/`. Its Genus run
`system-f43-i8-l032-20261007T182100` was interrupted at the user's request on
2026-10-07 around 22:29 BRT with `SIGTERM` after 4h05 on the Paxos. Verification
confirmed that its process group exited. It had not produced reports or a
mapped netlist. Snapshots of the remote `genus.log` files and temporary `MESG`
diagnostics, with SHA-256 values, are in
`paxos-run-system-f43-i8-l032-20261007T182100/diagnostics/`. This design is a
reconstruction with external feature/weight/bias ports and a wrapper-defined
FIFO; it is not the RTL recovered from AOCL and its PPA must not be attributed
to the original PipeCNN architecture.

AOCL's full-kernel compilation reports are generated beneath the project
directory, not directly in this archive folder:

```text
project/conv_pipe/reports/report.html
project/conv_pipe/                 # remaining compiler reports/intermediates
project/conv_pipe.aocx              # compiled FPGA image
```

The compiler project is called `conv_pipe` because the input is
`project/device/conv_pipe.cl`. The HTML report is generated by the `-report`
option in `project/run_fpga.sh`. Reports in
`project/device/RTL/mult_add_fix8bx16bx4/` are IP-generation reports only; they
are not the report for the complete YOLOv2 accelerator.

## Preserve a run

`project/run_fpga.sh` starts with `make clean`, whose clean target deletes the
generated `project/conv_pipe/` directory and selected build logs/reports. To
keep a run before rebuilding, copy its entire compiler output directory into a
descriptive archive path, for example:

```bash
mkdir -p reports/arria10-aocl18-run-01
cp -a project/conv_pipe reports/arria10-aocl18-run-01/
```

Use a new run label for every compile; do not overwrite an earlier archived
run. Keep the compiler report with the exact RTL/OpenCL revision, AOCL version,
board/part, command line, and compile status. Copying the report directory is
documentation/archive management only; the build scripts do not do this
automatically.

The compiled image expected by the host source is `project/conv_pipe.aocx`.
It is useful to record its checksum with the report, but it is a generated
binary rather than a report and should only be versioned if the project
explicitly requires that artifact.

## Interpretation

`report.html` and its supporting AOCL files describe compiler estimates and
implementation analysis for the configured FPGA build. They are not physical
measurements of board power or application runtime. Keep power estimates,
on-board measurements, emulator output, IP-generation reports, and full-kernel
compilation reports clearly distinguished.
