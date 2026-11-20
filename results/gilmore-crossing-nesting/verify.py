#!/usr/bin/env python3
"""Exact consistency checks for Gilmore's crossing–nesting identity.

Run with Python 3: python3 verify.py
No external packages are used. These finite checks supplement the written proof.
Polynomial keys are exponents of (r, s, mu, y); coefficients are integers.
"""

from collections import Counter
from itertools import combinations


ONE = {(0, 0, 0, 0): 1}


def add(a, b):
    result = Counter(a)
    result.update(b)
    return dict(result)


def mul(a, b):
    result = Counter()
    for powers_a, coefficient_a in a.items():
        for powers_b, coefficient_b in b.items():
            powers = tuple(x + y for x, y in zip(powers_a, powers_b))
            result[powers] += coefficient_a * coefficient_b
    return dict(result)


def qinteger(h):
    return {(h - 1 - j, j, 0, 0): 1 for j in range(h)}


def identity(size):
    return [[dict(ONE) if row == col else {} for col in range(size)]
            for row in range(size)]


def matrix_product(a, b):
    size = len(a)
    result = [[{} for _ in range(size)] for _ in range(size)]
    for row in range(size):
        for col in range(row + 1):
            for middle in range(col, row + 1):
                result[row][col] = add(result[row][col],
                                       mul(a[row][middle], b[middle][col]))
    return result


def defining_product(max_n):
    """Literal B_{N-1} ... B_1 B_0 from the source's definition."""
    size = max_n + 1
    result = identity(size)
    for factor_index in range(max_n):
        factor = identity(size)
        offset = factor_index + 1
        for row in range(offset, size):
            for col in range(offset, row):
                degree = row - col
                entry = {(0, 0, factor_index * degree, degree): 1}
                for v in range(col - offset + 1, row - offset + 1):
                    entry = mul(entry, qinteger(v))
                factor[row][col] = entry
        result = matrix_product(factor, result)
    return result


def recurrence(max_n):
    result = [[{} for _ in range(max_n + 2)] for _ in range(max_n + 1)]
    result[0][0] = dict(ONE)
    for n in range(1, max_n + 1):
        for k in range(n, 0, -1):
            down = mul({(0, 0, 0, 1): 1},
                       mul(qinteger(k), result[n][k + 1]))
            up = mul({(0, 0, n - k, 0): 1}, result[n - 1][k - 1])
            result[n][k] = add(down, up)
    return [row[:max_n + 1] for row in result]


def matchings(vertices):
    if not vertices:
        yield ()
        return
    first = vertices[0]
    for index in range(1, len(vertices)):
        second = vertices[index]
        remaining = vertices[1:index] + vertices[index + 1:]
        for rest in matchings(remaining):
            yield ((first, second),) + rest


def matching_polynomial(arcs):
    """Enumerate literal vertex pairings, using only endpoint inequalities."""
    result = Counter()
    count = 0
    for matching in matchings(tuple(range(2 * arcs))):
        crossings = nestings = alignments = 0
        for first, second in combinations(matching, 2):
            (a, b), (c, d) = sorted((first, second))
            if b < c:
                alignments += 1
            elif b < d:
                assert a < c < b < d
                crossings += 1
            else:
                assert a < c < d < b
                nestings += 1
        assert crossings + nestings + alignments == arcs * (arcs - 1) // 2
        result[(crossings, nestings, alignments, arcs)] += 1
        count += 1
    return dict(result), count


def main():
    max_n = 7
    product = defining_product(max_n)
    recursive = recurrence(max_n)
    assert product == recursive, "Defining product disagrees with recurrence"
    print(f"All {(max_n + 1) ** 2} entries of product and recurrence agree exactly.")
    expected_count = 1
    for n in range(1, max_n + 1):
        polynomial, count = matching_polynomial(n - 1)
        if n >= 2:
            expected_count *= 2 * n - 3
        assert count == expected_count
        assert product[n][1] == polynomial, f"Matching discrepancy in row {n}"
        assert all(powers[3] == n - 1 for powers in polynomial)
        print(f"n={n}: {count} matchings; {len(polynomial)} exact monomials agree.")
    print("PASS: no parameter substitutions or floating-point arithmetic were used.")


if __name__ == "__main__":
    main()
