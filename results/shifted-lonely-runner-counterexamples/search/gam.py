"""exact gamma for integer speeds v and rational shifts m/Q (integer numpy), plus float local helpers."""
import numpy as np
from fractions import Fraction as F
def gamma_int(v, m, Q, early=None):
    """exact gamma; if early (a Fraction) is given, stop as soon as gamma >= early and return that lower bound."""
    v = np.array(v, dtype=np.int64); m = np.array(m, dtype=np.int64) % Q; n = len(v)
    best = F(0)
    for i in range(n):
        for j in range(i, n):
            w = int(v[i] + v[j]); D = w * Q
            k = np.arange(w, dtype=np.int64)
            base = k * Q - m[i] - m[j]
            r = (m[:, None] * w + v[:, None] * base[None, :]) % D
            d = np.minimum(r, D - r).min(0)
            kk = int(d.argmax()); val = F(int(d[kk]), D)
            if val > best:
                best = val
                if early is not None and best >= early: return best
    return best
