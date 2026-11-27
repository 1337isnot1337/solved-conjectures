#!/usr/bin/env python3
"""Exact first-index Turan certificate, two independent polynomial recursions."""
from collections import Counter
from functools import cache
from itertools import combinations
from math import comb, factorial
import sympy as sp

EXPECTED=(1367432169863264385040621589,236827334118626401257039561,43971319705548460332837139)
DEFECT=-4040610930973941995066729476797524541048570545321150

def subsets(s):
    for i in range(len(s)+1):
        yield from combinations(s,i)

@cache
def Qweights(r):
    # Gao-Xie reciprocity. Each coefficient is a linear combination of flag counts.
    if r==0:
        return (Counter({():1}),)
    out=[Counter() for _ in range((r+1)//2)]
    for j,coeff in enumerate(out):
        for d in range(r):
            for k,low in enumerate(Qweights(d)):
                g=r-j+d-k
                if not d<g<=r:
                    continue
                for mid in subsets(tuple(range(d+1,g))):
                    factor=(-1)**(r+d+len(mid)+1)
                    for bot,a in low.items():
                        S=bot+((d,) if d else ())+mid+((g,) if g<r else ())
                        coeff[S]+=factor*a
    return tuple({s:a for s,a in c.items() if a} for c in out)

def flags_func(q):
    symbolic=isinstance(q,sp.Symbol)
    P=(lambda x:sp.Poly(x,q,domain=sp.QQ)) if symbolic else int

    @cache
    def gauss(d,i):
        if not 0<=i<=d:
            return P(0)
        if d==0:
            return P(1)
        return gauss(d-1,i-1)+P(q**i)*gauss(d-1,i)

    @cache
    def binom_m(j):
        m=q**4
        if not symbolic:
            return comb(m,j)
        p=P(1)
        for i in range(j):
            p*=P(m-i)
        return p.quo_ground(factorial(j))

    @cache
    def alpha(d,t,S):
        if not S:
            return P(1)
        v=S[-1]
        return sum((gauss(d,i)*comb(t,v-i)*alpha(i,v-i,S[:-1])
                    for i in range(max(0,v-t),min(v,d)+1)),P(0))

    @cache
    def flags(S):
        if not S:
            return P(1)
        v=S[-1]
        base=sum((gauss(8,i)*binom_m(v-i)*alpha(i,v-i,S[:-1])
                  for i in range(v+1)),P(0))
        if v<4:
            return base
        b=P(q**16)
        return base+b*(alpha(4,1,S[:-1])-alpha(4,0,S[:-1])
                       -gauss(4,3)*alpha(3,1,S[:-1]))
    return flags

def flag_replay():
    W=Qweights(5)
    for i,w in enumerate(W):
        print('Q coefficient',i,'weights',sorted(w.items()))
    flags=flags_func(17)
    C=tuple(sum(a*flags(S) for S,a in w.items()) for w in W)
    print('Q(17)',C)
    assert C==EXPECTED
    D=C[1]**2-C[0]*C[2]
    print('Turan defect',D)
    assert D==DEFECT<0
    q=sp.Symbol('q')
    flags=flags_func(q)
    C=tuple(sum(a*flags(S) for S,a in w.items()) for w in W)
    assert tuple(c.eval(17) for c in C)==EXPECTED
    for i,c in enumerate(C):
        print('c',i,'=',sp.factor(c.as_expr()))
    assert tuple(c.degree() for c in C)==(22,21,21)
    assert tuple(c.LC() for c in C)==(1,3,sp.Rational(1,2))
    D=C[1]**2-C[0]*C[2]
    H=(-D).shift(17)
    assert H.degree()==43 and H.LC()==sp.Rational(1,2)
    assert H.TC()==-DEFECT
    assert all(c>0 for c in H.all_coeffs())
    print('44 strictly positive coefficients in negative defect shifted by 17')

def inverse_z_replay(q=17):
    # BFMN Theorem 2.2, inverted in the incidence algebra.
    @cache
    def gb(d,i):
        if not 0<=i<=d:
            return 0
        a=b=1
        for j in range(i):
            a*=q**(d-j)-1
            b*=q**(i-j)-1
        assert a%b==0
        return a//b

    def calc(S):
        r=len(S)-1
        Y=[0]*(r+1)
        for i in range((r+1)//2,r+1):
            Y[i]=Y[r-i]=-S[i]
        Q=tuple(a+b for a,b in zip(S,Y))
        assert not any(Q[(r+1)//2:])
        return Q[:(r+1)//2],tuple(Y)

    @cache
    def Yprod(d,t):
        r=d+t
        if not r:
            return (1,)
        return calc(Strunc(d,t,r))[1]

    @cache
    def Strunc(n,m,r):
        S=[0]*(r+1)
        for i in range(min(n,r-1)+1):
            for j in range(min(m,r-1-i)+1):
                c=r-i-j
                w=(-1)**c*gb(n,i)*comb(m,j)
                for a,v in enumerate(Yprod(i,j)):
                    S[a+c]+=w*v
        return tuple(S)

    assert calc(Strunc(0,5,4))[0]==(4,5)  # uniform U_{4,5}
    S=list(Strunc(8,q**4,5))
    delta=tuple(a-b-gb(4,3)*c for a,b,c in zip(
        calc(Strunc(4,1,4))[1],Yprod(4,0),Yprod(3,1)))
    for a,v in enumerate(delta):
        S[a+1]-=q**16*v
    Q,Y=calc(S)
    assert Q==EXPECTED
    assert Y==(1367432169863264385040621589,1604275384447811244361679510,
        1648248575127069559732389010,1648248575127069559732389010,
        1604275384447811244361679510,1367432169863264385040621589)
    print('independent Q:',Q)
    print('independent Y:',Y)

if __name__=='__main__':
    flag_replay()
    inverse_z_replay()
    print('All exact checks passed.')
