#!/usr/bin/env python3
import argparse
from itertools import combinations
from pathlib import Path
import json
p=argparse.ArgumentParser()
p.add_argument('n',type=int)
p.add_argument('shape',help='plus-separated cycle lengths for color zero')
p.add_argument('--complement',help='optional JSON list of complement edges')
p.add_argument('--output',default='query.cnf')
a=p.parse_args();n=a.n; k=(n-1)//2
assert n>=7 and n%2==1
shape=list(map(int,a.shape.split('+')))
assert sum(shape)==n and set(shape).isdisjoint({1,2,3,6})
E={e:i for i,e in enumerate(combinations(range(n),2))}
f=lambda u,v:1+(k+1)*E[tuple(sorted((u,v)))]
c=lambda u,v,j:f(u,v)+j+1
C=[]
for u,v in E:
 C.append([c(u,v,j) for j in range(k)])
 for i,j in combinations(range(k),2): C.append([-c(u,v,i),-c(u,v,j)])
for u,v,w in combinations(range(n),3):
 C.append([-f(u,v),-f(v,w),-f(u,w)])
 for x,y,z in [(u,v,w),(v,u,w),(w,u,v)]:
  for j in range(k): C.append([-c(x,y,j),-c(x,z,j),f(y,z)])
for v in range(n):
 neigh=[u for u in range(n) if u!=v]
 for u,w,x in combinations(neigh,3):
  for j in range(k): C.append([-c(v,u,j),-c(v,w,j),-c(v,x,j)])
i=0
for m in shape:
 cyc=list(range(i,i+m))
 for u,v in zip(cyc,cyc[1:]+cyc[:1]):C.append([c(u,v,0)])
 i+=m
# Fix order of colors around vertex 0; each remaining color has two incidences.
# A later color at first appearance must have an earlier-color appearance before it.
for v in range(1,n):
 for j in range(2,k): C.append([-c(0,v,j)]+[c(0,u,j-1) for u in range(1,v)])
if a.complement:
 F={tuple(sorted(e)) for e in json.loads(Path(a.complement).read_text())}
 C += [[f(u,v)*(1 if (u,v) in F else -1)] for u,v in E]
with open(a.output,'w') as fp:
 fp.write(f'p cnf {len(E)*(k+1)} {len(C)}\n')
 fp.write(''.join(' '.join(map(str,row))+' 0\n' for row in C))
