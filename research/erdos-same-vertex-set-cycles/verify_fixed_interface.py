"""Check the finite quotient step, independently of the spectral routing theorem."""
from itertools import combinations, product
from collections import Counter, defaultdict

def terminals_and_balance(E, n):
    deg = Counter(v for e in E for v in e)
    if any(x > 2 for x in deg.values()):
        return None
    left = [sum(d for (b,s,i),d in deg.items() if (b,s)==(j,0)) for j in range(n)]
    right = [sum(d for (b,s,i),d in deg.items() if (b,s)==(j,1)) for j in range(n)]
    if left != right:
        return None
    return [{v for v,d in deg.items() if v[0]==j and d==1} for j in range(n)]

def adjacency(E):
    a = defaultdict(set)
    for v,w in E:
        a[v].add(w); a[w].add(v)
    return a

def components(a):
    unseen=set(a)
    while unseen:
        stack=[unseen.pop()]
        comp=set(stack)
        while stack:
            for v in a[stack.pop()] & unseen:
                unseen.remove(v); comp.add(v); stack.append(v)
        yield comp

def quotient(E, n):
    if terminals_and_balance(E,n) is None:
        return False
    a=adjacency(E)
    q={i:set() for i in range(n)}
    for comp in components(a):
        ends=[v for v in comp if len(a[v])==1]
        if len(ends)!=2:
            return False
        v,w=ends
        q[v[0]].add(w[0]); q[w[0]].add(v[0])
    return len(list(components(q)))==1

def pairings(U):
    if not U:
        yield []
    else:
        v=min(U)
        for w in sorted(U-{v}):
            for P in pairings(U-{v,w}):
                yield [(v,w)]+P

def brute(E, n):
    ports=terminals_and_balance(E,n)
    if ports is None or not all(ports):
        return False
    for scheme in product(*(pairings(U) for U in ports)):
        a=adjacency(E+[p for pairs in scheme for p in pairs])
        if all(len(a[v])==2 for v in a) and len(list(components(a)))==1:
            return True
    return False

def check():
    K = [((a,0,i),(b,1,j)) for a,b in [(0,1),(1,0)] for i,j in product(range(2),repeat=2)]
    subsets=[list(E) for k in range(len(K)+1) for E in combinations(K,k)]
    accepted=0
    for E in subsets:
        assert quotient(E,2)==brute(E,2), E
        accepted+=quotient(E,2)
    loops=[]
    for a in range(3):
        for s,i in product(range(2),repeat=2):
            loops.append(((a,s,i),((a+1)%3,1-s,2)))
    assert terminals_and_balance(loops,3) is not None
    assert not quotient(loops,3) and not brute(loops,3)
    links=[((i,0,3),((i+1)%3,1,3)) for i in range(3)]
    assert quotient(loops+links,3) and brute(loops+links,3)
    print(f"{len(subsets)} interfaces checked, {accepted} feasible; both three-block fixtures passed")

if __name__=='__main__':
    check()
