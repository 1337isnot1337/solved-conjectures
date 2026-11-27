#!/usr/bin/env python3
"""Check the explicit counterexample; Python standard library only."""

from collections import Counter
from itertools import combinations
from json import load
from pathlib import Path

V = set(range(11))
PAIRS = set(combinations(sorted(V), 2))


def pair(u, v):
    assert u != v
    return min(u, v), max(u, v)


def verify(factors):
    assert len(factors) == 5
    colors = {}
    shadow = set()
    for color, factor in enumerate(factors):
        assert set().union(*map(set, factor)) == V
        assert sum(map(len, factor)) == len(V)
        for cycle in factor:
            assert len(cycle) >= 3
            for i, u in enumerate(cycle):
                edge = pair(u, cycle[(i + 1) % len(cycle)])
                assert edge not in colors
                colors[edge] = color
                shadow.add(pair(u, cycle[(i + 2) % len(cycle)]))
    assert set(colors) == PAIRS
    assert len(shadow) == 24
    groups = ((0, 8), (2, 6, 9), (3, 4, 7), (1, 5), (10,))
    group_of = {v: i for i, group in enumerate(groups) for v in group}
    assert all((group_of[u] - group_of[v]) % 5 in (1, 4) for u, v in shadow)
    assert all(
        not {pair(a, b), pair(a, c), pair(b, c)} <= shadow
        for a, b, c in combinations(V, 3)
    )

    base_edges = PAIRS - shadow
    configurations = list(sorted(PAIRS))
    token_edge_count = 0
    for first, second in combinations(configurations, 2):
        moved = tuple(sorted(set(first) ^ set(second)))
        if moved in base_edges:
            token_edge_count += 1
            assert colors[first] != colors[second]
    assert token_edge_count == 9 * len(base_edges)

    # A second exact check: the row at zero is a five-coloring of G-0.
    row = {u: colors[pair(0, u)] for u in V - {0}}
    assert Counter(row.values()) == {c: 2 for c in range(5)}
    assert all(row[u] != row[v] for u, v in base_edges if u and v)

    print(f"{len(PAIRS)} configurations, {len(base_edges)} base edges, "
          f"{token_edge_count} token adjacencies; all checks passed.")


def round_robin(m, i, j):
    assert m >= 2 and not m % 2 and i != j
    if m - 1 in (i, j):
        return min(i, j)
    return ((i + j) * (m // 2)) % (m - 1)


def verify_joins(factors):
    shadow, token = set(), {}
    for color, factor in enumerate(factors):
        for cycle in factor:
            for i, u in enumerate(cycle):
                token[pair(u, cycle[(i + 1) % len(cycle)])] = color
                shadow.add(pair(u, cycle[(i + 2) % len(cycle)]))
    witness_labels = {v: token[pair(0, v)] for v in range(1, 11)}
    witness_labels[0] = 5
    for m, j in ((2, 1), (2, 2), (4, 1), (4, 4), (8, 2)):
        vertices = [(i, v) for i in range(m) for v in range(11 if i < j else 6)]
        def base(u, v):
            return u[0] != v[0] or u[0] >= j or pair(u[1], v[1]) not in shadow
        def label(u):
            return witness_labels[u[1]] if u[0] < j else u[1]
        def color(u, v):
            i, a = u
            k, b = v
            if i == k:
                return token[pair(a, b)] if i < j else round_robin(6, a, b)
            return 5 + 6 * round_robin(m, i, k) + (label(u) + label(v)) % 6
        assert len(vertices) == 6 * m + 5 * j
        assert len({color(u, v) for u, v in combinations(vertices, 2)}) == 6 * m - 1
        for u, v in combinations(vertices, 2):
            if base(u, v):
                for w in vertices:
                    if w not in (u, v):
                        assert color(u, w) != color(v, w)
        print(f"Join with {len(vertices)} vertices: all token adjacencies passed.")


if __name__ == "__main__":
    with Path(__file__).with_name("certificate.json").open() as file:
        factors = load(file)
    verify(factors)
    verify_joins(factors)
