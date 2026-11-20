"""Small exact sanity checks for an all-parameter argument; not a conjecture search."""
from itertools import combinations

def graph(q,k):
    n=(2*k+1)*q+2
    adj=[set() for _ in range(n)]
    def edge(a,b):
        adj[a].add(b);adj[b].add(a)
    for a,b in combinations(range(q+1),2):edge(a,b)
    for j in range(k):
        base=q+1+2*q*j
        for a in range(base,base+q):
            for b in range(base+q,base+2*q):edge(a,b)
    return adj,{0,n-1}

for q,k in [(2,1),(2,2),(2,3),(4,1)]:
    adj,U=graph(q,k);tail=set(range(len(adj)))-U
    def modular(removed):
        W=set(range(len(adj)))-set(removed)
        return len({len(adj[v]&W)%(2*q) for v in W})==1
    minimum=next(d for d in range(len(tail)+1) if any(modular(R) for R in combinations(tail,d)))
    assert minimum==(k+1)*q,(q,k,minimum)
    print(f'q={q}, k={k}: minimum deletion {minimum}; predicted {(k+1)*q}')

def path_graph(q,m,k):
    n=m+q*(m-1)+2*k*q
    adj=[set() for _ in range(n)]
    def edge(a,b):
        adj[a].add(b);adj[b].add(a)
    for i in range(m-1):
        block=list(range(m+q*i,m+q*(i+1)))
        for a in block:
            edge(a,i);edge(a,i+1)
        for a,b in combinations(block,2):
            if (a-block[0])//2 != (b-block[0])//2:edge(a,b)
    base=m+q*(m-1)
    for j in range(k):
        lo=base+2*q*j
        for a in range(lo,lo+q):
            for b in range(lo+q,lo+2*q):edge(a,b)
        for a in range(lo,lo+2*q):
            for b in range(m,m+q):edge(a,b)
    return adj,set(range(m))

for q,m,k in [(2,3,1),(2,5,1),(4,3,1)]:
    adj,U=path_graph(q,m,k);tail=set(range(len(adj)))-U
    assert len({len(N)%q for N in adj})==1
    best=0
    for mask in range(1<<len(tail)):
        W=U|{v for i,v in enumerate(sorted(tail)) if mask>>i&1}
        if len({len(adj[v]&W)%(2*q) for v in W})==1:best=max(best,len(W))
    minimum=len(adj)-best
    assert minimum==q*(m-1+k),(q,m,k,minimum)
    print(f'path q={q}, m={m}, k={k}: minimum {minimum}; predicted {q*(m-1+k)}')
