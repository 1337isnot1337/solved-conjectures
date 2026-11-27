#!/usr/bin/env python3
"""Exact regression checks for the written ratio and rounding certificates."""

from fractions import Fraction as Q
from itertools import product
from math import comb
from random import Random


def round_law(mu):
    lo = int(mu)
    frac = mu - lo
    return ((lo, 1 - frac), (lo + 1, frac))


def occupancy_value(u, y):
    return sum(y[i][i] * comb(u[i], 2) for i in range(len(u))) + sum(
        y[i][j] * u[i] * u[j] for i in range(len(u)) for j in range(i)
    )


def verify_witness():
    rows = ((2, 2, Q(3, 16)), (3, 2, Q(5, 16)), (1, 1, Q(3, 8)))
    assert sum(i * j * z for i, j, z in rows) == 3
    assert sum(comb(j, 2) * z for i, j, z in rows) == Q(1, 2)
    assert 4 * sum(comb(i, 2) * z for i, j, z in rows) == Q(9, 2)
    assert sum(z for _, _, z in rows) / 49 == Q(1, 56)
    for i, j in product(range(101), repeat=2):
        value = i * j - comb(i, 2) - 2 * comb(j, 2)
        assert value <= Q(j * (3 - j), 2) <= 1
    for t in range(1, 101):
        numerator = 12 * t**2 - comb(3 * t, 2) - 8 * comb(t, 2)
        assert numerator == Q(7 * t**2 + 11 * t, 2)
        assert Q(numerator, 4 * (7 * t)**2) > Q(1, 56)


def verify_rounding():
    k, delta = 12800, Q(1, 1600)
    assert Q(1, 56) + Q(55, 3200) < Q(1, 28)
    assert Q(1, comb(57, 2)) < Q(1, 28)
    assert 2**13 - 1 < k and delta * k / 8 == 1
    rng = Random(990)
    for _ in range(300):
        d = rng.randrange(1, 6)
        u = tuple(rng.randrange(20_000) for _ in range(d))
        if sum(u) <= 2 * k:
            continue
        theta = Q(k, sum(u))
        y = [[-Q(rng.randrange(1, 100), 23) if i == j else Q()
              for j in range(d)] for i in range(d)]
        for i in range(d):
            for j in range(i):
                y[i][j] = y[j][i] = Q(rng.randrange(-100, 24), 23)
        laws = [round_law(theta * v) for v in u]
        variances = []
        expectation = Q()
        for v, law in zip(u, laws):
            var = sum(p * (w - theta * v)**2 for w, p in law)
            assert var <= min(Q(1, 4), theta * (1 - theta) * v)
            variances.append(var)
        for outcome in product(*laws):
            v, weight = [], Q(1)
            for w, p in outcome:
                v.append(w)
                weight *= p
            assert sum(v) <= k + d
            expectation += weight * occupancy_value(v, y)
        identity = theta**2 * occupancy_value(u, y) + sum(
            -y[i][i] * (theta * (1 - theta) * u[i] - variances[i]) / 2
            for i in range(d)
        )
        assert expectation == identity
        assert expectation > theta**2 * occupancy_value(u, y) + 1


if __name__ == "__main__":
    verify_witness()
    verify_rounding()
    print("Exact lower witness and floor/ceiling identities checked.")
