"""Exact certificate excluding a generic inverse-sign proof of Brualdi's family."""
from itertools import combinations, permutations
import sympy as s

C=s.Matrix([[1,1,1,1,0],[1,1,1,1,0],[1,1,0,0,1]])
def permanent(M):
    return sum(s.prod(M[i,j] for i,j in enumerate(p))
               for p in permutations(range(M.rows)))
Q=s.zeros(5)
for i in range(5):
    for j in range(i):
        Q[i,j]=Q[j,i]=permanent(C[:,[a for a in range(5) if a not in (i,j)]])
assert Q.det()==192
assert Q.inv()[0,1]==-s.Rational(1,12)
for nr in range(1,4):
    for rows in combinations(range(3),nr):
        zero_cols=[j for j in range(5) if all(C[i,j]==0 for i in rows)]
        if zero_cols:
            assert nr+len(zero_cols)<=3
D3=s.Matrix([[0,1,-1],[-1,0,1],[1,-1,0]])
assert permanent(D3)==0
print('Strict-AF permanent kernel determinant:',Q.det())
print('Inverse off-diagonal entry:',Q.inv()[0,1])
print('Directed three-cycle cubic coefficient:',permanent(D3))
print('All exact diagnostic certificates passed; no Brualdi resolution is asserted.')
