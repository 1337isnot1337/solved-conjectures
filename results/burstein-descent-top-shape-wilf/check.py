#!/usr/bin/env python3
"""Independent literal fiber verifier for Burstein's two shape refinements."""
from itertools import combinations, product, permutations
import sys

def standardize(seq):
    rank = {x:i+1 for i,x in enumerate(sorted(seq))}
    return tuple(rank[x] for x in seq)

def occurs(board, p, pattern):
    n = len(p)
    cells = {(i,j) for i in range(n) for j in range(1,board[i]+1)}
    for I in combinations(range(n),len(pattern)):
        values = [p[i] for i in I]
        if standardize(values) != pattern:
            continue
        if all((i,j) in cells for i,j in product(I,values)):
            return True
    return False

def check(k):
    h,r,N=k+3,k+1,2*k+4
    caps=(N,)*h+tuple(range(N-1,h-1,-1))
    assert caps == tuple(sum(l>=j for l in caps) for j in range(1,N+1))
    sizes = []
    for sigma in permutations(range(1,k+1)):
        tail_pattern=tuple(3+s for s in sigma)
        a,b=0,0
        for tail in permutations(range(1,N+1),r):
            if any(v>u for v,u in zip(tail,caps[h:])):
                continue
            p=tuple(sorted(set(range(1,N+1))-set(tail)))+tail
            destop={p[i] for i in range(N-1) if caps[i]==caps[i+1] and p[i]>p[i+1]}
            ascbot={p[i] for i in range(N-1) if caps[i]!=caps[i+1] or p[i]<p[i+1]}|{p[-1]}
            assert destop==set() and ascbot==set(range(1,N+1))
            a+=not occurs(caps,p,(2,3,1)+tail_pattern)
            b+=not occurs(caps,p,(3,1,2)+tail_pattern)
        assert (a,b)==(h**r-1,h**r),(sigma,a,b)
        sizes.append((a,b))
    print('suffix length',k,'checks',len(sizes),'saw fiber counts',sizes[0])

if __name__=='__main__':
    for k in range(int(sys.argv[1])+1 if len(sys.argv)>1 else 3):
        check(k)
