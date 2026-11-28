"""Check local Hamilton switches preserve contiguous footprints and their cyclic order."""
from itertools import product

def fixtures(order):
    tour=[]
    members={}
    for i,m in enumerate(order):
        footprint=[(i,j) for j in range(2*m+1)]
        tour.extend(footprint+[(i,-1)])
        members[i]=set(footprint)
    return tour,members

def check_case(sizes):
    tour,B=fixtures(sizes)
    N=len(tour)
    edges=list(zip(tour,tour[1:]+tour[:1]))
    tested=0
    for i,(x,y) in enumerate(edges):
        footprint=x[0] if x[1]>=0 else y[0]
        for j,(u,v) in enumerate(edges):
            if i%2==j%2 or len({x,y,u,v})<4 or not {u,v}<=B[footprint]:
                continue
            E=[e for k,e in enumerate(edges) if k not in (i,j)]+[(x,u),(y,v)]
            a={w:set() for w in tour}
            for p,q in E:
                assert (p[1]+q[1])%2==1
                a[p].add(q);a[q].add(p)
            assert all(len(A)==2 for A in a.values())
            start=tour[0]; walk=[start]; prev=start; curr=min(a[start])
            while curr!=start:
                assert curr not in walk
                walk.append(curr)
                prev,curr=curr,next(iter(a[curr]-{prev}))
            assert len(walk)==N
            for k,F in B.items():
                cross=[(p,q) for p,q in E if (p in F)!=(q in F)]
                outside={q if p in F else p for p,q in cross}
                assert len(cross)==2 and outside=={(k,-1),((k-1)%len(sizes),-1)}
                assert all(p[1]%2==0 for p in F if any(q not in F for q in a[p]))
            tested+=1
    return tested

if __name__=='__main__':
    n=sum(check_case(sizes) for k in (3,4,5) for sizes in product(range(1,4),repeat=k))
    print(f'{n} admissible footprint switches checked')
