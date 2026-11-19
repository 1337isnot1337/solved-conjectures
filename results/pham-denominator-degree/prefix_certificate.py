#!/usr/bin/env python3
"""Finite prefix-polynomial certificate for the two length-ten necklaces.

This checks finite polynomial arithmetic only. The correspondence with the
infinite reverse forest and finite solitaire orbits is a separate Lean proof.
"""

from __future__ import annotations

import argparse
from functools import lru_cache
import json
from pathlib import Path

Polynomial = tuple[int, ...]
Head = tuple[int, ...]


def add(a: Polynomial, b: Polynomial) -> Polynomial:
    return tuple((a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
                 for i in range(max(len(a), len(b))))


def multiply(a: Polynomial, b: Polynomial) -> Polynomial:
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return tuple(out)


def shift(a: Polynomial) -> Polynomial:
    return (0,) + a


def choices(a: Head, offset: int):
    for j, value in enumerate(a):
        if value >= j + offset and (j == 0 or value != a[j - 1] + 1):
            child = tuple(v + 1 for v in a[:j]) + a[j + 1:]
            yield j, child, value - j - 1


dead_rows: dict[tuple[Head, int], Polynomial] = {}
prefix_rows: dict[tuple[Head, int], tuple[Polynomial, Polynomial]] = {}


@lru_cache(None)
def dead_poly(a: Head, offset: int) -> Polynomial:
    result = (1,)
    for _, child, child_offset in choices(a, offset):
        result = add(result, shift(dead_poly(child, child_offset)))
    dead_rows[a, offset] = result
    return result


def free_poly(a: Head) -> Polynomial:
    return dead_poly(a, -len(a))


@lru_cache(None)
def prefix_polys(a: Head, offset: int) -> tuple[Polynomial, Polynomial]:
    first = (1,)
    second = shift(free_poly(a)) if len(a) + offset <= 0 else (0,)
    for _, child, child_offset in choices(a, offset):
        child_first, child_second = prefix_polys(child, child_offset)
        first = add(first, shift(child_first))
        second = add(second, shift(child_second))
    prefix_rows[a, offset] = first, second
    return first, second


def certificate(word: str):
    bits = tuple(map(int, word))
    assert bits[:2] == (0, 0) and bits[-1] == 1
    roots = []
    total_first: Polynomial = ()
    total_second: Polynomial = ()
    for phase in range(len(bits)):
        head = () if phase == 0 else bits[phase:]
        offset = bits[(phase - 1) % len(bits)] - 1
        first, second = prefix_polys(head, offset)
        roots.append({"phase": phase, "head": head, "offset": offset,
                      "first": first, "second": second})
        total_first = add(total_first, first)
        total_second = add(total_second, second)
    root_first = tuple(roots[1]["first"])
    root_second = tuple(roots[1]["second"])
    denominator = add((1,), tuple(-c for c in root_second))
    numerator = multiply((1, -1),
                         add(multiply(total_first, denominator),
                             multiply(total_second, root_first)))
    return {"word": word, "roots": roots, "first_sum": total_first,
            "second_sum": total_second, "denominator": denominator,
            "numerator": numerator}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", type=Path)
    args = parser.parse_args()
    primary = certificate("0001001011")
    dual = certificate("0010110111")
    common = (1, 0, 0, 0, 0, 0, -1, -8, -28, -48, -36)
    primary_reduced = (10, 4, 10, 8, -14, -34, 14, 2)
    extra_factor = (1, 0, 0, 1, 4, 6)
    dual_numerator = (10, 5, 12, 20, 32, 58, 97, 92, -46, -227, -161, 90, 18)
    assert primary["denominator"] == common == dual["denominator"]
    assert primary["numerator"] == multiply(primary_reduced, extra_factor)
    assert dual["numerator"] == dual_numerator
    data = {
        "primary": primary,
        "dual": dual,
        "dead_rows": [{"head": a, "offset": s, "coefficients": coeff}
                      for (a, s), coeff in sorted(dead_rows.items(),
                                                 key=lambda item: (len(item[0][0]), item[0]))],
        "prefix_rows": [{"head": a, "offset": s, "first": first, "second": second}
                        for (a, s), (first, second) in sorted(prefix_rows.items(),
                                                            key=lambda item: (len(item[0][0]), item[0]))],
    }
    if args.json:
        args.json.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
    print(f"Checked {len(dead_rows)} terminal states and {len(prefix_rows)} prefix states.")
    print("Common denominator:", common)
    print("Primary numerator:", primary["numerator"])
    print("Dual numerator:", dual["numerator"])


if __name__ == "__main__":
    main()
