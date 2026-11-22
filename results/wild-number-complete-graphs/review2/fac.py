"""Own near-1-factorization generator. col[x][y] = colour (a vertex) of edge xy; colour u misses vertex u."""
import random
def gk(m):
    # 1-factorization of K_m (m even), vertices 0..m-2 and inf=m-1; colour i: {inf,i} and {i-k,i+k}
    q=m-1; inf=m-1; c=[[None]*m for _ in range(m)]
    for i in range(q):
        c[inf][i]=c[i][inf]=i
        for k in range(1,q//2+1):
            a,b=(i-k)%q,(i+k)%q; c[a][b]=c[b][a]=i
    return c
def kempe(c,m,steps,rng):
    for _ in range(steps):
        a,b=rng.sample(range(m-1),2); x=rng.randrange(m)
        # alternating a/b cycle through x
        cyc=[x]; cur=x; col=a
        while True:
            nxt=[y for y in range(m) if y!=cur and c[cur][y]==col][0]
            if nxt==x: break
            cyc.append(nxt); cur=nxt; col= b if col==a else a
        L=len(cyc)
        for i in range(L):
            p,q=cyc[i],cyc[(i+1)%L]
            c[p][q]=c[q][p]= b if c[p][q]==a else a
    return c
def near(n,kind='cyc',seed=0):
    """near-1-factorization of K_n, n odd; returns col with col[x][y] = missed vertex of that colour"""
    if kind=='cyc':
        return [[None if x==y else ((x+y)*((n+1)//2))%n for y in range(n)] for x in range(n)]
    if kind=='dbl': return near2(n,seed)
    rng=random.Random(seed); m=n+1; c=gk(m); kempe(c,m,40*m,rng)
    inf=m-1; miss={c[inf][y]:y for y in range(n)}
    return [[None if x==y else miss[c[x][y]] for y in range(n)] for x in range(n)]
def check(col,n):
    for u in range(n):
        es=[(x,y) for x in range(n) for y in range(x+1,n) if col[x][y]==u]
        cov=set(v for e in es for v in e)
        assert len(es)==(n-1)//2 and len(cov)==n-1 and u not in cov, (u,)
    return True
def partner(col,n):
    """P[u][x] = M_u(x) or None"""
    return [[None if x==u else next(y for y in range(n) if y!=x and col[x][y]==u) for x in range(n)] for u in range(n)]
def find_F(col,n,f,rng):
    while True:
        F=rng.sample(range(n),f)
        cols=[col[a][b] for i,a in enumerate(F) for b in F[i+1:]]
        if len(set(cols))<len(cols): continue
        if any(col[a][b] in F for i,a in enumerate(F) for b in F[i+1:]): continue  # invalid triple {u,a,b}
        return sorted(F)
if __name__=='__main__':
    for n in [7,9,13,15,21,25]:
        for kind in ['cyc','kem']:
            check(near(n,kind,1),n)
    print('ok')

def doubling(m):
    """1-factorization of K_m (m even) via two halves + K_{r,r}; far from perfect, so Kempe switches mix it."""
    r=m//2; c=[[None]*m for _ in range(m)]
    def setc(x,y,v): c[x][y]=c[y][x]=v
    if r%2==0:
        h=gk(r)
        for x in range(r):
            for y in range(x+1,r): setc(x,y,h[x][y]); setc(r+x,r+y,h[x][y])
        for i in range(r):
            for j in range(r): setc(i,r+j,r-1+(i+j)%r)
    else:
        for x in range(r):
            for y in range(x+1,r):
                v=((x+y)*((r+1)//2))%r; setc(x,y,v); setc(r+x,r+y,v)
            setc(x,r+x,x)
        for i in range(r):
            for j in range(r):
                if i!=j: setc(i,r+j,r-1+(j-i)%r)
    return c
def near2(n,seed):
    rng=random.Random(seed); m=n+1; c=doubling(m)
    for x in range(m):
        assert sorted(c[x][y] for y in range(m) if y!=x)==list(range(m-1))
    kempe(c,m,40*m,rng)
    inf=rng.randrange(m); miss={c[inf][y]:y for y in range(m) if y!=inf}
    vs=[v for v in range(m) if v!=inf]; idx={v:i for i,v in enumerate(vs)}
    return [[None if x==y else idx[miss[c[x][y]]] for y in vs] for x in vs]
