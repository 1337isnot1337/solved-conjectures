"""hybrid: speeds V, frozen runners (shift fixed), free runners annealed (afz) then SLP on free shifts, exact check.
usage: python3 hyb.py n K drop seeds [margin] [mult] [T0]
 speeds = {1..n+1} minus {drop}; runners with speed > K frozen at shift 0; others free."""
import sys, os, json, time, subprocess, random
import numpy as np
from scipy.optimize import linprog
from fractions import Fraction as F
from gam import gamma_int
HERE = os.path.dirname(os.path.abspath(__file__))
def log(m): print(time.strftime('%H:%M:%S'), m, flush=True)

def local_maxima(v, s, tol):
    v = np.asarray(v, dtype=np.int64); s = np.asarray(s, dtype=np.float64); n = len(v)
    out_h = []; out_i = []; out_j = []; fmax = 0.0
    for i in range(n):
        for j in range(n):
            if i == j: continue
            w = v[i] + v[j]
            t = (np.arange(w) - s[i] - s[j]) / w
            pi = (s[i] + v[i] * t) % 1.0
            mask = (pi > 1e-12) & (pi < 0.5)
            if not mask.any(): continue
            t = t[mask]; pi = pi[mask]
            ph = s[None, :] + np.outer(t, v)
            d = np.abs(ph - np.round(ph)); f = d.min(axis=1)
            good = f >= pi - 1e-10
            if good.any():
                hh = pi[good]; out_h.append(hh); out_i.append(np.full(len(hh), i)); out_j.append(np.full(len(hh), j))
                fmax = max(fmax, hh.max())
    h = np.concatenate(out_h); I = np.concatenate(out_i); J = np.concatenate(out_j)
    keep = h >= fmax - tol
    return h[keep], I[keep], J[keep], fmax

def slp(v, s, free, rounds=60):
    n = len(v); s = np.array(s, float); cur = None; rho = None
    for r in range(rounds):
        h, I, J, fmax = local_maxima(v, s, tol=0.25 * (cur if cur else 0.02))
        if cur is None: cur = fmax; rho = 0.2 * fmax
        m = len(h); A = np.zeros((m, n + 1)); b = -h.copy()
        for k in range(m):
            i, j = I[k], J[k]; w = v[i] + v[j]
            A[k, i] += v[j] / w; A[k, j] -= v[i] / w; A[k, n] = -1.0
        c = np.zeros(n + 1); c[n] = 1.0
        bounds = [((-rho, rho) if free[i] else (0, 0)) for i in range(n)] + [(None, None)]
        res = linprog(c, A_ub=A, b_ub=b, bounds=bounds, method="highs")
        if res.status != 0: break
        s_new = (s + res.x[:n]) % 1.0
        _, _, _, f_new = local_maxima(v, s_new, tol=1e-9)
        if f_new < fmax - 1e-12: s = s_new; cur = f_new; rho = min(rho * 1.5, 0.5 * cur)
        else:
            rho *= 0.4
            if rho < 1e-9: break
    _, _, _, fmax = local_maxima(v, s, tol=1e-9)
    return s, fmax

def certify(v, s, Q=10**6):
    m = [round(x * Q) % Q for x in s]; n = len(v)
    g = gamma_int(v, m, Q)
    if g < F(1, n + 1): return g, m
    return None

def run_one(v, s0, free, seed, margin, mult, T0, G=None, tag=''):
    n = len(v); delta = 1.0 / (n + 1 + margin)
    G = G or max(12000, 500 * n)
    spec = os.path.join(HERE, 'spec_%d_%s.txt' % (os.getpid(), tag))
    with open(spec, 'w') as f:
        for vi, si, fi in zip(v, s0, free): f.write('%d %.17g %d\n' % (vi, si, fi))
    nf = sum(free); iters = int(30000 * nf * mult)
    p = subprocess.run([os.path.join(HERE, 'afz'), str(G), str(iters), str(seed), repr(delta), str(T0), '0.5', spec], capture_output=True, text=True)
    out = p.stdout.split(); cost = int(out[0]); s = [float(x) for x in out[1:1 + n]]
    os.remove(spec)
    return cost, s

if __name__ == '__main__':
    n, K, drop, seeds = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4])
    margin = float(sys.argv[5]) if len(sys.argv) > 5 else 0.3; mult = float(sys.argv[6]) if len(sys.argv) > 6 else 0.4; T0 = float(sys.argv[7]) if len(sys.argv) > 7 else 16
    v = [x for x in range(1, n + 2) if x != drop]; assert len(v) == n
    free = [1 if x <= K and x != 1 else 0 for x in v]
    for seed in range(seeds):
        random.seed(seed)
        s0 = [random.random() if fr else 0.0 for fr in free]
        t = time.time()
        cost, s = run_one(v, s0, free, seed, margin, mult, T0)
        s2, g = slp(v, s, free)
        E = 1 / g - (n + 1)
        res = ''
        if E > 0:
            c = certify(v, s2)
            if c:
                gex, m = c; fn = os.path.join(HERE, 'hcert_%d_%d_%d_%d.json' % (n, K, drop, seed))
                json.dump([{"n": n, "speeds": v, "shift_den": 10**6, "shift_num": m, "gamma": str(gex)}], open(fn, 'w'))
                res = 'CERT gamma=%s E=%.4f -> %s' % (gex, float(1 / gex) - n - 1, fn)
        log('n=%d K=%d drop=%d seed=%d margin=%.2f mult=%.2f T0=%g cost=%d E_slp=%.4f %.0fs %s' % (n, K, drop, seed, margin, mult, T0, cost, E, time.time() - t, res))
