#!/usr/bin/env python3
"""Exact check of the six-color overlap proof, allowing incomplete components."""

from itertools import combinations


def main():
    m = 6
    edge_list = tuple(combinations(range(m), 2))
    R = {0, 1, 2}
    pairs = [sum(1 << x for x in e) for e in edge_list]
    all_colors = (1 << m) - 1
    h_full = (1 << len(edge_list)) - 1
    middle = tuple(i for i, e in enumerate(edge_list) if set(e) <= R)
    k33 = sum(1 << i for i, (a, b) in enumerate(edge_list) if (a in R) != (b in R))
    valid = []
    for complement in range(h_full + 1):
        if any(complement >> i & 1 for i in middle):
            continue
        adj = [[] for _ in range(m)]
        for i, (a, b) in enumerate(edge_list):
            if complement >> i & 1:
                adj[a].append(b)
                adj[b].append(a)
        bit = [None] * m
        okay = True
        for start in range(m):
            if bit[start] is not None:
                continue
            bit[start] = 0
            todo = [start]
            for a in todo:
                for b in adj[a]:
                    if bit[b] is None:
                        bit[b] = 1 - bit[a]
                        todo.append(b)
                    elif bit[a] == bit[b]:
                        okay = False
            if sum(bit[x] for x in todo) > 3 or sum(not bit[x] for x in todo) > 3:
                okay = False
        if okay:
            valid.append(complement)
    leftover = {
        (i, j): pairs.index(all_colors ^ p ^ q)
        for i, p in enumerate(pairs)
        for j, q in enumerate(pairs) if not p & q
    }
    exceptions = []
    for A in valid:
        covered = 0
        for j in middle:
            for i in range(len(pairs)):
                if not A >> i & 1 and (i, j) in leftover:
                    covered |= 1 << leftover[i, j]
        for B in valid:
            if not (covered & (h_full ^ B)):
                exceptions.append((A, B))
    assert exceptions == [(k33, k33)]
    print(f"{len(valid):,} legal row complements for a fixed active triple; "
          f"{len(valid) ** 2:,} ordered pairs; the only exception is matching K3,3 cuts.")


if __name__ == "__main__":
    main()
