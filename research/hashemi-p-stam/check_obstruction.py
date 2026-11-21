"""Exact check of an auxiliary obstruction, NOT of a p-Stam counterexample."""
from fractions import Fraction
from math import comb, factorial


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


n = 16
# Descending coefficients of (x-15)(x+1)^15.
f = mul([1, -15], [comb(15, k) for k in range(16)])
h = []
for k in range(n + 1):
    h.append(sum(Fraction(factorial(n-i) * factorial(n-k+i),
                          factorial(n) * factorial(n-k)) * f[i] * f[k-i]
                 for i in range(k + 1)))
expected = mul([comb(14, k) * 2**k for k in range(15)], [1, -28, 180])
assert h == expected
assert 1414213**2 < 2 * 10**12
assert 3162277**2 < 10 * 10**12
assert 3872984**2 > 15 * 10**12
margin = 82 * 1414213 + 10 * 3162277 - 30 * 3872984 - 30 * 10**6
assert margin == 1398716
assert margin > 0
print("PASS: exact finite-free coefficient identity and strict auxiliary obstruction")
print("This does not refute Hashemi's p-Stam conjecture.")
