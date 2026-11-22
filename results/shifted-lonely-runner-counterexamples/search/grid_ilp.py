import sys, time
from ilp import solve
from core import covers_exact
from fractions import Fraction as F
n = int(sys.argv[1]); dd = int(sys.argv[2]); Q = int(sys.argv[3]); tl = float(sys.argv[4])
speeds = [int(x) for x in sys.argv[5].split(",")] if len(sys.argv) > 5 else list(range(1, n+1))
d = 1.0/dd
cands = [(v, j / Q) for v in speeds for j in range(Q) if not (v == speeds[0] and j > 0)]
t = time.time()
sel, res = solve(cands, d, time_limit=tl, maxcount=len(speeds), verbose=False)
print("n=%d delta=1/%d Q=%d status=%s %.0fs" % (len(speeds), dd, Q, res.status, time.time() - t))
if sel and len(sel) == len(speeds):
    sel = sorted(sel)
    v = [a for a, b in sel]; s = [F(round(b * Q), Q) for a, b in sel]
    print("  speeds", v); print("  shifts*Q", [int(x * Q) for x in s])
    print("  exact cover at 1/%d:" % dd, covers_exact(v, s, F(1, dd)))
