#!/usr/bin/env bash
set -euo pipefail

CONFIG_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
RUN_ID="${RUN_ID:-mac4-$(date -u +%Y%m%dT%H%M%SZ)}"
[[ "$RUN_ID" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Invalid RUN_ID" >&2; exit 2; }
RUN_ROOT="$CONFIG_ROOT/runs/$RUN_ID"
[[ ! -e "$RUN_ROOT" ]] || { echo "Refusing to overwrite $RUN_ROOT" >&2; exit 2; }
export RUN_ID

"$CONFIG_ROOT/logical/run.sh"
"$CONFIG_ROOT/sim/run.sh"
"$CONFIG_ROOT/power/run.sh"
echo "Completed Genus -> Xcelium -> Joules run: $RUN_ROOT"
