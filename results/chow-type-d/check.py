#!/usr/bin/env python3
"""Exact finite interlacing certificates for Chow's type-D Eulerian polynomials."""
from fractions import Fraction as Q
from math import comb

def sign(x):
    return (x>0)-(x<0)

def evaluate(p,x):
    u,v=x.numerator,x.denominator
    shift=v.bit_length()-1
    assert v==1<<shift  # all endpoints are dyadic
    out=p[-1]
    for j,c in enumerate(reversed(p[:-1]),1):
        out=out*u+(c<<(shift*j))
    return sign(out)

def eul(N):
    A=[None,[0,1]]
    for n in range(1,N):
        a=[0]*(n+2)
        for k,v in enumerate(A[n]):
            a[k]+=k*v
            a[k+1]+=(n+1-k)*v
        A.append(a)
    return A

def round_sig(x,prec):
    # Every endpoint is dyadic. Keep only a fixed number of leading bits.
    if not x:
        return x
    e=abs(x.numerator).bit_length()-x.denominator.bit_length()
    unit=1<<max(0,prec-e)
    return Q(round(x*unit),unit)

def compact(l,r,P,Qp,s):
    # Numerical compression cannot certify anything: all signs are rechecked.
    prec=40
    while True:
        a,b=round_sig(l,prec),round_sig(r,prec)
        if a<b<0 and evaluate(P,a)==s and evaluate(P,b)==-s and evaluate(Qp,a)==evaluate(Qp,b)==s:
            return a,b
        # In particular a bracket ending exactly at 0 can keep that endpoint.
        if a<0 and b==0 and evaluate(P,a)==s and evaluate(P,b)==-s and evaluate(Qp,a)==evaluate(Qp,b)==s:
            return a,b
        prec*=2

def cross_brackets(P,Qp,brackets):
    marks=[]
    for l,r in brackets:
        desired=evaluate(P,l)
        assert desired and evaluate(P,r)==-desired
        for _ in range(400):
            if evaluate(Qp,l)==evaluate(Qp,r)==desired:
                marks.append(compact(l,r,P,Qp,desired))
                break
            m=(l+r)/2
            s=evaluate(P,m)
            if s==desired:
                l=m
            elif s==-desired:
                r=m
            else:  # an exact P-root; shrink on both sides
                l,r=(l+m)/2,(r+m)/2
        else:
            raise AssertionError("Failed to refine separating interval")
    target=(-1)**(len(Qp)-1)
    L=marks[0][0]*2
    while evaluate(Qp,L)!=target:
        L*=2
    new=list(zip([L]+[r for l,r in marks], [l for l,r in marks]+[Q(0)]))
    assert all(l<r and evaluate(Qp,l)*evaluate(Qp,r)==-1 for l,r in new)
    assert len(new)==len(Qp)-1
    for (_,r),(l,_) in zip(new,new[1:]):
        assert r<l
    return new


def all_type_d(N):
    A=eul(N)
    B=[1,1]
    D=[None]*2
    for n in range(1,N):
        nxt=[0]*(n+2)
        for k,v in enumerate(B):
            nxt[k]+=(1+2*k)*v
            nxt[k+1]+=(2*n+1-2*k)*v
        B=nxt
        p=B[:]
        for k,v in enumerate(A[n]):
            p[k]-=(n+1)*(1<<n)*v
        assert p[0]==p[-1]==1 and p==p[::-1]
        D.append(p)
    return D

if __name__=='__main__':
    N=128
    D=all_type_d(N)
    assert D[2]==[1,2,1] and D[3]==[1,11,11,1]
    assert 3*160**64*10 < 169**64
    assert comb(64,5)*9**5*8 > 320**5
    assert comb(64,6)*3**6 > 4000*10**6
    B=[(Q(-11),Q(-9)),(Q(-2),Q(-1,2)),(Q(-1,4),Q(0))]
    assert all(evaluate(D[3],l)*evaluate(D[3],r)==-1 for l,r in B)
    for n in range(3,N):
        B=cross_brackets(D[n],D[n+1],B)
    print('Exact rational signs certify all strict transitions 3→4 through 127→128.')
