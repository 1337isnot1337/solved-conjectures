#!/usr/bin/env python3
"""Check exact local identities, not new cases of the bounty conjecture."""

import argparse
import json
import math
from pathlib import Path


def primes_up_to(n):
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for p in range(2, math.isqrt(n) + 1):
        if sieve[p]:
            sieve[p * p : n + 1 : p] = b"\x00" * ((n - p * p) // p + 1)
    return [p for p in range(2, n + 1) if sieve[p]]


def vp(n, p):
    assert n > 0
    exponent = 0
    while n % p == 0:
        exponent += 1
        n //= p
    return exponent


def factorial_vp(n, p):
    total = 0
    while n:
        n //= p
        total += n
    return total


def binomial_vp(n, k, p):
    return factorial_vp(n, p) - factorial_vp(k, p) - factorial_vp(n - k, p)


def quotient_vp(s, t, p):
    return factorial_vp(s, p) + factorial_vp(2 * t - s, p) - 2 * factorial_vp(t, p)


def doubling_carries(n, p):
    carry = count = 0
    while n or carry:
        digit = n % p
        n //= p
        carry = (2 * digit + carry) // p
        count += carry
    return count


def run():
    primes = primes_up_to(1200)
    even_checks = odd_checks = 0
    for s in range(1, 21):
        for t in range(s + 1, s + 201):
            for p in primes:
                if p <= max(s, 2):
                    continue
                if p > 2 * t:
                    break
                divisible = [i for i in range(s) if (2 * t - i) % p == 0]
                assert len(divisible) <= 1
                if not divisible:
                    continue
                i = divisible[0]
                if i % 2:
                    e = vp(2 * t - i, p)
                    assert binomial_vp(2 * t, s, p) == e
                    assert binomial_vp(2 * t, t, p) >= e
                    assert quotient_vp(s, t, p) >= 0
                    odd_checks += 1
                else:
                    j = i // 2
                    e = vp(t - j, p)
                    u = (t - j) // (p**e)
                    assert binomial_vp(2 * t, t, p) == binomial_vp(2 * u, u, p)
                    assert quotient_vp(s, t, p) == binomial_vp(2 * u, u, p) - e
                    assert binomial_vp(2 * u, u, p) == doubling_carries(u, p)
                    even_checks += 1

    small_prime_checks = 0
    for s in range(1, 21):
        exponents = {}
        modulus = 1
        for p in primes:
            if p > max(s, 2):
                break
            e = 1
            while p**e <= s + 1:
                e += 1
            exponents[p] = e
            modulus *= p**e
        for multiplier in (1, 2, 3, 7):
            t = modulus * multiplier - 1
            assert t > s
            for p, e in exponents.items():
                assert binomial_vp(2 * t, s, p) == vp(s + 1, p)
                assert quotient_vp(s, t, p) >= e - vp(s + 1, p) > 0
                small_prime_checks += 1

    family = []
    for exponent in (1, 3, 15, 105, 1155):
        t = 3 * (3**exponent - 1) // 2
        assert t % 4 == 3
        assert vp(t, 3) == 1
        assert doubling_carries(t, 3) == 0
        assert binomial_vp(2 * t, t, 3) == 0
        vals = [quotient_vp(s, t, 3) for s in (1, 2)]
        assert vals == [-1, -1]
        family.append({"L": exponent, "t_bit_length": t.bit_length(), "t_mod_4": t % 4,
                       "v3_t": vp(t, 3), "v3_Q_s1": vals[0], "v3_Q_s2": vals[1],
                       "ternary_doubling_carries": doubling_carries(t, 3)})

    return {"status": "all assertions passed", "even_index_checks": even_checks,
            "odd_index_checks": odd_checks, "small_prime_checks": small_prime_checks,
            "counterfamily": family,
            "scope": "Verification of local identities and obstruction family only; no conjecture solution."}


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = run()
    rendered = json.dumps(result, indent=2) + "\n"
    if args.output:
        args.output.write_text(rendered)
    print(rendered, end="")
