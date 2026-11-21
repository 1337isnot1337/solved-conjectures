"""Exact rational checks for Gram-positive Hwang padding limits.

The all-order proof is in hwang_psd_gram_core.md; these are diagnostics.
"""
from functools import lru_cache
from itertools import product
from math import factorial
import sympy as s

t=s.symbols('t')

def verify(V,N=9):
    m=len(V);rank=len(V[0]);W=s.Matrix(V);B=W*W.T
    rs=[sum(B[i,j] for j in range(m)) for i in range(m)]
    assert all(0<=x<=1 for x in rs),rs
    S=sum(rs)

    # Independent matching expansion: leave row unmatched or use new column.
    @lru_cache(None)
    def dp(i,mask):
        if i==m:
            return s.prod(1-t*rs[j] for j in range(m) if not (mask>>j)&1)
        q=(1-t*rs[i])*dp(i+1,mask)
        for j in range(m):
            if not (mask>>j)&1:
                q+=t*B[i,j]*dp(i+1,mask|(1<<j))
        return s.expand(q)

    Z=s.Poly(dp(0,0),t)
    z=s.symbols('z:'+str(rank))
    P=s.Poly(s.prod(1+sum(W[i,j]*z[j] for j in range(rank))
                    for i in range(m)),*z)
    pc=dict(P.terms())
    colsum=[sum(W[i,j] for i in range(m)) for j in range(rank)]
    def compositions(k,r):
        if r==1:
            yield(k,)
        else:
            for h in range(k+1):
                for tail in compositions(k-h,r-1):
                    yield(h,)+tail
    def gram_coeff(k):
        total=s.Integer(0)
        for aa in compositions(k,rank):
            g=s.Integer(0)
            for bb,coeff in pc.items():
                if all(bb[j]<=aa[j] for j in range(rank)):
                    g+=coeff*s.prod((-colsum[j])**(aa[j]-bb[j])/
                         factorial(aa[j]-bb[j]) for j in range(rank))
            total+=s.prod(factorial(a) for a in aa)*g*g
        return s.expand(total)

    zc=[Z.nth(j) for j in range(Z.degree()+1)]
    for k in range(N+1):
        from_matching=sum(zc[j]*S**(k-j)/factorial(k-j)
                          for j in range(min(k,len(zc)-1)+1))
        from_squares=gram_coeff(k)
        assert s.simplify(from_matching-from_squares)==0,(m,k)
        assert from_squares>=0,(m,k,from_squares)
    assert gram_coeff(1)==0
    assert gram_coeff(2)==sum(B[i,j]**2 for i in range(m)
                              for j in range(m))/2
    print('order',m,'rank',rank,'checked through degree',N,
          'first coefficients',[gram_coeff(k) for k in range(5)])

verify([[s.Rational(1,2),0],
        [s.Rational(1,2),s.Rational(1,2)],
        [0,s.Rational(1,2)]],10)
verify([[s.Rational(1,4),0,0],
        [s.Rational(1,4),s.Rational(1,4),0],
        [0,s.Rational(1,4),s.Rational(1,4)],
        [0,0,s.Rational(1,4)]],8)
verify([[s.Rational(1,3)],[s.Rational(1,4)],
        [s.Rational(1,6)],[s.Rational(1,5)]],10)
