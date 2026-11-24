#!/usr/bin/env python3
"""Exact finite checks of the arbitrary-free-set polynomial separator.

The written proof handles every size.  These checks independently
enumerate catalyst support, the two local weight sums, and surviving
labels.  The Fourier rank identity is checked in cyclotomic quotients.
"""

from itertools import product

import sympy as sp


def check(m, t, shared, free):
    assert m >= 1 and t >= 1 and shared >= 0 and free >= 2
    vmax = shared * (m - 1) + t - 1
    radius = shared * (m - 1) + (free - 1) * (t - 1)
    modulus = radius + 1
    priority = (free - 1) * (t - 1) ** 2 + 1
    support = []
    for a in product(range(m), repeat=shared):
        for u in range(t):
            for w in product(range(t), repeat=free - 2):
                v = sum(a) + (free - 1) * u - sum(w)
                if 0 <= v <= vmax:
                    support.append((a, u, v, w))
    count = 0
    for h in range(m):
        survivors = set()
        for a, u, v, w in support:
            first = sum(x*x for x in a)
            first += 2*(free-1)*h*u - 2*h*v - 2*h*sum(w)
            first += shared*h*h
            assert first == sum((x-h)**2 for x in a)
            second = (v-shared*h)**2 + sum(x*x for x in w)
            second -= (free-1)*u*u
            if first == 0:
                assert second == (v-shared*h-u)**2 + sum((x-u)**2 for x in w)
            degree = priority*first + second
            assert degree >= 0
            wanted = a == (h,)*shared and v == shared*h+u and w == (u,)*(free-2)
            assert (degree == 0) == wanted
            if degree == 0:
                survivors.add((h, u))
            left = v + sum(w)
            right = sum(a) + (free-1)*u
            assert 0 <= left <= radius and 0 <= right <= radius
            assert left == right
            count += 1
        assert survivors == {(h, u) for u in range(t)}
    return count, modulus


def fourier_check(modulus):
    if modulus == 1:
        return
    x = sp.Symbol("x")
    phi = sp.Poly(sp.cyclotomic_poly(modulus, x), x)
    for delta in range(-(modulus-1), modulus):
        polynomial = sum(x**((ell*delta) % modulus) for ell in range(modulus))
        residual = sp.rem(sp.Poly(polynomial, x), phi)
        assert residual == (sp.Poly(modulus, x) if delta == 0 else sp.Poly(0, x))


if __name__ == "__main__":
    configurations = 0
    entries = 0
    moduli = set()
    for m, t in product(range(2, 5), repeat=2):
        for shared, free in product(range(4), range(2, 6)):
            count, modulus = check(m, t, shared, free)
            configurations += 1
            entries += count
            moduli.add(modulus)
    for modulus in sorted(moduli):
        fourier_check(modulus)
    print(f"{configurations} configurations; {entries} weighted support entries checked.")
    print(f"Fourier identities verified exactly for {len(moduli)} moduli, up to {max(moduli)}.")
    print("Every surviving label is exactly a full-sum label h and a free-set unit label u.")
    print("These finite checks corroborate the general algebraic proof; they do not prove omega=2.")
