"""Exact continued-fraction candidates for a full Erdős 686 bounty witness.

No numerical output from this script is a proof of the all-length conjecture.
All accepted witnesses are checked using integer arithmetic. The rational
continued-fraction interval is certified by integer powers. Search coverage is
recorded, not asserted as a general theorem by this exploratory program.
"""
from __future__ import annotations

import argparse
import json
from fractions import Fraction
from math import gcd, prod
from pathlib import Path
from time import monotonic

from sympy import integer_nthroot


def cf_interval(N: int, k: int, digits: int):
    scale = 10**digits
    low, exact = integer_nthroot(N * scale**k, k)
    if exact:
        raise ValueError("The rational-root case needs a separate enumeration")
    assert low**k < N * scale**k < (low + 1)**k
    ln, ld, hn, hd = low, scale, low + 1, scale
    cf = []
    while True:
        a, b = ln // ld, hn // hd
        if a != b or ln == a * ld:
            break
        cf.append(a)
        ln, ld, hn, hd = hd, hn - a * hd, ld, ln - a * ld
    return low, scale, cf


def ceiling_div(a: int, b: int):
    return -((-a) // b)


def approximation_bound(k: int, low: int, scale: int):
    """Rational upper bound K for (alpha - p/q) * (g*q)^2.

    Derived using disjointness and log(1-z); see README.md for the proof.
    """
    alpha_upper = Fraction(low+1, scale)
    if k % 2:
        largest_root = (k-1)//2
        center_lower = max(
            (k+1)//2,
            ceiling_div(k*scale, low+1-scale) - largest_root,
        )
        base = Fraction(k*k-1, 24)
    else:
        largest_root = k-1
        center_lower = max(
            k+1,
            ceiling_div(2*k*scale, low+1-scale) - largest_root,
        )
        if center_lower % 2 == 0:
            center_lower += 1
        base = Fraction(k*k-1, 6)
    K = ((alpha_upper - 1/alpha_upper) * base *
         Fraction(center_lower**2, center_lower**2-largest_root**2))
    B = ceiling_div(K.numerator, K.denominator) + 1
    return center_lower, K, B


def centered_delta(N: int, k: int, p: int, q: int, g: int):
    # Odd k: centers x=m+(k+1)/2, y=n+(k+1)/2.
    # Even k: doubled centers X=2m+k+1, Y=2n+k+1.
    if k % 2:
        roots = range(1, (k - 1) // 2 + 1)
        return p * prod((g * p)**2 - j*j for j in roots) - N * q * prod(
            (g * q)**2 - j*j for j in roots
        )
    roots = range(1, k, 2)
    return prod((g * p)**2 - j*j for j in roots) - N * prod(
        (g * q)**2 - j*j for j in roots
    )


def inspect_pair(N: int, k: int, p: int, q: int):
    if p <= q or q < 1 or gcd(p, q) != 1 or p**k >= N * q**k:
        return None, False
    if k % 2:
        g0 = max(1, ceiling_div((k + 1) // 2, q), ceiling_div(k, p-q))
    else:
        if p % 2 == 0 or q % 2 == 0:
            return None, False
        g0 = max(1, ceiling_div(k + 1, q), ceiling_div(2*k, p-q))
        if g0 % 2 == 0:
            g0 += 1
    d0 = centered_delta(N, k, p, q, g0)
    if d0 < 0:
        return None, False
    left, right = g0, g0
    if d0 > 0:
        while centered_delta(N, k, p, q, right) > 0:
            right *= 2
        while left < right:
            mid = (left + right) // 2
            if centered_delta(N, k, p, q, mid) > 0:
                left = mid + 1
            else:
                right = mid
    g = left
    if centered_delta(N, k, p, q, g) != 0 or (k % 2 == 0 and g % 2 == 0):
        return None, True
    if k % 2:
        m, n = g*p - (k+1)//2, g*q - (k+1)//2
    else:
        m, n = (g*p-k-1)//2, (g*q-k-1)//2
    assert n >= 0 and m >= n + k
    assert prod(range(m+1, m+k+1)) == N * prod(range(n+1, n+k+1))
    return {"N": N, "k": k, "m": str(m), "n": str(n), "g": str(g)}, True


def run(N: int, k: int, digits: int, coefficient_bound: int | None):
    started = monotonic()
    low, scale, cf = cf_interval(N, k, digits)
    min_center, K, derived_bound = approximation_bound(k, low, scale)
    if coefficient_bound is None:
        coefficient_bound = derived_bound
    pp, pq, p, q = 0, 1, 1, 0
    convergents = []
    for a in cf:
        pp, p, pq, q = p, a*p+pp, q, a*q+pq
        convergents.append((p, q))
    pairs = checked = brackets = 0
    hits = []
    # A candidate denominator is in [q_j,q_{j+1}); the previous convergent
    # and current one are a unimodular integer basis.
    for j in range(len(convergents) - 1):
        p, q = convergents[j]
        prev_p, prev_q = convergents[j-1] if j else (1, 0)
        next_q = convergents[j+1][1]
        for b in range(-coefficient_bound, coefficient_bound+1):
            lo_a = ceiling_div(q - b*prev_q, q)
            hi_a = (next_q-1 - b*prev_q) // q
            for a in range(lo_a, hi_a+1):
                v, u = a*p + b*prev_p, a*q + b*prev_q
                pairs += 1
                if gcd(a, b) != 1:
                    continue
                checked += 1
                hit, bracketed = inspect_pair(N, k, v, u)
                brackets += bracketed
                if hit:
                    hits.append(hit)
    return {
        "scope": "bounded exact continued-fraction basis candidate search, not an all-length proof",
        "N": N, "k": k, "root_digits": digits,
        "root_lower_numerator": str(low), "root_denominator": str(scale),
        "certified_cf_terms": len(cf),
        "center_lower_bound": min_center,
        "approximation_K_upper": str(K),
        "derived_sufficient_coefficient_bound": derived_bound,
        "coefficient_bound_covers_derived_bound": coefficient_bound >= derived_bound,
        "coefficient_b_abs_max": coefficient_bound,
        "max_reduced_denominator_exclusive": str(convergents[-1][1]),
        "basis_pairs": pairs, "primitive_pairs": checked,
        "positive_to_negative_g_brackets": brackets,
        "witnesses": hits, "seconds": round(monotonic()-started, 3),
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--ratio", type=int, default=25)
    parser.add_argument("--length", type=int, default=3)
    parser.add_argument("--digits", type=int, default=400)
    parser.add_argument("--coefficient-bound", type=int)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = run(args.ratio, args.length, args.digits, args.coefficient_bound)
    payload = json.dumps(result, indent=2)
    if args.output:
        args.output.write_text(payload + "\n")
    print(payload)
