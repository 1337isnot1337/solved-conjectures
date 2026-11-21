"""Exact checks for scaled cross contractions and the row-adaptive Gram estimate."""
from fractions import Fraction as F
from itertools import permutations
from math import factorial, prod
from verify_flat_correlations import log_bound


def dot(x,y):
    return sum(a*b for a,b in zip(x,y))


def per(T):
    return sum(prod(T[i][j] for i,j in enumerate(p)) for p in permutations(range(len(T))))


def scalings():
    count = 0
    for k in range(2,7):
        # Householder reflection, followed by independent diagonal contractions on both sides.
        for coeff in (list(range(1,k+1)), [1]*k, [(-1)**j*(1+j%2) for j in range(k)]):
            v2 = dot(coeff,coeff)
            for zero_row in (False,True):
                T = [[(int(i==j)-F(2*coeff[i]*coeff[j],v2))
                      * (F(k-i,k) if not zero_row or i else 0) * F(j+1,k)
                      for j in range(k)] for i in range(k)]
                val = abs(per(T))**k
                for u in (1,3,7):
                    x = [F(1+u*i,2+i) for i in range(k)]
                    y = [F(u+i,1+u*(k-1-i)) for i in range(k)]
                    total = sum(x[i]*y[j]*T[i][j]**2 for i in range(k) for j in range(k))
                    assert val*prod(x)*prod(y) <= (total/k)**k
                    count += 1
    return count


def adaptive():
    # Rank-two real Gram matrices with Pythagorean directions and arbitrary multiplicities.
    dirs = [(F(1),F(0)),(F(0),F(1)),(F(3,5),F(4,5)),(F(3,5),F(-4,5))]
    count = mixed = 0
    for i in range(0,17,2):
        for j in range(0,11,2):
            for l in range(1,5):
                rows = [dirs[0]]*i+[dirs[1]]*j+[dirs[2]]*l+[dirs[3]]*(l//2)
                n = len(rows)
                w = [[0 if r==s else dot(v,z)**2 for s,z in enumerate(rows)] for r,v in enumerate(rows)]
                t = list(map(sum,w))
                H = [u for u in range(n) if t[u]>6]
                L = [u for u in range(n) if t[u]<=6]
                mixed += bool(H and L)
                a = [F(1)]
                for x,y in rows:
                    a = [x*p+y*q for p,q in zip(a+[0],[0]+a)]
                perm = sum(x*x*factorial(h)*factorial(n-h) for h,x in enumerate(a))
                if any(t):
                    assert sum(log_bound(1+z*z,True) for z in t) <= F(43404,100)*log_bound(perm,False)
                else:
                    assert perm==1
                # Test the Hilbert-Schmidt contraction on a fixed non-diagonal positive kernel.
                for test in dirs:
                    energy = sum(dot(rows[u],test)**4/(1+sum(w[u][v] for v in H)) for u in H)
                    assert energy <= 1
                count += 1
    return count,mixed


if __name__ == '__main__':
    assert log_bound(F(37,3),False)>F(5,2)
    assert log_bound(F(3),True)<F(11,10)
    assert F(69,100)<log_bound(F(2),False) and log_bound(F(2),True)<F(7,10)
    c,m = adaptive()
    print(f'{scalings()} scaled contraction checks and {c} exact Gram permanents ({m} mixed row sets)')
