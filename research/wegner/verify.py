#!/usr/bin/env python3
"""Exact checks of the two dense-triangle extension mechanisms."""

from collections import defaultdict
from itertools import combinations


def add_edge(graph, left, right):
    graph[left].add(right)
    graph[right].add(left)


def add_bundle(graph, left, right, size):
    interiors = [f"{left}-{right}-{index}" for index in range(size)]
    for vertex in interiors:
        add_edge(graph, left, vertex)
        add_edge(graph, vertex, right)
    return interiors


def check_square_coloring(graph, colors, limit):
    for vertex, color in colors.items():
        assert 1 <= color <= limit
        conflicts = graph[vertex].union(*(graph[neighbor] for neighbor in graph[vertex]))
        for other in conflicts.intersection(colors) - {vertex}:
            assert colors[other] != color, (vertex, other, color)


def available_union(forbidden, limit):
    palette = set(range(1, limit + 1))
    return set().union(*(palette - (left | right) for left, right in combinations(forbidden, 2)))


def check_cyclic_precoloring():
    graph = defaultdict(set)
    multiplicity = 104
    left = add_bundle(graph, "u", "v", multiplicity)
    middle = add_bundle(graph, "u", "w", multiplicity)
    right = add_bundle(graph, "v", "w", multiplicity)
    for label in ("u", "v", "w"):
        add_edge(graph, label, label.upper())
    degree = max(map(len, graph.values()))
    limit = 3 * degree // 2 + 1
    assert degree == 209 and degree >= 32 + 176

    base = {"u": 1, "v": 2, "w": 3, "U": 2, "V": 3, "W": 1}
    check_square_coloring(graph, base, limit)
    cyclic_forbidden = ({1, 2}, {2, 3}, {3, 1})
    assert len(available_union(cyclic_forbidden, limit)) == 3 * multiplicity - 1

    base.update({"U": 4, "V": 4, "W": 4})
    base[left[0]] = 3
    base[middle[0]] = 2
    uncolored = left[1:] + middle[1:] + right
    base.update(zip(uncolored, range(5, limit + 1), strict=True))
    assert base.keys() == graph.keys()
    check_square_coloring(graph, base, limit)


def check_triple_occurrence():
    graph = defaultdict(set)
    multiplicity = 120
    left = add_bundle(graph, "u", "v", multiplicity - 1)
    middle = add_bundle(graph, "u", "w", multiplicity - 1)
    right = add_bundle(graph, "v", "w", multiplicity + 1)
    exterior, = add_bundle(graph, "u", "t", 1)
    add_edge(graph, "u", "v")
    add_edge(graph, "u", "w")
    degree = max(map(len, graph.values()))
    limit = 3 * degree // 2 + 1
    assert degree == 241 and degree >= 64 + 176

    forbidden = ({1, 2, 3, 4}, {1, 2}, {1, 3})
    assert len(available_union(forbidden, limit)) == len(left + middle + right)
    colors = {"u": 1, "v": 2, "w": 3, "t": 5, exterior: 4, right[0]: 4}
    uncolored = left + middle + right[1:]
    colors.update(zip(uncolored, range(5, limit + 1), strict=True))
    assert colors.keys() == graph.keys()
    check_square_coloring(graph, colors, limit)


if __name__ == "__main__":
    check_cyclic_precoloring()
    check_triple_occurrence()
    print("Wegner mixed subdivisions: cyclic obstruction, repair and tight Hall case passed")
