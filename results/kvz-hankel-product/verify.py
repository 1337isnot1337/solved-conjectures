#!/usr/bin/env python3
"""Exact algebra checks for the KVZ Hankel-product counterexamples.

Python standard library only. This complements the all-orders factor proofs
and whole-family counterexample proofs in PROOF.md; it does not replace them.
"""

from fractions import Fraction as F


# Polynomials in (a,t), represented by exact rational coefficient dictionaries.
def add(p, q):
    result = dict(p)
    for exponent, coefficient in q.items():
        result[exponent] = result.get(exponent, F(0)) + coefficient
    return {e: c for e, c in result.items() if c}


def scale(p, scalar):
    return {e: scalar * c for e, c in p.items() if scalar * c}


def multiply(p, q):
    result = {}
    for (a1, t1), c1 in p.items():
        for (a2, t2), c2 in q.items():
            exponent = (a1 + a2, t1 + t2)
            result[exponent] = result.get(exponent, F(0)) + c1 * c2
    return {e: c for e, c in result.items() if c}


def shifted_h(k):
    # h_c(s+k)=(a+k)(1+t/2^k), a=s+c and t=2^{-s}.
    return multiply({(1, 0): F(1), (0, 0): F(k)},
                    {(0, 0): F(1), (0, 1): F(1, 2**k)})


expanded = add(multiply(shifted_h(0), shifted_h(2)),
               scale(multiply(shifted_h(1), shifted_h(1)), F(-1)))
claimed = {(0, 0): F(-1), (2, 1): F(1, 4),
           (1, 1): F(1, 2), (0, 1): F(-1), (0, 2): F(-1, 4)}
assert expanded == claimed
print("Polynomial identity (4): verified over Q[a,t].")


def h(s, c=3):
    return (F(s) + c) * (1 + F(1, 2**s))


def delta(s, c=3):
    return h(s, c) * h(s + 2, c) - h(s + 1, c)**2


positive = delta(2)
negative = delta(10)
assert positive == F(59, 64) > 0
assert negative == F(-3998721, 4194304) < 0
print(f"Finite-rank witnesses: {positive} > 0; {negative} < 0.")

# Both sides of each radical comparison are positive, so squaring is equivalent.
positive_gap = 35 * 49**2 - (6 * 45)**2
negative_gap = 196 * (1023 * 4095)**2 - 195 * 2047**4
assert positive_gap == 11135 > 0
assert negative_gap == 15876073570305 > 0
print(f"Strict-factor positive witness squared gap: {positive_gap} > 0.")
print(f"Strict-factor negative witness squared gap: {negative_gap} > 0.")
print("All exact checks passed; no floating-point arithmetic was used.")
