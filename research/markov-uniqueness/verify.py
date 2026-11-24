#!/usr/bin/env python3
"""Verify fixed-cofactor certificates by exact interval arithmetic."""

from fractions import Fraction
from math import ceil, floor, gcd


def apply_letter(value, bit):
    m = 1 + bit
    if value is None:
        return m + Fraction(1, m)
    return m + value / (1 + m * value)


def root_cover(depth):
    breakpoints = sorted(
        {Fraction(j, d) for d in range(1, depth + 1) for j in range(d + 1)}
    )
    slopes = set(breakpoints[1:-1])
    slopes.update((a + b) / 2 for a, b in zip(breakpoints, breakpoints[1:]))
    suffixes = {
        tuple(
            ceil(j * slope) - ceil((j - 1) * slope)
            for j in range(depth, 0, -1)
        )
        for slope in slopes
    }

    intervals = set()
    for suffix in suffixes:
        lo, hi = Fraction(3, 2), Fraction(5, 2)
        for bit in suffix:
            lo, hi = apply_letter(lo, bit), apply_letter(hi, bit)
        intervals.add((lo - 2, hi - 2))

    for denominator in range(2, depth + 1):
        for numerator in range(1, denominator):
            if gcd(numerator, denominator) == 1:
                value = None
                for j in range(1, denominator + 1):
                    bit = (j * numerator) // denominator
                    bit -= ((j - 1) * numerator) // denominator
                    value = apply_letter(value, bit)
                intervals.add((value - 2, value - 2))

    assert all(Fraction(3, 8) <= lo <= hi <= Fraction(5, 12) for lo, hi in intervals)
    return sorted(intervals)


def certifies(intervals, cofactor):
    def hits_grid(lo, hi):
        return max(1, ceil(lo * cofactor)) <= min(cofactor - 1, floor(hi * cofactor))

    # The difference cover is symmetric since the interval pairs are ordered.
    return not any(
        hits_grid(lo + other_lo, hi + other_hi)
        or hits_grid(lo - other_hi, hi - other_lo)
        for lo, hi in intervals
        for other_lo, other_hi in intervals
    )


if __name__ == "__main__":
    intervals = root_cover(5)
    cofactors = (37, 41, 53, 61, 73)
    assert all(certifies(intervals, cofactor) for cofactor in cofactors)
    assert 13**2 + 34**2 + 1325**2 == 3 * 13 * 34 * 1325
    assert 1325 == 53 * 5**2
    print(f"Certified cofactors {cofactors} with {len(intervals)} rational intervals.")
