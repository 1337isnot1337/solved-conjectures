#!/usr/bin/env python3
"""Exact finite interlacing certificates for Dukes's revstack polynomials."""
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

def pol(A,n):
    x=A[n][:]
    for i,v in enumerate(A[(n-1)//2]):
        for j,w in enumerate(A[n//2]):
            x[i+j]-=v*w
    assert x[0]==0 and x[1]==x[-1]==1
    return x[1:]

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

if __name__=='__main__':
    N=128
    A=eul(N)
    for n,expected in [(3,[1,3,1]),(4,[1,10,10,1])]:
        assert pol(A,n)==expected  # also directly printed in Dukes's appendix
    assert 3*160**64*10 < 169**64
    assert comb(64,5)*9**5*8 > 320**5
    assert comb(32,4)*9**4*50 > 320**4
    P=pol(A,3)
    brackets=[(Q(-3),Q(-2)),(Q(-1),Q(-1,4))]
    for n in range(3,N):
        Qp=pol(A,n+1)
        brackets=cross_brackets(P,Qp,brackets)
        P=Qp
    print('Exact rational signs certify all transitions 3→4 through 127→128.')
