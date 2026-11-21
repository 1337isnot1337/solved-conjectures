"""Needs python-sat.
Part 1: (19,3)-colourability of K_7 - P_3 and K_7 - 2K_2, plain encoding from the definition (UNSAT, ~1.5 min each).
Part 2: (25,3)-colourability of K_9 - F for the five graphs F with 3 edges (UNSAT, < 1 min each),
        with redundant constraints that every (p,q)-colouring satisfies (see the comments).
python3 verify_sat.py [1] [2]"""
import sys, time
from pysat.formula import CNF, IDPool
from pysat.card import CardEnc, EncType
from pysat.solvers import Solver
def Kminus(n, F):
    F = {tuple(sorted(e)) for e in F}
    return [(a, b) for a in range(n) for b in range(a + 1, n) if (a, b) not in F]
def plain(n, F, p, q):
    E = Kminus(n, F); pool = IDPool(); cnf = CNF(); X = lambda e, c: pool.id((e, c))
    for e in range(len(E)): cnf.append([X(e, c) for c in range(p)])
    for v in range(n):
        inc = [i for i, e in enumerate(E) if v in e]
        for c in range(p):    # at most one edge at v with colour in the window c..c+q-1
            lits = [X(e, (c + d) % p) for e in inc for d in range(q)]
            cnf.extend(CardEnc.atmost(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
    cnf.append([X(0, 0)])     # rotate colours
    with Solver(name='cadical153', bootstrap_with=cnf.clauses) as s: return s.solve()
def redundant(n, F, p, q):
    """Definition (window at-most-one per vertex) plus implied constraints:
    y[v][c] <-> v has an edge of colour c;  z[v][c] <-> v uncovered by the window c..c+q-1;
    (i)  sum_c y[v][c] = deg v;  (ii) sum_c z[v][c] = p - q deg v (the windows covering v are q per edge
    and disjoint, as colours at v are >= q apart);  (iii) every window leaves >= 1 vertex uncovered (n odd)."""
    E = Kminus(n, F); pool = IDPool(); cnf = CNF()
    X = lambda e, c: pool.id(('x', e, c)); Y = lambda v, c: pool.id(('y', v, c)); Z = lambda v, c: pool.id(('z', v, c))
    for e in range(len(E)): cnf.append([X(e, c) for c in range(p)])
    for v in range(n):
        inc = [i for i, e in enumerate(E) if v in e]
        for c in range(p):
            cnf.append([-Y(v, c)] + [X(e, c) for e in inc])
            for e in inc: cnf.append([-X(e, c), Y(v, c)])
            cnf.extend(CardEnc.atmost([X(e, c) for e in inc], 1, vpool=pool, encoding=EncType.seqcounter).clauses)
            win = [Y(v, (c + d) % p) for d in range(q)]
            cnf.extend(CardEnc.atmost(win, 1, vpool=pool, encoding=EncType.pairwise).clauses)
            for w in win: cnf.append([-Z(v, c), -w])
            cnf.append([Z(v, c)] + win)
        cnf.extend(CardEnc.equals([Y(v, c) for c in range(p)], len(inc), vpool=pool, encoding=EncType.seqcounter).clauses)
        cnf.extend(CardEnc.equals([Z(v, c) for c in range(p)], p - q * len(inc), vpool=pool, encoding=EncType.seqcounter).clauses)
    for c in range(p): cnf.append([Z(v, c) for v in range(n)])
    cnf.append([X(0, 0)])
    with Solver(name='kissat404', bootstrap_with=cnf.clauses) as s: return s.solve()
parts = sys.argv[1:] or ['1', '2']
if '1' in parts:
    for name, F in (("P_3", [(0, 1), (1, 2)]), ("2K_2", [(0, 1), (2, 3)])):
        t = time.time(); r = plain(7, F, 19, 3)
        print("K_7 - %s (19,3): %s (%.1fs)" % (name, "SAT" if r else "UNSAT", time.time() - t), flush=True)
if '2' in parts:
    for name, F in (("K_3", [(0,1),(1,2),(0,2)]), ("3K_2", [(0,1),(2,3),(4,5)]), ("K_{1,3}", [(0,1),(0,2),(0,3)]),
                    ("P_4", [(0,1),(1,2),(2,3)]), ("P_3+K_2", [(0,1),(1,2),(3,4)])):
        t = time.time(); r = redundant(9, F, 25, 3)
        print("K_9 - %s (25,3): %s (%.1fs)" % (name, "SAT" if r else "UNSAT", time.time() - t), flush=True)
