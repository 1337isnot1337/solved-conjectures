from itertools import combinations

Z = ((8,-1,-7),(-2,-8,-6),(-7,-1,-7),(-2,6,-8),
     (-5,-6,-7),(-5,4,-8),(7,3,-7),(3,6,-8),
     (7,-5,-6),(3,-8,-6))
E = {(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),
     (1,2),(1,4),(1,6),(1,8),(1,9),
     (2,3),(2,4),(2,5),(3,5),(3,6),(3,7),(3,8),
     (4,5),(4,9),(5,7),(6,7),(6,8),(7,9),(8,9)}
n = len(Z)
X = [[sum(a*b for a,b in zip(u,v)) for v in Z] for u in Z]
B = [[X[i][j] if (min(i,j),max(i,j)) in E else 0
      for j in range(n)] for i in range(n)]
assert all(B[i][j]>0 for i,j in E)
assert all(B[i][i]==0 for i in range(n))
assert all(B[i][j]==B[j][i]>=0 for i in range(n) for j in range(n))
assert all(e in E for e in combinations((0,4,5),2))
assert not any(all(e in E for e in combinations(q,2))
               for q in combinations(range(n),4))
T = sum(x*x for row in X for x in row)
S = sum(x*x for row in B for x in row)
I = sum(B[i][j]*X[i][j] for i in range(n) for j in range(n))
assert (S,T,I)==(278882,416343,278882)
assert 3*S-2*T==3960>0
assert B[0][4]*B[1][6] != B[1][4]*B[0][6]
assert all(row[2] < 0 for row in Z)
print('vertices:', n, 'edges:',len(E), 'clique number: 3')
print('S:',S,'T:',T,'inner product:',I,'3S-2T:',3*S-2*T)
print('factorization obstruction:',B[0][4]*B[1][6],B[1][4]*B[0][6])
print('all exact checks passed')
