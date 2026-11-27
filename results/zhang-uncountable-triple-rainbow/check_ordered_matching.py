#!/usr/bin/env python3
"""Check the finite ordered-matching rule. The strong colouring input is not tested."""

from collections import defaultdict
from itertools import combinations, product
from random import Random


def colour_by_matching(n, instructions):
    triples = list(combinations(range(n), 3))
    assigned = {}
    for (a, b), requested in instructions.items():
        if requested is not None:
            u, v = requested
            if v < a:
                for t in ((u, a, b), (v, a, b)):
                    assert t not in assigned
                    assigned[t] = ("matched", a, b)
    return {t: assigned.get(t, ("singleton", *t)) for t in triples}


def check(n, instructions):
    colours = colour_by_matching(n, instructions)
    fibres = defaultdict(list)
    for t, label in colours.items():
        fibres[label].append(t)
    observed = set()
    for fibre in fibres.values():
        assert 1 <= len(fibre) <= 2
        if len(fibre) == 2:
            (u, a, b), (v, aa, bb) = sorted(fibre)
            assert (a, b) == (aa, bb) and u < v < a < b
            observed.add((u, v, a, b))

    # Independently read the formula for every possible ordered four-vertex pattern.
    expected = {
        (u, v, a, b)
        for u, v, a, b in combinations(range(n), 4)
        if instructions.get((a, b)) == (u, v)
    }
    assert observed == expected

    # Appending common larger vertices leaves each per-tail fibre at most two.
    for arity in range(4, min(n, 6) + 1):
        seen = defaultdict(int)
        for s in combinations(range(n), arity):
            key = (s[3:], colours[s[:3]])
            seen[key] += 1
            assert seen[key] <= 2


def exhaustive():
    n = 6
    keys = list(combinations(range(n), 2))
    options = [[None, *combinations(range(a), 2)] for a, _ in keys]
    count = 0
    for values in product(*options):
        check(n, dict(zip(keys, values)))
        count += 1
    return count


def seeded():
    rnd = Random(1087)
    for _ in range(5000):
        n = rnd.randrange(4, 12)
        pairs = list(combinations(range(n), 2))
        choose = [None, *pairs]
        check(n, {p: rnd.choice(choose) for p in pairs})
    return 5000


if __name__ == "__main__":
    print(f"OK: {exhaustive()} exhaustive instructions; {seeded()} seeded cases")
