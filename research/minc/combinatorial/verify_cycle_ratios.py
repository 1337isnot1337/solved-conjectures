"""Check the weighted-cycle coefficient identity and extremal ratios by matching counts."""
from fractions import Fraction as F
from itertools import product
from math import comb


def components(n,least=1):
    if n==0:
        yield ()
    for first in range(least,n+1):
        for rest in components(n-first,first):
            yield (first,)+rest


def weights(partition,params):
    n = sum(partition)
    B = [[F(0) for _ in range(n)] for _ in range(n)]
    pos = 0
    for s,a in zip(partition,params):
        for i in range(s):
            B[pos+i][pos+i] += a
            B[pos+i][pos+(i+1)%s] += 1-a
        pos += s
    return B


def match(B):
    totals = {0:F(1)}
    for row in B:
        nxt = totals.copy()
        for mask,c in totals.items():
            for j,x in enumerate(row):
                bit = 1 << j
                if x and not mask & bit:
                    key = mask | bit
                    nxt[key] = nxt.get(key,0)+c*x
        totals = nxt
    return [sum(x for mask,x in totals.items() if mask.bit_count()==k) for k in range(len(B)+1)]


def coefficient(n,k,j):
    if j==0:
        return F(2*n*comb(2*n-k,k),2**k*(2*n-k))
    return F(n*comb(n-k+j-1,j-1)*comb(2*n-k-1,k-2*j),j*2**k)


if __name__ == '__main__':
    t = 0
    for n in range(2,9):
        base = match(weights((n,),(F(1,2),)))
        for a in (F(1,2),F(2,3),F(5,8),F(1)):
            c = match(weights((n,),(a,)))
            for k in range(n+1):
                assert c[k]==sum(coefficient(n,k,j)*(2*a-1)**(2*j) for j in range(k//2+1))
        for parts in components(n):
            # Singleton choices give the same matrix.
            choices = [(F(1),) if m==1 else (F(1,2),F(1,3),F(3,4)) for m in parts]
            for params in product(*choices):
                c = match(weights(parts,params))
                for k in range(n):
                    r = n-k
                    assert (k+1)*c[k+1]/c[k] >= F(r*(2*r-1),n+r-1)
                    assert c[k+1]*base[k] >= c[k]*base[k+1]
                assert (c[-1]*base[-2]==c[-2]*base[-1]) == (parts==(n,) and params==(F(1,2),))
                t += 1
    print(f'{t} weighted cycle unions matched directly; all successive ratios and final equality checked')
