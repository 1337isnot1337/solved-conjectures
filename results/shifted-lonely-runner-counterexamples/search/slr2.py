"""Improved search: gap-targeted moves + optional warm start from the tight base cover."""
import sys, time, json, math, random
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np
from slr import Cover, gamma_float

def search(v, delta, G, iters, seed=0, s0=None, T0=3.0, T1=0.02, verbose=False, fixed=()):
    rng = random.Random(seed); nrng = np.random.default_rng(seed)
    n = len(v)
    C = Cover(v, delta, G)
    s = [rng.random() for _ in range(n)] if s0 is None else list(s0)
    C.set_all(s)
    cost = C.cost(); best = cost; bests = C.s.copy()
    movable = [i for i in range(n) if i not in fixed]
    for it in range(iters):
        if cost == 0: break
        T = T0 * (T1 / T0) ** (it / iters)
        i = movable[rng.randrange(len(movable))]
        r = rng.random()
        if r < 0.7:
            unc = np.flatnonzero(C.cnt == 0)
            tstar = unc[rng.randrange(len(unc))] / G
            si = (-C.v[i] * tstar + rng.uniform(-delta, delta)) % 1.0
        elif r < 0.9:
            si = (C.s[i] + rng.gauss(0, delta / 3)) % 1.0
        else:
            si = rng.random()
        c2, new, cnt2 = C.try_move(i, si)
        if c2 <= cost or rng.random() < math.exp((cost - c2) / T):
            C.commit(i, si, new, cnt2); cost = c2
            if cost < best:
                best = cost; bests = C.s.copy()
        if verbose and it % 20000 == 0: print("   it", it, "cost", cost, "best", best, flush=True)
    return best, bests

if __name__ == "__main__":
    n = int(sys.argv[1]); margin = float(sys.argv[2]); iters = int(sys.argv[3]); tries = int(sys.argv[4])
    warm = len(sys.argv) > 5 and sys.argv[5] == "warm"
    v = list(range(1, n + 1))
    delta = 1.0 / (n + 1 + margin)
    G = max(12000, 600 * n)
    for seed in range(tries):
        t = time.time()
        s0 = [0.0] * n if warm else None
        best, s = search(v, delta, G, iters, seed=seed, s0=s0)
        g = gamma_float(v, s) if best == 0 else float('nan')
        print("n=%d margin=%.2f delta=%.6f seed=%d warm=%s uncovered=%d gamma_float=%.7f E=%.3f  %.0fs" % (n, margin, delta, seed, warm, best, g, (1/g-(n+1)) if g==g else float('nan'), time.time()-t), flush=True)
        if best == 0 and g < 1/(n+1):
            json.dump({"n": n, "s": [float(x) for x in s], "gamma_float": g}, open("slr_sol_%d.json" % n, "w"))
            break
