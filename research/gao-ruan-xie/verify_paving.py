"""Independent checks of the paving inverse-Z formula and proof algebra.
Requires Python 3 and SymPy. Small exact lattice tests are illustrative;
the symbolic identities are used in the universal argument in PAVING.md.
"""
from itertools import combinations
from math import comb
from random import Random
from fractions import Fraction as F
import sympy as S


def identities():
    k,t,s,u,h,n,i,r=S.symbols('k t s u h n i r')
    assert S.cancel((n-r+1)/(n-i)-(h-r+1)/(h-i)-(r-1-i)*(n-h)/((n-i)*(h-i)))==0
    N=2*k+t
    p=S.expand((N-2*k+2)*k*(N-k)*(N+1)-N*(N-2*k+1)*(k-1)*(N-k+1))
    assert p==2*k**3+4*k**2*t+2*k**2+4*k*t**2+6*k*t+2*k+t**3+2*t**2+t
    d=2*k-1;T=2*s+u;N=T+2*k-2
    a0=N*(N-1+(d-1)*(s-1));b0=d*s*(N-1)
    num=N*((a0-b0)*s*(s+k-1)+b0*(T-s)*(T+k-1-s))-T*a0*(T+k-1-s)*(s+k-1)
    rhs=u*(k-1)*(k+2*s+u-1)*(2*k+2*s+u-2)*(2*s*(k-2)+2*s*s+(2*s-1)*u+1)
    assert S.expand(num-rhs)==0
    print('symbolic identities verified')


def subsets(n,d):
    return [sum(1<<j for j in I) for I in combinations(range(n),d)]


def lattice(n,r,blocks):
    full=(1<<n)-1
    d=r-1
    assert all(d<=b.bit_count()<n for b in blocks)
    assert all((b&c).bit_count()<d for b,c in combinations(blocks,2))
    assert all(sum((v&b)==v for b in blocks)==1 for v in subsets(n,d))
    rk={v:k for k in range(d) for v in subsets(n,k)}
    rk.update({b:d for b in blocks});rk[full]=r
    flats=sorted(rk,key=lambda v:(rk[v],v))
    P={};Q={};mu={}
    for gap in range(r+1):
        for g in flats:
            for f in flats:
                if f&g!=f or rk[g]-rk[f]!=gap:continue
                if not gap:P[f,g]=Q[f,g]=[1];mu[f,g]=1;continue
                above=[x for x in flats if x!=f and f&x==f and x&g==x]
                z=[0]*(gap+1)
                for x in above:
                    for j,c in enumerate(P[x,g]):z[rk[x]-rk[f]+j]+=c
                p=[z[gap-j]-z[j] for j in range((gap+1)//2)]
                for j,c in enumerate(p):z[j]+=c
                assert z==z[::-1]
                P[f,g]=p
                q=[0]*gap
                for x in above:
                    for i,a in enumerate(P[f,x]):
                        for j,b in enumerate(Q[x,g]):q[i+j]-=a*b
                Q[f,g]=q
                mu[f,g]=-sum(mu[f,x] for x in flats if x!=g and f&x==f and x&g==x)
    y=[0]*(r+1)
    for f in flats:
        for j,c in enumerate(Q[0,f]):
            y[r-rk[f]+j]+=(-1)**rk[f]*c*abs(mu[f,full])
    return y


def uniform(n,r,i):
    return comb(n,i)*comb(n-i-1,n-r)


def coefficient_formula(n,r,blocks):
    y=[]
    for j in range(r//2+1):
        c=F(uniform(n,r,j))
        for b in blocks:
            h=b.bit_count()
            if h==r-1:continue
            c-=uniform(h,r,j)
            if r==2*j:
                c+=F(h*comb(h-1,j)*comb(h-1-j,j-1),(h-j)*(h-j+1))
        assert c.denominator==1
        y.append(c.numerator)
    return y+y[-(2 if r%2==0 else 1)::-1]


def random_blocks(n,r,rng):
    d=r-1;blocks=[];uncovered=set(subsets(n,d))
    candidates=[b for j in range(r,n) for b in subsets(n,j)]
    rng.shuffle(candidates)
    for b in candidates:
        if any((b&c).bit_count()>=d for c in blocks):continue
        if rng.random()<0.4:
            blocks.append(b);uncovered={v for v in uncovered if b&v!=v}
    return blocks+sorted(uncovered)


def exact_tests():
    rng=Random(20261123);count=0
    for n in range(2,9):
        for r in range(2,n+1):
            for _ in range(8):
                B=random_blocks(n,r,rng)
                y=lattice(n,r,B)
                assert y==coefficient_formula(n,r,B),(n,r,B,y,coefficient_formula(n,r,B))
                assert min(y)>0 and all(y[j]**2>y[j-1]*y[j+1] for j in range(1,r))
                if r>=3:
                    H=[b.bit_count() for b in B];W=comb(n,r-1)
                    for i in range(r//2+1):
                        if 2*i==r:continue
                        fi=sum(F(comb(h,r-1)*(n-h),h-i) for h in H)
                        assert y[i]==(r-1)*comb(r-2,i)*fi/(n-i)
                    if r%2==0:
                        k=r//2;fi=sum(F(comb(h,r-1)*(n-h),h-k+1) for h in H)
                        assert fi/W>=F(n-2*k+2,n)
                count+=1
    print(count,'exact independent lattice checks passed')


if __name__=='__main__':
    identities();exact_tests()
