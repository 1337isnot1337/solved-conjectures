import sys, time
from lns import solve_gaps
from core import uncovered_float, gamma_float
def smooth(x, P=(2, 3)):
    for p in P:
        while x % p == 0: x //= p
    return x == 1
def menus(d):
    me = [0, d, -d, 0.5, 0.5 + d/2, 0.5 - d/2, 0.5 + d, 0.5 - d, d/2, -d/2, 2*d, -2*d]
    mo = [0.25, 0.75, 0.25 + d/2, 0.25 - d/2, 0.75 + d/2, 0.75 - d/2, 0, 0.5]
    return [x % 1 for x in me], [x % 1 for x in mo]
def attempt(N, d, P=(2, 3), odd_max=27, net=-1, tl=60, extra=(), verbose=False):
    me, mo = menus(d)
    S = set(k for k in range(2, 2*N + 1, 2) if smooth(k, P)) | set(extra) | {2 * N}
    fixed = [k for k in range(2, 2*N + 1, 2) if k not in S]
    cands = []
    for v in sorted(S): cands += [(v, s) for s in me]
    for v in range(1, odd_max + 1, 2):
        if smooth(v, P): cands += [(v, s) for s in mo]
    budget = N + net - len(fixed)
    t = time.time()
    sel, st = solve_gaps(fixed, [0.0]*len(fixed), cands, d, maxcount=budget, time_limit=tl, verbose=verbose)
    if not sel: return None, st, time.time() - t
    v = fixed + [a for a, b in sel]; s = [0.0]*len(fixed) + [b for a, b in sel]
    return (v, s, sel), st, time.time() - t
if __name__ == "__main__":
    for N in [int(x) for x in sys.argv[1].split(",")]:
        for eps in (1.0, 0.3):
            d = 1 / (N + eps)
            r, st, tt = attempt(N, d, tl=float(sys.argv[2]))
            if r:
                v, s, sel = r
                g = gamma_float(v, s)
                print("N=%d eps=%.1f FOUND n=%d gamma=%.7f E=%.4f  %.0fs  rule=%s" % (N, eps, len(v), g, 1/g - len(v) - 1, tt,
                      [(a, round(b*(N+eps), 3)) for a, b in sel if not (a % 2 == 0 and b == 0)] + ["removed", [k for k in range(2, 2*N+1, 2) if k not in v]]), flush=True)
                break
            else: print("N=%d eps=%.1f none (status %s) %.0fs" % (N, eps, st, tt), flush=True)
