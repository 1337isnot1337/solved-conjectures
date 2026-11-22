"""Anneal over 'rules': base B (fixed runners, shift 0) + free candidate runners (present/absent + shift)."""
import numpy as np, math, random, sys, json, time
from fractions import Fraction as F
from core import covers_exact, uncovered_float

def arcs_union(v, s, delta):
    """merged disjoint union of arcs within [0,1] as arrays (L,R)."""
    v = np.asarray(v, dtype=np.float64); s = np.asarray(s, dtype=np.float64)
    if len(v) == 0: return np.zeros(0), np.zeros(0)
    vi = v.astype(int)
    vs = np.repeat(v, vi); ss = np.repeat(s, vi)
    ms = np.concatenate([np.arange(k) for k in vi])
    c = ((ms - ss) / vs) % 1.0
    w = delta / vs
    lo = np.concatenate([c - w, c - w - 1, c - w + 1]); hi = np.concatenate([c + w, c + w - 1, c + w + 1])
    keep = (hi > 0) & (lo < 1)
    lo = lo[keep]; hi = hi[keep]
    o = np.argsort(lo); lo = lo[o]; hi = hi[o]
    reach = np.maximum.accumulate(hi)
    start = np.ones(len(lo), bool); start[1:] = lo[1:] > reach[:-1]
    idx = np.flatnonzero(start)
    L = lo[idx]; R = np.append(reach[idx[1:] - 1], reach[-1])
    return np.clip(L, 0, 1), np.clip(R, 0, 1)

def gaps_of(v, s, delta):
    L, R = arcs_union(v, s, delta)
    if len(L) == 0: return np.array([0.0]), np.array([1.0])
    ga = np.concatenate([[0.0], R]); gb = np.concatenate([L, [1.0]])
    m = gb > ga + 1e-15
    return ga[m], gb[m]

def uncovered_in_gaps(ga, gb, v, s, delta):
    """measure of union(gaps) minus union(arcs of (v,s))."""
    if len(ga) == 0: return 0.0
    L, R = arcs_union(v, s, delta)
    if len(L) == 0: return float((gb - ga).sum())
    # cumulative covered measure M(x)
    xs = np.empty(2 * len(L)); xs[0::2] = L; xs[1::2] = R
    cum = np.zeros(2 * len(L)); cum[1::2] = R - L
    cum = np.cumsum(cum)
    M = lambda x: np.interp(x, xs, cum)
    cov = M(gb) - M(ga)
    return float((gb - ga).sum() - cov.sum())

class RuleSearch:
    def __init__(self, fixed_v, cand, n_target, delta, seed=0, fixed_s=None):
        self.fixed_v = list(fixed_v); self.cand = list(cand); self.n = n_target; self.delta = delta
        self.fixed_s = [0.0]*len(fixed_v) if fixed_s is None else list(fixed_s)
        self.ga, self.gb = gaps_of(self.fixed_v, self.fixed_s, delta)
        self.k = n_target - len(self.fixed_v)    # number of candidates that must be present
        assert 0 <= self.k <= len(self.cand)
        self.rng = random.Random(seed)
    def cost(self, pres, sh):
        v = [self.cand[i] for i in pres]; s = [sh[i] for i in pres]
        return uncovered_in_gaps(self.ga, self.gb, v, s, self.delta)
    def gap_point(self, pres, sh):
        v = [self.cand[i] for i in pres]; s = [sh[i] for i in pres]
        ga, gb = gaps_of(self.fixed_v + v, self.fixed_s + s, self.delta)
        if len(ga) == 0: return None
        j = self.rng.randrange(len(ga)); return self.rng.uniform(ga[j], gb[j])
    def run(self, iters=20000, T0=None, T1=None, init=None, verbose=False):
        rng = self.rng; d = self.delta
        m = len(self.cand)
        if init is None:
            pres = set(rng.sample(range(m), self.k)); sh = {i: 0.0 for i in range(m)}
        else:
            pres, sh = init
        cost = self.cost(pres, sh)
        if T0 is None: T0 = max(cost, 1e-6) * 0.05
        if T1 is None: T1 = T0 * 1e-3
        best = (cost, set(pres), dict(sh))
        for it in range(iters):
            if best[0] <= 0: break
            T = T0 * (T1 / T0) ** (it / iters)
            p2 = set(pres); s2 = dict(sh)
            r = rng.random()
            if r < 0.25 and self.k < m and self.k > 0:
                a = rng.choice(sorted(p2)); b = rng.choice([i for i in range(m) if i not in p2])
                p2.remove(a); p2.add(b); i = b
            else:
                if not p2: break
                i = rng.choice(sorted(p2))
            r = rng.random()
            vi = self.cand[i]
            if r < 0.5:
                t = self.gap_point(p2, s2)
                if t is None: s2[i] = rng.random()
                else: s2[i] = (-vi * t + rng.uniform(-d, d)) % 1.0
            elif r < 0.8: s2[i] = (s2[i] + rng.gauss(0, d / 2)) % 1.0
            else: s2[i] = rng.random()
            c2 = self.cost(p2, s2)
            if c2 <= cost or rng.random() < math.exp((cost - c2) / T):
                pres, sh, cost = p2, s2, c2
                if cost < best[0]: best = (cost, set(pres), dict(sh))
            if verbose and it % 2000 == 0: print("  it", it, cost, best[0], flush=True)
        return best

def full_config(rs, pres, sh):
    v = rs.fixed_v + [rs.cand[i] for i in sorted(pres)]
    s = rs.fixed_s + [sh[i] for i in sorted(pres)]
    o = np.argsort(v)
    return [v[k] for k in o], [s[k] for k in o]
