"""Exercise the rotation-capture certificate on small bipartite graphs."""
from itertools import combinations
from random import Random

def cycles(adj):
    for root in range(len(adj)):
        def visit(path, unseen):
            last=path[-1]
            if len(path)>=4 and root in adj[last] and path[1]<last:
                yield path
            for v in adj[last] & unseen:
                yield from visit(path+(v,), unseen-{v})
        yield from visit((root,),set(range(root+1,len(adj))))

def endpoints(adj, P):
    seen={P}
    todo=[P]
    out=set()
    while todo:
        Q=todo.pop()
        v=Q[-1]; out.add(v)
        for i in range(len(Q)-2):
            if Q[i] in adj[v]:
                R=Q[:i+1]+Q[i+1:][::-1]
                if R not in seen:
                    seen.add(R); todo.append(R)
    return out

def check(adj):
    d=min(map(len,adj)); assert d>=3
    for C in cycles(adj):
        S=set(C)
        chords=sum(len(adj[v]&S) for v in C)//2-len(C)
        for j in range(len(C)):
            A=endpoints(adj,C[j:]+C[:j])
            B=set.union(*(adj[v] for v in A))
            if not B<=S:
                continue
            assert A.isdisjoint(B)
            assert len(B)<=2*len(A)-1
            assert chords>=sum(len(adj[v])-2 for v in A)
            return
    raise AssertionError('no certificate found')

def incidence(m,E):
    adj=[set() for _ in range(2*m)]
    for u,v in E: adj[u].add(v);adj[v].add(u)
    return adj

if __name__=='__main__':
    m=4
    K={(i,m+j) for i in range(m) for j in range(m)}
    count=0
    for k in range(m+1):
        for F in combinations(K,k):
            if len({u for e in F for u in e})==2*k:
                check(incidence(m,K-set(F))); count+=1
    rng=Random(642)
    for m in (5,6):
        accepted=0
        while accepted<200:
            E={(i,m+j) for i in range(m) for j in range(m) if rng.random()<.72}
            a=incidence(m,E)
            if min(map(len,a))>=3:
                check(a); accepted+=1; count+=1
    print(f'{count} bipartite rotation-capture certificates checked')
