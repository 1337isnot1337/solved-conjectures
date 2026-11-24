#!/usr/bin/env python3
"""Exact symbolic checks for the five- and four-term compressions of Sun's (10.4).

The polynomial calculation is independent of tensor-valued ordinary-row
right-hand sides. Its application to the full construction requires (10.4)
to be the complete image of each named source pair, as stated in the audit.
The matrix-multiplication lower bound is imported, not proved by this file.
"""

from collections import defaultdict
from itertools import product


ZERO = (0,) * 5  # exponents of u1,u2,u3,u4,c


def monomial(variable, power=1):
    result = list(ZERO)
    result[variable] = power
    return tuple(result)


def add_exponents(*terms):
    return tuple(sum(coordinates) for coordinates in zip(*terms))


def expand_product(x_form, y_form, z_form):
    # A form term is (tensor-coordinate index, polynomial exponent, coefficient).
    answer = defaultdict(int)
    for (x, a, ca), (y, b, cb), (z, c, cc) in product(x_form, y_form, z_form):
        answer[(x, y, z, add_exponents(a, b, c))] += ca * cb * cc
    return answer


def division_free_check():
    # X coordinates1..4 are the formal vectors U(x1),...,U(x4), while5 is
    # the original x2. Treating them independently proves the identity for
    # arbitrary U by substitution. Polynomial slots0,1,2 now encode b,sigma,t.
    b, sigma, t = (monomial(i) for i in range(3))
    one_z0 = [(0, ZERO, 1)]
    terms = [
        ([(1, ZERO, -1), (2, ZERO, 1)], [(1, ZERO, -1)], one_z0),
        ([(2, ZERO, 1)], [(1, ZERO, 1), (2, ZERO, 1)],
         [(0, ZERO, 1), (1, ZERO, 1)]),
        ([(3, ZERO, 1)], [(3, ZERO, 1)], one_z0),
        ([(4, ZERO, 1)], [(4, ZERO, 1)],
         [(0, ZERO, 1), (2, ZERO, 1)]),
        ([(5, b, 1), (2, add_exponents(sigma, t), 1), (2, ZERO, -1)],
         [(2, ZERO, 1)], [(1, ZERO, 1)]),
    ]
    actual = defaultdict(int)
    for forms in terms:
        for key, value in expand_product(*forms).items():
            actual[key] += value
    actual = {key: value for key, value in actual.items() if value}
    expected = {(i, i, 0, ZERO): 1 for i in range(1, 5)}
    expected[(2, 1, 1, ZERO)] = 1
    expected[(4, 4, 2, ZERO)] = 1
    expected[(5, 2, 1, b)] = 1
    expected[(2, 2, 1, add_exponents(sigma, t))] = 1
    assert actual == expected
    assert len(actual) == 8
    print("Five polynomial rank-one terms equal the full cell for an arbitrary X-side U.")


def symbolic_check():
    u1, u2, u3, u4, c = (monomial(i) for i in range(5))
    # Multiply the proposed decomposition by c to avoid formal division.
    terms = [
        ([(1, add_exponents(c, u1), 1), (2, add_exponents(u2, u2), -1)],
         [(1, ZERO, 1)], [(0, ZERO, 1)]),
        ([(2, ZERO, 1)], [(1, u2, 1), (2, c, 1)],
         [(0, u2, 1), (1, c, 1)]),
        ([(3, add_exponents(c, u3), 1)], [(3, ZERO, 1)], [(0, ZERO, 1)]),
        ([(4, add_exponents(c, u4), 1)], [(4, ZERO, 1)],
         [(0, ZERO, 1), (2, ZERO, 1)]),
    ]
    actual = defaultdict(int)
    for forms in terms:
        for key, value in expand_product(*forms).items():
            actual[key] += value
    actual = {key: value for key, value in actual.items() if value}
    expected = {(i, i, 0, add_exponents(c, monomial(i - 1))): 1
                for i in range(1, 5)}
    expected[(2, 1, 1, add_exponents(c, u2))] = 1
    expected[(4, 4, 2, add_exponents(c, u4))] = 1
    expected[(2, 2, 1, add_exponents(c, c))] = 1
    assert actual == expected
    assert len(actual) == 7
    print("Four rank-one terms expand symbolically to U A_can+cJ (after clearing c).")


def row_map_check():
    def invertible(matrix):
        a, b, c, d = matrix
        return (a * d + b * c) % 2 == 1

    def xor_matrices(matrices):
        return tuple(sum(entries) % 2 for entries in zip(*matrices))

    invertibles = [matrix for matrix in product(range(2), repeat=4) if invertible(matrix)]
    assert len(invertibles) == 6
    triples = 0
    for triple in product(invertibles, repeat=3):
        if all(invertible(xor_matrices([triple[i] for i in range(3) if mask & (1 << i)]))
               for mask in range(1, 8)):
            triples += 1
    assert triples == 0
    print("All 216 triples of invertible 2x2 binary matrices fail the seven-sum condition.")


def main():
    division_free_check()
    symbolic_check()
    for n in (7, 12):
        size = 1 << n
        lower = 2 * size * size - n - 1
        for saving in (15, 20):
            compressed = 2 * size * size - saving
            assert compressed < lower
            print(f"At size {size}: saving {saving} gives budget {compressed} < imported lower {lower}.")
    row_map_check()
    print("Budget conclusions require the stated source pairs to have exactly the printed cell images.")


if __name__ == "__main__":
    main()
