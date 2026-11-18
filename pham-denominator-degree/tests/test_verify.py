import unittest

from verify import (
    PRIMARY, DUAL, Q, R, COEFFICIENTS_PRIMARY,
    level_counts, brute_force_level_counts, polynomial_gcd_is_one,
    series_product, is_primitive, multiply,
)


class ProofTests(unittest.TestCase):
    def test_primitive_and_dual(self):
        self.assertTrue(is_primitive(PRIMARY))
        self.assertEqual(DUAL, ''.join('1' if x == '0' else '0' for x in PRIMARY[::-1]))

    def test_main_exact_certificate(self):
        h = level_counts(PRIMARY, 25)
        self.assertEqual(tuple(h), COEFFICIENTS_PRIMARY)
        self.assertEqual(series_product(Q, h), R + (0,) * 18)
        self.assertTrue(polynomial_gcd_is_one(Q, R))

    def test_primary_against_full_partitions(self):
        self.assertEqual(level_counts(PRIMARY, 13),
                         brute_force_level_counts(PRIMARY, 13))

    def test_dual_against_full_partitions(self):
        self.assertEqual(level_counts(DUAL, 12),
                         brute_force_level_counts(DUAL, 12))

    def test_published_bwww(self):
        # Pham (2022), Section 6:
        # H_BWWW = (1-x)*(x^5+8x^4-3x^3-8x^2-6x-4)
        #           /(6x^4+4x^3+x^2-1).
        numerator_inner = (-4, -6, -8, -3, 8, 1)
        expected = multiply((1, -1), numerator_inner)
        denominator = (-1, 0, 1, 4, 6)
        actual = series_product(denominator, level_counts('1000', 15))
        self.assertEqual(actual, expected + (0,) * (16 - len(expected)))

    def test_published_bbbw(self):
        # Pham (2022), Section 6:
        # H_BBBW = (1-x)*(2x^5+8x^4-5x^3-10x^2-7x-4)
        #           /(6x^4+4x^3+x^2-1).
        numerator_inner = (-4, -7, -10, -5, 8, 2)
        expected = multiply((1, -1), numerator_inner)
        denominator = (-1, 0, 1, 4, 6)
        actual = series_product(denominator, level_counts('1110', 15))
        self.assertEqual(actual, expected + (0,) * (16 - len(expected)))


if __name__ == '__main__':
    unittest.main()
