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


if __name__ == "__main__":
    with Path(__file__).with_name("certificate.json").open() as file:
        verify(load(file))
