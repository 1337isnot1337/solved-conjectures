from fractions import Fraction as Q
from math import comb, factorial
from weighted_bond_recurrence import compute

def expected(n,r):
    out=[Q(0)]*n
    def mul(f,g):
        return [sum(f[k]*g[j-k] for k in range(j+1)) for j in range(n)]
    def power(f,m):
        out=[Q(1)]+[Q(0)]*(n-1)
        for _ in range(m):out=mul(out,f)
        return out
    # e^{n z} L_{r-2}^{(1)}(z)^{-n}(r-1)^n
    E=[Q(n**j,factorial(j)) for j in range(n)]
    L=[Q((-1)**j * comb(r-2,j),factorial(j+1)) if j<=r-2 else Q(0) for j in range(n)]
    R=[Q(1)]+[Q(0)]*(n-1)
    for j in range(1,n):R[j]=-sum(L[k]*R[j-k] for k in range(1,j+1))
    b=mul(E,power(R,n))
    return [(-1)**j*factorial(n-1)//factorial(n-1-j)*b[j] for j in range(n)]

count=0
for n in range(1,9):
    G=[((1<<n)-1)^(1<<i) for i in range(n)]
    by_blocks=compute(G)
    for r in range(2,10):
        actual=[sum(c*__import__('math').prod(comb(r,j) for j in p) for p,c in by_blocks[n-d].items()) for d in range(n)]
        assert actual==expected(n,r), (n,r,actual,expected(n,r))
        assert all(abs(actual[j])**2>abs(actual[j-1]*actual[j+1]) for j in range(1,n-1))
        count+=1
print(f"PASS: {count} complete-graph cases; exact weighted-bond recurrence versus Laguerre coefficients")
