import sys
from pysat.formula import CNF, IDPool
from pysat.card import CardEnc, EncType
from pysat.solvers import Solver
def base(g, extra=None):
    n = 6*g+1; I = list(range(2*g+3, 4*g+1))
    W = [[0, 1] + I, [1, 2] + I]
    ln = lambda v, w: min((w-v) % n, (v-w) % n)
    pool = IDPool(); cnf = CNF()
    Y = {}
    for k in range(2):
        for i, v in enumerate(W[k]):
            for w in W[k][i+1:]:
                if ln(v, w) != 1: Y[(k, v, w)] = pool.id((k, v, w))
        for v in W[k]:
            lits = [y for (kk, a, b), y in Y.items() if kk == k and v in (a, b)]
            cnf.extend(CardEnc.equals(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
    for s in range(2, 3*g+1):
        lits = [y for (k, a, b), y in Y.items() if ln(a, b) == s]
        if lits: cnf.extend(CardEnc.atmost(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
    if extra: extra(cnf, Y, g, n)
    with Solver(name='cadical153', bootstrap_with=cnf.clauses) as S:
        if not S.solve(): return None
        M = set(l for l in S.get_model() if l > 0)
    return [[(a, b, ln(a, b)) for (k, a, b), y in Y.items() if kk_ok(k, kk) and y in M] for kk in range(2)]
def kk_ok(k, kk): return k == kk
if __name__ == "__main__":
    for g in range(3, int(sys.argv[1]) + 1):
        r = base(g)
        print(g, r if r else "UNSAT")
