#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
build_dir="$(mktemp -d "${TMPDIR:-/tmp}/pipecnn-mac4-int16.XXXXXX")"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing --top-module mac4_int16_tb \
    --Mdir "$build_dir/obj_dir" \
    "$repo_root/project/device/RTL/mac4_int16.sv" \
    "$repo_root/tests/mac4_int16_tb.sv"
"$build_dir/obj_dir/Vmac4_int16_tb" +verilator+seed+1
