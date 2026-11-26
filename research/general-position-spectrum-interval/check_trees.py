#!/usr/bin/env python3
"""Independent vertex-subset regression for tree spectra and the 9-state DP."""

from itertools import combinations, permutations, product
import random

INVALID = -1
STATES = tuple((s, i, o) for s in range(2)
               for i in range(s, 3) for o in range(s, 3) if i + o - s <= 2)
INDEX = {state: k for k, state in enumerate(STATES)}
ROOT = tuple(0 if x == (0, 0, 0) else (1 if x == (1, 1, 1) else INVALID)
             for x in STATES)


def merge(parent, child, incoming):
    out = [INVALID] * len(STATES)
    for (s, i, o), size in zip(STATES, parent):
        if size == INVALID:
            continue
        for (_, a, b), other in zip(STATES, child):
            if other == INVALID:
                continue
            v = (s, max(i, s + a), o) if incoming else (s, i, max(o, s + b))
            if v in INDEX:
                k = INDEX[v]
                out[k] = max(out[k], size + other)
    return tuple(out)


def tree_structure(n, edges):
    adj = [[] for _ in range(n)]
    for i, (x, y) in enumerate(edges):
        adj[x].append((y, i, False))
        adj[y].append((x, i, True))
    return adj


def tables(adj, mask=None):
    def visit(v, parent):
        found = {ROOT}
        for u, edge, first_is_child in adj[v]:
            if u != parent:
                choices = (False, True) if mask is None else (
                    first_is_child ^ bool(mask >> edge & 1),)
                below = visit(u, v)
                found = {merge(p, c, inc) for p in found for c in below for inc in choices}
        return found

    return visit(0, None)


def brute(n, edges, mask):
    arcs = [[] for _ in range(n)]
    for i, (x, y) in enumerate(edges):
        if mask >> i & 1:
            x, y = y, x
        arcs[x].append(y)
    dist = []
    for x in range(n):
        row = [-1] * n
        row[x] = 0
        todo = [x]
        for y in todo:
            for z in arcs[y]:
                if row[z] < 0:
                    row[z] = row[y] + 1
                    todo.append(z)
        dist.append(row)
    bad = []
    for tr in combinations(range(n), 3):
        for a, b, c in permutations(tr):
            if dist[a][b] > 0 and dist[b][c] > 0 and dist[a][b] + dist[b][c] == dist[a][c]:
                bad.append(sum(1 << x for x in tr))
                break
    return max(m.bit_count() for m in range(1 << n) if all(m & tri != tri for tri in bad))


def prufer(word, n):
    deg = [1] * n
    for x in word:
        deg[x] += 1
    edges = []
    for x in word:
        y = next(i for i, d in enumerate(deg) if d == 1)
        edges.append((x, y))
        deg[x] -= 1
        deg[y] -= 1
    edges.append(tuple(i for i, d in enumerate(deg) if d == 1))
    return edges


def main():
    rng = random.Random(878)
    trees = 0
    orientations = 0
    for n in range(2, 10):
        words = (list(product(range(n), repeat=n - 2)) if n <= 5 else
                 [tuple(rng.randrange(n) for _ in range(n - 2)) for _ in range(25)])
        for word in words:
            edges = prufer(word, n)
            adj = tree_structure(n, edges)
            actual = set()
            for mask in range(1 << (n - 1)):
                value = brute(n, edges, mask)
                assert value == max(next(iter(tables(adj, mask))))
                actual.add(value)
                orientations += 1
            assert actual == {max(t) for t in tables(adj)}
            assert actual == set(range(min(actual), n + 1))
            trees += 1
    print(f"Compared exact scores and complete spectra for {trees:,} trees, "
          f"{orientations:,} orientations.")


if __name__ == "__main__":
    main()
