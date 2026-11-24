#!/usr/bin/env python3
"""Exact path recurrence vs. run formulas; the all-d proof is in PROOF.md."""
from math import comb


def full_direct(T):
    # Starting point translated to the origin. F[a,b,k] counts paths
    # by an elementary recurrence on the last (positive-length) step.
    F=[[[0]*(2*T+1) for _ in range(T+1)] for _ in range(T+1)]
    F[0][0][0]=1
    seen_a=[[0]*(2*T+1) for _ in range(T+1)]
    for a in range(T+1):
        seen_b=[0]*(2*T+1)
        for b in range(T+1):
            if a or b:
                for k in range(1,a+b+1):
                    F[a][b][k]=seen_a[b][k-1]+seen_b[k-1]
            for k in range(a+b+1):
                seen_a[b][k]+=F[a][b][k]
                seen_b[k]+=F[a][b][k]
    return F


def binom(n,k):
    return comb(n,k) if 0<=k<=n else 0


def run_based(d):
    m=d-3
    if m==0:
        return [0,1,3]
    M=2*m+2
    R=[0]*(M+1)
    for j in range(m+1):
        R[2*j+2]=2*(binom(m-1,j)*binom(m+1,j)+comb(m,j)**2)
        if j<m:
            R[2*j+3]=(binom(m-1,j+1)*binom(m+1,j)
                   +binom(m-1,j)*binom(m+1,j+1)+2*comb(m,j)*comb(m,j+1))
    assert all(R[i]**2>=R[i-1]*R[i+1] for i in range(1,M))
    return [sum(R[r]*binom(M-r,k-r) for r in range(2,k+1)) for k in range(M+1)]


if __name__=='__main__':
    F=full_direct(61)
    for d in range(3,63):
        a,b=d-3,d-1
        from_paths=[F[a][b][k]+F[a+1][b-1][k] for k in range(a+b+1)]
        assert from_paths==run_based(d)
        assert all(from_paths[i]**2>=from_paths[i-1]*from_paths[i+1]
                   for i in range(1,len(from_paths)-1))
    print('Exact run and independent path recurrence checks passed for 3≤d≤62.')
