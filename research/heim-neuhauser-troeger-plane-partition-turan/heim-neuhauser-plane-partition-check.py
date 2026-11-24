#!/usr/bin/env python3
"""Exact coefficient certificates for the stated *finite* HN/HNT ranges."""
from math import factorial
import argparse


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            c[i + j] += ai * bj
    return c


def ppow(a, e):
    c = [1]
    while e:
        if e & 1:
            c = mul(c, a)
        e //= 2
        if e:
            a = mul(a, a)
    return c


def scaled_polys(endpoint, upto):
    g = [0] * (upto + 1)
    for d in range(1, upto + 1):
        for k in range(d, upto + 1, d):
            g[k] += d*d
    B = [[1]]
    for n in range(1, upto + 1):
        tmp = [0] * n
        fall = 1
        for k in range(1, n + 1):
            c = fall * g[k]
            for j, a in enumerate(B[n - k]):
                tmp[j] += c*a
            fall *= n-k
        # B_n(t) = n! P_n(t+endpoint), by the generating-function recurrence.
        B.append([endpoint*tmp[0]] +
                 [tmp[j-1]+endpoint*tmp[j] for j in range(1,n)] +
                 [tmp[-1]])
    return B


def diff(a, b, aa, bb):
    assert len(a) == len(b)
    return [aa*u-bb*v for u,v in zip(a,b)]


def root_poly(B,n):
    return diff(ppow(B[n],n+1),ppow(B[n+1],n),(n+1)**n,factorial(n))


def turan_poly(B,n):
    return diff(mul(B[n],B[n]),mul(B[n-1],B[n+1]),n+1,n)


def certify(c, endpoint_included):
    assert c[-1] > 0
    assert c[0] > 0 or (not endpoint_included and c[0] == 0)
    assert min(c) >= 0


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--upto", type=int, default=250)
    N = p.parse_args().upto
    assert N >= 12
    B = scaled_polys(1,N+1)
    for n in range(6,12):
        certify(root_poly(B,n),True)
    for n in range(12,N+1):
        certify(turan_poly(B,n),True)
    # A decreasing nth-root pair at 11, followed by log-concavity of entries
    # at 12,...,N, implies all subsequent root decreases through pair N.
    C = scaled_polys(5,7)
    for n in range(1,6):
        certify(root_poly(C,n),False)
    # Wording caveat to the older paper's distinct Conjecture 3.
    E = scaled_polys(2,12)
    for a in range(2,13):
        for b in range(a-1):
            if (a,b) in {(4,2),(6,4)}:
                continue
            c = diff(mul(E[a-1],E[b+1]),mul(E[a],E[b]),a,b+1)
            if b == 0 and a <= 11:
                assert c[0] < 0  # already visible in the source's Table 8
            else:
                certify(c,True)
    print("Certified the finite boundary for the corrected off-diagonal statement.")
    print(f"Certified root inequalities through n={N} on both conjectured parameter ranges.")
    print(f"Certified Turán inequalities at n=12,...,{N} for x>=1.")
