"""CEGAR search for a near-1-factorization of K_n (n odd) in which EVERY partition
of a growing family F into blocks of size >=3 (with floor(n/3) blocks) has a seal.
UNSAT for some family F  ==>  every near-1-factorization of K_n has a seal-free partition
(in fact one from F), i.e. Conjecture 6.1 holds for n (and n+1).

Encoding: x[a,b,u] (a<b, u not in {a,b}) = edge ab has colour u (colour u = matching missing u).
Symmetry breaking (optional): colours at vertex 0 fixed to a fixed-point-free permutation sigma
of {1..n-1} given by a cycle type (WLOG up to relabelling of 1..n-1).
For a partition P: clause OR_{U} z_U over unions U of blocks (one of each complementary pair);
z_U -> OR_u w_{U,u};  w_{U,u} -> (every v in U\\{u} has its u-partner in U).
"""
import sys, random, itertools, time
from pysat.solvers import Solver

def sizes_options(n):
    t = n // 3; r = n - 3*t
    if r == 0: return [[3]*t]
    if r == 1: return [[4]+[3]*(t-1)]
    return [[4,4]+[3]*(t-2), [5]+[3]*(t-1)]

class Enc:
    def __init__(self, n, sigma=None, solver='cadical153'):
        self.n = n; self.nv = 0; self.x = {}
        self.S = Solver(name=solver)
        V = range(n)
        for a in V:
            for b in range(a+1, n):
                for u in V:
                    if u != a and u != b:
                        self.x[a,b,u] = self.new()
        # each edge exactly one colour
        for a in V:
            for b in range(a+1, n):
                lits = [self.x[a,b,u] for u in V if u not in (a,b)]
                self.eo(lits)
        # each vertex v != u has exactly one u-edge
        for u in V:
            for v in V:
                if v == u: continue
                lits = [self.X(v,w,u) for w in V if w not in (u,v)]
                self.eo(lits)
        if sigma is not None:
            for i in range(1, n):
                self.S.add_clause([self.X(0, i, sigma[i])])
        self.z = {}; self.w = {}
    def new(self):
        self.nv += 1; return self.nv
    def X(self, a, b, u):
        return self.x[(a,b,u)] if a < b else self.x[(b,a,u)]
    def eo(self, lits):
        self.S.add_clause(lits)
        for i in range(len(lits)):
            for j in range(i+1, len(lits)):
                self.S.add_clause([-lits[i], -lits[j]])
    def wvar(self, U, u):
        key = (U, u)
        if key in self.w: return self.w[key]
        v0 = self.new(); self.w[key] = v0
        for v in U:
            if v == u: continue
            self.S.add_clause([-v0] + [self.X(v, v2, u) for v2 in U if v2 not in (u, v)])
        return v0
    def zvar(self, U):
        if U in self.z: return self.z[U]
        z = self.new(); self.z[U] = z
        if len(U) % 2: cols = sorted(U)
        else: cols = [u for u in range(self.n) if u not in U]
        self.S.add_clause([-z] + [self.wvar(U, u) for u in cols])
        return z
    def add_partition(self, blocks):
        blocks = [frozenset(B) for B in blocks]
        t = len(blocks); lits = []
        # unions not containing block 0 (one representative per complementary pair)
        for mask in range(1, 1 << (t-1)):
            U = frozenset().union(*[blocks[i+1] for i in range(t-1) if mask >> i & 1])
            lits.append(self.zvar(U))
        self.S.add_clause(lits)
    def colouring(self, model):
        n = self.n; pos = set(l for l in model if l > 0)
        L = [[-1]*n for _ in range(n)]
        for (a,b,u), v in self.x.items():
            if v in pos: L[a][b] = L[b][a] = u
        for a in range(n): L[a][a] = a
        return L

def partners(L):
    n = len(L); P = [[-1]*n for _ in range(n)]
    for a in range(n):
        for b in range(n):
            if a != b: P[L[a][b]][a] = b
    return P

def check_nf(L):
    n = len(L)
    for u in range(n):
        deg = [0]*n
        for a in range(n):
            for b in range(a+1, n):
                if L[a][b] == u: deg[a] += 1; deg[b] += 1
        assert deg[u] == 0 and all(deg[v] == 1 for v in range(n) if v != u)

def sealfree(P, blocks, n):
    lab = [0]*n
    for i, B in enumerate(blocks):
        for v in B: lab[v] = i
    k = len(blocks)
    for u in range(n):
        par = list(range(k))
        def f(a):
            while par[a] != a:
                par[a] = par[par[a]]; a = par[a]
            return a
        comps = k; Pu = P[u]
        for a in range(n):
            b = Pu[a]
            if b > a:
                ra, rb = f(lab[a]), f(lab[b])
                if ra != rb: par[ra] = rb; comps -= 1
        if comps != 1: return False
    return True

def rand_partition(n, rnd):
    sz = rnd.choice(sizes_options(n))
    p = list(range(n)); rnd.shuffle(p); out = []; i = 0
    for s in sz: out.append(sorted(p[i:i+s])); i += s
    return out

def cycle_types(m, minpart=2):
    def parts(k, mx):
        if k == 0: yield []; return
        for p in range(min(k, mx), minpart-1, -1):
            for rest in parts(k-p, p): yield [p]+rest
    return list(parts(m, m))

def sigma_from_type(n, ct):
    sigma = [None]*n; i = 1
    for c in ct:
        cyc = list(range(i, i+c))
        for j in range(c): sigma[cyc[j]] = cyc[(j+1) % c]
        i += c
    return sigma

def run(n, sigma, family, rnd, per_iter=5, max_iter=100000, tlimit=1e9, log=None):
    E = Enc(n, sigma)
    for B in family: E.add_partition(B)
    it = 0; t0 = time.time()
    while it < max_iter and time.time()-t0 < tlimit:
        it += 1
        if not E.S.solve():
            return 'UNSAT', it, E
        L = E.colouring(E.S.get_model()); check_nf(L); P = partners(L)
        found = 0; tries = 0
        while found < per_iter:
            tries += 1
            B = rand_partition(n, rnd)
            if sealfree(P, B, n):
                family.append(B); E.add_partition(B); found += 1
            if tries > 200000: raise RuntimeError('no seal-free partition found: counterexample?')
        if log and (it % 10 == 0 or it < 10):
            print('  it', it, 'family', len(family), 'time %.1f' % (time.time()-t0), file=log, flush=True)
    return 'TIMEOUT', it, E

if __name__ == '__main__':
    n = int(sys.argv[1]); mode = sys.argv[2] if len(sys.argv) > 2 else 'sym'
    per = int(sys.argv[3]) if len(sys.argv) > 3 else 5
    tl = float(sys.argv[4]) if len(sys.argv) > 4 else 500
    rnd = random.Random(1); family = []
    if mode == 'nosym':
        res, it, E = run(n, None, family, rnd, per, tlimit=tl, log=sys.stdout)
        print(n, 'nosym', res, 'iters', it, 'family', len(family), flush=True)
    else:
        for ct in cycle_types(n-1):
            t0 = time.time()
            res, it, E = run(n, sigma_from_type(n, ct), family, rnd, per, tlimit=tl, log=sys.stdout)
            print(n, ct, res, 'iters', it, 'family', len(family), 'time %.1f' % (time.time()-t0), flush=True)
            if res != 'UNSAT': break
