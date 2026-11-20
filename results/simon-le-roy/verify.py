#!/usr/bin/env python3
"""Exact algebra checks for Simon's Le Roy counterexample.

This program uses only integers and rational numbers. It does not approximate
Gamma functions, Le Roy functions, probability densities, or derivatives.
The probability construction and all-parameter conclusion are proved in the
written manuscript, not by these finite checks.
"""

from fractions import Fraction as F
from math import factorial


def clean(p):
    p = list(p)
    while len(p) > 1 and not p[-1]:
        p.pop()
    return tuple(p)


def add(p, q):
    r = [F(0)] * max(len(p), len(q))
    for i, x in enumerate(p):
        r[i] += x
    for i, x in enumerate(q):
        r[i] += x
    return clean(r)


def mul(p, q):
    r = [F(0)] * (len(p) + len(q) - 1)
    for i, x in enumerate(p):
        for j, y in enumerate(q):
            r[i + j] += x * y
    return clean(r)


def scale(c, p):
    return clean([c * x for x in p])


def product(values):
    out = F(1)
    for x in values:
        out *= x
    return out


def rising(x, n):
    return product(x + k for k in range(n))


def r_value(s):
    return (s + beta) ** 2 * (s + 2) / ((s + a) * (s + b) * (s + 1))


a, b, beta = F(1, 3), F(2, 3), F(13, 30)
A, B, C = F(3, 40), F(-49, 75), F(289, 200)

# A polynomial identity in s verifies the partial fractions for every s.
den = mul(mul((a, F(1)), (b, F(1))), (F(1), F(1)))
num = mul(mul((beta, F(1)), (beta, F(1))), (F(2), F(1)))
rhs = den
rhs = add(rhs, scale(A, mul((b, F(1)), (F(1), F(1)))))
rhs = add(rhs, scale(B, mul((a, F(1)), (F(1), F(1)))))
rhs = add(rhs, scale(C, mul((a, F(1)), (b, F(1)))))
assert num == rhs

# Exact positivity certificate for the inverse-Laplace quadratic.
disc = B * B - 4 * A * C
assert disc == F(-599, 90000)
minimum = A - B * B / (4 * C)
assert C > 0 and minimum > 0
square = add(scale(C, mul((B / (2 * C), F(1)),
                         (B / (2 * C), F(1)))), (minimum,))
assert square == (A, B, C)

# The atom and density in the first tilted law have exactly total mass one.
mass = 1 + A / a + B / b + C
assert mass == r_value(F(0)) == F(169, 100)
assert F(100, 169) * mass == 1

# Exact witness for the strict scalar-inequality violation.
gap = 16 ** 11 - 21 ** 10
assert gap == 912305066215 and gap > 0
assert F(2) ** 10 * F(1, 4) ** 3 - F(21, 16) ** 10 == F(
    912305066215, 1099511627776
)
assert F(32, 21) < 2

# Verify the finite product formula before its analytic limit is taken.
finite_products = 0
for n in range(9):
    for s in [F(0), F(1, 7), F(1, 3), F(1), F(7, 3), F(5)]:
        direct = product(r_value(j + s) / r_value(F(j))
                         for j in range(n + 1))
        factored = product(rising(c + s, n + 1) / rising(c, n + 1)
                           for c in (beta, beta, F(2)))
        factored *= product(rising(d, n + 1) / rising(d + s, n + 1)
                            for d in (a, b, F(1)))
        assert direct == factored
        finite_products += 1

# Triplication at integer k tests the exact normalization X=3*Y^(1/3).
triplications = 0
for k in range(21):
    left = F(3) ** (3 * k) * rising(a, k) * rising(b, k) * rising(F(1), k)
    right = F(factorial(3 * k))
    assert left == right
    triplications += 1

# Independently check the beta-product extension by rational Pochhammer moments.
beta_products = 0
for beta_new in [F(7, 16), F(1, 2), F(2, 3), F(1), F(7, 3)]:
    assert beta_new > beta
    for k in range(16):
        base = rising(a, k) * rising(b, k) * rising(F(1), k) / rising(beta, k) ** 2
        extended = base * (rising(beta, k) / rising(beta_new, k)) ** 2
        target = rising(a, k) * rising(b, k) * rising(F(1), k) / rising(beta_new, k) ** 2
        assert extended == target
        beta_products += 1

print("PASS: exact partial fractions, completed-square positivity, normalization, "
      "and strict integer violation")
print(f"PASS: {finite_products} finite product identities, "
      f"{triplications} triplication normalizations, "
      f"{beta_products} beta-product moment identities")
print("No floating-point or special-function evaluation was used.")
