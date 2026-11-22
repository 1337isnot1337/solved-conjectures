import random
def partner(L):
    """P[u][a] = partner of a in colour u (or -1 if a==u)"""
    n=len(L); P=[[-1]*n for _ in range(n)]
    for a in range(n):
        for b in range(n):
            if a!=b: P[L[a][b]][a]=b
    return P
def bad_colours(L,P,blocks):
    n=len(L); lab=[0]*n
    for i,B in enumerate(blocks):
        for v in B: lab[v]=i
    k=len(blocks); bad=[]
    for u in range(n):
        par=list(range(k))
        def f(a):
            while par[a]!=a: par[a]=par[par[a]]; a=par[a]
            return a
        comps=k
        Pu=P[u]
        for a in range(n):
            b=Pu[a]
            if b>a:
                ra,rb=f(lab[a]),f(lab[b])
                if ra!=rb: par[ra]=rb; comps-=1
        if comps!=1: bad.append(u)
    return bad
def sizes(n):
    t=n//3; s=[3]*t
    for i in range(n-3*t): s[i]+=1
    return s
def random_partition(n,rnd,sz=None):
    sz=sz or sizes(n); p=list(range(n)); rnd.shuffle(p); out=[]; i=0
    for s in sz: out.append(p[i:i+s]); i+=s
    return out
