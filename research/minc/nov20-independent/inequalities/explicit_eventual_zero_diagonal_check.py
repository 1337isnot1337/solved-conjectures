#!/usr/bin/env python3
"""Exact diagnostics for the written eventual C44 theorem, not a proof by cases."""
from fractions import Fraction as Q
from itertools import combinations, permutations
from math import factorial, prod


def permanent(matrix):
    n = len(matrix)
    return sum(prod(matrix[i][p[i]] for i in range(n))
               for p in permutations(range(n)))


def sigma(matrix, k):
    n = len(matrix)
    return sum(permanent([[matrix[i][j] for j in cols] for i in rows])
               for rows in combinations(range(n), k)
               for cols in combinations(range(n), k))


def product_polynomial(matrix):
    """Expand the original row product, before any differentiation."""
    n = len(matrix)
    polynomial = {(0,) * n: Q(1)}
    for row in matrix:
        following = {}
        for powers, coefficient in polynomial.items():
            for j, value in enumerate(row):
                updated = list(powers)
                updated[j] += 1
                updated = tuple(updated)
                following[updated] = following.get(updated, Q(0)) + coefficient * value
        polynomial = following
    return polynomial


for n in range(3, 6):
    denominator = n * (n + 1) // 2
    a = [[Q(1 + ((i + j) % n), denominator) for j in range(n)]
         for i in range(n)]
    assert all(sum(row) == 1 for row in a)
    assert all(sum(a[i][j] for i in range(n)) == 1 for j in range(n))
    polynomial = product_polynomial(a)
    assert polynomial[(1,) * n] == permanent(a)
    for k in range(1, n):
        selected = set(range(k))
        outside = list(range(k, n))
        x = [Q(j + 2) for j in range(n)]
        # Derivative once in each selected variable, followed by setting
        # those variables to zero: exactly the exponents equal to one survive.
        q_value = sum(coefficient * prod(x[j] ** powers[j] for j in outside)
                      for powers, coefficient in polynomial.items()
                      if all(powers[j] == 1 for j in selected))
        c = [sum(a[i][j] for j in selected) for i in range(n)]
        linear = [sum(a[i][j] * x[j] for j in outside) for i in range(n)]
        w = [[a[i][j] / linear[i] if j in selected else Q(0)
              for j in range(n)] for i in range(n)]
        assert sigma(w, k) > 0
        assert sigma(w, k + 1) == 0
        assert q_value == prod(linear) * sigma(w, k)

        # Exponentiating denominator times the two entropy formulas leaves
        # rational arithmetic only. The column monomer factors are all one.
        entropy_power = Q(1)
        for i in range(n):
            for j in selected:
                entry = a[i][j]
                entropy_power *= (w[i][j] / entry) ** int(denominator * entry)
                entropy_power *= (1 - entry) ** int(denominator * (1 - entry))
            entropy_power /= (1 - c[i]) ** int(denominator * (1 - c[i]))
        selected_power = prod((1 - a[i][j]) ** int(denominator * (1 - a[i][j]))
                              for i in range(n) for j in selected)
        substituted_power = selected_power * prod(
            (linear[i] / (1 - c[i])) ** int(denominator * (1 - c[i]))
            for i in range(n))
        assert entropy_power * prod(linear) ** denominator == substituted_power
    print(f"order {n}: exact matching normalization and entropy substitution passed")

epsilon = Q(1, 10**6)
assert 16 * (1 - epsilon / 2) ** 2 > 15
assert Q(1, 6) - Q(1, 15) == Q(1, 10)
assert epsilon**2 / 10 == Q(1, 10**13)
threshold = 20_000_000_000_000
assert threshold >= 6_000_000
assert Q(1, threshold - 1) <= epsilon
assert Q(3, 2 * (threshold - 1)) < epsilon**2 / 10
# At the least permitted ambient order n epsilon = 6, so floor(n epsilon/2)
# is at least n epsilon/2 - 1 >= n epsilon/3 for every larger real value.
assert 6 * (Q(1, 2) - Q(1, 3)) == 1
assert Q(2) + 2 * Q(467, 1000) < 3
print("all threshold comparisons passed in exact rational arithmetic")
print("No finite-order diagnostic is used to establish the uniform theorem.")
