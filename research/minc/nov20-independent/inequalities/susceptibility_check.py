"""Exact algebra checks for susceptibility_bridge.md; no finite-case proof."""

from fractions import Fraction as F


def add(a, b):
    return tuple(x + y for x, y in zip(a, b))


def mul(a, b):
    return (a[0] * b[0],
            a[1] * b[0] + a[0] * b[1],
            a[2] * b[0] + 2 * a[1] * b[1] + a[0] * b[2])


def scale(c, a):
    return tuple(c * x for x in a)


ZERO = (F(0), F(0), F(0))
ONE = (F(1), F(0), F(0))


def mmul(a, b):
    return [[add(mul(a[i][0], b[0][j]), mul(a[i][1], b[1][j]))
             for j in range(2)] for i in range(2)]


def mpow(a, n):
    out = [[ONE, ZERO], [ZERO, ONE]]
    while n:
        if n & 1:
            out = mmul(out, a)
        a = mmul(a, a)
        n //= 2
    return out


def pow3(a):
    return mul(mul(a, a), a)


def transfer(f, z):
    """Return R, (z d/dz)R, (z d/dz)^2 R at rational activity z."""
    x = F(z, 3)
    X = (x, x, x)
    X2 = (x * x, 2 * x * x, 4 * x * x)
    t = [[add(add(ONE, scale(5, X)), scale(4, X2)),
          add(X, scale(3, X2))],
         [add(ONE, scale(3, X)), add(X, X2)]]
    d = mpow(t, f)
    b00, b01 = d[0]
    b10, b11 = mul(X, d[1][0]), mul(X, d[1][1])
    return add(add(pow3(b00),
                   scale(3, mul(add(add(b10, b01), b11), mul(b00, b00)))),
               scale(6, mul(mul(b10, b01), b00)))


def build_integer_matrix(f):
    """Return 3 A_f. All row and column sums equal three."""
    n = 6 * f + 1
    a = [[0] * n for _ in range(n)]
    for branch in range(3):
        previous_left = 0
        for block in range(f):
            marked = 1 + 2 * (branch * f + block)
            unmarked = marked + 1
            a[previous_left][marked] = 1
            a[marked][unmarked] = 2
            a[unmarked][marked] = 2
            a[unmarked][unmarked] = 1
            previous_left = marked
        a[previous_left][0] = 1
    assert all(sum(row) == 3 for row in a)
    assert all(sum(row[j] for row in a) == 3 for j in range(n))
    return a


def rook_coefficients(a):
    """Independent row/subset matching enumeration, with integer arithmetic."""
    n = len(a)
    d = {0: 1}
    for row in a:
        e = dict(d)
        for mask, weight in d.items():
            for j, entry in enumerate(row):
                if entry and not (mask >> j) & 1:
                    other = mask | (1 << j)
                    e[other] = e.get(other, 0) + entry * weight
        d = e
    c = [0] * (n + 1)
    for mask, weight in d.items():
        c[mask.bit_count()] += weight
    return c


def reciprocal_jet(f):
    """Return Q(0), Q'(0), Q''(0) through ordinary derivative jets."""
    W = (F(0), F(1), F(0))
    W2 = mul(W, W)
    a = [[add(add(scale(F(4, 9), ONE), scale(F(5, 3), W)), W2),
          add(scale(F(1, 3), ONE), scale(F(1, 3), W))],
         [add(W, W2), add(scale(F(1, 9), ONE), scale(F(1, 3), W))]]
    e = mpow(a, f)
    e00, e01 = e[0]
    e10, e11 = e[1]
    return add(add(mul(W, pow3(e00)),
                   scale(3, mul(mul(W, e01), mul(e00, e00)))),
               add(mul(add(e10, e11), mul(e00, e00)),
                   scale(2, mul(mul(e10, e01), e00))))


def check_symbolic_identity():
    # The two-variable identity is checked independently at enough exact
    # points to determine its numerator polynomial (degree at most two in
    # each variable), after multiplication by 1+q.
    for t in map(F, (0, 1, 2)):
        for q in map(F, (0, 1, 2)):
            lhs = ((-2*t*t + (-1+2*t+t*t)*q) * (1+q)
                   + (1+t)**2*q*(1-q))
            assert lhs == -2*(q-t)**2


def main():
    check_symbolic_identity()
    for f in (1, 2):
        c = rook_coefficients(build_integer_matrix(f))
        for z in (F(1, 3), F(2), F(7, 2)):
            x = z / 3
            expected = tuple(sum(F(v)*x**k*k**d
                                 for k, v in enumerate(c)) for d in range(3))
            assert transfer(f, z) == expected
    for f in range(1, 17):
        q0, q1, _ = reciprocal_jet(f)
        a = F(4, 9)
        eps = F(1, 4**f)
        assert q0 == a**(3*f)*eps
        assert q1 == a**(3*f)*(16+(6*f-27)*eps+12*eps**2)
    witnesses = []
    for f in (4, 8, 12, 16):
        z = 2**f
        r0, r1, r2 = transfer(f, z)
        mu = r1/r0
        variance = r2/r0 - mu*mu
        n = 6*f+1
        target = mu*(n-mu)/(n+mu)
        if variance < target:
            witnesses.append(f)
        print(f"f={f}, n={n}, z={z}, variance={float(variance):.9g}, "
              f"auxiliary_bound={float(target):.9g}, "
              f"exact_violation={variance < target}")
    assert witnesses
    print("Exact transfer, two leading coefficients, and curvature identity agree.")


if __name__ == "__main__":
    main()
