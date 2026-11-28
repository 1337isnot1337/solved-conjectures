"""Exact small-prime bounds for the one-auxiliary-prime fibre estimate."""

from fractions import Fraction as F
from math import isqrt


def prime(n):
    return n >= 2 and all(n % d for d in range(2, isqrt(n) + 1))


def smooth_even_parts(limit):
    parts = []
    power_two = 2
    while power_two <= limit:
        d = power_two
        while d <= limit:
            parts.append(d)
            d *= 3
        power_two *= 2
    return sorted(parts)


def mass_bound(q, d):
    # Every prime q**e*d+1 passes Fermat's test to base 2.
    mass = sum(F(1, q**e) for e in range(1, 4)
               if pow(2, q**e * d, q**e * d + 1) == 1)
    return mass + F(1, q**3 * (q - 1))


def small_prime_loss(q, parts, tail, threshold):
    weights = [mass_bound(q, d) for d in parts]
    slack = threshold
    expected = tail / (q - 1) + sum(b / d for b, d in zip(weights, parts))
    best = expected / slack
    for d, b in zip(parts, weights):
        slack -= b
        expected -= b / d
        if slack <= 0:
            break
        best = min(best, expected / slack)
    return best


parts = smooth_even_parts(2000)
tail = F(3, 2) - sum(F(1, d) for d in parts)
direct = tail + sum(F(1, d) for d in parts if d >= 4 and prime(d + 1))
small = sum(small_prime_loss(q, parts, tail, F(9, 10)) for q in range(5, 101) if prime(q))
large = F(5, 4) * (F(1, 64) + F(1, 2 * 3**6))
assert direct + small < F(967, 1000)
assert direct + small + large < F(99, 100)
print("Direct and small-prime loss < 967/1000. Total loss < 99/100.")


primes = [q for q in range(5, 201) if prime(q)]
ordered = sum(small_prime_loss(q, parts, tail, 1 - F(i, q))
              for i, q in enumerate(primes))
ordered_tail = 3 * (F(1, 512) + F(1, 2 * 3**9))
assert direct + ordered < F(954, 1000)
assert direct + ordered + ordered_tail < F(97, 100)
print("Ordered mixed-modulus loss < 97/100.")
