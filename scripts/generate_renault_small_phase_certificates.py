#!/usr/bin/env python3
"""Reproduce the exact sixth-shift masks used by Renault's three-even case."""

from __future__ import annotations

import argparse
import hashlib
from itertools import product
import json
from pathlib import Path

from generate_renault_phase_certificates import action_check, minimal_masks, table_source


BEGIN = "-- BEGIN GENERATED RENAULT SMALL PHASE DATA\n"
END = "-- END GENERATED RENAULT SMALL PHASE DATA\n"
ACTIONS = [(1, b, False) for b in range(1, 6)]


def table(coefficient: int, lower: int, upper: int) -> dict:
    points = list(range(lower, upper + 1, 60))
    cells = [(x, x) for x in points] + list(zip(points, points[1:]))
    full = {cell: sum(1 << i for i, action in enumerate(ACTIONS)
                      if action_check(action, coefficient, *cell)) for cell in cells}
    return {"actions": ACTIONS, "coefficient": coefficient, "points": points, "full": full}


def choose_masks(data: dict, masks: list[int]) -> dict:
    chosen = {cell: next(mask for mask in masks if mask & full == mask)
              for cell, full in data["full"].items()}
    assert all(action_check(ACTIONS[i], data["coefficient"], *cell)
               for cell, mask in chosen.items() for i in range(5) if mask & (1 << i))
    return {**data, "masks": masks, "chosen": chosen}


def payload() -> tuple[str, dict]:
    tables = {}
    for suffix, coefficient in [("Even", 2), ("Odd", 1)]:
        full = table(coefficient, 0, 360)
        low, high = table(coefficient, 0, 60), table(coefficient, 300, 360)
        full_masks = minimal_masks(set(full["full"].values()))
        unsafe_masks = minimal_masks(set(low["full"].values()) | set(high["full"].values()))
        tables["Full" + suffix] = choose_masks(full, full_masks)
        tables["Low" + suffix] = choose_masks(low, unsafe_masks)
        tables["High" + suffix] = choose_masks(high, unsafe_masks)
    groups = [("Even", "LowEven", "FullEven", "FullOdd"),
              ("Odd", "FullEven", "FullEven", "LowOdd")]
    for _, a, b, c in groups:
        assert all(x & y & z for x, y, z in product(tables[a]["masks"],
                                                   tables[b]["masks"], tables[c]["masks"]))
    pieces = [table_source(name, "shiftActions", data) for name, data in tables.items()]
    for name, a, b, c in groups:
        pieces.append(f"private theorem shiftTriples{name}_checked :\n"
                      f"    phaseTripleCheck masks{a} masks{b} masks{c} = true := by\n"
                      "  decide +kernel\n")
    generated = "\n".join(pieces)
    info = {name: {"points": len(data["points"]), "cells": len(data["chosen"]),
                   "minimal_masks": len(data["masks"])} for name, data in tables.items()}
    info["payload_sha256"] = hashlib.sha256(generated.encode()).hexdigest()
    return generated, info


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    args = parser.parse_args()
    path = args.repo / "lean/Conjectures/LonelinessRenaultSmallPhases.lean"
    existing = path.read_text()
    if existing.count(BEGIN) != 1 or existing.count(END) != 1:
        raise ValueError("Expected one delimited generated payload")
    prefix, remaining = existing.split(BEGIN)
    _, suffix = remaining.split(END)
    generated, info = payload()
    result = prefix + BEGIN + generated + END + suffix
    if args.check:
        if result != existing:
            raise ValueError("Generated small phase certificate payload differs")
    else:
        path.write_text(result)
    info["acceptance"] = "requires strict Lean compilation and kernel verification"
    print(json.dumps(info, sort_keys=True))


if __name__ == "__main__":
    main()
