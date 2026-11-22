"""Independent generator of near-1-factorizations of K_n (n odd).
Representation: col[a][b] = u, the colour of edge ab, where colours are identified with the
vertex they miss (each vertex misses exactly one colour in a near-1-factorization).
mate[u][x] = partner of x in colour u, or -1 if x == u."""
import random, itertools

def cyclic(n):
    inv2 = pow(2, -1, n)
    col = [[-1]*n for _ in range(n)]
    for a in range(n):
        for b in range(n):
            if a != b:
                col[a][b] = ((a+b)*inv2) % n
    return col

def one_factorization_GK(m):
    """GK_m (m even): vertices 0..m-2 cyclic plus infinity m-1; colour classes 0..m-2."""
    k = m-1
    F = [[-1]*m for _ in range(m)]
    for c in range(k):
        F[c][m-1] = F[m-1][c] = c
        for d in range(1, m//2):
            a, b = (c+d) % k, (c-d) % k
            F[a][b] = F[b][a] = c
    return F

def kempe(F, rnd, steps):
    m = len(F)
    for _ in range(steps):
        c1, c2 = rnd.sample(range(m-1), 2)
        v = rnd.randrange(m)
        # alternating cycle through v in colours c1,c2
        cyc = [v]; x = v; c = c1
        while True:
            y = next(w for w in range(m) if w != x and F[x][w] == c)
            if y == v: break
            cyc.append(y); x = y; c = c2 if c == c1 else c1
        L = len(cyc)
        for i in range(L):
            a, b = cyc[i], cyc[(i+1) % L]
            F[a][b] = F[b][a] = c2 if F[a][b] == c1 else c1
    return F

def delete_vertex(F, x):
    """near-1-factorization of K_{m-1}; relabel colours by missed vertex."""
    m = len(F); V = [v for v in range(m) if v != x]
    idx = {v: i for i, v in enumerate(V)}
    # colour c misses vertex y with F[x][y] == c
    miss = {F[x][y]: idx[y] for y in V}
    n = m-1
    col = [[-1]*n for _ in range(n)]
    for a in V:
        for b in V:
            if a != b:
                col[idx[a]][idx[b]] = miss[F[a][b]]
    return col

def random_nf(n, rnd, steps=None):
    F = one_factorization_GK(n+1)
    kempe(F, rnd, steps if steps is not None else 3*n)
    return delete_vertex(F, rnd.randrange(n+1))

def check(col):
    n = len(col)
    for u in range(n):
        deg = [0]*n
        for a in range(n):
            for b in range(a+1, n):
                if col[a][b] == u: deg[a] += 1; deg[b] += 1
        assert deg[u] == 0 and all(deg[x] == 1 for x in range(n) if x != u), u
    return True

def mates(col):
    n = len(col)
    M = [[-1]*n for _ in range(n)]
    for a in range(n):
        for b in range(n):
            if a != b: M[col[a][b]][a] = b
    return M
