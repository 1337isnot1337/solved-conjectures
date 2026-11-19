"""Replay projected walks and check all forced quotient branches using determinants."""
from itertools import combinations
from functools import cache
from math import gcd
from json import loads
from pathlib import Path
from collections import Counter

@cache
def index(rows):
    # Product of the nonzero Smith factors, i.e. index in the saturation.
    for k in (3,2,1):
        d=0
        for picked in combinations(rows,k):
            for cols in combinations(range(3),k):
                sub=[[r[i] for i in cols] for r in picked]
                if k==3:
                    (a,b,c),(e,f,g),(x,y,z)=sub
                    minor=a*(f*z-g*y)-b*(e*z-g*x)+c*(e*y-f*x)
                elif k==2:
                    (a,b),(c,e)=sub
                    minor=a*e-b*c
                else: minor=sub[0][0]
                d=gcd(d,minor)
        if d:return k,d
    return (0,1)

@cache
def member(rows,x):
    return index(rows)==index(rows+(x,))

def same(a,b):
    return index(a)==index(b) and all(member(a,x) for x in b) and all(member(b,x) for x in a)

edges=[(0,4),(4,1),(0,2),(0,3),(1,2),(1,3),(2,3)]
data={}
for line in Path(__file__).with_name('abelian-cert.jsonl').read_text().splitlines():
    rows,walk=loads(line)
    rows=tuple(map(tuple,rows))
    assert rows not in data
    data[rows]=walk
assert () in data
queue=[()]
seen=set()
while queue:
    rows=queue.pop()
    if rows in seen:continue
    seen.add(rows)
    walk=data[rows]
    assert len(walk) in (4, 8, 16, 32)
    pos=(0,0,0)
    hist={}
    for a,b in zip(walk,walk[1:]+walk[:1]):
        for old in hist.get(a,()):
            diff=tuple(x-y for x,y in zip(pos,old))
            assert not member(rows,diff)
            nxt=rows+(diff,)
            child=next((r for r in data if same(r,nxt)),None)
            assert child is not None
            queue.append(child)
        hist.setdefault(a,[]).append(pos)
        assert (a,b) in edges or (b,a) in edges
        pos=tuple(x+int((a,b)==e)-int((b,a)==e) for x,e in zip(pos,edges[4:]))
    assert member(rows,pos)
assert len(data)==len(seen)
print(len(seen),'reachable verified lattices;',dict(sorted(Counter(map(len,data.values())).items())),'by cycle length')
