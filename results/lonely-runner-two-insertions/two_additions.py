from fractions import Fraction as F
from math import gcd
from functools import lru_cache
def intersect(a,b):
    i=j=0;out=[]
    while i<len(a) and j<len(b):
        l=max(a[i][0],b[j][0]);r=min(a[i][1],b[j][1])
        if l<=r:out.append((l,r))
        if a[i][1]<=b[j][1]:i+=1
        else:j+=1
    return out

@lru_cache(maxsize=30000)
def good(vs,q):
    if not vs:return [(F(0),F(1,2))]
    *w,v=vs
    arcs=[(F(q*i+1,q*v),F(q*(i+1)-1,q*v)) for i in range((v+1)//2)]
    return intersect(good(tuple(w),q),arcs)



def check_small():
    bases=pairs=0
    for p in range(3,11):
        q=p+2
        J=[(F(1,q),F(1,p))]
        for b in range(1,2*p*q//(p-2)+1):
            bases+=1
            free=intersect(J,good((b,),q))
            width=max(t-s for s,t in free)
            assert width>0
            for c in range(b,(2/(q*width)).__ceil__()):
                pairs+=1
                assert intersect(free,good((c,),q)),(p,b,c)
    return bases,pairs

def check_goddyn(limit):
    accelerated=0
    for p in range(3,limit+1):
        for r in range(1,p):
            s=p-r
            b=s
            while gcd(r,b)>1:b+=1
            for m in range(2,b//s+1):
                w=m*r
                assert (m-1)*(p+2)<w<m*p
                accelerated+=1
    return accelerated

if __name__=='__main__':
    segment = [(F(1,6), F(1,3))]
    first_two = intersect(segment, good((4,6),6))
    assert first_two == [(F(7,36),F(5,24)),(F(7,24),F(11,36))]
    assert not intersect(first_two,good((10,),6))
    assert all(min(x % 1,(-x) % 1) >= F(1,6)
               for x in (v*F(3,8) for v in (1,2,4,6,10)))
    print('small exact base and pair counts',check_small())
    print('endpoint inequalities verified for accelerations',check_goddyn(2048))
