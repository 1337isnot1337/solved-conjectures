#!/usr/bin/env python3
"""Exact HKM witness: no dependencies beyond the Python standard library."""
from fractions import Fraction
from functools import cache
from math import comb

N, M, D = 12, 6, 11

def binom(n, k):
    return comb(n, k) if 0 <= k <= n else 0

def comp(p, k):
    return int(k == 0) if p == 0 else binom(p - 1, k - 1)

@cache
def signed_vectors(n, p, q):
    return sum(comb(n, i) * comb(n - i, j) * comp(p, i) * comp(q, j)
               for i in range(min(n, p) + 1)
               for j in range(min(n - i, q) + 1))

def lattice_count(t):
    all_vectors = sum(signed_vectors(N, s, s) for s in range(t + 1))
    excluded_one = 2 * sum(signed_vectors(N - 2, s - p, s - q)
                           for s in range(t + 1)
                           for p in range(1, s + 1)
                           for q in range(1, s + 1)
                           if p + q > t)
    return all_vectors - M * excluded_one

E = [lattice_count(t) for t in range(D + 1)]
H = [sum((-1)**j * comb(D + 1, j) * E[i - j] for j in range(i + 1))
     for i in range(D + 1)]
assert H == [comb(D, i)**2 - 2*M*binom(D - 2, i - 1)
             for i in range(D + 1)]
assert H == [1,109,2917,26793,107892,211932,211932,107892,26793,2917,109,1]

def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out

shifted = [0]*(D + 1)
for i, h in enumerate(H):
    p = [1]
    for j in range(1, D + 1):
        p = mul(p, [2*j - 2*i - 1, 1])
    shifted = [a + h*b for a, b in zip(shifted,p)]

assert all(shifted[i] == 0 for i in range(0,D+1,2))
assert all(c % 8 == 0 for c in shifted)
R = [(-1)**((D-j)//2) * (shifted[j]//8) for j in range(1,D+1,2)]
assert R == [-3575490705,4596049711,-1819237530,219501678,-8333765,87411]

def remainder(p, q):
    p = [Fraction(c) for c in p]
    while p and len(p) >= len(q):
        v = p[-1]/q[-1]
        k = len(p)-len(q)
        for i, c in enumerate(q):
            p[k+i] -= v*c
        while p and p[-1] == 0:
            p.pop()
    return p

chain = [list(map(Fraction,R)),
         [Fraction((i+1)*c) for i,c in enumerate(R[1:])]]
while p := remainder(chain[-2],chain[-1]):
    chain.append([-c for c in p])
assert [len(p)-1 for p in chain] == [5,4,3,2,1,0]
def sign(x):
    return (x>0)-(x<0)
plus = [sign(p[-1]) for p in chain]
minus = [s*(-1)**(len(p)-1) for s,p in zip(plus,chain)]
assert plus == [1,1,1,1,1,-1]
assert minus == [-1,1,-1,1,-1,-1]
def variations(signs):
    return sum(a != b for a,b in zip(signs,signs[1:]))
assert variations(minus)-variations(plus)==3
print("E(0..11):",E)
print("h*:", H)
print("R:", R)
print("Sturm signs at -infinity, +infinity:", minus, plus)
print("R has exactly three real roots.")
