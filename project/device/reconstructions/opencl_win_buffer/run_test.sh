#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
build_dir="$(mktemp -d /tmp/pipecnn-winbuf.XXXXXX)"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing -Wno-fatal \
  --top-module tb_pipecnn_win_buffer3 \
  --Mdir "$build_dir/obj_dir" \
  "$script_dir/pipecnn_win_buffer3.sv" \
  "$script_dir/tb_pipecnn_win_buffer3.sv"

"$build_dir/obj_dir/Vtb_pipecnn_win_buffer3"
