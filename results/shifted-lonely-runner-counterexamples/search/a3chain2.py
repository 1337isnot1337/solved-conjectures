"""Chain with base pools. usage: a3chain2.py n0 nmax tries_per_n
pool(m) = all certificates for m (achain_m.json, alt_m_*.json, hcert_m_*, scert_m_*, pcert_m, official).
step(n, base): base + best added speed, warm a3s (4x grid), SLP. Tries at n cycle through pool(n-1); every RESET failed tries,
one new alternative for n-1 is generated from pool(n-2) (up to ALTT tries) and added to the pool."""
import sys, os, subprocess, time, json, glob
import numpy as np
from fractions import Fraction as F
from hyb import slp, certify, log
from addone import fvals, best_shift
HERE = '/home/claude/slr_ideas'; OFF = '/mnt/user-data/outputs/shifted-lonely-runner/certificates.json'
PS = os.environ.get('PS', '0.03'); MULT = float(os.environ.get('MULT', '0.25')); RESET = int(os.environ.get('RESET', '4')); ALTT = int(os.environ.get('ALTT', '6'))
MARG = [0.15, 0.3]; T0S = os.environ.get('T0S', '16,24,8').split(',')
def pool(m):
    out = []
    for fn in [HERE + '/achain_%d.json' % m] + sorted(glob.glob(HERE + '/alt_%d_*.json' % m)) + glob.glob(HERE + '/hcert_%d_*.json' % m) + glob.glob(HERE + '/scert_%d_*.json' % m) + glob.glob(HERE + '/pcert_%d.json' % m):
        if os.path.exists(fn):
            c = json.load(open(fn))[0]; out.append((F(c['gamma']), c['speeds'], [x / c['shift_den'] for x in c['shift_num']], fn))
    for c in json.load(open(OFF)):
        if c['n'] == m: out.append((F(c['gamma']), c['speeds'], [x / c['shift_den'] for x in c['shift_num']], 'official'))
    seen = set(); res = []
    for b in sorted(out, key=lambda z: z[0]):
        if b[0] in seen: continue
        seen.add(b[0]); res.append(b)
    return res
cnt = [0]
def step(n, base, k):
    g0, v0, s0, _ = base
    tg = (np.arange(400000) + 0.5) / 400000; fv = fvals(v0, s0, tg); U = tg[fv > 1 / (n + 1.15)]
    if len(U): fr, sh, w = max(((best_shift(x, U, 1 / (n + 1.15)) + (x,)) for x in range(1, 3 * n + 1) if x not in v0), key=lambda z: z[0])
    else: fr, sh, w = 1, 0.0, min(x for x in range(1, 10**6) if x not in v0)
    v = list(v0) + [w]; s = list(s0) + [sh]
    i0 = v.index(min(v)); order = [i0] + [i for i in range(n) if i != i0]; v = [v[i] for i in order]; s = [s[i] for i in order]
    tau = -s[0] / v[0]; s = [(si + vi * tau) % 1.0 for vi, si in zip(v, s)]
    fi = HERE + '/c2init_%d.txt' % os.getpid(); open(fi, 'w').write(''.join('%d %.17g\n' % (a, c) for a, c in zip(v, s)))
    m = MARG[k % 2]; T0 = T0S[(k // 2) % len(T0S)]; G = max(12000, 500 * n) * 4; t = time.time(); cnt[0] += 1
    p = subprocess.run([HERE + '/a3s', str(n), str(G), str(int(30000 * n * MULT)), str(int(os.environ.get('SO', '0')) + 500000 + 1000 * n + cnt[0]), repr(1 / (n + 1 + m)), T0, '0.5', str(3 * n), PS, fi], capture_output=True, text=True)
    out = p.stdout.split(); cost = int(out[0]); v2 = [int(x) for x in out[1::2][:n]]; s2 = [float(x) for x in out[2::2][:n]]
    s3, g = slp(v2, s2, [0] + [1] * (n - 1)); E = 1 / g - (n + 1)
    log('n=%d k=%d base E=%.3f add %d (%.2f) m=%.2f T0=%s cost=%d E=%.4f %.0fs' % (n, k, float(1 / g0) - n, w, fr, m, T0, cost, E, time.time() - t))
    for rr in range(2):
        if not (-0.8 < E <= 0 and cost <= 15): break
        s3 = list(s3); tau = -s3[0] / v2[0]; s3 = [(si + vi * tau) % 1.0 for vi, si in zip(v2, s3)]
        open(fi, 'w').write(''.join('%d %.17g\n' % (a, c) for a, c in zip(v2, s3)))
        cnt[0] += 1
        p = subprocess.run([HERE + '/a3s', str(n), str(G), str(int(30000 * n * MULT)), str(int(os.environ.get('SO', '0')) + 500000 + 1000 * n + cnt[0]), repr(1 / (n + 1 + [0.3, 0.5][rr])), ['4', '2'][rr], '0.3', str(3 * n), '0.01', fi], capture_output=True, text=True)
        out = p.stdout.split(); c2 = int(out[0]); v4 = [int(x) for x in out[1::2][:n]]; s4 = [float(x) for x in out[2::2][:n]]
        s5, g5 = slp(v4, s4, [0] + [1] * (n - 1)); E5 = 1 / g5 - (n + 1)
        log('   refine %d: cost=%d E=%.4f' % (rr, c2, E5))
        if E5 > E: v2, s3, E, cost = v4, s5, E5, c2
    if E > 0:
        c = certify(v2, s3)
        if c: return {"n": n, "speeds": v2, "shift_den": 10**6, "shift_num": c[1], "gamma": str(c[0])}
    return None
n0, nmax, tries = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])
n = n0
while n <= nmax:
    P = pool(n - 1); log('n=%d: pool(n-1) has %d bases, E=%s' % (n, len(P), ['%.3f' % (float(1 / b[0]) - n) for b in P]))
    got = None; fails = 0
    for k in range(tries):
        P = pool(n - 1)
        got = step(n, P[k % len(P)], k)
        if got: break
        fails += 1
        if fails % RESET == 0:
            Q = pool(n - 2)
            for j in range(ALTT):
                alt = step(n - 1, Q[j % len(Q)], j + 7)
                if alt:
                    fn = HERE + '/alt_%d_%d.json' % (n - 1, len(glob.glob(HERE + '/alt_%d_*.json' % (n - 1))))
                    json.dump([alt], open(fn, 'w')); log('  new alternative base for n-1=%d: E=%.4f -> %s' % (n - 1, float(1 / F(alt['gamma'])) - n, fn)); break
    if not got: log('n=%d: no certificate after %d tries' % (n, tries)); break
    fn = HERE + '/achain_%d.json' % n; json.dump([got], open(fn, 'w'))
    log('CERT n=%d gamma=%s E=%.4f -> %s' % (n, got['gamma'], float(1 / F(got['gamma'])) - n - 1, fn))
    n += 1
