"""Exact certificate rejecting a proposed radial-monotonicity route.
Not a counterexample to Chollet's conjecture. Standard library only.
"""
from fractions import Fraction as F
from itertools import permutations
from math import factorial
from functools import reduce

def permanent(a):
    n=len(a)
    return sum((reduce(lambda p,i:p*a[i][s[i]],range(n),F(1))
                for s in permutations(range(n))),F(0))

n=6
row=[F(1),F(3,4),F(1,4),F(0),F(1,4),F(3,4)]
h=[[row[(i-j)%n] for j in range(n)] for i in range(n)]
q=permanent(h)
qmin=permanent([r[1:] for r in h[1:]])
# A is the Gram matrix of (1,zeta^j)/sqrt(2), zeta^6=1 primitive.
# Product polynomial has just its two endpoint monomials.
p=F(2*factorial(n),2**n)
# Removing one sixth root leaves coefficients of modulus one.
pmin=sum((F(factorial(k)*factorial(n-1-k),2**(n-1)) for k in range(n)),F(0))
log_derivative=2*n*(pmin/p-qmin/q)
assert (p,pmin,q,qmin)==(F(45,2),F(39,4),F(4005,256),F(51,8))
assert log_derivative==F(138,445)>0
assert q/p**2 == F(89,2880)<1
print('Exact radial log-derivative:',log_derivative)
print('Chollet ratio at endpoint:',q/p**2)
print('Radial monotonicity is false; Chollet remains unrefuted.')
