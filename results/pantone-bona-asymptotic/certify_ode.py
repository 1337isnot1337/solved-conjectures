#!/usr/bin/env python3
"""Exact certificate for the Bóna–Pantone A55 differential equation.

Requires SymPy (tested with 1.14). All equalities are over rational-function
fields, not finite power-series tests. See ode-proof.md for the passage from
the hook sum to the rational identities checked here.
"""
from sympy.polys.fields import field
from sympy.polys.domains import QQ
from sympy.polys.matrices import DomainMatrix

F, z, x = field("z,x", QQ)
R = x.numer.ring
U, uz, ux, y = field("z,x,y", QQ)
V = QQ.poly_ring("z")
vz = V.gens[0]
poles = {
    "x": x,
    "a": x + 2,
    "t": x * z + 2 * z - 1,
    "q": z * x**2 + 6 * z * x - x + 4 * z,
    "b": 4 * z * x - x + 4 * z,
}
P = poles["x"] * poles["t"] * poles["q"]
Q = -poles["x"] * poles["b"]


def integrands():
    """Return the rational, elliptic and genus-zero rational coefficients."""
    X = 1 + ux
    B = 1 + y * X
    T = 1 - uz * B
    s = uz * X / ux
    PP = ux * T * (ux * T - 4 * uz * X)

    def parts(s, radical):
        if radical:
            return (
                -s * (6 * s - 1) / (2 * (4 * s - 1)),
                -s * (36 * s**2 - 14 * s + 1) / (2 * (4 * s - 1)**2),
                -6 * s**3 * (10 * s**2 - 6 * s + 1) / (4 * s - 1)**3,
            )
        return (-s * (4 * s - 1) / 2, -s * (8 * s - 1) / 2, 0)

    # Independently derive the three Catalan numerators in the basis
    # (1, sqrt(1-4s)) before substituting s=z(1+x)/x.
    E, v = field("v", QQ)
    def theta(pair, shift=0):
        a, b = pair
        return (v*a.diff(v)-shift*a,
                v*b.diff(v)-2*v*b/(1-4*v)-shift*b)
    u0 = theta((v/2-v**2, -v/2))
    v0 = theta(u0)
    w0 = theta(theta(theta((v**2/2, -v**2/2), 1), 2))
    assert tuple(a for a, _ in (u0, v0, w0)) == parts(v, False)
    assert tuple(b for _, b in (u0, v0, w0)) == parts(v, True)

    def to_F(a):
        a = a.subs(y, 1)
        def poly(p):
            assert all(k == 0 for _, _, k in p)
            return R.from_dict({(i, j): c for (i, j, _), c in p.items()})
        return F.new(poly(a.numer), poly(a.denom))

    outs = {}
    for lane in ("ell", "gen0", "rat"):
        if lane == "ell":
            u, v, w = [a / (B * ux * T**2) for a in parts(s / T, True)]
            logarithmic = y * PP.diff(y) / (2 * PP)
        elif lane == "gen0":
            u, v, w = [-a / (B * ux) for a in parts(s, True)]
            logarithmic = U.zero
        else:
            u, v, w = [
                a / (B * T) - b / B
                for a, b in zip(parts(s / T, False), parts(s, False))
            ]
            logarithmic = U.zero

        def Euler_shift(a):
            return y * a.diff(y) + (logarithmic + 1) * a

        outs[lane] = to_F(
            ux**2 / X**2 * (Euler_shift(Euler_shift(u)) - Euler_shift(v) + w)
        )

    # At x=0 this denominator is nonzero for small z, and the residue is zero.
    assert outs["rat"].denom == poles["t"].numer**5
    return outs


def solve_polynomials(cols, rhs):
    """Fraction-free linear solve over Q[z], coefficient by coefficient in x."""
    polys = []
    for f in cols + [rhs]:
        assert f.denom == 1
        p = {}
        for (i, j), c in f.numer.items():
            p[j] = p.get(j, V.zero) + c * vz**i
        polys.append(p)
    m = 1 + max(i for p in polys for i in p)
    matrix = DomainMatrix.from_list(
        [[p.get(i, V.zero) for p in polys] for i in range(m)], V
    )
    lhs = matrix.extract(range(m), range(len(cols)))
    rhsm = matrix.extract(range(m), [len(cols)])
    num, den = lhs.solve_den(rhsm)

    def lift(c):
        return F.new(R.from_dict({(i, 0): a for (i,), a in c.items()}), R.one)

    return [lift(a) / lift(den) for [a] in num.to_list()]


def reduce(f, multiplicities, branch):
    """Find and check a rational Hermite certificate for f*sqrt(curve) dx."""
    curve = F.one
    d = F.one
    g = F.one
    for k, m in multiplicities.items():
        d *= poles[k]**m
        g *= poles[k]**(m - 1)
        if k in branch:
            curve *= poles[k]
    h = d / g
    j = h * curve.diff(x) / (2 * curve) - sum(
        h * (m - 1) * poles[k].diff(x) / poles[k]
        for k, m in multiplicities.items()
    )
    degree = curve.numer.degree(1)
    bound = g.numer.degree(1) + degree
    columns = [
        x**i * j + (i * x**(i - 1) * h if i else F.zero)
        for i in range(bound)
    ] + [x**i * d for i in range(degree - 1)] + [d / (x + 2)]
    values = solve_polynomials(columns, f * d)
    primitive = sum(values[i] * x**i for i in range(bound)) / g
    coeff = values[bound:]
    normal = sum(coeff[i] * x**i for i in range(degree - 1)) + coeff[-1] / (x + 2)
    assert f == normal + primitive.diff(x) + primitive * curve.diff(x) / (2 * curve)
    return coeff


def ode_coefficients(z):
    return [
        200*z**5 - 700*z**4 + 716*z**3 - 329*z**2 + 76*z - 8,
        z*(2*z - 1)*(800*z**4 - 1850*z**3 + 1277*z**2 - 339*z + 28),
        z**2*(2*z - 1)*(650*z**4 - 1375*z**3 + 909*z**2 - 227*z + 16),
        z**3*(z - 1)*(5*z - 2)*(10*z - 1)*(2*z - 1)**2,
    ]


def verify():
    f = integrands()
    c = reduce(f["ell"], {"x": 1, "a": 3, "t": 5, "q": 3}, {"x", "t", "q"})
    a, b = reduce(f["gen0"], {"x": 1, "a": 3, "b": 3}, {"x", "b"})
    assert b == -c[-1]
    b = c[-1]
    # Let R0=sqrt(1-4z). Differentiating z^3 C(z) three times and multiplying
    # by z^3 yields a rational multiple of R0. Check it cancels the R0 terms
    # from the genus-zero residue at infinity (divide the sum by R0).
    def D0(h):
        return h.diff(z) - 2*h/(1 - 4*z)
    assert z**3 * D0(D0(D0(-z**2/2))) - 2*z**2*a/(1 - 4*z)**2 + 2*b + 2*b*z/(1 - 4*z) == 0

    M = []
    for basis in (F.one, x, x**2, 1/(x + 2)):
        M.append(reduce(
            basis * P.diff(z) / (2*P),
            {"x": 1, "a": 1, "t": 1, "q": 1}, {"x", "t", "q"},
        ) + [F.zero, F.zero])
    M += [[F.zero]*4 + [1/(2*z - 1), F.zero], [F.zero]*6]

    def der(row):
        return [
            a.diff(z) + sum(row[i]*M[i][j] for i in range(6))
            for j, a in enumerate(row)
        ]

    def lincomb(*terms):
        return [sum(k*row[j] for k, row in terms) for j in range(6)]

    # Candidate generating function = A[0]*I_0 + ... + A[3]*I_pole
    # + A[4]*sqrt(1-2z) + A[5]. This row was obtained by rational elimination
    # from the prescribed ODE and the exact relation for z^3 (z^3 A)'''.
    A = [
        (12*z**4 - 236*z**3 + 201*z**2 - 57*z + 5)/(24*z**4*(2*z - 1)),
        (120*z**3 - 494*z**2 + 259*z - 35)/(48*z**3*(2*z - 1)),
        (30*z**2 - 85*z + 25)/(48*z**2*(2*z - 1)),
        (2*z + 3)/(8*z**2),
        -(2*z + 3)/(4*z**2),
        (z + 1)/(3*z**2),
    ]
    A1 = der(A)
    A2 = der(A1)
    A3 = der(A2)
    assert lincomb((6*z**3, A), (18*z**4, A1), (9*z**5, A2), (z**6, A3)) == c + [-2*b, F.zero]
    p = ode_coefficients(z)
    source = 8 - 40*z + 50*z**2
    assert lincomb(*zip(p, (A, A1, A2, A3))) == [F.zero]*5 + [-source]

    # The relation for G fixes every nonnegative-degree coefficient. For the
    # potentially remaining z^(-3), z^(-2), z^(-1) integration constants, check
    # exact outputs under L to justify elimination by first coefficients.
    for j, expected in (
        (1, -50*z**2 + 46*z - 11),
        (2, -100*z**2 + 74*z - 13),
        (3, 4/z**3 - 101/z**2 + 640/z - 1660 + 2000*z - 1000*z**2),
    ):
        v = z**(-j)
        out = F.zero
        for k in p:
            out += k*v
            v = v.diff(z)
        assert out == expected
    print("Exact A55 differential-equation certificate passes.")


if __name__ == "__main__":
    verify()
