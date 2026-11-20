#!/usr/bin/env python3
"""Exact certificate for Gatzweiler--Krattenthaler Conjecture 4.

No third-party dependencies, floating point, numerical root finding, or Lean.
Polynomial coefficient lists are stored in increasing degree order.
"""
import json

A = (50, 51, 54, 60, 63)
B = (17, 18, 21, 27, 30)
EXPECTED_CYCLOTOMIC = (2, 4, 5, 10, 12, 20, 25, 50, 51, 54, 60, 63)


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def multiply(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return trim(c)


def factor_product(exponents):
    out = [1]
    for k in exponents:
        out = multiply(out, [1] + [0] * (k - 1) + [-1])
    return out


def exact_divide(a, b):
    a = a[:]
    out = [0] * (len(a) - len(b) + 1)
    while len(a) >= len(b) and any(a):
        k = len(a) - len(b)
        c, rem = divmod(a[-1], b[-1])
        assert rem == 0
        out[k] = c
        for j, y in enumerate(b):
            a[k + j] -= c * y
        trim(a)
    assert not any(a), ('nonzero remainder', a)
    return trim(out)


def main():
    assert len(A) == len(B)
    assert tuple(b + 33 for b in B) == A
    assert 33 >= max(B) == 30
    valuations = {
        d: sum(a % d == 0 for a in A) - sum(b % d == 0 for b in B)
        for d in range(1, max(A) + 1)
    }
    assert all(v >= 0 for v in valuations.values())
    assert tuple(d for d, v in valuations.items() if v) == EXPECTED_CYCLOTOMIC
    assert all(v == 1 for v in valuations.values() if v)

    numerator, denominator = factor_product(A), factor_product(B)
    quotient = exact_divide(numerator, denominator)
    assert multiply(quotient, denominator) == numerator
    assert len(quotient) - 1 == sum(A) - sum(B) == 165
    assert quotient == quotient[::-1]
    negatives = [(i, c) for i, c in enumerate(quotient) if c < 0]
    assert negatives == [(50, -1), (67, -1), (98, -1), (115, -1)]
    assert sum(quotient) == 100

    # Independent formal-series computation through the decisive exponent.
    h = [1] + [0] * 50
    for b in B:
        for i in range(b, 51):
            h[i] += h[i - b]
    assert h[50] == 0
    assert h[50] - h[0] == quotient[50] == -1
    assert 3 * min(B) > 50
    assert not set(B).intersection(50 - b for b in B)

    # The proof covers every r. These checks also guard implementation of q -> q^r.
    for r in (1, 2, 3):
        scaled = [0] * (165 * r + 1)
        scaled[::r] = quotient
        assert multiply(scaled, factor_product(tuple(r * b for b in B))) == factor_product(tuple(r * a for a in A))
        assert scaled[50 * r] == -1
    print(json.dumps({
        'result': 'PASS',
        'm': 33, 'n': 30,
        'exponent_support': B,
        'cyclotomic_indices': EXPECTED_CYCLOTOMIC,
        'degree': 165,
        'negative_coefficients': negatives,
        'value_at_one': sum(quotient),
        'scope': 'counterexample to Conjecture 4; dilation theorem proved in proof.md',
    }, indent=2))


if __name__ == '__main__':
    main()
