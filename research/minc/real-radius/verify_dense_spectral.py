"""Exact checks of the return-probability and determinant identities used in the dense bound."""
from itertools import combinations, permutations, product
from math import factorial, prod
from random import Random

import sympy as sp


def per(matrix):
    states = {0: sp.Integer(1)}
    for i in range(matrix.rows):
        nxt = {}
        for mask, value in states.items():
            for j in range(matrix.cols):
                if mask & (1 << j):
                    continue
                key = mask | (1 << j)
                nxt[key] = nxt.get(key, 0) + value*matrix[i,j]
        states = nxt
    return states[(1 << matrix.rows)-1]


def is_tree(pairs, h):
    seen = {0}
    for _ in range(h-1):
        for i,j in pairs:
            if i in seen or j in seen:
                seen.update((i,j))
    return len(seen) == h


def tree_checks():
    rng = Random(3202)
    checked = 0
    for h in range(1,6):
        edges = list(combinations(range(h),2))
        for _ in range(8):
            # Include disconnected weight graphs and zero leakage.
            w = {e: rng.randrange(4) if checked % 3 else 0 for e in edges}
            L = sp.zeros(h)
            for (i,j),v in w.items():
                L[i,i] += v
                L[j,j] += v
                L[i,j] -= v
                L[j,i] -= v
            trees = [T for T in combinations(edges,h-1) if is_tree(T,h)]
            value = sum(prod(1+w[e] for e in T) for T in trees)
            assert (L+h*sp.eye(h)).det() == h*h*value
            checked += 1
    return checked


def kernel_checks():
    r = [2,3,2]
    h = len(r)
    W = sp.Matrix([[0,2,1],[2,0,3],[1,3,0]])
    P = sp.eye(h)
    for i in range(h):
        for j in range(h):
            if j != i:
                a = W[i,j]/(10*r[i])
                P[i,j] += a
                P[i,i] -= a
    x = sp.symbols('x:3')
    site = [g for g,m in enumerate(r) for _ in range(m)]
    # The norm factors from C and the within-class constant modes cancel on
    # a repeated full row/column set. The resulting site covariance is P_gh/r_h.
    base = sp.Matrix(len(site),len(site),lambda i,j: P[site[i],site[j]]/r[site[j]])
    V = [sp.Rational(g+1,12)*(sp.eye(m)-sp.ones(m)/m) for g,m in enumerate(r)]
    sigma = []
    for m,M in zip(r,V):
        sigma.append([sum(per(M.extract(I,J)) for I in combinations(range(m),j) for J in combinations(range(m),j)) for j in range(m+1)])
    total = 0
    tested = 0
    for q in product(*(range(m+1) for m in r)):
        indices = [g for g,a in enumerate(q) for _ in range(a)]
        p = per(P.extract(indices,indices))/prod(factorial(a) for a in q)
        poly = sp.Poly(prod(sum(P[g,j]*x[j] for j in range(h))**a for g,a in enumerate(q)),*x)
        assert poly.coeff_monomial(q) == p
        total += p*prod(sigma[g][r[g]-a]*factorial(a)/sp.Integer(r[g])**a for g,a in enumerate(q))
        tested += 1
    assert per(base+sp.diag(*V)) == total
    return tested


def table_checks():
    # Different row and column margins; averaging the two permutation laws
    # yields a fractional table of prescribed means, including zero cells.
    row = [0,0,1,1,1,2,2]
    col = [0,0,0,1,1,2,2]
    counts = {}
    for p in permutations(range(len(row))):
        table = [0]*9
        for i,j in enumerate(p):
            table[3*row[i]+col[j]] += 1
        key = tuple(table)
        counts[key] = counts.get(key,0)+1
    numerator = prod(factorial(a) for a in (2,3,2,3,2,2))
    assert all(value*prod(factorial(a) for a in table) == numerator for table,value in counts.items())
    return len(counts)


if __name__ == '__main__':
    print(f'{tree_checks()} weighted tree identities, {kernel_checks()} occupation identities, one full Gaussian contraction, {table_checks()} contingency counts passed')
