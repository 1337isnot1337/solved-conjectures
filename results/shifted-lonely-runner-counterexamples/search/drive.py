"""Harvest shifted-lonely-runner certificates for speeds 1..n: C annealer (slow cooling) -> SLP polish -> exact certification."""
import sys, time, json, subprocess, os
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__))); sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from slr3 import slp
from focus import certify
HERE = os.path.dirname(os.path.abspath(__file__))
def anneal_c(n, G, iters, seed, margin, T0=20.0, T1=0.03):
    out = subprocess.run([os.path.join(HERE, 'anneal'), str(n), str(G), str(iters), str(seed), str(margin), str(T0), str(T1)], capture_output=True, text=True).stdout.split()
    return int(out[0]), [float(x) for x in out[1:]]
def harvest(n, mult0=2, max_attempts=80, margin=0.3, thr=8, log=print):
    v = list(range(1, n + 1)); G = max(12000, 500 * n); t0 = time.time()
    for attempt in range(max_attempts):
        mult = mult0
        seed = 1000 * n + attempt
        ta = time.time()
        cost, s = anneal_c(n, G, int(30000 * n * mult), seed, margin)
        tb = time.time()
        msg = "n=%d attempt=%d mult=%d uncovered=%d (anneal %.0fs)" % (n, attempt, mult, cost, tb - ta)
        if cost <= thr:
            s2, g = slp(v, s, rounds=60)
            E = 1 / g - (n + 1)
            msg += "  E after SLP=%.4f (slp %.0fs)" % (E, time.time() - tb)
            if E > 0.01:
                tc = time.time()
                c = certify(n, s2)
                if c:
                    gex, sex = c
                    json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open(os.path.join(HERE, "slr_cert_%d.json" % n), "w"))
                    log(msg + "  CERT exact gamma=%s E=%.4f (certify %.0fs) [total %.0fs]" % (gex, float(1 / gex) - (n + 1), time.time() - tc, time.time() - t0))
                    return True
                msg += "  (exact certification failed)"
        log(msg + "  [%.0fs]" % (time.time() - t0))
    return False
if __name__ == "__main__":
    ns = [int(x) for x in sys.argv[1:]]
    for n in ns:
        if os.path.exists(os.path.join(HERE, "slr_cert_%d.json" % n)): continue
        ok = harvest(n, log=lambda m: print(m, flush=True))
        print("n=%d %s" % (n, "DONE" if ok else "GAVE UP"), flush=True)
