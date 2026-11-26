#!/usr/bin/env python3
"""Exact supplemental checks for the Rowland--Sistos Barron counterexample.

Only the standard library is required. The symbolic proof establishes the
unbounded theorem; these checks catch transcription and degree-count errors.
"""
from collections import defaultdict
from math import isqrt
import argparse
import json


BASE = ((1, 0, 1), (1, 3, 1), (0, 1, 1), (0, 4, -1))


def multiply_by_base(poly):
    out = defaultdict(int)
    for (t_degree, x_degree), coefficient in poly.items():
        for dt, dx, scale in BASE:
            out[t_degree + dt, x_degree + dx] += coefficient * scale
    return {key: value for key, value in out.items() if value}


def degree_map(poly):
    degrees = {}
    for (t_degree, x_degree), coefficient in poly.items():
        assert coefficient
        degrees[x_degree] = max(degrees.get(x_degree, -1), t_degree)
    return degrees


def predicted_rank(exponent):
    m = isqrt(exponent)
    return ((7 * exponent * exponent + 3 * exponent + 2) // 2
            - 3 * (exponent % 2 == 0) - 6 * (m * m == exponent))


def predicted_degrees(exponent):
    assert exponent >= 49
    out = {}
    m = isqrt(exponent)
    square = m * m == exponent
    square_exponents = ({2 + 3 * ((exponent - m) // 2),
                         2 + 3 * ((exponent + m) // 2)} if square else set())
    parity_exponent = (1 + 3 * exponent // 2 if exponent % 2 == 0 else None)
    for k in range(4 * exponent + 1):
        r = k % 3 if k <= 3 * exponent else k - 3 * exponent
        degree = exponent - r
        if k == parity_exponent or k in square_exponents:
            degree -= 3
        out[k] = degree
    return out


def berlekamp_massey(sequence, prime):
    """Length of the shortest recurrence for a finite sequence mod prime."""
    current, previous = [1], [1]
    length, age, old_discrepancy = 0, 1, 1
    for n, term in enumerate(sequence):
        discrepancy = (term + sum(current[i] * sequence[n-i]
                                  for i in range(1, length+1))) % prime
        if not discrepancy:
            age += 1
            continue
        old_current = current[:]
        scale = discrepancy * pow(old_discrepancy, -1, prime) % prime
        needed = len(previous) + age
        current += [0] * max(0, needed - len(current))
        for i, coefficient in enumerate(previous):
            current[i+age] = (current[i+age] - scale * coefficient) % prime
        if 2 * length <= n:
            length = n + 1 - length
            previous = old_current
            old_discrepancy = discrepancy
            age = 1
        else:
            age += 1
    return length


def sequence_mod(exponent, count, prime):
    return [pow((n * (1 + pow(8, n, prime)) + pow(2, n, prime)
                 - pow(16, n, prime)) % prime, exponent, prime)
            for n in range(count)]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--max-exponent', type=int, default=180)
    args = parser.parse_args()
    assert args.max_exponent >= 49
    poly = {(0, 0): 1}
    ranks, prefix_exceptions = {}, []
    for exponent in range(1, args.max_exponent + 1):
        poly = multiply_by_base(poly)
        degrees = degree_map(poly)
        rank = sum(d + 1 for d in degrees.values())
        ranks[exponent] = rank
        if exponent >= 49:
            assert degrees == predicted_degrees(exponent), exponent
            assert rank == predicted_rank(exponent), exponent
        elif rank != predicted_rank(exponent):
            prefix_exceptions.append({'M': exponent, 'exact_rank': rank,
                                      'eventual_formula': predicted_rank(exponent)})
    prime = 1_000_000_007
    bm_results = []
    for exponent in range(1, 9):
        rank = ranks[exponent]
        measured = berlekamp_massey(sequence_mod(exponent, 2 * rank + 16, prime), prime)
        assert measured == rank, (exponent, rank, measured)
        bm_results.append({'M': exponent, 'rank': rank})
    samples = sorted(set([1, 2, 4, 8, 9, 16, 25, 36, 49, 50, 64, 81,
                          100, 121, 144, 169, args.max_exponent]))
    report = {
        'all_checks_passed': True,
        'exact_bivariate_expansion_exponents': [1, args.max_exponent],
        'all_coefficient_degrees_checked': [49, args.max_exponent],
        'prefix_exceptions_to_eventual_formula': prefix_exceptions,
        'independent_modular_recurrence_checks': bm_results,
        'sample_ranks': {str(M): ranks[M] for M in samples if M in ranks},
        'proof_scope': 'The companion symbolic proof, not this finite check, covers every M >= 49.',
    }
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
