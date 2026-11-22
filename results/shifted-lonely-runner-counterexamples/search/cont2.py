"""Continuation from a certified state: re-anneal (anneal3f, fine grid) at a larger margin from the state, SLP, report E; certify if E > Emin."""
import sys, subprocess, json, os
sys.path.insert(0, '/home/claude/probes'); sys.path.insert(0, '/home/claude/slr4')
from slr3 import slp
from focus import certify
n = int(sys.argv[1]); margin = sys.argv[2]; Gm = int(sys.argv[3]); mult = float(sys.argv[4]); T0, T1 = sys.argv[5], sys.argv[6]; seeds = range(int(sys.argv[7]), int(sys.argv[8])); Emin = float(sys.argv[9])
src = sys.argv[10] if len(sys.argv) > 10 else None
v = list(range(1, n+1)); G = max(12000, 500*n) * Gm
if src: s0 = [float(x) for x in open(src).read().split()]
else:
    C = {c['n']: c for c in json.load(open('/mnt/user-data/outputs/shifted-lonely-runner/certificates.json'))}
    s0 = [x / C[n]['shift_den'] for x in C[n]['shift_num']]
f = 'c2init_%d.txt' % n; open(f, 'w').write('\n'.join('%.17g' % x for x in s0))
best = -9
for seed in seeds:
    o = subprocess.run(['./anneal3f', str(n), str(G), str(int(30000*n*mult)), str(seed), margin, T0, T1, 'init=' + f], capture_output=True, text=True)
    s = [float(x) for x in o.stdout.split()[1:]]
    s2, g = slp(v, s, 60); E = 1/g-(n+1)
    print("cont n=%d m=%s seed=%d cost=%s E=%.4f traj=%s" % (n, margin, seed, o.stdout.split()[0], E, o.stderr.strip()), flush=True)
    if E > best:
        best = E; open('c2best_%d.txt' % n, 'w').write('\n'.join('%.17g' % x for x in s2))
    if E > Emin:
        c = certify(n, s2)
        if c:
            gex, sex = c; fn = '/home/claude/slr6/cont_cert_%d.json' % n
            json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open(fn, "w"))
            print("CERT gamma=%s E=%.4f -> %s" % (gex, float(1/gex)-(n+1), fn)); break
