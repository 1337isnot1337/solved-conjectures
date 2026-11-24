#!/usr/bin/env python3
"""Exact replay: CFH Conjecture 7.3 and its augmented analogue.
Requires Python 3.9+ and SymPy; no floating-point computations.
"""
from functools import cache
from itertools import combinations
from math import comb, factorial
import sympy as sp

R = (1, 2, 3, 4)
EXPECTED = {
    False: (1367432169863264385040621589, 677031173160167651396287043,
            85823997163784007690567699),
    True: (1367432169863264385040621589, 677047053626088109460305403,
           85827739133054463066849240),
}
EXPECTED_DISC = {
    False: -11062769241414341239970603495681493737981374532130995,
    True: -11061733404916469626152098526056073213151599377977031,
}


def subsets(S):
    for i in range(len(S)+1):
        yield from combinations(S,i)


def stable(S):
    return all(y-x > 1 for x,y in zip(S,S[1:]))


def gamma_from_flags(flags, augmented):
    def beta(S):
        return sum((-1)**(len(S)-len(T))*flags(T) for T in subsets(S))
    return tuple(sum(beta(tuple(i for i in R if i not in S))
                     for S in subsets(R if augmented else R[:-1])
                     if len(S)==j and stable(S)) for j in range(3))


def expand_gamma(g, augmented):
    n = 5 if augmented else 4
    return tuple(sum(g[j]*comb(n-2*j,k-j) for j in range(3)
                     if j<=k<=n-j) for k in range(n+1))


def flag_replay():
    # Theorem 4.9 of CFH, using exact flag counts. Gaussian recurrence.
    q=sp.Symbol('q'); m=q**4; b=q**16
    P=lambda x:sp.Poly(x,q,domain=sp.QQ)
    @cache
    def gaussian(d,i):
        if not 0<=i<=d:return P(0)
        if d==0:return P(1)
        return gaussian(d-1,i-1)+gaussian(d-1,i)*P(q**i)
    @cache
    def binom_m(t):
        out=P(1)
        for j in range(t):out*=P(m-j)
        return out.quo_ground(factorial(t))
    @cache
    def alpha(d,t,S):
        if not S:return P(1)
        v=S[-1]
        return sum((gaussian(d,i)*comb(t,v-i)*alpha(i,v-i,S[:-1])
                    for i in range(max(0,v-t),min(d,v)+1)),P(0))
    N=[gaussian(8,i) for i in range(5)]
    L=gaussian(4,3)
    counts=[(4,0,N[4]-P(b)),(4,1,P(b)),(3,1,N[3]*P(m)-P(b)*L)]
    counts += [(4-j,j,N[4-j]*binom_m(j)) for j in range(2,5)]
    assert all(c.eval(17)>=0 for _,_,c in counts)
    @cache
    def flags(S):
        if not S:return P(1)
        if S[-1]<4:
            v=S[-1]
            return sum((N[i]*binom_m(v-i)*alpha(i,v-i,S[:-1])
                        for i in range(v+1)),P(0))
        return sum((c*alpha(d,t,S[:-1]) for d,t,c in counts),P(0))
    for S in subsets(R):
        print('alpha',S,flags(S).eval(17))
    for augmented in (False,True):
        g=gamma_from_flags(flags,augmented)
        values=tuple(int(v.eval(17)) for v in g)
        assert values==EXPECTED[augmented]
        D=g[1]**2-4*g[0]*g[2]
        assert D.eval(17)==EXPECTED_DISC[augmented]
        shifted=(-D).shift(17)
        assert shifted.degree()==43 and shifted.LC()==4
        assert len(shifted.all_coeffs())==44
        assert all(c>0 for c in shifted.all_coeffs())
        print('augmented',augmented,'gamma',values)
        print('discriminant',D.eval(17))
        print('negative discriminant at q=s+17: all 44 coefficients positive')


def incidence_replay():
    # Independent CFH Props. 4.6 & 4.7 computation at q=17.
    # Gaussian product rather than Gaussian recurrence; no flags or beta.
    q=17;m=q**4;b=q**16
    @cache
    def gaussian(d,i):
        if not 0<=i<=d:return 0
        num=den=1
        for j in range(i):
            num*=q**(d-j)-1
            den*=q**(i-j)-1
        assert num%den==0
        return num//den
    def add(p,f,length,weight):
        for i,c in enumerate(f):
            for j in range(length):p[i+j]+=weight*c
    @cache
    def F(d,t):
        r=d+t
        if not r:return (1,)
        result=[0]*(r+1)
        for i in range(d+1):
            for j in range(t+1):
                c=r-i-j
                if c:add(result,F(i,j),c+1,(-1)**(c+1)*gaussian(d,i)*comb(t,j))
        return tuple(result)
    def trunc(d,t,r):
        H=[0]*r; A=[0]*(r+1)
        for i in range(min(d,r-1)+1):
            for j in range(min(t,r-1-i)+1):
                c=r-i-j
                w=(-1)**(c+1)*gaussian(d,i)*comb(t,j)
                add(H,F(i,j),c,w);add(A,F(i,j),c+1,w)
        return H,A
    # Start with the rank-five truncation. Each block replaces one old
    # geometric hyperplane and L old geometric-three-space-plus-point
    # hyperplanes. The new lower interval is the rank-four truncation.
    H,A=trunc(8,m,5)
    delta=[v-u-gaussian(4,3)*w for v,u,w in
           zip(trunc(4,1,4)[1],F(4,0),F(3,1))]
    for i,c in enumerate(delta):
        H[i]+=b*c
        A[i]+=b*c;A[i+1]+=b*c
    assert tuple(H)==expand_gamma(EXPECTED[False],False)
    assert tuple(A)==expand_gamma(EXPECTED[True],True)
    print('Independent incidence recursion H*:',H)
    print('Independent incidence recursion F*:',A)


if __name__=='__main__':
    flag_replay()
    incidence_replay()
    print('All exact checks passed.')
