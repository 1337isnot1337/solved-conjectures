import sys
from trunc import cfg
from core import gamma_float
from rule_anneal import gaps_of
from fractions import Fraction as F
def base_rule(N, d):
    reph = {k: (1+d)/2 for k in [12,24,48,96] if k <= 2*N}; reph.update({k: -d for k in (16, 64) if k <= 2*N})
    return reph, {3: .25, 9: .25}, [8, 32]
def show_gaps(v, s, d, N, lim=12):
    ga, gb = gaps_of(v, s, d)
    print("   gaps:", len(ga), "total*N^2=%.3f" % ((gb-ga).sum()*N*N))
    for a, b in list(zip(ga, gb))[:lim]:
        print("     [%.6f,%.6f] c~%s w*N^2=%.3f" % (a, b, F((a+b)/2).limit_denominator(4*N), (b-a)*N*N))
for N in [int(x) for x in sys.argv[1].split(",")]:
    for variant in ("top", "top+half", "top+half+d", "top+half-d"):
        d = 1/(N+0.3)
        reph, add, rem = base_rule(N, d)
        rem = rem + [2*N]
        if variant == "top+half": reph[N] = 0.5
        if variant == "top+half+d": reph[N] = (1+d)/2
        if variant == "top+half-d": reph[N] = (1-d)/2
        v, s = cfg(N, reph, add, rem)
        g = gamma_float(v, s)
        print(N, variant, "n=%d E=%.4f" % (len(v), 1/g - len(v) - 1))
        if variant == "top+half+d": show_gaps(v, s, d, N)
