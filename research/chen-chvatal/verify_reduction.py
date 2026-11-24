#!/usr/bin/env python3
"""Exact finite checks for the aspect-ratio-two Chen-Chvatal reduction.

No external packages, numerical tolerances, solvers, or graph databases.
This verifies finite branches of the proof in README.md, not the full
Chen-Chvatal conjecture.
"""
from collections import Counter
from itertools import combinations, permutations
from math import comb


def extend(adj, mask):
    n = len(adj)
    return tuple(a | (((mask >> i) & 1) << n)
                 for i, a in enumerate(adj)) + (mask,)


def complement(adj):
    full = (1 << len(adj)) - 1
    return tuple(full ^ (a | (1 << i)) for i, a in enumerate(adj))


def lines(short, long):
    result = set()
    for i, j in combinations(range(len(short)), 2):
        mask = (1 << i) | (1 << j)
        if short[i] >> j & 1:
            mask |= (short[i] & long[j]) | (long[i] & short[j])
        elif long[i] >> j & 1:
            mask |= short[i] & short[j]
        result.add(mask)
    return result


def direct_lines(short, long):
    """Independent check by triangle labels, using sets."""
    n = len(short)
    def label(i, j):
        if short[i] >> j & 1:
            return 1
        if long[i] >> j & 1:
            return 2
        return 3  # represents any strictly intermediate distance
    result = {(i, j): {i, j} for i, j in combinations(range(n), 2)}
    for i, j, k in combinations(range(n), 3):
        if sorted((label(i, j), label(i, k), label(j, k))) == [1, 1, 2]:
            result[i, j].add(k)
            result[i, k].add(j)
            result[j, k].add(i)
    return {sum(1 << v for v in s) for s in result.values()}


def lines12(adj):
    return lines(adj, complement(adj))


def binary_levels():
    """Enumerate all labeled 1-2 spaces with at most seven lines."""
    levels = {1: [(0,)]}
    for n in range(2, 9):
        nxt = []
        for a in levels[n-1]:
            for mask in range(1 << (n-1)):
                b = extend(a, mask)
                L = lines12(b)
                if len(L) <= 7:
                    assert L == direct_lines(b, complement(b))
                    nxt.append(b)
        levels[n] = nxt
    expected = [2, 8, 64, 355, 1225, 1050, 945]
    assert [len(levels[n]) for n in range(2, 9)] == expected
    h = {n: min(len(lines12(a)) for a in levels[n])
         for n in range(2, 9)}
    assert [h[n] for n in range(2, 9)] == [1, 1, 1, 4, 4, 7, 7]
    # Previously proved 1-2 conjecture, checked here for the small sizes.
    for n in range(2, 9):
        for a in levels[n]:
            L = lines12(a)
            assert len(L) >= n or (1 << n)-1 in L
    print("binary levels:", expected)
    print("binary minima:", h)
    # Base of the unconditional >=n bound for n >= 9.
    checked = 0
    min_count = comb(9, 2)
    for a in levels[8]:
        for v in range(8):
            # Need a long neighbor other than the new twin.
            if a[v].bit_count() == 7:
                continue
            b = extend(a, a[v])
            L = lines12(b)
            assert L == direct_lines(b, complement(b))
            assert len(L) >= 9
            checked += 1
            min_count = min(min_count, len(L))
    assert checked == 7560 and min_count == 10
    print("nine-point twin extensions:", checked, "minimum:", min_count)
    return levels, h


def orbit(adj):
    n = len(adj)
    edges = [(i, j) for i, j in combinations(range(n), 2)
             if adj[i] >> j & 1]
    for p in permutations(range(n)):
        b = [0]*n
        for i, j in edges:
            b[p[i]] |= 1 << p[j]
            b[p[j]] |= 1 << p[i]
        yield tuple(b)


def representatives(adjs):
    pending = set(adjs)
    result = []
    while pending:
        a = min(pending)
        result.append(a)
        pending.difference_update(orbit(a))
    return result


def midgraphs(m, t):
    result = []
    for edges in combinations(list(combinations(range(t), 2)), m):
        a = [0]*t
        for i, j in edges:
            a[i] |= 1 << j
            a[j] |= 1 << i
        if all(a):  # exactly the nonisolated vertices of the mid graph
            result.append(tuple(a))
    return representatives(result)


def check_case(Y, M):
    """Exclude a minimum counterexample with this clean and mid graph."""
    s, t = len(Y), len(M)
    n = s+t
    prescribed = [(s+i, s+j) for i, j in combinations(range(t), 2)
                  if M[i] >> j & 1]
    counts = Counter()

    def visit(A, B):
        r = len(A)
        L = lines(A, B)
        assert L == direct_lines(A, B)
        full = (1 << r)-1
        counts[r, "visited"] += 1
        future_mid = sum(j >= r for i, j in prescribed)
        overlap = sum((full ^ (1 << x)) in L for x in range(s, r))
        if r < n and full in L:
            overlap += 1
        lower = len(L) + future_mid + t - overlap
        if lower >= n:
            return
        counts[r, "passed"] += 1
        if r == n:
            # A genuine minimum counterexample must have all these lines.
            assert full in L or any((full ^ (1 << x)) not in L
                                    for x in range(s, n)), (A, B, L)
            return
        mid = (M[r-s] & ((1 << (r-s))-1)) << s
        extreme = full ^ mid
        a = extreme
        while True:
            # All assignments of short versus long on the non-mid edges.
            visit(extend(A, a), extend(B, extreme ^ a))
            if a == 0:
                break
            a = (a-1) & extreme

    visit(Y, complement(Y))
    return counts


def main():
    levels, h = binary_levels()
    Yreps = {s: representatives([a for a in levels[s]
                                 if len(lines12(a)) < s])
             for s in range(2, 9)}
    assert [len(Yreps[s]) for s in range(2, 9)] == [2, 1, 1, 4, 2, 0, 2]
    total = Counter()
    cases = 0
    for s in range(2, 9):
        for Y in Yreps[s]:
            for m in range(1, s-len(lines12(Y))+1):
                assert m <= 3
                for t in range(2, 2*m+1):
                    assert s+t <= 10
                    for M in midgraphs(m, t):
                        total.update(check_case(Y, M))
                        cases += 1
    visited = sum(v for (r, k), v in total.items() if k == "visited")
    assert cases == 25 and visited == 1533
    print("aspect-ratio-two reduced cases:", cases)
    print("search nodes:", visited)
    print("all finite checks passed")


if __name__ == "__main__":
    main()
