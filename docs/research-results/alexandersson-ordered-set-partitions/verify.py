#!/usr/bin/env python3
"""Exact consistency checks for ordered-partition research; NOT a proof.

Only Python standard library; all coefficients are integers.
"""
from math import comb


def add(a, b, factor=1):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a):
        c[i] += x
    for i, x in enumerate(b):
        c[i] += factor * x
    return c


def scale(a, factor):
    return [factor * x for x in a]


def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i+j] += x*y
    return c


def direct(j, top):
    rows = [[1]]
    for n in range(1, top+1):
        row = [0] * (n//j + 1)
        for s in range(1, n+1):
            for k, a in enumerate(rows[n-s]):
                row[k+(s>=j)] += comb(n,s)*a
        rows.append(row)
    return rows


def check_riccati(j, rows):
    h = []
    for n in range(len(rows)-1):
        hn = [0]
        for k in range(n+1):
            hn = add(hn, scale(mul(rows[k], rows[n-k]), comb(n,k)))
        h.append(hn)
    for n in range(len(rows)-1):
        rhs = add(scale(h[n],2),rows[n],factor=-1)
        if n>=j-1:
            shifted = add(scale(h[n-j+1],-1),[0]+h[n-j+1])
            rhs = add(rhs,scale(shifted,comb(n,j-1)))
        while len(rhs)>1 and rhs[-1]==0:
            rhs.pop()
        assert rhs == rows[n+1], (j,n,rhs,rows[n+1])


def check_newton(j, rows):
    # If a positive-coefficient polynomial of degree d has only real
    # (necessarily negative) roots, a_k/binom(d,k) is log-concave.
    for n, row in enumerate(rows):
        d = len(row)-1
        for k in range(1,d):
            assert (row[k]**2 * k*(d-k)
                    >= row[k-1]*row[k+1] * (k+1)*(d-k+1)), (j,n,k)


def main():
    for j in range(2,19):
        rows = direct(j,140)
        check_newton(j,rows)
        if j<=10:
            check_riccati(j,rows[:46])
        if j==3:
            assert rows[:6] == [[1],[1],[3],[12,1],[66,9],[450,91]]
        print("PASS",j, flush=True)
    print("Exact diagnostics passed; conjecture remains open")


if __name__ == "__main__":
    main()
