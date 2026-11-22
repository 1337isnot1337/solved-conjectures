"""anneal (grid) -> sequential-LP polish (true minimax) for shifted lonely runner with speeds v."""
import sys, time, json, math, random
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np
from scipy.optimize import linprog
from slr import anneal

def local_maxima(v, s, tol):
    """all local maxima of f(t)=min_i ||s_i+v_i t|| with value >= fmax - tol.
    returns list of (h, i, j) with i the increasing runner, j the decreasing one, plus fmax"""
    v = np.asarray(v, dtype=np.int64); s = np.asarray(s, dtype=np.float64); n = len(v)
    out_h = []; out_i = []; out_j = []
    fmax = 0.0
    for i in range(n):
        for j in range(n):
            if i == j: continue
            w = v[i] + v[j]
            # runner i increasing: phase p_i in (0,1/2), runner j decreasing with p_j = 1 - p_i  => (v_i+v_j) t + s_i + s_j integer
            t = (np.arange(w) - s[i] - s[j]) / w
            pi = (s[i] + v[i] * t) % 1.0
            mask = (pi > 1e-12) & (pi < 0.5)
            if not mask.any(): continue
            t = t[mask]; pi = pi[mask]
            ph = s[None, :] + np.outer(t, v)
            d = np.abs(ph - np.round(ph))
            f = d.min(axis=1)
            good = f >= pi - 1e-10
            if good.any():
                hh = pi[good]
                out_h.append(hh); out_i.append(np.full(len(hh), i)); out_j.append(np.full(len(hh), j))
                fmax = max(fmax, hh.max())
    h = np.concatenate(out_h); I = np.concatenate(out_i); J = np.concatenate(out_j)
    keep = h >= fmax - tol
    return h[keep], I[keep], J[keep], fmax

def slp(v, s, rounds=60, rho=None, verbose=False):
    v = list(v); n = len(v); s = np.array(s, dtype=float)
    cur = None
    hist = []
    for r in range(rounds):
        h, I, J, fmax = local_maxima(v, s, tol=0.25 * (cur if cur else 0.02))
        if cur is None:
            cur = fmax
            if rho is None: rho = 0.2 * fmax
        hist.append(fmax)
        m = len(h)
        # variables: ds_0..ds_{n-1}, z ; minimise z
        A = np.zeros((m, n + 1)); b = -h.copy()
        for k in range(m):
            i, j = I[k], J[k]; w = v[i] + v[j]
            A[k, i] += v[j] / w; A[k, j] -= v[i] / w; A[k, n] = -1.0
        c = np.zeros(n + 1); c[n] = 1.0
        bounds = [(0, 0)] + [(-rho, rho)] * (n - 1) + [(None, None)]
        res = linprog(c, A_ub=A, b_ub=b, bounds=bounds, method="highs")
        if res.status != 0: break
        s_new = (s + res.x[:n]) % 1.0
        _, _, _, f_new = local_maxima(v, s_new, tol=1e-9)
        if verbose: print("   round %d: fmax %.7f -> %.7f (pred %.7f) rho=%.2e m=%d" % (r, fmax, f_new, res.x[n], rho, m), flush=True)
        if f_new < fmax - 1e-12:
            s = s_new; cur = f_new; rho = min(rho * 1.5, 0.5 * cur)
        else:
            rho *= 0.4
            if rho < 1e-9: break
    _, _, _, fmax = local_maxima(v, s, tol=1e-9)
    return s, fmax

if __name__ == "__main__":
    n = int(sys.argv[1]); margin = float(sys.argv[2]); iters = int(sys.argv[3]); tries = int(sys.argv[4])
    v = list(range(1, n + 1))
    delta = 1.0 / (n + 1 + margin)
    G = max(12000, 400 * n)
    bestg = 1.0
    for seed in range(tries):
        t = time.time()
        unc, s = anneal(v, delta, G=G, iters=iters, seed=seed, T0=20.0, T1=0.05)
        s2, g = slp(v, s, rounds=40)
        E = 1 / g - (n + 1)
        print("n=%d seed=%d anneal uncovered=%d -> after SLP gamma=%.7f  E=%.3f  (need E>0)  %.0fs" % (n, seed, unc, g, E, time.time() - t), flush=True)
        if g < bestg:
            bestg = g
            json.dump({"n": n, "s": [float(x) for x in s2], "gamma_float": g}, open("slr_sol_%d.json" % n, "w"))
        if E > 0.05: break
