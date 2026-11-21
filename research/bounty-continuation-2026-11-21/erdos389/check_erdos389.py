#!/usr/bin/env python3
"""Check E389 research reductions, not the unbounded existence conjecture."""

import argparse
import hashlib
import json
from fractions import Fraction
from math import comb, isqrt, log, prod
from pathlib import Path


def primes_through(n):
    prime = bytearray([1]) * (n + 1)
    prime[0:2] = b"\0\0"
    for p in range(2, isqrt(n) + 1):
        if prime[p]:
            prime[p * p:n + 1:p] = b"\0" * ((n - p * p) // p + 1)
    return [p for p in range(2, n + 1) if prime[p]]


def factorial_valuation(n, p):
    result = 0
    while n:
        n //= p
        result += n
    return result


def integer_valuation(n, p):
    result = 0
    while n % p == 0:
        n //= p
        result += 1
    return result


def central_valuation(n, p):
    return factorial_valuation(2 * n, p) - 2 * factorial_valuation(n, p)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=Path("erdos389_check.json"))
    args = parser.parse_args()
    primes = primes_through(1000)
    cases = witnesses = smooth_checks = gap_checks = 0
    cofactor_checks = odd_factor_checks = small_prime_checks = 0
    for n in range(1, 31):
        s = n - 1
        for k in range(1, 301):
            t = s + k
            q = Fraction(prod(range(n + k, n + 2 * k)), prod(range(n, n + k)))
            assert q == Fraction(comb(2 * t, t), comb(2 * t, s))
            integral = q.denominator == 1
            exponents = [factorial_valuation(s, p) + factorial_valuation(2 * t - s, p)
                         - 2 * factorial_valuation(t, p)
                         for p in primes if p <= 2 * t - s]
            assert integral == all(v >= 0 for v in exponents)
            cases += 1
            for p in primes:
                if p <= max(s, 2):
                    power = p
                    m = 1
                    while power <= s + 1:
                        power *= p
                        m += 1
                    if (t + 1) % power == 0:
                        denominator_v = (factorial_valuation(2 * t, p)
                                         - factorial_valuation(s, p)
                                         - factorial_valuation(2 * t - s, p))
                        assert denominator_v == integer_valuation(s + 1, p)
                        assert central_valuation(t, p) >= m
                        small_prime_checks += 1
                    continue
                if p > 2 * t:
                    break
                actual_v = (factorial_valuation(s, p)
                            + factorial_valuation(2 * t - s, p)
                            - 2 * factorial_valuation(t, p))
                for i in range(s):
                    if (2 * t - i) % p:
                        continue
                    if i % 2:
                        assert actual_v >= 0
                        odd_factor_checks += 1
                    else:
                        j = i // 2
                        e = integer_valuation(t - j, p)
                        u = (t - j) // (p ** e)
                        assert actual_v == central_valuation(u, p) - e
                        cofactor_checks += 1
            if not integral:
                continue
            witnesses += 1
            assert k * k > n * log(2)
            if s >= 1 and t >= 8:
                p = max(p for p in primes if p <= t)
                assert 2 * (t - p) >= min(2 * k, s)
                gap_checks += 1
            for j in range((s + 1) // 2):
                for p in primes:
                    if (t - j) % p == 0:
                        assert p <= s or p * p <= 2 * t - s
                        smooth_checks += 1
    for a in range(1, 15):
        t = 2 ** a
        value = (factorial_valuation(2 * t - 1, 2)
                 - 2 * factorial_valuation(t, 2))
        assert value == -a
    for l in [1, 3, 15, 105]:
        t = 3 * (3 ** l - 1) // 2
        assert t % 4 == 3
        assert integer_valuation(t, 3) == 1
        assert central_valuation(t, 3) == 0
        for s in [1, 2]:
            assert (factorial_valuation(s, 3)
                    + factorial_valuation(2 * t - s, 3)
                    - 2 * factorial_valuation(t, 3)) == -1
    report = {"status": "bounded_checks_of_reductions_only", "n_range": [1, 30],
              "k_range": [1, 300], "pairs_checked": cases,
              "integral_pairs_checked": witnesses, "prime_gap_checks": gap_checks,
              "prime_factors_checked_for_smoothness": smooth_checks,
              "large_prime_cofactor_identity_checks": cofactor_checks,
              "large_prime_odd_factor_checks": odd_factor_checks,
              "small_prime_cleanup_checks": small_prime_checks,
              "power_of_two_counterfamily_exponents_checked": [1, 14],
              "strong_counterfamily_L_checked": [1, 3, 15, 105],
              "bounty_solutions": 0, "bounty_submissions": 0,
              "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    args.output.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
