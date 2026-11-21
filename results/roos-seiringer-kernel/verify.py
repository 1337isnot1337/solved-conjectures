#!/usr/bin/env python3
"""Exact continuous certificate for the Roos--Seiringer radial kernel.

Python standard library only. All computations use integers or Fractions.
The analytic proof supplies the series, tail estimate, and derivative bound.
The binary subdivision checks whole closed intervals, never isolated samples.
"""

from fractions import Fraction as Q
from math import factorial
import hashlib
import json

PRECISION = 384
SCALE = 1 << PRECISION
TERMS = 160
SERIES_ERROR = 1 << (PRECISION - 128)


def floor_scaled(x):
    return (x.numerator * SCALE) // x.denominator


def ceil_scaled(x):
    return -((-x.numerator * SCALE) // x.denominator)


def interval(x):
    return floor_scaled(x), ceil_scaled(x)


def add(a, b):
    return a[0] + b[0], a[1] + b[1]


def sub(a, b):
    return a[0] - b[1], a[1] - b[0]


def mul(a, b):
    vals = [a[0] * b[0], a[0] * b[1], a[1] * b[0], a[1] * b[1]]
    return min(vals) // SCALE, -((-max(vals)) // SCALE)


def scale(a, q):
    assert q >= 0
    return (a[0] * q.numerator) // q.denominator, -(
        (-a[1] * q.numerator) // q.denominator
    )


def atan_reciprocal(n, terms):
    # Alternating series, with the sign of the first omitted term preserved.
    total = sum((Q((-1) ** k, (2 * k + 1) * n ** (2 * k + 1))
                 for k in range(terms)), Q(0))
    nxt = Q((-1) ** terms, (2 * terms + 1) * n ** (2 * terms + 1))
    return interval(total + min(Q(0), nxt))[0], interval(total + max(Q(0), nxt))[1]


PI = sub(scale(atan_reciprocal(5, 128), Q(16)),
         scale(atan_reciprocal(239, 40), Q(4)))
assert PI[0] > 3 * SCALE
assert 7 * PI[1] < 22 * SCALE

# The first omitted absolute series term bounds both series tails together.
# For x <= 40 the successive absolute terms have ratio <= 1/2 after TERMS.
assert 2 * 80 ** 2 < (2 * TERMS + 3) * (2 * TERMS + 4)
assert 22 * 80 ** (2 * TERMS + 2) * (1 << 128) < factorial(2 * TERMS + 2)

COEFFICIENTS = []
harmonic = odd_harmonic = Q(0)
previous_b = Q(0)
for k in range(1, TERMS + 1):
    harmonic += Q(1, k)
    odd_harmonic += Q(1, 2 * k - 1)
    a = Q(k - 1, 2 * k - 1)
    b = 1 - Q(2 * k - 1, k * (2 * k + 1)) * odd_harmonic - Q(2, 2 * k + 1) * harmonic
    assert 0 <= a < 1
    assert 0 <= previous_b <= b < 1
    if k in (1, 2):
        assert b == 0
    if k == 3:
        assert b == Q(1, 9)
    previous_b = b
    COEFFICIENTS.append((a, b))


def f_at(x):
    """An enclosure of the exact F(x), in units of 2^-PRECISION."""
    assert Q(1) <= x <= Q(40)
    y_squared = 4 * x * x
    term = (SCALE, SCALE)
    even = odd = (0, 0)
    for k, (a, b) in enumerate(COEFFICIENTS, 1):
        term = scale(term, y_squared / ((2 * k - 1) * (2 * k)))
        ea, ob = scale(term, a), scale(term, b)
        if k % 2:
            even, odd = sub(even, ea), sub(odd, ob)
        else:
            even, odd = add(even, ea), add(odd, ob)
    out = scale(add(mul(PI, even), scale(odd, x)), Q(1, 4))
    return out[0] - SERIES_ERROR, out[1] + SERIES_ERROR


def analytic_constant_checks():
    # exp(9/2)>80 and exp(6)>160 by positive finite exponential sums.
    assert sum((Q(9, 2) ** k / factorial(k) for k in range(16)), Q(0)) > 80
    assert sum((Q(6) ** k / factorial(k) for k in range(12)), Q(0)) > 160
    h = sum((Q(1, 2 * j + 1) for j in range(8)), Q(0))
    s = sum((Q(1, (2 * j + 1) ** 2) for j in range(8)), Q(0))
    c = (s - 1) / 2
    assert c == Q(82172963, 811620810)
    assert c > Q(1, 80)
    tail_margin = 40 * c - h / 2 - Q(11, 4) - Q(3, 80)
    assert tail_margin == Q(1632462913, 6492966480) > 0
    assert Q(7, 50) - Q(1, 405) == Q(557, 4050) > 0
    return tail_margin


def certify_compact():
    # Each rejected parent is replaced by its two closed children.
    # Consequently successful leaves cover exactly [1,40], including endpoints.
    stack = [(Q(1), Q(40), 0)]
    leaves = []
    evaluations = 0
    min_margin = None
    max_depth = 0
    while stack:
        left, right, depth = stack.pop()
        midpoint = (left + right) / 2
        lower, upper = f_at(midpoint)
        evaluations += 1
        # Analytic bound: |F'(x)| <= 14 + right/2 on this whole interval.
        lipschitz_loss = (14 + right / 2) * (right - left) / 2
        margin = lower - ceil_scaled(lipschitz_loss)
        if margin > 0:
            leaves.append((left, right, margin))
            min_margin = margin if min_margin is None else min(min_margin, margin)
            max_depth = max(max_depth, depth)
        else:
            assert depth < 20, "No continuous certificate at the permitted depth"
            stack.append((midpoint, right, depth + 1))
            stack.append((left, midpoint, depth + 1))
    leaves.sort()
    assert leaves[0][0] == 1 and leaves[-1][1] == 40
    assert all(leaves[i][1] == leaves[i + 1][0] for i in range(len(leaves) - 1))
    assert sum((b - a for a, b, _ in leaves), Q(0)) == 39
    assert evaluations == 2 * len(leaves) - 1
    normalized = "\n".join(f"{a}|{b}|{m}" for a, b, m in leaves).encode()
    return {
        "interval": "[1,40]",
        "leaves": len(leaves),
        "evaluations": evaluations,
        "max_depth": max_depth,
        "min_margin_numerator": min_margin,
        "margin_denominator": SCALE,
        "leaf_sha256": hashlib.sha256(normalized).hexdigest(),
    }


if __name__ == "__main__":
    tail = analytic_constant_checks()
    result = certify_compact()
    result.update({
        "precision_bits": PRECISION,
        "series_terms": TERMS,
        "small_tail_margin": "557/4050 times x^4",
        "large_tail_margin_at_40": str(tail),
        "status": "ALL_CONTINUOUS_INTERVAL_CHECKS_PASSED",
    })
    print(json.dumps(result, indent=2))
