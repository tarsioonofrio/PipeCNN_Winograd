#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
build_root="$(mktemp -d "${TMPDIR:-/tmp}/pipecnn-bambu-mac4.XXXXXX")"
trap 'rm -rf -- "$build_root"' EXIT

for variant in default nangate45; do
    if [[ "$variant" == default ]]; then
        rtl="$script_dir/mac4_i16_i8.v"
    else
        rtl="$script_dir/nangate45/mac4_i16_i8.v"
    fi

    build_dir="$build_root/$variant"
    verilator --binary --timing \
        --top-module tb_mac4_i16_i8 \
        --Mdir "$build_dir" \
        --Wno-WIDTHEXPAND \
        "$rtl" "$script_dir/tb_mac4_i16_i8.sv"
    "$build_dir/Vtb_mac4_i16_i8"
done
