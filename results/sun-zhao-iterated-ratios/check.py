"""Exact certificate for Sun--Zhao, arXiv:1602.04359v4, Conjecture 5.2.

Only the Python standard library is used. No floating-point arithmetic occurs.
"""

from fractions import Fraction
from math import comb
import json


def source_recurrence(nmax):
    p = [1, 8]
    for n in range(2, nmax + 1):
        numerator = (8 * (3 * n * n - 3 * n + 1) * p[-1]
                     - 128 * (n - 1) ** 2 * p[-2])
        assert numerator % (n * n) == 0
        p.append(numerator // (n * n))
    return p


def positive_sum(n):
    # Independent binomial representation; used only as a consistency check.
    return sum(comb(n, 2 * k) * comb(2 * k, k) ** 2
               * 4 ** k * 8 ** (n - 2 * k)
               for k in range(n // 2 + 1))


def alternating_sum(n):
    return 2 ** n * sum((-4) ** k * comb(n - k, k)
                        * comb(2 * n - 2 * k, n - k) ** 2
                        for k in range(n // 2 + 1))


def main():
    p = source_recurrence(26)
    assert p == [positive_sum(n) for n in range(27)]
    assert p == [alternating_sum(n) for n in range(27)]
    iteration, base, order, terms = 12, 12, 14, 24
    assert base >= iteration and order == iteration + 2
    even_product = odd_product = 1
    total = Fraction(0)
    for j in range(order + 1):
        value = p[base + j]
        weight = comb(order, j)
        if j % 2:
            odd_product *= value ** weight
        else:
            even_product *= value ** weight
        x = Fraction(32 * value, 16 ** (base + j))
        u = (x - 1) / (x + 1)
        assert abs(u) <= Fraction(1, 3)
        log_truncation = 2 * sum(
            (u ** (2 * r + 1) / (2 * r + 1) for r in range(terms)),
            Fraction(0))
        total += (-1) ** j * weight * log_truncation
    assert even_product < odd_product
    assert even_product.bit_length() == odd_product.bit_length() == 582535
    error = Fraction(2 ** (order + 1), 1) * Fraction(1, 3) ** (2 * terms + 1)
    error /= (2 * terms + 1) * (1 - Fraction(1, 9))
    lower, upper = Fraction(-185605, 10 ** 15), Fraction(-185604, 10 ** 15)
    assert lower < total - error
    assert total + error < upper < 0
    # Independent direct ratio iteration verifies the translation from k to k+2.
    # Only the required block of length k+3 is needed.
    block = [Fraction(v) for v in p[base:base + order + 1]]
    for _ in range(iteration):
        block = [y / x for x, y in zip(block, block[1:])]
    assert len(block) == 3
    assert block[1] ** 2 > block[0] * block[2]
    print(json.dumps({
        "source": "arXiv:1602.04359v4, Conjecture 5.2",
        "iteration": iteration,
        "retained_indices": [base, base + 1, base + 2],
        "forward_difference_order": order,
        "P_values": p[base:base + order + 1],
        "even_product_less_than_odd_product": True,
        "product_bit_lengths": [even_product.bit_length(), odd_product.bit_length()],
        "certified_log_difference_lower": str(lower),
        "certified_log_difference_upper": str(upper),
        "log_series_terms": terms,
        "direct_ratio_iteration_agrees": True,
    }, indent=2))


if __name__ == "__main__":
    main()
