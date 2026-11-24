#!/usr/bin/env python3
"""Exact checks for the displayed Gram source attempt, not a trade proof."""

from itertools import combinations
from math import comb
import sympy as sp


def gram_identity(n):
    xs = sp.symbols(f'x0:{n*n}')
    x = sp.Matrix(n, n, xs)
    numeric = x.subs({xs[a*n+h]: (2 if a==h else 0)+1+a+h for a in range(n) for h in range(n)})
    inv_numeric = numeric.inv()
    for i in range(n):
        for j in range(n):
            f = sum(x[i, t]*x[j, t] for t in range(n))
            bracket = sp.Matrix(n, n, lambda a,h: sp.diff(f, x[a,h]))
            target = sp.zeros(n)
            target[i,j] += 1
            target[j,i] += 1
            assert bracket == target*x
            substitution = {xs[a*n+h]: numeric[a,h] for a in range(n) for h in range(n)}
            assert bracket.subs(substitution)*inv_numeric == target
    return n*n


def copied_tag_residual():
    # Family 1 uses the coordinate C map; family 2 uses H tensor H.
    gamma1 = sp.eye(4)
    gamma2 = sp.Matrix([[1,1,1,1], [1,-1,1,-1],
                        [1,1,-1,-1], [1,-1,-1,1]])/2
    c00 = sp.eye(4)[:,0]
    f = []
    g = []
    for h in range(2):
        sector = sp.diag(*[int(j//2 == h) for j in range(4)])
        f.append(gamma1*sector*gamma1.inv()*c00)
        g.append(gamma2*sector*gamma2.inv()*c00)
    # At X=I and f_00=1, the leading coefficient of partial_00
    # in output A_0 B_0 C_10 D_00 is exactly -1/2.
    assert (f[0]-g[0])[2] == -sp.Rational(1,2)
    assert (f[0]-g[0])[0] == sp.Rational(1,2)
    # The C sectors from both maps have zero common intersection.
    constraints = sp.Matrix.vstack(
        *(sp.eye(4)-gamma*sp.diag(*[int(j//2 == h) for j in range(4)])
          *gamma.inv() for gamma in (gamma1,gamma2) for h in range(2)))
    assert constraints.rank() == 4


def modular_rank(matrix, prime):
    a = [[int(v) % prime for v in row] for row in matrix]
    nr, nc = len(a), len(a[0])
    rank = 0
    for col in range(nc):
        pivot = next((j for j in range(rank,nr) if a[j][col]), None)
        if pivot is None:
            continue
        a[rank],a[pivot] = a[pivot],a[rank]
        inv = pow(a[rank][col], -1, prime)
        a[rank] = [(v*inv) % prime for v in a[rank]]
        for row in range(rank+1,nr):
            factor = a[row][col]
            if factor:
                a[row] = [(v-factor*w) % prime for v,w in zip(a[row],a[rank])]
        rank += 1
        if rank == nr:
            break
    return rank


def exterior_rank_one(s, k):
    labels = list(combinations(range(s), k))
    at = {v:i for i,v in enumerate(labels)}
    # A nonzero rank-one matrix with every entry nonzero. Its induced
    # exterior action is computed entrywise, independently of the rank formula.
    xi = list(range(1, s+1))
    yy = list(range(s+1, 2*s+1))
    z = sum(a*b for a,b in zip(xi,yy))
    p = len(labels)
    g = sp.zeros(p)
    for col, word in enumerate(labels):
        for pos,b in enumerate(word):
            remaining = list(word[:pos]+word[pos+1:])
            for a in range(s):
                if a in remaining:
                    continue
                out = sorted(remaining+[a])
                sign = (-1)**(pos+out.index(a))
                g[at[tuple(out)],col] += sign*xi[a]*yy[b]
    assert g*g == z*g
    m1, m0 = comb(s-1,k-1), comb(s-1,k)
    assert g.trace() == z*m1
    # vec(GE-EG) in column-major vectorization.
    ad = sp.kronecker_product(sp.eye(p),g)-sp.kronecker_product(g.T,sp.eye(p))
    assert modular_rank(ad.tolist(), 1009) == 2*m0*m1
    return {'s':s,'k':k,'p':p,'principal_rank':2*m0*m1,
            'same_size_threshold':3*p}


if __name__ == '__main__':
    checks = sum(gram_identity(n) for n in (2,3))
    copied_tag_residual()
    ranks = [exterior_rank_one(s,k) for s,k in ((3,1),(4,2),(5,2))]
    print({'gram_entries':checks,'off_copied_tag_derivative': '-1/2',
           'casimir_rank_checks':ranks,'status':'passed',
           'scope':'No source conversion is established.'})
