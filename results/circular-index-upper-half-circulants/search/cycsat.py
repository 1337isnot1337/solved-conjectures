"""SAT search for cyclic perfect colourings (ansatz of cyc2.py), parametrised by (q, r, g).
n = 2qg+1, base classes B_0..B_{r-1} (matchings of g edges), class(r*s+rho) = B_rho + s (s in Z_n),
colour of class a = q*a mod p, p = n*r.  Graph = C_n(S), S = lengths of the r*g base edges (all distinct),
Delta = 2rg, chi'_c = p/q = Delta + r/q (lower bound |E|/alpha' with alpha' = qg).
Requires gcd(q, r) = 1 (then gcd(q, p) = 1).
Usage: python3 cycsat.py q r g [timeout_s] [S=comma-list to force lengths] [nosym]
"""
import sys, time, itertools
from math import gcd
from pysat.formula import CNF, IDPool
from pysat.card import CardEnc, EncType
from pysat.solvers import Solver


def conditions(q, r, g):
    n = 2 * q * g + 1; p = n * r
    u = pow(q, -1, p)
    conds = set()
    for rho in range(r):
        for t in range(1, q):
            b = rho + t * u
            rho2 = b % r; s = ((b - rho2) // r) % n
            conds.add((rho, rho2, s))       # W_rho  disjoint from  W_rho2 + s
    return n, p, u, sorted(conds)


def build(q, r, g, forceS=None, sym=True):
    n, p, u, conds = conditions(q, r, g)
    m = q * g
    pool = IDPool(); cnf = CNF()
    X = lambda rho, v: pool.id(('x', rho, v % n))
    Y = lambda rho, v, w: pool.id(('y', rho) + tuple(sorted((v % n, w % n))))
    def length(v, w):
        d = (w - v) % n
        return min(d, n - d)
    pairs = [(v, w) for v in range(n) for w in range(v + 1, n)]
    bylen = {s: [] for s in range(1, m + 1)}
    for rho in range(r):
        for (v, w) in pairs:
            y = Y(rho, v, w)
            cnf.append([-y, X(rho, v)]); cnf.append([-y, X(rho, w)])
            bylen[length(v, w)].append(y)
        for v in range(n):
            inc = [Y(rho, v, w) for w in range(n) if w != v]
            cnf.append([-X(rho, v)] + inc)                 # x -> some edge
            for cl in CardEnc.atmost(inc, 1, vpool=pool, encoding=EncType.seqcounter).clauses:
                cnf.append(cl)                             # matching
        allE = [Y(rho, v, w) for (v, w) in pairs]
        for cl in CardEnc.equals(allE, g, vpool=pool, encoding=EncType.seqcounter).clauses:
            cnf.append(cl)
    for s in range(1, m + 1):
        if forceS is not None:
            if s in forceS:
                for cl in CardEnc.equals(bylen[s], 1, vpool=pool, encoding=EncType.seqcounter).clauses: cnf.append(cl)
            else:
                for y in bylen[s]: cnf.append([-y])
        else:
            for cl in CardEnc.atmost(bylen[s], 1, vpool=pool, encoding=EncType.seqcounter).clauses: cnf.append(cl)
    for (rho, rho2, s) in conds:
        for v in range(n):
            # v in W_rho and v - s in W_rho2  forbidden
            if rho == rho2 and s == 0: continue
            cnf.append([-X(rho, v), -X(rho2, v - s)])
    if sym:
        cnf.append([X(0, 0)])
    # redundant "swap" constraints (implied by perfectness): W_{rho+1} = W_rho with at most one vertex
    # exchanged, and W_0 + 1 = W_{r-1} with at most one vertex exchanged.
    for rho in range(r):
        if rho < r - 1:
            new = lambda v: X(rho + 1, v); old = lambda v: X(rho, v)
        else:
            new = lambda v: X(0, v - 1); old = lambda v: X(r - 1, v)
        ins = []
        for v in range(n):
            d = pool.id(('swapin', rho, v))
            cnf.append([-new(v), old(v), d]); ins.append(d)
            cnf.append([-d, new(v)]); cnf.append([-d, -old(v)])
        cnf.extend(CardEnc.atmost(ins, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
    return n, p, u, conds, pool, cnf, X, Y, pairs


def solve(q, r, g, timeout=600, forceS=None, sym=True, solver='cadical153'):
    n, p, u, conds, pool, cnf, X, Y, pairs = build(q, r, g, forceS, sym)
    t0 = time.time()
    with Solver(name=solver, bootstrap_with=cnf.clauses) as S:
        import threading
        timer = threading.Timer(timeout, lambda: S.interrupt()); timer.start()
        try:
            ok = S.solve_limited(expect_interrupt=True)
        finally:
            timer.cancel()
        dt = time.time() - t0
        if ok is None: return 'timeout', None, dt
        if not ok: return 'unsat', None, dt
        model = set(l for l in S.get_model() if l > 0)
    base = [[(v, w) for (v, w) in pairs if Y(rho, v, w) in model] for rho in range(r)]
    return 'sat', base, dt


def expand_and_verify(q, r, g, base):
    """independent check: build all p classes, verify partition of C_n(S), matchings, windows."""
    n = 2 * q * g + 1; p = n * r
    cls = {}
    for a in range(p):
        rho, s = a % r, a // r
        cls[(q * a) % p] = [tuple(sorted(((v + s) % n, (w + s) % n))) for (v, w) in base[rho]]
    assert sorted(cls) == list(range(p))
    E = [e for c in range(p) for e in cls[c]]
    assert len(E) == len(set(E))
    S = sorted(min((w - v) % n, (v - w) % n) for b in base for (v, w) in b)
    assert len(S) == len(set(S)) == r * g
    Eg = {tuple(sorted((x, (x + s) % n))) for x in range(n) for s in S}
    assert set(E) == Eg
    for c in range(p):
        vs = [v for t in range(q) for e in cls[(c + t) % p] for v in e]
        assert len(vs) == len(set(vs)) == 2 * q * g, ("window", c)
    return S


if __name__ == "__main__":
    q, r, g = map(int, sys.argv[1:4])
    to = float(sys.argv[4]) if len(sys.argv) > 4 else 600
    forceS = None; sym = True
    for a in sys.argv[5:]:
        if a.startswith('S='): forceS = set(map(int, a[2:].split(',')))
        if a == 'nosym': sym = False
    assert gcd(q, r) == 1
    st, base, dt = solve(q, r, g, to, forceS, sym)
    n = 2 * q * g + 1
    head = "q=%d r=%d g=%d: n=%d Delta=%d value=%d/%d=Delta+%d/%d" % (q, r, g, n, 2 * r * g, n * r, q, r, q)
    if st == 'sat':
        S = expand_and_verify(q, r, g, base)
        print(head, "SAT %.1fs S=%s base=%s" % (dt, S, base), flush=True)
    else:
        print(head, st.upper(), "%.1fs" % dt, flush=True)
