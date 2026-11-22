"""A13(k) generator with sound symmetry breaking (lex-leader on generators, common variable order).

Same semantics as wild3/abs13.py (validated there), re-implemented with explicit clause list.
W = {0..8}; D-colours 9..12 (k=1: 9 = d0 colours the D-edge d1d2).
k=0: colD = {0..5} (class size 3), N = {6,7,8} (size 2), D-colours size 3.
k=1: colD = {0..4} (size 3), N = {5..8} (size 2), d0 size 4, d1..d3 size 3.

Options (argv): k  out.cnf  [sb=none|gen|all]  [exact=0/1]  [cnt=0/1]
"""
import sys, itertools
from pysat.card import CardEnc, EncType

def build(k, sb='all', exact=False, cnt=False, extra=None):
    W = list(range(9)); Dc = [9, 10, 11, 12]
    colD = list(range(6)) if k == 0 else list(range(5))
    N = [u for u in W if u not in colD]
    size = {u: (3 if u in colD else 2) for u in W}
    for d in Dc: size[d] = 3
    if k == 1: size[9] = 4
    cols = W + Dc
    cl = []; nv = [0]
    def new():
        nv[0] += 1; return nv[0]
    edges = list(itertools.combinations(W, 2))
    y = {}
    for e in edges:
        for c in cols:
            if c not in e: y[e, c] = new()
    NY = nv[0]
    def Y(a, b, c):
        e = (a, b) if a < b else (b, a)
        return y.get((e, c))
    def card(lits, bound, kind):
        enc = getattr(CardEnc, kind)(lits, bound=bound, top_id=nv[0], encoding=EncType.seqcounter)
        nv[0] = max(nv[0], enc.nv); cl.extend(enc.clauses)
    for e in edges:
        lits = [y[e, c] for c in cols if (e, c) in y]
        cl.append(lits)
        for a, b in itertools.combinations(lits, 2): cl.append([-a, -b])
    for c in cols:
        for v in W:
            if v == c: continue
            lits = [Y(v, w, c) for w in W if w not in (v, c)]
            for a, b in itertools.combinations(lits, 2): cl.append([-a, -b])
        card([y[e, c] for e in edges if (e, c) in y], size[c], 'equals')
    cov = {}
    for c in cols:
        for v in W:
            if v == c: continue
            z = new(); cov[v, c] = z
            lits = [Y(v, w, c) for w in W if w not in (v, c)]
            cl.append([-z] + lits)
            for l in lits: cl.append([z, -l])
    def unc_all(tau, c):
        a = new()
        others = [v for v in tau if v != c]
        for v in others: cl.append([-a, -cov[v, c]])
        if exact: cl.append([a] + [cov[v, c] for v in others])
        return a
    bad = {}
    for tau in itertools.combinations(W, 3):
        opts = []
        a, b, c = tau
        for (p, q, r) in ((a, b, c), (a, c, b), (b, c, a)):
            opts.append(Y(p, q, r))
        dlist = Dc if k == 0 else Dc[1:]
        for d in dlist: opts.append(unc_all(tau, d))
        for u in colD:
            if u in tau: opts.append(unc_all(tau, u))
        if k == 1:
            for (p, q, r) in ((a, b, c), (a, c, b), (b, c, a)):
                g = new(); cl.append([-g, Y(p, q, 9)]); cl.append([-g, -cov[r, 9]])
                if exact: cl.append([g, -Y(p, q, 9), cov[r, 9]])
                opts.append(g)
        bt = new(); bad[tau] = bt
        cl.append([-bt] + opts)
        if exact:
            for o in opts: cl.append([bt, -o])
    for A in itertools.combinations(W[1:], 2):
        A = (0,) + A; R = [x for x in W if x not in A]
        for B in itertools.combinations(R[1:], 2):
            B = (R[0],) + B; C = tuple(x for x in R if x not in B)
            cl.append([bad[A], bad[B], bad[C]])
    if cnt:
        # sound: in a counterexample the set {tau: bt=1} may be taken = Bad, |Bad| <= 24-k + 10 + k... use 34 (k=0) / 35 (k=1)
        card([bad[t] for t in bad], 34 if k == 0 else 35, 'atmost')
    # ---------- symmetry breaking ----------
    gens = []
    def perm_from(mapping):   # mapping on colours 0..12 (vertices 0..8 mapped identically)
        return mapping
    def transp(i, j):
        m = list(range(13)); m[i], m[j] = j, i; return m
    if sb != 'none':
        groups = [colD, N, (Dc if k == 0 else Dc[1:])]
        for G in groups:
            if sb == 'gen':
                pairs = list(zip(G, G[1:]))
            else:
                pairs = list(itertools.combinations(G, 2))
            for i, j in pairs: gens.append(transp(i, j))
    order = [y[e, c] for e in edges for c in cols if (e, c) in y]   # edge-major
    inv = {}
    for (e, c), v in y.items(): inv[v] = (e, c)
    def img(v, m):
        (a, b), c = inv[v]
        a2, b2 = m[a], m[b]
        e2 = (a2, b2) if a2 < b2 else (b2, a2)
        return y[e2, m[c]]
    for m in gens:
        xs = []; zs = []
        for v in order:
            w = img(v, m)
            if w != v: xs.append(v); zs.append(w)
        # x <=lex z  (false < true)
        e_prev = None
        for i, (x, z) in enumerate(zip(xs, zs)):
            if e_prev is None:
                cl.append([-x, z])
            else:
                cl.append([-e_prev, -x, z])
            if i == len(xs) - 1: break
            e_next = new()
            if e_prev is None:
                cl.append([x, z, e_next]); cl.append([-x, -z, e_next])
            else:
                cl.append([-e_prev, x, z, e_next]); cl.append([-e_prev, -x, -z, e_next])
            e_prev = e_next
    if extra: extra(cl, y, bad, cov, new)
    return cl, nv[0], y, bad, cov, NY

def write(cl, nv, fn):
    with open(fn, 'w') as f:
        f.write('p cnf %d %d\n' % (nv, len(cl)))
        for c in cl: f.write(' '.join(map(str, c)) + ' 0\n')

if __name__ == '__main__':
    k = int(sys.argv[1]); fn = sys.argv[2]
    sb = sys.argv[3] if len(sys.argv) > 3 else 'all'
    exact = len(sys.argv) > 4 and sys.argv[4] == '1'
    cnt = len(sys.argv) > 5 and sys.argv[5] == '1'
    cl, nv, y, bad, cov, NY = build(k, sb, exact, cnt)
    write(cl, nv, fn); print(fn, nv, len(cl))
