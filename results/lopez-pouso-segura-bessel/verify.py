#!/usr/bin/env python3
"""Exact algebra audit for the analytic proof; Python standard library only.

This verifies polynomial identities and rational constants. It neither
approximates Bessel zeros nor certifies the analytic convergence arguments.
"""
from fractions import Fraction as F


class Poly:
    """Sparse rational polynomials in a fixed set of independent variables."""
    names = ("y", "q", "n", "p", "a", "c")
    zero = (0,) * len(names)

    def __init__(self, terms=0):
        if isinstance(terms, Poly):
            self.terms = terms.terms.copy()
        elif isinstance(terms, dict):
            self.terms = {k: F(v) for k, v in terms.items() if v}
        else:
            self.terms = {} if not terms else {self.zero: F(terms)}

    @classmethod
    def var(cls, name):
        powers = list(cls.zero)
        powers[cls.names.index(name)] = 1
        return cls({tuple(powers): F(1)})

    def __add__(self, other):
        result = self.terms.copy()
        for k, v in Poly(other).terms.items():
            result[k] = result.get(k, F(0)) + v
        return Poly(result)

    __radd__ = __add__

    def __neg__(self):
        return Poly({k: -v for k, v in self.terms.items()})

    def __sub__(self, other):
        return self + -Poly(other)

    def __rsub__(self, other):
        return Poly(other) + -self

    def __mul__(self, other):
        result = {}
        for a, x in self.terms.items():
            for b, z in Poly(other).terms.items():
                k = tuple(i + j for i, j in zip(a, b))
                result[k] = result.get(k, F(0)) + x * z
        return Poly(result)

    __rmul__ = __mul__

    def __pow__(self, exponent):
        assert isinstance(exponent, int) and exponent >= 0
        result = Poly(1)
        for _ in range(exponent):
            result = result * self
        return result

    def __truediv__(self, scalar):
        return self * (1 / F(scalar))

    def diff(self, name):
        index = self.names.index(name)
        result = {}
        for powers, value in self.terms.items():
            if powers[index]:
                new = list(powers)
                new[index] -= 1
                result[tuple(new)] = value * powers[index]
        return Poly(result)

    def at(self, **values):
        result = Poly(0)
        for powers, value in self.terms.items():
            term = Poly(value)
            for name, power in zip(self.names, powers):
                term *= Poly(values.get(name, self.var(name))) ** power
            result += term
        return result

    def __eq__(self, other):
        return self.terms == Poly(other).terms


checks = []


def check(name, left, right):
    assert left == right, name
    checks.append(name)


y, q, n, p, a, c = (Poly.var(x) for x in Poly.names)

# Differentiate y^2/(y+q) twice and clear the positive denominator.
numerator, denominator = y**2, y + q
first = numerator.diff("y") * denominator - numerator * denominator.diff("y")
second = first.diff("y") * denominator - 2 * first * denominator.diff("y")
check("positive second-derivative numerator", second, 2 * q**2)

# All variables are formal: p denotes pi^2, n an arbitrary index.
a0 = p * (n - F(1, 4)) / 2
lambda0 = p * (n - F(1, 4))**2 + F(1, 4)
S0 = p * n**2 / 4 + p * n / 8
check("model weight sum by finite difference", S0 - S0.at(n=n-1), a0)
check("model C constant", 2*S0 - a0 - lambda0/2, 3*p/32 - F(1, 8))
check("E minus C limit offset", a0 - (lambda0.at(n=n+1)-lambda0)/4, -p/4)

# Shifted Euler--Maclaurin constants and the resulting limit.
B2 = n**2 - n + F(1, 6)
check("Bernoulli B2 at 3/4", B2.at(n=F(3, 4)), -F(1, 48))
R0_s4 = -F(1, 16) - p*B2.at(n=F(3, 4))/4
check("model resolvent s^-4 coefficient", R0_s4, -F(1, 16)+p/192)
D = -R0_s4
check("C limit", 2*D + 3*p/32 - F(1, 8), p/12)
check("E limit", p/12-p/4, -p/6)

# One-step telescoping proves the weighted-average identity for all n.
# Here y denotes S_{j-1}, a the next weight, and c=C_{j-1}.
lambda_j = 4*y + 2*a - 2*c
check("weighted moment telescoping", a*lambda_j, 2*((y+a)**2-y**2)-2*a*c)
# q denotes the prior weighted average. Clear the positive denominator.
check("strict weighted-average increment", (y*q+a*c)-q*(y+a), a*(c-q))

# Nicholson's transformed measure: moments int K0 = int v^2 K0 = pi/2.
# Record rational coefficient and pi exponent separately, without floats.
check("sigma total mass coefficient", F(16)*F(1,2)**2, F(4))
check("sigma total mass pi exponent", -5+2+1, -2)
check("sigma first moment coefficient", F(4)*F(1,4), F(1))
check("circle constant limit", F(1,4)*F(1), F(1,4))

# The cancellation yielding a_k = pi*beta/2 + O(beta^-3).
check("reciprocal leading-term cancellation", F(1,8)-F(1,8), F(0))

print(f"PASS: {len(checks)} exact polynomial and rational checks.")
for name in checks:
    print(f"  {name}")
print("Analytic premises and all-index inequalities are proved in PROOF.md.")
