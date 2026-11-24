#!/usr/bin/env python3
"""Exact finite verification of the degree-eight unit-uncrossing obstruction.

Only Python's standard library is used. This checks the finite polynomial
values and flattening statements, not an asymptotic separation.
"""

from collections import Counter
from fractions import Fraction
from itertools import combinations, product


EPSILON_BLOCKS = (
    ((0, 1, 2, 3), (4, 5, 6, 7)),
    ((0, 1, 4, 7), (2, 3, 5, 6)),
    ((1, 5), (0, 3), (4, 6), (2, 7)),
    ((0, 3), (1, 5), (4, 7), (2, 6)),
)


def epsilon(indices):
    if len(set(indices)) != len(indices):
        return 0
    inversions = sum(
        indices[i] > indices[j]
        for i in range(len(indices))
        for j in range(i + 1, len(indices))
    )
    return (-1) ** inversions


def invariant_terms(support):
    """Expand the printed epsilon contraction on the actual tensor support."""
    counts = Counter()
    surviving_first_indices = []
    for terms in product(support, repeat=8):
        coefficient = 1
        for party, blocks in enumerate(EPSILON_BLOCKS):
            for block in blocks:
                coefficient *= epsilon(tuple(terms[i][party] for i in block))
                if coefficient == 0:
                    break
            if coefficient == 0:
                break
        counts[coefficient] += 1
        if coefficient:
            surviving_first_indices.append(tuple(term[0] for term in terms))
    return counts, surviving_first_indices


def matrix_rank(matrix):
    matrix = [[Fraction(x) for x in row] for row in matrix]
    rank = 0
    for col in range(len(matrix[0])):
        pivot = next(
            (row for row in range(rank, len(matrix)) if matrix[row][col]),
            None,
        )
        if pivot is None:
            continue
        matrix[rank], matrix[pivot] = matrix[pivot], matrix[rank]
        factor = matrix[rank][col]
        matrix[rank] = [x / factor for x in matrix[rank]]
        for row in range(len(matrix)):
            if row != rank and matrix[row][col]:
                factor = matrix[row][col]
                matrix[row] = [
                    x - factor * y
                    for x, y in zip(matrix[row], matrix[rank])
                ]
        rank += 1
    return rank


def flattening_rank(support, left):
    dimensions = (4, 4, 2, 2)
    right = tuple(i for i in range(4) if i not in left)
    rows = list(product(*(range(dimensions[i]) for i in left)))
    cols = list(product(*(range(dimensions[i]) for i in right)))
    row_index = {row: i for i, row in enumerate(rows)}
    col_index = {col: i for i, col in enumerate(cols)}
    matrix = [[0] * len(cols) for _ in rows]
    for term in support:
        row = row_index[tuple(term[i] for i in left)]
        col = col_index[tuple(term[i] for i in right)]
        matrix[row][col] += 1
    return matrix_rank(matrix)


def unit_cut_charge(subset, cut):
    return int(bool(subset & cut) and bool(subset - cut))


def check_source_only_construction(m):
    """Expand the stated monomial source maps, retaining multiplicities."""
    output = Counter()
    for k, s, u, t, v in product(range(m), repeat=5):
        if s != t:
            continue
        output[(
            ((k, s), (u, v)),
            ((k, s), (u, v)),
            (k, s),
            (k, t),
        )] += 1
    target = Counter({(
        ((k, s), (u, v)),
        ((k, s), (u, v)),
        (k, s),
        (k, s),
    ): 1 for k, s, u, v in product(range(m), repeat=4)})
    assert output == target
    assert len(output) == m**4


def main():
    source = tuple((2 * i + j, 2 * i + j, i, j) for i, j in product(range(2), repeat=2))
    target = tuple((2 * i + j, 2 * i + j, i, i) for i, j in product(range(2), repeat=2))

    source_counts, source_terms = invariant_terms(source)
    target_counts, target_terms = invariant_terms(target)
    assert source_counts == {0: 4**8}
    assert source_terms == []
    assert target_counts == {0: 4**8 - 8, 1: 8}

    expected = set()
    for i, t, v in product(range(2), repeat=3):
        a0 = 2 * i + t
        a1 = 2 * (1 - i) + v
        a2 = 2 * i + 1 - t
        a3 = 2 * (1 - i) + 1 - v
        expected.add((a0, a1, a2, a3, a2, a0, a1, a3))
    assert set(target_terms) == expected

    source_local = tuple(flattening_rank(source, (i,)) for i in range(4))
    target_local = tuple(flattening_rank(target, (i,)) for i in range(4))
    assert source_local == target_local == (4, 4, 2, 2)
    assert flattening_rank(source, (0, 1)) == 4
    assert flattening_rank(target, (0, 1)) == 2

    S, T = {0, 1, 2}, {0, 1, 3}
    cut_checks = 0
    for size in range(1, 4):
        for values in combinations(range(4), size):
            cut = set(values)
            assert (
                unit_cut_charge(S, cut) + unit_cut_charge(T, cut)
                >= unit_cut_charge(S | T, cut) + unit_cut_charge(S & T, cut)
            )
            cut_checks += 1

    # Exact sign of the square's submodularity deficit:
    # (13*sqrt(2)-18)/14 > 0, since both compared terms are positive.
    assert 13**2 * 2 > 18**2

    for m in (2, 3, 4):
        check_source_only_construction(m)

    print("Degree-eight invariant: P(source)=0; P(target)=8.")
    print("All 65536 support terms per tensor checked; target has eight +1 terms.")
    print("One-party ranks: source=target=(4,4,2,2).")
    print("AB|CD ranks: source=4; target=2.")
    print(f"Uncrossing passes all {cut_checks} nontrivial labeled flattening cuts.")
    print("Square model deficit: (13*sqrt(2)-18)/14 > 0, checked exactly.")
    print("Source-only sqrt(q) restriction: complete coefficient checks at q=4,9,16.")


if __name__ == "__main__":
    main()
