from collections import deque
import itertools
import math

P = [(0,1),(0,2,3),tuple([0]+list(range(4,15))),(8,15),tuple([0]+list(range(16,31)))]
E = [(a,b) for p in P for a,b in zip(p,p[1:])]
V=set(range(31))
adj={v:set() for v in V}
for a,b in E: adj[a].add(b);adj[b].add(a)
assert len(E)==30 and sum(map(len,adj.values()))==60

def comps_without(v):
    remain=V-{v};comps=[]
    while remain:
        start=next(iter(remain));stack=[start];remain.remove(start);length=0
        while stack:
            x=stack.pop();length+=1
            for y in adj[x] & remain: remain.remove(y);stack.append(y)
        comps.append(length)
    return comps

col={0:0}; q=deque([0]);
while q:
    u=q.popleft()
    for v in adj[u]:
        if v not in col: col[v]=1-col[u];q.append(v)
A={v for v in V if col[v]==1}; B=V-A
assert len(A)==16 and len(B)==15
byclass={}
for v in V:
    if all(c%2==0 for c in comps_without(v)):
        byclass.setdefault(('A' if v in A else 'B',len(adj[v])),[]).append(v)
print('parities sizes',len(A),len(B))
print('deletion classes',byclass)
single = sum(2**len(adj[v]) * (1 if v in A else -1) for vs in byclass.values() for v in vs)
print('two colors: -1, third-color contributions:',single,'total',single-1)
assert single-1==29
