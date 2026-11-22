import sys, subprocess, json, os
sys.path.insert(0, '/home/claude/probes'); sys.path.insert(0, '/home/claude/slr4')
from slr3 import slp
from focus import certify
n, f = int(sys.argv[1]), sys.argv[2]; Gf = int(sys.argv[3]); iters = int(sys.argv[4]); T0, T1 = sys.argv[5], sys.argv[6]; margin = sys.argv[7]; seed = int(sys.argv[8])
v = list(range(1, n+1))
o = subprocess.run(['./anneal3f', str(n), str(Gf), str(iters), str(seed), margin, T0, T1, 'init=' + f], capture_output=True, text=True)
s = [float(x) for x in o.stdout.split()[1:]]
s2, g = slp(v, s, 60); print("E=%.4f" % (1/g-(n+1)))
c = certify(n, s2)
if c:
    gex, sex = c; fn = '/home/claude/slr5/slr_cert_%d.json' % n
    if not os.path.exists(fn):
        json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open(fn, "w"))
        print("written", fn)
    print("CERT gamma=%s E=%.4f" % (gex, float(1/gex) - (n+1)))
else: print("certify failed")
