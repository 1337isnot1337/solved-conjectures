"""Exact obstruction to termwise positivity in a permanent estimator."""
from math import prod

def sylvester(k):
    n=1<<k
    return [[(-1)**((i&j).bit_count()) for j in range(n)] for i in range(n)]

def term(h,x):
    return prod(x)*prod(sum(a*b for a,b in zip(row,x)) for row in h)

h=sylvester(4)
positive=[-1]*15+[1]
negative=[-1,-1,-1,-1,-1,-1,-1,1,-1,-1,-1,1,-1,1,1,1]
assert all(sum(a*b for a,b in zip(h[i],h[j]))==(16 if i==j else 0) for i in range(16) for j in range(16))
p=term(h,positive); q=term(h,negative)
assert p>0 and q<0
print({'order':16,'positive_vector':positive,'positive_term':p,'negative_vector':negative,'negative_term':q})
