import sys
from lat1 import build
from pysat.solvers import Solver
n, P, Q, L = [int(x) for x in sys.argv[1:5]]; cap = int(sys.argv[5]) if len(sys.argv) > 5 else 2000
V = list(range(1, n + 1)); clauses, var = build(V, P, Q, L)
s = Solver(name='cadical153', bootstrap_with=clauses); sols = []
while len(sols) < cap and s.solve():
    model = set(x for x in s.get_model() if x > 0)
    ms = [next(m for m in range(Q * L) if var(i, m) in model) for i in range(n)]
    sols.append(ms); s.add_clause([-var(i, ms[i]) for i in range(n)])
print("n=%d thr=%d/%d L=%d: %d solutions%s" % (n, P, Q, L, len(sols), " (cap)" if len(sols) >= cap else ""))
for ms in sols[:40]: print(ms)
if sols:
    print("per-runner value sets:")
    for i in range(n): print(" q=%d: %s" % (i + 1, sorted(set(x[i] for x in sols))))
