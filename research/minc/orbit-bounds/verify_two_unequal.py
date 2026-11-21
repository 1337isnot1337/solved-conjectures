"""Exact checks of the two-eigenvalue formula and centered second/third coefficients."""
from itertools import combinations, permutations
from math import comb, factorial, prod
from random import Random

import sympy as sp


def permanent(rows):
    n = len(rows)
    return sp.expand(sum(prod(rows[i][j] for i, j in enumerate(p)) for p in permutations(range(n))))


def main():
    rng = Random(113)
    b, z = sp.symbols('b z')
    for n in range(3, 14):
        m, d = n - 1, 1 - b
        x = z / d
        y = (1 - d*x) / m
        D = b + d*x
        c2 = d**2*x*(1-x)/m
        value = (1-z)**(n-2)*(b+n*d*z-n*z**2)
        assert sp.factor(m**m*(D*y**m + m*c2*y**(m-1)) - value) == 0
        derivative = n**2*z**2 - n*(2+m*d)*z + n*d - (n-2)*b
        assert sp.factor(sp.diff(value, z) - (1-z)**(n-3)*derivative) == 0
    for n in range(3, 7):
        data = [rng.randint(-2, 2) + sp.I*rng.randint(-2, 2) for _ in range(n)]
        r = [v - sum(data)/n for v in data]
        mat = [[1+b*s*sp.conjugate(t) for t in r] for s in r]
        es = [sum(prod(c) for c in combinations(r, k)) for k in range(n+1)]
        exact = factorial(n)*sum(b**k*e*sp.conjugate(e)/comb(n,k) for k,e in enumerate(es))
        # Evaluation at n+1 points tests the identity as a polynomial.
        for j in range(n+1):
            test = [[sp.expand(a.subs(b,j)) for a in row] for row in mat]
            assert sp.expand(permanent(test) - exact.subs(b,j)) == 0
        raw = sp.Matrix(n,n,lambda i,j: rng.randint(-1,1)+sp.I*rng.randint(-1,1))
        P = sp.eye(n)-sp.ones(n)/n
        H = (P*(raw+raw.H)*P).applyfunc(sp.expand)
        for k in [2,3]:
            actual = sum(permanent([[H[i,j] for j in cols] for i in rows])
                         for rows in combinations(range(n), k)
                         for cols in combinations(range(n), k))
            assert sp.expand(actual - sp.Rational(factorial(k-1)**2,factorial(k))*sum(a**k for a in H)) == 0
    print('11 symbolic branch/derivative checks, 4 complex rank-two polynomials, 8 centered coefficient identities passed')


if __name__ == '__main__':
    main()
