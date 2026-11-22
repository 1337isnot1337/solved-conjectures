"""Harvest: coarse heat-bath anneal (anneal3f, arms alternate) -> if uncovered <= thr: SLP, certify if E > 0.01;
otherwise refinement: re-anneal that state on a FINE grid (RG x G) at margin RM, T RT0->RT1, RITER moves, up to RS seeds,
each followed by SLP and certification. Env: ARMS (JSON list [bin, mult, T0, T1, margin, extra]), SEEDOFF, RG, RM, RT0, RT1, RITERMULT, RS."""
import sys, time, json, subprocess, os
sys.path.insert(0, '/home/claude/probes'); sys.path.insert(0, '/home/claude/slr4')
from slr3 import slp
from focus import certify
HERE = os.path.dirname(os.path.abspath(__file__))
ARMS = json.loads(os.environ.get('ARMS', '[["anneal3f", 0.4, 20, 0.5, 0.3, []]]'))
SEEDOFF = int(os.environ.get("SEEDOFF", "0"))
RG = int(os.environ.get('RG', '4')); RM = os.environ.get('RM', '0.15'); RT0 = os.environ.get('RT0', '8'); RT1 = os.environ.get('RT1', '0.5')
RITERMULT = float(os.environ.get('RITERMULT', '0.29')); RS = int(os.environ.get('RS', '3'))
def run(b, n, G, iters, seed, margin, T0, T1, extra):
    p = subprocess.run([os.path.join(HERE, b), str(n), str(G), str(int(iters)), str(seed), str(margin), str(T0), str(T1)] + extra, capture_output=True, text=True)
    o = p.stdout.split(); return int(o[0]), [float(x) for x in o[1:]], p.stderr.strip()
def try_cert(n, v, s, msg):
    s2, g = slp(v, s, rounds=60); E = 1 / g - (n + 1)
    msg += " E=%.4f" % E
    if E > 0.01:
        c = certify(n, s2)
        if c:
            gex, sex = c
            fn = os.path.join(HERE, "slr_cert_%d.json" % n)
            if not os.path.exists(fn):
                json.dump({"n": n, "speeds": v, "Q": 10**6, "shifts_num": [int(x * 10**6) for x in sex], "gamma": str(gex)}, open(fn, "w"))
            return True, msg + "  CERT exact gamma=%s E=%.4f" % (gex, float(1 / gex) - (n + 1))
        msg += " (exact certification failed)"
    return False, msg
def harvest(n, max_attempts=600, thr=8, log=print):
    v = list(range(1, n + 1)); G = max(12000, 500 * n); t0 = time.time()
    for attempt in range(max_attempts):
        if os.path.exists(os.path.join(HERE, "slr_cert_%d.json" % n)): return True
        a = attempt % len(ARMS); b, mult, T0, T1, margin, extra = ARMS[a]
        seed = 1000 * n + attempt + SEEDOFF
        ta = time.time()
        cost, s, traj = run(b, n, G, 30000 * n * mult, seed, margin, T0, T1, extra)
        msg = "n=%d attempt=%d arm=%d seed=%d uncovered=%d (anneal %.0fs) traj[%s]" % (n, attempt, a, seed, cost, time.time() - ta, traj)
        if cost <= thr:
            ok, msg = try_cert(n, v, s, msg + " |")
            if ok: log(msg + " [total %.0fs]" % (time.time() - t0)); return True
            f = os.path.join(HERE, "rinit_%d.txt" % os.getpid()); open(f, "w").write("\n".join("%.17g" % x for x in s))
            for r in range(RS):
                tr = time.time()
                c2, s2, tj2 = run(b, n, RG * G, 30000 * n * RITERMULT, seed * 10 + r, RM, RT0, RT1, extra + ["init=" + f])
                ok, msg = try_cert(n, v, s2, msg + " | refine%d fine=%d (%.0fs)" % (r, c2, time.time() - tr)) if c2 <= thr else (False, msg + " | refine%d fine=%d (%.0fs)" % (r, c2, time.time() - tr))
                if ok: log(msg + " [total %.0fs]" % (time.time() - t0)); return True
        log(msg + "  [%.0fs]" % (time.time() - t0))
    return False
if __name__ == "__main__":
    for n in [int(x) for x in sys.argv[1:]]:
        if os.path.exists(os.path.join(HERE, "slr_cert_%d.json" % n)): continue
        ok = harvest(n, log=lambda m: print(m, flush=True))
        print("n=%d %s" % (n, "DONE" if ok else "GAVE UP"), flush=True)
