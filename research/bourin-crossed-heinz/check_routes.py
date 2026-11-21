#!/usr/bin/env python3
"""Exact rational identities for two failed sufficient proof routes.

This checks the examples in BRIDGES.md, not Bourin's conjecture or the
analytic endpoint lemmas. Only the Python standard library is used.
"""
from fractions import Fraction as F
import json


def mat(rows):
    return [[F(x) for x in row] for row in rows]


def add(a, b):
    return [[x + y for x, y in zip(r, s)] for r, s in zip(a, b)]


def scale(c, a):
    return [[c * x for x in r] for r in a]


def mul(a, b):
    return [[sum(a[i][k] * b[k][j] for k in range(len(b)))
             for j in range(len(b[0]))] for i in range(len(a))]


def transpose(a):
    return [list(r) for r in zip(*a)]


identity = mat([[1, 0], [0, 1]])
p = mat([[1, 0], [0, 0]])
q = scale(F(1, 25), mat([[9, 12], [12, 16]]))
assert mul(p, p) == p and mul(q, q) == q
s = add(scale(F(256), p), q)
c = add(scale(F(4), mul(p, q)), scale(F(64), mul(q, p)))
assert s == scale(F(1, 25), mat([[6409, 12], [12, 16]]))
assert c == scale(F(1, 25), mat([[612, 48], [768, 0]]))
# The unitary-congruence calculation in the proof gives this normalized block.
k = mat([[0, F(3, 20)], [F(12, 5), 0]])
assert mul(transpose(k), k) == mat([[F(144, 25), 0], [0, F(9, 400)]])

a = mat([[1, 0], [0, 4]])
b = mat([[2, 1], [1, 2]])
x = mat([[F(5, 8), F(1, 8)], [F(4, 35), F(11, 35)]])
assert add(mul(a, x), mul(x, b)) == b
skew = add(x, scale(F(-1), transpose(x)))
assert skew == mat([[0, F(3, 280)], [F(-3, 280), 0]])
phi_identity = add(identity, skew)
norm_squared = F(1) + F(9, 78400)
assert mul(transpose(phi_identity), phi_identity) == scale(norm_squared, identity)
assert norm_squared > 1
print(json.dumps({
    "status": "PASS",
    "scope": "Exact route-obstruction identities only; no conjecture resolution",
    "sandwich_norm_squared": str(F(144, 25)),
    "spectral_map_identity_norm_squared": str(norm_squared),
}, indent=2))
