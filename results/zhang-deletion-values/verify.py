#!/usr/bin/env python3
"""Exact check of the deletion values LR([n-1] minus {r}) against the closed formula of PROOF.md.

LR(V) = max_t min_{v in V} ||v t||.  For a finite set V of positive integers the maximum is attained at a
time t = a/(u+v) with u, v in V (u = v allowed): at a maximiser two runners are at the same distance from
the origin on opposite sides, or one runner is at distance 1/2.  All arithmetic is in integers.

Formula (n >= 3, 1 <= r <= n-1):
    2r <= n-1 :  LR = 2/D_r,  D_r = least integer >= n+r coprime to r      (Liu's theorem, quoted by Zhang)
    2r >  n-1 :  LR = 1/r                                                   (this note)
Consequence (Zhang's Question 8.4):  LR > 1/(n-1) for all n >= 4 and 1 <= r <= n-2.
Standard library only.  Usage: python3 verify.py [NMAX]   (default 40)
"""
import sys
from fractions import Fraction
from math import gcd


def loneliness(V):
    V = sorted(V)
    best_num, best_den = 0, 1
    for i, u in enumerate(V):
        for v in V[i:]:
            q = u + v
            for a in range(1, q):
                m = q
                for d in V:
                    x = (d * a) % q
                    if x > q - x:
                        x = q - x
                    if x < m:
                        m = x
                        if m * best_den <= best_num * q:
                            break
                else:
                    best_num, best_den = m, q
    return Fraction(best_num, best_den)


def formula(n, r):
    if 2 * r <= n - 1:
        D = n + r
        while gcd(D, r) != 1:
            D += 1
        return Fraction(2, D)
    return Fraction(1, r)


def main():
    nmax = int(sys.argv[1]) if len(sys.argv) > 1 else 40
    cases = strict = 0
    for n in range(3, nmax + 1):
        for r in range(1, n):
            V = [v for v in range(1, n) if v != r]
            L = loneliness(V)
            assert L == formula(n, r), (n, r, L, formula(n, r))
            cases += 1
            if n >= 4 and r <= n - 2:
                assert L > Fraction(1, n - 1), (n, r, L)
                strict += 1
            if 2 * r <= n - 1:
                # the witness time of the proof: t = j/D with j*r = 1 (mod D)
                D = formula(n, r).denominator if formula(n, r).numerator == 2 else 2 * formula(n, r).denominator
                j = pow(r, -1, D)
                assert min(min((v * j) % D, D - (v * j) % D) for v in V) >= 2
                assert D <= 2 * n - 3 or n == 3
    print("deletion values: %d cases with 3 <= n <= %d agree with the formula" % (cases, nmax))
    print("Question 8.4: LR([n-1] minus {r}) > 1/(n-1) in all %d cases with n >= 4, r <= n-2" % strict)
    print("OK")


if __name__ == "__main__":
    main()
