#!/usr/bin/env python3
"""Exact checks for the fat odd cycles C_{2k+1}^{(mu)} (every edge of the odd cycle C_{2k+1}
replaced by mu parallel edges).

For every k in 2..K and mu in 1..M the script
  1. builds the multigraph and the explicit colouring c(s) = copy of cycle edge 2s mod (2k+1),
     s = 0, ..., p-1 with p = (2k+1) mu,
  2. checks that every edge copy gets exactly one colour,
  3. checks, over ALL pairs of edges sharing a vertex (parallel copies included), that their colours
     are at circular distance >= k modulo p, i.e. that this is a (p, k)-edge-colouring,
  4. computes the maximum matching size by brute force on the underlying cycle (k for 2k+1 vertices)
     and checks |E| / alpha' = p / k,
so chi'_c = p/k = 2 mu + mu/k exactly.

For mu = k - 1 (k >= 3) it also checks that the value lies strictly inside (Delta + 1/2, Delta + 1)
and has denominator exactly k (Problem 7 of Mazak-Zrubak, arXiv:2603.08822).
Standard library only.  Ends with ALL CHECKS PASSED.
"""
import sys
from fractions import Fraction as F
from itertools import combinations

K, M = 30, 30


def max_matching_cycle(n):
    # brute force over subsets of the n cycle edges is too slow for large n; use the exact DP on a cycle
    # (independent sets in the line graph C_n), cross-checked by brute force for n <= 15
    def path(L):                      # maximum matching in a path with L edges = ceil(L/2)
        best = [0, 1]
        for i in range(2, L + 1):
            best.append(max(best[-1], best[-2] + 1))
        return best[L]
    m = max(path(n - 1), 1 + path(n - 3))   # edge 0 unused, or edge 0 used (drops its two neighbours)
    if n <= 15:
        edges = [frozenset({i, (i + 1) % n}) for i in range(n)]
        bf = max(r for r in range(n + 1) for S in combinations(edges, r)
                 if len(set().union(*S)) == 2 * r) if n else 0
        assert bf == m, (n, bf, m)
    return m


def check(k, mu):
    n = 2 * k + 1
    p = n * mu
    col = [(2 * s) % n for s in range(p)]                 # colour s -> cycle edge index
    ends = [frozenset({j, (j + 1) % n}) for j in range(n)]
    # each cycle edge receives exactly mu colours, i.e. each of its mu copies exactly one
    for j in range(n):
        assert col.count(j) == mu, (k, mu, j)
    # (p, k)-colouring: any two edge copies sharing a vertex have circular colour distance >= k
    for a in range(p):
        for b in range(a + 1, p):
            if ends[col[a]] & ends[col[b]]:
                d = min(b - a, p - (b - a))
                assert d >= k, (k, mu, a, b, d)
    alpha = max_matching_cycle(n)
    assert alpha == k
    E = n * mu
    lower = F(E, alpha)
    upper = F(p, k)
    assert lower == upper
    return upper, 2 * mu                                  # chi'_c, Delta


def main():
    for k in range(2, K + 1):
        for mu in range(1, M + 1):
            val, Delta = check(k, mu)
            assert val == 2 * mu + F(mu, k)
    print(f"chi'_c(C_(2k+1)^(mu)) = (2k+1) mu / k verified exactly for 2 <= k <= {K}, 1 <= mu <= {M}")
    for q in range(3, K + 1):
        val, Delta = check(q, q - 1)
        assert val.denominator == q, (q, val)
        assert Delta + F(1, 2) < val < Delta + 1, (q, val, Delta)
        print(f"q={q:2d}: C_{2*q+1}^({q-1})  Delta={Delta:2d}  chi'_c = {val} = Delta + {val - Delta}")
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    main()
