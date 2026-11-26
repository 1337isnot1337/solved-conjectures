#!/usr/bin/env python3
"""Audit the exact oriented-tree formula against directed distances.

The default covers all labeled trees through order five. Add --atlas for
all orientations of nonisomorphic trees through order nine (uses NetworkX).
Neither oracle uses the five-state recurrence.
"""
from collections import deque
from functools import lru_cache
from itertools import combinations, product
from random import Random
import sys


def solve_tree(n, arcs, weights=None, k=2, root=0):
    """Return optimum and a witness, in O(kn) arithmetic operations."""
    w = [1] * n if weights is None else weights
    labels = [(a, a) for a in range(k + 1)] + [(a, a + 1) for a in range(k)]
    adj = [[] for _ in range(n)]
    for x, y in arcs:
        adj[x].append((y, True))
        adj[y].append((x, False))
    parent = [-1] * n
    order, children = [root], [[] for _ in range(n)]
    for x in order:
        for y, outgoing in adj[x]:
            if y != parent[x]:
                parent[y] = x
                order.append(y)
                children[x].append((y, outgoing))
    scores = [None] * n
    choices = [None] * n
    for x in reversed(order):
        scores[x] = [w[x] * (b - a) for a, b in labels]
        choices[x] = [[] for _ in labels]
        for y, outgoing in children[x]:
            side = [None] * (k + 1)
            for i, (a, b) in enumerate(labels):
                d = a if outgoing else b
                candidate = (scores[y][i], i)
                if side[d] is None or candidate > side[d]:
                    side[d] = candidate
            inner = range(k - 1, -1, -1) if outgoing else range(1, k + 1)
            for d in inner:
                side[d] = max(side[d], side[d + (1 if outgoing else -1)])
            for i, (a, b) in enumerate(labels):
                score, index = side[b if outgoing else a]
                scores[x][i] += score
                choices[x][i].append(index)
    idx = max(range(len(labels)), key=scores[root].__getitem__)
    recover = [(root, idx)]
    mask = 0
    for x, i in recover:
        a, b = labels[i]
        if b > a:
            mask |= 1 << x
        recover.extend((y, j) for (y, _), j in zip(children[x], choices[x][i]))
    return scores[root][idx], mask


def directed_oracle(n, arcs):
    """All directed distances via BFS, and geodesic masks via equalities."""
    adj = [[] for _ in range(n)]
    for x, y in arcs:
        adj[x].append(y)
    dist = [[n] * n for _ in range(n)]
    for x in range(n):
        dist[x][x] = 0
        todo = deque([x])
        while todo:
            y = todo.popleft()
            for z in adj[y]:
                if dist[x][z] == n:
                    dist[x][z] = 1 + dist[x][y]
                    todo.append(z)
    paths = set()
    for x in range(n):
        for y, d in enumerate(dist[x]):
            if d < n:
                paths.add(sum(1 << z for z in range(n)
                              if dist[x][z] + dist[z][y] == d))
    return paths, dist


@lru_cache(maxsize=None)
def descending_masks(n):
    return sorted(range(1 << n), key=int.bit_count, reverse=True)


def brute(paths, n, weights=None, k=2):
    paths = [p for p in paths if p.bit_count() > k]
    if weights is None:
        return next(s.bit_count() for s in descending_masks(n)
                    if all((s & p).bit_count() <= k for p in paths))
    return max(sum(weights[i] for i in range(n) if s & (1 << i))
               for s in range(1 << n)
               if all((s & p).bit_count() <= k for p in paths))


def chain_partition(dist, n, k=2):
    chains = [s for s in range(1, 1 << n)
              if all(dist[x][y] < n or dist[y][x] < n
                     for x, y in combinations(
                         (i for i in range(n) if s & (1 << i)), 2))]
    by_vertex = [[c for c in chains if c & (1 << i)] for i in range(n)]

    @lru_cache(maxsize=None)
    def dp(s):
        if not s:
            return 0
        first = (s & -s).bit_length() - 1
        return min(min(k, c.bit_count()) + dp(s ^ c)
                   for c in by_vertex[first] if s & c == c)
    return dp((1 << n) - 1)


def labeled_tree_edges(n):
    if n == 1:
        yield []
        return
    for word in product(range(n), repeat=n - 2):
        degree = [1] * n
        for x in word:
            degree[x] += 1
        edges = []
        for x in word:
            y = next(i for i in range(n) if degree[i] == 1)
            edges.append((x, y))
            degree[x] -= 1
            degree[y] -= 1
        edges.append(tuple(i for i in range(n) if degree[i] == 1))
        yield edges


def main(atlas=False):
    if atlas:
        import networkx as nx
    seed = Random(918)
    tested = dual = weighted = 0
    for n in range(1, 10 if atlas else 6):
        batch = 0
        trees = ((list(t.edges) for t in nx.nonisomorphic_trees(n))
                 if atlas and n >= 2 else labeled_tree_edges(n))
        for e in trees:
            for flips in range(1 << len(e)):
                arcs = [(v, u) if flips & (1 << j) else (u, v)
                        for j, (u, v) in enumerate(e)]
                paths, dist = directed_oracle(n, arcs)
                want = brute(paths, n)
                got, witness = solve_tree(n, arcs, root=(tested % n))
                assert got == want == witness.bit_count(), (n, arcs, want, got)
                assert all((witness & p).bit_count() <= 2 for p in paths)
                if n <= 7:
                    assert chain_partition(dist, n) == want
                    dual += 1
                if flips % 29 == 0:
                    w = [seed.randrange(-7, 10) for _ in range(n)]
                    for k in (1, 2, 3, 4):
                        got, witness = solve_tree(n, arcs, w, k, seed.randrange(n))
                        assert got == brute(paths, n, w, k)
                        assert all((witness & p).bit_count() <= k for p in paths)
                        assert got == sum(w[i] for i in range(n) if witness & (1 << i))
                        weighted += 1
                tested += 1
                batch += 1
        print(n, batch, flush=True)
    print("orientation instances:", tested, "dual certificates:", dual,
          "weighted instances:", weighted)


if __name__ == "__main__":
    main("--atlas" in sys.argv[1:])
