#!/usr/bin/env python3
"""Polish and certify saved annealer states (needs numpy and scipy). Usage: python3 polish_candidates.py OUTDIR"""
import sys, os, json, glob
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
from slr3 import slp
from focus import certify
OUT = sys.argv[1]
for f in sorted(glob.glob(os.path.join(OUT, 'cand', '*.json'))):
    d = json.load(open(f)); n = d['n']; p = os.path.join(OUT, 'slr_cert_%d.json' % n)
    if os.path.exists(p): continue
    v = list(range(1, n + 1)); s2, g = slp(v, d['shifts'], rounds=60); E = 1 / g - (n + 1); msg = '%s E=%.4f' % (os.path.basename(f), E)
    if E > 0.01:
        c = certify(n, s2)
        if c:
            json.dump({'n': n, 'speeds': v, 'Q': 10**6, 'shifts_num': [int(x * 10**6) for x in c[1]], 'gamma': str(c[0])}, open(p, 'w')); msg += ' CERT gamma=%s' % c[0]
    print(msg, flush=True)
