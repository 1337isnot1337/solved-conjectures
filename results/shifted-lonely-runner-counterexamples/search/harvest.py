"""Harvest n = n0.. with a3s cold runs; merge each new n (padding used when E > gap). usage: harvest.py n0 nmax maxtries"""
import sys, os, subprocess, time, json, glob
from fractions import Fraction as F
from hyb import slp, certify, log
HERE = '/home/claude/slr_ideas'; OFF = '/mnt/user-data/outputs/shifted-lonely-runner/certificates.json'
MARGS = [float(x) for x in os.environ.get('MARGS', '0.7,1.2').split(',')]; MULT = float(os.environ.get('MULT', '0.6')); VM = float(os.environ.get('VM', '3')); KC = os.environ.get('KC', '24'); PS = os.environ.get('PS', '0.05')
def official(): return set(c['n'] for c in json.load(open(OFF)))
def pad_and_merge(cert, n_target):
    v = list(cert['speeds']); m = list(cert['shift_num']); w = 1
    while len(v) < n_target:
        while w in v: w += 1
        v.append(w); m.append(0)
    from gam import gamma_int
    g = gamma_int(v, m, cert['shift_den'])
    if not g < F(1, n_target + 1): return False
    fn = HERE + '/pcert_%d.json' % n_target
    json.dump([{"n": n_target, "speeds": v, "shift_den": cert['shift_den'], "shift_num": m, "gamma": str(g)}], open(fn, 'w'))
    pending.append(fn); log('pad %d->%d gamma=%s -> %s' % (cert['n'], n_target, g, fn))
    return True
n0, nmax, maxtries = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])
pending = [x for x in os.environ.get('PENDING', '').split(',') if x]; BATCH = int(os.environ.get('BATCH', '4'))
def flush():
    global pending
    if pending:
        r = subprocess.run(['python3', HERE + '/merge_many.py'] + pending, capture_output=True, text=True); log('batch merge: %s' % r.stdout.strip().replace('\n', ' | ')); pending = []
n = n0; seed = 20000 + int(os.environ.get('SEEDOFF', '0'))
while n <= nmax:
    if n in official() or any(('_%d_' % n) in p or p.endswith('_%d.json' % n) for p in pending): n += 1; continue
    got = None
    for k in range(maxtries):
        seed += 1; margin = MARGS[k % len(MARGS)]; t = time.time(); G = max(12000, 500 * n)
        p = subprocess.run([HERE + '/a3s', str(n), str(G), str(int(30000 * n * MULT)), str(seed), repr(1 / (n + 1 + margin)), '20', '0.5', str(int(VM * n)), PS, '-', '8192', '0', KC], capture_output=True, text=True)
        out = p.stdout.split(); cost = int(out[0]); v = [int(x) for x in out[1::2][:n]]; s = [float(x) for x in out[2::2][:n]]
        s2, g = slp(v, s, [0] + [1] * (n - 1)); E = 1 / g - (n + 1); extra = ''
        for rr in range(int(os.environ.get('REF', '2'))):
            if not (-1.0 < E <= 0 and cost <= 8): break
            fi = HERE + '/rinit_%d.txt' % os.getpid(); open(fi, 'w').write(''.join('%d %.17g\n' % (a, (b - s2[0] * a / v[0]) % 1.0) for a, b in zip(v, s2)))
            p = subprocess.run([HERE + '/a3s', str(n), str(4 * G), str(int(30000 * n * 0.3)), str(seed * 10 + rr), repr(1 / (n + 1 + 0.3)), '8', '0.5', str(int(VM * n)), '0.02', fi, '8192', '0', KC], capture_output=True, text=True)
            out = p.stdout.split(); c2 = int(out[0]); v2 = [int(x) for x in out[1::2][:n]]; s3 = [float(x) for x in out[2::2][:n]]
            s4, g2 = slp(v2, s3, [0] + [1] * (n - 1)); E2 = 1 / g2 - (n + 1)
            log('   refine %d: fine cost=%d E=%.4f' % (rr, c2, E2))
            if E2 > E: v, s2, E, g = v2, s4, E2, g2
        if E > 0:
            c = certify(v, s2)
            if c:
                gex, mm = c; fn = HERE + '/hcert_%d_%d.json' % (n, seed)
                got = {"n": n, "speeds": v, "shift_den": 10**6, "shift_num": mm, "gamma": str(gex)}
                json.dump([got], open(fn, 'w')); extra = 'CERT E=%.4f %s' % (float(1 / gex) - n - 1, fn)
        log('n=%d try %d seed=%d margin=%.2f cost=%d E=%.4f %.0fs maxspeed=%d %s' % (n, k, seed, margin, cost, E, time.time() - t, max(v), extra))
        if got: break
    if not got: log('n=%d: gave up after %d tries' % (n, maxtries)); flush(); break
    pending.append(fn)
    E = float(1 / F(got['gamma'])) - n - 1; j = n + 1
    while j <= nmax and E > j - n:
        if j not in official(): pad_and_merge(got, j)
        j += 1
    if len(pending) >= BATCH: flush()
    n += 1
flush()
