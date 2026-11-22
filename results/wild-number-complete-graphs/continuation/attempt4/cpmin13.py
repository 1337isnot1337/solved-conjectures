"""CP-SAT: minimise the number of good splits over abstract A13(k) colourings (relaxation of split clauses).
Prints incumbents (upper bounds on min #good) and final bound. Also dumps best colouring."""
import sys, itertools, time, json
from ortools.sat.python import cp_model
from gen13 import build

k = int(sys.argv[1]); tl = float(sys.argv[2]); sb = sys.argv[3] if len(sys.argv) > 3 else 'all'
cl, nv, y, bad, cov, NY = build(k, sb, True, False)
# drop split clauses (length-3 clauses on bad vars only)
badv = set(bad.values())
cl = [c for c in cl if not (len(c) == 3 and all(l in badv for l in c))]
M = cp_model.CpModel()
X = [None] + [M.NewBoolVar('v%d' % i) for i in range(1, nv + 1)]
def L(l): return X[l] if l > 0 else X[-l].Not()
for c in cl: M.AddBoolOr([L(l) for l in c])
W = list(range(9)); good = []
for A in itertools.combinations(W[1:], 2):
    A = (0,) + A; R = [x for x in W if x not in A]
    for B in itertools.combinations(R[1:], 2):
        B = (R[0],) + B; C = tuple(x for x in R if x not in B)
        g = M.NewBoolVar(''); M.AddBoolOr([X[bad[A]], X[bad[B]], X[bad[C]], g]); good.append(g)
M.Minimize(sum(good))
class CB(cp_model.CpSolverSolutionCallback):
    def __init__(s): super().__init__(); s.t0 = time.time()
    def on_solution_callback(s):
        print('incumbent', s.ObjectiveValue(), 'bound', s.BestObjectiveBound(), 't %.0f' % (time.time() - s.t0), flush=True)
        col = {'%d-%d' % e: c for (e, c), v in y.items() if s.Value(X[v])}
        json.dump(col, open('best_k%d.json' % k, 'w'))
S = cp_model.CpSolver(); S.parameters.max_time_in_seconds = tl; S.parameters.num_workers = 1
r = S.Solve(M, CB())
print('final', S.StatusName(r), S.ObjectiveValue(), 'bound', S.BestObjectiveBound(), flush=True)
