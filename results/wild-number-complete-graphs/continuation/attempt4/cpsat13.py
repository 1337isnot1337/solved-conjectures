"""CP-SAT on A13(k): clauses from gen13 (exact bad, sb) + redundant linear counting constraints:
  b_tau = exact bad indicator; |Bad| <= 34 (k=0) / 35 (k=1);
  for every triple A:  sum_{tau subset W\\A} b_tau >= 10 * (1 - b_A)      (complement 6-set must be blocked)
  global: 10*(84 - |B|) <= 20|B| - 2*P2   with q_{t,t'} >= b_t + b_t' - 1 for disjoint pairs.
All are consequences of 'every split hits Bad' (proof in LOG/REPORT)."""
import sys, itertools, time
from ortools.sat.python import cp_model
from gen13 import build

k = int(sys.argv[1]); tl = float(sys.argv[2]); sb = sys.argv[3] if len(sys.argv) > 3 else 'all'
red = int(sys.argv[4]) if len(sys.argv) > 4 else 1
cl, nv, y, bad, cov, NY = build(k, sb, True, False)
M = cp_model.CpModel()
X = [None] + [M.NewBoolVar('v%d' % i) for i in range(1, nv + 1)]
def L(l): return X[l] if l > 0 else X[-l].Not()
for c in cl: M.AddBoolOr([L(l) for l in c])
W = range(9)
B = {t: X[v] for t, v in bad.items()}
M.Add(sum(B.values()) <= (34 if k == 0 else 35))
if red:
    for A in B:
        R = [x for x in W if x not in A]
        M.Add(sum(B[t] for t in itertools.combinations(R, 3)) >= 10).OnlyEnforceIf(B[A].Not())
    if red > 1:
        q = []
        for t1, t2 in itertools.combinations(B, 2):
            if set(t1) & set(t2): continue
            z = M.NewBoolVar(''); M.AddBoolOr([B[t1].Not(), B[t2].Not(), z]); q.append(z)
        M.Add(10 * (84 - sum(B.values())) <= 20 * sum(B.values()) - 2 * sum(q))
S = cp_model.CpSolver()
S.parameters.max_time_in_seconds = tl
S.parameters.num_workers = 1
S.parameters.log_search_progress = False
t0 = time.time()
r = S.Solve(M)
print('k', k, 'sb', sb, 'red', red, S.StatusName(r), 'time %.1f' % (time.time() - t0), flush=True)
