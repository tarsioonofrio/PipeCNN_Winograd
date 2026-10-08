#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd -- "$HERE/../../../.." && pwd)"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/pipeCNN_f43_dot9.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

verilator --binary --timing -Wall -Wno-UNUSEDSIGNAL --top-module tb_dot9_mac4 \
    --Mdir "$TMP/obj_dir" \
    "$ROOT/project/device/RTL/mac4_int16.sv" \
    "$HERE/winograd_f43_dot9_mac4.sv" \
    "$HERE/tb_dot9_mac4.sv" \
    > "$TMP/build.log" 2>&1 || {
        cat "$TMP/build.log" >&2
        exit 1
    }
"$TMP/obj_dir/Vtb_dot9_mac4"
