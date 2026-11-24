#!/usr/bin/env python3
"""Exact checks for the matching gadget and binary long division."""

from functools import lru_cache
from random import Random


def gadget(p, u):
    t = p-1
    q, residue = divmod(t, (1 << u)-1)
    weight = (1 << (u-1))-1
    returns = set()
    if residue > weight:
        returns.add(u)
        residue -= weight
    for j in range(1,u):
        if residue >> (j-1) & 1:
            returns.add(j)
    for j in range(q.bit_length()):
        if q >> j & 1:
            returns.add(u+1+j)
    return max(u, u+q.bit_length()), returns


def enumerate_matchings(r, u, returns):
    n=r+1
    adj=[0]*(2*n)
    edges=set()
    for i in range(n):
        for j in range(i+1,n):
            edges.add((i,j))
    for i in range(n):
        for j in range(n):
            if (i <= j and (i,j)!=(1,u)) or (j==0 and i in returns):
                edges.add((i,n+j))
    for i,j in edges:
        adj[i] |= 1 << j
        adj[j] |= 1 << i
    @lru_cache(None)
    def rec(mask):
        if mask == 0:
            return 1
        x=mask & -mask
        rest=mask^x
        choices=rest & adj[x.bit_length()-1]
        val=0
        while choices:
            y=choices & -choices
            choices ^= y
            val += rec(rest^y)
        return val
    assert len(edges)-n*n == len(returns)-1
    return rec((1<<(2*n))-1)


def count_zero_blocks(t,u):
    return sum(len(block)//u for block in bin(t)[2:].split('1'))


def main():
    for p in range(2,160):
        for u in range(2,6):
            r,returns=gadget(p,u)
            assert enumerate_matchings(r,u,returns)==p
    rng=Random(20261124)
    vals=list(range(1,3000))
    vals += [rng.getrandbits(n) or 1 for n in range(3,1200)]
    for t in vals:
        k=t.bit_count()
        u=k+1
        q=t//((1<<u)-1)
        assert q.bit_count() >= count_zero_blocks(t,u)
        assert (k+1)*(q.bit_count()+k) >= t.bit_length()-k
    print(f'632 literal graph matching counts and {len(vals)} long-division checks passed.')


if __name__=='__main__':
    main()
