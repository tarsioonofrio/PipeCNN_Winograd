#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
build_dir="$(mktemp -d "${TMPDIR:-/tmp}/pipecnn-asb3-f43.XXXXXX")"
trap 'rm -rf -- "$build_dir"' EXIT

verilator --binary --timing --top-module asb3_f43_tb \
    --Mdir "$build_dir/obj_dir" \
    "$repo_root/project/device/RTL/asb3_f43.sv" \
    "$repo_root/tests/asb3_f43_tb.sv"
"$build_dir/obj_dir/Vasb3_f43_tb"
