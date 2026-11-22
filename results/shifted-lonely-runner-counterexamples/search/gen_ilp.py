import sys, time
from lns import solve_gaps
from core import uncovered_float, gamma_float
def menu_e(d, rich=False):
    base = [0, 0.5]
    offs = [0, d, -d, d/2, -d/2, 2*d, -2*d] + ([1.5*d, -1.5*d, d/4, -d/4] if rich else [])
    return sorted(set(round((b + o) % 1, 15) for b in base for o in offs))
def menu_o(d, rich=False):
    base = [0.25, 0.75] + ([0, 0.5] if rich else [])
    offs = [0, d/2, -d/2, d/4, -d/4] + ([d, -d] if rich else [])
    return sorted(set(round((b + o) % 1, 15) for b in base for o in offs))
def attempt(N, d, Se, So, net=-1, tl=60, rich=False, verbose=False, top_free=(), fixed_extra_removed=()):
    me, mo = menu_e(d, rich), menu_o(d, rich)
    Se = set(Se) | set(top_free)
    fixed = [k for k in range(2, 2*N + 1, 2) if k not in Se and k not in fixed_extra_removed]
    cands = []
    for v in sorted(Se): cands += [(v, s) for s in (me if v not in top_free else [0.0])]
    for v in sorted(So): cands += [(v, s) for s in mo]
    budget = N + net - len(fixed)
    t = time.time()
    sel, st = solve_gaps(fixed, [0.0]*len(fixed), cands, d, maxcount=budget, time_limit=tl, verbose=verbose)
    if not sel: return None, st, time.time() - t
    v = fixed + [a for a, b in sel]; s = [0.0]*len(fixed) + [b for a, b in sel]
    return (v, s, sel), st, time.time() - t
def report(N, eps, r, st, tt):
    if r:
        v, s, sel = r; g = gamma_float(v, s)
        print("N=%d eps=%.2f FOUND n=%d gamma=%.7f E=%.4f  %.0fs  rule=%s" % (N, eps, len(v), g, 1/g - len(v) - 1, tt,
              [(a, round(b*(N+eps), 3)) for a, b in sel if not (a % 2 == 0 and b == 0)] + ["removed", [k for k in range(2, 2*N+1, 2) if k not in v]]), flush=True)
    else: print("N=%d eps=%.2f none (status %s) %.0fs" % (N, eps, st, tt), flush=True)
if __name__ == "__main__":
    N = int(sys.argv[1]); Le = int(sys.argv[2]); Lo = int(sys.argv[3]); tl = float(sys.argv[4]); eps = float(sys.argv[5]); rich = len(sys.argv) > 6
    d = 1/(N + eps)
    Se = list(range(2, Le + 1, 2)) + [2*N]
    So = list(range(1, Lo + 1, 2))
    r, st, tt = attempt(N, d, Se, So, tl=tl, rich=rich, verbose=True)
    report(N, eps, r, st, tt)
