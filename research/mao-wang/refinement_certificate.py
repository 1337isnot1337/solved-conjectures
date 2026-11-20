"""Exact certificate that an auxiliary stability route fails.

This does NOT refute Mao--Wang's matrix-square conjecture.
It checks R_22(2t+3,4t+11,4t+2), an auxiliary specialization.
"""
from math import comb
import sympy as sp

def eulerian(nmax):
    rows=[[1]]
    for n in range(1,nmax+1):
        p=[0]*n
        for j,c in enumerate(rows[-1]):
            p[j]+=(j+1)*c
            if j+1<n:p[j+1]+=(n-1-j)*c
        rows.append(p)
    return rows

def mul(a,b):
    p=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):p[i+j]+=x*y
    return p

def line_polynomial(n, shifts, directions):
    a=eulerian(n)
    powers=[[[comb(m,j)*shift**(m-j)*d**j for j in range(m+1)]
             for m in range(n)] for shift,d in zip(shifts,directions)]
    p=[0]*n
    for j in range(1,n+1):
        h=[0]*j
        for k,c in enumerate(a[j]):
            term=mul(powers[0][j-1-k],powers[1][k])
            for r,v in enumerate(term):h[r]+=c*v
        term=mul(h,powers[2][n-j])
        for r,v in enumerate(term):p[r]+=a[n][j-1]*v
    return p

def main():
    x=sp.Symbol('x')
    p=sp.Poly.from_list(line_polynomial(22,[3,11,2],[2,4,4])[::-1],x)
    content, primitive=p.primitive()
    assert p.degree()==21
    assert p.gcd(p.diff()).degree()==0
    count=p.count_roots(-sp.oo,sp.oo)
    assert count==19
    print('R_22(2x+3,4x+11,4x+2): degree 21, squarefree, exactly 19 real roots')
    print('Positive content:',content)
    print('Primitive integer coefficients in ascending order:')
    print(primitive.all_coeffs()[::-1])
    print('Auxiliary stability invariant refuted; original conjecture unresolved.')

if __name__=='__main__':main()
