#!/usr/bin/env python3
"""Symbolic commutator check for the diagnostic 44-cycle fresh block.

This is not a reconstruction of Sun's unprinted odd-characteristic
ordinary maps.  It verifies an obstruction to one explicit partial-
support replacement, for every nonzero assignment to its coefficients.
"""

from itertools import product

import sympy as sp


active = {0, 3, 4, 9, 12}
ordinary = set(range(16)) - active
support = [(i, j, k) for i, j, k in product(range(4), repeat=3)
           if (i ^ j) + 4 * (j ^ k) in ordinary]
assert len(support) == 44
weights = {triple: sp.Symbol("c_" + "".join(map(str, triple)), nonzero=True)
           for triple in support}
slices = {}
for i, j in product(range(4), repeat=2):
    matrix = sp.zeros(16)
    for k in range(4):
        if (i, j, k) in weights:
            matrix[4 * j + k, 4 * k + i] = weights[i, j, k]
    slices[i, j] = matrix

normalizer = sum((slices[j ^ 2, j] for j in range(4)), sp.zeros(16))
inverse = sp.zeros(16)
for j, k in product(range(4), repeat=2):
    inverse[4 * k + (j ^ 2), 4 * j + k] = 1 / weights[j ^ 2, j, k]
assert normalizer * inverse == sp.eye(16)
assert inverse * normalizer == sp.eye(16)

b = slices[3, 0] * inverse
c = slices[2, 1] * inverse
commutator = b * c - c * b
expected = sp.zeros(16)
for k in (2, 3):
    coefficient = weights[3, 0, k] * weights[2, 1, k]
    coefficient /= weights[3, 1, k] * weights[2, 0, k]
    expected[k, k] = coefficient
    expected[4 + k, 4 + k] = -coefficient
assert commutator == expected
assert sum(value != 0 for value in expected) == 4
print("44 ordinary cycles; Q=2 slice invertible for all nonzero weights.")
print("Two Q=3 normalized slices have four nonzero diagonal commutator entries.")
print("Commutator rank4 gives border rank at least18, exceeding16.")
print("This is a diagnostic block, not the paper's unprinted source map.")

