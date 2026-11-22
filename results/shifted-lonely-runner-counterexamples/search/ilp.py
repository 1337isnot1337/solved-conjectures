"""Set-cover MILP over candidate (speed, shift) pairs at fixed delta."""
import numpy as np, time, sys
from scipy.optimize import milp, LinearConstraint, Bounds
from scipy.sparse import csr_matrix, coo_matrix

def build(cands, delta, tol=1e-12):
    """cands: list of (v, s).  returns segment-candidate incidence (csr) """
    pts = [np.array([0.0, 1.0])]
    arcs = []
    for ci, (v, s) in enumerate(cands):
        c = ((np.arange(v) - s) / v) % 1.0
        lo = c - delta / v; hi = c + delta / v
        arcs.append((ci, lo, hi))
        pts.append(lo % 1.0); pts.append(hi % 1.0)
    P = np.unique(np.concatenate(pts))
    # merge near-duplicates
    keep = np.ones(len(P), bool); keep[1:] = np.diff(P) > tol
    P = P[keep]
    mids = (P[:-1] + P[1:]) / 2
    rows = []; cols = []
    for ci, lo, hi in arcs:
        k = np.floor(lo); a_ = lo - k; b_ = hi - k
        for a, b in zip(a_, b_):
            parts = [(a, b)] if b <= 1 else [(a, 1.0), (0.0, b - 1)]
            for x, y in parts:
                i0 = np.searchsorted(mids, x - tol); i1 = np.searchsorted(mids, y + tol)
                rows.extend(range(i0, i1)); cols.extend([ci] * (i1 - i0))
    A = coo_matrix((np.ones(len(rows)), (rows, cols)), shape=(len(mids), len(cands))).tocsr()
    A.data[:] = 1.0
    A.sum_duplicates(); A.data[:] = 1.0
    return A, mids

def solve(cands, delta, time_limit=300, maxcount=None, verbose=False):
    t = time.time()
    A, mids = build(cands, delta)
    m, k = A.shape
    # drop duplicate rows cheaply: skip
    cons = [LinearConstraint(A, lb=np.ones(m), ub=np.inf)]
    speeds = sorted(set(v for v, s in cands))
    G = np.zeros((len(speeds), k)); pos = {v: i for i, v in enumerate(speeds)}
    for ci, (v, s) in enumerate(cands): G[pos[v], ci] = 1
    cons.append(LinearConstraint(csr_matrix(G), lb=0, ub=1))
    if maxcount is not None: cons.append(LinearConstraint(np.ones((1, k)), lb=0, ub=maxcount))
    if verbose: print("  MILP: %d segments x %d candidates  build %.1fs" % (m, k, time.time() - t), flush=True)
    res = milp(c=np.ones(k), constraints=cons, integrality=np.ones(k), bounds=Bounds(0, 1),
               options={"time_limit": time_limit, "disp": verbose})
    if res.x is None: return None, res
    sel = [cands[i] for i in range(k) if res.x[i] > 0.5]
    return sel, res
