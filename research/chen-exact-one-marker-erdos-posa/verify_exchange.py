#!/usr/bin/env python3
"""Finite sanity checks for the residual-flow lemma, not a proof."""
from argparse import ArgumentParser
from collections import Counter
from itertools import combinations
import random
import networkx as nx

IN,OUT=0,1
def flow(g, roots, targets):
    n=nx.DiGraph()
    for v in g:
        n.add_edge((v,IN),(v,OUT),capacity=1)
    for u,v in g.edges:
        n.add_edge((u,OUT),(v,IN),capacity=1)
        n.add_edge((v,OUT),(u,IN),capacity=1)
    n.add_nodes_from(('s','t'))
    for v in roots: n.add_edge('s',(v,IN),capacity=1)
    for v in targets: n.add_edge((v,OUT),'t',capacity=1)
    k,f=nx.maximum_flow(n,'s','t')
    used={(v,w) for v in f if isinstance(v,tuple) for w,val in f[v].items()
          if isinstance(w,tuple) and val}
    ends={v for v in targets if f[(v,OUT)].get('t',0)}
    return k,used,ends

def replay(g, I, X, Y, Z):
    roots=set(I)|set(X)
    k,A,Z0=flow(g,roots,Z)
    assert k==len(roots)
    for x,y in zip(X,Y):
        assert flow(g,roots|{y},Z)[0]==k
        assert flow(g,(roots-{x})|{y},Z0)[0]==k
    j,B,ends=flow(g,set(I)|set(Y),Z0)
    assert j==k and ends==Z0, (I,X,Y,Z,Z0,k,j,ends,list(g.edges()))
    D=nx.MultiDiGraph()
    for u,v in sorted(B-A): D.add_edge(u,v)
    for u,v in sorted(A-B): D.add_edge(v,u)
    load=Counter()
    for x,y in zip(X,Y):
        options=nx.descendants(D,(y,IN))
        assert [z for z in X if (z,IN) in options]==[x]
        p=nx.shortest_path(D,(y,IN),(x,IN))
        for a,b in zip(p,p[1:]): D.remove_edge(a,b)
        out=[]
        for v,_ in p:
            if not out or out[-1]!=v:
                out.append(v)
        assert out[0]==y and out[-1]==x
        assert all(g.has_edge(u,v) for u,v in zip(out,out[1:]))
        load.update(set(out))
    assert max(load.values(),default=0)<=2

def seeded(seed, trials):
    rng=random.Random(seed)
    counts=Counter()
    for i in range(trials):
        n=14
        p=rng.choice((.10,.15,.22,.3))
        g=nx.Graph()
        g.add_nodes_from(range(n))
        g.add_edges_from((a,b) for a,b in combinations(range(n),2) if rng.random()<p)
        order=list(range(n)); rng.shuffle(order)
        Z=set(order[:5])
        I=set(order[5:5+rng.randrange(3)])
        U=[v for v in order[5:] if v not in I]
        if flow(g,I,Z)[0]!=len(I): continue
        k=len(I)
        active=[u for u in U if flow(g,I|{u},Z)[0]==k+1]
        rr=[(a,b) for a,b in combinations(active,2) if flow(g,I|{a,b},Z)[0]==k+1]
        parallel=[(a,b) for a,b in combinations(active,2) if (a,b) in rr]
        rng.shuffle(parallel)
        pairs=[]
        for a,b in parallel:
            proposed=set(I)|{x for x,_ in pairs}|{a}
            if len(proposed)==k+len(pairs)+1 and flow(g,proposed,Z)[0]==len(proposed):
                pairs.append((a,b))
        if not pairs: continue
        X,Y=map(list,zip(*pairs))
        replay(g,I,X,Y,Z)
        counts[k,len(X)]+=1
    return counts

if __name__=='__main__':
    ap=ArgumentParser()
    ap.add_argument('--seed',type=int,default=1011)
    ap.add_argument('--trials',type=int,default=400)
    a=ap.parse_args()
    rows=seeded(a.seed,a.trials)
    assert any(i and t>=2 for i,t in rows)
    print('seed',a.seed,'trials',a.trials,'verified',sum(rows.values()))
    print('counts by (contraction size, number of residual pairs):',sorted(rows.items()))
