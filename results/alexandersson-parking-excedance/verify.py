#!/usr/bin/env python3
"""Exact certificate for Alexandersson's parking-function excedance conjecture."""
from collections import defaultdict
from fractions import Fraction
from itertools import product
from math import comb, factorial

def excedance_polynomial(n):
    # Process preference values 1 through n. State (i,k) records totals
    # of processed entries and marked strict excedances.
    F={(0,0):1}
    for j in range(1,n+1):
        G=defaultdict(int)
        for (i,k),v in F.items():
            for r in range(max(0,j-i),n-i+1):
                for s in range(min(r,j-1-k)+1):
                    G[i+r,k+s] += v*comb(j-1-k,s)*comb(i+r-k-s,r-s)
        F=G
    B=[F[n,k] for k in range(n)]
    return [sum((-1)**(k-j)*comb(k,j)*B[k] for k in range(j,n))
            for j in range(n)]

def descending_value_polynomial(n):
    # Current values v..n unassigned initially. Each group tracks free slots.
    D={(n-1,1,0):1}
    for v in range(n,0,-1):
        T=defaultdict(int)
        for (a,b,e),w in D.items():
            occupied=n-a-b
            for i in range(min(a,n-v+1-occupied)+1):
                for j in range(min(b,n-v+1-occupied-i)+1):
                    aa,bb=a-i,b-j
                    ww=w*comb(a,i)*comb(b,j)
                    T[aa,bb,e+i]+=ww
        if v==1:
            return [T[0,0,e] for e in range(n)]
        D=defaultdict(int)
        for (a,b,e),w in T.items():
            free, rem=divmod(w*a,v-1)
            assert rem==0
            if a: D[a-1,b+1,e]+=free
            if w-free: D[a,b,e]+=w-free
    raise AssertionError

def direct_words(n):
    result=[0]*n
    for w in product(range(1,n+1),repeat=n):
        if all(a<=j for j,a in enumerate(sorted(w),1)):
            result[sum(a>j for j,a in enumerate(w,1))]+=1
    return result

def evaluate(coefficients,x):
    v=0
    for c in reversed(coefficients):
        v=v*x+c
    return v

def derivative(p):
    return [j*c for j,c in enumerate(p) if j]

if __name__=='__main__':
    for n in range(1,7):
        assert excedance_polynomial(n)==direct_words(n)
    for n in range(1,18):
        p=excedance_polynomial(n)
        assert p==descending_value_polynomial(n)
        assert p[0]==factorial(n) and p[-1]==1
        assert sum(p)==(n+1)**(n-1)
    p=excedance_polynomial(17)
    assert p==[
        355687428096000, 14275291188684965, 220079797544966499,
        1742926757301248149, 7868015556095346463, 21067674348334416341,
        33787202856242622669, 32220523133498449897, 17905034013658213079,
        5600870095867413683, 933784805146283433, 76123471388456123,
        2635027764733129, 30185810407651, 69315686247, 9227447, 1]
    x=Fraction(-1,5)
    P=evaluate(p,x)
    dP=evaluate(derivative(p),x)
    ddP=evaluate(derivative(derivative(p)),x)
    delta=dP*dP-P*ddP
    assert delta==Fraction(-1177338341095610033551509654796761547971187113984,
                            931322574615478515625)
    assert delta<0
    print('P_17 coefficients in increasing order:',p)
    print("P_17'(-1/5)^2 - P_17(-1/5) P_17''(-1/5) =",delta)
