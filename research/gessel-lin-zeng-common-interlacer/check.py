#!/usr/bin/env python3
"""Exact obstruction to a strengthened Jacobi-Stirling real-rootedness approach."""
from math import prod

def insert(p,L):
    q=[0]*(len(p)+1)
    for i,c in enumerate(p):
        q[i]+=(i+1)*c
        q[i+1]+=(L-i)*c
    if q[-1]==0: q.pop()
    return q

def fixed_deletions(k,S):
    p,L=[1],0
    for j in range(1,k+1):
        if j not in S:
            p=insert(p,L)
            L+=1
        p=insert(p,L)
        L+=2
    return p

def value(p,x,d):
    return sum(p[i]*prod(range(i-d+1,i+1))*x**(i-d)
               for i in range(d,len(p)))

if __name__=='__main__':
    p=fixed_deletions(14,range(1,9))
    q=fixed_deletions(14,range(7,15))
    assert len(p)==len(q)==20
    R=[a+150*b for a,b in zip(p,q)]
    v,w,u=[value(R,-5,d) for d in range(3)]
    assert (v,w,u)==(-23905785654288389623695626304,
                     60727894241595633504811120896,
                     -171391484722356580954477028832)
    assert w*w-v*u==-409370957724475548783255073854126061762898141879377754112
    print('Laguerre form at −5:',w*w-v*u)
