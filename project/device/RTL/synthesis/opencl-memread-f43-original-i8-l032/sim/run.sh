#!/usr/bin/env bash
set -euo pipefail

STAGE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_ROOT="$(cd -- "$STAGE_ROOT/.." && pwd)"
REPO_ROOT="$(git -C "$CONFIG_ROOT" rev-parse --show-toplevel)"
RUN_ID="${RUN_ID:?Set RUN_ID to the synthesis run directory name}"
[[ "$RUN_ID" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Invalid RUN_ID" >&2; exit 2; }
RUN_ROOT="$CONFIG_ROOT/runs/$RUN_ID"
DB_DIR="$RUN_ROOT/logical/gate_level"
SIM_ROOT="$RUN_ROOT/sim"
[[ -f "$DB_DIR/pipecnn_memread_conv_slice_logic_mapped.v" && -f "$DB_DIR/pipecnn_memread_conv_slice_nominal.sdf" ]] || {
    echo "Missing Genus netlist/SDF under $DB_DIR; synthesize first" >&2; exit 2;
}
[[ ! -e "$SIM_ROOT" ]] || { echo "Refusing to overwrite $SIM_ROOT" >&2; exit 2; }
mkdir -p "$SIM_ROOT"

PDK_HOME="${TSMC28_HOME:-/pdk/tsmc/PDK28/PDK_TSMC28_bv/tcbn28hpcplusbwp30p140_190a/TSMCHOME}"
CELL_MODEL="$PDK_HOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.v"
[[ -f "$CELL_MODEL" ]] || { echo "Missing standard-cell Verilog model: $CELL_MODEL" >&2; exit 2; }
cat > "$SIM_ROOT/sdf_cmd.cmd" <<EOF
SDF_FILE = "$DB_DIR/pipecnn_memread_conv_slice_nominal.sdf",
LOG_FILE = "$SIM_ROOT/sdf.log",
SCOPE = tb_memread_conv_slice.dut,
MTM_CONTROL = "TYPICAL",
SCALE_FACTORS = "1.0:1.0:1.0",
SCALE_TYPE = "FROM_MAXIMUM";
EOF

source /usr/share/Modules/init/bash
module purge >/dev/null 2>&1
module use /soft64/modulefiles/cadence
module load xcelium/2303
cd "$SIM_ROOT"
export SHM_PACKED_LIMIT=24576
xrun -64bit -sv -access +rwc -timescale 1ns/1ps \
    -sdf_cmd_file sdf_cmd.cmd -define XRUN \
    -top tb_memread_conv_slice -run -exit \
    "$CELL_MODEL" "$REPO_ROOT/project/device/reconstructions/opencl_memread_compute/tb_memread_conv_slice.sv" \
    "$DB_DIR/pipecnn_memread_conv_slice_logic_mapped.v" 2>&1 | tee xrun.log
