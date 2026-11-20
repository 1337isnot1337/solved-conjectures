#!/usr/bin/env python3
"""Exact width-two order-polynomial diagnostics; NOT a proof of the conjecture.

Standard library only.
"""
import argparse
from collections import Counter
from itertools import product
from math import factorial
from random import Random


def shuffle(m, n, rng):
    bits = [0] * m + [1] * n
    rng.shuffle(bits)
    a = b = 0
    output = []
    for bit in bits:
        if bit == 0:
            output.append((0, a))
            a += 1
        else:
            output.append((1, b))
            b += 1
    return output


def requirements(m, n, le1, le2):
    r1 = {x: i for i, x in enumerate(le1)}
    r2 = {x: i for i, x in enumerate(le2)}
    a_req = [0] * (n + 1)
    b_req = [0] * (m + 1)
    for j in range(n):
        a_req[j + 1] = sum(r1[(0, i)] < r1[(1, j)] and
                             r2[(0, i)] < r2[(1, j)] for i in range(m))
    for i in range(m):
        b_req[i + 1] = sum(r1[(1, j)] < r1[(0, i)] and
                             r2[(1, j)] < r2[(0, i)] for j in range(n))
    return a_req, b_req


def omega_values(m, n, a_req, b_req):
    """Ω(P;t) for t=0,...,m+n from 2D grid-of-ideals prefix sums."""
    valid = [[i >= a_req[j] and j >= b_req[i]
              for j in range(n + 1)] for i in range(m + 1)]
    assert valid[0][0] and valid[m][n]
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    dp[0][0] = 1
    values = [0] if m + n else [1]
    for _ in range(m + n):
        prefix = [[0] * (n + 1) for _ in range(m + 1)]
        for i in range(m + 1):
            for j in range(n + 1):
                s = dp[i][j]
                if i:
                    s += prefix[i - 1][j]
                if j:
                    s += prefix[i][j - 1]
                if i and j:
                    s -= prefix[i - 1][j - 1]
                prefix[i][j] = s
        dp = [[prefix[i][j] if valid[i][j] else 0
               for j in range(n + 1)] for i in range(m + 1)]
        values.append(dp[m][n])
    return values


def scaled_coefficients(values):
    """Coefficients of (m+n)! Ω(P;t) as exact integers."""
    degree = len(values) - 1
    stirling = [[1]]
    for k in range(1, degree + 1):
        before = stirling[-1]
        after = [0] * (k + 1)
        for j, v in enumerate(before):
            after[j] -= (k - 1) * v
            after[j + 1] += v
        stirling.append(after)
    differences = []
    work = values[:]
    for k in range(degree + 1):
        differences.append(work[0])
        work = [work[j + 1] - work[j] for j in range(len(work) - 1)]
    coefficients = [0] * (degree + 1)
    f = factorial(degree)
    for k in range(degree + 1):
        multiplier = f // factorial(k)
        for j, v in enumerate(stirling[k]):
            coefficients[j] += differences[k] * multiplier * v
    return coefficients


def count_six_direct(t):
    """Independent double sum, from the six-vertex poset relations."""
    return sum(a * (t - max(a, b) + 1) *
               sum(e - b + 1 for e in range(max(a, b), t + 1))
               for a in range(1, t + 1) for b in range(1, t + 1))


def count_six_literal(t):
    """Independent brute enumeration of all six assigned labels."""
    return sum(1 for a0, a1, a2, b0, b1, b2
               in product(range(1, t + 1), repeat=6)
               if (a0 <= a1 <= a2 and b0 <= b1 <= b2 and
                   a1 <= b2 and b0 <= a2))


def check_six_vertices():
    # Chains a0<a1<a2 and b0<b1<b2; cross a1<b2 and b0<a2.
    values = omega_values(3, 3, [0, 0, 0, 2], [0, 0, 0, 1])
    assert values == [0, 1, 13, 77, 302, 917, 2338], values
    coefficients = scaled_coefficients(values)
    assert coefficients == [0, 48, 150, 225, 195, 87, 15], coefficients
    for t in range(1, 7):
        assert count_six_direct(t) == values[t]
    for t in range(1, 6):
        assert count_six_literal(t) == values[t]
    # Cubic discriminant, exact arithmetic: 5*t^3+14*t^2+13*t+8.
    a, b, c, d = 5, 14, 13, 8
    disc = b*b*c*c - 4*a*c**3 - 4*b**3*d - 27*a*a*d*d + 18*a*b*c*d
    assert disc == -10784
    print("PASS: exact six-vertex polynomial and nonreal-root certificate")


def sweep():
    """Nonexhaustive deterministic random diagnostic; NOT a proof."""
    rng = Random(0xA719CC)
    counts = Counter()
    for m in range(1, 18):
        for n in range(1, m + 1):
            if m + n > 28:
                continue
            number = 3000 if m + n <= 16 else 700 if m + n <= 22 else 160
            for _ in range(number):
                l1 = shuffle(m, n, rng)
                l2 = shuffle(m, n, rng)
                a_req, b_req = requirements(m, n, l1, l2)
                coefficients = scaled_coefficients(
                    omega_values(m, n, a_req, b_req))
                if min(coefficients) < 0:
                    raise AssertionError((m, n, l1, l2, coefficients))
                counts[m + n] += 1
    assert sum(counts.values()) == 229700
    print("PASS: 229700 sampled shuffle pairs (nonexhaustive; n<=28)")


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--sweep", action="store_true")
    args = p.parse_args()
    check_six_vertices()
    if args.sweep:
        sweep()
