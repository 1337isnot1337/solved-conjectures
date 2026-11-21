"""Independent Macdonald identification from the defining Hall inner product.

Standard library only. Does not import the branching or eigenoperator code.
Work in the full degree-six symmetric-function space, then specialize to three
variables. Thus all partitions of six, including lengths four to six, enter
the inner-product calculation before specialization.
"""

from collections import Counter
from fractions import Fraction as Q
from math import factorial


def partitions(d, cap=None):
    if d == 0:
        return [()]
    cap = d if cap is None else cap
    return [(a,)+b for a in range(min(d, cap), 0, -1)
            for b in partitions(d-a, a)]


def invert(A):
    n = len(A)
    R = [[Q(a) for a in row]+[Q(i == j) for j in range(n)]
         for i, row in enumerate(A)]
    for i in range(n):
        pivot = next(j for j in range(i, n) if R[j][i])
        R[i], R[pivot] = R[pivot], R[i]
        c = R[i][i]
        R[i] = [a/c for a in R[i]]
        for j in range(n):
            if j == i:
                continue
            c = R[j][i]
            R[j] = [a-c*b for a, b in zip(R[j], R[i])]
    assert all(R[i][j] == (i == j) for i in range(n) for j in range(n))
    return [row[n:] for row in R]


pp = sorted(partitions(6))
assert len(pp) == 11


def power_product(lam):
    """The monomial-symmetric coefficients of p_lam in six variables."""
    ans = {(0,)*6: 1}
    for a in lam:
        nxt = {}
        for p, c in ans.items():
            for i in range(6):
                r = list(p)
                r[i] += a
                r = tuple(r)
                nxt[r] = nxt.get(r, 0)+c
        ans = nxt
    return [ans.get(p+(0,)*(6-len(p)), 0) for p in pp]


q, t = Q(1, 10), Q(9, 10)
C = [power_product(p) for p in pp]
Cinv = invert(C)
diagonal = []
for p in pp:
    v = Q(1)
    for a, m in Counter(p).items():
        v *= a**m*factorial(m)
    for a in p:
        v *= (1-q**a)/(1-t**a)
    diagonal.append(v)
assert all(v > 0 for v in diagonal)

# p=C*m, so the monomial-basis Gram matrix is C^{-1}diag(w)C^{-T}.
G = [[sum((Cinv[i][k]*diagonal[k]*Cinv[j][k]
           for k in range(11)), Q(0)) for j in range(11)] for i in range(11)]


def inner(a, b):
    return sum((a[i]*G[i][j]*b[j] for i in range(11) for j in range(11)), Q(0))


basis = []
for i, p in enumerate(pp):
    v = [Q(i == j) for j in range(11)]
    for r in basis:
        norm = inner(r, r)
        assert norm > 0
        c = inner(v, r)/norm
        v = [a-c*b for a, b in zip(v, r)]
    assert v[i] == 1
    assert all(v[j] == 0 for j in range(i+1, 11))
    assert all(inner(v, r) == 0 for r in basis)
    basis.append(v)

expected = {
    (4, 2): {(4, 2): Q(1), (4, 1, 1): Q(11, 91), (3, 3): Q(11, 91),
             (3, 2, 1): Q(1143098, 9092629),
             (2, 2, 2): Q(27053496033, 90189787051)},
    (4, 1, 1): {(4, 1, 1): Q(1), (3, 2, 1): Q(111, 991),
                (2, 2, 2): Q(1221, 90181)},
}
for lam, coefficients in expected.items():
    v = basis[pp.index(lam)]
    actual = {p: v[i] for i, p in enumerate(pp) if len(p) <= 3 and v[i]}
    assert actual == coefficients

print('PASS: both three-variable polynomials independently derived from the full Hall inner product.')
