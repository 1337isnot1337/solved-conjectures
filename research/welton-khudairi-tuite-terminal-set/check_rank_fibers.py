"""Exact graph-distance regression for the rank-fiber constructions."""
from collections import deque
from itertools import combinations, product

def rank(matrix, p):
    A = [row[:] for row in matrix]; k = 0
    for i in range(len(A)):
        j = next((j for j in range(k, len(A)) if A[j][i]), None)
        if j is not None:
            A[k], A[j] = A[j], A[k]
            for j in range(k+1, len(A)):
                x = A[j][i]*pow(A[k][i], -1, p) % p
                if x: A[j] = [(a-x*b) % p for a,b in zip(A[j],A[k])]
            k += 1
    return k

def check(n, p, cap, alternating):
    coords = [(i,j) for i in range(n) for j in range(i+alternating,n)]
    values = list(product(range(p), repeat=len(coords)))
    index = ({x:i for i,x in enumerate(values)} if p != 2 else None)
    mat = []; isalt = []
    for v in values:
        A = [[0]*n for _ in range(n)]
        for (i,j),e in zip(coords,v):
            A[i][j] = e; A[j][i] = (-e if alternating else e) % p
        mat.append(rank(A,p))
        isalt.append(all(A[i][i]==0 for i in range(n)))
    if p == 2:
        def add(a,b): return a ^ b
        diff = add
    else:
        def add(a,b): return index[tuple((x+y)%p for x,y in zip(values[a],values[b]))]
        def diff(a,b): return index[tuple((x-y)%p for x,y in zip(values[a],values[b]))]
    gen = [i for i,r in enumerate(mat) if 0<r<=cap]
    D = [-1]*len(values); D[0]=0; queue=deque([0]); unseen=len(values)-1
    while queue and unseen:
        x = queue.popleft()
        for e in gen:
            y=add(x,e)
            if D[y] < 0: D[y] = D[x]+1; queue.append(y); unseen-=1
    for r,a,d in zip(mat,isalt,D):
        extra = r>0 and not alternating and p==2 and cap%2==1 and r%cap==0 and a
        assert d==(r+cap-1)//cap+extra, (r,a,d,n,p,cap,alternating)
    if not alternating and cap==1:
        keypos=[k for k,c in enumerate(coords) if c!=(n-1,n-1)]
    else:
        h=(cap//2)
        keypos=[k for k,(i,j) in enumerate(coords) if j<n-h]
    F={}
    for i,x in enumerate(values):
        F.setdefault(tuple(x[k] for k in keypos),[]).append(i)
    # Translation invariance means cross row distributions depend only on fiber difference.
    zero=next(iter(F.values()))
    flat={a[0]:len({D[diff(x,a[0])] for x in zero})==1 for a in F.values()}
    def flat_between(A,B):
        k=tuple(values[diff(A[0],B[0])][i] for i in keypos)
        return flat[F[k][0]]
    selected=[]
    for A in F.values():
        if all(flat_between(A,B) for B in selected): selected.append(A)
    for A,B,C in combinations(selected,3):
        abc=[D[diff(X[0],Y[0])] for X,Y in ((A,B),(B,C),(C,A))]
        assert sum(abc)>2*max(abc)
    nonselected=0
    S={x for A in selected for x in A}
    for A in F.values():
        if A[0] not in S:
            nonselected+=1
            B=next(B for B in selected if not flat_between(A,B))
            for x in A:
                ds={D[diff(x,y)] for y in B}
                assert len(ds)>1 and max(ds)-min(ds)==1
    print(n,p,cap,alternating,len(values),len(selected),nonselected,flush=True)

if __name__ == "__main__":
    for p,nmax in [(2,5),(3,3)]:
        for n in range(2,nmax+1):
            for s in range(1,n+1): check(n,p,s,False)
            for s in range(1,n//2+1): check(n,p,2*s,True)
