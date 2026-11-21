#!/usr/bin/env python3
"""Exact rational diagnostics for Gyires's PSD-permutation-orbit theorem.

The universal proof is the companion Markdown document, not finite checks.
Uses only fractions.Fraction and the Python standard library.
"""
from fractions import Fraction as F
from itertools import permutations
from math import factorial
from random import Random

def mul(a, b):
    n = len(a)
    return [[sum(a[i][k]*b[k][j] for k in range(n)) for j in range(n)]
            for i in range(n)]

def tr(a):
    return [list(x) for x in zip(*a)]

def per(a):
    n = len(a)
    total = F(0)
    for mask in range(1, 1 << n):
        term = F((-1) ** (n-mask.bit_count()))
        for i in range(n):
            term *= sum(a[i][j] for j in range(n) if mask & (1 << j))
        total += term
    return total

def permutation_matrix(sigma):
    n = len(sigma)
    return [[F(int(j == sigma[i])) for j in range(n)] for i in range(n)]

def exact_counterexample():
    p = permutation_matrix((1,0,3,2))
    q = permutation_matrix((3,2,0,1))
    a = [[(p[i][j]+q[i][j])/2 for j in range(4)] for i in range(4)]
    assert per(a) == F(1,8)
    assert per(mul(a,tr(a))) == F(9,64)
    assert per(mul(tr(a),a)) == F(9,64)
    assert per(mul(a,a)) == F(9,64)
    assert F(4)*per(a)**2 / (F(9,16)) == F(1,9)
    assert F(3,32) < F(1,9) < F(1,8)

def check(n, rng):
    i = permutation_matrix(tuple(range(n)))
    p = permutation_matrix(rng.sample(range(n),n))
    q = permutation_matrix(rng.sample(range(n),n))
    # T doubly stochastic, S=T T^T PSD and doubly stochastic.
    t = [[(i[x][y]+p[x][y]+2*q[x][y])/4
          for y in range(n)] for x in range(n)]
    s = mul(t,tr(t))
    lp = permutation_matrix(rng.sample(range(n),n))
    rp = permutation_matrix(rng.sample(range(n),n))
    a = mul(mul(lp,s),rp)
    d = per(mul(s,s))
    z = per(s)
    beta = F(factorial(n),n**n)
    assert per(a) == z
    assert per(mul(a,tr(a))) == d == per(mul(tr(a),a))
    assert beta <= z and d <= z
    assert 0 <= per(mul(a,a)) <= d
    ratio = 4*z*z/(2*d+2*per(mul(a,a)))
    assert ratio >= z >= beta

def main():
    exact_counterexample()
    rng = Random(20261120)
    count = 0
    for n in range(1,8):
        for _ in range(25):
            check(n,rng)
            count += 1
    print("passed",count,"exact rational PSD-orbit diagnostics and stronger-bound obstruction")
    print("finite diagnostics do not establish a universal MINC conjecture")

if __name__ == "__main__":
    main()
