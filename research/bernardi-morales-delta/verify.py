#!/usr/bin/env python3
"""Exact checks accompanying the all-parameter proof; standard library only.

The exhaustive checks do not constitute the proof. They independently enumerate
the literal delta process for every fixed map at the listed sizes, including
nonsurjective maps. No floating point arithmetic is used.
"""

from collections import Counter
from itertools import product
from math import prod


def determinant(matrix):
    """Fraction-free Bareiss determinant, with exact row pivoting."""
    a = [row[:] for row in matrix]
    n = len(a)
    if n == 0:
        return 1
    sign, previous = 1, 1
    for j in range(n - 1):
        if a[j][j] == 0:
            pivot = next((i for i in range(j + 1, n) if a[i][j]), None)
            if pivot is None:
                return 0
            a[j], a[pivot] = a[pivot], a[j]
            sign = -sign
        pivot = a[j][j]
        for i in range(j + 1, n):
            for q in range(j + 1, n):
                numerator = a[i][q] * pivot - a[i][j] * a[j][q]
                assert numerator % previous == 0
                a[i][q] = numerator // previous
            a[i][j] = 0
        previous = pivot
    return sign * a[-1][-1]


def delta_map(k, subset):
    """Literal cyclic-successor rule, with vertices indexed 0,...,k-1."""
    result = []
    for i in range(k):
        if subset & (1 << i):
            result.append(i)
        else:
            j = (i + 1) % k
            while subset & (1 << j):
                j = (j + 1) % k
            result.append(j)
    return tuple(result)


def is_tree(arrows, root):
    """Every forward orbit must reach the root; no determinant is used."""
    for start in range(root):
        seen = set()
        vertex = start
        while vertex != root:
            if vertex in seen:
                return False
            seen.add(vertex)
            vertex = arrows[vertex]
    return True


def membership_vector(k, subsets):
    return tuple(sum((subset >> i) & 1 for subset in subsets) for i in range(k))


def coefficients_of_f_power(k, exponent):
    """Coefficient dictionary for (sum over proper subsets of x^S)^exponent."""
    return Counter(
        membership_vector(k, subsets)
        for subsets in product(range((1 << k) - 1), repeat=exponent)
    )


def check_fixed_maps(k, r):
    proper = range((1 << k) - 1)
    maps = [delta_map(k, subset) for subset in proper]
    tuples = [
        (subsets, membership_vector(k, subsets))
        for subsets in product(proper, repeat=r)
    ]
    expected = coefficients_of_f_power(k, r - 1)
    map_count, pair_count = 0, 0
    for color_map in product(range(r), repeat=k - 1):
        actual = Counter()
        for subsets, membership in tuples:
            arrows = tuple(maps[subsets[color_map[i]]][i] for i in range(k - 1))
            if is_tree(arrows, k - 1):
                actual[membership] += 1
            pair_count += 1
        assert actual == expected, (k, r, color_map, actual - expected, expected - actual)
        map_count += 1
    print(f"k={k}, r={r}: {map_count} fixed maps, {pair_count} pairs, all coefficients agree")
    return map_count, pair_count


def identity(n):
    return [[int(i == j) for j in range(n)] for i in range(n)]


def matmul(a, b):
    return [[sum(a[i][q] * b[q][j] for q in range(len(b)))
             for j in range(len(b[0]))] for i in range(len(a))]


def laplacian(k, subset):
    arrows = delta_map(k, subset)
    result = identity(k)
    for i, j in enumerate(arrows):
        result[i][j] -= 1
    return result


def check_schur_generating_identity(k, seed):
    """Check the arbitrary-Z identity at dense integer matrices (not only diagonal Z)."""
    x = [2 * i + 1 + seed for i in range(k)]
    z = [[((i + 2) * (j + 3) + seed * (i - j + 1)) % 11 - 5
          for j in range(k)] for i in range(k)]
    x_plus_z = [row[:] for row in z]
    for i in range(k):
        x_plus_z[i][i] += x[i]
    lhs_matrix = matmul(x_plus_z, laplacian(k, 0))
    for i in range(k):
        lhs_matrix[i][i] += 1
    lhs = determinant(lhs_matrix)
    rhs = 0
    for subset in range((1 << k) - 1):
        term_matrix = matmul(z, laplacian(k, subset))
        for i in range(k):
            term_matrix[i][i] += 1
        weight = prod(x[i] for i in range(k) if subset & (1 << i))
        rhs += weight * determinant(term_matrix)
    assert lhs == rhs, (k, seed, lhs, rhs)


def main():
    total_maps = total_pairs = 0
    sizes = [(k, r) for k in range(2, 5) for r in range(1, k)]
    sizes += [(2, 3), (3, 3), (5, 1), (5, 2)]
    for k, r in sizes:
        maps, pairs = check_fixed_maps(k, r)
        total_maps += maps
        total_pairs += pairs
    for k in range(2, 7):
        for seed in range(1, 6):
            check_schur_generating_identity(k, seed)
    print(f"PASS: {total_maps} fixed maps and {total_pairs} exact process pairs")
    print("PASS: 25 arbitrary-Z determinant identity checks, k=2,...,6")


if __name__ == "__main__":
    main()
