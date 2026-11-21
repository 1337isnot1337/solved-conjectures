"""[generalised: inserted vertex sets free] Cyclic perfect colouring + D inserted blocks (non-regular graphs, Delta = 2rg + D).

Insertion lemma: let c: E(G) -> Z_p be a perfect (p,q)-colouring with classes E_0..E_{p-1}, vertex sets A_j.
If F_1..F_q are matchings in the complement of G with V(F_j) = A_{c0+j-1}, then inserting F_1..F_q
just before colour c0 gives a perfect (p+q, q)-colouring of G + F_1 + ... + F_q (every new window is,
as a family of vertex sets, a permutation of an old window).  Repeat at D insertion points c0 spaced >= q apart.
Result: chi'_c = (p + Dq)/q = Delta' + r/q with Delta' = 2rg + D (if some vertex is in all D windows).

Usage: python3 cycins.py q r g D [timeout] [spacing]
"""
import sys, time, threading
from math import gcd
from pysat.formula import CNF, IDPool
from pysat.card import CardEnc, EncType
from pysat.solvers import Solver
import cycsat


def build(q, r, g, D, spacing=None):
    n, p, u, conds, pool, cnf, X, Y, pairs = cycsat.build(q, r, g)
    m = q * g
    if spacing is None: spacing = q
    def length(v, w):
        d = (w - v) % n; return min(d, n - d)
    # L[s]: length s used in base graph
    L = {s: pool.id(('L', s)) for s in range(1, m + 1)}
    bylen = {s: [] for s in range(1, m + 1)}
    for rho in range(r):
        for (v, w) in pairs: bylen[length(v, w)].append(Y(rho, v, w))
    for s in range(1, m + 1):
        cnf.append([-L[s]] + bylen[s])
        for y in bylen[s]: cnf.append([-y, L[s]])
    def cls_of_colour(c):
        a = (c * u) % p; rho = a % r; s = a // r
        return rho, s          # class = B_rho + s, vertex set = W_rho + s
    F = lambda j, t, v, w: pool.id(('F', j, t) + tuple(sorted((v % n, w % n))))
    FV = lambda j, t, v: pool.id(('FV', j, t, v % n))
    used = {}
    for j in range(D):
        c0 = j * spacing
        for t in range(q):
            for (v, w) in pairs:
                f = F(j, t, v, w)
                cnf.append([-f, FV(j, t, v)]); cnf.append([-f, FV(j, t, w)])
                cnf.append([-f, -L[length(v, w)]])          # non-edge of G
                used.setdefault((v, w), []).append(f)
            allF = [F(j, t, v, w) for (v, w) in pairs]
            cnf.extend(CardEnc.equals(allF, g, vpool=pool, encoding=EncType.seqcounter).clauses)
            for v in range(n):
                inc = [F(j, t, v, w) for w in range(n) if w != v]
                cnf.append([-FV(j, t, v)] + inc)
                cnf.extend(CardEnc.atmost(inc, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
        # local sequence: old colours c0-q+1..c0-1, F_0..F_{q-1}, old colours c0..c0+q-2
        loc = [('old', c0 + k) for k in range(-q + 1, 0)] + [('F', t) for t in range(q)] + [('old', c0 + k) for k in range(0, q - 1)]
        def mem(item, v):
            if item[0] == 'F': return FV(j, item[1], v)
            rho, s = cls_of_colour(item[1]); return X(rho, v - s)
        for i1 in range(len(loc)):
            for i2 in range(i1 + 1, min(len(loc), i1 + q)):
                if loc[i1][0] == 'old' and loc[i2][0] == 'old': continue
                for v in range(n):
                    cnf.append([-mem(loc[i1], v), -mem(loc[i2], v)])
    for e, lits in used.items():
        if len(lits) > 1:
            for cl in CardEnc.atmost(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses: cnf.append(cl)
    return n, p, u, pool, cnf, X, Y, F, pairs, spacing


def solve(q, r, g, D, timeout=600, spacing=None):
    n, p, u, pool, cnf, X, Y, F, pairs, spacing = build(q, r, g, D, spacing)
    t0 = time.time()
    with Solver(name='cadical153', bootstrap_with=cnf.clauses) as S:
        ok = S.solve()
        dt = time.time() - t0
        if not ok: return 'unsat', None, None, dt, spacing
        model = set(l for l in S.get_model() if l > 0)
    base = [[(v, w) for (v, w) in pairs if Y(rho, v, w) in model] for rho in range(r)]
    blocks = [[[(v, w) for (v, w) in pairs if F(j, t, v, w) in model] for t in range(q)] for j in range(D)]
    return 'sat', base, blocks, dt, spacing


def assemble_and_verify(q, r, g, D, base, blocks, spacing):
    from fractions import Fraction
    n = 2 * q * g + 1; p = n * r; m = q * g
    cls = {}
    for a in range(p):
        rho, s = a % r, a // r
        cls[(q * a) % p] = [tuple(sorted(((v + s) % n, (w + s) % n))) for (v, w) in base[rho]]
    seq = []
    for c in range(p):
        for j in range(D):
            if c == j * spacing: seq.extend(blocks[j])
        seq.append(cls[c])
    P = len(seq); assert P == p + D * q
    E = [e for cl in seq for e in cl]
    assert len(E) == len(set(E)), "repeated edge"
    for c in range(P):
        vs = [v for t in range(q) for e in seq[(c + t) % P] for v in e]
        assert len(vs) == len(set(vs)) == 2 * m, ("window", c)
    deg = [0] * n
    for a, b in E: deg[a] += 1; deg[b] += 1
    val = Fraction(len(E), m)
    assert val == Fraction(P, q)
    return seq, deg, val


if __name__ == "__main__":
    q, r, g, D = map(int, sys.argv[1:5])
    spacing = int(sys.argv[6]) if len(sys.argv) > 6 else None
    st, base, blocks, dt, spacing = solve(q, r, g, D, spacing=spacing)
    head = "q=%d r=%d g=%d D=%d n=%d" % (q, r, g, D, 2 * q * g + 1)
    if st == 'sat':
        seq, deg, val = assemble_and_verify(q, r, g, D, base, blocks, spacing)
        print(head, "SAT %.1fs value=%s Delta=%d degrees=%s" % (dt, val, max(deg), sorted(deg)))
        print("  base=%s blocks=%s spacing=%d" % (base, blocks, spacing), flush=True)
    else:
        print(head, "UNSAT %.1fs" % dt, flush=True)
