"""raise E of the best certificate for n by warm a3s continuation at a larger margin (speed moves allowed). usage: boost.py n tries
writes achain_n.json whenever exact gamma improves."""
import sys, os, subprocess, time, json
from hyb import slp, certify, log
HERE = '/home/claude/slr_ideas'
from fractions import Fraction as F
n, tries = int(sys.argv[1]), int(sys.argv[2])
MARG = [float(x) for x in os.environ.get('BMARG', '1.0,1.4,0.7').split(',')]; T0S = os.environ.get('BT0', '4,8').split(',')
from a3chain_lib import load_base
g0, v, s = load_base(n); best = g0; log('boost n=%d start gamma=%s E=%.4f' % (n, g0, float(1 / g0) - n - 1))
for k in range(tries):
    i0 = v.index(min(v)); order = [i0] + [i for i in range(n) if i != i0]; v = [v[i] for i in order]; s = [s[i] for i in order]
    tau = -s[0] / v[0]; s = [(si + vi * tau) % 1.0 for vi, si in zip(v, s)]
    fi = HERE + '/binit_%d.txt' % os.getpid(); open(fi, 'w').write(''.join('%d %.17g\n' % (a, c) for a, c in zip(v, s)))
    m = MARG[k % len(MARG)]; T0 = T0S[(k // len(MARG)) % len(T0S)]; G = max(12000, 500 * n) * 4; t = time.time()
    p = subprocess.run([HERE + '/a3s', str(n), str(G), str(int(30000 * n * 0.25)), str(77000 + 100 * n + k), repr(1 / (n + 1 + m)), T0, '0.5', str(3 * n), '0.03', fi], capture_output=True, text=True)
    out = p.stdout.split(); cost = int(out[0]); v2 = [int(x) for x in out[1::2][:n]]; s2 = [float(x) for x in out[2::2][:n]]
    s3, g = slp(v2, s2, [0] + [1] * (n - 1)); E = 1 / g - (n + 1)
    log('boost n=%d try %d m=%.2f T0=%s cost=%d E=%.4f (best %.4f) %.0fs' % (n, k, m, T0, cost, E, float(1 / best) - n - 1, time.time() - t))
    if E > float(1 / best) - n - 1:
        c = certify(v2, s3)
        if c and c[0] < best:
            best = c[0]; v, s = v2, list(s3)
            json.dump([{"n": n, "speeds": v2, "shift_den": 10**6, "shift_num": c[1], "gamma": str(c[0])}], open(HERE + '/achain_%d.json' % n, 'w'))
            log('  improved: gamma=%s E=%.4f' % (best, float(1 / best) - n - 1))
