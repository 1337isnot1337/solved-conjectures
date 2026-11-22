from core import *
from fractions import Fraction as F
import itertools
def poli(N, rem, reph, add, delta):
    sp = {k: F(0) for k in range(2, 2*N+1, 2)}
    for r in rem: del sp[r]
    for k, sh in reph.items(): sp[k] = sh % 1
    for k, sh in add.items(): sp[k] = sh % 1
    v = sorted(sp); s = [sp[k] for k in v]
    return v, s
N = 96; d = F(1, N+1)
for a, b, c in itertools.product([1, -1], [1, -1], [1, -1]):
    v, s = poli(N, [8, 32, 192], {12: (1+a*d)/2, 24: (1+a*d)/2, 48: (1+a*d)/2, 96: (1+a*d)/2, 16: b*d, 64: b*d}, {3: F(c, 4), 9: F(c, 4)}, d)
    print(a, b, c, len(v), covers_exact(v, s, d), uncovered_float(v, [float(x) for x in s], float(d)))
