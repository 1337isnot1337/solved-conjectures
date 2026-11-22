from rule_anneal import gaps_of
import numpy as np
def cfg(N, reph, add, rem):
    sp = {k: 0.0 for k in range(2, 2*N+1, 2)}
    for r in rem: sp.pop(r, None)
    sp.update(reph); sp.update(add)
    v = sorted(sp); return v, [sp[k] % 1 for k in v]
def unc(N, d, chain, rem):
    reph = {k: (1+d)/2 for k in chain}; reph.update({16: -d, 64: -d})
    v, s = cfg(N, reph, {3: .25, 9: .25}, rem)
    ga, gb = gaps_of(v, s, d); return (gb-ga).sum()*N*N, len(v)
if __name__ == "__main__":
  for N in (60, 80, 95, 96, 100):
    for eps in (1.0, 0.5, 0.02):
        d = 1/(N+eps)
        r1 = unc(N, d, [12,24,48,96], [8,32,192])
        r2 = unc(N, d, [12,24,48], [8,32,96])
        r3 = unc(N, d, [12,24,48,96], [8,32,2*N])
        print(N, eps, "full %.3f(%d)  trunc48 %.3f(%d)  remove-top %.3f(%d)" % (r1+r2+r3))
from core import gamma_float
if __name__ == "__main__":
  print("gamma of remove-top configs (n=N-1), E=1/gamma-N:")
  for N in range(40, 100, 5):
    for d0 in (1/(N+1), 1/(N+0.5)):
        d = d0
        reph = {k: (1+d)/2 for k in [12,24,48,96] if k <= 2*N}; reph.update({k: -d for k in (16, 64) if k <= 2*N})
        v, s = cfg(N, reph, {3: .25, 9: .25}, [8, 32, 2*N])
        g = gamma_float(v, s); print(N, len(v), "d0=1/(N+%.1f)" % (1/d0 - N), "E=%.4f" % (1/g - N))
