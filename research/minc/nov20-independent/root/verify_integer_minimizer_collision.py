#!/usr/bin/env python3
"""Exact algebra checks for the C24 collision bound; no conjecture claim."""

from fractions import Fraction
from itertools import permutations
from math import comb, factorial, prod
from random import Random
import json


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        row = mask.bit_count() - 1
        dp[mask] = sum(a[row][j] * dp[mask ^ (1 << j)]
                       for j in range(n) if mask & (1 << j))
    return dp[-1]


def compositions(total, caps):
    if len(caps) == 1:
        if 0 <= total <= caps[0]:
            yield (total,)
        return
    for first in range(max(0, total - sum(caps[1:])), min(total, caps[0]) + 1):
        for tail in compositions(total - first, caps[1:]):
            yield (first,) + tail


def tables(n, k):
    def build(rows, caps):
        if len(rows) == n - 1:
            if sum(caps) == k:
                yield tuple(rows) + (tuple(caps),)
            return
        for row in compositions(k, caps):
            yield from build(rows + [row], tuple(c - x for c, x in zip(caps, row)))
    yield from build([], (k,) * n)


def collisions(a):
    return sum(comb(x, 2) for row in a for x in row)


def excess(a):
    return sum(max(0, x - 1) for row in a for x in row)


def parameters(k):
    beta = Fraction((k - 1) ** (k - 1), k ** (k - 2))
    # Exactly exp(k * delta_k), with 0**0 interpreted as 1.
    exp_k_delta = Fraction(k ** k * (k - 2) ** (k - 2),
                           (k - 1) ** (2 * (k - 1)))
    return beta, exp_k_delta


def check_scalar():
    count = 0
    for k in range(2, 65):
        _, e = parameters(k)
        for a in range(k + 1):
            # exp(k * (f(a/k) - a*f(1/k)))
            left = Fraction((k - a) ** (k - a) * k ** (k * (a - 1)),
                            (k - 1) ** (a * (k - 1))) if a else Fraction(1)
            assert left >= e ** comb(a, 2), (k, a)
            count += 1
    return count


def check_table_class(n, k):
    beta, e = parameters(k)
    count = 0
    total_pairings = 0
    weighted_permanent = 0
    best = None
    best_collisions = []
    for a in tables(n, k):
        p = permanent(a)
        c = collisions(a)
        assert Fraction(p ** k) >= beta ** (n * k) * e ** c, (a, p, c)
        multiplicity = factorial(k) ** (2 * n) // prod(factorial(x) for row in a for x in row)
        # The integer count is also checked before using division.
        assert multiplicity * prod(factorial(x) for row in a for x in row) == factorial(k) ** (2 * n)
        total_pairings += multiplicity
        weighted_permanent += multiplicity * p
        if best is None or p < best:
            best, best_collisions = p, [c]
        elif p == best:
            best_collisions.append(c)
        count += 1
    expectation = Fraction(k ** (2 * n), comb(k * n, n))
    assert total_pairings == factorial(k * n)
    assert Fraction(weighted_permanent, total_pairings) == expectation
    for c in best_collisions:
        assert e ** c <= (expectation / beta ** n) ** k
    # Do not present the enumerated small-order minima as new results.
    return {"n": n, "k": k, "tables_checked": count,
            "pairing_average_exact": True, "penalty_exact": True,
            "minimizer_bound_exact": True}


def repair(a, k):
    a = [list(row) for row in a]
    n = len(a)
    count = 0
    while excess(a):
        i, j = next((i, j) for i in range(n) for j in range(n) if a[i][j] >= 2)
        uset = {r for r in range(n) if a[r][j]}
        vset = {s for s in range(n) if a[i][s]}
        outside = sum(a[r][s] for r in range(n) for s in range(n)
                      if r not in uset and s not in vset)
        identity = k * (n - len(uset) - len(vset)) + sum(a[r][s] for r in uset for s in vset)
        assert outside == identity and outside >= k * (n - 2 * k + 2) > 0
        r, s = next((r, s) for r in range(n) for s in range(n)
                    if r not in uset and s not in vset and a[r][s])
        old = excess(a)
        assert i != r and j != s and a[i][s] == a[r][j] == 0
        a[i][j] -= 1
        a[r][s] -= 1
        a[i][s] += 1
        a[r][j] += 1
        assert excess(a) < old
        assert all(sum(row) == k for row in a)
        assert all(sum(a[r][s] for r in range(n)) == k for s in range(n))
        count += 1
    return a, count


def check_repair():
    rng = Random(2402026)
    count = 0
    for n in (3, 5, 7, 11, 19):
        for k in range(2, min(6, (n + 1) // 2) + 1):
            for sample in range(24):
                a = [[0] * n for _ in range(n)]
                for _ in range(k):
                    perm = list(range(n))
                    if sample:
                        rng.shuffle(perm)
                    for i, j in enumerate(perm):
                        a[i][j] += 1
                b, steps = repair(a, k)
                assert all(x in (0, 1) for row in b for x in row)
                distance = sum(abs(a[i][j] - b[i][j]) for i in range(n) for j in range(n))
                assert steps <= excess(a) <= collisions(a)
                assert distance <= 4 * steps <= 4 * excess(a)
                count += 1
    return count


if __name__ == "__main__":
    print(json.dumps({"scalar_penalties_checked": check_scalar()}))
    for n in range(2, 5):
        for k in range(2, n + 1):
            print(json.dumps(check_table_class(n, k)))
    print(json.dumps({"switch_repairs_checked": check_repair()}))
