#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
build_dir="$(mktemp -d /tmp/pipecnn-memwrite.XXXXXX)"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing -Wno-fatal \
  --top-module tb_pipecnn_memwrite_output \
  --Mdir "$build_dir/obj_dir" \
  "$script_dir/pipecnn_memwrite_output.sv" \
  "$script_dir/tb_pipecnn_memwrite_output.sv"

"$build_dir/obj_dir/Vtb_pipecnn_memwrite_output"
