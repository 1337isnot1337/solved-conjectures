"""Independent exact recomputation of the LLL sufficient condition of Theorem A.
For odd n: f = 0,4,5 (n mod 3 = 0,1,2), N = n-f, t = N/3, h = (n-1)/2, j = 1..floor(t/2).
P(j given disjoint triples all blocks) = q_j = T(N-3j)/T(N), T(m) = m!/((m/3)! 6^(m/3)).
x_E = q_j mu^{3j}.  W = sum_j [C1(3j) + C2(3j)] * splits(j) * q_j * mu^{3j}, where
splits(j)*q_j = C(t,j)/C(N,3j) (probability that a fixed 3j-set is a union of blocks).
Condition: W <= (1 - x_max) * L(mu), L(mu) = (mu-1) - (mu-1)^2/2 <= ln(mu)."""
from fractions import Fraction as Fr
from math import comb, factorial, log
import sys

def T(m): return factorial(m)//(factorial(m//3)*6**(m//3))

def C1(n, s):
    h = (n-1)//2
    if s % 2 == 0: return (n-1)*comb(h-1, s//2-1)
    return comb(h, (s-1)//2) + (n-1)*comb(h-1, (s-3)//2)

def C2(n, s, f):
    h = (n-1)//2
    if f == 0: return 0
    cl = {4: ((6, 2), (n, 4), (4, 3)), 5: ((10, 3), (n, 5), (5, 4))}[f]
    return sum(nc*comb(h, (s-e)//2) for nc, e in cl if s >= e)

def params(n):
    f = {0: 0, 1: 4, 2: 5}[n % 3]; N = n-f; t = N//3; h = (n-1)//2
    return f, N, t, h

def coeffs(n):
    f, N, t, h = params(n)
    out = []
    for j in range(1, t//2+1):
        s = 3*j
        out.append(Fr((C1(n, s)+C2(n, s, f))*comb(t, j), comb(N, s)))
    return out

def qj(n, j):
    f, N, t, h = params(n)
    return Fr(T(N-3*j), T(N))

def float_W(n, mu, co=None):
    co = co or coeffs(n)
    return sum(float(c)*mu**(3*(j+1)) for j, c in enumerate(co))

def exact_ok(n, mu, co=None):
    co = co or coeffs(n)
    W = sum(c*mu**(3*(j+1)) for j, c in enumerate(co))
    f, N, t, h = params(n)
    xmax = max(qj(n, j)*mu**(3*j) for j in range(1, min(4, t//2)+1))
    # q_j mu^{3j} is decreasing in j here (ratio mu^3/C(N-1-3j,2) < 1); checked below
    L = (mu-1)-(mu-1)**2/2
    return W <= (1-xmax)*L, W, (1-xmax)*L

GRID = [Fr(1000+k, 1000) for k in range(5, 160, 5)]

def best_mu(n):
    co = coeffs(n)
    best = None
    for mu in GRID:
        m = float(mu)
        fw = float_W(n, m, co)
        L = (m-1)-(m-1)**2/2
        slack = L*(1-2*m**3/((n-6)*(n-7))) - fw
        if best is None or slack > best[1]: best = (mu, slack)
    return best, co

if __name__ == "__main__":
    ns = [int(a) for a in sys.argv[1:]]
    for n in ns:
        (mu, slack), co = best_mu(n)
        ok, W, R = exact_ok(n, mu, co)
        # also report if any grid mu works exactly near the float optimum
        print(n, n % 6, "mu", float(mu), "W", float(W), "RHS", float(R), "OK" if ok else "FAIL", flush=True)
