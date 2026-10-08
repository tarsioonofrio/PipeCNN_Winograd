#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/pipeCNN_f43_reconstruction.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

verilator --binary --timing -Wall -Wno-UNUSEDSIGNAL --top-module tb_transforms \
    --Mdir "$TMP/obj_dir" \
    "$HERE/winograd_f43_input_transform.sv" \
    "$HERE/winograd_f43_output_transform.sv" \
    "$HERE/tb_transforms.sv" \
    > "$TMP/build.log" 2>&1 || {
        cat "$TMP/build.log" >&2
        exit 1
    }
"$TMP/obj_dir/Vtb_transforms"
