import sys, time, json
import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dg import *

def chi_status2(D, pmax=300):
    k = len(D); M = max(D)
    # quick UNSAT attempts on short intervals
    for N in (2*M+2*k, 4*M+4*k):
        if not interval_colourable(D, k, N):
            return ("k+1", "interval N=%d" % N)
    # periodic colourings
    for p in range(k, pmax + 1):
        col = periodic_colouring(D, k, p)
        if col is not None:
            return ("<=k", "period %d: %s" % (p, ''.join(map(str, col))))
    for N in (8*M+8*k, 16*M+16*k, 40*M):
        if not interval_colourable(D, k, N):
            return ("k+1", "interval N=%d" % N)
    return ("?", "")

D = [int(x) for x in sys.argv[1:]]
t = time.time()
L = loneliness(D); w = clique_number(D)
st = chi_status2(D)
print(json.dumps({"D": D, "k": len(D), "L": str(L), "omega": w, "chi": st[0], "cert": st[1], "sec": round(time.time()-t,1)}), flush=True)
