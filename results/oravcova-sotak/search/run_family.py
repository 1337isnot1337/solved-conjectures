import sys, json, math, time
import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from loops import find_two_loops
from family import build
name = sys.argv[1]
W = {"A5": [1,3,4,7], "A6": [1,3,4,5,9], "W2": [1,2,3,4,5,7,12], "W3": [1,4,5,6,7,11,13]}[name]
k = len(W) + 1
rs = [int(x) for x in sys.argv[2].split(",")]; lmax = int(sys.argv[3]); budget = int(sys.argv[4]) if len(sys.argv) > 4 else 50000
t0 = time.time(); best = None
for r in rs:
    if r in W: continue
    pairs = [(a, b) for a in range(2, lmax + 1) for b in range(a + 1, lmax + 1) if math.gcd(a, b) == 1]
    pairs.sort(key=lambda ab: (ab[0] - 1) * (ab[1] - 1))
    found = None; unknown = 0
    for (a, b) in pairs:
        res = find_two_loops(W, k, r, a, b, budget=budget)
        if res == '?': unknown += 1; continue
        if res is not None: found = (a, b, res); break
    print("r=%d: first coprime loop pair %s (unknown=%d) [%.0fs]" % (r, (found[0], found[1]) if found else None, unknown, time.time() - t0), flush=True)
    if found:
        u = found[2][0]
        cert = build(W, k, r, u, lmax=int(sys.argv[5]) if len(sys.argv) > 5 else 60)
        score = (len(cert["failed"]), cert["largest_gap"])
        if best is None or score < best[0]:
            best = (score, cert); json.dump(cert, open("fam_%s.json" % name, "w"))
        if not cert["failed"] and cert["largest_gap"] < 80: break
print("DONE", name, "best:", best[0] if best else None, "r =", best[1]["r"] if best else None, flush=True)
