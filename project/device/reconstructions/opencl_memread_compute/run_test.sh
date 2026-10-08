#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd -- "$HERE/../../../.." && pwd)"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/pipecnn_memread_compute.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

verilator --binary --timing -Wall -Wno-UNUSEDSIGNAL -Wno-DECLFILENAME -Wno-PINCONNECTEMPTY --top-module tb_pipecnn_memread_compute \
    --Mdir "$TMP/obj_dir" \
    "$ROOT/project/device/reconstructions/asic_mac4_i16_i8/mult_add_fix8bx16bx4_asic.sv" \
    "$ROOT/project/device/reconstructions/asic_reconstruction_f43/winograd_f43_input_transform.sv" \
    "$ROOT/project/device/reconstructions/asic_reconstruction_f43/winograd_f43_output_transform.sv" \
    "$HERE/pipecnn_memread_compute.sv" \
    "$HERE/tb_pipecnn_memread_compute.sv" \
    > "$TMP/build.log" 2>&1 || {
        cat "$TMP/build.log" >&2
        exit 1
    }
"$TMP/obj_dir/Vtb_pipecnn_memread_compute"
