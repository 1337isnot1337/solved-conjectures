#!/usr/bin/env python3
"""Exact rational enclosure for a counterexample to automorphic Li monotonicity.

No external packages, floating-point evaluation, or zero tables are used.
All intervals have dyadic endpoints with outward rounding after each operation.
The analytic error estimates are documented in chaudhary-khmiri-mazhouda.md.
"""
from fractions import Fraction as Q
from functools import lru_cache
from math import factorial, comb

D = 1 << 180


def ceildiv(a, b):
    return -((-a) // b)


class I:
    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi=None, raw=False):
        if raw:
            self.lo, self.hi = lo, hi
        else:
            a, b = Q(lo), Q(lo if hi is None else hi)
            self.lo = (a.numerator * D) // a.denominator
            self.hi = ceildiv(b.numerator * D, b.denominator)
        assert self.lo <= self.hi

    def __add__(self, other):
        b = ri(other)
        return I(self.lo + b.lo, self.hi + b.hi, raw=True)

    __radd__ = __add__

    def __neg__(self):
        return I(-self.hi, -self.lo, raw=True)

    def __sub__(self, other):
        return self + -ri(other)

    def __rsub__(self, other):
        return ri(other) + -self

    def __mul__(self, other):
        b = ri(other)
        p = [self.lo*b.lo, self.lo*b.hi, self.hi*b.lo, self.hi*b.hi]
        return I(min(p)//D, ceildiv(max(p), D), raw=True)

    __rmul__ = __mul__

    def reciprocal(self):
        assert self.lo*self.hi > 0
        return I((D*D)//self.hi, ceildiv(D*D, self.lo), raw=True)

    def __truediv__(self, other):
        return self * ri(other).reciprocal()

    def __rtruediv__(self, other):
        return ri(other) * self.reciprocal()

    def __pow__(self, n):
        assert isinstance(n, int) and n >= 0
        a, b = I(1), self
        while n:
            if n & 1:
                a = a*b
            b = b*b
            n >>= 1
        return a

    def widen(self, eps):
        e = Q(eps)
        assert e >= 0
        d = ceildiv(e.numerator*D, e.denominator)
        return I(self.lo-d, self.hi+d, raw=True)

    def decimal_bounds(self, places=12):
        scale = 10**places
        a, b = self.lo*scale//D, ceildiv(self.hi*scale, D)
        def fmt(v):
            sign = '-' if v < 0 else ''
            v = abs(v)
            return f'{sign}{v//scale}.{v%scale:0{places}d}'
        return '[' + fmt(a) + ', ' + fmt(b) + ']'


def ri(x):
    return x if isinstance(x, I) else I(x)


class C:
    __slots__ = ("re", "im")

    def __init__(self, re=0, im=0):
        self.re, self.im = ri(re), ri(im)

    def __add__(self, other):
        b = ci(other)
        return C(self.re+b.re, self.im+b.im)

    __radd__ = __add__

    def __neg__(self):
        return C(-self.re, -self.im)

    def __sub__(self, other):
        return self + -ci(other)

    def __rsub__(self, other):
        return ci(other) + -self

    def __mul__(self, other):
        b = ci(other)
        return C(self.re*b.re-self.im*b.im, self.re*b.im+self.im*b.re)

    __rmul__ = __mul__

    def __truediv__(self, other):
        b = ci(other)
        den = b.re*b.re+b.im*b.im
        assert den.lo > 0
        return self*C(b.re/den, -b.im/den)

    def widen(self, eps):
        return C(self.re.widen(eps), self.im.widen(eps))

    def show(self):
        return self.re.decimal_bounds() + ' + i ' + self.im.decimal_bounds()


def ci(x):
    return x if isinstance(x, C) else C(x)


def small_log(x):
    """log(x), for exact rational 1<=x<=2, by positive atanh series."""
    assert 1 <= x <= 2
    y = I((x-1)/(x+1))
    term, total = y, I(0)
    for j in range(80):
        total += 2*term/(2*j+1)
        term *= y*y
    # 2 sum_{j>=80} y^(2j+1)/(2j+1), with 0<=y<=1/3.
    rem = Q(9, 4*161*3**161)
    return I(total.lo, total.hi+ceildiv(rem.numerator*D, rem.denominator), raw=True)


LOG2 = small_log(Q(2))


@lru_cache(None)
def logq(x):
    x = Q(x)
    assert x > 0
    k = 0
    while x >= 2:
        x /= 2
        k += 1
    while x < 1:
        x *= 2
        k -= 1
    return small_log(x)+k*LOG2


def logi(x):
    assert x.lo > 0
    a, b = logq(Q(x.lo, D)), logq(Q(x.hi, D))
    return I(a.lo, b.hi, raw=True)


def expi(x):
    """exp(i*x), using exp(i*x/512) and nine squarings."""
    y = x/512
    assert max(abs(y.lo), abs(y.hi))*8 <= D
    z, term, total = C(0, y), C(1), C(1)
    for j in range(1, 32):
        term = term*z*C(Q(1, j))
        total += term
    # exp(|y|)<2 for |y|<=1/8.
    total = total.widen(Q(2, 8**32*factorial(32)))
    for _ in range(9):
        total = total*total
    return total


def ja(a, b):
    return [x+y for x, y in zip(a, b)]


def jm(a, b):
    return [sum((a[k]*b[n-k]*comb(n, k) for k in range(n+1)), C()) for n in range(3)]


def js(a, c):
    return [x*c for x in a]


def jc(c):
    return [ci(c), C(), C()]


@lru_cache(None)
def ej(n):
    """The value and first two derivatives of n^(-s), at s=1+8i."""
    ell = logq(Q(n))
    v = expi(-8*ell)*C(Q(1, n))
    return [v, v*C(-ell), v*C(ell*ell)]


def em_jet():
    m, a, b = 32, 97, 98
    total = jc(0)
    for k in range(m):
        total = ja(total, ja(ej(3*k+1), js(ej(3*k+2), -1)))
    diff = lambda power: ja(js(ej(a), Q(a)**power), js(ej(b), -Q(b)**power))
    # Jets use full derivatives, not coefficients divided by factorial.
    s = [C(1, 8), C(1), C()]
    inv_sminus1 = [C(0, Q(-1, 8)), C(Q(1, 64)), C(0, Q(1, 256))]
    total = ja(total, js(jm(diff(1), inv_sminus1), Q(1, 3)))
    total = ja(total, js(diff(0), Q(1, 2)))
    total = ja(total, js(jm(s, diff(-1)), Q(1, 4)))
    rising = jm(jm(s, ja(s, jc(1))), ja(s, jc(2)))
    total = ja(total, js(jm(rising, diff(-3)), Q(-3, 80)))
    # Uniform Euler--Maclaurin remainder <1/100000 on |s-(1+8i)|<=1/4.
    # Cauchy gives j! 4^j /100000 for the jth derivative.
    errors = [Q(1, 100000), Q(4, 100000), Q(32, 100000)]
    return [v.widen(e) for v, e in zip(total, errors)]


def atan_unit_fraction(d):
    total = I(0)
    for k in range(50):
        total += Q((-1)**k, (2*k+1)*d**(2*k+1))
    # Next term is positive; the alternating tail is smaller than it.
    r = Q(1, 101*d**101)
    return I(total.lo, total.hi+ceildiv(r.numerator*D, r.denominator), raw=True)


def gamma_contribution():
    pi = 16*atan_unit_fraction(5)-4*atan_unit_fraction(239)
    # Integral comparison gives H_K-log K-1/K < Euler gamma < H_K-log K.
    harmonic = sum((I(Q(1, k)) for k in range(1, 1001)), I(0))
    upper = harmonic-logq(Q(1000))
    gamma = I(upper.lo-ceildiv(D, 1000), upper.hi, raw=True)
    kmax = 100
    a = sum((I(Q(16, k*(k*k+16))) for k in range(1, kmax+1)), I(0))
    b = sum((I(Q(k*k-16, (k*k+16)**2)) for k in range(1, kmax+1)), I(0))
    # Decreasing positive tails, bounded by their integrals at K+1 and K.
    atail_lo = logq(Q((kmax+1)**2+16, (kmax+1)**2))/2
    atail_hi = logq(Q(kmax*kmax+16, kmax*kmax))/2
    a += I(atail_lo.lo, atail_hi.hi, raw=True)
    b += I(Q(kmax+1, (kmax+1)**2+16), Q(kmax, kmax*kmax+16))
    repsi = -gamma+a
    repsiprime = b
    return (logq(Q(3))-logi(pi))/2+repsi/2+repsiprime/4


def main():
    l0, l1, l2 = em_jet()
    for name, value in [('L', l0), ("L'", l1), ("L''", l2)]:
        print(name, value.show())
    gamma = gamma_contribution()
    print('Gamma contribution', gamma.decimal_bounds())
    ratio = l1/l0
    delta = gamma+(ratio+l2/l0-ratio*ratio).re
    print('Re(lambda(2)-lambda(1))', delta.decimal_bounds())
    assert delta.hi*2 < -3*D, 'Required strict bound Delta < -3/2 not certified'
    print('PASS: Re(lambda(2)-lambda(1)) < -3/2 < 0')


if __name__ == '__main__':
    main()
