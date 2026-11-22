import numpy as np
from rule_anneal import arcs_union, gaps_of, uncovered_in_gaps
def redundant(v, s, delta, cand=None):
    """indices i such that removing runner i keeps the cover (float)."""
    out = []
    idx = range(len(v)) if cand is None else cand
    for i in idx:
        vv = v[:i] + v[i+1:]; ss = s[:i] + s[i+1:]
        ga, gb = gaps_of(vv, ss, delta)
        if (gb - ga).sum() < 1e-13: out.append(i)
    return out
def greedy_remove(v, s, delta, order=None, protect=()):
    v = list(v); s = list(s); removed = []
    ga, gb = gaps_of(v, s, delta)
    if (gb-ga).sum() > 1e-13: return None
    cand = sorted(range(len(v)), key=lambda i: -v[i]) if order is None else order
    keep = set(range(len(v)))
    for i in cand:
        if v[i] in protect: continue
        k2 = sorted(keep - {i})
        ga, gb = gaps_of([v[j] for j in k2], [s[j] for j in k2], delta)
        if (gb - ga).sum() < 1e-13: keep.discard(i); removed.append(v[i])
    return removed
