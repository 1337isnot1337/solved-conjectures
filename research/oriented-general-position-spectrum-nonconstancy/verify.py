#!/usr/bin/env python3
"""Check the two constructed orientations on every labeled graph through n=6.

This is a regression check, not a premise of the proof.
"""
from collections import deque
from itertools import combinations, permutations
import argparse


def make_witnesses(n, edges, adj):
    seed = next((i for i in range(n) if len(adj[i]) >= 2), None)
    free = set(range(n))
    blocks = []
    if seed is not None:
        a, b = sorted(adj[seed])[:2]
        p = deque((a, seed, b))
        free.difference_update(p)
    else:
        p = deque()
    while p or free:
        if not p:
            v = min(free)
            free.remove(v)
            p.append(v)
        for side in (0, -1):
            while extra := adj[p[side]] & free:
                v = min(extra)
                free.remove(v)
                if side == 0:
                    p.appendleft(v)
                else:
                    p.append(v)
        blocks.append(list(p))
        p.clear()

    coordinates = {v: (i, j) for i, block in enumerate(blocks)
                   for j, v in enumerate(block)}
    S = {a for block in blocks for a in (block[0], block[-1])}
    internal = next(iter(set(range(n)) - S), None)
    T = S | ({internal} if internal is not None else set())
    low, high = [], []
    for u, v in edges:
        i, x = coordinates[u]
        j, y = coordinates[v]
        forward = i < j if i != j else (x < y) == (abs(x-y) == 1)
        low.append((u, v) if forward else (v, u))
        if (u in T) != (v in T):
            forward = v in T
        elif internal in (u, v):
            forward = u == internal
        elif u in S and v in S and ((internal in adj[u]) != (internal in adj[v])):
            forward = internal in adj[v]
        else:
            forward = True
        high.append((u, v) if forward else (v, u))
    return low, high, len(S), T


def bad_triples(n, arcs):
    inf = n + 1
    out = [[] for _ in range(n)]
    for u, v in arcs:
        out[u].append(v)
    distances = []
    for root in range(n):
        d = [inf] * n
        d[root] = 0
        q = deque([root])
        while q:
            u = q.popleft()
            for v in out[u]:
                if d[v] == inf:
                    d[v] = d[u] + 1
                    q.append(v)
        distances.append(d)
    return {(1 << u) | (1 << v) | (1 << w)
            for u, v, w in permutations(range(n), 3)
            if distances[u][w] < inf
            and distances[u][w] == distances[u][v] + distances[v][w]}


def check(n):
    possible = list(combinations(range(n), 2))
    separated = constant = 0
    masks = {k: [sum(1 << i for i in S) for S in combinations(range(n), k)]
             for k in range(n + 2)}
    for g in range(1 << len(possible)):
        edges = [e for i, e in enumerate(possible) if g & (1 << i)]
        adj = [set() for _ in range(n)]
        for u, v in edges:
            adj[u].add(v)
            adj[v].add(u)
        low, high, b, T = make_witnesses(n, edges, adj)
        triples = bad_triples(n, low)
        assert all(any(t & mask == t for t in triples) for mask in masks[b+1]), (n, g, "low")
        tmask = sum(1 << i for i in T)
        assert not any(t & tmask == t for t in bad_triples(n, high)), (n, g, "high")
        if any(len(a) >= 2 for a in adj):
            assert len(T) == b + 1
            separated += 1
        else:
            assert not triples and len(T) == b == n
            constant += 1
    return separated, constant


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--max-n", default=6, type=int)
    args = p.parse_args()
    total = [0, 0]
    for n in range(args.max_n + 1):
        a, b = check(n)
        total[0] += a
        total[1] += b
        print(f"n={n}: {a} separated, {b} matching/isolates")
    print(f"{sum(total)} labeled graphs passed: {total[0]} separated, {total[1]} matching/isolates")


if __name__ == "__main__":
    main()
