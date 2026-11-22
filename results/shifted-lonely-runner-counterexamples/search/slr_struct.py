import sys, time, json, math
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np
from fractions import Fraction as F
from slr import anneal, gamma_exact
from slr3 import slp, local_maxima
def explore(n, g, tries=8, iters=200000):
    v = list(range(1, n+1)); N = n + g
    target = 1.0/(N+1)
    best = None
    for seed in range(tries):
        unc, s = anneal(v, target*1.004, G=24000, iters=iters, seed=seed, T0=20.0, T1=0.05)
        s2, gam = slp(v, s, rounds=60)
        if best is None or gam < best[0]: best = (gam, s2, seed)
        if gam <= target*1.0000001: break
    gam, s, seed = best
    print("n=%d: best gamma=%.8f  target 1/%d=%.8f  (seed %d)" % (n, gam, N+1, target, seed), flush=True)
    # normalise by time shift so that many shifts become nice: try all time-shifts making runner 1 shift 0
    s = np.array(s); s = (s - s[0]*np.array(v)) % 1.0
    for den in (N+1, 2*(N+1), 4*(N+1)):
        x = s*den
        err = np.abs(x-np.round(x)).max()
        print("   shifts * %d = %s   (max rounding err %.4f)" % (den, np.round(x,3).tolist(), err), flush=True)
    return s
for n, g in ((11,2),(13,2),(8,1),(15,2)):
    explore(n, g)
