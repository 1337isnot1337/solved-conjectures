"""Reproduce the vertex counts using exact tree DP and explicit clique enumeration."""

from itertools import combinations
from math import comb


def tree_with_levels(d):
    adjacent = [[]]
    levels = [[0]]
    for children in (d, 3, 2, 2):
        level = []
        for parent in levels[-1]:
            for _ in range(children):
                child = len(adjacent)
                adjacent.append([parent])
                adjacent[parent].append(child)
                level.append(child)
        levels.append(level)
    return adjacent, levels


def product(left, right):
    out = [0] * (len(left) + len(right) - 1)
    for i, a in enumerate(left):
        for j, b in enumerate(right):
            out[i + j] += a * b
    return out


def star_at(adjacent, vertex, rank):
    # Root the original tree at the proposed center and force it present.
    def visit(v, parent):
        absent, present = [1], [0, 1]
        for w in adjacent[v]:
            if w == parent:
                continue
            off, on = visit(w, v)
            total = [0] * max(len(off), len(on))
            for i, a in enumerate(off):
                total[i] += a
            for i, b in enumerate(on):
                total[i] += b
            absent = product(absent, total)
            present = product(present, off)
        return absent, present

    _, present = visit(vertex, -1)
    return present[rank] if rank < len(present) else 0


def check_tree(d):
    graph, levels = tree_with_levels(d)
    rank = 15 * d - 1
    top = comb(15 * d, 2) + 6 * d
    expected = (top, 0, top - 2, 1, top - 1)
    for level, count in zip(levels, expected, strict=True):
        assert {star_at(graph, v, rank) for v in level} == {count}
    assert sum(len(group) for group in levels) == 22 * d + 1
    assert 2 not in {len(neighbors) for neighbors in graph}
    print(f"d={d}, n={len(graph)}, r={rank}, star counts by level={expected}")


def check_fixed_rank():
    # Build H explicitly, then count every triangle by its actual vertices.
    r, leaves, separate = 3, 20, 18
    core = 2 * r
    graph = [set() for _ in range(core + leaves + separate)]
    for u, v in combinations(range(len(graph)), 2):
        if u < core and v < core + leaves or u >= core + leaves:
            graph[u].add(v)
            graph[v].add(u)
    counts = [0] * len(graph)
    for triple in combinations(range(len(graph)), r):
        if all(v in graph[u] for u, v in combinations(triple, 2)):
            for vertex in triple:
                counts[vertex] += 1
    degrees = [len(graph) - 1 - len(row) for row in graph]
    winners = [v for v, count in enumerate(counts) if count == max(counts)]
    assert counts == [110] * core + [15] * leaves + [136] * separate
    assert winners == list(range(core + leaves, len(graph)))
    assert min(degrees[v] for v in winners) - min(degrees) == len(graph) - 2 * separate
    print(f"fixed rank={r}, graph order={len(graph)}, star counts by class=110,15,136")


if __name__ == "__main__":
    for degree in (3, 4, 7):
        check_tree(degree)
    check_fixed_rank()
