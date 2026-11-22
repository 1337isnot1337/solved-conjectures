"""Exact (Fraction) universal start-state quantities for odd n = 0 mod 3: at T = V every colour has parts
{u} + (n-1)/2 edges, so N_u[s] = C(h, floor(s/2)) for all u (h = (n-1)/2).  L = sum p*sigma/3, Q2 = sum p*sigma^2/3,
Phi = sum p.  Imax <= 3(n-1)/2 (illegal triples through v at the start).
Crude averaged Lemma X: exists move with L' <= L - (3L - 3*Imax*Q2/(K-Imax))/m.  Prints the efficiency."""
from fractions import Fraction as F
from math import comb, factorial
def Tn(m): return F(factorial(m), factorial(m // 3) * 6 ** (m // 3))
for n in [15, 21, 33, 45, 63, 93, 123, 153, 201, 303]:
    m = n; h = (n - 1) // 2; Tm = Tn(m)
    L = Q2 = Phi = F(0)
    for s in range(3, m, 3):
        cnt = n * comb(h, s // 2)          # s even: s/2 edges; s odd: u + (s-1)/2 edges
        p = Tn(s) * Tn(m - s) / Tm; sig = min(s, m - s)
        Phi += cnt * p; L += cnt * p * F(sig, 3); Q2 += cnt * p * F(sig * sig, 3)
    K = F((m - 1) * (m - 2), 2); Imax = F(3 * (n - 1), 2)
    err = 3 * Imax * (Q2 - L) / (K - Imax)   # sharpened: R + 2 Q2 = 3 Q2 - 3 L
    print('n %3d Phi %.4f L %.4f Q2/L %.3f eff_start %.3f' % (n, float(Phi), float(L), float(Q2 / L), float((3 * L - err) / (3 * L))))
