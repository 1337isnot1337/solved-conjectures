#!/usr/bin/env python3
"""Exact literal I/J-event checks for the accompanying Conjecture 28 proof.

This uses the source's interval definitions, not adjugates or Bernoulli averaging.
It checks full coefficient dictionaries for each fixed surjection and each D.
"""

from collections import Counter
from itertools import product
from verify import determinant, membership_vector


def interval_mask(k, i, j):
    """The source interval ]i,j], with ]i,i] empty."""
    mask = 0
    while i != j:
        i = (i + 1) % k
        mask |= 1 << i
    return mask


def event_tables(k):
    full = (1 << k) - 1
    i_tables, j_tables = [], []
    for subset in range(1 << k):
        i_table = [[int(interval_mask(k, i, j) & subset == interval_mask(k, i, j))
                    for j in range(k)] for i in range(k)]
        j_table = [[i_table[i][j] if i != j else int(subset == full)
                    for j in range(k)] for i in range(k)]
        i_tables.append(i_table)
        j_tables.append(j_table)
    return i_tables, j_tables


def expected_coefficients(k, r, marked):
    """Count proper tuples with D contained in S1 and root absent from S1."""
    result = Counter()
    for first in range(1 << (k - 1)):
        if first & marked != marked:
            continue
        for rest in product(range((1 << k) - 1), repeat=r - 1):
            result[membership_vector(k, (first,) + rest)] += 1
    return dict(result)


def check(k, r):
    i_tables, j_tables = event_tables(k)
    tuples = [(subsets, membership_vector(k, subsets))
              for subsets in product(range(1 << k), repeat=r)]
    expected = [expected_coefficients(k, r, d) for d in range(1 << (k - 1))]
    maps = [f for f in product(range(r), repeat=k - 1) if len(set(f)) == r]
    determinants_checked = 0
    for f in maps:
        for marked in range(1 << (k - 1)):
            actual = Counter()
            for subsets, membership in tuples:
                matrix = []
                for i in range(k - 1):
                    subset = subsets[f[i]]
                    row = j_tables[subset][(i - 1) % k] if marked & (1 << i) else i_tables[subset][i]
                    matrix.append(row)
                matrix.append([1] * k)
                actual[membership] += determinant(matrix)
                determinants_checked += 1
            actual = {p: value for p, value in actual.items() if value}
            assert actual == expected[marked], (k, r, f, marked, actual, expected[marked])
    profiles = len(maps) * (1 << (k - 1))
    print(f"k={k}, r={r}: {len(maps)} surjections, {profiles} (f,D) profiles, "
          f"{determinants_checked} literal event determinants agree")
    return profiles, determinants_checked


def main():
    total_profiles = total_determinants = 0
    sizes = [(k, r) for k in range(2, 5) for r in range(1, k)] + [(5, 2)]
    for k, r in sizes:
        profiles, determinants = check(k, r)
        total_profiles += profiles
        total_determinants += determinants
    print(f"PASS: {total_profiles} (f,D) profiles and {total_determinants} exact event determinants")


if __name__ == "__main__":
    main()
