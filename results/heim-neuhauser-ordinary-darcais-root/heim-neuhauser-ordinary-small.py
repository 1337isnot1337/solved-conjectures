#!/usr/bin/env python3
"""Exact ordinary root comparisons at small indices."""
from math import factorial


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
            g[k] += d
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
    B = scaled_polys(1,26)
    for n in range(6,26):
        certify(root_poly(B,n),True)
    print("Certified each ordinary root comparison n=6,...,25 at x>=1.")
    # Finite boundary for the separate, corrected 2021 fractional ratio statement.
    C = scaled_polys(2,26)
    for a in range(3,27):
        for b in range(1,a-1):
            if (a,b)==(6,4):
                continue
            certify(diff(mul(C[a-1],C[b+1]),mul(C[a],C[b]),a,b+1),(a,b)!=(4,2))
    D = scaled_polys(0,6)
    w = [-59328,-100204,12048,13119,4038,684,42,1]
    assert diff(mul(D[5],D[5]),mul(D[6],D[4]),6,5)==mul([0,0,3,1],w)
    print("Certified the finite boundary and exceptional factor for the corrected 2021 ratios.")
