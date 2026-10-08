#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
build_dir="$(mktemp -d /tmp/pipecnn-memread-counters.XXXXXX)"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing -Wall -Wno-DECLFILENAME \
  --top-module tb_pipecnn_memread_counters \
  --Mdir "$build_dir/obj_dir" \
  "$script_dir/pipecnn_memread_counters.sv" \
  "$script_dir/pipecnn_memread_address.sv" \
  "$script_dir/tb_pipecnn_memread_counters.sv" \
  > "$build_dir/build.log" 2>&1 || {
    cat "$build_dir/build.log" >&2
    exit 1
  }

"$build_dir/obj_dir/Vtb_pipecnn_memread_counters"
