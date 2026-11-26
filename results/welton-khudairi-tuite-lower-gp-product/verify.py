#!/usr/bin/env python3
"""Exact graph and shortest-path checks for the written counterexample."""
from collections import deque
from itertools import combinations


def distances(g, root):
    d = {root: 0}
    q = deque([root])
    while q:
        x = q.popleft()
        for y in g[x]:
            if y not in d:
                d[y] = d[x] + 1
                q.append(y)
    assert len(d) == len(g)
    return d


def general_position(points, d):
    for a,b,c in combinations(points, 3):
        sides = (d[a][b], d[b][c], d[a][c])
        if sum(sides) == 2 * max(sides):
            return False
    return True


def graph_h(m):
    n = 6 * (m+1)
    owner = {j: (j-6)//m for j in range(6, n)}
    h = {i:set() for i in range(n)}
    for a,b in combinations(h, 2):
        edge = (b//2-a//2 <= 1) if b<6 else (a>=6 or a==owner[b])
        if edge:
            h[a].add(b)
            h[b].add(a)
    return h, owner


def verify(m):
    h, owner = graph_h(m)
    d = {v:distances(h, v) for v in h}
    assert max(max(r.values()) for r in d.values()) == 2

    # A pair of adjacent metric twins cannot be split by a maximal GP set:
    # a new twin either substitutes into a prior triple or forms (1,d,d).
    classes = [[v for v in owner if owner[v]==p] for p in range(6)]
    for block in classes:
        assert len(block)==m
        for a,b in combinations(block, 2):
            assert d[a][b]==1
            assert all(d[a][x]==d[b][x] for x in h if x not in (a,b))

    # Thus only the following supports are candidates of size less than m.
    small_supports = 0
    for size in range(7):
        for s in combinations(range(6), size):
            if general_position(s, d):
                small_supports += 1
                assert any(x not in s and general_position((*s,x), d) for x in h)

    # Build the product by its adjacency rule, then BFS, without using the
    # additive distance identity or the written terminal-witness prescription.
    p = {}
    for i in range(m):
        for v in h:
            p[i,v] = {(i,w) for w in h[v]} | {(j,v) for j in range(m) if i!=j}
    s = tuple((v//2,v) for v in range(6))
    root_d = {a:distances(p, a) for a in s}
    assert general_position(s,root_d)
    for x in p:
        if x not in s:
            assert any(abs(root_d[a][x]-root_d[b][x])==root_d[a][b]
                       for a,b in combinations(s,2))
    print(f"M={m}: tested {small_supports} potentially small factor supports, "
          f"all {len(p)-6} outside product vertices have endpoint witnesses")


if __name__ == "__main__":
    for m in (7, 8, 11, 15):
        verify(m)
