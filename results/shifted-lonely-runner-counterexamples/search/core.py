"""Core: exact cover check and fast float measures for shifted lonely runner."""
from fractions import Fraction as F
import math
import numpy as np

def covers_exact(v, s, delta):
    """Exact: do closed arcs {t in R/Z: ||s_i+v_i t|| <= delta} cover R/Z?  s: list of Fractions, delta Fraction.
    Uses integer arithmetic on common denominator."""
    D = delta.denominator
    for x in s: D = D * x.denominator // math.gcd(D, x.denominator)
    # arc for runner i, index m: centre (m - s_i)/v_i, half-width delta/v_i.  Scale everything by D*L where L=lcm(v)
    # Instead compare as fractions with denominator D*v_i: endpoints (m*D - S_i -/+ d)/ (D v_i)
    d = delta.numerator * (D // delta.denominator)
    S = [x.numerator * (D // x.denominator) for x in s]
    arcs = []
    for vi, Si in zip(v, S):
        for m in range(vi):
            lo = m * D - Si - d; hi = m * D - Si + d     # over D*vi
            # reduce lo into [0, D*vi)
            k = lo // (D * vi)
            lo -= k * D * vi; hi -= k * D * vi
            arcs.append((F(lo, D * vi), F(hi, D * vi)))
            if hi > D * vi: arcs.append((F(lo - D * vi, D * vi), F(hi - D * vi, D * vi)))
    arcs.sort()
    reach = F(0)
    if arcs[0][0] > 0: return False
    for lo, hi in arcs:
        if lo > reach: return False
        if hi > reach: reach = hi
        if reach >= 1: return True
    return reach >= 1

def uncovered_float(v, s, delta, return_gaps=False):
    """float: total uncovered measure (and gap list) at threshold delta."""
    v = np.asarray(v, dtype=np.float64); s = np.asarray(s, dtype=np.float64)
    vs = np.repeat(v, v.astype(int)); ss = np.repeat(s, v.astype(int))
    ms = np.concatenate([np.arange(int(x)) for x in v])
    c = ((ms - ss) / vs) % 1.0
    w = delta / vs
    lo = c - w; hi = c + w
    # unroll to [0,1): add copies shifted by +-1
    lo = np.concatenate([lo, lo - 1, lo + 1]); hi = np.concatenate([hi, hi - 1, hi + 1])
    o = np.argsort(lo); lo = lo[o]; hi = hi[o]
    reach = np.maximum.accumulate(hi)
    # gaps: lo[k] > reach[k-1]
    gl = reach[:-1]; gr = lo[1:]
    mask = (gr > gl) & (gr > 0) & (gl < 1)
    a = np.clip(gl[mask], 0, 1); b = np.clip(gr[mask], 0, 1)
    tot = float((b - a).sum())
    if return_gaps: return tot, list(zip(a, b))
    return tot

def fvals(v, s, t):
    v = np.asarray(v, dtype=np.float64); s = np.asarray(s, dtype=np.float64)
    ph = s[None, :] + np.outer(t, v)
    return np.abs(ph - np.round(ph)).min(axis=1)

def gamma_float(v, s, delta_hint=None):
    """float gamma via bisection on uncovered measure (fast), refined: gamma = inf{delta: covered}."""
    lo, hi = 0.0, 0.5
    for _ in range(60):
        mid = (lo + hi) / 2
        if uncovered_float(v, s, mid) > 0: lo = mid
        else: hi = mid
    return hi
