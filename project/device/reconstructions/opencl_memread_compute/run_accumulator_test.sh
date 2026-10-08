#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/pipecnn_accumulator.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

verilator --binary --timing -Wall -Wno-UNUSEDSIGNAL --top-module tb_accumulator_postprocess \
    --Mdir "$TMP/obj_dir" \
    "$HERE/pipecnn_conv_accumulator_postprocess.sv" \
    "$HERE/tb_accumulator_postprocess.sv" \
    > "$TMP/build.log" 2>&1 || {
        cat "$TMP/build.log" >&2
        exit 1
    }
"$TMP/obj_dir/Vtb_accumulator_postprocess"
