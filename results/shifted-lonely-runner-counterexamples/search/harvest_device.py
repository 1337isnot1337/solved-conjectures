#!/usr/bin/env python3
"""Unattended search for shifted-lonely-runner certificates with speeds 1..n (no agent, no tokens).
Usage: python3 harvest_device.py WORKER NWORKERS OUTDIR ANNEAL_BIN [n ...]      (default targets: 31..94)
Each attempt runs the C annealer (grid cover at threshold 1/(n+1.3)). States with at most 8 uncovered grid
points are saved to OUTDIR/cand/. If numpy and scipy are available the state is then polished (sequential LP)
and, when 1/gamma > n+1.01, rounded and checked exactly; a certificate is written to OUTDIR/slr_cert_<n>.json.
To stop all workers, create a file named STOP in OUTDIR."""
import sys, os, time, json, subprocess, itertools
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
worker, nworkers, OUT, BIN = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3], sys.argv[4]
targets = [int(x) for x in sys.argv[5:]] or list(range(31, 95))
try:
    from slr3 import slp
    from focus import certify
    FULL, WHY = True, ''
except Exception as e:
    FULL, WHY = False, repr(e)
os.makedirs(os.path.join(OUT, 'cand'), exist_ok=True)
LOG = os.path.join(OUT, 'worker%d.log' % worker)
def log(m):
    with open(LOG, 'a') as f: f.write(time.strftime('%Y-%m-%d %H:%M:%S ') + m + '\n')
def cert_path(n): return os.path.join(OUT, 'slr_cert_%d.json' % n)
def stop(): return os.path.exists(os.path.join(OUT, 'STOP'))
def attempt(n, seed, mult=2, margin=0.3, thr=8):
    v = list(range(1, n + 1)); G = max(12000, 500 * n); t0 = time.time()
    out = subprocess.run([BIN, str(n), str(G), str(int(30000 * n * mult)), str(seed), str(margin), '20.0', '0.03'], capture_output=True, text=True).stdout.split()
    cost, s = int(out[0]), [float(x) for x in out[1:]]
    msg = 'n=%d seed=%d uncovered=%d (anneal %.0fs)' % (n, seed, cost, time.time() - t0)
    if cost <= thr:
        json.dump({'n': n, 'seed': seed, 'uncovered': cost, 'shifts': s}, open(os.path.join(OUT, 'cand', 'n%d_seed%d.json' % (n, seed)), 'w'))
        if FULL:
            s2, g = slp(v, s, rounds=60); E = 1 / g - (n + 1)
            msg += '  E after SLP=%.4f' % E
            if E > 0.01:
                c = certify(n, s2)
                if c:
                    gex, sex = c
                    json.dump({'n': n, 'speeds': v, 'Q': 10**6, 'shifts_num': [int(x * 10**6) for x in sex], 'gamma': str(gex)}, open(cert_path(n), 'w'))
                    msg += '  CERT exact gamma=%s' % gex
                else: msg += '  (exact certification failed)'
    log(msg)
log('start worker %d of %d; polish and exact check available: %s %s; targets %s' % (worker, nworkers, FULL, WHY, targets))
for rnd in itertools.count():
    todo = [n for n in targets if not os.path.exists(cert_path(n))]
    if stop() or not todo: log('stopping (STOP file or nothing left)'); break
    sweep = (worker == nworkers - 1 and nworkers > 1) or (nworkers == 1 and rnd % 4 == 3)
    ns = (todo[6:] or todo) if sweep else todo[:6]
    for n in ns:
        if stop(): break
        if os.path.exists(cert_path(n)): continue
        try: attempt(n, 1000000 * n + 10000 * (worker + 1) + rnd % 10000)
        except Exception as e: log('n=%d error %r' % (n, e))
