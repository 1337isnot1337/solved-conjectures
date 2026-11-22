"""Conservative local model for uniform rules (Poliakova, Definitions 3 and 5), fast builder.
Base: even velocities 2k (k <= K) at shift 0, threshold delta = 1/(N+1), any N >= K. A rule may remove base runners,
rephase them to rho + c*delta, and add odd velocities at rho + c*delta. Local requirement: for every primitive point
t0 = b/(2d) (d <= K, gcd(b,d)=1, b mod 2d) the arc t0 + [-1,1]*delta/(2d) is covered by runners of the rule; a runner
(v, rho, c) reaches t0 iff v*b/(2d) + rho is an integer and then covers [(-c-1)*2d/v, (-c+1)*2d/v] in units of delta/(2d).
SAT question: is there a rule with (#removed - #added) >= net?"""
import sys, time
from fractions import Fraction as Fr
from math import gcd
from pysat.solvers import Solver
from pysat.card import CardEnc, EncType
def build(K, rmax, C, added, net, base_ok=None):
    var = {}; clauses = []
    def V(key):
        x = var.get(key)
        if x is None: x = var[key] = len(var) + 1
        return x
    runners = [('base', 2 * k) for k in range(1, K + 1)] + [('add', v) for v in added]
    for r in runners: V((r, None))
    one = Fr(1)
    for d in range(1, K + 1):
        D2 = 2 * d
        for b in range(D2):
            if gcd(b, d) != 1: continue
            pp = []
            for r in runners:
                v = r[1]; num = (-v * b) % D2; den = D2 // gcd(num, D2)
                if den > rmax: continue
                if r[0] == 'base' and num != 0 and base_ok is not None and (v // 2) not in base_ok: continue
                rho = Fr(num, D2); w = Fr(D2, v)
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
def solve(K, rmax, C, added, net, solver='cadical153', base_ok=None):
    clauses, var = build(K, rmax, C, added, net, base_ok)
    if clauses is None: return 'INFEASIBLE-POINT', 0
    s = Solver(name=solver, bootstrap_with=clauses)
    if not s.solve(): return None, len(var)
    model = set(x for x in s.get_model() if x > 0); rule = {}
    for (r, o), x in var.items():
        if x in model:
            if r[0] == 'base' and o == (Fr(0), Fr(0)): continue
            if r[0] == 'add' and o is None: continue
            rule[r] = o
    return rule, len(var)
def fmt(rule):
    rem = sorted(r[1] for r in rule if r[0] == 'base' and rule[r] is None)
    rep = sorted((r[1], str(rule[r][0]), str(rule[r][1])) for r in rule if r[0] == 'base' and rule[r] is not None)
    add = sorted((r[1], str(rule[r][0]), str(rule[r][1])) for r in rule if r[0] == 'add')
    return "remove %s | rephase %s | add %s" % (rem, ["%d:%s%+s*d" % (v, a, c) if c[0] != '-' else "%d:%s%s*d" % (v, a, c) for v, a, c in rep], ["%d:%s+%s*d" % x for x in add])
if __name__ == "__main__":
    K = int(sys.argv[1]); rmax = int(sys.argv[2]); cden = int(sys.argv[3]); cmax = int(sys.argv[4]); vmax = int(sys.argv[5]); net = int(sys.argv[6])
    C = [Fr(j, cden) for j in range(-cmax * cden, cmax * cden + 1)]
    added = [v for v in range(1, vmax + 1, 2)]
    t0 = time.time(); rule, nv = solve(K, rmax, C, added, net)
    print("K=%d (L=%d) rho den<=%d, c in Z/%d within [-%d,%d], added odd <= %d, net>=%d, %d vars: %s (%.0fs)" % (K, 2 * K, rmax, cden, cmax, cmax, vmax, net, nv, "NO RULE" if rule is None else rule if isinstance(rule, str) else "RULE " + fmt(rule), time.time() - t0), flush=True)
