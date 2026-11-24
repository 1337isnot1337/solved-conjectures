#!/usr/bin/env python3
"""Exact sanity checks on all labelled three-element preorders."""
from collections import Counter
from itertools import permutations, product
from math import comb


def relations(n):
    pairs = [(i, j) for i in range(n) for j in range(n) if i != j]
    for bits in product([False, True], repeat=len(pairs)):
        d = dict(zip(pairs, bits))
        R = [[i == j or d[i, j] for j in range(n)] for i in range(n)]
        if all(not (R[i][j] and R[j][k]) or R[i][k]
               for i, j, k in product(range(n), repeat=3)):
            yield R


def poset_points(R):
    n = len(R)
    ideals = []
    for bits in product([False, True], repeat=n):
        J = [i for i in range(n) if bits[i]]
        if J and all((not R[i][j]) or bits[i] for i in range(n) for j in J):
            ideals.append(J)
    return [a for a in product(range(n + 1), repeat=n)
            if all(sum(a[i] for i in J) <= len(J) for J in ideals)]


def support(a):
    return tuple(i for i, v in enumerate(a) if v)


def q_zeta(P, n):
    target = Counter()
    for a in P:
        if sum(a) == n:
            target[support(a)] += (-1)**n
    actual = Counter()
    for a in P:
        if max(a) > 2:
            continue
        ones = [i for i in range(n) if a[i] == 1]
        twos = {i for i in range(n) if a[i] == 2}
        for mask in product([False, True], repeat=len(ones)):
            T = twos | {i for i, bit in zip(ones, mask) if bit}
            actual[tuple(sorted(T))] += (-1)**len(ones)
    assert actual == target


def reciprocal_support(P, n):
    lhs = Counter((sum(a)-len(support(a)), len(support(a))) for a in P)
    rhs = Counter()
    for a in P:
        s, e = len(support(a)), sum(a)-len(support(a))
        j = n-s-e
        for u in range(j+1):
            for v in range(j-u+1):
                rhs[s+u,e+v] += (-1)**u * comb(j,u) * comb(j-u,v)
    assert lhs == rhs


def polar_map(R, z):
    n = len(R)
    a = [max([0] + [z[j] for j in range(n) if R[i][j]]) for i in range(n)]
    b = [a[i] - max([0] + [a[j] for j in range(n)
                           if R[i][j] and not R[j][i]]) for i in range(n)]

    def rebuild(i):
        return b[i] + max([0] + [rebuild(j) for j in range(n)
                                  if R[j][i] and not R[i][j]])
    astar = [rebuild(i) for i in range(n)]
    ans = tuple(z[i] + astar[i] - a[i] for i in range(n))
    return ans, max(a)+sum(a)-sum(z)


def polar_hstar(R):
    n = len(R)
    # Each polytope generator has coordinates in [-1,1].
    pts = []
    for m in range(n+1):
        pts.append(sum(polar_map(R,z)[1]<=m for z in product(range(-m,m+1),repeat=n)))
    exact = [sum((-1)**j*comb(n+1,j)*pts[i-j] for j in range(i+1)) for i in range(n+1)]

    pending = set(range(n))
    classes = []
    while pending:
        i = min(pending)
        c = {j for j in pending if R[i][j] and R[j][i]}
        classes.append(c)
        pending -= c
    rep = [min(c) for c in classes]
    formula = [0]*(n+1)
    for selected in product([False,True],repeat=len(classes)):
        S = [i for i,w in enumerate(selected) if w]
        lin = [p for p in permutations(S)
               if all(not R[rep[j]][rep[i]] for k,i in enumerate(p) for j in p[k+1:])]
        natural = {v:i for i,v in enumerate(lin[0])}
        for ext in lin:
            desc = sum(natural[i]>natural[j] for i,j in zip(ext,ext[1:]))
            for j in product(*(range(len(classes[i])) for i in S)):
                formula[len(S)-desc+sum(j)] += 1
    assert formula == exact


if __name__ == '__main__':
    n = 3
    count = 0
    for R in relations(n):
        P = poset_points(R)
        q_zeta(P, n)
        reciprocal_support(P, n)
        polar_hstar(R)
        RT = list(zip(*R))
        for z in product(range(-2, 3), repeat=n):
            zs, gauge = polar_map(R, z)
            zr, reverse_gauge = polar_map(RT, zs)
            assert zr == z and gauge == reverse_gauge
        count += 1
    print('Exact checks passed:', count, 'labelled preorders, three elements.')
