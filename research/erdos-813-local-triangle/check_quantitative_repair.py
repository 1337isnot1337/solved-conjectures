#!/usr/bin/env python3
"""Small sanity audit of phase repair and its charges; not the asymptotic proof."""
from collections import Counter
from itertools import combinations, permutations
from random import Random

from screen_unital import secant_geometry


def majority(xs):
    return Counter(xs).most_common(1)[0][0]


def run(q, p, seed, corrupt):
    points, lines, pencils = secant_geometry(q)
    n = len(points)
    rng = Random(seed)
    # The nonabelian group S3, with (ab)(x)=a(b(x)).
    group = list(permutations(range(3)))
    identity = 0
    mul = [[group.index(tuple(a[i] for i in b)) for b in group] for a in group]
    inv = [row.index(identity) for row in mul]
    ps = [[] for _ in lines]
    for u, bundle in enumerate(pencils):
        for i in bundle:
            ps[i].append(u)
    retained = [i for i in range(len(lines)) if rng.random() < p]
    phases = [rng.randrange(6) for _ in points]
    labels, joins, f = {}, {}, {}
    nb = [set() for _ in points]
    for i in range(len(lines)):
        for u, v in combinations(ps[i], 2):
            assert (u, v) not in joins
            joins[u, v] = joins[v, u] = i
    for i in retained:
        a = rng.randrange(6)
        for u in ps[i]:
            labels[u, i] = mul[phases[u]][a]
            if rng.random() < corrupt:
                labels[u, i] = rng.randrange(6)
        for u, v in combinations(ps[i], 2):
            f[u, v] = mul[labels[u, i]][inv[labels[v, i]]]
            f[v, u] = inv[f[u, v]]
            nb[u].add(v)
            nb[v].add(u)

    def triangle(u, v, w):
        return tuple(sorted((u, v, w)))

    bad = {triangle(u, v, w) for u, v in combinations(range(n), 2) if v in nb[u]
           for w in nb[u] & nb[v] if w > v and
           mul[f[u, v]][f[v, w]] != f[u, w]}
    assert all(joins[u, v] != joins[u, w] for u, v, w in bad)
    F, minority, wall = {}, set(), Counter()
    roots = {}
    for u, v in combinations(range(n), 2):
        common = sorted(w for w in nb[u] & nb[v] if joins[u, w] != joins[u, v])
        assert common
        roots[u, v] = roots[v, u] = set(common)
        paths = {w: mul[f[u, w]][f[w, v]] for w in common}
        F[u, v] = majority(paths.values())
        F[v, u] = inv[F[u, v]]
        minority.update((u, v, w) for w in common if paths[w] != F[u, v])
        for root, opposite in [(u, v), (v, u)]:
            buckets = {}
            for w in common:
                buckets.setdefault(joins[root, w], []).append(w)
            for ws in buckets.values():
                for w, t in combinations(ws, 2):
                    k = triangle(opposite, w, t)
                    assert (paths[w] != paths[t]) == (k in bad)
                    if k in bad:
                        wall[k] += 1
    assert max(wall.values(), default=0) <= 3*(q-1)

    tri_bill, minor_bill = Counter(), Counter()
    costs = []
    tests_with_witness = 0
    for a in range(n):
        b = [identity if u == a else F[u, a] for u in range(n)]
        edge_cost = 0
        for u, v in combinations(range(n), 2):
            if v not in nb[u] or f[u, v] == mul[b[u]][inv[b[v]]]:
                continue
            edge_cost += 1
            if a in (u, v):
                cnt = sum(triangle(u, v, w) in bad for w in roots[u, v])
                assert cnt*2 >= len(roots[u, v])
                continue
            W = roots[a, u] & roots[a, v] & roots[u, v]
            tests_with_witness += bool(W)
            for w in W:
                cert = 0
                k = triangle(u, v, w)
                if k in bad:
                    tri_bill[k] += 1
                    cert += 1
                for x in (u, v):
                    m = (*sorted((a, x)), w)
                    if m in minority:
                        minor_bill[m] += 1
                        cert += 1
                assert cert
        repair = 0
        failed_pairs = 0
        for i in retained:
            buckets = Counter(mul[inv[b[u]]][labels[u, i]] for u in ps[i])
            repair += q+1-max(buckets.values())
            failed_pairs += ((q+1)**2-sum(v*v for v in buckets.values()))//2
        assert failed_pairs == edge_cost
        assert 2*failed_pairs >= (q+1)*repair
        costs.append(repair)
    pair_max = max(len(nb[u] & nb[v]) for u, v in combinations(range(n), 2))
    assert max(tri_bill.values(), default=0) <= 3*max(map(len, nb))
    assert max(minor_bill.values(), default=0) <= 2*pair_max
    if not corrupt:
        assert not bad and min(costs) == 0
    return len(retained), len(bad), len(minority), min(costs), tests_with_witness


if __name__ == "__main__":
    for q in (3, 5):
        for i, (p, corrupt) in enumerate([(1, 0), (1, 0.12), (.82, 0), (.84, .58)]):
            print(q, p, corrupt, run(q, p, 104*q+i, corrupt), flush=True)
