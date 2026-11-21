"""Direct SAT search for a graph G on n = 2m+1 vertices together with a perfect (p,q)-edge-colouring:
p classes, each a matching of k edges (k*q = m), every window of q consecutive classes a matching
(hence a near-perfect matching of size m).  Then chi'_c(G) = |E|/m = p*k/m = p/q exactly
(alpha'(G) <= m), and Delta(G) <= floor(p/q) automatically; also Delta >= ceil(p/q) - 1 by Vizing.
Options: maxdeg D (forces vertex degrees <= D; default floor(p/q)), mindeg, regular,
         'loose' (windows need only be matchings, edges per class free).
Usage: python3 dirsat.py n p q [timeout] [key=val ...]
  keys: deg=<list of exact degrees by vertex or 'reg'>, mindeg=<int>, sym=0/1, solver=name
"""
import sys, time, threading
from math import gcd
from pysat.formula import CNF, IDPool
from pysat.card import CardEnc, EncType
from pysat.solvers import Solver


def build(n, p, q, mindeg=None, maxdeg=None, exactdeg=None, sym=True):
    m = (n - 1) // 2
    assert n % 2 == 1 and m % q == 0
    k = m // q
    pool = IDPool(); cnf = CNF()
    pairs = [(v, w) for v in range(n) for w in range(v + 1, n)]
    Z = lambda e, c: pool.id(('z', e, c % p))
    def add(clauses):
        for cl in clauses: cnf.append(cl)
    # each edge at most one colour; used-edge indicator U
    U = {}
    for e in pairs:
        lits = [Z(e, c) for c in range(p)]
        add(CardEnc.atmost(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
        U[e] = pool.id(('u', e))
        cnf.append([-U[e]] + lits)
        for l in lits: cnf.append([-l, U[e]])
    # each class exactly k edges
    for c in range(p):
        add(CardEnc.equals([Z(e, c) for e in pairs], k, vpool=pool, encoding=EncType.seqcounter).clauses)
    inc = {v: [e for e in pairs if v in e] for v in range(n)}
    # window: at most one edge at v with colour in {c,...,c+q-1}
    for v in range(n):
        for c in range(p):
            lits = [Z(e, c + t) for t in range(q) for e in inc[v]]
            add(CardEnc.atmost(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
    for v in range(n):
        lits = [U[e] for e in inc[v]]
        if exactdeg is not None:
            add(CardEnc.equals(lits, exactdeg[v], vpool=pool, encoding=EncType.seqcounter).clauses)
        else:
            if maxdeg is not None:
                add(CardEnc.atmost(lits, maxdeg, vpool=pool, encoding=EncType.seqcounter).clauses)
            if mindeg is not None:
                add(CardEnc.atleast(lits, mindeg, vpool=pool, encoding=EncType.seqcounter).clauses)
    if sym:
        # window 0 = classes 0..q-1 covers vertices 0..2m-1 in order, misses vertex n-1
        x = 0
        for c in range(q):
            for j in range(k):
                cnf.append([Z((x, x + 1), c)]); x += 2
    return pool, cnf, pairs, Z


def solve(n, p, q, timeout=600, solver='cadical153', **kw):
    pool, cnf, pairs, Z = build(n, p, q, **kw)
    t0 = time.time()
    with Solver(name=solver, bootstrap_with=cnf.clauses) as S:
        timer = threading.Timer(timeout, lambda: S.interrupt()); timer.start()
        try:
            ok = S.solve_limited(expect_interrupt=True)
        finally:
            timer.cancel()
        dt = time.time() - t0
        if ok is None: return 'timeout', None, dt
        if not ok: return 'unsat', None, dt
        model = set(l for l in S.get_model() if l > 0)
    cls = {c: [e for e in pairs if Z(e, c) in model] for c in range(p)}
    return 'sat', cls, dt


def verify(n, p, q, cls):
    from fractions import Fraction
    E = [e for c in range(p) for e in cls[c]]
    assert len(E) == len(set(E))
    for c in range(p):
        vs = [v for t in range(q) for e in cls[(c + t) % p] for v in e]
        assert len(vs) == len(set(vs)), ("window", c)
    deg = [0] * n
    for a, b in E: deg[a] += 1; deg[b] += 1
    m = (n - 1) // 2
    val = Fraction(len(E), m)
    assert val == Fraction(p, q)
    return deg, val


if __name__ == "__main__":
    n, p, q = map(int, sys.argv[1:4])
    to = float(sys.argv[4]) if len(sys.argv) > 4 else 600
    kw = {}
    for a in sys.argv[5:]:
        key, val = a.split('=')
        if key == 'maxdeg': kw['maxdeg'] = int(val)
        if key == 'mindeg': kw['mindeg'] = int(val)
        if key == 'deg': kw['exactdeg'] = list(map(int, val.split(',')))
        if key == 'sym': kw['sym'] = bool(int(val))
    st, cls, dt = solve(n, p, q, to, **kw)
    if st == 'sat':
        deg, val = verify(n, p, q, cls)
        print("n=%d p/q=%d/%d: SAT %.1fs value=%s degrees=%s Delta=%d" % (n, p, q, dt, val, sorted(deg), max(deg)))
        print("classes:", [cls[c] for c in range(p)], flush=True)
    else:
        print("n=%d p/q=%d/%d %s: %s %.1fs" % (n, p, q, kw, st.upper(), dt), flush=True)
