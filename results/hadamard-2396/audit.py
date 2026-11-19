"""Independent direct cyclic-correlation audit of the order-27 exclusion."""
from collections import defaultdict
from itertools import product
from pathlib import Path

import numpy as np


def square_classes(n,p):
    squares={k*k%p for k in range(1,p)}
    return np.array([0 if x%p==0 else 1 if x%p in squares else 2 for x in range(n)])


def direct(batch,cells,shifts):
    expanded=np.asarray(batch,dtype=np.int32)[:,cells]
    return np.stack([(expanded*np.roll(expanded,s,axis=1)).sum(axis=1) for s in shifts],axis=1)


def first():
    cells=3*square_classes(133,7)+square_classes(133,19)
    shifts=[0,1,7,19,8]
    digits=range(-9,10,2)
    chunks=defaultdict(list)
    candidates=[]
    for v in product(digits,repeat=3):
        total=v[0]+9*(v[1]+v[2])
        energy=v[0]**2+9*(v[1]**2+v[2]**2)
        chunks[total].append((v,energy))
        candidates.append((v,total,energy))
    profiles=defaultdict(list)
    batch=[]
    def flush():
        for v,key in zip(batch,direct(batch,cells,shifts)):
            profiles[tuple(map(int,key))].append(v)
        batch.clear()
    for u,su,eu in candidates:
        for v,sv,ev in candidates:
            remain=2245-3*(eu+ev)
            if remain<19: continue
            for w,ew in chunks.get(1-3*(su+sv),()):
                if ew<=remain:
                    batch.append(w+u+v)
                    if len(batch)==512: flush()
    if batch: flush()
    target=[2378,-18,-18,-18,-18]
    pairs={r+s for key,rr in profiles.items()
           for ss in [profiles.get(tuple(x-y for x,y in zip(target,key)),())]
           for r in rr for s in ss}
    assert len(pairs)==32
    recorded=np.loadtxt(Path(__file__).with_name('quotient133.pairs'),dtype=int)
    assert pairs==set(map(tuple,recorded))
    for p in pairs:
        a,b=np.array(p).reshape(2,9)[:,cells]
        assert [int(a@np.roll(a,t)+b@np.roll(b,t)) for t in range(133)]==[2378]+[-18]*132
    return pairs


def second(pairs):
    # For each original row and each seven-class enumerate the possible three
    # projected values directly. Use all 21 shifts without rotation reduction.
    cells=3*(np.arange(21)%3)+square_classes(21,7)
    cache={}
    def signatures(row):
        if row in cache: return cache[row]
        groups=[]
        target=2282
        for i in range(3):
            fibers=[[v for v in product((-3,-1,1,3),repeat=3) if sum(v)==q]
                    for q in row[3*i:3*i+3]]
            choices={tuple(a+9*(b+c) for a,b,c in zip(u,v,w))
                     for u,v,w in product(*fibers)}
            m=(1,3,3)[i]
            groups.append([(v,m*sum(a*a for a in v)) for v in choices
                           if m*sum(a*a for a in v)<=target-21])
        batches=[]
        result=set()
        def flush():
            result.update(tuple(map(int,k)) for k in direct(batches,cells,range(21)))
            batches.clear()
        for (a,ea),(b,eb),(c,ec) in product(*groups):
            if ea+eb+ec<=target-21:
                batches.append(tuple(v for layer in zip(a,b,c) for v in layer))
                if len(batches)==512: flush()
        if batches: flush()
        cache[row]=result
        return result
    for p in sorted(pairs):
        left,right=signatures(p[:9]),signatures(p[9:])
        assert all(tuple(t-x for t,x in zip([2282]+[-114]*20,key)) not in right for key in left)


if __name__=='__main__':
    pairs=first()
    second(pairs)
    print('32 ordered 133-vectors recovered independently and tested at all shifts.')
    print('All 32 independently fail the length-21 marginal, using every cyclic shift.')
    assert [(a,b) for a in range(105) for b in range(105-a) if 440*a+528*b==2200]==[(5,0)]
    assert 104+22*10+92<22**2 and 2*22>26+2
    print('Length-598 sparse compression constants verified.')
