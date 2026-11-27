#!/usr/bin/env python3
"""Reconstruct and verify the small ingredients and cut certificates."""
from functools import lru_cache


def edge(a,b):
    assert a != b
    return min(a,b),max(a,b)


def neighbors(E, x):
    return sorted(b if a == x else a for a,b in E if x in (a,b))


def blowup(E, x):
    nbr = neighbors(E,x)
    assert 1 <= len(nbr) <= 3
    a = max(v for e in E for v in e) + 1
    p,q,r = a,a+1,a+2
    F = {e for e in E if x not in e}
    F.update({edge(p,q),edge(q,r),edge(r,p)})
    F.update(edge(v,w) for v,w in zip(nbr,(p,q,r)))
    return F,(p,q,r)


def hajos(E, uv, B, xy):
    u,v = uv; x,y = xy
    assert edge(u,v) in E and edge(x,y) in B
    assert len(neighbors(E,u))+len(neighbors(B,x))<=5
    start=max(a for e in E for a in e)+1
    rename={w:start+i for i,w in enumerate(sorted({a for e in B for a in e}-{x}))}
    rename[x]=u
    F=E-{edge(u,v)}
    F.update(edge(rename[a],rename[b]) for a,b in B if (a,b)!=edge(x,y))
    F.add(edge(v,rename[y]))
    return F,rename


def bits(mask):
    while mask:
        b=mask&-mask
        yield b.bit_length()-1
        mask ^= b


def three_edge_color(E):
    el=sorted(E)
    star={}
    for i,(a,b) in enumerate(el):
        for v in (a,b):
            star[v]=star.get(v,0)|(1<<i)
    adj=[(star[a]|star[b])^(1<<i) for i,(a,b) in enumerate(el)]
    colors=[0,0,0]
    def rec(rem, used):
        if not rem:
            return True
        i=max(bits(rem),key=lambda i: (sum(bool(adj[i]&c) for c in colors),(adj[i]&rem).bit_count()))
        bit=1<<i
        for j in range(min(used+1,3)):
            if not adj[i]&colors[j]:
                colors[j] ^= bit
                if rec(rem^bit,max(used,j+1)):
                    return True
                colors[j] ^= bit
        return False
    return rec((1<<len(el))-1,0)


def check_critical(E):
    assert not three_edge_color(E), E
    for e in E:
        assert three_edge_color(E-{e}), (e,E)


def exists_terminal_path(E,p,q):
    vertices=sorted({a for e in E for a in e})
    re={v:i for i,v in enumerate(vertices)}
    A=[sum(1<<re[w] for w in neighbors(E,v)) for v in vertices]
    @lru_cache(None)
    def rec(v, rem):
        if not rem:
            return v == re[q]
        if v == re[q]:
            return False
        return any(rec(w,rem^(1<<w)) for w in bits(rem&A[v]))
    return rec(re[p],(1<<len(vertices))-1-(1<<re[p]))


def main():
    diamond={(0,2),(0,3),(1,2),(1,3),(2,3)}
    J=diamond|{(0,4),(1,4)}
    small,(p,q,r)=blowup(J,4)
    A,d=hajos(small,(p,q),J,(4,1))
    assert len({a for e in A for a in e})==11 and len(A)==16
    D={d[i] for i in range(4)}
    assert {e for e in A if len(set(e)&D)==1}=={edge(p,d[0]),edge(q,d[1])}
    assert neighbors(A,r)==sorted([p,q])
    assert not exists_terminal_path({e for e in A if r not in e},p,q)
    for E in (J,small,A):
        check_critical(E)
    F=J.copy()
    branches=[]
    for u,v in [(0,2),(0,3),(1,3)]:
        F,ren=hajos(F,(u,v),A,(r,p))
        vertices={ren[x] for x in ren if x!=r}
        branches.append((vertices, {edge(u,ren[q]),edge(v,ren[p])}))
    assert len(set.union(*[x for x,_ in branches]))==30
    for B,cut in branches:
        assert {e for e in F if len(set(e)&B)==1}==cut
    R={a for e in A for a in e}-{p,q,r}-D
    assert len(R)==4
    assert len([e for e in A if set(e)<=D])==5
    assert len([e for e in A if set(e)<=R])==5
    assert not any(set(e)&D and set(e)&R for e in A)
    V=sorted({a for e in F for a in e})
    assert len(V)==35 and len(F)==52
    assert max(len(neighbors(F,v)) for v in V)==3
    check_critical(F)
    print('Checked four edge-critical graphs, both diamond edge sets, and all three two-edge branch cuts.')
    print('Directly verified the 35-vertex, 52-edge witness for chromatic index four and every edge deletion.')

if __name__=='__main__':
    main()
