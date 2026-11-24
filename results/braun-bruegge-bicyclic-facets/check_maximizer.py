#!/usr/bin/env python3
"""Exact finite certificates for Braun–Bruegge's Journal Conjecture 33."""
from math import comb

FIRST, STOP = 11, 144
binomial = [[comb(n,j) for j in range(n+1)] for n in range(STOP)]

def common_parity_count(*dims):
    m = min(dims)
    assert all((d-m)%2 == 0 for d in dims)
    return sum(
        binomial[dims[0]][(dims[0]+r)//2] *
        binomial[dims[1]][(dims[1]+r)//2] *
        binomial[dims[2]][(dims[2]+r)//2]
        for r in range(-m,m+1,2)
    )

def theta_count(x,y,z):
    dims = [x,y,z]
    if x%2 == y%2 == z%2:
        return common_parity_count(x,y,z)
    exceptional_parity = (x+y+z)%2
    a,b = [d for d in dims if d%2 != exceptional_parity]
    c,  = [d for d in dims if d%2 == exceptional_parity]
    return a*b*common_parity_count(a-1,b-1,c) + c*common_parity_count(a,b,c-1)

def proposed(total):
    c=1 if total%2 else 2
    a=(total-c)//2
    if a%2==c%2:
        a -= 1
    b=total-c-a
    return tuple(sorted((a,b,c)))

count=0
ties=[]
for total in range(FIRST,STOP):
    want=proposed(total)
    bound=theta_count(*want)
    for x in range(1,total//3+1):
        for y in range(x,(total-x)//2+1):
            z=total-x-y
            test=(x,y,z)
            actual=theta_count(*test)
            assert actual<=bound,(total,test,actual,want,bound)
            if actual==bound and test!=want:
                ties.append((total,test))
            count+=1
assert count == 82037
assert not ties, ties
print(count, "unordered triples checked; no extra ties")
