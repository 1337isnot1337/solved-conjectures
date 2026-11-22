"""One lattice instance. Speeds V (default 1..n), threshold P/Q, shifts in (1/(Q*L))Z.
Runner q with shift m/(Q*L) covers u = Q*t in [(j*Q - m/L - P)/q, (j*Q - m/L + P)/q].
Usage: python3 lat1.py n P Q L [solver] [speeds comma-separated]"""
import sys, time, math
from fractions import Fraction as F
from pysat.solvers import Solver
from pysat.card import CardEnc, EncType
def build(V, P, Q, L, fix_first=True):
    n = len(V); QL = Q * L
    var = lambda i, m: i * QL + (m % QL) + 1
    pts = sorted({F(a, q * L) for q in V for a in range(q * L)}); pts.append(F(1))
    clauses = []
    for k in range(Q):
        for a, b in zip(pts, pts[1:]):
            u = k + (a + b) / 2
            cl = []
            for i, q in enumerate(V):
                x = -q * u * L
                lo = math.floor(x - P * L) + 1; hi = math.ceil(x + P * L) - 1
                cl.extend(var(i, m) for m in range(lo, hi + 1))
            clauses.append(sorted(set(cl)))
    top = n * QL
    for i in range(n):
        lits = [var(i, m) for m in range(QL)]
        enc = CardEnc.equals(lits=lits, bound=1, top_id=top, encoding=EncType.seqcounter)
        top = max(top, enc.nv); clauses.extend(enc.clauses)
    if fix_first: clauses.append([var(0, 0)])
    return clauses, var
def solve(V, P, Q, L, solver='cadical153'):
    clauses, var = build(V, P, Q, L)
    s = Solver(name=solver, bootstrap_with=clauses)
    if not s.solve(): return None
    model = set(x for x in s.get_model() if x > 0)
    return [next(m for m in range(Q * L) if var(i, m) in model) for i in range(len(V))]
def gamma(V, Q, L, ms):
    sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
    from slr import gamma_exact
    return gamma_exact(V, [F(m, Q * L) for m in ms])[0]
if __name__ == "__main__":
    n, P, Q, L = [int(x) for x in sys.argv[1:5]]
    solver = sys.argv[5] if len(sys.argv) > 5 else 'cadical153'
    V = [int(x) for x in sys.argv[6].split(',')] if len(sys.argv) > 6 else list(range(1, n + 1))
    t0 = time.time(); ms = solve(V, P, Q, L, solver)
    tag = "n=%d thr=%d/%d L=%d" % (len(V), P, Q, L)
    if ms is None: print(tag, "UNSAT (%.1fs)" % (time.time() - t0), flush=True)
    else: print(tag, "SAT m=%s gamma=%s (%.1fs)" % (ms, gamma(V, Q, L, ms), time.time() - t0), flush=True)
