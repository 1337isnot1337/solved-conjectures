#!/usr/bin/env python3
"""Produce small cyclic search trees, whose checks are replayed by Lean.

The producer is untrusted. Each generated theorem uses ordinary kernel
reduction of FranklSmallCyclic.check, and its generic soundness proof covers
every generator family between the current lower and upper bounds.
"""

from __future__ import annotations

import argparse
from collections import Counter
from itertools import combinations, permutations
from pathlib import Path


TILES = (7, 11, 13, 15)
PASCH = (7, 25, 44, 50)


def cyclic_mask(n: int, start: int, tile: int) -> int:
    result = 0
    for j in range(4):
        if tile >> j & 1:
            result |= 1 << ((start + j) % n)
    return result


def relabel(mask: int, labels: tuple[int, ...]) -> int:
    result = 0
    for j, x in enumerate(labels):
        if mask >> j & 1:
            result |= 1 << x
    return result


def finset(mask: int) -> str:
    points = [str(x) for x in range(mask.bit_length()) if mask >> x & 1]
    return "{" + ", ".join(points) + "}" if points else "∅"


def generate(n: int) -> tuple[str, Counter[str]]:
    pool = sorted({cyclic_mask(n, s, t) for s in range(n) for t in TILES})
    pool = [g for g in pool if g.bit_count() >= 3]
    full = (1 << len(pool)) - 1
    through = [
        sum(1 << i for i, g in enumerate(pool) if g.bit_count() == 3 and g >> x & 1)
        for x in range(n)
    ]
    hits = [
        [
            (pair, sum(1 << i for i, h in enumerate(pool) if h & g and not h & pair))
            for pair in range(1 << n)
            if pair.bit_count() == 2 and pair & g == pair
        ]
        for g in pool
    ]
    pasches: dict[int, tuple[int, ...]] = {}
    if n == 6:
        index = {g: i for i, g in enumerate(pool)}
        for labels in permutations(range(6)):
            image = [relabel(g, labels) for g in PASCH]
            if all(g in index for g in image):
                code = sum(1 << index[g] for g in image)
                pasches.setdefault(code, labels)
    counts: Counter[str] = Counter()

    def search(lower: int, upper: int, indent: int) -> str:
        assert lower & upper == lower
        counts["nodes"] += 1
        pad = " " * indent
        for p, candidates in enumerate(through):
            if (lower & candidates).bit_count() >= 3:
                witnesses = [pool[i] for i in range(len(pool)) if lower & candidates & (1 << i)][:3]
                assert len(witnesses) == 3
                counts["triple"] += 1
                return pad + ".triple " + " ".join(finset(g) for g in witnesses) + f" {p}"
        for code, labels in pasches.items():
            if lower & code == code:
                counts["pasch"] += 1
                cases = " ".join(f"| {i} => {x}" for i, x in enumerate(labels[:-1]))
                return pad + f".pasch (fun i => match i.val with {cases} | _ => {labels[-1]})"
        for i, g in enumerate(pool):
            if lower >> i & 1:
                for pair, blockers in hits[i]:
                    if upper & blockers == 0:
                        x, y = [j for j in range(n) if pair >> j & 1]
                        counts["twoPoint"] += 1
                        return pad + f".twoPoint {finset(g)} {x} {y}"
        if upper == 0:
            counts["empty"] += 1
            return pad + ".empty"
        remaining = upper ^ lower
        assert remaining
        best: tuple[int, int] | None = None
        for i in range(len(pool)):
            if lower >> i & 1:
                for _, blockers in hits[i]:
                    if blockers & lower == 0:
                        pending = blockers & remaining
                        if pending and (best is None or pending.bit_count() < best[0]):
                            best = (pending.bit_count(), pending & -pending)
        bit = best[1] if best is not None else remaining & -remaining
        g = pool[bit.bit_length() - 1]
        absent = search(lower, upper ^ bit, indent + 2)
        present = search(lower | bit, upper, indent + 2)
        counts["split"] += 1
        return pad + f".split {finset(g)}\n{pad}(\n{absent})\n{pad}(\n{present})"

    tree = search(0, full, 2)
    source = f"""module

public import Conjectures.FranklSmallCyclicPools

@[expose] public section

/-! Generated exhaustive certificate for the literal period-{n} pool.
Reproduce with `generate_small_cyclic_lean.py`. The Python producer is not
trusted: `checked` is proved by Lean's kernel evaluator. -/

namespace FranklSmallCyclic.Period{n}

def tree : SearchTree (Fin {n}) :=
{tree}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked : check ∅ (generatorPool {n}) tree = true := by decide +kernel

theorem obstruction {{G : Finset (Finset (Fin {n}))}}
    (hspan : FranklSpanFour.CyclicSpanFour G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) : Obstruction G :=
  obstruction_of_pool_check tree checked hspan hlarge

end FranklSmallCyclic.Period{n}
"""
    return source, counts


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=Path(__file__).resolve().parents[2] / "lean" / "Conjectures")
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    for n in range(1, 7):
        source, counts = generate(n)
        destination = args.output / f"FranklSmallCyclicData{n}.lean"
        destination.write_text(source)
        print(n, dict(counts), destination)


if __name__ == "__main__":
    main()
