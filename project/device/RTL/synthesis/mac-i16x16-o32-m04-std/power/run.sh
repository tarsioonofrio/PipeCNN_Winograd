#!/usr/bin/env bash
set -euo pipefail

STAGE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_ROOT="$(cd -- "$STAGE_ROOT/.." && pwd)"
RUN_ID="${RUN_ID:?Set RUN_ID to the synthesis run directory name}"
[[ "$RUN_ID" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Invalid RUN_ID" >&2; exit 2; }
RUN_ROOT="$CONFIG_ROOT/runs/$RUN_ID"
[[ -f "$RUN_ROOT/logical/gate_level/mac4_int16_logic_mapped.v" ]] || {
    echo "Missing mapped Genus netlist under $RUN_ROOT/logical; synthesize first" >&2; exit 2;
}
[[ -s "$RUN_ROOT/sim/dut.vcd" ]] || {
    echo "Missing Xcelium VCD at $RUN_ROOT/sim/dut.vcd; simulate first" >&2; exit 2;
}
[[ ! -e "$RUN_ROOT/power" ]] || { echo "Refusing to overwrite $RUN_ROOT/power" >&2; exit 2; }
mkdir -p "$RUN_ROOT/power"
export RUN_ID CONFIG_ROOT RUN_ROOT

source /usr/share/Modules/init/bash
module purge >/dev/null 2>&1
module use /soft64/modulefiles
module load cadence/jls/16.10
cd "$STAGE_ROOT"
joules -work "$RUN_ROOT/power/joules_work" \
    -log "$RUN_ROOT/power/joules.log" \
    -cmd "$RUN_ROOT/power/joules.cmd" \
    -overwrite -batch -files "$STAGE_ROOT/power.tcl" \
    2>&1 | tee "$RUN_ROOT/power/joules_console.log"
