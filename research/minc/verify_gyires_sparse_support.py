#!/usr/bin/env python3
"""Exact checks for two-sparse Gyires theorem, not the general proof."""
from fractions import Fraction as F
from math import comb, factorial


def permanent(M):
    n = len(M)
    d = [F(0)] * (1 << n)
    d[0] = F(1)
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        d[mask] = sum((M[i][j] * d[mask ^ (1 << j)]
                      for j in range(n) if mask & (1 << j)), F(0))
    return d[-1]


def transpose(M):
    return [list(r) for r in zip(*M)]


def mul(A, B):
    n = len(A)
    return [[sum((A[i][k] * B[k][j] for k in range(n)), F(0))
             for j in range(n)] for i in range(n)]


def cyc(n, p):
    q = 1 - p
    return [[(p if i == j else F(0)) +
             (q if j == (i + 1) % n else F(0))
             for j in range(n)] for i in range(n)]


def beta(n):
    return F(factorial(n), n**n)


def cyc_gram(n, p):
    q = 1-p
    a, b = p*p+q*q, p*q
    if n == 1:
        return F(1)
    if n == 2:
        return a*a+4*b*b
    total = F(0)
    for j in range(n//2+1):
        total += F(n * comb(n-j, j), n-j) * a**(n-2*j) * b**(2*j)
    return total + 2*b**n


def S(n):
    a, b = 2, 2
    for _ in range(n):
        a, b = b, 2*b+a
    return a


def block_diag(blocks):
    n = sum(len(B) for B in blocks)
    M = [[F(0) for _ in range(n)] for _ in range(n)]
    offset = 0
    for B in blocks:
        for i in range(len(B)):
            for j in range(len(B)):
                M[offset+i][offset+j] = B[i][j]
        offset += len(B)
    return M


def check_gram_gyires(M):
    n = len(M)
    MT = transpose(M)
    p = permanent(M)
    x = permanent(mul(M, MT))
    y = permanent(mul(MT, M))
    z = permanent(mul(M, M))
    assert beta(n)*x <= p*p
    assert beta(n)*y <= p*p
    assert beta(n)*(x+y+2*z) <= 4*p*p


def main():
    checks = 0
    ps = [F(0), F(1,7), F(1,4), F(1,3), F(1,2),
          F(2,3), F(3,4), F(6,7), F(1)]
    for n in range(1, 10):
        for p in ps:
            M = cyc(n, p)
            assert permanent(M) == p**n + (1-p)**n
            assert permanent(mul(M, transpose(M))) == cyc_gram(n,p)
            check_gram_gyires(M)
            checks += 1
    for n in range(3, 201):
        if n <= 6:
            assert beta(n)*(S(n)+2) < 4
        if n >= 6:
            assert beta(n+1)*(S(n+1)+2) < beta(n)*(S(n)+2)
        checks += 1
    blocks = [cyc(2,F(1,3)), cyc(3,F(2,5)),
              cyc(4,F(1,2)), cyc(1,F(1))]
    for indices in [(0,1),(0,2),(1,3),(0,1,3),(1,2,3),(0,1,2)]:
        M = block_diag([blocks[i] for i in indices])
        check_gram_gyires(M)
        checks += 1
        n = len(M)
        if n % 3:
            reverse = list(reversed(range(n)))
            P = [[M[reverse[i]][(3*j+1) % n] for j in range(n)]
                 for i in range(n)]
            check_gram_gyires(P)
            checks += 1
    print("Passed", checks, "exact checks for cyclic formulas, Gram bounds,",
          "mixed-weight blocks, and scalar recurrence")


if __name__ == "__main__":
    main()
