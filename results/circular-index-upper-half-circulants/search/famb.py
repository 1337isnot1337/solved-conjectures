"""q=3 insertion search with imposed base structure:
W0 = {0,1} u [2g+3,4g], W1 = {1,2} u [2g+3,4g]; lengths 'forb' not used by the base graph."""
import sys, time
import cycins2
from pysat.solvers import Solver
def run(g, D, forb, spacing=3, extra=None):
    q, r = 3, 2
    n, p, u, pool, cnf, X, Y, F, pairs, spacing = cycins2.build(q, r, g, D, spacing)
    W0 = {0, 1} | set(range(2*g+3, 4*g+1)); W1 = {1, 2} | set(range(2*g+3, 4*g+1))
    for v in range(n):
        cnf.append([X(0, v)] if v in W0 else [-X(0, v)])
        cnf.append([X(1, v)] if v in W1 else [-X(1, v)])
    for s in forb: cnf.append([-pool.id(('L', s))])
    if extra: extra(cnf, pool, n, Y, F)
    t = time.time()
    with Solver(name='cadical153', bootstrap_with=cnf.clauses) as S:
        if not S.solve(): return 'unsat', None, None, time.time()-t
        M = set(l for l in S.get_model() if l > 0)
    base = [[e for e in pairs if Y(rho, *e) in M] for rho in range(r)]
    blocks = [[[e for e in pairs if F(j, t2, *e) in M] for t2 in range(q)] for j in range(D)]
    seq, deg, val = cycins2.assemble_and_verify(q, r, g, D, base, blocks, spacing)
    return 'sat', base, blocks, time.time()-t, deg, val
if __name__ == "__main__":
    g, D = int(sys.argv[1]), int(sys.argv[2])
    forb = [1] if len(sys.argv) < 4 else [1, 2*g+1, 2*g+2]
    res = run(g, D, forb, spacing=6)
    n = 6*g+1
    ln = lambda e: min((e[1]-e[0]) % n, (e[0]-e[1]) % n)
    if res[0] == 'sat':
        _, base, blocks, dt, deg, val = res
        print("g=%d D=%d SAT %.1fs value=%s Delta=%d" % (g, D, dt, val, max(deg)))
        for b in base: print("  base", b, [ln(e) for e in b])
        for j, bl in enumerate(blocks):
            for t, F in enumerate(bl): print("  block", j, t, F, [ln(e) for e in F])
    else: print("g=%d D=%d %s %.1fs" % (g, D, res[0], res[-1]))
