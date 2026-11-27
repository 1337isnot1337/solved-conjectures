"""An exact balanced parity graphon with different missing even palettes."""
from itertools import product, combinations
A=['110220','112002','021012','200121','201210','022101']
B=['101220','012102','121002','210120','200211','022011']
C=['001122','110022','202101','120201','212010','021210']
def hue(i,j):
 if i<6 and j<6:return int(A[i][j])
 if i>=6 and j>=6:return int(B[i-6][j-6])
 if i>=6:i,j=j,i
 return int(C[i][j-6])+3
for i in range(12):
 assert [sum(hue(i,j)==k for j in range(12)) for k in range(6)]==[2]*6
 assert all(hue(i,j)==hue(j,i) for j in range(12))
F={tuple(sorted({hue(i,j),hue(j,k),hue(k,i)})) for i,j,k in product(range(12),repeat=3)}
F={s for s in F if len(s)==3}
E={z for z in combinations(range(6),3) if sum(x>=3 for x in z)%2==0}
assert F<=E
print('present',sorted(F))
print('missing even',sorted(E-F))
assert E-F=={(0,3,4),(1,3,5),(1,4,5)}
