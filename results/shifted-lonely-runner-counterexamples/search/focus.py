"""Focused (WalkSAT-style) annealing for the shifted lonely runner covering problem, then SLP polish and exact certification.
Move: pick an uncovered grid time t*, try k random runners re-phased so that they sit near the origin at t*, keep the best."""
import sys, time, json, math, random
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__))); sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np
from fractions import Fraction as F
from slr import Cover, gamma_exact
from slr3 import slp
from slr_auto import covers_exact

def focused_anneal(v, delta, G, iters, seed, k=4, T0=3.0, T1=0.05, s0=None, pf=0.85):
    rng = random.Random(seed); n = len(v)
    C = Cover(v, delta, G)
    s = [rng.random() for _ in range(n)] if s0 is None else list(s0)
    s[0] = 0.0
    C.set_all(s); cost = C.cost(); best = cost; bests = C.s.copy()
    for it in range(iters):
        if cost == 0: break
        T = T0 * (T1 / T0) ** (it / iters)
        if rng.random() < pf:
            unc = np.flatnonzero(C.cnt == 0)
            g = int(unc[rng.randrange(len(unc))]); t = g / G
            cand = None
            for _ in range(k):
                i = rng.randrange(1, n)
                si = (-v[i] * t + rng.uniform(-0.7, 0.7) * delta) % 1.0
                c2, new, cnt2 = C.try_move(i, si)
                if cand is None or c2 < cand[0]: cand = (c2, i, si, new, cnt2)
            c2, i, si, new, cnt2 = cand
        else:
            i = rng.randrange(1, n)
            si = (C.s[i] + rng.gauss(0, 0.02)) % 1.0
            c2, new, cnt2 = C.try_move(i, si)
        if c2 <= cost or rng.random() < math.exp((cost - c2) / T):
            C.commit(i, si, new, cnt2); cost = c2
            if cost < best: best = cost; bests = C.s.copy()
    return best, bests

def certify(n, s_float, Q=10**6):
    v = list(range(1, n + 1))
    s = [F(round(x * Q) % Q, Q) for x in s_float]
    g, _ = gamma_exact(v, s)
    if not g < F(1, n + 1): return None
    if not covers_exact(v, s, (g + F(1, n + 1)) / 2): return None
    return g, s

if __name__ == "__main__":
    n = int(sys.argv[1]); budget = float(sys.argv[2]); seed0 = int(sys.argv[3]) if len(sys.argv) > 3 else 0
    v = list(range(1, n + 1)); t0 = time.time(); seed = seed0; best = (1.0, None)
    G = max(12000, 500 * n)
    while time.time() - t0 < budget:
        for margin in (0.5, 0.25):
            delta = 1.0 / (n + 1 + margin)
            ta = time.time()
            unc, s = focused_anneal(v, delta, G, iters=6000 * n, seed=seed)
            tb = time.time()
            s2, g = slp(v, s, rounds=40)
            E = 1 / g - (n + 1)
            print("n=%d seed=%d margin=%.2f uncovered=%d (anneal %.0fs)  E after SLP=%.4f  [%.0fs]" % (n, seed, margin, unc, tb - ta, E, time.time() - t0), flush=True)
            if g < best[0]: best = (g, s2)
            if E > 0.02: break
        if best[0] < 1 / (n + 1) * (1 - 1e-4): break
        seed += 1
    g, s = best
    if g < 1 / (n + 1):
        c = certify(n, s)
        if c:
            gex, sex = c
            print("n=%d CERT ok exact gamma=%s (=%.8f) < 1/%d  E=%.4f" % (n, gex, float(gex), n + 1, float(1 / gex) - (n + 1)), flush=True)
            json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open("slr_cert_%d.json" % n, "w"))
        else: print("n=%d float solution failed exact certification" % n, flush=True)
    else:
        print("n=%d FAILED within budget; best E=%.4f" % (n, 1 / g - (n + 1)), flush=True)
