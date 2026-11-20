#!/usr/bin/env python3
"""Exact monotonicity obstruction checks; not a conjecture disproof."""
from math import comb
from verify import omega_values, scaled_coefficients


def count_p(t):
    # a1<a2, b1<b2<b3, b2<a2.
    return sum(u * sum(v * (t-v+1) for v in range(1, u+1))
               for u in range(1, t+1))


def count_q(t):
    # Same, with the additional relation b3<a2.
    return sum(u * comb(u+2, 3) for u in range(1, t+1))


p = omega_values(2, 3, [0, 0, 0, 0], [0, 0, 2])
q = omega_values(2, 3, [0, 0, 0, 0], [0, 0, 3])
assert p == [0, 1, 10, 47, 152, 392]
assert q == [0, 1, 9, 39, 119, 294]
for t in range(6):
    assert p[t] == count_p(t)
    assert q[t] == count_q(t)
assert scaled_coefficients(p) == [0, 8, 30, 45, 30, 7]
assert scaled_coefficients(q) == [0, 6, 35, 50, 25, 4]
assert scaled_coefficients(q)[1] < scaled_coefficients(p)[1]
print("PASS: c1 decreases from 1/15 to 1/20 by adding b3<a2")
