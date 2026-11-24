"""Exact PBW replay of a rational Weyl identity on protected flag spaces.

Checks -(x^2) d x^{-1} + x d = 1 on E_n=x F_n in the left
regular Weyl representation, with ambient V_n=F_(n+3).
The inverse is used only on E_n; no truncated matrix is inverted.
"""


def pbw(degree):
    return [(a, d) for a in range(degree + 1)
            for d in range(degree + 1 - a)]


def derivative(poly):
    out = {}
    for (a, d), value in poly.items():
        out[a, d + 1] = out.get((a, d + 1), 0) + value
        if a:
            out[a - 1, d] = out.get((a - 1, d), 0) + a * value
    return {key: value for key, value in out.items() if value}


def x_power(poly, power, scalar=1):
    return {(a + power, d): scalar * value
            for (a, d), value in poly.items()}


def rho(poly, n):
    return {(a - 1, d): value for (a, d), value in poly.items()
            if a >= 1 and a - 1 + d <= n}


def add(left, right):
    out = dict(left)
    for key, value in right.items():
        out[key] = out.get(key, 0) + value
    return {key: value for key, value in out.items() if value}


def check(n):
    ambient = set(pbw(n + 3))
    for flag in pbw(n):
        # J(flag)=x*flag; B1=x^{-1}J and B2=J.
        b1 = {flag: 1}
        b2 = x_power(b1, 1)
        d1 = derivative(b1)
        d2 = derivative(b2)
        assert set(b1) | set(b2) | set(d1) | set(d2) <= ambient
        first = rho(x_power(d1, 2, -1), n)
        second = rho(x_power(d2, 1), n)
        assert add(first, second) == {flag: 1}
    return len(pbw(n + 3)), len(pbw(n))


if __name__ == '__main__':
    for n in (0, 1, 2, 4, 8, 16, 32):
        N, M = check(n)
        print(f'n={n}: all {M} flag columns checked; N={N}, M={M}')
