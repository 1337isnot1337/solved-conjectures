import sys, subprocess, time, os, json
from fractions import Fraction as F
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from slr import gamma_exact
HERE = os.path.dirname(os.path.abspath(__file__))
def run(n, P, Q, iters, seed, T0=3.0, T1=0.05, lam=1.0, pu=0.15, dmax=3, init=None):
    args = [os.path.join(HERE, 'lanneal'), str(n), str(P), str(Q), str(iters), str(seed), str(T0), str(T1), str(lam), str(pu), str(dmax)]
    if init: args.append(init)
    out = subprocess.run(args, capture_output=True, text=True).stdout.split('\n')
    unc, cost = out[0].split(); return int(unc), float(cost), [int(x) for x in out[1].split()]
if __name__ == "__main__":
    n, P, Q, mult, seeds = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), float(sys.argv[4]), int(sys.argv[5])
    kw = {}
    for a in sys.argv[6:]:
        k, v = a.split('='); kw[k] = float(v) if k != 'dmax' else int(v)
    for seed in range(seeds):
        t0 = time.time(); unc, cost, m = run(n, P, Q, int(30000 * n * mult), seed, **kw)
        msg = "n=%d thr=%d/%d seed=%d unc=%d cost=%.1f (%.0fs)" % (n, P, Q, seed, unc, cost, time.time() - t0)
        if unc == 0:
            g = gamma_exact(list(range(1, n + 1)), [F(x, Q) for x in m])[0]
            msg += "  EXACT gamma=%s ok=%s m=%s" % (g, g <= F(P, Q), m)
        print(msg, flush=True)
