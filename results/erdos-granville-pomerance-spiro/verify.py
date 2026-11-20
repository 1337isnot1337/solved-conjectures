"""Check finite congruence and algebra cases used in the written proofs."""

from fractions import Fraction
from itertools import product
from math import gcd


def check_quadratic_roots():
    for prime, exponent in product((3, 5, 7), range(1, 4)):
        modulus = prime**exponent
        cover_modulus = prime**((exponent + 1) // 2)
        roots_by_square = [[] for _ in range(modulus)]
        for root in range(modulus):
            roots_by_square[root * root % modulus].append(root)
        for roots in roots_by_square:
            assert len(roots) <= 2 * prime**(exponent // 2)
            assert len({root % cover_modulus for root in roots}) <= 2


def check_bilinear_sieve():
    for prime in (7, 11, 13):
        coordinates = tuple(product(range(prime), repeat=2))
        for coefficient, shift in coordinates:
            if coefficient == shift == 0:
                continue
            covered = [0] * prime
            for u, w in coordinates:
                if u and w:
                    value = coefficient * u * w + shift * (u + w + 1)
                    covered[value % prime] += 1
            for additional in covered:
                total = 2 * prime - 1 + additional
                assert total <= 4 * prime
                if shift:
                    assert total >= 3 * prime - 4


def check_bilinear_lift():
    for coefficient, shift, modulus, target in product(
        range(1, 6), range(1, 6), range(2, 13), range(-3, 6)
    ):
        if gcd(coefficient, shift) != 1:
            continue
        product_target = coefficient * target + shift * (shift - coefficient)
        count = 0
        for u, w in product(range(modulus), repeat=2):
            value = coefficient * u * w + shift * (u + w + 1)
            shifted_product = (coefficient * u + shift) * (coefficient * w + shift)
            direct = (value - target) % modulus == 0
            assert direct == (
                (shifted_product - product_target) % (coefficient * modulus) == 0
            )
            count += direct
        common = gcd(product_target, modulus)
        divisor_count = sum(common % d == 0 for d in range(1, common + 1))
        assert count <= modulus * divisor_count


def check_cofactor_ratios():
    for t, a, t_prime, a_prime in product(range(1, 16), repeat=4):
        if gcd(t, a) != 1 or gcd(t_prime, a_prime) != 1:
            continue
        numerator = t * (t + a)
        numerator_prime = t_prime * (t_prime + a_prime)
        assert gcd(numerator * a_prime, numerator_prime * a) == (
            gcd(numerator, numerator_prime) * gcd(a, a_prime)
        )
        if Fraction(numerator, numerator_prime) == Fraction(a, a_prime) ** 2:
            assert (t, a) == (t_prime, a_prime)

    ratios = {Fraction(a, b) for a, b in product(range(1, 6), repeat=2)}
    for z, sigma in product(range(1, 9), repeat=2):
        for alpha, ratio in product(ratios, repeat=2):
            leading = alpha**2 * (sigma - z) ** 2 + 4 * ratio * z * sigma
            linear = 2 * alpha**2 * (sigma - z) * sigma + 4 * ratio * z * sigma
            constant = alpha**2 * sigma**2
            assert linear**2 - 4 * leading * constant == (
                16 * ratio * z**2 * sigma**2 * (ratio - alpha**2)
            )


if __name__ == "__main__":
    check_quadratic_roots()
    check_bilinear_sieve()
    check_bilinear_lift()
    check_cofactor_ratios()
    print("Quadratic roots, bilinear congruences, and cofactor identities passed.")
