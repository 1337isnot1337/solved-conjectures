from collections import Counter
from itertools import combinations


def adj(edges):
    d = {}
    for a,b in edges:
        d.setdefault(a,[]).append(b)
        d.setdefault(b,[]).append(a)
    return d


def code(edges):
    d=adj(edges)
    def subtree(v,p):
        return "("+"".join(sorted(subtree(w,v) for w in d[v] if w!=p))+")"
    return min(subtree(v,None) for v in d)


def side(d,v,banned):
    got={v}
    stack=[v]
    while stack:
        v=stack.pop()
        for w in d[v]:
            if w not in got and w!=banned:
                got.add(w)
                stack.append(w)
    return got


models=windows=contracted=0
trees=[((0,1),)]
for n in range(2,13):
    ordinal=0
    for e in trees:
        d=adj(e)
        if 2 in map(len,d.values()): continue
        outer=[i for i,(v,w) in enumerate(e) if min(len(d[v]),len(d[w]))==1]
        inner=[i for i in range(len(e)) if i not in outer]
        if not inner: continue
        cap={i:1+((i+1)%3)*2 for i in outer}
        for m in range(1<<len(inner)):
            fixed={i for j,i in enumerate(inner) if m>>j&1}
            active=[i for i in range(len(e)) if i not in fixed]
            lengths={i:1000*(1<<j) for j,i in enumerate(active)}
            lengths.update({i:1+i%3 for i in fixed})
            total=1+sum(lengths.values())
            points=Counter()
            intervals=[]
            subsenses={}
            short={}
            for i,(a,b) in enumerate(e):
                for v,w in ((a,b),(b,a)):
                    vertices=side(d,v,w)
                    inside={k for k,(x,y) in enumerate(e) if x in vertices and y in vertices}
                    low=1+sum(lengths[k] for k in inside)
                    high=low+lengths[i]-1
                    if i in outer:
                        if len(d[v])==1:
                            low=cap[i]; high=lengths[i]
                        else:
                            low=total-lengths[i]; high=total-cap[i]
                    points[low-1]-=1
                    points[high]+=1
                    intervals.append((i,low,high))
                    if i in fixed:
                        key=frozenset(inside.intersection(active))
                        assert key not in short
                        short[key]=(i,low,high)
                    else:
                        for inds,pos,sign in ((inside,low-1,-1),(inside|{i},high,1)):
                            key=frozenset(inds.intersection(active))
                            if key and len(key)<len(active):
                                assert key not in subsenses
                                subsenses[key]=(pos,sign)
            assert not (short.keys() & subsenses.keys())
            for inds,(pos,sign) in subsenses.items():
                center=sum(lengths[k] for k in inds)
                assert abs(pos-center)<100
                assert points[pos]==sign
                assert [(x,c) for x,c in points.items() if c and abs(x-center)<100]==[(pos,sign)]
                windows+=1
            for inds,(i,low,high) in short.items():
                center=sum(lengths[k] for k in inds)
                assert abs(low-center)<100 and abs(high-center)<100
                assert high-low+1==lengths[i]
            # The full oriented histogram includes both sides even at n/2.
            # Removing known intervals leaves the contracted edges at their true multiplicities.
            for fixed_i in fixed:
                oriented=[(lo,hi) for i,lo,hi in intervals if i==fixed_i]
                assert sorted(oriented)==sorted((total-hi,total-lo) for lo,hi in oriented)
            contracted+=len(short)
            models+=1
    if n<12:
        more={}
        for e in trees:
            for i in range(n):
                trial=e+((i,n),)
                more.setdefault(code(trial),trial)
        trees=list(more.values())
print(f'{models} choices of reduced tree and fixed/active internal edges, {windows} isolated retained-endpoint windows, {contracted} directed contracted-edge splits, orders through 12 skeleton vertices.')
