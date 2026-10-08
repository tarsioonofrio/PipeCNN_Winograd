#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/../../../.." && pwd)"
build_dir="$(mktemp -d /tmp/pipecnn-pool-system.XXXXXX)"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing -Wno-fatal \
  --top-module tb_pipecnn_pool_memwrite_system \
  --Mdir "$build_dir/obj_dir" \
  "$repo_root/project/device/reconstructions/opencl_pool/pipecnn_pool_2x2.sv" \
  "$repo_root/project/device/reconstructions/opencl_memwrite/pipecnn_memwrite_output.sv" \
  "$script_dir/pipecnn_pool_memwrite_system.sv" \
  "$script_dir/tb_pipecnn_pool_memwrite_system.sv"

"$build_dir/obj_dir/Vtb_pipecnn_pool_memwrite_system"
