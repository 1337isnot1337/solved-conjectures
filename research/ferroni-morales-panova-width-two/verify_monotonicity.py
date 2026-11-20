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


def count_r(t):
    # R: a1 global minimum; b3 global maximum;
    # independent middle a2 and b1<b2.
    return sum((t-r+1)*r*r*(r+1)//2 for r in range(1, t+1))


def count_s(t):
    # S: R plus b1<a2; middle b1<a2 and b1<b2.
    return sum((t-r+1)*r*(r+1)*(2*r+1)//6 for r in range(1, t+1))


r = omega_values(2, 3, [0, 1, 1, 2], [0, 0, 0])
s = omega_values(2, 3, [0, 1, 1, 2], [0, 0, 1])
assert r == [0, 1, 8, 33, 98, 238]
assert s == [0, 1, 7, 27, 77, 182]
for t in range(6):
    assert r[t] == count_r(t)
    assert s[t] == count_s(t)
assert scaled_coefficients(r) == [0, 12, 40, 45, 20, 3]
assert scaled_coefficients(s) == [0, 18, 45, 40, 15, 2]
assert scaled_coefficients(s)[1] > scaled_coefficients(r)[1]
print("PASS: c1 increases from 1/10 to 3/20 by adding b1<a2")
