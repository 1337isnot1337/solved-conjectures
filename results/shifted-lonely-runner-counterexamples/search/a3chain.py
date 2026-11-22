"""Pad-first chain with speed-change heat-bath. usage: a3chain.py n0 nmax tries_per_n
start for n: best certificate of n-1 (own scert/achain files or certificates.json) + new runner (smallest unused speed) at shift 0.
each try: a3s warm from current best state (4x grid, margin/T0 cycling, ps, Vmax=VM*n), SLP, keep best; E>0 -> certify, save, next n."""
import sys, os, subprocess, time, json, glob, random
from hyb import slp, certify, log
from fractions import Fraction as F
HERE = '/home/claude/slr_ideas'
PS = float(os.environ.get('PS', '0.03')); VM = float(os.environ.get('VM', '2.0')); MULT = float(os.environ.get('MULT', '0.2')); GM = int(os.environ.get('GM', '4'))
MARG = [float(x) for x in os.environ.get('MARG', '0.15,0.3,0.15').split(',')]; T0S = os.environ.get('T0', '16,24,8').split(','); RESET = int(os.environ.get('RESET', '10'))
def load_base(n):
    best = None
    for fn in glob.glob(HERE + '/achain_%d.json' % n) + glob.glob(HERE + '/scert_%d_*.json' % n) + glob.glob(HERE + '/hcert_%d_*.json' % n) + glob.glob(HERE + '/pcert_%d.json' % n):
        c = json.load(open(fn))[0]; g = F(c['gamma'])
        if best is None or g < best[0]: best = (g, c['speeds'], [x / c['shift_den'] for x in c['shift_num']])
    for c in json.load(open('/mnt/user-data/outputs/shifted-lonely-runner/certificates.json')):
        if c['n'] == n:
            g = F(c['gamma'])
            if best is None or g < best[0]: best = (g, c['speeds'], [x / c['shift_den'] for x in c['shift_num']])
    return best
n0, nmax, tries = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])
n = n0
while n <= nmax:
    b = load_base(n - 1)
    if b is None: log('no base for n-1=%d' % (n - 1)); break
    g0, v0, s0 = b
    import numpy as np
    from addone import fvals, best_shift
    tg = (np.arange(400000) + 0.5) / 400000; fv = fvals(v0, s0, tg); U = tg[fv > 1 / (n + 1.15)]
    bw = max(((best_shift(x, U, 1 / (n + 1.15)) + (x,)) for x in range(1, 3 * n + 1) if x not in v0), key=lambda z: z[0]) if len(U) else (1, 0.0, min(x for x in range(1, 10**6) if x not in v0))
    w = bw[2]; log('added speed %d at shift %.4f covers %.3f of gap set' % (w, bw[1], bw[0]))
    start = (list(v0) + [w], list(s0) + [bw[1]]); cur = start; curE = -99; done = False; since = 0
    log('n=%d base gamma(n-1)=%s (1/g=%.4f), new speed %d' % (n, g0, float(1 / g0), w))
    for k in range(tries):
        v, s = cur
        # put runner with speed v[0] first (fixed at its shift; a3s forces s[0]=0, so rotate time so that s[0]=0 is consistent)
        i0 = v.index(min(v)); order = [i0] + [i for i in range(n) if i != i0]
        v = [v[i] for i in order]; s = [s[i] for i in order]
        sh0 = s[0]; tau = -sh0 / v[0]; s = [(si + vi * tau) % 1.0 for vi, si in zip(v, s)]
        fi = HERE + '/a3init_%d.txt' % os.getpid(); open(fi, 'w').write(''.join('%d %.17g\n' % (a, c) for a, c in zip(v, s)))
        m = MARG[k % len(MARG)]; T0 = T0S[(k // len(MARG)) % len(T0S)]
        G = max(12000, 500 * n) * GM; t = time.time()
        p = subprocess.run([HERE + '/a3s', str(n), str(G), str(int(30000 * n * MULT)), str(31000 + 1000 * n + k), repr(1 / (n + 1 + m)), T0, '0.5', str(int(VM * n)), str(PS), fi], capture_output=True, text=True)
        out = p.stdout.split(); cost = int(out[0]); v2 = [int(x) for x in out[1::2][:n]]; s2 = [float(x) for x in out[2::2][:n]]
        s3, g = slp(v2, s2, [0] + [1] * (n - 1)); E = 1 / g - (n + 1)
        ch = sorted(set(v2) - set(v));
        log('n=%d try %d m=%.2f T0=%s cost=%d E=%.4f (best %.4f) %.0fs speeds in/out: +%s -%s' % (n, k, m, T0, cost, E, max(E, curE), time.time() - t, ch, sorted(set(v) - set(v2))))
        if E > curE: cur = (v2, list(s3)); curE = E; since = 0
        else: since += 1
        if E > 0:
            c = certify(v2, s3)
            if c:
                gex, mm = c; fn = HERE + '/achain_%d.json' % n
                json.dump([{"n": n, "speeds": v2, "shift_den": 10**6, "shift_num": mm, "gamma": str(gex)}], open(fn, 'w'))
                log('CERT n=%d gamma=%s E=%.4f speeds-not-in-1..n=%s -> %s' % (n, gex, float(1 / gex) - n - 1, [x for x in v2 if x > n], fn)); done = True; break
        if since >= RESET: cur = start; curE = -99; since = 0; log('reset to start')
    if not done: log('n=%d: no certificate after %d tries (best E %.4f)' % (n, tries, curE)); break
    n += 1
