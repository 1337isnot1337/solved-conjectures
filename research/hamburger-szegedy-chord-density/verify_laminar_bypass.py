"""Cross-check closure compression and chord split arithmetic."""
from collections import deque
from itertools import combinations
from random import Random

def edge(x,y):
    return tuple(sorted((x,y)))

def cut(weights, implications):
    n=len(weights); src=n; sink=n+1
    cap=[{} for _ in range(n+2)]
    def arc(a,b,w):
        cap[a][b]=cap[a].get(b,0)+w
        cap[b].setdefault(a,0)
    bound=sum(map(abs,weights))+1
    for i,w in enumerate(weights):
        if w>0: arc(src,i,w)
        if w<0: arc(i,sink,-w)
    for x,y in implications: arc(x,y,bound)
    flow=0
    while True:
        pred={src:src}
        todo=deque([src])
        while todo and sink not in pred:
            a=todo.popleft()
            for b,k in cap[a].items():
                if k and b not in pred:
                    pred[b]=a; todo.append(b)
        if sink not in pred:
            return sum(max(0,w) for w in weights)-flow
        v=sink; path=[]
        while v!=src:
            u=pred[v]; path.append((u,v)); v=u
        f=min(cap[u][v] for u,v in path)
        flow+=f
        for u,v in path: cap[u][v]-=f; cap[v][u]+=f

def score(S,E):
    return sum(u in S and v in S for u,v in E)-2*len(S)

def check(n,E,intervals):
    V=set(range(n)); C={edge(i,(i+1)%n) for i in V}; ch=E-C
    orig=score(V,E)
    for a,b in ch:
        X=set(range(a+1,b)); Y=V-X-{a,b}
        crossing=sum((u in X and v in Y) or (v in X and u in Y) for u,v in ch)
        assert score(X|{a,b},E)+score(Y|{a,b},E)==orig-3-crossing
        if 2*len(ch)<n-2:
            assert max(score(X|{a,b},E),score(Y|{a,b},E))>orig
    X=[set(range(a+1,b)) for a,b in intervals]
    arcs=[set(range(a,b)) for a,b in intervals]
    child=[[] for _ in X]
    for j in range(len(X)):
        parents=[i for i in range(len(X)) if arcs[j]<arcs[i]]
        if parents: child[min(parents,key=lambda i:len(arcs[i]))].append(j)
    D=[X[i]-set().union(*(X[j] for j in child[i])) for i in range(len(X))]
    dg=[sum(v in e for e in E) for v in V]
    weights=[sum(2-dg[v] for v in P)+sum(a in P and b in P for a,b in E) for P in D]
    implications=[(i,j) for i,Q in enumerate(child) for j in Q]
    for i,j in combinations(range(len(X)),2):
        between=sum((a in D[i] and b in D[j]) or (b in D[i] and a in D[j])
                    for a,b in E)
        if between:
            implications.extend([(len(weights),i),(len(weights),j)])
            weights.append(between)
    brute=0
    for mask in range(1<<len(X)):
        S=V-set().union(*(X[i] for i in range(len(X)) if mask>>i&1))
        order=sorted(S)
        assert len(order)>=3
        assert all(edge(u,v) in E for u,v in zip(order,order[1:]+order[:1]))
        brute=max(brute,score(S,E)-orig)
    assert brute==cut(weights,implications)
    return 1<<len(X),len(ch)

if __name__=='__main__':
    r=Random(642); states=splits=0
    for _ in range(400):
        n=r.randrange(6,17)
        J=[]; E={edge(i,(i+1)%n) for i in range(n)}
        for a,b in combinations(range(n),2):
            if (a,b) not in E and r.random()<.22: E.add((a,b))
        pool=[(a,b) for a,b in E if 0<=a<b<=n-2 and b-a>=2]
        r.shuffle(pool)
        for a,b in pool:
            S=set(range(a,b))
            if all(not S&T or S<=T or T<=S for T in (set(range(x,y)) for x,y in J)):
                J.append((a,b))
        a,b=check(n,E,J)
        states+=a; splits+=b
    print(f'{states} laminar selections and {splits} chord splits checked')
