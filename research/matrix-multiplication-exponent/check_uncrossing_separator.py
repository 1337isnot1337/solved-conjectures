#!/usr/bin/env python3
"""Exact coefficients of the explicit simultaneous-separator uncrossing.

The unbounded subexponential overhead is proved in the accompanying note.
These checks expand the finite polynomial map, including off-minimum
terms, and independently verify one coefficient-extraction interpolation.
"""

from collections import defaultdict
from fractions import Fraction
from itertools import product


def expand(m):
    polynomial = defaultdict(int)
    shift = 4 * (m - 1) ** 2
    for i, j, a, b, u in product(range(m), repeat=5):
        h = (i + j) % m
        v = a + b + u
        weights = (2 * h * u,
                   -2 * h * v + 2 * h * h + shift,
                   a * a, b * b)
        assert min(weights) >= 0
        degree = sum(weights)
        assert degree == shift + (a - h) ** 2 + (b - h) ** 2
        if not 0 <= v - 2 * h < m:
            continue
        output = ((h, i, u), (h, i, v - 2 * h),
                  (a, i), (b, (b - j) % m))
        polynomial[degree, output] += 1
    expected = {
        ((h, i, u), (h, i, u), (h, i), (h, i)): 1
        for h, i, u in product(range(m), repeat=3)
    }
    actual = {out: value for (degree, out), value in polynomial.items()
              if degree == shift}
    assert actual == expected
    assert min(degree for degree, _ in polynomial) == shift
    assert max(degree for degree, _ in polynomial) <= 6 * (m - 1) ** 2
    print(f'm={m}: exactly {m ** 3} target coefficients at degree {shift}; '
          'all other degrees are higher.')
    return polynomial


def interpolation_weights(degree, wanted):
    # The coefficient of t**wanted in each Lagrange basis polynomial
    # at the distinct evaluation points 0,...,degree.
    result = []
    for node in range(degree + 1):
        coeffs = [Fraction(1)]
        denominator = 1
        for other in range(degree + 1):
            if other == node:
                continue
            next_coeffs = [Fraction(0)] * (len(coeffs) + 1)
            for power, value in enumerate(coeffs):
                next_coeffs[power] -= other * value
                next_coeffs[power + 1] += value
            coeffs = next_coeffs
            denominator *= node - other
        result.append(coeffs[wanted] / denominator)
    return result


def check_interpolation(polynomial, m):
    degree = 6 * (m - 1) ** 2
    wanted = 4 * (m - 1) ** 2
    weights = interpolation_weights(degree, wanted)
    for power in range(degree + 1):
        assert sum(weight * node ** power
                   for node, weight in enumerate(weights)) == (power == wanted)
    reconstructed = defaultdict(Fraction)
    for node, weight in enumerate(weights):
        for (power, output), value in polynomial.items():
            reconstructed[output] += weight * node ** power * value
    reconstructed = {out: value for out, value in reconstructed.items() if value}
    expected = {out: Fraction(value) for (power, out), value in polynomial.items()
                if power == wanted}
    assert reconstructed == expected
    print(f'm={m}: all output coordinates pass exact {degree + 1}-point '
          'interpolation coefficient extraction.')


if __name__ == '__main__':
    for size in range(2, 9):
        tensor_polynomial = expand(size)
        if size == 2:
            check_interpolation(tensor_polynomial, size)
