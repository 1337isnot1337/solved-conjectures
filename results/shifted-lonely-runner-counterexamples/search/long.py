"""Longer annealing runs (slower cooling) + SLP + exact certification, speeds 1..n."""
import sys, time, json
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__))); sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from slr import anneal
from slr3 import slp
from focus import certify
n = int(sys.argv[1]); mult = float(sys.argv[2]); budget = float(sys.argv[3]); seed = int(sys.argv[4]) if len(sys.argv) > 4 else 500
margin = float(sys.argv[5]) if len(sys.argv) > 5 else 0.3
v = list(range(1, n + 1)); t0 = time.time()
while time.time() - t0 < budget:
    ta = time.time()
    unc, s = anneal(v, 1.0 / (n + 1 + margin), G=max(12000, 500 * n), iters=int(30000 * n * mult), seed=seed, T0=20.0, T1=0.03)
    tb = time.time()
    s2, g = slp(v, s, rounds=60)
    E = 1 / g - (n + 1)
    print("n=%d seed=%d mult=%.1f margin=%.2f uncovered=%d (anneal %.0fs)  E after SLP=%.4f  [%.0fs]" % (n, seed, mult, margin, unc, tb - ta, E, time.time() - t0), flush=True)
    if E > 0.01:
        c = certify(n, s2)
        if c:
            gex, sex = c
            print("n=%d CERT ok exact gamma=%s E=%.4f" % (n, gex, float(1 / gex) - (n + 1)), flush=True)
            json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open("slr_cert_%d.json" % n, "w"))
            break
    seed += 1
