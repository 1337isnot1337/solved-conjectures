"""Exact check of (*) sum_j c_j a^{3j} <= a-1 for odd n, own coefficients.
g(a) = a-1-W(a) is concave on a>=1 (W is a polynomial with nonneg coefficients). For PASS: exhibit rational a with g(a)>=0
exactly. For FAIL: rigorous upper bound on max_{a>=1} g via tangent lines at two rationals a1<a2 with g'(a1)>0>g'(a2)."""
import sys
from fractions import Fraction as Fr
from bounds import coefs, W
def dW(co,a): return sum(c*3*(i+1)*a**(3*(i+1)-1) for i,c in enumerate(co))
def analyse(n):
    co=coefs(n); fl=[float(c) for c in co]
    g=lambda a: a-1-sum(c*a**(3*(i+1)) for i,c in enumerate(fl))
    lo,hi=1.0,2.0
    for _ in range(200):
        m1,m2=lo+(hi-lo)/3,hi-(hi-lo)/3
        if g(m1)<g(m2): lo=m1
        else: hi=m2
    am=(lo+hi)/2
    a=Fr(round(am*10**6),10**6)
    ga=a-1-W(co,a)
    if ga>=0: return n,'PASS',a,float(W(co,a)),float(ga)
    # rigorous fail bound
    for dlt in [Fr(1,10**4),Fr(1,10**3),Fr(1,100)]:
        a1,a2=a-dlt,a+dlt
        d1=1-dW(co,a1); d2=1-dW(co,a2)
        if d1>0>d2: break
    g1=a1-1-W(co,a1); g2=a2-1-W(co,a2)
    # tangents: y=g1+d1(x-a1), y=g2+d2(x-a2); concavity => g<=min of both; max of min at intersection
    x=(g2-g1+d1*a1-d2*a2)/(d1-d2); ub=g1+d1*(x-a1)
    # also a<a1 region bounded by tangent at a1? concave: for x<=a1, g(x)<=g1+d1(x-a1)<=g1 + ... (d1>0 so <= value at a1 side) fine
    return n,'FAIL',a,float(W(co,a)),float(ga),'rigorous max_a g <=',float(ub)
if __name__=='__main__':
    lo,hi=int(sys.argv[1]),int(sys.argv[2])
    for n in range(lo,hi+1,2):
        print(*analyse(n)); sys.stdout.flush()
