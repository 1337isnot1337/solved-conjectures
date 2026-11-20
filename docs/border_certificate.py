"""Exact obstruction to coefficientwise Schur-border Chollet induction.
No third-party packages. Not a counterexample to Chollet's inequality.
"""
from itertools import permutations

def add(a,b):
    out=[0]*max(len(a),len(b))
    for i,x in enumerate(a):out[i]+=x
    for i,x in enumerate(b):out[i]+=x
    return out

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):out[i+j]+=x*y
    return out

def perpoly(a):
    out=[]
    for s in permutations(range(len(a))):
        term=[1]
        for i,j in enumerate(s):term=mul(term,a[i][j])
        out=add(out,term)
    return out

v=[1,-1,-1]
V=[[-1,-1],[1,-1],[-1,0]]
R=[[sum(x*y for x,y in zip(a,b)) for b in V] for a in V]
a=[[[R[i][j],0,v[i]*v[j]] for j in range(3)]+[[0,v[i]]] for i in range(3)]
a.append([[0,v[j]] for j in range(3)]+[[1]])
p=perpoly(a)
q=perpoly([[mul(x,x) for x in row] for row in a])
d=add(mul(p,p),[-x for x in q])
assert all(x==0 for x in p[1::2]+q[1::2]+d[1::2])
assert p[::2]==[8,8,6,24]
assert q[::2]==[24,40,168,112,110,12,24]
assert d[::2]==[40,88,-8,368,310,276,552]
print('permanent in t=u²:',p[::2])
print('squared-entry permanent:',q[::2])
print('difference:',d[::2])
print('Negative t² coefficient rules out coefficientwise induction, not Chollet.')
