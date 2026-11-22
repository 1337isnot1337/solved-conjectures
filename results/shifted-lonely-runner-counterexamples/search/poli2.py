from redund import *
from fractions import Fraction as F
N = 96; d = 1/(N+1)
def cfg(N, reph, add, rem=()):
    sp = {k: 0.0 for k in range(2, 2*N+1, 2)}
    for r in rem: sp.pop(r, None)
    sp.update(reph); sp.update(add)
    v = sorted(sp); return v, [sp[k] % 1 for k in v]
v, s = cfg(N, {12:(1+d)/2, 24:(1+d)/2, 48:(1+d)/2, 96:(1+d)/2, 16:d, 64:d}, {3:.25, 9:.25})
r = redundant(v, s, d); print("poli rule redundant:", [v[i] for i in r])
print("greedy removal:", greedy_remove(v, s, d))
# variant
v, s = cfg(N, {12:(1+d)/2, 24:(1+d)/2, 48:(1-d)/2, 96:(1-d)/2, 16:-d, 64:d}, {3:.25, 9:.25})
r = redundant(v, s, d); print("variant redundant:", [v[i] for i in r])
v, s = cfg(N, {12:(1-d)/2, 24:(1-d)/2, 48:(1+d)/2, 96:(1+d)/2, 16:d, 64:-d}, {3:.25, 9:.25})
r = redundant(v, s, d); print("variant' redundant:", [v[i] for i in r])
