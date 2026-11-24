#!/usr/bin/env python3
"""Exact arithmetic for the Benfield--Lippard symmetry counterexamples."""

from math import gcd


def two_generator_nonmember(x, y, z):
    d = gcd(x, y)
    x, y = x // d, y // d
    q = z * pow(y, -1, x) % x
    assert gcd(x, y) == 1 and 0 <= q < x
    assert (q * y - z) % x == 0
    assert q * y > z
    return d, q


def check(e):
    a, b, c, D = (p**e - 1 for p in (2, 3, 5, 17))
    g = gcd(a, b)
    d = gcd(g, c)
    assert (g, d, gcd(d, D)) == (85, 17, 1)
    B = (a // g - 1) * b + (g // d - 1) * c
    assert B < 7**e - 1
    assert B < d * D
    assert B + (d - 1) * D < 19**e - 1
    assert e % (17 - 1) == 0
    x, y, z = a // d, b // d, c // d
    assert 1 < x < y < z and y % x != 0
    rows = (
        two_generator_nonmember(x, y, z),
        two_generator_nonmember(x, z, y),
        two_generator_nonmember(y, z, x),
    )
    if e == 64:
        assert rows == (
            (5, 198997453605889410),
            (1923, 229627061657430),
            (256, 66195206092876816318375305),
        )
    shapes = {
        64: (18766804522483320, 55, 743739614142711, 60),
        128: (946318631155207323529554626079834, 13945,
              364271084930610618508382933752617, 26520),
    }
    L, U, V, H = shapes[e]
    assert L > V >= 0 and H > U >= 0 and L * H - U * V == x
    assert L * y > U * z and H * z > V * y
    assert (L * y - U * z) % x == (H * z - V * y) % x == 0
    W = max((L - 1) * y + (H - U - 1) * z,
            (L - V - 1) * y + (H - 1) * z)
    twice_A = (y * (H * L * (L - 1) - U * V * (2 * L - V - 1))
               + z * (L * H * (H - 1) - U * V * (2 * H - U - 1)))
    F = W - x
    G, rem = divmod(twice_A - x * (x - 1), 2 * x)
    assert rem == 0 and 2 * G - 1 > F
    print(f"exponent {e}: all exact checks passed; residue certificates {rows}")
    print(f"  2G(S_e)-1-F(S_e) = {d * (2 * G - 1 - F)}")


if __name__ == "__main__":
    for exponent in (64, 128):
        check(exponent)
