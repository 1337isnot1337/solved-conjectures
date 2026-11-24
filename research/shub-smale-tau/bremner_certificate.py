#!/usr/bin/env python3
"""Exact algebraic certificates for one restricted square-chain family.

Uses only the standard library. Polynomial identities are proved by exact
coefficient arithmetic, or by a degree bound plus enough exact evaluations.
This is not a proof of tau and is not Lean verification.
"""

from fractions import Fraction
from math import isqrt


def trim(a):
    a = list(a)
    while len(a) > 1 and not a[-1]:
        a.pop()
    return a


def add(a, b):
    return trim([(a[i] if i < len(a) else 0) +
                 (b[i] if i < len(b) else 0)
                 for i in range(max(len(a), len(b)))])


def scale(a, c):
    return trim([c*x for x in a])


def mul(a, b):
    out = [0]*(len(a)+len(b)-1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return trim(out)


def power(a, n):
    result = [1]
    while n:
        if n & 1:
            result = mul(result, a)
        n //= 2
        if n:
            a = mul(a, a)
    return result


def evaluate(a, x):
    result = 0
    for c in reversed(a):
        result = result*x+c
    return result


def product_polynomials(items):
    out = [1]
    for item in items:
        out = mul(out, item)
    return out


def rational_functions():
    qn = scale(mul([40, -10, 1], [2000, 1700, -20, 1]), 5)
    qd = scale(mul([10, 1], power([100, 0, 1], 2)), 9)
    rn = scale(product_polynomials([
        [0, 1], power([-20, 1], 2), power([-5, 1], 2),
        [3000000, -4780000, 2822000, -435600, 28220, -478, 3]]), 3200)
    rd = scale(mul(power([10, 1], 4), power([100, 0, 1], 4)), 81)
    zn = scale(product_polynomials([
        [0, 0, 1], power([-50, 1], 2), power([-20, 1], 4),
        power([-10, 1], 2), power([-5, 1], 4), power([-2, 1], 2),
        power([100, -160, 1], 2), [100, -16, 1]]), 51200000)
    zd = scale(mul(power([10, 1], 8), power([100, 0, 1], 8)), 6561)
    return (qn, qd), (rn, rd), (zn, zd)


def determinant_bareiss(matrix):
    """Integer fraction-free elimination with exact-division assertions."""
    a = [row[:] for row in matrix]
    n, sign, previous = len(a), 1, 1
    if n == 0:
        return 1
    for k in range(n-1):
        if a[k][k] == 0:
            swap = next((j for j in range(k+1, n) if a[j][k]), None)
            if swap is None:
                return 0
            a[k], a[swap] = a[swap], a[k]
            sign = -sign
        pivot = a[k][k]
        for i in range(k+1, n):
            for j in range(k+1, n):
                numerator = pivot*a[i][j]-a[i][k]*a[k][j]
                assert numerator % previous == 0
                a[i][j] = numerator//previous
            a[i][k] = 0
        previous = pivot
    return sign*a[-1][-1]


def off_diagonal(numerator, denominator, w):
    """Coefficients in v of [N(w)D(v)-N(v)D(w)]/(w-v)."""
    value = add(scale(denominator, evaluate(numerator, w)),
                scale(numerator, -evaluate(denominator, w)))
    degree = max(len(numerator), len(denominator))-1
    value += [0]*(degree+1-len(value))
    quotient = [0]*degree
    quotient[-1] = -value[-1]
    for i in range(degree-2, -1, -1):
        quotient[i] = w*quotient[i+1]-value[i+1]
    assert w*quotient[0] == value[0]
    return quotient


def resultant_specialization(w, q, r):
    a, b = off_diagonal(*q, w), off_diagonal(*r, w)
    assert len(a) == 5 and len(b) == 12
    # Fixed-degree Sylvester matrix also works at degree-dropping centers.
    matrix = [[0]*15 for _ in range(15)]
    for column in range(11):
        for i, c in enumerate(a):
            matrix[i+column][column] = c
    for column in range(4):
        for i, c in enumerate(b):
            matrix[i+column][11+column] = c
    return determinant_bareiss(matrix)


QUADRATICS = [
    [100, -340, 1], [2500, -280, 1], [500, -180, 1],
    [400, -120, 1], [484, -64, 1], [100, -40, 1],
    [20, -36, 1], [25, -30, 1], [20, -56, 5],
    [2500, -1600, 121],
]

# H(w)=10^24 h(w/10), where h has the following palindromic coefficients.
HALF_H = [
    734930659, -99122630504, 5777516733786, -198172933649128,
    4570750834005738, -75582744967717640, 863350845647784562,
    -6604881985712009736, 33936129544065370461,
    -118861474372035617680, 287887887927213346868,
    -487310477815369385232, 580321341648594956716,
]
H = [c*10**(24-i) for i, c in
     enumerate(HALF_H+HALF_H[-2::-1])]


def factored_resultant_without_scalar(w):
    value = (w+10)**8*(w*w+100)**18*evaluate(H, w)
    for quadratic in QUADRATICS:
        value *= evaluate(quadratic, w)
    return value


def check_resultant():
    q, r, _ = rational_functions()
    scalar = Fraction(resultant_specialization(0, q, r),
                      factored_resultant_without_scalar(0))
    assert scalar == 2**83*3**46*5**63*17**2
    # Each off-diagonal equation has bidegree at most (4,4) or (11,11).
    # Its resultant has degree at most 4*11+11*4=88. The displayed
    # factored candidate has degree 88. Equality at 89 points proves it.
    for w in range(89):
        assert resultant_specialization(w, q, r) == (
            scalar*factored_resultant_without_scalar(w))
    discriminants = []
    for c, b, a in QUADRATICS:
        discriminant = b*b-4*a*c
        assert discriminant < 0 or isqrt(discriminant)**2 != discriminant
        discriminants.append(discriminant)
    residues = [evaluate(H, w) % 13 for w in range(13)]
    assert H[-1] % 13 != 0 and all(residues)
    return scalar, discriminants, residues


class Pair:
    """Z[u,v]/(v²-u³+u²+30u-72), as two coefficient lists in u."""
    relation = [72, -30, -1, 1]

    def __init__(self, a=0, b=0):
        self.a = list(a) if isinstance(a, (list, tuple)) else [a]
        self.b = list(b) if isinstance(b, (list, tuple)) else [b]

    @staticmethod
    def cast(value):
        return value if isinstance(value, Pair) else Pair(value)

    def __add__(self, other):
        other = self.cast(other)
        return Pair(add(self.a, other.a), add(self.b, other.b))

    __radd__ = __add__

    def __neg__(self):
        return Pair(scale(self.a, -1), scale(self.b, -1))

    def __sub__(self, other):
        return self+-self.cast(other)

    def __rsub__(self, other):
        return self.cast(other)+-self

    def __mul__(self, other):
        other = self.cast(other)
        return Pair(add(mul(self.a, other.a),
                        mul(mul(self.b, other.b), self.relation)),
                    add(mul(self.a, other.b), mul(self.b, other.a)))

    __rmul__ = __mul__

    def __pow__(self, n):
        result, base = Pair(1), self
        while n:
            if n & 1:
                result = result*base
            n //= 2
            if n:
                base = base*base
        return result

    def is_zero(self):
        return trim(self.a) == [0] and trim(self.b) == [0]


def homogeneous_value(coefficients, numerator, denominator, degree):
    out = Pair(0)
    for i, coefficient in enumerate(coefficients):
        if coefficient:
            out = out+coefficient*numerator**i*denominator**(degree-i)
    return out


def check_quotient_identities():
    u, v = Pair([0, 1]), Pair(0, 1)
    a = (-21+4*u)*(3-10*u+2*u*u+v)
    b = 171+102*u-44*u*u-69*v-4*u*v
    c = (-21+4*u)*(-15+5*u+2*v)
    A = a*a*b-a*b*b+3*a*c*c-7*b*c*c
    B = c*(a*a+2*a*b-b*b+10*c*c)
    C = a*a*b-a*b*b+7*a*c*c-3*b*c*c
    D = -c*(a*a-2*a*b-b*b-10*c*c)
    E = -c*(a*a+b*b+2*a*c+2*b*c-10*c*c)
    G = -c*(a*a+b*b-2*a*c-2*b*c-10*c*c)
    pn = A*A+B*B
    total = 2*a*a*b-2*a*b*b+2*a*a*c+4*a*b*c+2*b*b*c+10*a*c*c-10*b*c*c
    difference = -8*(a+b)*c**3*(a*a+b*b-10*c*c)
    fn, hn, denominator = total*total+difference, total*total-difference, 2*total
    assert (pn-C*C-D*D).is_zero()
    assert ((pn-E*E)*denominator**2-fn*fn).is_zero()
    assert ((pn-G*G)*denominator**2-hn*hn).is_zero()
    assert ((A*A*B*B+C*C*D*D)*denominator**2-E*E*fn*fn-G*G*hn*hn).is_zero()
    aa, cc, ee, gg = 2*A*A-pn, 2*C*C-pn, 2*E*E-pn, 2*G*G-pn
    qn = aa*aa+cc*cc
    t1, t2 = aa*aa-cc*cc, ee*ee-gg*gg
    rn, sn = t1*t1+t2*t2, t1*t1-t2*t2
    t, xn = u-3, (u+6)*(u-4)
    wn = 5*(xn*xn-7*xn*t+100*t*t-6*v*(t*t+9))
    wd = (u*u-3*u-9)**2
    fractions = [(qn, 2*pn**2), (rn, 8*pn**4), (sn*sn, 64*pn**8)]
    for (n, d), (expected_n, expected_d) in zip(rational_functions(), fractions):
        degree = max(len(n), len(d))-1
        hn = homogeneous_value(n, wn, wd, degree)
        hd = homogeneous_value(d, wn, wd, degree)
        assert (expected_n*hd-expected_d*hn).is_zero()


def check_hadamard():
    for i, (n, d) in enumerate(rational_functions()):
        degree = max(len(n), len(d))-1
        # w^degree N(100/w) and w^degree D(100/w).
        transformed_n = [0]*(degree+1)
        transformed_d = [0]*(degree+1)
        for j, c in enumerate(n):
            transformed_n[degree-j] = c*100**j
        for j, c in enumerate(d):
            transformed_d[degree-j] = c*100**j
        target_n = add(d, scale(n, -1)) if i == 0 else n
        assert add(mul(transformed_n, d),
                   scale(mul(target_n, transformed_d), -1)) == [0]


def run_checks():
    check_quotient_identities()
    check_hadamard()
    _, _, residues = check_resultant()
    print('Bremner certificate: 4 construction and 3 quotient identities, 3 Hadamard identities,')
    print('degree-88 resultant proved by 89 exact determinant evaluations;')
    print('10 nonsquare discriminants and degree-24 obstruction modulo 13:', residues)


if __name__ == '__main__':
    run_checks()
