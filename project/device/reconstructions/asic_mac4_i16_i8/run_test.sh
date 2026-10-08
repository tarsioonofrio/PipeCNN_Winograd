#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
build_dir="$(mktemp -d /tmp/pipecnn-mac4-i16-i8.XXXXXX)"
trap 'rm -rf "$build_dir"' EXIT

verilator --binary --timing --top-module tb \
  --Mdir "$build_dir/obj" \
  "$script_dir/mult_add_fix8bx16bx4_asic.sv" \
  "$script_dir/tb.sv"

"$build_dir/obj/Vtb"
