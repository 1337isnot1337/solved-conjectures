"""Continuation chain. Start from the certified state for n0 (certificates.json). For n = n0, n0+1, ...:
re-anneal the current best state of n (anneal3f, warm start, grid GM*G, margin from MARGINS, T T0->T1, mult) and SLP;
keep the best state (largest E); once E > 1 + EPS: exact certificate for n, pad with runner n+1 at shift 0,
certify n+1 exactly, write slr5/slr_cert_{n+1}.json, run merge.py and verify.py, and continue with n+1.
usage: python3 chain.py n0 nmax maxtries"""
import sys, subprocess, json, os, time
sys.path.insert(0, '/home/claude/probes'); sys.path.insert(0, '/home/claude/slr4')
from slr3 import slp
from focus import certify
HERE = '/home/claude/slr6'
n0, nmax, maxtries = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])
MARGINS = [float(x) for x in os.environ.get('MARGINS', '1.3,1.5,1.1').split(',')]
GM = int(os.environ.get('GM', '4')); MULT = float(os.environ.get('MULT', '0.2')); T0 = os.environ.get('T0', '4'); T1 = os.environ.get('T1', '0.5')
def log(m): print(time.strftime('%H:%M:%S'), m, flush=True)
C = {c['n']: c for c in json.load(open('/mnt/user-data/outputs/shifted-lonely-runner/certificates.json'))}
n = n0; s = [x / C[n]['shift_den'] for x in C[n]['shift_num']]
from fractions import Fraction as F
bestE = float(1 / F(C[n]['gamma'])) - (n + 1)
seed = 1
while n <= nmax:
    v = list(range(1, n + 1)); G = max(12000, 500 * n) * GM
    log("n=%d start E=%.4f" % (n, bestE))
    done = False
    for k in range(maxtries):
        m = MARGINS[k % len(MARGINS)] + (max(bestE, 0.0) if os.environ.get('REL') else 0.0)
        f = os.path.join(HERE, 'chain_init.txt'); open(f, 'w').write('\n'.join('%.17g' % x for x in s))
        t = time.time()
        o = subprocess.run([os.path.join(HERE, 'anneal3f'), str(n), str(G), str(int(30000 * n * MULT)), str(seed), str(m), T0, T1, 'init=' + f], capture_output=True, text=True)
        seed += 1
        s1 = [float(x) for x in o.stdout.split()[1:]]
        s2, g = slp(v, s1, 60); E = 1 / g - (n + 1)
        log("n=%d try=%d m=%.2f cost=%s E=%.4f (best %.4f) %.0fs" % (n, k, m, o.stdout.split()[0], E, bestE, time.time() - t))
        if E > bestE:
            bestE = E; s = list(s2)
        if bestE > 1.005:
            c = certify(n, s)
            if c and float(1 / c[0]) - (n + 1) > 1:
                gex, sex = c
                json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open(os.path.join(HERE, 'chain_cert_%d.json' % n), 'w'))
                sp = [float(x) for x in sex] + [0.0]
                c2 = certify(n + 1, sp)
                if c2:
                    g2, sx2 = c2
                    fn = '/home/claude/slr5/slr_cert_%d.json' % (n + 1)
                    if not os.path.exists(fn):
                        json.dump({"n": n + 1, "speeds": list(range(1, n + 2)), "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sx2], "gamma": str(g2)}, open(fn, 'w'))
                    log("CERT n=%d (E=%.4f, gamma=%s) -> padded n=%d gamma=%s E=%.4f" % (n, float(1 / gex) - (n + 1), gex, n + 1, g2, float(1 / g2) - (n + 2)))
                    r = subprocess.run('cd /home/claude/slr5 && python3 merge.py | tail -1 && cd /mnt/user-data/outputs/shifted-lonely-runner && python3 verify.py | tail -1', shell=True, capture_output=True, text=True)
                    log("merge/verify: " + r.stdout.strip().replace('\n', ' || '))
                    n += 1; s = [float(x) for x in sx2]; bestE = float(1 / g2) - (n + 1); done = True
                    break
                else:
                    log("pad certification failed")
            else:
                log("exact certification of E>1 failed; continuing"); bestE = 1.0
    if not done:
        log("n=%d chain stalled after %d tries (best E=%.4f)" % (n, maxtries, bestE)); break
