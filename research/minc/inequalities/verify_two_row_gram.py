"""Small rational certificates and direct checks of the two-row Gram formulas."""
from fractions import Fraction as Q
from math import comb, factorial
from itertools import permutations, product


def mul(a,b):
    c = [Q(0)] * (len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            c[i+j] += x*y
    return c


def scalar_certificate():
    f=[Q(1)]
    for _ in range(4):
        f=mul(f,[1,0,Q(3,4),Q(45,8)])
    f=mul(f,[1,-3,3,-1])
    assert f[0]==1
    h=[-v for v in f[1:]]
    k=len(h)-1
    transformed=[sum(h[i]*Q(39,100)**i*comb(k-i,j-i) for i in range(j+1))
                 for j in range(k+1)]
    assert min(transformed)>0
    assert Q(47,100)**2*61 < Q(2*314,100*64)*139
    return len(transformed), min(transformed)


def beta(a,b):
    p=Q(a,a+b)
    return comb(a+b,a)*p**a*(1-p)**b


def pmf(n,p,k):
    return comb(n,k)*p**k*(1-p)**(n-k)


def overlap(m,r,d):
    return sum(pmf(m,d/m,k)*pmf(r,d/r,k) for k in range(min(m,r)+1))


def permanent(A):
    result=0
    for order in permutations(range(len(A))):
        term=1
        for i,j in enumerate(order):
            term*=A[i][j]
        result+=term
    return result


def formula_checks():
    count=direct=0
    for m,r in product(range(1,8), repeat=2):
        n=m+r
        for a,b in product(range(1,m+1),range(1,r+1)):
            d=Q(a*b,a+b)
            S=overlap(m,r,d)
            B=beta(m,r)
            assert S*B <= beta(a,b)**2
            if n<=6:
                q=[Q(1)]*(m-a)+[Q(0)]*(r-b)+[Q(a,a+b)]*(a+b)
                mat=[[v/m for v in q]]*m + [[(1-v)/r for v in q]]*r
                gram=[[sum(u*v for u,v in zip(row,col)) for col in mat] for row in mat]
                dn=Q(factorial(n),n**n)
                assert permanent(mat)/dn == beta(a,b)/B
                assert permanent(gram)/dn == S/B
                direct+=1
            count+=1
    return count,direct


if __name__ == "__main__":
    print("scalar coefficients and least coefficient:",scalar_certificate())
    print("reduced triples and direct matrix checks:",formula_checks())
