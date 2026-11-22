"""Local SAT lemma: fix some blocks (a 'prefix' set of vertices with given block structure and
local conditions) and ask whether EVERY completion (partition of the rest into the remaining
block sizes) has a seal.  UNSAT  ==>  for every near-1-factorization satisfying the prefix
conditions, some completion is seal-free.

Usage: python3 local_sat.py n13   (D={0,1,2,3} rainbow, complete with 3 triples)
"""
import sys, itertools, time
from cegar import Enc

def set_partitions(W, sizes):
    """all partitions of list W into blocks of the given sizes (sizes sorted desc); each partition once"""
    if not W: yield []; return
    first = W[0]
    for s in sorted(set(sizes), reverse=True):
        rest_sizes = list(sizes); rest_sizes.remove(s)
        for comb in itertools.combinations(W[1:], s-1):
            B = [first, *comb]; R = [x for x in W if x not in B]
            for tail in set_partitions(R, rest_sizes):
                yield [B] + tail

def forbid_closed(E, U):
    """add constraint: U is not u-closed for any colour u"""
    n = E.n; U = frozenset(U)
    cols = sorted(U) if len(U) % 2 else [u for u in range(n) if u not in U]
    for u in cols:
        # U is u-closed iff every v in U\{u} has u-partner in U. Forbid: OR_v (partner outside)
        # equivalently NOT(all v have partner inside). Use w var: w -> closed; need closed -> w too.
        # Direct: closed-ness = AND_v OR_{v2 in U} x[v,v2,u]; forbid via auxiliary per v.
        auxs = []
        for v in U:
            if v == u: continue
            a = E.new(); auxs.append(a)
            # a <-> OR_{v2} x[v,v2,u]; need: (OR x) -> a
            for v2 in U:
                if v2 not in (u, v): E.S.add_clause([-E.X(v, v2, u), a])
        E.S.add_clause([-a for a in auxs])

if __name__ == '__main__':
    case = sys.argv[1]
    t0 = time.time()
    if case.startswith('n13'):
        n = 13; E = Enc(n, None)
        D = [0, 1, 2, 3]; forbid_closed(E, D)     # D rainbow  <=>  D not closed
        kmax = int(case[4:]) if case[3:4] == 'k' else 4   # e.g. n13k0 : no edge of D coloured by a vertex of D
        from pysat.card import CardEnc
        lits = [E.X(a, b, c) for a, b in itertools.combinations(D, 2) for c in D if c not in (a, b)]
        if case in ('n13s0', 'n13s1'):
            # symmetry-broken exact cases: k=0 / k=1 with canonical colours on D's edges
            fix = {(0,1):4, (0,2):5, (0,3):6, (1,2):7, (1,3):8, (2,3):9} if case == 'n13s0' else \
                  {(0,1):4, (0,2):5, (0,3):6, (1,2):0, (1,3):7, (2,3):8}
            for (a, b), c in fix.items(): E.S.add_clause([E.X(a, b, c)])
        elif kmax < len(lits):
            enc = CardEnc.atmost(lits, bound=kmax, top_id=E.nv)
            E.nv = max(E.nv, enc.nv)
            for cl in enc.clauses: E.S.add_clause(cl)
        W = list(range(4, 13)); cnt = 0
        for parts in set_partitions(W, [3, 3, 3]):
            E.add_partition([D] + parts); cnt += 1
        print('partitions', cnt, 'vars', E.nv, flush=True)
        r = E.S.solve()
        print(case, 'SAT' if r else 'UNSAT', 'time %.1f' % (time.time()-t0), flush=True)
        if r:
            L = E.colouring(E.S.get_model()); print(L)
