#!/usr/bin/env python3
"""Exact audit of Zhu's unweighted generalized Jacobi--Stirling conjecture.

Only Python integers and sparse polynomials are used. No CAS, floating point,
external packages, numerical searches, or Lean are required.
"""

from itertools import permutations


def add(p, q):
    out = dict(p)
    for exponent, coefficient in q.items():
        out[exponent] = out.get(exponent, 0) + coefficient
        if out[exponent] == 0:
            del out[exponent]
    return out


def scale(p, coefficient):
    return {e: coefficient * c for e, c in p.items() if coefficient * c}


def multiply(p, q):
    out = {}
    for ep, cp in p.items():
        for eq, cq in q.items():
            e = tuple(a + b for a, b in zip(ep, eq))
            out[e] = out.get(e, 0) + cp * cq
    return {e: c for e, c in out.items() if c}


def evaluate(p, a, b, x):
    return sum(c * a**e[0] * b**e[1] * x**e[2] for e, c in p.items())


ONE = {(0, 0, 0): 1}
A = {(1, 0, 0): 1}
B = {(0, 1, 0): 1}
X = {(0, 0, 1): 1}

# Build the triangle from the literal source recurrence, independently of
# the row formulas and determinant factorization in the proof.
triangle = [[ONE]]
for n in range(1, 5):
    old = triangle[-1]
    row = []
    for k in range(n + 1):
        left = old[k - 1] if k > 0 else {}
        same = old[k] if k < len(old) else {}
        weight = add(scale(A, k * k), scale(B, k))
        row.append(add(left, multiply(weight, same)))
    triangle.append(row)

polynomials = []
for row in triangle:
    polynomial = {}
    for k, coefficient in enumerate(row):
        polynomial = add(polynomial, multiply(coefficient, {(0, 0, k): 1}))
    polynomials.append(polynomial)

# The permutation definition of a determinant avoids the row-operation
# derivation used in the written proof.
determinant = {}
for permutation in permutations(range(3)):
    inversions = sum(permutation[i] > permutation[j]
                     for i in range(3) for j in range(i + 1, 3))
    term = ONE
    for i in range(3):
        term = multiply(term, polynomials[i + permutation[i]])
    determinant = add(determinant, scale(term, (-1)**inversions))

expected = {
    (3, 0, 3): 12,
    (2, 1, 3): 22,
    (1, 2, 3): 12,
    (0, 3, 3): 2,
    (2, 0, 4): -4,
}
assert determinant == expected, (determinant, expected)
assert determinant[(2, 0, 4)] == -4

# Independent reconstruction of the asserted factorization.
product = ONE
for k in (1, 2, 3):
    product = multiply(product, add(scale(A, k), B))
bracket = add(product, scale(multiply(multiply(A, A), X), -2))
factorized = scale(multiply({(0, 0, 3): 1}, bracket), 2)
assert determinant == factorized

assert evaluate(determinant, 1, 1, 13) == -8788
assert [evaluate(p, 1, 0, 4) for p in polynomials] == [1, 4, 20, 148, 1492]
assert evaluate(determinant, 1, 0, 4) == -256

print("Verified the full determinant polynomial over Z[a,b,x].")
print("Exponents are (a,b,x):", sorted(determinant.items()))
print("Coefficient a^2*x^4 = -4.")
print("Interior illustration (a,b,x)=(1,1,13): -8788.")
