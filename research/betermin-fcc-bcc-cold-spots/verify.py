#!/usr/bin/env python3
"""Finite diagnostics, not assumptions of the all-scale proof."""

from decimal import Decimal as D, localcontext
from fractions import Fraction
from itertools import product
from math import prod
from random import Random


def d_distance2(indices):
    # Coordinates are given in eighths of a unit.
    nearest = [(i + 4) // 8 for i in indices]
    offsets = [abs(Fraction(i, 8) - m) for i, m in zip(indices, nearest)]
    base = sum(x*x for x in offsets)
    return base + (1 - 2 * max(offsets) if sum(nearest) % 2 else 0)


def dual_distance2(indices):
    ys = [Fraction(min(i % 8, (-i) % 8), 8) for i in indices]
    return min(sum(y*y for y in ys), sum((Fraction(1, 2) - y)**2 for y in ys))


def holes(n):
    d = (8,)+(0,)*(n-1) if n <= 4 else (4,)*n
    dual = (0,)*(n//2)+(4,)*(n//2)+(2,)*(n%2)
    return d, dual


def sample(n, rng):
    if n == 3:
        return list(product(range(16), repeat=n))
    seeds = [tuple(rng.randrange(16) for _ in range(n)) for __ in range(350)]
    for a in holes(n):
        seeds.extend(a[:j]+(i,)+a[j+1:] for j in range(n) for i in range(16))
    return seeds


def main():
    rng = Random(20261124)
    nchecks = 0
    with localcontext() as ctx:
        ctx.prec = 65
        eps = D("1e-55")
        for alpha in map(D, ["1", "4", "16"]):
            a, b = {}, {}
            for i in range(16):
                z = D(i) / 8
                terms = [(m, (-alpha * (D(m)-z)**2).exp()) for m in range(-40, 41)]
                a[i] = sum(t for m, t in terms)
                b[i] = sum(t if m%2 == 0 else -t for m, t in terms)
            def checkerboard(z):
                return (prod(a[i] for i in z) + prod(b[i] for i in z))/2
            def dual(z):
                return prod(a[i] for i in z) + prod(a[(i-4)%16] for i in z)
            for n in range(3, 9):
                x, y = holes(n)
                dx, dy = d_distance2(x), dual_distance2(y)
                assert dx == max(Fraction(1), Fraction(n, 4))
                assert dy == (Fraction(n, 8) if n%2 == 0 else Fraction(2*n-1, 16))
                v, w = checkerboard(x), dual(y)
                for z in sample(n, rng):
                    a1, a2 = checkerboard(z), dual(z)
                    rz, sz = d_distance2(z), dual_distance2(z)
                    assert rz <= dx and sz <= dy
                    assert a1 >= v-eps and a2 >= w-eps
                    assert ((abs(a1-v) < eps) == (rz == dx)), (n,alpha,z)
                    assert ((abs(a2-w) < eps) == (sz == dy)), (n,alpha,z)
                    nchecks += 2
    assert dual_distance2((4,4,0)) == Fraction(1, 4)
    assert dual_distance2((4,2,0)) == Fraction(5, 16)
    print(f"Passed {nchecks} finite Gaussian comparisons and exact rational distance tests.")


if __name__ == "__main__":
    main()
