"""Smooth version of the local rule search (see rule3.py): only S-smooth velocities may be removed, rephased or added.
A runner (v, rho) with rho of denominator r reaches class d only if 2d | r*v, so S-smooth runners with r S-smooth reach
only S-smooth classes; every other class keeps its own unmodified runner. So only S-smooth classes need checking."""
import sys, time
from fractions import Fraction as Fr
from math import gcd
from pysat.solvers import Solver
from pysat.card import CardEnc, EncType
def smooth(x, primes):
    for p in primes:
        while x % p == 0: x //= p
    return x == 1
def build(K, rhos, C, added, net, primes):
    var = {}; clauses = []
    def V(key):
        x = var.get(key)
        if x is None: x = var[key] = len(var) + 1
        return x
    runners = [('base', 2 * k) for k in range(1, K + 1) if smooth(k, primes)] + [('add', v) for v in added]
    for r in runners: V((r, None))
    one = Fr(1); rhoset = set(rhos)
    for d in range(1, K + 1):
        if not smooth(d, primes): continue
        D2 = 2 * d
        for b in range(D2):
            if gcd(b, d) != 1: continue
            pp = []
            for r in runners:
                v = r[1]; num = (-v * b) % D2; rho = Fr(num, D2)
                if rho not in rhoset: continue
                w = Fr(D2, v)
                for c in C:
                    lo = (-c - 1) * w; hi = (-c + 1) * w
                    if lo < -1: lo = -one
                    if hi > 1: hi = one
                    if lo < hi: pp.append(((r, (rho, c)), lo, hi))
            bps = sorted({-one, one} | {x for (_, lo, hi) in pp for x in (lo, hi)})
            rank = {x: i for i, x in enumerate(bps)}
            cls = [[] for _ in range(len(bps) - 1)]
            for key, lo, hi in pp:
                x = V(key)
                for j in range(rank[lo], rank[hi]): cls[j].append(x)
            for cl in cls:
                if not cl: return None, None
                clauses.append(cl)
    top = len(var); byr = {}
    for (r, o), x in var.items(): byr.setdefault(r, []).append(x)
    for r in runners:
        enc = CardEnc.equals(lits=byr[r], bound=1, top_id=top, encoding=EncType.seqcounter); top = max(top, enc.nv); clauses.extend(enc.clauses)
    lits = [var[(r, None)] for r in runners]
    enc = CardEnc.atleast(lits=lits, bound=net + len(added), top_id=top, encoding=EncType.seqcounter); top = max(top, enc.nv); clauses.extend(enc.clauses)
    return clauses, var
def solve(K, rhos, C, added, net, primes, solver='cadical153'):
    t0 = time.time(); clauses, var = build(K, rhos, C, added, net, primes); tb = time.time() - t0
    if clauses is None: return 'INFEASIBLE-POINT', 0, tb
    s = Solver(name=solver, bootstrap_with=clauses)
    if not s.solve(): return None, len(var), tb
    model = set(x for x in s.get_model() if x > 0); rule = {}
    for (r, o), x in var.items():
        if x in model:
            if r[0] == 'base' and o == (Fr(0), Fr(0)): continue
            if r[0] == 'add' and o is None: continue
            rule[r] = o
    return rule, len(var), tb
def fmt(rule):
    rem = sorted(r[1] for r in rule if r[0] == 'base' and rule[r] is None)
    rep = sorted((r[1], rule[r]) for r in rule if r[0] == 'base' and rule[r] is not None)
    add = sorted((r[1], rule[r]) for r in rule if r[0] == 'add')
    f = lambda v, o: "%d:%s%s%sd" % (v, o[0], '+' if o[1] >= 0 else '', o[1])
    return "remove %s | rephase %s | add %s | gain %d" % (rem, [f(v, o) for v, o in rep], [f(v, o) for v, o in add], len(rem) - len(add))
if __name__ == "__main__":
    K = int(sys.argv[1]); primes = [int(x) for x in sys.argv[2].split(',')]; rden = int(sys.argv[3]); cden = int(sys.argv[4]); cmax = int(sys.argv[5]); vmax = int(sys.argv[6]); net = int(sys.argv[7])
    rhos = [Fr(j, rden) for j in range(rden)]; C = [Fr(j, cden) for j in range(-cmax * cden, cmax * cden + 1)]
    added = [v for v in range(1, vmax + 1, 2) if smooth(v, primes)]
    t0 = time.time(); rule, nv, tb = solve(K, rhos, C, added, net, primes)
    print("K=%d (L=%d) primes %s, rho in Z/%d, c in Z/%d within [-%d,%d], added odd smooth <= %d, gain>=%d, %d vars, build %.0fs: %s (%.0fs)" % (K, 2 * K, primes, rden, cden, cmax, cmax, vmax, net, nv, tb, "NO RULE" if rule is None else rule if isinstance(rule, str) else "RULE " + fmt(rule), time.time() - t0), flush=True)
