#!/usr/bin/env python3
"""Exact symbolic checks of the algebra in PROOF.md.

This is a supplementary audit, not the analytic proof. It uses only the Python
standard library and checks identities in formal parameters a, b, s, n rather
than evaluating selected numerical cases.
"""

from collections import Counter
from dataclasses import dataclass, field
from fractions import Fraction as F


@dataclass(frozen=True)
class Lin:
    # Coefficients of a, b, s, n, 1.
    v: tuple

    def __add__(self, other):
        other = lin(other)
        return Lin(tuple(x + y for x, y in zip(self.v, other.v)))

    __radd__ = __add__

    def __neg__(self):
        return Lin(tuple(-x for x in self.v))

    def __sub__(self, other):
        return self + -lin(other)

    def __rsub__(self, other):
        return lin(other) + -self

    def __mul__(self, scalar):
        return Lin(tuple(F(scalar) * x for x in self.v))

    __rmul__ = __mul__

    def __truediv__(self, scalar):
        return self * (1 / F(scalar))


def lin(x):
    return x if isinstance(x, Lin) else Lin((F(0),) * 4 + (F(x),))


a, b, s, n = [Lin(tuple(F(i == j) for i in range(4)) + (F(0),))
               for j in range(4)]
half = F(1, 2)
checks = 0


def same(x, y):
    global checks
    assert x == y, (x, y)
    checks += 1


# Möbius substitution v=(1-y)/(1+y), including its Jacobian.
same(-(2*b-s-1) + 2*(b+half) - s - 2, lin(0))
same(-2*(b+half) + 1, -2*b)
# Quadratic-transformation parameters.
same(1-s-(half-b), b+half-s)
same((-s+1)/2, (1-s)/2)
# x=2y/(1-y) in the convolution Mellin integral.
same((2*a+s-1) - (2*a+2*b) + 1 + 2*(a+b), 2*a+s)
same(-(2*a+s-1) + (2*a+2*b) - 2, 2*b-s-1)
# t=1-u^2 in the outer mixing integral.
same((2*a-1)/2-half, a-1)
# Euler transformation of the source hypergeometric factor.
same(a+half-(a+s/2), (1-s)/2)
same(a+half-(a+(s+1)/2), -s/2)
same(a+half-(a+s/2)-(a+(s+1)/2), -a-s)
same((a+b-1)+(-a-s), b-s-1)
# Both 3F2 convergence excesses.
same((a+half)+(a+b+half)-(a+s/2)-(a+(s+1)/2)-half, b-s)
same((b+half-s)+(a+half)-(-s/2)-(1-s)/2-half, a+b)


def product_of_linear(x, y):
    """Sparse quadratic polynomial with exact rational coefficients."""
    ans = Counter()
    for i, xi in enumerate(x.v):
        for j, yj in enumerate(y.v):
            ans[tuple(sorted((i, j)))] += xi*yj
    return {k: v for k, v in ans.items() if v}


# Formal n-step coefficient identities behind rising-factorial duplication.
same(product_of_linear(2*a+s+2*n, 2*a+s+2*n+1),
     {k: 4*v for k, v in product_of_linear(a+s/2+n,
                                          a+(s+1)/2+n).items()})
same(product_of_linear(2*a+2*b+2*n, 2*a+2*b+2*n+1),
     {k: 4*v for k, v in product_of_linear(a+b+n,
                                          a+b+half+n).items()})


@dataclass
class GammaProduct:
    """Formal 2^power2 * pi^power_pi * product Gamma(argument)^integer."""
    power2: Lin = field(default_factory=lambda: lin(0))
    power_pi: F = F(0)
    gammas: Counter = field(default_factory=Counter)

    def mul_gamma(self, argument, exponent=1):
        self.gammas[lin(argument)] += exponent
        return self

    def normalize_half(self):
        # Gamma(1/2)=sqrt(pi).
        self.power_pi += self.gammas.pop(lin(half), 0)*half
        return self

    def duplicate(self, z):
        # Gamma(2z)=2^(2z-1) pi^(-1/2) Gamma(z) Gamma(z+1/2).
        exponent = self.gammas.pop(2*z, 0)
        assert exponent != 0
        self.power2 += exponent*(2*z-1)
        self.power_pi -= exponent*half
        self.mul_gamma(z, exponent).mul_gamma(z+half, exponent)
        return self

    def key(self):
        return (self.power2, self.power_pi,
                {k: v for k, v in self.gammas.items() if v})


# Equation (11), directly from the ratio of beta functions in (9).
mixing = GammaProduct(s-2*b+1)
for arg, exp in [(half-b, 1), (2*b-s, 1), (b+half-s, -1),
                 (half, 1), (b, -1), (half-b, -1)]:
    mixing.mul_gamma(arg, exp)
mixing.normalize_half()
K = GammaProduct(s-2*b+1, half)
K.mul_gamma(2*b-s).mul_gamma(b, -1).mul_gamma(b+half-s, -1)
same(mixing.key(), K.key())

# Alternative half-argument expression for K, via gamma duplication.
K.duplicate(b-s/2)
K_half = GammaProduct()
for arg, exp in [(b-s/2, 1), (b+(1-s)/2, 1),
                 (b, -1), (b+half-s, -1)]:
    K_half.mul_gamma(arg, exp)
same(K.key(), K_half.key())

# Equation (13): source Mellin constant times Euler-transform constant.
left = GammaProduct(2*a+s)
for arg, exp in [(a+b, 2), (2*b-s, 1), (2*a+s, 1),
                 (2*a, -1), (b, -2), (2*a+2*b, -1),
                 (a+b+half, 1), (b-s, 1),
                 (a+b, -1), (b+half-s, -1)]:
    left.mul_gamma(arg, exp)
left.duplicate(a+b)
right = GammaProduct(s-2*b+1, half)
for arg, exp in [(2*a+s, 1), (b-s, 1), (2*a, -1), (b, -1),
                 (2*b-s, 1), (b, -1), (b+half-s, -1)]:
    right.mul_gamma(arg, exp)
same(left.key(), right.key())

print(f"PASS: {checks} exact symbolic identities in formal parameters a,b,s,n")
