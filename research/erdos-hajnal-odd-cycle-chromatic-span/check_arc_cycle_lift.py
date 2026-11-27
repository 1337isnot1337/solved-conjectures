"""Finite replay of the lift, not a proof of random Hamiltonicity."""
from collections import Counter, defaultdict
from random import Random


def adj(e, f):
    return e[1] == f[0] or f[1] == e[0]


def example(m, rng, short_edge):
    # Labels include part indices so orientation is independent of order in Y.
    core = [(3 + rng.randrange(5), i) for i in range(m)]
    rng.shuffle(core)
    groups = defaultdict(list)
    for u in core:
        groups[u[0]].append(u)
    core_edges = defaultdict(list)
    for u in core:
        for later, points in sorted(groups.items()):
            if later > u[0] and rng.random() < 0.75:
                core_edges[u].append((u, rng.choice(points)))

    visits = []
    allocated = set()
    counters = Counter()

    def fresh(part):
        counters[part] += 1
        return part, counters[part]

    def travel(nodes):
        for u, v in zip(nodes, nodes[1:]):
            assert u[0] != v[0]
            e = (u, v) if u[0] < v[0] else (v, u)
            assert e not in allocated
            allocated.add(e)
            yield e

    for i, u in enumerate(core):
        v = core[(i + 1) % m]
        a, b = fresh(1), fresh(2)
        if i == short_edge:
            points = [u, a, b, v]
        else:
            points = [u, a, b, fresh(1), v]
        visits.extend(zip(points, travel(points)))

    cycle = []
    for i, (center, after) in enumerate(visits):
        before = visits[i - 1][1]
        if center[0] == 1:
            filler = [(fresh(0), center)]
        elif center[0] == 2:
            filler = [(center, fresh(8))] if before[1] == after[1] else []
        else:
            outgoing = core_edges[center] or [(center, fresh(8))]
            filler = [outgoing[0]]
            for e in outgoing[1:]:
                filler.extend([(fresh(0), center), e])
        cycle.extend(filler + [after])

    assert len(cycle) == len(set(cycle))
    assert len(cycle) % 2 == 1
    assert all(adj(cycle[i - 1], e) for i, e in enumerate(cycle))
    assert all(e[0][0] < e[1][0] for e in cycle)
    assert set(e for outgoing in core_edges.values() for e in outgoing) <= set(cycle)
    # A used base vertex is never asked to make two distinct choices in a part.
    distinct_targets = {(u, v[0]) for u, v in cycle}
    assert len(distinct_targets) == len(cycle)
    return len(cycle)


def main():
    rng = Random(640)
    ncases = 2500
    visits = sum(example(m, rng, rng.randrange(m)) for m in
                 (rng.randrange(3, 100) for _ in range(ncases)))
    print(f"{ncases} cyclic lifts, {visits} arc vertices, fixed seed 640")


if __name__ == "__main__":
    main()
