#!/usr/bin/env python3
"""Check that every transformed_weights input bit is declared and toggles."""

from collections import Counter
from pathlib import Path
import re


VCD = Path(__file__).parent / "sim" / "dut.vcd"
DUT_SCOPE = ["tb_memread_conv_slice", "dut"]
EXPECTED_BITS = 24_576


def main() -> None:
    scopes: list[str] = []
    ids: dict[int, str] = {}
    indices: set[int] = set()
    in_dut = False

    with VCD.open(errors="replace") as stream:
        for line in stream:
            entry = line.strip()
            if entry.startswith("$scope "):
                scopes.append(entry.split()[2])
                in_dut = scopes == DUT_SCOPE
            elif entry.startswith("$upscope"):
                if scopes:
                    scopes.pop()
                in_dut = scopes == DUT_SCOPE
            elif entry.startswith("$var ") and in_dut:
                fields = entry.split()
                ident = fields[3]
                name = " ".join(fields[4:-1])
                if name.startswith("transformed_weights ["):
                    match = re.search(r"\[(\d+)\]", name)
                    if match:
                        index = int(match.group(1))
                        indices.add(index)
                        ids[index] = ident
            elif entry.startswith("$enddefinitions"):
                break

    if len(indices) != EXPECTED_BITS or indices != set(range(EXPECTED_BITS)):
        raise SystemExit(
            f"Expected indices 0..{EXPECTED_BITS - 1}; found {len(indices)} declarations"
        )

    reverse_ids = set(ids.values())
    changes: Counter[str] = Counter()
    with VCD.open(errors="replace") as stream:
        for line in stream:
            entry = line.strip()
            if len(entry) > 1 and entry[0] in "01xXzZ" and entry[1:] in reverse_ids:
                changes[entry[1:]] += 1
            elif entry and entry[0] in "bBrR":
                fields = entry.split()
                if len(fields) == 2 and fields[1] in reverse_ids:
                    changes[fields[1]] += 1

    active = len(changes)
    total_changes = sum(changes.values())
    print(f"DUT transformed_weights declarations: {len(indices)}/{EXPECTED_BITS}")
    print(f"DUT transformed_weights indices: {min(indices)}..{max(indices)}")
    print(f"Bits with value changes: {active}/{EXPECTED_BITS}")
    print(f"Scalar transitions: {total_changes}")
    if active != EXPECTED_BITS:
        raise SystemExit("Some transformed_weights bits have no VCD value change")


if __name__ == "__main__":
    main()
