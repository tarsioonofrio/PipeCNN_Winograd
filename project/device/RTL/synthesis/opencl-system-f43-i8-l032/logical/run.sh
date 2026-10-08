#!/usr/bin/env bash
set -euo pipefail

STAGE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_ROOT="$(cd -- "$STAGE_ROOT/.." && pwd)"
RUN_ID="${RUN_ID:-$(date -u +%Y%m%dT%H%M%SZ)}"
[[ "$RUN_ID" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Invalid RUN_ID" >&2; exit 2; }
RUN_ROOT="$CONFIG_ROOT/runs/$RUN_ID"
[[ ! -e "$RUN_ROOT/logical" ]] || { echo "Refusing to overwrite $RUN_ROOT/logical" >&2; exit 2; }
mkdir -p "$RUN_ROOT/logical"
export RUN_ID CONFIG_ROOT RUN_ROOT

source /usr/share/Modules/init/bash
module purge >/dev/null 2>&1
module use /soft64/modulefiles/cadence
module load genus/211
cd "$STAGE_ROOT"
genus -f logical_synthesis.tcl 2>&1 | tee "$RUN_ROOT/logical/genus.log"
