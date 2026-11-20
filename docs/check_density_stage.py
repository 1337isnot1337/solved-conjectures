"""Exact algebra check only; the analytic construction is proved in the note."""
from fractions import Fraction as F
from math import factorial

def log_jet(b):
    assert b[0] == 1
    g=[F(0)]
    for n in range(1,len(b)):
        g.append(b[n]-sum((F(j)*g[j]*b[n-j] for j in range(1,n)),F(0))/n)
    return g

def exp_jet(g):
    assert g[0] == 0
    b=[F(1)]
    for n in range(1,len(g)):
        b.append(sum((F(j)*g[j]*b[n-j] for j in range(1,n+1)),F(0))/n)
    return b

for N,K in [(5,16),(8,40),(12,75)]:
    b=[F(1,factorial(i)) if i<=N else F(0) for i in range(K+1)]
    assert exp_jet(log_jet(b))==b
    print(f'N={N}, K={K}: log/exp jets exact, {K-N} prescribed zeros verified')
print('PASS: finite algebra only; no assertion of analytic novelty or full conjecture')
