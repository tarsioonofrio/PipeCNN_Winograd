#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/../../../.." && pwd)"
build_dir="$(mktemp -d /tmp/pipecnn-opencl-system.XXXXXX)"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing -Wall -Wno-UNUSEDSIGNAL -Wno-DECLFILENAME \
  -Wno-PINCONNECTEMPTY --top-module tb_pipecnn_memread_pool_memwrite_system \
  --Mdir "$build_dir/obj_dir" \
  "$repo_root/project/device/reconstructions/asic_mac4_i16_i8/mult_add_fix8bx16bx4_asic.sv" \
  "$repo_root/project/device/reconstructions/asic_reconstruction_f43/winograd_f43_input_transform.sv" \
  "$repo_root/project/device/reconstructions/asic_reconstruction_f43/winograd_f43_output_transform.sv" \
  "$repo_root/project/device/reconstructions/opencl_memread_compute/pipecnn_memread_compute.sv" \
  "$repo_root/project/device/reconstructions/opencl_memread_compute/pipecnn_conv_accumulator_postprocess.sv" \
  "$repo_root/project/device/reconstructions/opencl_memread_compute/pipecnn_memread_conv_slice.sv" \
  "$script_dir/pipecnn_win_buffer3.sv" \
  "$script_dir/pipecnn_weight_buffer.sv" \
  "$script_dir/pipecnn_memread_counters.sv" \
  "$script_dir/pipecnn_memread_address.sv" \
  "$script_dir/pipecnn_win_buffer_compute.sv" \
  "$script_dir/pipecnn_memread_buffered_compute.sv" \
  "$repo_root/project/device/reconstructions/opencl_pool/pipecnn_pool_2x2.sv" \
  "$repo_root/project/device/reconstructions/opencl_memwrite/pipecnn_memwrite_output.sv" \
  "$script_dir/pipecnn_memread_pool_memwrite_system.sv" \
  "$script_dir/tb_pipecnn_memread_pool_memwrite_system.sv" \
  > "$build_dir/build.log" 2>&1 || {
    cat "$build_dir/build.log" >&2
    exit 1
  }

"$build_dir/obj_dir/Vtb_pipecnn_memread_pool_memwrite_system"
"$build_dir/obj_dir/Vtb_pipecnn_memread_pool_memwrite_system" +MEMORY_READ_LATENCY=0
"$build_dir/obj_dir/Vtb_pipecnn_memread_pool_memwrite_system" +MEMORY_READ_LATENCY=1
"$build_dir/obj_dir/Vtb_pipecnn_memread_pool_memwrite_system" +MEMORY_READ_LATENCY=4
