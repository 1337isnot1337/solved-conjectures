"""Exact finite checks of the unknown-cofactor recovery, using only stdlib.

Recovery reads H, N, d, a good shift h, and the occurring multiplicities.
The factorization used to construct each test is used only for assertions.
These finite checks do not establish the asymptotic circuit theorem.
"""

from fractions import Fraction as F
from functools import reduce
from math import lcm


def trim(a):
    a = list(map(F, a))
    while len(a) > 1 and not a[-1]:
        a.pop()
    return a or [F(0)]


def add(a, b):
    c = [F(0)] * max(len(a), len(b))
    for i, x in enumerate(a):
        c[i] += x
    for i, x in enumerate(b):
        c[i] += x
    return trim(c)


def scale(a, c):
    return trim([c * x for x in a])


def sub(a, b):
    return add(a, scale(b, -1))


def mul(a, b):
    c = [F(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return trim(c)


def power(a, k):
    out = [F(1)]
    while k:
        if k & 1:
            out = mul(out, a)
        a = mul(a, a)
        k //= 2
    return out


def derivative(a):
    return trim([i * a[i] for i in range(1, len(a))])


def shift(a, t):
    out = [F(0)]
    for c in reversed(a):
        out = add(mul(out, [F(t), F(1)]), [c])
    return out


def divmod_poly(a, b):
    a, b = trim(a), trim(b)
    assert b != [F(0)]
    q = [F(0)] * max(1, len(a) - len(b) + 1)
    while a != [F(0)] and len(a) >= len(b):
        k = len(a) - len(b)
        c = a[-1] / b[-1]
        q[k] += c
        a = sub(a, [F(0)] * k + scale(b, c))
    return trim(q), trim(a)


def monic(a):
    a = trim(a)
    assert a != [F(0)]
    return scale(a, 1 / a[-1])


def gcd_poly(a, b):
    while trim(b) != [F(0)]:
        a, b = b, divmod_poly(a, b)[1]
    return monic(a)


def jet(a, t, order):
    """Horner evaluation modulo z**order, without a high-degree shift."""
    out = [F(0)] * order
    for c in reversed(a):
        out = [t * out[0]] + [t * out[j] + out[j - 1] for j in range(1, order)]
        out[0] += c
    return out


def series_div(a, b, order):
    assert b[0]
    v = []
    for k in range(order):
        num = a[k] - sum((b[i] * v[k - i] for i in range(1, k + 1)), F(0))
        v.append(num / b[0])
    return v


def log_derivative_jet(a, t, order):
    return series_div(jet(derivative(a), t, order), jet(a, t, order), order)


def solve(matrix, rhs):
    n = len(rhs)
    rows = [list(row) + [value] for row, value in zip(matrix, rhs)]
    for col in range(n):
        pivot = next(i for i in range(col, n) if rows[i][col])
        rows[col], rows[pivot] = rows[pivot], rows[col]
        denom = rows[col][col]
        rows[col] = [v / denom for v in rows[col]]
        for i in range(n):
            if i != col:
                factor = rows[i][col]
                rows[i] = [a - factor * b for a, b in zip(rows[i], rows[col])]
    return [rows[i][-1] for i in range(n)]


def falling(N):
    return reduce(mul, ([-j, 1] for j in range(1, N + 1)), [F(1)])


def recovery(H, N, d, h, multiplicities):
    M, order = 2 * d, 4 * d
    t = sum(abs(c) for c in H)
    assert t.denominator == 1 and t > N
    D = reduce(mul, ([i, 1] for i in range(h)), [F(1)])
    E = shift(D, -N)
    parts = [
        log_derivative_jet(H, t + h, order),
        log_derivative_jet(H, t, order),
        log_derivative_jet(D, t, order),
        log_derivative_jet(E, t, order),
    ]
    ell = [a - b - c + e for a, b, c, e in zip(*parts)]
    matrix = [[ell[k - j] for j in range(1, M + 1)] for k in range(M, 2 * M)]
    Rz = [F(1)] + solve(matrix, [-ell[k] for k in range(M, 2 * M)])
    Az = mul(Rz, ell)[:M]
    # Use one common integer for BOTH coefficient lists. This tests the
    # required residue-preserving scalar choice, rather than circuit cost.
    common = lcm(*(x.denominator for x in Az + Rz))
    A, R = shift(scale(Az, common), -t), shift(scale(Rz, common), -t)
    assert all(c.denominator == 1 for c in A + R)
    assert len(R) - 1 == M
    assert gcd_poly(R, derivative(R)) == [F(1)]
    bases = {}
    for m in multiplicities:
        G = gcd_poly(R, add(A, scale(derivative(R), m)))
        assert len(G) > 1
        # Deliberately introduce an extra common integer factor. This
        # exercises the rational, possibly nonintegral scalar amendment.
        denominator = 2 * lcm(*(c.denominator for c in G))
        bases[m] = scale(G, denominator)
    return A, R, bases


def check_case(name, N, factors, scalar=1):
    Q = [F(scalar)]
    radical = [F(1)]
    expected = {}
    for factor, multiplicity in factors:
        Q = mul(Q, power(factor, multiplicity))
        radical = mul(radical, factor)
        expected[multiplicity] = mul(expected.get(multiplicity, [F(1)]), monic(factor))
    radical = monic(radical)
    assert gcd_poly(radical, derivative(radical)) == [F(1)]
    d = len(radical) - 1
    H = mul(falling(N), Q)
    h = next(k for k in range(1, d * d + 2) if gcd_poly(radical, shift(radical, k)) == [F(1)])
    A, R, bases = recovery(H, N, d, h, sorted(expected))
    assert monic(R) == monic(mul(radical, shift(radical, h)))
    for m, G in expected.items():
        assert monic(bases[m]) == monic(G)
    reconstructed = reduce(mul, (power(bases[m], m) for m in sorted(bases)), [F(1)])
    quotient, remainder = divmod_poly(Q, reconstructed)
    assert remainder == [F(0)] and len(quotient) == 1 and quotient[0]
    assert quotient[0].denominator > 1
    # Check the recovered rational function directly, independently of its
    # defining H-based jet and Padé computation.
    expected_num = sub(mul(shift(derivative(Q), h), Q), mul(derivative(Q), shift(Q, h)))
    expected_den = mul(shift(Q, h), Q)
    assert mul(A, expected_den) == mul(R, expected_num)
    assert sum(len(G) - 1 for G in bases.values()) == d
    print(f"PASS {name}: degree(H)={len(H)-1}, d={d}, h={h}, multiplicities={sorted(expected)}")


def run_checks():
    check_case("overlap-and-complex-roots", 3, [([-2, 1], 4), ([1, 1], 2), ([1, 0, 1], 3)])
    check_case("bad-unit-shift-skipped", 4, [([0, 1], 8), ([-1, 1], 3)])
    check_case("nonmonic-and-rational-scalar", 5, [([-3, 2], 8), ([1, 0, 1], 5), ([-2, 1], 7)], scalar=-3)
    check_case("uniform-power-overlap", 3, [([-1, 1], 3), ([-2, 1], 3), ([-3, 1], 3)])
    check_case("irrational-real-roots", 2, [([-2, 0, 1], 5), ([3, 1], 2)])
    print("All five exact recovery examples passed.")


if __name__ == "__main__":
    run_checks()
