#!/usr/bin/env python3
"""Exact rational diagnostic for the forest coupling theorem (not its proof)."""
from collections import defaultdict
from fractions import Fraction as F
from itertools import combinations, permutations
from math import lcm


def identity(n):
    return [[F(i == j) for j in range(n)] for i in range(n)]


def multiply(a, b):
    n = len(a)
    return [[sum(a[i][k] * b[k][j] for k in range(n)) for j in range(n)] for i in range(n)]


def determinant(a):
    # Bareiss elimination over integers, with exact divisions and pivoting.
    a = [list(row) for row in a]
    n = len(a)
    if not n:
        return 1
    sign, prev = 1, 1
    for k in range(n - 1):
        p = next((p for p in range(k, n) if a[p][k]), None)
        if p is None:
            return 0
        if p != k:
            a[k], a[p] = a[p], a[k]
            sign = -sign
        pivot = a[k][k]
        for i in range(k + 1, n):
            for j in range(k + 1, n):
                num = a[i][j] * pivot - a[i][k] * a[k][j]
                assert num % prev == 0
                a[i][j] = num // prev
            a[i][k] = 0
        prev = pivot
    return sign * a[-1][-1]


def birkhoff(local):
    d = len(local)
    a = [[x * x for x in row] for row in local]
    out = []
    while any(x for row in a for x in row):
        p = next(p for p in permutations(range(d)) if all(a[p[j]][j] > 0 for j in range(d)))
        weight = min(a[p[j]][j] for j in range(d))
        out.append((p, weight))
        for j in range(d):
            a[p[j]][j] -= weight
    assert sum(w for _, w in out) == 1
    return out


def rotation(a, b, c):
    return [[F(a, c), F(-b, c)], [F(b, c), F(a, c)]]


def householder(v):
    d = len(v)
    q = sum(x * x for x in v)
    return [[F(i == j) - F(2 * v[i] * v[j], q) for j in range(d)] for i in range(d)]


def check(n, factors):
    u = identity(n)
    law = {tuple(range(n)): F(1)}
    # Check the actual incidence forest by incremental union-find.
    parent = list(range(n + len(factors)))
    def root(x):
        while parent[x] != x:
            x = parent[x]
        return x
    for t, (support, local) in enumerate(factors):
        assert len(support) == len(set(support)) == len(local) <= 3
        for v in support:
            a, b = root(v), root(n + t)
            assert a != b, 'not an incidence forest'
            parent[a] = b
        assert multiply(local, list(map(list, zip(*local)))) == identity(len(local))
        step = identity(n)
        for i, v in enumerate(support):
            for j, w in enumerate(support):
                step[v][w] = local[i][j]
        u = multiply(step, u)
        nxt = defaultdict(F)
        for lp, w in birkhoff(local):
            q = list(range(n))
            for j, v in enumerate(support):
                q[v] = support[lp[j]]
            for p, old in law.items():
                nxt[tuple(q[p[j]] for j in range(n))] += w * old
        law = nxt
    assert sum(law.values()) == 1 and all(w >= 0 for w in law.values())
    assert multiply(u, list(map(list, zip(*u)))) == identity(n)
    denom = lcm(*(x.denominator for row in u for x in row))
    ui = [[int(x * denom) for x in row] for row in u]
    checks = 0
    for k in range(n + 1):
        subsets = list(combinations(range(n), k))
        for j in subsets:
            probs = defaultdict(F)
            for p, w in law.items():
                probs[tuple(sorted(p[v] for v in j))] += w
            for i in subsets:
                d = determinant([[ui[v][w] for w in j] for v in i])
                assert F(d*d, denom**(2*k)) == probs[i], (k, i, j)
                checks += 1
    print(f'n={n}, local factors={len(factors)}, permutations={len(law)}, exact minor checks={checks}')


if __name__ == '__main__':
    check(7, [((2,3,4), householder((1,2,3))), ((0,1,2), householder((1,2,2))),
              ((4,5), rotation(5,12,13)), ((1,6), rotation(3,4,5))])
    check(6, [((0,3), rotation(3,4,5)), ((0,1), rotation(5,12,13)),
              ((0,5), rotation(8,15,17)), ((0,2), rotation(7,24,25)),
              ((0,4), rotation(20,21,29))])
