#!/usr/bin/env python3
"""Exact rational clique-star upper certificate; Python stdlib only."""
from fractions import Fraction as Q
from itertools import combinations
from math import comb

L = 12
ROWS = [(0, 1, 0, 0), (0, 0, 1, 0), (0, 0, 0, 1)]
ROWS += [(1, comb(i, 2), comb(j, 2), -i * j)
         for i in range(1, L) for j in range(1, L + 1 - i)]


def cross(a, b):
    return (a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0])


def dot(a, b):
    return sum(u * v for u, v in zip(a, b))


def feasible3():
    for row1, row2, row3 in combinations(ROWS, 3):
        e1, e2, e3 = row1[1:], row2[1:], row3[1:]
        j1, j2, j3 = cross(e2, e3), cross(e3, e1), cross(e1, e2)
        d = dot(e1, j1)
        if not d:
            continue
        xyz = tuple(-sum(c0 * b for c0, b in zip(
            (row1[0], row2[0], row3[0]), w)) for w in zip(j1, j2, j3))
        if d < 0:
            d = -d
            xyz = tuple(-x for x in xyz)
        x, y, z = xyz
        if all(c0 * d + a * x + b * y + c * z >= 0 for c0, a, b, c in ROWS):
            yield Q(x, d)


def arms(h):
    # Use variables n*y and n*z to keep the whole enumeration integral.
    m, n = h.numerator, h.denominator
    rows = [(c0 * n + a * m, b, c) for c0, a, b, c in ROWS if b or c]
    for (c0, a, b), (d0, c, d) in combinations(rows, 2):
        den = a * d - b * c
        if not den:
            continue
        x, y = b * d0 - c0 * d, c * c0 - a * d0
        if den < 0:
            den, x, y = -den, -x, -y
        if all(c0 * den + a * x + b * y >= 0 for c0, a, b in rows):
            yield Q(x, n * den), Q(y, n * den)


LAMBDA = {
    2: (Q(1, 10),), 3: (Q(1, 5),), 4: (Q(4, 15), Q(1, 3)),
    5: (Q(7, 20), Q(2, 5)), 6: (Q(5, 12), Q(13, 30)),
    7: (Q(1, 2),), 8: (Q(1, 2),), 9: (Q(11, 20),),
    10: (Q(8, 15),), 11: (Q(11, 20),), 12: (Q(3, 5),), 13: (Q(3, 5),),
}


def check(h, aa, q):
    t = Q(q, 56)
    for lam in LAMBDA[q]:
        B = (lam + h / 2 - lam**2 / (4 * t)) / q
        if B >= 0 and all(max(0, p - lam)**2 <= 2 * d * B for d, p in aa):
            return lam
    raise AssertionError((h, q))


if __name__ == "__main__":
    hh = sorted(set(feasible3()))
    assert Q(0) in hh and Q(1) in hh
    widths = []
    for h in hh:
        aa = sorted(set(arms(h)))
        widths.append(len(aa))
        for q in range(2, 14):
            check(h, aa, q)
    print(f"Verified {len(hh)} center values, {sum(widths)} arm vertices, "
          f"and all {len(hh) * 12} exact upper inequalities.")
