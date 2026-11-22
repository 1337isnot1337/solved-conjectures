"""Pad-first chain. For n = n0, n0+1, ...: start from the certificate for n-1 (slr5/slr_cert_{n-1}.json) plus runner n at shift 0;
repeat: warm heat-bath re-anneal (anneal3f) of the current best state on a GM x grid at margin MARG[k], T T0->T1, MULT moves
(final state on odd tries), SLP, keep the best state (largest E); once E > 0.01, certify exactly, write slr_cert_n.json,
merge + verify, go to n+1. Gives up on n after TRIES tries.
usage: python3 padchain.py n0 nmax"""
import sys, time, json, subprocess, os
sys.path.insert(0, '/home/claude/probes'); sys.path.insert(0, '/home/claude/slr4')
from slr3 import slp
from focus import certify
from fractions import Fraction as F
HERE = '/home/claude/slr5'
MARG = [float(x) for x in os.environ.get('MARG', '0.3,0.5,0.15').split(',')]
GM = int(os.environ.get('GM', '4')); MULT = float(os.environ.get('MULT', '0.2')); T0S = os.environ.get('T0', '4,8').split(','); RESET = int(os.environ.get('RESET', '12')); T1 = os.environ.get('T1', '0.5')
TRIES = int(os.environ.get('TRIES', '200')); HOPS = int(os.environ.get('HOPS', '8')); NBASE = int(os.environ.get('NBASE', '4')); HSIG = float(os.environ.get('HSIG', '0.002')); HOPE = float(os.environ.get('HOPE', '0.15')); SEEDOFF = int(os.environ.get('SEEDOFF', '0'))
def log(m): print(time.strftime('%H:%M:%S'), m, flush=True)
def cf(n): return os.path.join(HERE, 'slr_cert_%d.json' % n)
n0, nmax = int(sys.argv[1]), int(sys.argv[2])
for n in range(n0, nmax + 1):
    if os.path.exists(cf(n)): continue
    def base(j):
        d = json.load(open(cf(n - j))); return [x / d['Q'] for x in d['shifts_num']] + [0.0] * j
    nb = 0
    s = base(1)
    v = list(range(1, n + 1)); G = max(12000, 500 * n) * GM
    bestE = -99; ok = False; start = list(s); curE = -99; stale = 0
    for k in range(TRIES):
        if os.path.exists(cf(n)): ok = True; break
        m = MARG[k % len(MARG)]
        f = os.path.join(HERE, 'pinit_%d.txt' % os.getpid()); open(f, 'w').write('\n'.join('%.17g' % x for x in s))
        t = time.time()
        p = subprocess.run([os.path.join(HERE, 'anneal3f'), str(n), str(G), str(int(30000 * n * MULT)), str(700000 + 1000 * n + k + SEEDOFF), str(m), T0S[(k // len(MARG)) % len(T0S)], T1, 'init=' + f, 'final=%d' % (k % 2)], capture_output=True, text=True)
        o = p.stdout.split(); c1 = int(o[0]); s1 = [float(x) for x in o[1:]]
        s2, g = slp(v, s1, 60); E = 1 / g - (n + 1)
        log("n=%d try=%d m=%.2f T0=%s cost=%d E=%.4f (cur %.4f best %.4f) %.0fs" % (n, k, m, T0S[(k // len(MARG)) % len(T0S)], c1, E, curE, bestE, time.time() - t))
        if E > curE: curE = E; s = list(s2); stale = 0
        else:
            stale += 1
            if stale >= RESET:
                nb += 1; j = 1 + nb % NBASE; s = base(j); curE = -99; stale = 0; log("reset to base cert(n-%d) + %d pads" % (j, j))
        if E > bestE:
            bestE = E; sbest = list(s2); open(os.path.join(HERE, 'pbest_%d.txt' % n), 'w').write('\n'.join('%.17g' % x for x in sbest))
        if -HOPE < E <= 0.01:
            import random
            rng = random.Random(k)
            sh = list(s2); Eh = E
            for h in range(HOPS):
                if h % 2 == 0: sp = [(x + rng.gauss(0, HSIG)) % 1.0 for x in sh]
                else:
                    sp = list(sh)
                    for i in rng.sample(range(1, n), 5): sp[i] = (sp[i] + rng.gauss(0, 4 * HSIG)) % 1.0
                sp[0] = 0.0
                s3, g3 = slp(v, sp, 60); E3 = 1 / g3 - (n + 1)
                if E3 > Eh: sh, Eh = s3, E3
                if Eh > 0.01: break
            log("   hops from E=%.4f -> %.4f" % (E, Eh))
            if Eh > bestE: bestE = Eh; sbest = list(sh); open(os.path.join(HERE, 'pbest_%d.txt' % n), 'w').write('\n'.join('%.17g' % x for x in sbest))
            if Eh > curE: curE = Eh; s = list(sh)
        if bestE > 0.01:
            c = certify(n, sbest)
            if c:
                gex, sex = c
                if not os.path.exists(cf(n)):
                    json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open(cf(n), 'w'))
                log("CERT n=%d gamma=%s E=%.4f" % (n, gex, float(1 / gex) - (n + 1)))
                r = subprocess.run('cd /home/claude/slr5 && python3 merge.py | tail -1 && cd /mnt/user-data/outputs/shifted-lonely-runner && python3 verify.py | tail -1', shell=True, capture_output=True, text=True)
                log("merge/verify: " + r.stdout.strip().replace('\n', ' || ')); ok = True; break
            log("exact certification failed"); bestE = 0.0
    if not ok: log("n=%d gave up" % n); break
