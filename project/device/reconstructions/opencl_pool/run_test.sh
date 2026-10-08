#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
build_dir="$(mktemp -d /tmp/pipecnn-pool.XXXXXX)"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing -Wno-fatal \
  --top-module tb_pipecnn_pool_2x2 \
  --Mdir "$build_dir/obj_dir" \
  "$script_dir/pipecnn_pool_2x2.sv" \
  "$script_dir/tb_pipecnn_pool_2x2.sv"

"$build_dir/obj_dir/Vtb_pipecnn_pool_2x2"
