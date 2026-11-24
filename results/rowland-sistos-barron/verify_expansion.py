#!/usr/bin/env python3
"""Independent exact expansion check for the proposed rank-sequence formula.

This finite check supports, and does not replace, the all-exponent proof.
The implementation multiplies the four-term polynomial directly; it does not
use the Krawtchouk formula used in that proof.
"""

import argparse
import json
from collections import defaultdict
from math import isqrt


def multiply(polynomial):
    out = defaultdict(int)
    # t + t*x**3 + x - x**4
    for (t_degree, x_degree), value in polynomial.items():
        out[t_degree + 1, x_degree] += value
        out[t_degree + 1, x_degree + 3] += value
        out[t_degree, x_degree + 1] += value
        out[t_degree, x_degree + 4] -= value
    return {key: value for key, value in out.items() if value}


def rank_from_expansion(polynomial):
    degrees = {}
    for (t_degree, x_degree), value in polynomial.items():
        assert value != 0
        degrees[x_degree] = max(degrees.get(x_degree, -1), t_degree)
    return sum(degree + 1 for degree in degrees.values()), degrees


def proposed_rank(exponent):
    return ((7 * exponent * exponent + 3 * exponent + 2) // 2
            - 3 * (exponent % 2 == 0)
            - 6 * (isqrt(exponent) ** 2 == exponent))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--max-exponent', type=int, default=169)
    args = parser.parse_args()
    assert args.max_exponent >= 49
    polynomial = {(0, 0): 1}
    samples = []
    verified = 0
    for exponent in range(1, args.max_exponent + 1):
        polynomial = multiply(polynomial)
        rank, degrees = rank_from_expansion(polynomial)
        if exponent == 1:
            assert rank == 6
            assert degrees == {0: 1, 3: 1, 1: 0, 4: 0}
        if exponent >= 49:
            expected = proposed_rank(exponent)
            assert rank == expected, (exponent, rank, expected)
            assert set(degrees) == set(range(4 * exponent + 1))
            baseline = ((7 * exponent * exponent + 3 * exponent + 2) // 2)
            if isqrt(exponent) ** 2 == exponent or exponent in (49, 50, 51):
                samples.append({'exponent': exponent, 'rank': rank,
                                'baseline_minus_rank': baseline - rank})
            verified += 1
    print(json.dumps({'method': 'direct exact four-term polynomial multiplication',
                      'initial_rank': 6, 'all_formula_checks_passed': True,
                      'exponents_checked': [49, args.max_exponent],
                      'number_of_formula_checks': verified,
                      'samples': samples}, indent=2))


if __name__ == '__main__':
    main()
