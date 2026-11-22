"""Independent check of the K_n - tK_2 certificates (all pairs of incident edges)."""
import os
_HERE = os.path.dirname(os.path.abspath(__file__))
import json, itertools
from fractions import Fraction
d = json.load(open(os.path.join(_HERE, '..', 'certificates.json')))
for c in d['Kn_minus_F']:
    n, F, p, q, E, col = c['n'], c['F'], c['p'], c['q'], c['edges'], c['colour']
    t = len(F); m = (n-1)//2
    assert t == (n-3)//4 and len(E) == len(col)
    Fs = {frozenset(e) for e in F}
    assert len({v for e in F for v in e}) == 2*t
    keyE = [frozenset(e) for e in E]
    assert len(set(keyE)) == len(E) and all(len(k) == 2 for k in keyE)
    assert set(keyE) == {frozenset(x) for x in itertools.combinations(range(n), 2)} - Fs
    assert all(0 <= x < p for x in col)
    bad = 0
    for (e, ce), (f, cf) in itertools.combinations(zip(keyE, col), 2):
        if e & f:
            dd = (ce - cf) % p; dd = min(dd, p - dd)
            if dd < q: bad += 1
    deg = [sum(v in e for e in keyE) for v in range(n)]
    D = max(deg)
    lo, up = Fraction(len(E), m), Fraction(p, q)
    print(n, "t=%d |E|=%d Delta=%d bad_pairs=%d  %s <= chi'_c <= %s ; Delta+1/2=%s, Delta+1=%d ; %s" % (
        t, len(E), D, bad, lo, up, D + Fraction(1, 2), D+1,
        "OK" if bad == 0 and D + Fraction(1, 2) < lo <= up < D + 1 and D == n-1 else "FAIL"))
