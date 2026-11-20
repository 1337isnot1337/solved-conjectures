"""Probe A: chromatic number of integer distance graphs G(Z,D) for near-tight D.
chi(G(D)) <= |D|+1 always.  chi = |D|+1 forces L(D) < 1/|D| (else the lonely-runner colouring works).
"""
from fractions import Fraction as F
from itertools import combinations
from pysat.solvers import Cadical153
import sys, time

def dist(x):  # distance of Fraction to nearest integer
    f = x - (x.numerator // x.denominator)
    return min(f, 1 - f)

def loneliness(D):
    best = F(0)
    D = sorted(D)
    seen = set()
    for i, a in enumerate(D):
        for b in D[i:]:
            q = a + b
            for m in range(0, q // 2 + 1):
                t = F(m, q)
                if t in seen: continue
                seen.add(t)
                v = min(dist(t * d) for d in D)
                if v > best: best = v
    return best

def clique_number(D):
    Dset = set(D)
    V = [0] + sorted(D)
    adj = {v: set(u for u in V if u != v and abs(u - v) in Dset) for v in V}
    best = 1
    def expand(R, P):
        nonlocal best
        if len(R) > best: best = len(R)
        if len(R) + len(P) <= best: return
        for v in sorted(P):
            if len(R) + len(P) <= best: return
            expand(R | {v}, P & adj[v])
            P = P - {v}
    expand({0}, set(adj[0]))
    return best

def periodic_colouring(D, k, p, time_limit=None):
    if any(d % p == 0 for d in D): return None
    var = lambda i, c: i * k + c + 1
    s = Cadical153()
    for i in range(p):
        s.add_clause([var(i, c) for c in range(k)])
    edges = set()
    for i in range(p):
        for d in D:
            j = (i + d) % p
            edges.add((min(i, j), max(i, j)))
    for (i, j) in edges:
        for c in range(k):
            s.add_clause([-var(i, c), -var(j, c)])
    s.add_clause([var(0, 0)])
    ok = s.solve()
    if not ok:
        s.delete(); return None
    m = set(l for l in s.get_model() if l > 0)
    col = [next(c for c in range(k) if var(i, c) in m) for i in range(p)]
    s.delete()
    return col

def interval_colourable(D, k, N):
    """is the induced subgraph on [0,N) k-colourable?"""
    var = lambda i, c: i * k + c + 1
    s = Cadical153()
    for i in range(N):
        s.add_clause([var(i, c) for c in range(k)])
        for d in D:
            if i + d < N:
                for c in range(k):
                    s.add_clause([-var(i, c), -var(i + d, c)])
    s.add_clause([var(0, 0)])
    ok = s.solve()
    s.delete()
    return ok

def chi_status(D, pmax=400, Ns=(60, 120, 250, 500, 1000, 2000)):
    k = len(D)
    # first: periodic k-colouring
    for p in range(k, pmax + 1):
        col = periodic_colouring(D, k, p)
        if col is not None:
            return ("<=k", p, col)
    for N in Ns:
        if not interval_colourable(D, k, N):
            return ("k+1", N, None)
    return ("?", None, None)

if __name__ == "__main__":
    pass
