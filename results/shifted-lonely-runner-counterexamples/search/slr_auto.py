"""Find and exactly certify a counterexample to the shifted LRC for n runners with speeds 1..n."""
import sys, time, json, math, random
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np
from fractions import Fraction as F
from slr import anneal, gamma_exact
from slr3 import slp

def covers_exact(v, s, delta):
    """independent check: do the closed arcs {t: ||s_i+v_i t|| <= delta} cover R/Z ?  (exact rationals)"""
    arcs = []
    for vi, si in zip(v, s):
        for m in range(vi):
            c = (m - si) / vi
            lo = c - delta / vi; hi = c + delta / vi
            # wrap into [0,1)
            k = lo.numerator // lo.denominator
            lo -= k; hi -= k
            arcs.append((lo, hi))
            if hi > 1: arcs.append((lo - 1, hi - 1))
    arcs.sort()
    reach = F(0)
    if arcs[0][0] > 0: return False
    for lo, hi in arcs:
        if lo > reach: return False
        if hi > reach: reach = hi
        if reach >= 1: return True
    return reach >= 1

def certify(n, s_float, Q=10**6):
    v = list(range(1, n + 1))
    s = [F(round(x * Q) % Q, Q) for x in s_float]
    g, arg = gamma_exact(v, s)
    ok = g < F(1, n + 1)
    # independent cover check at a threshold strictly between g and 1/(n+1)
    mid = (g + F(1, n + 1)) / 2
    ok2 = covers_exact(v, s, mid) if ok else False
    return ok and ok2, g, s

if __name__ == "__main__":
    n = int(sys.argv[1]); budget = float(sys.argv[2])
    v = list(range(1, n + 1)); t0 = time.time(); seed = 0; best = (1.0, None)
    while time.time() - t0 < budget:
        for margin in (0.6, 0.25):
            delta = 1.0 / (n + 1 + margin)
            unc, s = anneal(v, delta, G=max(12000, 500 * n), iters=30000 * n, seed=seed, T0=20.0, T1=0.03)
            s2, g = slp(v, s, rounds=40)
            E = 1 / g - (n + 1)
            print("n=%d seed=%d margin=%.2f uncovered=%d  E after SLP=%.4f  [%.0fs]" % (n, seed, margin, unc, E, time.time() - t0), flush=True)
            if g < best[0]: best = (g, s2)
            if E > 0.02: break
        if best[0] < 1 / (n + 1) * (1 - 1e-4): break
        seed += 1
    g, s = best
    if g < 1 / (n + 1):
        ok, gex, sex = certify(n, s)
        print("n=%d CERT ok=%s exact gamma=%s (=%.8f) < 1/%d (=%.8f)  E=%.4f" % (n, ok, gex, float(gex), n + 1, 1 / (n + 1), float(1 / gex) - (n + 1)), flush=True)
        if ok:
            json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open("slr_cert_%d.json" % n, "w"))
    else:
        print("n=%d FAILED within budget; best E=%.4f" % (n, 1 / g - (n + 1)), flush=True)
