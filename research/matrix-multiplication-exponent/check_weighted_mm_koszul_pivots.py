#!/usr/bin/env python3
"""Exact support checks for the weighted-MM one-puncture Koszul proof.

No numerical weights are sampled.  The script verifies the bijective
pivot pairing, the triangular support ordering, and the count of lost
pivots.  Nonzero arbitrary weights multiply these individual pivots, so
there is no generic-weight assumption.
"""

from itertools import combinations
from math import comb


def key(p_set, marked):
    return tuple(-p for p in p_set[:marked]) + (-2 * len(p_set),) + tuple(
        -p for p in p_set[marked:]
    )


def check(n):
    subsets = list(combinations(range(1, 2 * n), n))
    columns = set()
    lost = []
    off_diagonal = 0
    for p_set in subsets:
        for marked in range(1, n + 1):
            pivot = p_set[marked - 1]
            subset = p_set[: marked - 1] + p_set[marked:]
            j = 1 + pivot - marked
            assert 1 <= j <= n
            column = (subset, j)
            assert column not in columns
            columns.add(column)

            complement = [x for x in range(1, 2 * n) if x not in subset]
            assert complement[j - 1] == pivot
            assert pivot - j + 1 == marked

            pivot_key = key(p_set, marked)
            if (marked, j) == (n, 1):
                lost.append((p_set, marked))
            for output_i in range(1, n + 1):
                added = output_i + j - 1
                if added in subset:
                    continue
                output_p = tuple(sorted(subset + (added,)))
                if output_i == marked:
                    assert output_p == p_set
                else:
                    assert key(output_p, output_i) < pivot_key
                    off_diagonal += 1

    expected = n * comb(2 * n - 1, n - 1)
    assert len(columns) == expected
    assert lost == [(tuple(range(1, n + 1)), n)]
    denominator = comb(2 * n - 2, n - 1)
    numerator = n * (expected - 1)
    quotient_lower = (numerator + denominator - 1) // denominator
    total_lower = 1 + quotient_lower
    assert total_lower == (6 if n == 2 else 2 * n * n - n + 1)
    print(
        f"n={n}: {expected} pivots per k-block; "
        f"{off_diagonal} off-diagonal support entries are earlier; "
        f"one lost pivot; border lower bound {total_lower}."
    )


if __name__ == "__main__":
    for size in range(2, 8):
        check(size)
    size = 64
    d = comb(2 * size - 2, size - 1)
    assert d > size
    source_budget = size * (14 * 5 + 4 * 4 + 7 * 2 + 5 * 4 + 7)
    weighted_lower = 2 * size * size - size + 1
    assert source_budget == 8128
    assert weighted_lower == 8129
    assert source_budget < weighted_lower
    print("At n=64: source budget 8128 < every weighted-support border rank 8129.")

