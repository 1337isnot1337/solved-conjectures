#!/usr/bin/env python3
"""Compare switch circuit formula with connected components of explicit lifts."""
from collections import defaultdict
from itertools import permutations
from random import Random


def cycle_count(p):
    unseen = set(p)
    count = 0
    while unseen:
        v = next(iter(unseen))
        count += 1
        while v in unseen:
            unseen.remove(v)
            v = p[v]
    return count


def fixture(orders):
    # All given copies lie on the left shore. Fill every interval with a
    # private right-shore copy. Distinct switch pairs use disjoint rim edges.
    h = 2 * len(orders)
    visits = defaultdict(list)
    pi = {}
    ext = []
    for j, order in enumerate(orders):
        for i, v in enumerate(order):
            y = ("right", j, i)
            w = order[(i + 1) % len(order)]
            visits[v].append(j)
            visits[y].append(j)
            pi[(v, j)] = (y, j)
            pi[(y, j)] = (w, j)
            ext.extend([((v, 2*j), (y, 2*j)), ((y, 2*j+1), (w, 2*j+1))])
    graph = defaultdict(set)

    def add(a, b):
        assert b not in graph[a]
        graph[a].add(b)
        graph[b].add(a)

    assert h >= 4
    sigma = {}
    for x, switches in visits.items():
        for v in range(h):
            if v % 2 or v // 2 not in switches:
                add((x, v), (x, (v+1) % h))
        ss = sorted(switches, reverse=not isinstance(x, int))
        for i, j in enumerate(ss):
            sigma[(x, j)] = (x, ss[(i+1) % len(ss)])
    for a, b in ext:
        add(a, b)
    assert len(graph) == len(visits) * h and all(len(s) == 2 for s in graph.values())
    unseen = set(graph)
    count = 0
    while unseen:
        queue = [unseen.pop()]
        count += 1
        while queue:
            for w in graph[queue.pop()] & unseen:
                unseen.remove(w)
                queue.append(w)
    assert count == cycle_count({x: sigma[y] for x, y in pi.items()})
    return count


def main():
    pairs = 0
    for r in range(2, 8):
        for order in permutations(range(1, r)):
            a = tuple(range(r))
            b = (0,) + order
            q = dict(zip(b, b[1:] + b[:1]))
            expect = cycle_count({v: q[(v+1) % r] for v in a})
            assert fixture([a, b]) == expect
            pairs += 1
    assert fixture([(0, 1, 2, 3, 4), (0, 1, 2, 4, 3)]) == 3
    assert fixture([(0, 1, 2, 3, 4), (3, 4, 2, 1, 0)]) == 3

    rng = Random(642)
    steps = 0
    for _ in range(96):
        orders = [list(range(6))]
        outside = 6
        for _ in range(6):
            shared = rng.sample(range(outside), rng.choice([1, 3]))
            p = shared + [outside, outside+1]
            outside += 2
            rng.shuffle(p)
            valid = [u for u in [p, p[::-1]] if fixture(orders + [u]) == 1]
            assert valid
            orders.append(valid[0])
            steps += 1
    print(f"Checked {pairs} two-switch order fixtures and {steps} incremental splices")


if __name__ == "__main__":
    main()
