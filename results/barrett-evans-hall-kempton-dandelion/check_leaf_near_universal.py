"""Exact finite cases for the missing-leaf geometry; Python standard library."""
from fractions import Fraction as Q
from itertools import combinations

def positive_definite(A):
    prev=1
    for j,row in enumerate(A):
        p=row[j]
        if p<=0: return False
        for r in range(j+1,len(A)):
            for c in range(r,len(A)):
                x,rem=divmod(p*A[r][c]-A[r][j]*A[c][j],prev)
                if rem: raise ArithmeticError("non-exact Bareiss division")
                A[r][c]=A[c][r]=x
        prev=p
    return True

def spectrum_cut(m,edges):
    n=sum(m); k=len(m)
    d=[0]*k
    B=[[0]*k for _ in m]
    for i,j in edges:
        d[i]+=m[j];d[j]+=m[i]
        z=m[i]*m[j]
        B[i][i]+=z;B[j][j]+=z;B[i][j]-=z;B[j][i]-=z
    active=[i for i in range(k) if m[i]]
    def beats(t):
        a,b=t.numerator,t.denominator
        if any(m[i]>1 and b*d[i]<=a for i in active):return False
        I=active[:-1]
        return positive_definite(
            [[b*n*B[i][j]+a*m[i]*m[j]-(a*n*m[i] if i==j else 0)
              for j in I] for i in I])
    return beats

def bracket(lo,hi,above,steps=30):
    for _ in range(steps):
        mid=(lo+hi)/2
        if above(mid):lo=mid
        else:hi=mid
    return lo,hi

def low(m,edges):
    return bracket(Q(0),Q(2),spectrum_cut(m,edges),24)[0]

def dand_upper(n):
    p=lambda x:x*x*x-(n+2)*x*x+(3*n-2)*x-n
    _,xhigh=bracket(Q(0),Q(1),lambda z:p(z)<0)
    zlow,_=bracket(Q(n-1),Q(n),lambda z:p(z)<0)
    return n+xhigh-zlow

def generalized_dandelion(n,es):
    N=[set() for _ in range(n)]
    for u,v in es:
        N[u].add(v);N[v].add(u)
    for h in range(n):
        if len(N[h])!=n-2: continue
        l,=set(range(n))-N[h]-{h}
        if len(N[l])!=1: continue
        w,=N[l]
        if N[w]=={l,h}:return True
    return False

def small(n):
    # Check all graphs with h adjacent to all except the leaf l, up to
    # arbitrary edges on the n-3 ordinary vertices.
    T=list(range(3,n))
    base={(0,1),(1,2)}|{(2,a) for a in T}
    edges=list(combinations(T,2)); E=set(combinations(range(n),2))
    non=0
    u=dand_upper(n)
    for r in range(1,len(T)):
        q=len(T)-r
        g0=base|{(1,v) for v in T[:r]}
        m=[1,1,1,q,r]
        x0=low(m,[(0,1),(1,2),(2,3),(2,4),(1,4)])
        if spectrum_cut(m,[(0,2),(0,3),(0,4),(1,3)])(u-x0):
            continue
        for bits in range(1<<len(edges)):
            g=g0|{e for i,e in enumerate(edges) if (bits>>i)&1}
            h=E-g
            if generalized_dandelion(n,g) or generalized_dandelion(n,h): continue
            non+=1
            y=spectrum_cut([1]*n,h)
            if y(u-x0):continue
            x=low([1]*n,g)
            assert y(u-x),(n,r,bits)
    return non

def middle(n):
    check=0
    upper=dand_upper(n)
    for r in range(1,n-4):
        q=n-3-r
        m=[1,1,1,q,r]  # l,w,h,T0,T1
        x=low(m,[(0,1),(1,2),(2,3),(2,4),(1,4)])
        assert spectrum_cut(m,[(0,2),(0,3),(0,4),(1,3)])(upper-x),(n,r)
        check+=1
    # q=1 and not the complementary dandelion. G has a generalized-bull
    # comparator, while G^c has an augmented dandelion comparator with r=1.
    h=lambda x:x*x-n*x+n-2
    x=bracket(Q(0),Q(1),lambda z:h(z)>0)[0]
    m=[1,1,1,n-4,1]
    assert spectrum_cut(m,[(0,1),(1,2),(2,3),(2,4),(1,4)])(upper-x)
    return check+1

if __name__=='__main__':
    for n in range(4,10):print('direct',n,small(n),flush=True)
    for n in range(10,50):print('comparators',n,middle(n),flush=True)
