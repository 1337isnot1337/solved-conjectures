#!/usr/bin/env python3
"""Exact finite checks of four-party calculations; no asymptotic inference.

Standard library only. Exterior tensors are assembled from the ordered
terms of T**k by four separate alternating quotient maps. Their ranks
are computed by exact rational Gaussian elimination, before comparison
with the combinatorial formulas in the written proof.
"""

from collections import defaultdict
from fractions import Fraction
from itertools import combinations, product
from math import comb, factorial


def x_terms(q, copies=1):
    return [
        (((c * q + i) * q + j,) * 2 + (c * q + i, c * q + j), 1)
        for c, i, j in product(range(copies), range(q), range(q))
    ]


def y_terms(q, copies=1):
    return [
        (((c * q + ell) * q + s,) * 2 + (c * q + ell,) * 2, 1)
        for c, ell, s in product(range(copies), range(q), range(q))
    ]


def h_terms(q):
    return [
        (((p, t, r), (p, t, s), (p, r, s), (t, r, s)), 1)
        for p, t, r, s in product(range(q), repeat=4)
    ]


def k_terms(q):
    # Edge order AB, AC, AD, BC, BD, CD.
    return [
        (((ab, ac, ad), (ab, bc, bd), (ac, bc, cd), (ad, bd, cd)), 1)
        for ab, ac, ad, bc, bd, cd in product(range(q), repeat=6)
    ]


def sparse_rank(rows):
    """Rank over Q of a finite sparse matrix given by row dictionaries."""
    pivots = {}
    for original in rows.values():
        row = {col: Fraction(value) for col, value in original.items() if value}
        while row:
            lead = min(row)
            if lead not in pivots:
                coefficient = row[lead]
                pivots[lead] = {col: value / coefficient for col, value in row.items()}
                break
            coefficient = row[lead]
            for col, value in pivots[lead].items():
                updated = row.get(col, Fraction(0)) - coefficient * value
                if updated:
                    row[col] = updated
                else:
                    row.pop(col, None)
    return len(pivots)


def flatten_rank(terms, left):
    left = tuple(left)
    right = tuple(i for i in range(4) if i not in left)
    rows = defaultdict(lambda: defaultdict(int))
    for index, coefficient in terms:
        row = tuple(index[i] for i in left)
        col = tuple(index[i] for i in right)
        rows[row][col] += coefficient
    return sparse_rank(rows)


def wedge(index):
    """Image of an ordered basis tensor under V**k -> exterior**k(V)."""
    if len(set(index)) != len(index):
        return None
    inversions = sum(index[i] > index[j] for i in range(len(index)) for j in range(i + 1, len(index)))
    return tuple(sorted(index)), -1 if inversions % 2 else 1


def exterior_b_rank(terms, degree):
    rows = defaultdict(lambda: defaultdict(int))
    for ordered_terms in product(terms, repeat=degree):
        coefficient = 1
        for _, value in ordered_terms:
            coefficient *= value
        labels = []
        for party in range(4):
            result = wedge(tuple(term[0][party] for term in ordered_terms))
            if result is None:
                break
            label, sign = result
            labels.append(label)
            coefficient *= sign
        else:
            rows[labels[1]][(labels[0], labels[2], labels[3])] += coefficient
    return sparse_rank(rows)


def poly_power_coefficient(base, exponent, degree):
    coefficients = [1]
    for _ in range(exponent):
        updated = [0] * min(degree + 1, len(coefficients) + len(base) - 1)
        for i, a in enumerate(coefficients):
            for j, b in enumerate(base):
                if i + j <= degree:
                    updated[i + j] += a * b
        coefficients = updated
    return coefficients[degree] if degree < len(coefficients) else 0


def main():
    exterior_count = 0
    for q in (2, 3):
        for degree in range(1, q + 1):
            actual_x = exterior_b_rank(x_terms(q), degree)
            actual_y = exterior_b_rank(y_terms(q), degree)
            expected_x = comb(q, degree) ** 2 * factorial(degree)
            expected_y = comb(q, degree) * q ** degree
            assert (actual_x, actual_y) == (expected_x, expected_y), (q, degree, actual_x, actual_y)
            actual_two_x = exterior_b_rank(x_terms(q, 2), degree)
            base = [comb(q, j) ** 2 * factorial(j) for j in range(q + 1)]
            expected_two_x = poly_power_coefficient(base, 2, degree)
            assert actual_two_x == expected_two_x, (q, degree, actual_two_x, expected_two_x)
            assert actual_two_x >= 2 ** degree * actual_y
            exterior_count += 3
            print(f"exterior q={q}, k={degree}: X={actual_x}, Y={actual_y}, U4(2)X={actual_two_x}")

    # A full common catalyst at the top nonzero exterior degree.
    q, copies, degree = 2, 2, 4
    actual_x = exterior_b_rank(x_terms(q, copies), degree)
    actual_y = exterior_b_rank(y_terms(q, copies), degree)
    assert actual_x == factorial(q) ** copies
    assert actual_y == q ** (copies * q)
    assert actual_x < actual_y
    exterior_count += 2
    print(f"common-unit q={q}, r={copies}, k={degree}: source={actual_x}, target={actual_y}")

    cuts = [(0,), (1,), (2,), (3,), (0, 1), (0, 2), (0, 3)]
    cut_count = 0
    for q in (2, 3):
        h, k = h_terms(q), k_terms(q)
        for cut in cuts:
            h_rank, k_rank = flatten_rank(h, cut), flatten_rank(k, cut)
            expected = q ** (3 if len(cut) == 1 else 4)
            assert h_rank == k_rank == expected, (q, cut, h_rank, k_rank)
            # Equality is the exact certificate that this spectral point
            # has k_F-h_F=0; no floating-point logarithms are needed.
            cut_count += 2
        print(f"tetrahedral q={q}: all seven cut ranks agree; singleton={q**3}, balanced={q**4}")

    # Ordinary flattenings respect the uncrossing direction even though
    # the exterior tests above obstruct zero-overhead finite conversion.
    for q in (2, 3):
        for cut in cuts:
            xr, yr = flatten_rank(x_terms(q), cut), flatten_rank(y_terms(q), cut)
            assert xr >= yr, (q, cut, xr, yr)
            cut_count += 2

    print(f"PASS: {exterior_count} exterior ranks and {cut_count} ordinary cut ranks checked exactly over Q.")
    print("These finite checks do not establish an asymptotic conversion, a positive overhead exponent, or a value of omega.")


if __name__ == "__main__":
    main()
