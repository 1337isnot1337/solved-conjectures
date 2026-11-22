"""Abstract end-game for n = 13.

Setting: near-1-factorization of K_13, rainbow 4-set D with k invalid triples inside D (k = 0 or 1),
W = V \\ D (9 vertices).  A split {A,B,C} of W gives a seal-free partition {D,A,B,C} iff none of
A,B,C lies in the bad family  Bad = Inv(W) u CL(D), where (Lemma 13.1 in REPORT.md)
  Inv(W) = {u} u e  for u in W and e a u-edge inside W,
  CL(D):  k=0: for each d in D:  W minus the vertices covered by d-edges inside W  (3 vertices)
               for each u in col(D) (the 6 W-colours of D's edges): {u} u (W-u minus vertices covered by u-edges in W)
          k=1 (c(d1 d2) = d0): d0: {w*} u e for each d0-edge e in W, w* = W-vertex not covered by d0-edges in W;
               d1,d2,d3: as d above;  u in col(D) (5 W-colours): as above.
Only the colouring of the 36 edges of W matters.  Colour classes inside W:
  k=0: u in col(D) (6 colours): 3 edges; other W-colours (3): 2 edges; d in D: 3 edges.
  k=1: col(D) (5): 3 edges; other W colours (4): 2 edges; d0: 4 edges; d1,d2,d3: 3 edges.
SAT search for an abstract colouring in which all 280 splits hit Bad.  UNSAT => lemma.
"""
import sys, itertools, time
from pysat.solvers import Solver
from pysat.card import CardEnc

def build(k, solver='cadical153'):
    W = list(range(9)); Dc = [9, 10, 11, 12]        # D-colours d0..d3
    colD = list(range(6)) if k == 0 else list(range(5))
    size = {}
    for u in W: size[u] = 3 if u in colD else 2
    for d in Dc: size[d] = 3
    if k == 1: size[9] = 4
    cols = W + Dc
    nv = [0]
    def new():
        nv[0] += 1; return nv[0]
    if solver == 'cnf':
        from pysat.formula import CNF
        class _C(CNF):
            def add_clause(self, cl): self.append(cl)
        S = _C()
    else:
        S = Solver(name=solver)
    y = {}
    edges = list(itertools.combinations(W, 2))
    for e in edges:
        for c in cols:
            if c not in e: y[e, c] = new()
    def Y(a, b, c):
        e = (a, b) if a < b else (b, a)
        return y.get((e, c))
    def add_card(lits, bound, kind):
        enc = getattr(CardEnc, kind)(lits, bound=bound, top_id=nv[0])
        nv[0] = max(nv[0], enc.nv)
        for cl in enc.clauses: S.add_clause(cl)
    for e in edges:
        add_card([y[e, c] for c in cols if (e, c) in y], 1, 'equals')
    for c in cols:
        for v in W:
            if v == c: continue
            lits = [Y(v, w, c) for w in W if w not in (v, c)]
            add_card(lits, 1, 'atmost')
        add_card([y[e, c] for e in edges if (e, c) in y], size[c], 'equals')
    # covered[v,c] <-> some c-edge at v
    cov = {}
    for c in cols:
        for v in W:
            if v == c: continue
            z = new(); cov[v, c] = z
            lits = [Y(v, w, c) for w in W if w not in (v, c)]
            S.add_clause([-z] + lits)
            for l in lits: S.add_clause([z, -l])
    def uncovered_all(tau, c):
        """literal list meaning: no c-edge meets tau\\{c}  -> returns aux var a with a -> condition"""
        a = new()
        for v in tau:
            if v != c: S.add_clause([-a, -cov[v, c]])
        return a
    bad = {}
    for tau in itertools.combinations(W, 3):
        opts = []
        a, b, c = tau
        for (p, q, r) in ((a, b, c), (a, c, b), (b, c, a)):
            opts.append(Y(p, q, r))                       # invalid: edge pq has colour r
        dlist = Dc if k == 0 else Dc[1:]
        for d in dlist: opts.append(uncovered_all(tau, d))
        for u in colD:
            if u in tau: opts.append(uncovered_all(tau, u))
        if k == 1:
            # {w*} u e with e a d0-edge: tau contains a d0-edge e and the third vertex is uncovered by d0
            for (p, q, r) in ((a, b, c), (a, c, b), (b, c, a)):
                g = new(); S.add_clause([-g, Y(p, q, 9)]); S.add_clause([-g, -cov[r, 9]]); opts.append(g)
        bt = new(); bad[tau] = bt
        S.add_clause([-bt] + opts)
    nsplit = 0
    for A in itertools.combinations(W[1:], 2):
        A = (0,) + A; R = [x for x in W if x not in A]
        for B in itertools.combinations(R[1:], 2):
            B = (R[0],) + B; C = tuple(x for x in R if x not in B)
            S.add_clause([bad[A], bad[B], bad[C]]); nsplit += 1
    return S, y, nsplit, nv[0]

if __name__ == '__main__':
    k = int(sys.argv[1]); name = sys.argv[2] if len(sys.argv) > 2 else 'cadical153'
    t0 = time.time()
    if name == 'cnf':
        S, y, ns, nv = build(k, 'cnf'); S.to_file('abs13_k%d.cnf' % k); print('written', len(S.clauses), 'clauses'); sys.exit()
    S, y, ns, nv = build(k, name)
    print('k', k, 'splits', ns, 'vars', nv, flush=True)
    r = S.solve()
    print('k', k, 'SAT' if r else 'UNSAT', 'time %.1f' % (time.time()-t0), flush=True)
    if r:
        m = set(l for l in S.get_model() if l > 0)
        print({e: c for (e, c), v in y.items() if v in m})
