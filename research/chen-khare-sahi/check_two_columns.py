#!/usr/bin/env python3
"""Exact finite checks for two-column Jack connection and dominance differences.

The independent monomial construction diagonalizes the Jack differential
operator in the elementary-product basis. For E_i=e_{d-i}e_i, subtracting
the common diagonal term and rescaling gives eigenvalue i*(alpha+d-i)
and lower coefficients -alpha*(d-2j), j<i. This follows by applying the
product rule to e_{d-i}e_i. The monomial coefficient of E_i at
(2^r,1^{d-2r}) is the number binom(d-2r,i-r) of ways to allocate single
sites between its two factors. All quantities below use exact rationals.
"""

from fractions import Fraction as F
from functools import cache
from math import comb, factorial, prod


def rise(x, k):
    return prod((x + r for r in range(k)), start=F(1))


def fall(x, k):
    return prod((x - r for r in range(k)), start=F(1))


@cache
def monomials(d, i, alpha):
    if alpha is None:
        return tuple(F(r == i) for r in range(i + 1))
    eigen = lambda j: j * (alpha + d - j)
    elementary = [F(0)] * i + [F(1)]
    tail = F(1)
    for j in range(i - 1, -1, -1):
        elementary[j] = -alpha * (d - 2 * j) * tail / (eigen(i) - eigen(j))
        tail += elementary[j]
    return tuple(sum(elementary[k] * comb(d - 2*r, k-r)
                     for k in range(r, i+1)) for r in range(i+1))


def coefficient(d, i, j, u, v):
    s, l = d - 2*i, i-j
    value = rise(s+1, 2*l) / (factorial(l) * rise(v+s+1, l))
    if u is not None:
        value *= rise(u-v, l) / rise(u+s+l, l)
    return value


@cache
def norm(n, d, i, alpha):
    a, s = d-i, d-2*i
    if alpha is None:
        return F(factorial(n), factorial(i) * factorial(s) * factorial(n-a))
    return fall(n, a) * fall(n + alpha, i) / (fall(alpha+a, i) * factorial(s) * factorial(i))


def check(ok, error):
    if not ok:
        raise ValueError(error)


def main():
    parameters = ((F(1,3),F(0)), (F(1),F(1,2)), (F(9,4),F(5,4)),
                  (F(7),F(2,3)), (F(2),F(0)), (F(1),F(1)),
                  (None,F(0)), (None,F(1,3)), (None,F(7)))
    coordinates = norms = rows = tails = strict = 0
    for d in range(15):
        for u,v in parameters:
            for i in range(d//2+1):
                target = monomials(d,i,v)
                for r in range(i+1):
                    reconstructed = sum(coefficient(d,i,j,u,v) * monomials(d,j,u)[r]
                                        for j in range(r,i+1))
                    check(reconstructed == target[r], (d,i,r,u,v,'coordinate'))
                    coordinates += 1
            for n in range(max(1,(d+1)//2),d+3):
                low = max(0,d-n)
                previous = None
                for i in range(low,d//2+1):
                    for alpha in (u,v):
                        direct = sum(monomials(d,i,alpha)[r] * norm(n,d,r,None)
                                     for r in range(low,i+1))
                        check(direct == norm(n,d,i,alpha), (n,d,i,alpha,'evaluation'))
                        norms += 1
                    row = [coefficient(d,i,j,u,v)*norm(n,d,j,u)/norm(n,d,i,v)
                           for j in range(low,i+1)]
                    check(sum(row)==1 and min(row)>=0, (n,d,i,u,v,'row'))
                    rows += 1
                    if previous is not None:
                        for r in range(len(row)):
                            check(sum(row[r:]) >= sum(previous[r:]), (n,d,i,r,u,v,'tail'))
                            tails += 1
                        if u is not None and 0<u-v<=1:
                            for a,b in zip(row,previous):
                                check(a < b, (n,d,i,u,v,'short step'))
                                strict += 1
                    previous = row
    print(f"{coordinates} monomial coordinates, {norms} hook evaluations, {rows} probability rows")
    print(f"{tails} ordered tails, {strict} strict short-step coefficient inequalities")


if __name__ == '__main__':
    main()
