#!/usr/bin/env python3
"""Symbolic residue-filter and cofactor checks, not a tensor-resultant calculator."""
from collections import defaultdict

def rank_mod3(a):
    n=len(a);r=0
    for j in range(n):
        p=next((i for i in range(r,n) if a[i][j]%3),None)
        if p is None: continue
        a[r],a[p]=a[p],a[r]
        inv=1 if a[r][j]%3==1 else 2
        a[r]=[(inv*x)%3 for x in a[r]]
        for i in range(n):
            if i!=r and a[i][j]%3:
                c=a[i][j]%3
                a[i]=[(x-c*y)%3 for x,y in zip(a[i],a[r])]
        r+=1
    return r

def kernel_dim(m):
    n=m*m;a=[[0]*n for _ in range(n)]
    for i in range(m):
        for j in range(m):
            for x,y in ((i,j),((i-1)%m,j),(i,(j-1)%m)):
                a[i*m+j][x*m+y]+=1
    return n-rank_mod3(a)

def multiply(a,b):
    out=defaultdict(int)
    for exp,c in a.items():
        for ex2,d in b.items():
            out[tuple(x+y for x,y in zip(exp,ex2))]+=c*d
    return {e:c for e,c in out.items() if c}

def project(poly):
    return {e:c for e,c in poly.items() if e[0]%3==1 and c}

if __name__=="__main__":
    m=4;s=m*m
    assert kernel_dim(m)==1
    zero=(0,)*s
    unit=(1,)+(0,)*(s-1)
    cube=(3,)+(0,)*(s-1)
    ones=(1,)*s;twos=(2,)*s
    toy={zero:1,cube:3,ones:7,twos:11}
    cofactor={zero:1,unit:1}
    assert min(map(sum,project(toy)))==s
    prod=project(multiply(toy,cofactor))
    assert min(map(sum,prod))==1
    assert prod[unit]==1
    print("kernel dim",kernel_dim(m))
    print("initial bare degree",s,"initial cofactor degree",1)
    print("finite checks passed")
