#!/usr/bin/env python3
"""Finite invariant replays only. No finite check proves a cardinal claim."""
from collections import Counter
from itertools import combinations, product
from random import Random


def chromatic_at_most(n, edges, k):
    return any(all(c[i] != c[j] for i, j in edges)
               for c in product(range(k), repeat=n))


def check_profiles():
    count = 0
    for n in range(2, 5):
        pairs = tuple(combinations(range(n), 2))
        for directions in product((0, 1, 2), repeat=len(pairs)):
            edges = [(i, j) if d == 1 else (j, i)
                     for (i, j), d in zip(pairs, directions) if d]
            for k in range(1, n):
                if chromatic_at_most(n, edges, k):
                    continue
                for masks in product(range(1, 1 << k), repeat=n):
                    incoming = [0] * n
                    for u, w in edges:
                        incoming[w] |= masks[u]
                    assert any(masks[u] & ~incoming[u] == 0
                               for u in range(n))
                    count += 1
    print(f"profile-coverage configurations: {count}")


def greedy_case(adj, lists):
    rng = range(len(adj))
    avail = list(map(set, lists))
    colors, missing = [], []
    skips = forced = 0
    for v in rng:
        a = min(avail[v])
        danger = set()
        for w, alpha in adj[v].items():
            if w < v and colors[w] == a:
                danger.add(alpha)
            if w > v and avail[w] == {a}:
                danger.add(alpha)
                touched = [u for u in range(v)
                           if adj[u].get(w) == missing[u]]
                assert len({colors[u] for u in touched} &
                           (set(lists[w]) - {a})) == len(lists[w]) - 1
                skips += 1
        label = next(i for i in range(len(danger) + 1) if i not in danger)
        for w, alpha in adj[v].items():
            if w > v and alpha == label and a in avail[w]:
                avail[w].remove(a)
                assert avail[w]
                forced += 1
        colors.append(a)
        missing.append(label)
    assert all(colors[v] in lists[v] for v in rng)
    assert all(colors[v] != colors[w] or alpha != missing[v]
               for v in rng for w, alpha in adj[v].items())
    return skips, forced


def check_greedy():
    r = Random(35124)
    trials = skips = forced = 0
    for k in range(1, 6):
        for _ in range(240):
            n = r.randrange(3, 75)
            adj = [{} for _ in range(n)]
            for u, v in combinations(range(n), 2):
                if r.random() < 0.15:
                    adj[u][v] = adj[v][u] = r.randrange(1, 8) - 1
            lists = [r.sample(range(k + 4), k) for _ in range(n)]
            s, f = greedy_case(adj, lists)
            skips += s
            forced += f
            trials += 1
    assert skips and forced
    print(f"greedy list cases: {trials}; saturation checks: {skips}; active bans: {forced}")


def finite_transfer(n, edges, k, q):
    """Fixed finite-palette shadow; orient edges by the given order."""
    fibers = []
    lift = []
    lift_edges = []
    for w in range(n):
        incoming = [v for u in range(w) if (u, w) in edges for v in fibers[u]]
        current = []
        for amount in range(1, k + 1):
            for roots in combinations(incoming, amount):
                for labels in product(range(q), repeat=amount):
                    target = len(lift)
                    current.append(target)
                    lift.append(w)
                    lift_edges += [(u, target, a) for u, a in zip(roots, labels)]
        if not current:
            current.append(len(lift))
            lift.append(w)
        fibers.append(current)
    return lift, lift_edges


def sat_formula(order, edges, q):
    # Boolean vertex colors x_v, and Boolean missing-label choices z_(v,j).
    # (a) At least one label must be chosen at every vertex.
    # (b) If a label is chosen, no incident edge of that label may be monochromatic.
    z = lambda v, j: order + 1 + q * v + j
    formula = [tuple(z(v, j) for j in range(q)) for v in range(order)]
    formula.append((1,))  # Swap the color names if needed.
    for u, v, j in edges:
        for w in (u, v):
            formula.extend([(-z(w, j), u + 1, v + 1),
                            (-z(w, j), -(u + 1), -(v + 1))])
    return formula


def dpll(formula):
    while True:
        if not formula:
            return True
        if any(not clause for clause in formula):
            return False
        units = {c[0] for c in formula if len(c) == 1}
        if not units:
            break
        if any(-l in units for l in units):
            return False
        formula = [tuple(l for l in c if -l not in units)
                   for c in formula if not units.intersection(c)]
    short = min(map(len, formula))
    votes = Counter(abs(l) for c in formula if len(c) == short for l in c)
    var = max(votes, key=votes.get)
    return dpll(formula + [(var,)]) or dpll(formula + [(-var,)])


def check_lifts():
    # A short acyclic ordering of the pentagon: original vertices 0,2,1,3,4.
    cycle = {(0, 2), (2, 1), (1, 3), (3, 4), (4, 0)}
    cycle = {tuple(sorted(e)) for e in cycle}
    assert not chromatic_at_most(5, cycle, 2)
    for q in (1, 2, 3):
        lift, edges = finite_transfer(5, cycle, 2, q)
        adj = [set() for _ in lift]
        for u, v, _ in edges:
            assert tuple(sorted((lift[u], lift[v]))) in cycle
            adj[u].add(v)
            adj[v].add(u)
        for v in range(len(lift)):
            assert sum(u < v for u in adj[v]) <= 2
            assert all(not (adj[u] & adj[v]) for u in adj[v])
        assert not dpll(sat_formula(len(lift), edges, q)), "avoidance unexpectedly SAT"
        print(f"pentagon transfer palette {q}: {len(lift)} vertices, no avoiding two-colouring")
    path = cycle - {(0, 4)}
    assert chromatic_at_most(5, path, 2)
    lift, edges = finite_transfer(5, path, 2, 2)
    assert dpll(sat_formula(len(lift), edges, 2)), "planted bipartite control unexpectedly UNSAT"
    print("bipartite control: an avoiding two-colouring exists")


if __name__ == "__main__":
    check_profiles()
    check_greedy()
    check_lifts()
