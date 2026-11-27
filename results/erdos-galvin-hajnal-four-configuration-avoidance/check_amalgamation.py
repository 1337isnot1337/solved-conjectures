#!/usr/bin/env python3
"""Finite checks of the local forcing operations for EGH 9/C.

The double pressing-down and forcing arguments are not computational.
"""
from collections import defaultdict
from itertools import combinations, product


def shadow(edges):
    return {p for e in edges for p in combinations(e, 2)}


def valid(vertices, edges):
    seen = {}
    for e in edges:
        for p in combinations(e, 2):
            if p in seen and (p != e[:2] or p != seen[p][:2]):
                return False
            seen[p] = e
    return all(
        e in edges for e in combinations(vertices, 3)
        if all(p in seen for p in combinations(e, 2))
    )


FORBIDDEN = {
    ((1, 1, 1), 0): "T1",
    ((2, 2, 2), 1): "T3",
    ((1, 2, 2), 1): "T4",
    ((1, 1, 2), 0): "T9",
}


def no_forbidden(edges):
    for a, b, c in combinations(map(set, edges), 3):
        pair_sizes = tuple(sorted((len(a & b), len(a & c), len(b & c))))
        assert (pair_sizes, len(a & b & c)) not in FORBIDDEN


def models(size, root_size):
    groups = defaultdict(list)
    vertices = tuple(range(size))
    choices = list(combinations(vertices, 3))
    for mask in range(1 << len(choices)):
        e = frozenset(p for j, p in enumerate(choices) if mask >> j & 1)
        if valid(vertices, e):
            sh = shadow(e)
            root_profile = (
                frozenset(t for t in e if max(t) < root_size),
                frozenset(p for p in sh if max(p) < root_size),
            )
            no_forbidden(e)
            groups[root_profile].append(e)
    return groups


def lift(edges, root_size, petal_index, petals):
    def ordinal(v):
        if v < root_size:
            return v
        # Interleave the petals, preserving the order on each one.
        return root_size + (v - root_size) * petals + petal_index
    return {tuple(map(ordinal, e)) for e in edges}


def check(size, root_size, petals):
    unions = extensions = 0
    root = set(range(root_size))
    vertices = tuple(range(root_size + petals * (size - root_size)))
    for group in models(size, root_size).values():
        for choice in product(group, repeat=petals):
            parts = [lift(e, root_size, i, petals) for i, e in enumerate(choice)]
            u = set().union(*parts)
            assert valid(vertices, u)
            no_forbidden(u)
            unions += 1
            for i, part in enumerate(parts):
                support = root | {v for v in vertices[root_size:]
                                  if (v - root_size) % petals == i}
                assert {e for e in u if set(e) <= support} == part
            if petals != 3:
                continue
            pairs = shadow(u)
            eligible = [
                [v for v in vertices[root_size:] if (v - root_size) % petals == i
                 and all((r, v) not in pairs for r in root)]
                for i in range(petals)
            ]
            for marks in product(*eligible):
                new = tuple(sorted(marks))
                assert all(p not in pairs for p in combinations(new, 2))
                w = u | {new}
                assert valid(vertices, w)
                no_forbidden(w)
                extensions += 1
    return unions, extensions


if __name__ == "__main__":
    results = [check(5, r, 2) for r in range(5)]
    results += [check(4, r, 3) for r in range(4)]
    print("free unions:", sum(a for a, _ in results))
    print("marked-triple extensions:", sum(b for _, b in results))
