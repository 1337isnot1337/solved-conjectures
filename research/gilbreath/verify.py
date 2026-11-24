#!/usr/bin/env python3
"""Exact controls for the two-direction sieve argument and diagonal recovery."""

from fractions import Fraction
from math import gcd, prod


def eligible(coordinate, modulus):
    return gcd(2 * coordinate + 3, modulus) == 1


def check_residue_counts():
    primes = (3, 5, 7, 11)
    for length in range(1, len(primes) + 1):
        factors = primes[:length]
        modulus = prod(factors)
        for size in (1, 2):
            count = sum(
                all(eligible(start + offset, modulus) for offset in range(size))
                for start in range(modulus)
            )
            assert count == prod(prime - size for prime in factors)


def site_probability(coordinate):
    # Small artificial cutoff changes to exercise a transition in either scan.
    if coordinate < 50:
        modulus, denominator = 3, 13
    elif coordinate < 80:
        modulus, denominator = 15, 11
    else:
        modulus, denominator = 105, 9
    return Fraction(int(eligible(coordinate, modulus)), denominator)


def check_scan(direction):
    sites = [59 + direction * distance for distance in range(1, 44)]
    survival = Fraction(1)
    first_mark_masses = []
    for site in sites:
        probability = site_probability(site)
        first_mark_masses.append(survival * probability)
        survival *= 1 - probability
    assert sum(first_mark_masses) + survival == 1

    # Maximum mass of a 2-separated set by the path independent-set recurrence.
    best_two_back = best_one_back = Fraction(0)
    for mass in first_mark_masses:
        best_two_back, best_one_back = best_one_back, max(best_one_back, best_two_back + mass)
    mass_outside = sum(first_mark_masses) - best_one_back

    pairs = [
        (index, index + 1)
        for index in range(len(sites) - 1)
        if eligible(sites[index], 105) and eligible(sites[index + 1], 105)
    ]
    assert pairs
    assert len({index for pair in pairs for index in pair}) == 2 * len(pairs)
    guaranteed_mass = sum(
        min(first_mark_masses[left], first_mark_masses[right]) for left, right in pairs
    )
    assert mass_outside >= guaranteed_mass > 0


def differences(sequence):
    return [abs(right - left) for left, right in zip(sequence, sequence[1:])]


def check_diagonal_recovery():
    normalized = [3, 1, 0, 1, 0, 1, 0, 1]
    ordinary = [2, 3]
    for gap in normalized:
        ordinary.append(ordinary[-1] + 2 * (gap + 1))

    # The first difference removes 2 and the second removes the constant shift.
    row = differences(differences(ordinary))
    gaps = differences(normalized)
    leftmost = []
    while gaps:
        assert row[1] == 2 * gaps[0]
        leftmost.append(row[0])
        row = differences(row)
        gaps = differences(gaps)
    assert leftmost[:3] == [7, 3, 1]
    assert leftmost[2:] == [1] * (len(leftmost) - 2)


if __name__ == "__main__":
    check_residue_counts()
    check_scan(1)
    check_scan(-1)
    check_diagonal_recovery()
    print("Gilbreath model: residue counts, both scan directions and diagonal recovery passed")
