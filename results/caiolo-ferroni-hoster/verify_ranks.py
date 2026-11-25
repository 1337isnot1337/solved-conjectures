#!/usr/bin/env python3
"""Exact check of RANKS.md for ranks 5..R (default 8). Needs SymPy for part 1 only.

Part 1  degrees and leading coefficients of gamma_0, gamma_1, gamma_2 as polynomials in q
Part 2  exact Sturm root counts at specific prime powers
Part 3  the shuffle formula for flag h-vectors, against direct flag counts
"""
import sys
from fractions import Fraction
from functools import lru_cache
from itertools import combinations, permutations
from math import comb, factorial, gcd
from functools import reduce


def subsets(S):
    for j in range(len(S) + 1):
        yield from combinations(S, j)


def stable(S):
    return all(b - a > 1 for a, b in zip(S, S[1:]))


def gammas(alpha, r):
    """(gamma of H*, gamma of F*) from flag counts alpha(S), by CFH Theorem 4.9."""
    R = tuple(range(1, r))
    def beta(S):
        return sum(((-1) ** (len(S) - len(T)) * alpha(T) for T in subsets(S)), 0 * alpha(()))
    g = [0 * alpha(())] * ((r - 1) // 2 + 1)
    h = [0 * alpha(())] * (r // 2 + 1)
    for S in subsets(R):
        if stable(S):
            v = beta(tuple(i for i in R if i not in S))
            h[len(S)] = h[len(S)] + v
            if r - 1 not in S:
                g[len(S)] = g[len(S)] + v
    return g, h


def make_alpha(r, q, one, gauss, choose_m, b):
    """Flag counts of the rank-r coalesced matroid, k=r-1, V=F_q^(2k), m=q^k, b=q^(k^2)."""
    k = r - 1
    @lru_cache(None)
    def A(d, t, S):                      # product of subspaces of F_q^d and subsets of [t]
        if not S:
            return one
        s = S[-1]
        return sum((gauss(d, i) * comb(t, s - i) * A(i, s - i, S[:-1])
                    for i in range(max(0, s - t), min(d, s) + 1)), 0 * one)
    @lru_cache(None)
    def alpha(S):
        if not S:
            return one
        s, T = S[-1], S[:-1]
        v = sum((gauss(2 * k, i) * choose_m(s - i) * A(i, s - i, T) for i in range(s + 1)), 0 * one)
        if s == k:
            v = v + b * (A(k, 1, T) - A(k, 0, T) - gauss(k, k - 1) * A(k - 1, 1, T))
        return v
    return alpha


def numeric(r, q):
    k = r - 1
    @lru_cache(None)
    def gauss(d, i):
        if not 0 <= i <= d: return 0
        n = e = 1
        for j in range(i):
            n *= q ** (d - j) - 1; e *= q ** (j + 1) - 1
        return n // e
    return gammas(make_alpha(r, q, 1, gauss, lambda t: comb(q ** k, t), q ** (k * k)), r)


def expand(g, n):
    p = [0] * (n + 1)
    for j, c in enumerate(g):
        for i in range(n - 2 * j + 1):
            p[i + j] += c * comb(n - 2 * j, i)
    return p


def sturm(p):
    """number of distinct real roots, exact"""
    def prim(a):
        c = abs(reduce(gcd, a)); return [x // c for x in a]
    p = list(p)
    while p[-1] == 0: p.pop()
    seq = [prim(p), prim([i * c for i, c in enumerate(p)][1:])]
    while len(seq[-1]) > 1:
        a, b = seq[-2][:], seq[-1]
        while len(a) >= len(b):
            l, kk, s = abs(b[-1]), a[-1] * (1 if b[-1] > 0 else -1), len(a) - len(b)
            a = [x * l for x in a]
            for i in range(len(b)): a[i + s] -= kk * b[i]
            a.pop()
        while a and a[-1] == 0: a.pop()
        if not a: break
        seq.append([-x for x in prim(a)])
    var = lambda L: sum(x * y < 0 for x, y in zip(L, L[1:]))
    return var([f[-1] * (-1) ** (len(f) - 1) for f in seq]) - var([f[-1] for f in seq])


def symbolic(r):
    import sympy as sp
    Q = sp.Symbol('q'); P = lambda e: sp.Poly(e, Q, domain=sp.QQ); k = r - 1
    @lru_cache(None)
    def gauss(d, i):
        if not 0 <= i <= d: return P(0)
        if d == 0: return P(1)
        return gauss(d - 1, i - 1) + P(Q ** i) * gauss(d - 1, i)
    @lru_cache(None)
    def choose_m(t):
        o = P(1)
        for j in range(t): o = o * P(Q ** k - j)
        return o.quo_ground(factorial(t))
    return gammas(make_alpha(r, Q, P(1), gauss, choose_m, P(Q ** (k * k))), r)


def part3():
    """beta of (subspaces of F_q^d) x (subsets of [t]) = sum over shuffles of q^inv(u)."""
    for q, d, t in ((2, 3, 1), (2, 2, 2), (3, 3, 2), (2, 4, 1), (3, 2, 3)):
        n = d + t
        def gauss(a, i):
            if not 0 <= i <= a: return 0
            x = y = 1
            for j in range(i): x *= q ** (a - j) - 1; y *= q ** (j + 1) - 1
            return x // y
        def A(a, s, S):
            if not S: return 1
            c = S[-1]
            return sum(gauss(a, i) * comb(s, c - i) * A(i, c - i, S[:-1]) for i in range(c + 1))
        direct = {S: sum((-1) ** (len(S) - len(T)) * A(d, t, T) for T in subsets(S))
                  for S in subsets(tuple(range(1, n)))}
        sh = dict.fromkeys(direct, 0)
        for w in permutations(range(n)):      # letters <d : subspace part, >=d : free part
            u = [x for x in w if x < d]
            inv = sum(u[i] > u[j] for i in range(d) for j in range(i + 1, d))
            sh[tuple(i + 1 for i in range(n - 1) if w[i] > w[i + 1])] += q ** inv
        assert sh == direct, (q, d, t)
    print('part 3: shuffle formula agrees with direct flag counts')


if __name__ == '__main__':
    top = int(sys.argv[1]) if len(sys.argv) > 1 else 8
    assert sturm([2, -3, 1]) == 2 and sturm([1, 0, 1]) == 0 and sturm([-6, 11, -6, 1]) == 3 and sturm([1, 2, 1]) == 1
    g, h = numeric(5, 17)       # must reproduce the published rank-five witness
    assert g[1] ** 2 - 4 * g[0] * g[2] == -11062769241414341239970603495681493737981374532130995
    assert h[1] ** 2 - 4 * h[0] * h[2] == -11061733404916469626152098526056073213151599377977031
    part3()
    for r in range(5, top + 1):
        k = r - 1; D = k * k + comb(k, 2)
        for name, v in zip(('H*', 'F*'), symbolic(r)):
            assert v[0].degree() == D and v[0].LC() == 1
            assert v[1].degree() <= D - 1
            assert v[2].degree() == D - 1 and v[2].LC() == Fraction((k - 2) * (k - 3), 2)
            print('part 1: rank', r, name, 'D =', D, 'degrees', [x.degree() for x in v],
                  'leading', [str(x.LC()) for x in v])
    pp = [2, 3, 4, 5, 7, 8, 9, 11, 13, 16, 17, 19, 23, 25, 27, 29, 31, 32, 37]
    for r in range(5, top + 1):
        out = []
        for q in pp:
            g, h = numeric(r, q)
            a, b = sturm(expand(g, r - 1)), sturm(expand(h, r))
            out.append((q, a, b))
        fh = [q for q, a, b in out if a < r - 1]; ff = [q for q, a, b in out if b < r]
        print('part 2: rank', r, 'H* not real-rooted at q =', fh, '| F* at q =', ff)
    print('all checks passed')
