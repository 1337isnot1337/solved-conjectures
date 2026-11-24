"""Exact replays for relative-gauge fixed-span identities.

The all-parameter proof is in RELATIVE_OUTPUT_GAUGE.md
(RELATIVE_OUTPUT_GAUGE.md in the repository). These examples check
the gauge orientation, centering, exterior signs, and global fixed
matrix expansion. They do not check a six-index tensor trade.
"""

from math import comb

import sympy as sp

from irf_vertex_exact_candidate import exterior_power, gauge


def pascal(z, size):
    z = sp.sympify(z)
    return sp.Matrix([
        [sp.binomial(a, b) * z ** (a - b) if b <= a else 0
         for b in range(size)]
        for a in range(size)
    ])


def interpolation_row(z, q):
    z = sp.sympify(z)
    q = tuple(map(sp.sympify, q))
    size = len(q)
    mean = sum(q) / size
    x = sp.Symbol("x")
    characteristic = sp.Poly(sp.prod(x - (a - mean) for a in q), x)
    assert characteristic.nth(size - 1) == 0
    return sp.Matrix([[
        sp.binomial(size, a) * z ** (size - a)
        - characteristic.nth(a)
        - sp.binomial(size - 1, a) * z ** (size - 1 - a)
        for a in range(size - 1)
    ] + [size * z - 1]])


def assert_zero(matrix):
    assert all(sp.cancel(a) == 0 for a in matrix)


def replay(size, degree, q, u, v):
    u, v = map(sp.sympify, (u, v))
    e = sp.eye(size)[:, size - 1]
    translation = pascal(v - u, size)
    w_u = interpolation_row(u, q)
    w_v = interpolation_row(v, q)
    row = (w_v - v / u * w_u) * pascal(-u, size)
    direct = gauge(v, q) * gauge(u, q).inv()
    assert_zero(direct - translation - e * row)

    base = exterior_power(translation, degree)
    coefficients = [
        exterior_power(translation + e * sp.eye(size)[j, :], degree) - base
        for j in range(size)
    ]
    expansion = base.copy()
    for j, coefficient in enumerate(coefficients):
        expansion += row[j] * coefficient
    direct_exterior = exterior_power(direct, degree)
    assert_zero(direct_exterior - expansion)

    # Check the columnwise span by its minors, independently of a
    # particular formula for the exterior contraction signs.
    for column in range(comb(size, degree)):
        fixed_span = sp.Matrix.hstack(
            base[:, column], *(c[:, column] for c in coefficients)
        )
        assert fixed_span.rank() <= degree + 1

    print(f"s={size}, k={degree}: relative gauge, global span, "
          "and column span pass exactly")


def main():
    replay(2, 1, (sp.Rational(1, 6), sp.Rational(-1, 6)), 2, 5)
    replay(3, 2, (-3, 1, 7), sp.Rational(4, 3), sp.Rational(-5, 2))
    replay(5, 2, (-7, -2, 1, 5, 11), 2, 0)
    replay(6, 3, (-8, -3, 0, 2, 7, 13), sp.Rational(5, 3), 4)

    # Same generic spectral parameters and freely varying centered q.
    t, u, v = sp.symbols("t u v", nonzero=True)
    e = sp.Matrix([0, 1])
    row = (interpolation_row(v, (-t, t))
           - v / u * interpolation_row(u, (-t, t))) * pascal(-u, 2)
    assert_zero(gauge(v, (-t, t)) * gauge(u, (-t, t)).inv()
                - pascal(v - u, 2) - e * row)
    print("s=2: symbolic q and spectral parameters pass exactly")

    # The opposite orientation cannot inherit the fixed last-row claim.
    q = (-3, 1, 7)
    opposite = gauge(2, q).inv() * gauge(5, q) - pascal(3, 3)
    assert any(a != 0 for a in opposite[:2, :])
    print("Opposite-ratio fixed-image assertion fails, as required")


if __name__ == "__main__":
    main()
