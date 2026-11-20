#!/usr/bin/env python3
"""Exact diagnostic checks for the unrestricted proof of Karp's conjecture.

Standard library only. The literal permutation enumeration does not use Stirling
numbers. Rational-shift checks evaluate the source polynomial directly. None of
the finite checks substitutes for the proof.
"""

from collections import Counter
from fractions import Fraction
from itertools import permutations
from math import comb, factorial


def stirling_triangle(bound):
    c = [[0] * (bound + 1) for _ in range(bound + 1)]
    c[0][0] = 1
    for n in range(1, bound + 1):
        for d in range(1, n + 1):
            c[n][d] = c[n - 1][d - 1] + (n - 1) * c[n - 1][d]
    return c


def cycle_lengths(permutation):
    unseen = set(range(len(permutation)))
    lengths = []
    while unseen:
        start = min(unseen)
        vertex = start
        length = 0
        while vertex in unseen:
            unseen.remove(vertex)
            length += 1
            vertex = permutation[vertex]
        assert vertex == start
        lengths.append(length)
    return lengths


def literal_coefficient_check(c):
    coefficients = colored_permutations = 0
    for n in range(2, 8):
        actual = Counter()
        for permutation in permutations(range(n)):
            lengths = cycle_lengths(permutation)
            d = len(lengths)
            for coloring in range(1 << d):
                i = coloring.bit_count()
                red_size = sum(lengths[j] for j in range(d) if coloring & (1 << j))
                colored_permutations += 1
                for m in range(1, min(red_size, n - red_size) + 1):
                    actual[m, d, i] += 1
        for m in range(1, n // 2 + 1):
            for d in range(n + 1):
                for i in range(d + 1):
                    expected = sum(comb(n, k) * c[k][i] * c[n - k][d - i]
                                   for k in range(m, n - m + 1))
                    assert actual[m, d, i] == expected, (n, m, d, i)
                    coefficients += 1
    return coefficients, colored_permutations


def marked_cycle_check(c, bound):
    identities = 0
    for n in range(2, bound + 1):
        for m in range(1, n // 2 + 1):
            for d in range(2, n + 1):
                coefficients = [sum(comb(n, k) * c[k][i] * c[n - k][d - i]
                                    for k in range(m, n - m + 1))
                                for i in range(d + 1)]
                for i in range((d + 1) // 2):
                    j = d - i - 1
                    lhs = (i + 1) * coefficients[i + 1] - (d - i) * coefficients[i]
                    rhs = 0
                    for a in range(m):
                        for b in range(m, n - m + 1):
                            length = n - a - b
                            if length < 1:
                                continue
                            denominator = factorial(a) * factorial(b) * length
                            assert factorial(n) % denominator == 0
                            weight = factorial(n) // denominator
                            minor = c[a][i] * c[b][j] - c[a][j] * c[b][i]
                            assert minor >= 0
                            rhs += weight * minor
                    assert lhs == rhs, (n, m, d, i, lhs, rhs)
                    identities += 1
    return identities


def polynomial_add(a, b, scale=1):
    out = list(a) + [0] * max(0, len(b) - len(a))
    for i, value in enumerate(b):
        out[i] += scale * value
    while len(out) > 1 and out[-1] == 0:
        out.pop()
    return out


def polynomial_multiply(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, av in enumerate(a):
        for j, bv in enumerate(b):
            out[i + j] += av * bv
    return out


def rising(shift, n):
    out = [1]
    for j in range(n):
        out = polynomial_multiply(out, [shift + j, 1])
    return out


def source_polynomial(n, alpha, beta, f):
    out = [0]
    for k in range(n + 1):
        first = polynomial_multiply(rising(alpha, k), rising(beta, n - k))
        second = polynomial_multiply(rising(alpha + beta, k), rising(0, n - k))
        difference = polynomial_add(first, second, -1)
        out = polynomial_add(out, difference, f[k] * f[n - k] * comb(n, k))
    return out


def rational_shift_check():
    shifts = [(Fraction(1, 3), Fraction(5, 7)),
              (Fraction(7, 2), Fraction(1, 4)),
              (Fraction(1), Fraction(40)),
              (Fraction(5, 2), Fraction(5, 2))]
    checks = 0
    for n in range(3, 13):
        inputs = [[comb(n, k) for k in range(n + 1)],
                  [2 ** (k * (n - k)) for k in range(n + 1)],
                  [0 if k in (0, n) else comb(n, k) for k in range(n + 1)]]
        for f in inputs:
            assert all(f[k] ** 2 > f[k - 1] * f[k + 1] for k in range(1, n))
            for alpha, beta in shifts:
                q = source_polynomial(n, alpha, beta, f)
                assert len(q) == n - 1
                for j, coefficient in enumerate(q):
                    lower = (f[1] * f[n - 1] - f[0] * f[n]) * comb(n, j) * (
                        (alpha + beta) ** (n - j) - alpha ** (n - j) - beta ** (n - j))
                    assert coefficient >= lower > 0, (n, alpha, beta, f, j)
                checks += 1
    return checks


def main():
    c = stirling_triangle(16)
    coefficients, colored = literal_coefficient_check(c)
    print(f"PASS: {colored} literal colored permutations, {coefficients} coefficient comparisons")
    identities = marked_cycle_check(c, 16)
    print(f"PASS: {identities} exact marked-cycle identities through n=16")
    shifts = rational_shift_check()
    print(f"PASS: {shifts} source-polynomial checks at exact rational shifts, n=3,...,12")
    print("The all-parameter proof is in PROOF.md; finite checks are diagnostic only.")


if __name__ == "__main__":
    main()
