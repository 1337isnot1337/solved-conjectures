"""Exact consistency checks for the paired-row divisibility obstruction.

This does not search for new minimum-permanent matrices or prove an order case.
"""
from itertools import product
from math import factorial
from random import Random


def valuation(n):
    assert n
    n = abs(n)
    return (n & -n).bit_length() - 1


def exponent(m):
    return min(m + (k + 1) // 2 - (2*m-k).bit_count()
               for k in range(2*m+1))


def exponent_by_maximum(m):
    return 2*m - max(m + m.bit_count(),
                    1 + max(j+j.bit_count() for j in range(m)))


def mixed_exponent(n, q):
    assert 0 <= q <= n and (n-q) % 2 == 0
    return min(n + max(0, (k-q+1)//2) - (n-k).bit_count()
               for k in range(n+1))


def coefficient(V):
    m = len(V)
    states = {(0,)*m: 1}
    for column in zip(*V):
        nxt = {}
        for alpha, value in states.items():
            for i, sign in enumerate(column):
                if alpha[i] == 2:
                    continue
                beta = list(alpha)
                beta[i] += 1
                beta = tuple(beta)
                nxt[beta] = nxt.get(beta, 0) + sign*value
        states = nxt
    return states.get((2,)*m, 0)


def permanent(A):
    n = len(A)
    dp = [0]*(1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        row = mask.bit_count()-1
        remaining = mask
        while remaining:
            bit = remaining & -remaining
            j = bit.bit_length()-1
            dp[mask] += A[row][j]*dp[mask ^ bit]
            remaining -= bit
    return dp[-1]


def check_bookkeeping():
    for m in range(1, 9):
        for alpha in product(range(3), repeat=m):
            k = sum(alpha)
            u = sum(a > 0 for a in alpha)
            term = 2**k * factorial(2*m-k) // 2**(m-u)
            assert valuation(term) == m+u-(2*m-k).bit_count()
            assert valuation(term) >= exponent(m)
    for m in range(1, 513):
        assert exponent(m) == exponent_by_maximum(m)
    for r in range(3, 13):
        m = 2**r+1
        assert exponent(m) == m+1-r
        target_c = m-(m+1).bit_length()+1
        assert exponent(m) == target_c+1
    print("Factorial valuations, exponent reformulation, and binary subfamily: exact.")


def check_coefficients_and_lifts():
    rng = Random(210611)
    cases = 0
    for m in range(1, 8):
        for _ in range(5):
            V = [[rng.choice((-1, 1)) for j in range(2*m)]
                 for i in range(m)]
            c = coefficient(V)
            assert c % 2**exponent(m) == 0
            if m <= 4:
                D = [row[:] for row in V for repeat in range(2)]
                assert permanent(D) == 2**m*c
                A = [row+[sign] for row in V for sign in (1, -1)]
                epsilon = rng.choice((-1, 1))
                A.append([rng.choice((-1, 1)) for j in range(2*m)]
                         + [epsilon])
                assert permanent(A) == epsilon*2**m*c
            cases += 1
    # The first excluded paired size tests the new valuation, not C36 itself.
    m = 9
    for _ in range(2):
        V = [[rng.choice((-1, 1)) for j in range(2*m)]
             for i in range(m)]
        assert coefficient(V) % 2**exponent(m) == 0
        cases += 1
    print(f"Coefficient divisibility and independent lift evaluations: {cases} exact inputs.")


def check_arbitrary_borders():
    for n in range(1, 11):
        for q in range(n+1):
            if (n-q) % 2:
                continue
            p = (n-q)//2
            target = (2,)*p+(1,)*q
            for alpha in product(*(range(a+1) for a in target)):
                k = sum(alpha)
                u = sum(alpha[i] > 0 for i in range(p))
                value = 2**(k+u)*factorial(n-k)
                assert valuation(value) >= mixed_exponent(n, q)
    for ncore in range(2, 129, 2):
        assert mixed_exponent(ncore, 0) == ncore//2+exponent(ncore//2)
        for h in range(ncore//2+1):
            assert h+mixed_exponent(ncore, 2*h) >= mixed_exponent(ncore, 0)
    for d in range(6):
        threshold = d+1+(2*d+1).bit_length()-1
        for r in range(threshold, threshold+3):
            ncore = 2**(r+1)+2*d
            n = ncore+d
            for h in range(d+1):
                assert mixed_exponent(ncore, 2*h) == ncore+d-h-r
            assert (n+1).bit_length()-1 == r+1
    rng = Random(210612)
    cases = 0
    for ncore in (2, 4, 6):
        for d in (0, 1, 2):
            for _ in range(3):
                V = [[rng.choice((-1, 1)) for j in range(ncore)]
                     for i in range(ncore//2)]
                A = [row+[rng.choice((-1, 1)) for j in range(d)]
                     for row in V for repeat in range(2)]
                A += [[rng.choice((-1, 1)) for j in range(ncore+d)]
                      for i in range(d)]
                bound = min(h+mixed_exponent(ncore, 2*h)
                            for h in range(min(d, ncore//2)+1))
                assert permanent(A) % 2**bound == 0
                cases += 1
    print(f"Mixed multiplicities and arbitrary-border factors: {cases} exact inputs.")


if __name__ == "__main__":
    check_bookkeeping()
    check_coefficients_and_lifts()
    check_arbitrary_borders()
