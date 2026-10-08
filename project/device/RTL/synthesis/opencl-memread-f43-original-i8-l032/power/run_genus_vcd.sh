#!/usr/bin/env bash
set -euo pipefail

STAGE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_ROOT="$(cd -- "$STAGE_ROOT/.." && pwd)"
RUN_ID="${RUN_ID:?Set RUN_ID to the existing synthesis/simulation run}"
[[ "$RUN_ID" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Invalid RUN_ID" >&2; exit 2; }
RUN_ROOT="$CONFIG_ROOT/runs/$RUN_ID"
DB="$RUN_ROOT/logical/gate_level/pipecnn_memread_conv_slice_logic_mapped.db"
VCD="$RUN_ROOT/sim/dut.vcd"
POWER_ROOT="$RUN_ROOT/power_genus"
[[ -f "$DB" ]] || { echo "Missing Genus database: $DB" >&2; exit 2; }
[[ -s "$VCD" ]] || { echo "Missing VCD: $VCD" >&2; exit 2; }
[[ ! -e "$POWER_ROOT" ]] || { echo "Refusing to overwrite $POWER_ROOT" >&2; exit 2; }
mkdir -p "$POWER_ROOT"
export RUN_ID

source /usr/share/Modules/init/bash
module purge >/dev/null 2>&1
module use /soft64/modulefiles/cadence
module load genus/211
genus -batch -log "$POWER_ROOT/genus.log" \
    -files "$STAGE_ROOT/genus_vcd_power.tcl" \
    2>&1 | tee "$POWER_ROOT/genus_console.log"
