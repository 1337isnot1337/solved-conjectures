"""Exact checks for the all-core matching monotonicity argument.

This is a consistency checker for the proof, not verification of Hwang's
conjecture in a finite range.
"""
from fractions import Fraction as Q
from functools import lru_cache
from itertools import product

import sympy as sp


def scalar_certificate():
    b, x, y, r, s, p = sp.symbols("b x y r s p")
    z = (1 - b) / b**2
    a = b**2 / (b**2 - b + 1)
    c = (2 - b) / (1 - b)
    N = s * (1 - s + p) - z * p * (s - 2*p) - c * (2*b-s) * (1-s+p)
    left = x/(1-x)*(1-x-z*x*y) + y/(1-y)*(1-y-z*x*y)
    assert sp.cancel((left-c*(2*b-x-y))*(1-x)*(1-y)
                     -N.subs({s:x+y,p:x*y})) == 0
    diag = 2*(r-b)**2*(r-1)*((1-b)**2*r+b*(2-b))/(b**2*(1-b))
    assert sp.cancel(N.subs({s:2*r,p:r*r})-diag) == 0
    assert sp.cancel(N.subs({s:1+y,p:y})-z*y*(y-1)) == 0
    poly = ((b**3-5*b*b+7*b-4)*y*y
            +(-2*b**4+7*b**3-5*b*b-b+3)*y
            +2*b**4-8*b**3+9*b*b-4*b)
    assert sp.cancel(N.subs({s:a+y,p:a*y})
                     -poly/(b*b-b+1)**2) == 0
    T = 4*b**4-20*b**3+37*b*b-34*b+9
    assert sp.factor(sp.discriminant(poly,y)-(b-1)**4*T) == 0
    assert sp.cancel(sp.diff(N,p,2)-4*z) == 0
    assert T.subs(b,Q(1,2)) == -1
    assert sp.diff(T,b).subs(b,1) == -4
    assert sp.diff(T,b,2).subs(b,1) == 2
    print("Scalar identity, convexity, three endpoint formulas, and discriminant: exact.")


def graph_partition(weights):
    n = len(weights)
    adjacency = {
        i: [(n+j,weights[i][j]) for j in range(n) if weights[i][j]]
        for i in range(n)
    }
    adjacency.update({
        n+j: [(i,weights[i][j]) for i in range(n) if weights[i][j]]
        for j in range(n)
    })

    @lru_cache(None)
    def Z(mask):
        if not mask:
            return Q(1)
        v = (mask & -mask).bit_length()-1
        rest = mask ^ (1 << v)
        total = Z(rest)
        for w, weight in adjacency[v]:
            if rest & (1 << w):
                total += weight * Z(rest ^ (1 << w))
        return total

    return adjacency, Z


def weighted_path_check(A,z):
    n = len(A)
    W = [[z*a for a in row] for row in A]
    adj,Z = graph_partition(W)
    full = (1 << (2*n))-1
    partition = Z(full)
    x = [Z(full ^ (1 << i))/partition for i in range(n)]
    y = [Z(full ^ (1 << (n+j)))/partition for j in range(n)]
    for i,j in product(range(n),repeat=2):
        target = n+j

        def paths(v,used,weight):
            if v == target:
                return weight * Z(full ^ used)**2
            return sum((paths(w,used | (1 << w),weight*a)
                        for w,a in adj[v] if not used & (1 << w)),Q(0))

        path_sum = paths(i,1 << i,Q(1))
        difference = (partition*Z(full ^ (1 << i) ^ (1 << target))
                      -Z(full ^ (1 << i))*Z(full ^ (1 << target)))
        assert difference == path_sum
        if A[i][j]:
            assert difference > 0

    a = 1/(1+z)
    assert all(a <= u < 1 for u in x+y)
    assert sum(x) == sum(y)
    for i in range(n):
        assert x[i] + z*x[i]*sum(A[i][j]*y[j] for j in range(n)) < 1
    for j in range(n):
        assert y[j] + z*y[j]*sum(A[i][j]*x[i] for i in range(n)) < 1
    return sum(x)/n


def exact_matching_checks():
    cores = [
        [[Q(int(i==j)) for j in range(2)] for i in range(2)],
        [[Q(1,3) for j in range(3)] for i in range(3)],
        [[Q(int(i==j)+int(j==(i+1)%4),2) for j in range(4)] for i in range(4)],
        [[Q(1,2),Q(1,3),Q(1,6)],
         [Q(1,4),Q(1,2),Q(1,4)],
         [Q(1,4),Q(1,6),Q(7,12)]],
    ]
    cases = 0
    for A in cores:
        n = len(A)
        assert all(sum(row) == 1 for row in A)
        assert all(sum(A[i][j] for i in range(n)) == 1 for j in range(n))
        for t in [Q(1,10),Q(1,3),Q(1,2)]:
            z = t/(1-t)**2
            u = weighted_path_check(A,z)
            assert u < 1-t
            cases += 1
    print(f"Weighted path identities, strict vertex bounds, and occupancy: {cases} exact cores/activities.")


def vertexwise_obstruction():
    n = 5
    A = [[Q(0) for _ in range(n)] for _ in range(n)]
    for i in range(1,n):
        A[0][i] = A[i][0] = Q(1,4)
        A[i][i] = Q(3,4)
    _,Z = graph_partition([[2*a for a in row] for row in A])
    full = (1 << (2*n))-1
    assert Z(full) == Q(2175,16)
    assert Z(full ^ 1) == Q(1125,16)
    assert Z(full ^ 1)/Z(full) == Q(15,29) > Q(1,2)
    assert Z(full ^ 2)/Z(full) == Q(59,145)
    assert sum(Z(full ^ (1 << i))/Z(full) for i in range(n))/n == Q(311,725) < Q(1,2)
    print("Vertexwise monomer comparison fails exactly; average comparison holds.")


if __name__ == "__main__":
    scalar_certificate()
    exact_matching_checks()
    vertexwise_obstruction()

