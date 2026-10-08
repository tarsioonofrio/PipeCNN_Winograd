#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
build_dir="$(mktemp -d "${TMPDIR:-/tmp}/pipecnn-conv3x3-mac4.XXXXXX")"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing --top-module conv3x3_mac4_tb \
    --Mdir "$build_dir/obj_dir" \
    "$repo_root/project/device/RTL/mac4_int16.sv" \
    "$repo_root/tests/conv3x3_mac4_tb.sv"
"$build_dir/obj_dir/Vconv3x3_mac4_tb" +verilator+seed+1
