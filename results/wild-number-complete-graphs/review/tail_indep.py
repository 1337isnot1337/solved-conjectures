"""Rigorous tail for all odd n >= n0 (default 1201), exact rationals.
B(n) = T1(n) + T2(n) + Tail(n) with every piece an explicit function that is non-increasing in n
(see REVIEW.md), so B(n) <= B(n0) and RHS(n) >= RHS(n0) for n >= n0."""
from fractions import Fraction as Fr
from math import comb, ceil
import sys
from lll_indep import coeffs, exact_ok, params

def B(n, mu):
    T1 = mu**3*Fr(3*n+17, 2)*2/((n-6)*(n-7))                     # C1(3)+C2(3) <= 1.5n+8.5
    T2 = mu**6*(Fr(n**3, 8)+Fr(5*n*n, 4)+Fr(17*n, 2))*40/Fr((n-10)**4)
    Dl = Fr(n-17, 6)                                              # D >= (n-17)/6
    CD3 = Dl*(Dl-1)*(Dl-2)/6
    ratio = mu**6*(Dl/4+2)/(Fr(3, 4)*Dl-1)
    assert ratio < 1
    Di = ceil(Dl)
    inv_sqrt2_up = Fr(7072, 10000)                                # > 1/sqrt(2)
    x = mu**3*inv_sqrt2_up
    assert x < 1
    tail1 = (Fr(17, 8)*n+15)*2*mu**12/(CD3*(1-ratio))
    tail2 = (Fr(51, 4)*Di+Fr(409, 8))*2*(Fr(Di, 4)+3)*mu**12*x**Di   # 2.125(6D+17)+15 = 12.75D+51.125
    return T1+T2+tail1+tail2, (T1, T2, tail1, tail2)

def RHS(n, mu):
    L = (mu-1)-(mu-1)**2/2
    return (1-2*mu**3/Fr((n-6)*(n-7)))*L

if __name__ == "__main__":
    n0 = int(sys.argv[1]) if len(sys.argv) > 1 else 1201
    for mu in (Fr(41, 40), Fr(21, 20), Fr(11, 10)):
        for n in (n0, n0+2, n0+4):
            b, parts = B(n, mu)
            print("mu", float(mu), "n", n, "B", float(b), "RHS", float(RHS(n, mu)), b <= RHS(n, mu), [round(float(p), 6) for p in parts])
    # sanity: the bound dominates the exact W at some n
    for n in (1201, 1203, 1205, 1501, 2001):
        mu = Fr(21, 20)
        co = coeffs(n)
        W = sum(c*mu**(3*(j+1)) for j, c in enumerate(co))
        print("sanity n", n, "exact W", float(W), "<= B", float(B(n, mu)[0]), W <= B(n, mu)[0])
    # smallest n0 for which the tail argument alone works
    for mu in (Fr(41, 40), Fr(21, 20), Fr(107, 100), Fr(11, 10)):
        n = 301
        while True:
            try:
                if B(n, mu)[0] <= RHS(n, mu): break
            except AssertionError: pass
            n += 2
        print("mu", float(mu), "tail argument alone valid from n =", n)
