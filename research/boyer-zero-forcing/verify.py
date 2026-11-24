"""Finite regression checks, not the proof of the unbounded theorem."""
from math import comb

def F(n):
    assert n >= 0
    return [comb(n-k-1,k) for k in range((n-1)//2+1)] if n else [0]

def C(n):
    assert n >= 1
    return [1]+[n*comb(n-k-1,k-1)//k for k in range(1,n//2+1)]

def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            c[i+j]+=x*y
    return c

def ge(a,b):
    return all((a[i] if i<len(a) else 0)>=v for i,v in enumerate(b))

for a in range(3,101):
    for b in range(4,102,2):
        assert ge(mul(C(a),C(b)),F(a+b))
        if a%2==0 or a>=b:
            assert ge(mul(C(a),C(b)),C(a+b))
for a in range(1,102):
    for b in range(4,102,2):
        if a%2 or a>=b:
            assert ge(mul(F(a),C(b)),F(a+b))
assert not ge(mul(mul(C(3),C(3)),C(40)),F(46))
print("All cycle-pair and path-cycle regressions passed; parity obstruction verified.")
