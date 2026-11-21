"""Exact reciprocal bounds for the moduli of disjoint integer progressions."""

from functools import cache
from fractions import Fraction
from itertools import combinations
from math import gcd, isqrt, lcm


@cache
def divisors(n):
    small = [d for d in range(1, isqrt(n) + 1) if n % d == 0]
    return frozenset(small) | {n // d for d in small}


@cache
def totient(n):
    return n - sum(totient(d) for d in divisors(n) if d < n)


def bounds(moduli):
    """Return the classical common-modulus bound, the ranks and the rank bound."""
    shared = [
        {gcd(n, m) for j, m in enumerate(moduli) if i != j}
        for i, n in enumerate(moduli)
    ]
    period = lcm(*(d for row in shared for d in row))
    ranks = [sum(totient(t) for t in set().union(*(divisors(d) for d in row)))
             for row in shared]
    classical = sum(Fraction(1, gcd(n, period)) for n in moduli)
    return classical, ranks, sum(Fraction(1, r) for r in ranks)


if __name__ == "__main__":
    for family in [(20, 15, 12, 6, 6, 6, 6), (4, 4, 6, 12, 18, 18, 18, 18),
                   (10, 15, 36, 42, 66)]:
        classical, ranks, rank_bound = bounds(family)
        subsets = [bounds(sub) for length in range(2, len(family) + 1)
                   for sub in set(combinations(family, length))]
        print(family, ranks, classical, rank_bound,
              max(s[0] for s in subsets), max(s[2] for s in subsets))
