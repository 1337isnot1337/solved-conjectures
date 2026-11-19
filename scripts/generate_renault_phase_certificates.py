#!/usr/bin/env python3
"""Reproduce the finite payload of the three universal Renault phase lemmas.

Only the delimited data block is generated. The real interval soundness and
the public theorem statements are ordinary Lean source. Every finite assertion
is checked in Lean by `decide +kernel`; Python results are not proof premises.
"""

from __future__ import annotations

import argparse
import hashlib
from itertools import product
import json
from pathlib import Path


BEGIN = "-- BEGIN GENERATED RENAULT PHASE DATA\n"
END = "-- END GENERATED RENAULT PHASE DATA\n"
Action = tuple[int, int, bool]


def action_check(action: Action, coefficient: int, left: int, right: int) -> bool:
    a, b, strict = action
    offset = 60 * coefficient * b
    q = (a * left + offset) // 360
    if left == right and strict:
        return a > 0 and 360 * q + 60 < a * left + offset and a * right + offset < 360 * q + 300
    return a > 0 and 360 * q + 60 <= a * left + offset and a * right + offset <= 360 * q + 300


def minimal_masks(masks: set[int]) -> list[int]:
    minimal: list[int] = []
    for mask in sorted(masks, key=lambda x: (x.bit_count(), x)):
        if not any(other & mask == other for other in minimal):
            minimal.append(mask)
    return minimal


def phase_table(actions: list[Action], coefficient: int, lower: int, upper: int) -> dict:
    points = sorted({60 * i // a for a in range(1, 6) for i in range(6 * a + 1)
                     if lower <= 60 * i // a <= upper})
    assert all(60 % a == 0 for a in range(1, 6))
    assert points[0] == lower and points[-1] == upper
    cells = [(point, point) for point in points] + list(zip(points, points[1:]))
    full = {cell: sum(1 << i for i, action in enumerate(actions)
                      if action_check(action, coefficient, *cell)) for cell in cells}
    masks = minimal_masks(set(full.values()))
    if 0 in masks:
        raise ValueError("A real phase cell has no candidate")
    chosen = {cell: next(mask for mask in masks if mask & full[cell] == mask) for cell in cells}
    for cell, mask in chosen.items():
        assert mask in masks
        assert all(action_check(action, coefficient, *cell)
                   for i, action in enumerate(actions) if mask & (1 << i))
    return {"actions": actions, "coefficient": coefficient, "points": points,
            "masks": masks, "chosen": chosen}


def table_source(name: str, action_name: str, table: dict) -> str:
    masks = ", ".join(map(str, table["masks"]))
    out = [f"private def masks{name} : List ℕ := [{masks}]", "",
           f"private def cover{name} : PhaseCover :="]
    points = table["points"]
    for left, right in zip(points, points[1:]):
        point_mask = table["chosen"][left, left]
        open_mask = table["chosen"][left, right]
        out.append(f"  .next {left} {right} {point_mask} {open_mask} (")
    final = points[-1]
    out.append(f"  .single {final} {table['chosen'][final, final]}" + ")" * (len(points) - 1))
    out += ["", f"private theorem cover{name}_checked :",
            f"    cover{name}.check {action_name} {table['coefficient']} masks{name} = true := by",
            "  decide +kernel", "",
            f"private theorem cover{name}_lower : cover{name}.lower = {points[0]} := rfl",
            f"private theorem cover{name}_upper : cover{name}.upper = {points[-1]} := rfl", ""]
    return "\n".join(out)


def payload() -> tuple[str, dict]:
    common = [(a, b, False) for a in range(2, 6) for b in range(1, 6)]
    actions51 = common + [(1, b, True) for b in (1, 2, 4)]
    actions61 = common + [(1, b, True) for b in (1, 2, 3, 4)]
    actions64 = [(2, 0, True), (1, 1, True), (1, 5, True)] + [
        (a, b, False) for a in (3, 5) for b in range(6)]
    tables = {"51": phase_table(actions51, 1, 0, 360),
              "61Odd": phase_table(actions61, 1, 0, 360),
              "61Even": phase_table(actions61, 2, 0, 360),
              "64": phase_table(actions64, 1, 60, 300)}
    groups = [("51", "51", "51", "51"),
              ("61", "61Even", "61Odd", "61Odd"),
              ("64", "64", "64", "64")]
    for name, first, second, third in groups:
        if any(a & b & c == 0 for a, b, c in product(
                tables[first]["masks"], tables[second]["masks"], tables[third]["masks"])):
            raise ValueError("Empty triple candidate intersection for lemma " + name)
    pieces = []
    for name, table in tables.items():
        action_name = "actions61" if name.startswith("61") else "actions" + name
        pieces.append(table_source(name, action_name, table))
    for name, first, second, third in groups:
        pieces.append(f"private theorem triples{name}_checked :\n"
                      f"    phaseTripleCheck masks{first} masks{second} masks{third} = true := by\n"
                      "  decide +kernel\n")
    text = "\n".join(pieces)
    info = {name: {"points": len(table["points"]), "cells": len(table["chosen"]),
                   "minimal_masks": len(table["masks"])} for name, table in tables.items()}
    info["payload_sha256"] = hashlib.sha256(text.encode()).hexdigest()
    return text, info


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    args = parser.parse_args()
    path = args.repo / "lean/Conjectures/LonelinessRenaultPhaseCertificates.lean"
    existing = path.read_text()
    if existing.count(BEGIN) != 1 or existing.count(END) != 1:
        raise ValueError("Expected one delimited generated payload")
    prefix, remaining = existing.split(BEGIN)
    _, suffix = remaining.split(END)
    generated, info = payload()
    result = prefix + BEGIN + generated + END + suffix
    if args.check:
        if result != existing:
            raise ValueError("Generated phase certificate payload differs")
    else:
        path.write_text(result)
    info["acceptance"] = "requires strict Lean compilation and kernel verification"
    print(json.dumps(info, sort_keys=True))


if __name__ == "__main__":
    main()
