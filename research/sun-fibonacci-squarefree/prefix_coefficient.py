"""Exact PNT-in-progressions coefficient for the surviving index families."""

from fractions import Fraction
from functools import cache
from math import gcd

RULES = {3: 2, 5: 14, 11: 67, 13: 79, 17: 60, 29: 552}
BASE = 840


@cache
def fibonacci_period(modulus):
    values = []
    a, b = 0, 1
    while True:
        values.append(a)
        a, b = b, (a + b) % modulus
        if (a, b) == (0, 1):
            return values


def survival_probability(multiplier, residue):
    if multiplier == 6 and residue % 4 == 1:
        return Fraction(0)
    probability = Fraction(1)
    used_coordinates = 1
    for prime, excluded in RULES.items():
        table = fibonacci_period(prime**2)
        period = len(table) // gcd(3, len(table))
        extra = period // gcd(period, BASE)
        assert gcd(used_coordinates, extra) == 1
        used_coordinates *= extra
        lifts = [residue + BASE * k for k in range(extra)
                 if gcd(residue + BASE * k, period) == 1]
        allowed = sum(table[3 * multiplier * u % len(table)] != excluded
                      for u in lifts)
        probability *= Fraction(allowed, len(lifts))
    return probability


if __name__ == "__main__":
    units = [r for r in range(BASE) if gcd(r, BASE) == 1]
    coefficient = Fraction(0)
    for multiplier in (1, 2, 6):
        survival = sum(survival_probability(multiplier, r) for r in units)
        contribution = survival / (len(units) * multiplier)
        print(multiplier, contribution)
        coefficient += contribution
    assert coefficient == Fraction(4934003, 5160960)
    print("Total", coefficient)
