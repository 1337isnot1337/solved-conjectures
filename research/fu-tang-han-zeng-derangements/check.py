#!/usr/bin/env python3
"""Exact two-ended DP for 123-avoiding derangement excedance distributions."""
from collections import defaultdict
from itertools import product
from math import comb
import sys

BITS=list(product((0,1),repeat=4))
def twoend(n):
    h=n//2
    ans=[0]*(n+1)
    for m in range(n): # upper chain count; position n cannot be an excedance of the complement
        d={(0,0,0,0,0):1}
        for i in range(1,h+1):
            nxt=defaultdict(int)
            for (u,v,w,x,k),cnt in d.items():
                for a,b,c,e in BITS:
                    # R bits encode strict upper branch; S bits are its values.
                    if u<v+b or w+c>x: continue
                    # Pair each branch by sorted index and value.
                    uu,vv,ww,xx=u+a,v+b,w+c,x+e
                    if any(q>m or i-q>n-m for q in (uu,vv,ww,xx)): continue
                    dl=uu+xx-m
                    dr=m-w-v
                    if not a: dl=2*i-n-dl
                    if not c: dr=n+2-2*i-dr
                    if dl==1 and a==e or dr==1 and c==b: continue
                    nxt[uu,vv,ww,xx,k+(dl<=0)+(dr<=0)]+=cnt
            d=nxt
        for (u,v,w,x,k),cnt in d.items():
            if n%2:
                a,b=m-u-w,m-v-x
                if a not in (0,1) or b not in (0,1) or u<v+b: continue
                dl=u+a+x+b-m
                if not a: dl=1-dl
                if dl==1 and a==b: continue
                ans[k+(dl<=0)]+=cnt
            elif u+w==v+x==m:
                ans[k]+=cnt
    return ans

def gamma(coeff):
    q=coeff[:]; n=len(q)-1; res=[]
    for k in range(n//2+1):
        c=q[k];res.append(c)
        for j in range(n-2*k+1):q[k+j]-=c*comb(n-2*k,j)
    assert not any(q),(coeff,q)
    return res

def insertion_words(n):
    if n==0:
        yield ()
        return
    for p in insertion_words(n-1):
        # A new largest entry is valid iff the prefix before it is decreasing.
        j=next((i+1 for i in range(len(p)-1) if p[i]<p[i+1]),len(p))
        for k in range(j+1):
            yield p[:k]+(n,)+p[k:]

def direct(n):
    a=[0]*(n+1)
    for p in insertion_words(n):
        if all(i!=x for i,x in enumerate(p,1)):
            a[sum(i<x for i,x in enumerate(p,1))]+=1
    return a

if __name__=='__main__':
 for n in range(1,(int(sys.argv[1]) if len(sys.argv) > 1 else 12) + 1):
    f=twoend(n); g=gamma(f)
    if n<=12: assert f==direct(n), (n, f, direct(n))
    assert [k for k,v in enumerate(f) if v] == list(range((n+2)//3,2*n//3+1))
    if n%3==0:
        m=n//3; assert f[m]==f[2*m]==comb(2*m,m)//(m+1)
    print(n,f,g,flush=True)
