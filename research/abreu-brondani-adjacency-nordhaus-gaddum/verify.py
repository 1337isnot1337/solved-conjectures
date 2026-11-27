#!/usr/bin/env python3
"""Exact small-order spectral checks using integer characteristic polynomials."""
from fractions import Fraction
from functools import cache
from itertools import combinations, product
from math import comb, isqrt


def characteristic(matrix):
    """Faddeev–LeVerrier, returning coefficients in descending order."""
    n = len(matrix)
    power = [[int(i == j) for j in range(n)] for i in range(n)]
    coefficients = [1]
    for k in range(1, n + 1):
        power = [[sum(a * b for a, b in zip(row, column))
                  for column in zip(*power)] for row in matrix]
        trace = sum(power[i][i] for i in range(n))
        coefficient, remainder = divmod(-trace, k)
        assert remainder == 0
        coefficients.append(coefficient)
        for i in range(n):
            power[i][i] += coefficient
    return tuple(coefficients)


@cache
def root_counts(poly, endpoint):
    """Count roots strictly above an endpoint and equal to it, with multiplicity."""
    a, b = endpoint.numerator, endpoint.denominator
    degree = len(poly) - 1
    # Coefficient of x^i in b^degree p(a/b+x), divided by b^i.
    shifted = [sum(comb(j, i) * poly[degree - j] * a**(j-i) * b**(degree-j)
                   for j in range(i, degree + 1)) for i in range(degree + 1)]
    zeros = next(i for i, value in enumerate(shifted) if value)
    signs = [value > 0 for value in shifted if value]
    # Descartes is exact for real-rooted polynomials, also after removing zero roots.
    return sum(x != y for x, y in zip(signs, signs[1:])), zeros


@cache
def bounds(poly, rank):
    n = len(poly) - 1
    # Both the Seidel and shifted adjacency matrices have absolute row sums < 2n.
    low, high = -2*n*4096, 2*n*4096
    while high-low > 1:
        mid = (low + high) // 2
        above, equal = root_counts(poly, Fraction(mid, 4096))
        if above < rank <= above + equal:
            return Fraction(mid, 4096), Fraction(mid, 4096)
        if above >= rank:
            low = mid
        else:
            high = mid
    return Fraction(low, 4096), Fraction(high, 4096)


def radical_root(poly, squared, rank, sign=1):
    """Verify exactly that the indicated ranked root is sign*sqrt(squared)."""
    even = odd = 0
    for coefficient in poly:
        even, odd = squared*odd + coefficient, even
    if even or odd:
        return False
    integer = isqrt(squared)
    if integer*integer == squared:
        above, equal = root_counts(poly, sign*integer)
        return above < rank <= above + equal
    floor = isqrt(squared*4096**2)
    low, high = Fraction(floor, 4096), Fraction(floor+1, 4096)
    if sign < 0:
        low, high = -high, -low
    above_low, equal_low = root_counts(poly, low)
    above_high, equal_high = root_counts(poly, high)
    return above_high + equal_high == rank-1 and above_low + equal_low == rank


def signed_matrix(n, entry):
    return [[0 if i == j else entry(min(i, j), max(i, j)) for j in range(n)]
            for i in range(n)]


def check_graph(seidel, expect_equal):
    n = len(seidel)
    polynomials = [characteristic([[1 if i == j else 1 + sign*seidel[i][j]
                                    for j in range(n)] for i in range(n)])
                   for sign in (-1, 1)]
    # Shifted adjacency 2A+I turns the conjectured sum bound into 2*sqrt(R).
    twice_radicand = n*n-2*n+2
    if expect_equal:
        assert polynomials[0] == polynomials[1]
        assert radical_root(polynomials[0], twice_radicand//2, 2)
    else:
        upper = sum(bounds(poly, 2)[1] for poly in polynomials)
        assert upper < 0 or upper*upper < 2*twice_radicand


def check_all_graphs():
    total = 0
    equal_count = 0
    for n in range(2, 6):
        edges = list(combinations(range(n), 2))
        for signs in product((-1, 1), repeat=len(edges)):
            signature = dict(zip(edges, signs))
            matrix = signed_matrix(n, lambda i, j: signature[i, j])
            degrees = sorted(row.count(-1) for row in matrix)
            is_path_four = n == 4 and degrees == [1, 1, 2, 2]
            check_graph(matrix, is_path_four)
            equal_count += is_path_four
            total += 1
    assert (total, equal_count) == (1098, 12)
    return total, equal_count


def check_thresholds():
    count = maximizers = 0
    for n in range(2, 11):
        for word in product((-1, 1), repeat=n-1):
            matrix = signed_matrix(n, lambda i, j: word[j-1])
            poly = characteristic(matrix)
            bigger, equal_plus = root_counts(poly, 1)
            bigger_than_minus, _ = root_counts(poly, -1)
            assert bigger_than_minus == bigger + equal_plus
            target = (n-2)**2 + 4*(n*n//4)
            if n <= 3:
                # Every class is a constant signature up to switching and negation.
                upper = bounds(poly, 1)[1] - bounds(poly, n)[0]
                lower = bounds(poly, 1)[0] - bounds(poly, n)[1]
                assert upper == lower == n and target == n*n
                equal = True
            else:
                candidates = {n//2, (n+1)//2}
                blocks = [p for p in candidates if
                          all(s == word[0] for s in word[:p-1]) and
                          all(s == -word[0] for s in word[p-1:-1])]
                equal = bool(blocks)
                if equal:
                    shift = word[0]*(2*blocks[0]-n)
                    # In the two-block quotient, 2T-shift*I has endpoints ±sqrt(M_n).
                    centered = [[2*value - (shift if i == j else 0)
                                 for j, value in enumerate(row)] for i, row in enumerate(matrix)]
                    centered_poly = characteristic(centered)
                    assert radical_root(centered_poly, target, 1)
                    assert radical_root(centered_poly, target, n, -1)
                else:
                    upper = bounds(poly, 1)[1] - bounds(poly, n)[0]
                    assert upper*upper < target
            count += 1
            maximizers += equal
    assert (count, maximizers) == (1022, 46)
    return count, maximizers


def check_switchings():
    n = 8
    total = equal_count = 0
    for signs in product((-1, 1), repeat=n):
        matrix = signed_matrix(n, lambda i, j: (-1 if i >= n//2 else 1)
                               * signs[i] * signs[j])
        balanced = sum(signs[:n//2]) == sum(signs[n//2:]) == 0
        check_graph(matrix, balanced)
        total += 1
        equal_count += balanced
    assert (total, equal_count) == (256, 36)
    return total, equal_count


if __name__ == '__main__':
    graphs, graph_equal = check_all_graphs()
    thresholds, sharp = check_thresholds()
    switches, balanced = check_switchings()
    print(f'{graphs} labeled graphs through order 5 ({graph_equal} equalities)')
    print(f'{thresholds} threshold words through order 10 ({sharp} sharp spreads)')
    print(f'{switches} sign choices at order 8 ({balanced} balanced equalities)')
