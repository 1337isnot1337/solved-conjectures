"""Finite exact checks for the identities; not a proof or JSV implementation."""
from itertools import combinations, product
from fractions import Fraction
from border_probe import permanent


def multiply(a,b):
    return [[sum(x*y for x,y in zip(row,col)) for col in zip(*b)] for row in a]

def compound(a,k):
    n=len(a); ss=list(combinations(range(n),k))
    return [[permanent([[a[i][j] for j in J]for i in I])for J in ss]for I in ss]

def trace_power(b,t):
    p=[[int(i==j)for j in range(len(b))]for i in range(len(b))]
    for _ in range(t):p=multiply(p,b)
    return sum(p[i][i]for i in range(len(b)))

def cyclic(a,t,s):
    n=len(a);m=[[Fraction(int(i==j))for j in range(n*t)]for i in range(n*t)]
    for ell in range(t):
        for i in range(n):
            for j in range(n):m[ell*n+i][((ell+1)%t)*n+j]+=s*a[i][j]
    return m

def check(a,t,s):
    n=len(a)
    z=sum(trace_power(compound(a,k),t)*s**(k*t)for k in range(n+1))
    q=permanent(cyclic(a,t,s))
    assert z==q,(a,t,s,z,q)

if __name__=='__main__':
    count=0
    for n in [1,2,3]:
        for bits in product([0,1],repeat=n*n):
            a=[bits[i*n:(i+1)*n]for i in range(n)]
            for t in [1,2,3]:
                check(a,t,Fraction(1));count+=1
    cases=[[[0,2,0],[0,0,3],[5,0,0]],[[1,2,0],[0,0,3],[0,0,0]],[[1,2],[3,4]],[[Fraction(1,3),0,5],[2,Fraction(2,7),0],[0,3,0]]]
    for a in cases:
        for t in [1,2,3,4]:
            for s in [Fraction(1,3),Fraction(3,2),Fraction(5)]:
                check(a,t,s);count+=1
    print('exact cyclic-permanent identity checks passed:',count)
