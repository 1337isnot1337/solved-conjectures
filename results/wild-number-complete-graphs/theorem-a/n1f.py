"""Near-1-factorizations of K_n (n odd) as symmetric idempotent Latin squares:
L[a][b] = colour of edge ab, colours named by their missing vertex, L[a][a]=a."""
import random
def gk(m):
    """GK_m: vertices 0..m-2 cyclic, m-1 = infinity; colour c: {c,inf} and {c+d,c-d}"""
    q=m-1; col=[[-1]*m for _ in range(m)]
    for c in range(q):
        col[c][m-1]=col[m-1][c]=c
        for d in range(1,m//2):
            a,b=(c+d)%q,(c-d)%q; col[a][b]=col[b][a]=c
    return col
def one_factorization(m, rnd, switches=None):
    """1-factorization of K_m (m even): GK_m followed by random Kempe-cycle switches"""
    col=gk(m); C=m-1
    at=[[0]*C for _ in range(m)]
    for a in range(m):
        for b in range(m):
            if a!=b: at[a][col[a][b]]=b
    if switches is None: switches=20*m*m
    for _ in range(switches):
        c,d=rnd.sample(range(C),2)
        v=rnd.randrange(m)
        cyc=[v]; cur=v; cc=c
        while True:
            nxt=at[cur][cc]
            cc = d if cc==c else c
            if nxt==v: break
            cyc.append(nxt); cur=nxt
        k=len(cyc)
        for i in range(k):
            a,b=cyc[i],cyc[(i+1)%k]
            nc= d if col[a][b]==c else c
            col[a][b]=col[b][a]=nc; at[a][nc]=b; at[b][nc]=a
    return col
def near_from_1f(col):
    m=len(col); n=m-1; inf=m-1
    # colour c misses vertex p(c) = partner of inf in colour c
    miss={col[inf][v]:v for v in range(n)}
    L=[[0]*n for _ in range(n)]
    for a in range(n):
        for b in range(n):
            L[a][b]= a if a==b else miss[col[a][b]]
    return L
def random_near(n, seed):
    rnd=random.Random(seed)
    L=near_from_1f(one_factorization(n+1,rnd))
    # random relabelling
    p=list(range(n)); rnd.shuffle(p)
    M=[[0]*n for _ in range(n)]
    for a in range(n):
        for b in range(n): M[p[a]][p[b]]=p[L[a][b]]
    return M
def cyclic(n):
    # Z_n, colour c pairs a,b with a+b = 2c; missing c
    inv2=(n+1)//2
    return [[((a+b)*inv2)%n for b in range(n)] for a in range(n)]
def affine_minus(k):
    # F_2^k, colour d (d!=0) pairs x, x^d; delete vertex 0: colour d misses d
    n=2**k-1
    V=list(range(1,2**k))
    idx={v:i for i,v in enumerate(V)}
    return [[idx[a] if a==b else idx[a^b] for b in V] for a in V]
def steiner(n, rnd=None):
    # Steiner quasigroup from a (Bose/Skolem-free) STS via simple random hill-climb (Stinson)
    rnd=rnd or random.Random(0)
    assert n%6 in (1,3)
    # Stinson hill-climbing for STS
    T={}  # pair -> third
    live=[set(range(n)) - {v} for v in range(n)]  # live points paired with v
    nb=0; target=n*(n-1)//6
    blocks=set()
    while nb<target:
        xs=[v for v in range(n) if live[v]]
        x=rnd.choice(xs)
        y,z=rnd.sample(sorted(live[x]),2) if len(live[x])>=2 else (None,None)
        if y is None: continue
        key=(min(y,z),max(y,z))
        if z in live[y]:
            blocks.add(tuple(sorted((x,y,z)))); nb+=1
            for a,b in ((x,y),(x,z),(y,z)): live[a].discard(b); live[b].discard(a)
        else:
            # y,z already in block {y,z,w}; replace it
            w=[b for b in blocks if y in b and z in b][0]
            blocks.remove(w); w3=[c for c in w if c not in (y,z)][0]
            for a,b in ((y,w3),(z,w3)): live[a].add(b); live[b].add(a)
            blocks.add(tuple(sorted((x,y,z))))
            for a,b in ((x,y),(x,z)): live[a].discard(b); live[b].discard(a)
    L=[[a if a==b else -1 for b in range(n)] for a in range(n)]
    for (a,b,c) in blocks:
        L[a][b]=L[b][a]=c; L[a][c]=L[c][a]=b; L[b][c]=L[c][b]=a
    return L
def check(L):
    n=len(L)
    for a in range(n):
        assert L[a][a]==a and sorted(L[a])==list(range(n))
        for b in range(n): assert L[a][b]==L[b][a]
    return True
if __name__=="__main__":
    for n in (13,15,21,31):
        check(random_near(n,1)); check(cyclic(n))
    check(affine_minus(4)); check(affine_minus(5)); check(steiner(15)); check(steiner(19))
    print("ok")
