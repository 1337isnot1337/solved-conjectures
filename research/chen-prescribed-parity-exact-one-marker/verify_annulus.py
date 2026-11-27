from itertools import combinations
from random import Random

def cycle(g,d):
    a,b=d,g-1-d
    return ([(a,i) for i in range(a,b)]+[(i,b) for i in range(a,b)]
            +[(b,i) for i in range(b,a,-1)]+[(i,a) for i in range(b,a,-1)])

def spoke(p,g,d):
    r,c=p
    dr,dc=(1,0) if r==0 else (-1,0) if r==g-1 else (0,1) if c==0 else (0,-1)
    return [(r+i*dr,c+i*dc) for i in range(d+1)]

def check(g,t,spec):
    boundary=cycle(g,0); order={p:i for i,p in enumerate(boundary)}
    load={}
    depth=0
    for endpoints in spec:
        angles=sorted(endpoints,key=order.get)
        pairs=[(angles[0],angles[1])]
        if len(angles)==4:
            first=set(endpoints[:2])
            for i in range(2):
                pairs=[(angles[i],angles[(i+1)%4]),(angles[(i+2)%4],angles[(i+3)%4])]
                if all((p in first) != (q in first) for p,q in pairs): break
            else: raise AssertionError('no adjacent pairing')
        own=set()
        for p,q in pairs:
            depth+=1
            assert depth<=2*t
            u,v=spoke(p,g,depth),spoke(q,g,depth)
            ring=cycle(g,depth)
            i,j=ring.index(u[-1]),ring.index(v[-1])
            arc=ring[i:j+1] if i<=j else ring[i:]+ring[:j+1]
            path=u[:-1]+arc+v[-2::-1]
            assert len(path)==len(set(path)) and not own.intersection(path)
            assert all(abs(r-s)+abs(c-d)==1 for (r,c),(s,d) in zip(path,path[1:]))
            own.update(path)
        for p in own:
            load[p]=load.get(p,0)+1
            assert load[p]<=2

def ports(g,t):
    a=2*t+1; b=g-1-a
    return [(r,c) for r,c in cycle(g,0) if a<=r<=b or a<=c<=b]

def main():
    g,t=9,1
    ps=ports(g,t); exact=0
    for endpoints in combinations(ps,4):
        for a,b in combinations(endpoints,2):
            check(g,t,[(a,b)+tuple(p for p in endpoints if p not in (a,b))])
            exact+=1
    for p,q in combinations(ps,2):
        check(g,t,[(p,q)]); exact+=1
    rng=Random(8794); rand=0
    for t in range(2,31):
        g=7*t+7; ps=ports(g,t)
        for _ in range(100):
            picked=iter(rng.sample(ps,4*t))
            spec=[tuple(next(picked) for _ in range(2 if rng.getrandbits(1) else 4)) for _ in range(t)]
            check(g,t,spec); rand+=1
    print(f'{exact} exhaustive one-demand arrangements; {rand} mixed multi-demand arrangements')
if __name__=='__main__':
    main()
