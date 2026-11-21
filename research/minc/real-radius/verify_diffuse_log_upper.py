"""Verify the finite determinant majorants and the covariance tilt identities."""
from fractions import Fraction as F
from math import factorial
from random import Random


def permanent(a):
    vals = {0: F(1)}
    for row in a:
        after = {}
        for mask, val in vals.items():
            for j, x in enumerate(row):
                if not mask >> j & 1:
                    dest = mask | (1 << j)
                    after[dest] = after.get(dest, 0) + val*x
        vals = after
    return vals[(1 << len(a))-1]


def det(a):
    b = [row[:] for row in a]
    sign = 1
    for i in range(len(b)):
        pivot = next((j for j in range(i, len(b)) if b[j][i]), None)
        if pivot is None:
            return 0
        if pivot != i:
            b[i], b[pivot] = b[pivot], b[i]
            sign *= -1
        for j in range(i+1, len(b)):
            ratio = b[j][i]/b[i][i]
            for t in range(i, len(b)):
                b[j][t] -= ratio*b[i][t]
    for i in range(len(b)):
        sign *= b[i][i]
    return sign


def main():
    rng = Random(3413)
    majorants = 0
    for n in range(2, 8):
        for _ in range(5):
            # A centered PSD contraction as an average of rank-one orthogonal projectors.
            b = [[F(0) for _ in range(n)] for _ in range(n)]
            for _ in range(4):
                x = [rng.randrange(-4,5) for _ in range(n-1)]
                x.append(-sum(x))
                norm = sum(z*z for z in x)
                if norm:
                    for i in range(n):
                        for j in range(n):
                            b[i][j] += F(x[i]*x[j], 4*norm)
            for s in (F(1,5), F(1,2), F(4,5)):
                p = permanent([[F(1,n)+s*v for v in row] for row in b])*F(n**n, factorial(n))
                d = det([[F(i == j)-s*v for j,v in enumerate(row)] for i,row in enumerate(b)])
                assert 1 <= p <= 1/d
                majorants += 1
    tilts = 0
    for q in range(1, 20):
        e = F(q, 20)
        r, s = e/(2*(1+e)), e/(2*(1-e))
        assert r-s == -e*e/(1-e*e)
        assert r+s == e/(1-e*e)
        assert 3*r*r-6*r*s+3*s*s == 3*(r-s)**2
        assert 4*r < 1
        tilts += 1
    print(f'{majorants} rational permanent/determinant bounds and {tilts} covariance tilts passed')


if __name__ == '__main__':
    main()
