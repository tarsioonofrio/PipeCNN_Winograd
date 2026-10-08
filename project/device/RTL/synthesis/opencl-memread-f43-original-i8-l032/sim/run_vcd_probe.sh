#!/usr/bin/env bash
set -euo pipefail

STAGE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_ROOT="$(cd -- "$STAGE_ROOT/.." && pwd)"
REPO_ROOT="$(git -C "$CONFIG_ROOT" rev-parse --show-toplevel)"
RUN_ID="${RUN_ID:?Set RUN_ID to the simulation run directory name}"
[[ "$RUN_ID" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Invalid RUN_ID" >&2; exit 2; }
RUN_ROOT="$CONFIG_ROOT/runs/$RUN_ID"
DB_DIR="$RUN_ROOT/logical/gate_level"
SIM_ROOT="$RUN_ROOT/sim"
TB="$REPO_ROOT/project/device/reconstructions/opencl_memread_compute/tb_memread_conv_slice.sv"
TOP_MODULE=pipecnn_memread_conv_slice
NETLIST="$DB_DIR/${TOP_MODULE}_logic_mapped.v"
SDF="$DB_DIR/${TOP_MODULE}_nominal.sdf"

[[ -f "$NETLIST" && -f "$SDF" ]] || { echo "Missing mapped netlist/SDF under $DB_DIR" >&2; exit 2; }
[[ -f "$TB" ]] || { echo "Missing testbench: $TB" >&2; exit 2; }
[[ ! -e "$SIM_ROOT" ]] || { echo "Refusing to overwrite $SIM_ROOT" >&2; exit 2; }
mkdir -p "$SIM_ROOT"

PDK_HOME="${TSMC28_HOME:-/pdk/tsmc/PDK28/PDK_TSMC28_bv/tcbn28hpcplusbwp30p140_190a/TSMCHOME}"
CELL_MODEL="$PDK_HOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.v"
[[ -f "$CELL_MODEL" ]] || { echo "Missing standard-cell Verilog model: $CELL_MODEL" >&2; exit 2; }
cat > "$SIM_ROOT/sdf_cmd.cmd" <<EOF
SDF_FILE = "$SDF",
LOG_FILE = "$SIM_ROOT/sdf.log",
SCOPE = tb_memread_conv_slice.dut,
MTM_CONTROL = "TYPICAL",
SCALE_FACTORS = "1.0:1.0:1.0",
SCALE_TYPE = "FROM_MAXIMUM";
EOF
cp "$STAGE_ROOT/vcd_probe.tcl" "$SIM_ROOT/vcd_probe.tcl"

source /usr/share/Modules/init/bash
module purge >/dev/null 2>&1
module use /soft64/modulefiles/cadence
module load xcelium/2303
cd "$SIM_ROOT"
xrun -64bit -sv -access +rwc -timescale 1ns/1ps \
    -sdf_cmd_file sdf_cmd.cmd -define XRUN -define VCD_TCL \
    -top tb_memread_conv_slice -elaborate \
    "$CELL_MODEL" "$TB" "$NETLIST" 2>&1 | tee elaborate.log
xrun -R -input vcd_probe.tcl 2>&1 | tee xrun.log
