#!/usr/bin/env python3
"""Construct a realization; verify its box quotients for small graphs."""
from itertools import combinations, product
import sys

GADGET = {(x, y) for y, row in enumerate(("..##", ".###", "##..", "##.."))
          for x, cell in enumerate(row) if cell == "#"}
EX = (1, 0)
EY = (0, 1)


def add(a, b):
    return tuple(x + y for x, y in zip(a, b))


def sumset(a, b):
    return {add(x, y) for x in a for y in b}


def box(d, axes):
    axes = set(axes)
    return set(product(*[(0, 1) if i in axes else (0,) for i in range(d)]))


def construct(d, edges):
    missing = [pair for pair in combinations(range(d), 2) if pair not in edges]
    if not missing:
        return {x + (h, h) for x in box(d, range(d)) for h in (0, 1)}
    result = {x + (0, 0) for x in box(d, range(d))}
    for marker, (a, b) in enumerate(missing, 1):
        for x in box(d, set(range(d)) - {a, b}):
            for s, t in GADGET:
                y = list(x) + [1, marker]
                y[a], y[b] = s, t
                result.add(tuple(y))
    return result


def encode(points):
    base = 1 + 2 * max(max(p) for p in points)
    return sorted(sum(x * base**i for i, x in enumerate(p)) for p in points)


def erosion(x, u):
    return {c for c in x if all(add(c, a) in x for a in u)}


def check_local():
    for axis in (EX, EY):
        u = {(0, 0), axis}
        d = erosion(GADGET, u)
        assert sumset(d, u) == GADGET
        for q in d:
            assert sumset(d - {q}, u) != GADGET
    u = box(2, range(2))
    assert sumset(erosion(GADGET, u), u) < GADGET


def check_graph(d, edges):
    x = construct(d, edges)
    axes = set(range(d))
    for bits in product(range(2), repeat=d):
        j = {i for i, b in enumerate(bits) if b}
        u = box(d + 2, j)
        c = erosion(x, u)
        clique = all(pair in edges for pair in combinations(sorted(j), 2))
        assert (sumset(c, u) == x) == clique
        if clique:
            assert {p[:d] for p in c if not p[-2]} == box(d, axes - j)
            # Every admissible start has a witness; all quotients are unique.
            for q in c:
                assert any(
                    sum(tuple(y - a for y, a in zip(add(q, b), v)) in c
                        for v in u) == 1
                    for b in u
                )
    assert len(encode(x)) == len(x)


def main():
    if len(sys.argv) > 1:
        lengths = [int(x) for x in sys.argv[1:]]
        if min(lengths) < 2:
            raise SystemExit("All lengths must be integers at least two.")
        d = 0
        edges = set()
        for length in lengths:
            q = d + length - 1
            edges.update(combinations(range(d, q), 2))
            d = q
        print(encode(construct(d, edges)))
        return
    check_local()
    graphs = 0
    for d in range(1, 5):
        possible = list(combinations(range(d), 2))
        for bits in product(range(2), repeat=len(possible)):
            check_graph(d, {p for p, b in zip(possible, bits) if b})
            graphs += 1
    print(f"Local gadget and box divisors of {graphs} labeled graphs passed.")


if __name__ == "__main__":
    main()
