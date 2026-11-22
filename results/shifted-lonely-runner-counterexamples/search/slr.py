"""Probe C: shifted lonely runner.  gamma(v;s) = max_t min_i || s_i + v_i t ||.
Counterexample to sLRC for n runners:  gamma(v;s) < 1/(n+1)."""
from fractions import Fraction as F
import numpy as np, math, random, time, sys

def gamma_exact(v, s):
    """exact value for rational shifts s (Fractions).  Maximum of the lower envelope occurs where two
    runners are at equal distance with opposite slopes (or n==1)."""
    n = len(v)
    Q = 1
    for x in s: Q = Q * x.denominator // math.gcd(Q, x.denominator)
    a = [int(x * Q) for x in s]            # shifts as integers / Q
    best = F(0); arg = None
    for i in range(n):
        for j in range(i + 1, n):
            w = v[i] + v[j]
            # (v_i+v_j) t = m - (s_i+s_j)  ->  t = (m Q - a_i - a_j) / (Q w)
            for m in range(w):
                num = m * Q - a[i] - a[j]; den = Q * w       # t = num/den
                # distance of runner k at t: || (a_k den + v_k Q num) / (Q den) ||
                D = Q * den
                mn = None
                for k in range(n):
                    r = (a[k] * den + v[k] * Q * num) % D
                    r = min(r, D - r)
                    if mn is None or r < mn:
                        mn = r
                        if mn * best.denominator <= best.numerator * D: break
                else:
                    val = F(mn, D)
                    if val > best: best = val; arg = F(num, den) % 1
    return best, arg

def gamma_float(v, s, G=None):
    """fast floating estimate via candidate points (vectorised)"""
    v = np.asarray(v, dtype=np.int64); s = np.asarray(s, dtype=np.float64)
    n = len(v); best = 0.0
    for i in range(n):
        for j in range(i + 1, n):
            w = v[i] + v[j]
            t = (np.arange(w) - s[i] - s[j]) / w
            ph = s[None, :] + np.outer(t, v)
            d = np.abs(ph - np.round(ph)).min(axis=1)
            b = d.max()
            if b > best: best = b
    return best

class Cover:
    """grid-based uncovered measure at threshold delta, for annealing"""
    def __init__(self, v, delta, G):
        self.v = np.asarray(v, dtype=np.int64); self.n = len(v); self.G = G; self.delta = delta
        self.t = np.arange(G) / G
        self.ind = np.zeros((self.n, G), dtype=np.int16)
        self.cnt = np.zeros(G, dtype=np.int32)
        self.s = np.zeros(self.n)
    def indicator(self, i, si):
        ph = si + self.v[i] * self.t
        return (np.abs(ph - np.round(ph)) <= self.delta).astype(np.int16)
    def set_all(self, s):
        self.s = np.array(s, dtype=float)
        for i in range(self.n): self.ind[i] = self.indicator(i, self.s[i])
        self.cnt = self.ind.sum(axis=0).astype(np.int32)
    def cost(self): return int((self.cnt == 0).sum())
    def try_move(self, i, si):
        new = self.indicator(i, si)
        cnt2 = self.cnt - self.ind[i] + new
        return int((cnt2 == 0).sum()), new, cnt2
    def commit(self, i, si, new, cnt2):
        self.s[i] = si; self.ind[i] = new; self.cnt = cnt2

def anneal(v, delta, G=20000, iters=200000, T0=30.0, T1=0.05, seed=0, s0=None, verbose=False):
    rng = random.Random(seed)
    C = Cover(v, delta, G)
    n = len(v)
    s = [rng.random() for _ in range(n)] if s0 is None else list(s0)
    s[0] = 0.0
    C.set_all(s)
    cost = C.cost(); best = cost; bests = C.s.copy()
    for it in range(iters):
        T = T0 * (T1 / T0) ** (it / iters)
        i = rng.randrange(1, n)
        if rng.random() < 0.3: si = rng.random()
        else: si = (C.s[i] + rng.gauss(0, 0.02)) % 1.0
        c2, new, cnt2 = C.try_move(i, si)
        if c2 <= cost or rng.random() < math.exp((cost - c2) / T):
            C.commit(i, si, new, cnt2); cost = c2
            if cost < best:
                best = cost; bests = C.s.copy()
                if best == 0: break
        if verbose and it % 20000 == 0: print(it, cost, best, flush=True)
    return best, bests

if __name__ == "__main__":
    # sanity: the Blanco-Criado-Santos certificate
    v = [1, 2, 3, 4, 5]; s = [F(x, 94) for x in (0, 46, 38, 47, 72)]
    print("gamma(1..5; BCS shifts) =", gamma_exact(v, s), " float:", gamma_float(v, [float(x) for x in s]))
    print("gamma(1..5; 0) =", gamma_exact(v, [F(0)] * 5)[0])
    v6 = [1,2,3,4,5,6]; s6 = [F(x, 67) for x in (0, 39, 37, 51, 62, 54)]
    print("gamma(1..6; BCS shifts) =", gamma_exact(v6, s6)[0])
    v6b = [2,3,4,5,6,8]; s6b = [F(x, 30) for x in (0, 29, 17, 0, 16, 22)]
    print("gamma(2,3,4,5,6,8; BCS shifts) =", gamma_exact(v6b, s6b)[0])
