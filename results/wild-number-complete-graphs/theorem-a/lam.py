from math import comb, factorial
from fractions import Fraction
def N(m): # partitions of m-set into triples
    if m%3: return 0
    return factorial(m)//(factorial(m//3)*6**(m//3))
def lam(n):
    h=(n-1)//2; tot=Fraction(0)
    for m in range(1,h+1):
        s=2*m
        if s%3 or s==n: continue
        tot+= n*comb(h,m)*Fraction(N(s)*N(n-s),N(n))
    return tot
for n in range(9,100,6): 
    l=lam(n); print(n, float(l))
