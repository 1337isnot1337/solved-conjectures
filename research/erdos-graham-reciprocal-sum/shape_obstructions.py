"""Verify simple-root obstructions for all translations of seven quadratic shapes."""
from fractions import Fraction
from math import isqrt


def backward_sizes(ratio, prime, root, depth):
    assert prime > 2 and all(prime % i for i in range(2, isqrt(prime) + 1))
    a = ratio.numerator * pow(ratio.denominator, -1, prime) % prime

    def numerator(n):
        return (a * n * (n + 1) + 1) % prime

    assert numerator(root) == 0 and a * (2 * root + 1) % prime != 0
    states = {-numerator(root + 1) % prime}
    sizes = [1]
    for j in range(1, depth + 1):
        left, right = numerator(root - j), numerator(root - j + 1)
        products = {left * w % prime for w in states}
        states = {v for v in range(prime) if v * (v + right) % prime in products}
        sizes.append(len(states))
    assert not states
    return sizes


if __name__ == "__main__":
    certificates = [
        (Fraction(-16), 11, 4, 5),
        (Fraction(-64), 13, 3, 3),
        (Fraction(-252), 19, 6, 3),
        (Fraction(-1932), 31, 9, 2),
        (Fraction(-2700), 11, 4, 5),
        (Fraction(63, 16), 11, 4, 5),
        (Fraction(-36225, 256), 19, 16, 6),
    ]
    for ratio, prime, root, depth in certificates:
        print(ratio, prime, root, backward_sizes(ratio, prime, root, depth))
