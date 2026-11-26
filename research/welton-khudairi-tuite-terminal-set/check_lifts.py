#!/usr/bin/env python3
"""Exact finite regression for the terminal-set transfer theorems."""
from collections import deque
from itertools import combinations, product
from random import Random


def distances(g):
    matrix = []
    for x in range(len(g)):
        d = [-1] * len(g)
        d[x] = 0
        q = deque([x])
        while q:
            u = q.popleft()
            for v in g[u]:
                if d[v] < 0:
                    d[v] = d[u] + 1
                    q.append(v)
        if min(d) < 0:
            return None
        matrix.append(d)
    return matrix


def terminal_sets(d):
    n = len(d)
    forbidden = []
    witnesses = [[] for _ in range(n)]
    for x, a, b in combinations(range(n), 3):
        for m, u, v in [(x, a, b), (a, x, b), (b, x, a)]:
            if d[u][v] == d[u][m] + d[m][v]:
                forbidden.append((1 << x) | (1 << a) | (1 << b))
                witnesses[u].append((1 << m) | (1 << v))
                witnesses[v].append((1 << m) | (1 << u))
    ret = set()
    for s in range(1, 1 << n):
        if any(s & f == f for f in forbidden):
            continue
        if all(s >> x & 1 or any(s & f == f for f in witnesses[x]) for x in range(n)):
            ret.add(s)
    return ret


def all_graphs(n):
    edges = list(combinations(range(n), 2))
    for mask in range(1 << len(edges)):
        g = [set() for _ in range(n)]
        for b, (u, v) in enumerate(edges):
            if mask >> b & 1:
                g[u].add(v)
                g[v].add(u)
        yield g


def maximal_cliques(g):
    n = len(g)
    ret = set()
    for mask in range(1, 1 << n):
        s = [x for x in range(n) if mask >> x & 1]
        if all(v in g[u] for u, v in combinations(s, 2)):
            if all((mask >> x & 1) or not all(x in g[u] for u in s) for x in range(n)):
                ret.add(mask)
    return ret


def verify(q, qs, modules):
    starts = [0]
    for h in modules:
        starts.append(starts[-1] + len(h))
    g = [set() for _ in range(starts[-1])]
    for v, h in enumerate(modules):
        off = starts[v]
        for x in range(len(h)):
            g[off + x].update(off + y for y in h[x])
            for w in q[v]:
                g[off + x].update(range(starts[w], starts[w + 1]))
    clique, terminal = [], []
    for h in modules:
        clique.append(maximal_cliques(h))
        terminal.append(terminal_sets([
            [0 if i == j else 1 if j in h[i] else 2 for j in range(len(h))]
            for i in range(len(h))
        ]))
    expected = set()
    for s in qs:
        occupied = [x for x in range(len(q)) if s >> x & 1]
        choices = [
            clique[x] if any(s >> y & 1 for y in q[x]) else terminal[x]
            for x in occupied
        ]
        expected.update(sum(t << starts[x] for x, t in zip(occupied, ts))
                        for ts in product(*choices))
    assert terminal_sets(distances(g)) == expected


def gated_regression(g, qs, rng):
    h = [set(xs) for xs in g]
    for _ in range(3):
        parent = rng.randrange(len(h))
        h[parent].add(len(h))
        h.append({parent})
    assert qs <= terminal_sets(distances(h))


def main():
    rng = Random(869)
    pool = [list(all_graphs(k)) for k in range(1, 4)]
    tests = gates = 0
    for n in range(2, 5):
        for g in all_graphs(n):
            d = distances(g)
            if d is None:
                continue
            qs = terminal_sets(d)
            gated_regression(g, qs, rng)
            gates += 1
            for trial in range(10):
                modules = [rng.choice(rng.choice(pool)) for _ in g]
                verify(g, qs, modules)
                tests += 1
    print(f"Exact terminal-set equality verified on {tests} modular substitutions.")
    print(f"Unchanged terminal-set transfer verified on {gates} gated extensions.")


if __name__ == "__main__":
    main()
