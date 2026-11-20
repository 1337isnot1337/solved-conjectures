"""Exact identity checks for the unresolved parking excedance conjecture."""
from collections import Counter
from itertools import product
from math import comb, factorial
import sympy as sp


def enumerate_parking(n):
    by_set = Counter()
    contents = set()
    for a in product(range(1, n + 1), repeat=n):
        b = tuple(sorted(a))
        if any(value > i for i, value in enumerate(b, 1)):
            continue
        contents.add(b)
        by_set[sum(1 << i for i, value in enumerate(a) if value > i + 1)] += 1
    row = [0] * max(1, n)
    for mask, count in by_set.items():
        row[mask.bit_count()] += count
    return by_set, row, contents


def worpitzky_table(N):
    # Column m+1 stores q_n(m); column 0 stores q_n(-1).
    q = [[1] * (N + 2)] + [[0] * (N + 2) for _ in range(N)]
    for n in range(1, N + 1):
        for m in range(N + 1):
            q[n][m + 1] = q[n][m] + sum(
                (left + 1) * q[left][m + 1] * q[n - 1 - left][m]
                for left in range(n)
            )
    return q


def numerator(values, degree):
    return [
        sum((-1) ** j * comb(degree + 1, j) * values[k - j]
            for j in range(k + 1))
        for k in range(degree + 1)
    ]


def verify(N=6):
    q = worpitzky_table(N)
    previous = Counter({0: 1})
    for n in range(1, N + 1):
        counts, row, contents = enumerate_parking(n)
        assert sum(row) == (n + 1) ** (n - 1)
        recovered = numerator(q[n][1:], n)
        assert recovered == row + [0]
        if n >= 2:
            last_bit = 1 << (n - 2)
            derivative = Counter({
                mask ^ last_bit: count for mask, count in counts.items()
                if mask & last_bit
            })
            assert derivative == previous
        for m in range(n + 1):
            content_value = sum(
                sp.Rational(
                    sp.prod(m + j - value + 1 for j, value in enumerate(b, 1)),
                    sp.prod(factorial(c) for c in Counter(b).values()),
                )
                for b in contents
            )
            assert content_value == q[n][m + 1]
        previous = counts
        print(n, row)

    t = sp.symbols("t")
    q3 = (t + 1) * (16 * t * t + 47 * t + 36) / 6
    assert sp.discriminant(16 * t * t + 47 * t + 36, t) == -95
    assert all(q3.subs(t, m) == q[3][m + 1] for m in range(N + 1))

    B = numerator([q[1][m + 1] * q[3][m] for m in range(5)], 4)
    assert B == [0, 12, 39, 13, 0]
    E4 = t**3 + 29*t**2 + 71*t + 24
    lo, hi = -sp.Rational(41, 100), -sp.Rational(2, 5)
    assert E4.subs(t, lo) < 0 < E4.subs(t, hi)
    assert sp.Poly(E4, t).count_roots(lo, hi) == 1
    assert sp.Poly(E4, t).count_roots(hi, sp.oo) == 0
    assert sp.Poly(13*t**2 + 39*t + 12, t).count_roots(lo, hi) == 0
    assert (13*t**2 + 39*t + 12).subs(t, hi) < 0
    assert sp.Poly(sp.diff(E4, t), t).count_roots(lo, hi) == 0
    assert sp.diff(E4, t).subs(t, hi) > 0
    print("Exact recurrence, deletion identity, content formula, and obstructions verified.")


if __name__ == "__main__":
    verify()
