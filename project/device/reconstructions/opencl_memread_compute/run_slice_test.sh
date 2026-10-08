#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd -- "$HERE/../../../.." && pwd)"
MAC="$ROOT/project/device/reconstructions/asic_mac4_i16_i8/mult_add_fix8bx16bx4_asic.sv"
TRANSFORMS="$ROOT/project/device/reconstructions/asic_reconstruction_f43"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/pipecnn_memread_slice.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

verilator --binary --timing -Wall -Wno-UNUSEDSIGNAL -Wno-DECLFILENAME -Wno-PINCONNECTEMPTY \
    --top-module tb_memread_conv_slice --Mdir "$TMP/obj_dir" \
    "$MAC" \
    "$TRANSFORMS/winograd_f43_input_transform.sv" \
    "$TRANSFORMS/winograd_f43_output_transform.sv" \
    "$HERE/pipecnn_memread_compute.sv" \
    "$HERE/pipecnn_conv_accumulator_postprocess.sv" \
    "$HERE/pipecnn_memread_conv_slice.sv" \
    "$HERE/tb_memread_conv_slice.sv" \
    > "$TMP/build.log" 2>&1 || {
        cat "$TMP/build.log" >&2
        exit 1
    }
"$TMP/obj_dir/Vtb_memread_conv_slice"
