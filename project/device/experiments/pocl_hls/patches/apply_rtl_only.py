#!/usr/bin/env python3
"""Apply the tested RTL-only experiment patch to a PoCL-HLS checkout."""

from pathlib import Path
import subprocess
import sys


if len(sys.argv) != 2:
    raise SystemExit(f"usage: {sys.argv[0]} POCL_HLS_SOURCE_DIR")

experiment_dir = Path(__file__).resolve().parent
patch = experiment_dir / "rtl-only-vitis-2024.2.patch"
root = Path(sys.argv[1]).resolve()

subprocess.run(
    ["git", "-C", str(root), "apply", "--check", str(patch)], check=True
)
subprocess.run(["git", "-C", str(root), "apply", str(patch)], check=True)
print(f"Applied {patch.name} to {root}")
