"""Independent re-implementation (different code path) of the condition of IMPROVEMENT.md Section 4.
- conn(m,d) via exponential generating functions: C0 = log A0, C1 = A1/A0 (power series in Fractions).
- q_j by the product formula prod_{i<j} 1/C(N-1-3i,2).
- E1/E2 by explicit maximisation over the unknown class sizes (e = #colours u not in F with an internal
  u-edge in F, 0 <= e <= C(f,2)) and over which colours are excluded, instead of hand-written closed forms.
Checks: (i) counts.coef(n)[j] >= indep coefficient for all j (so counts.py is at least as conservative);
        (ii) the condition holds with counts.py coefficients at the same rational a (re-evaluated here)."""
import sys
from fractions import Fraction as Fr
from math import comb, factorial
import counts

def Cb(a, b): return comb(a, b) if 0 <= b <= a else 0
def Tm(m): return factorial(m)//(factorial(m//3)*6**(m//3)) if m % 3 == 0 else 0

def conn_table(M):
    A0 = [Fr(Tm(2*m), factorial(m)) for m in range(M+1)]
    A1 = [Fr(Tm(2*m+1), factorial(m)) for m in range(M+1)]
    # log of A0 (A0[0] = 1): C0' = A0'/A0
    C0 = [Fr(0)]*(M+1)
    for m in range(1, M+1):  # m*C0[m] = m*A0[m] - sum_{i=1}^{m-1} i*C0[i]*A0[m-i]
        C0[m] = (m*A0[m] - sum(i*C0[i]*A0[m-i] for i in range(1, m)))/m
    C1 = [Fr(0)]*(M+1)       # C1 = A1/A0
    for m in range(M+1):
        C1[m] = A1[m] - sum(C1[i]*A0[m-i] for i in range(m))
    return [int(C0[m]*factorial(m)) for m in range(M+1)], [int(C1[m]*factorial(m)) for m in range(M+1)]

def classes(n, f, h, e):
    """list of (count, h_u, inF, ext) with exactly n colours in total"""
    if f == 0: return [(n, h, False, 0)]
    if f == 4: return [(e, h-3, False, 2), (4, h-3, True, 3), (n-4-e, h-4, False, 4)]
    if f == 5: return [(e, h-4, False, 3), (5, h-4, True, 4), (n-5-e, h-5, False, 5)]

def worst_sum(vals, drop):
    """max of sum of len(vals)-drop of the values: drop the smallest"""
    v = sorted(vals)
    return sum(v[drop:])

def E1i(n, f, h, j, cn0, cn1):
    s = 3*j; best = 0
    for e in range(0, (f*(f-1))//2+1):
        cl = classes(n, f, h, e)
        if s % 2 == 0:
            k = s//2
            vals = [Cb(hu-1, k-1) for cnt, hu, inF, ext in cl for _ in range(cnt)]
            val = worst_sum(vals, f+1)*cn0[k]        # exclude u = z and the f colours c(zy)
        else:
            k = (s-1)//2
            # z's own colour is one of the colours outside F
            outs = [(cnt, hu) for cnt, hu, inF, ext in cl if not inF and cnt > 0]
            val = 0
            for zi in range(len(outs)):
                own = Cb(outs[zi][1], k)
                vals = []
                for i, (cnt, hu) in enumerate(outs):
                    vals += [Cb(hu-1, k-1)]*(cnt-(1 if i == zi else 0))
                val = max(val, (own+sum(vals))*cn1[k])
        best = max(best, val)
    return best

def E2i(n, f, h, j, t):
    s = 3*j
    if f == 0 or 2*j >= t: return 0
    best = 0
    for e in range(0, (f*(f-1))//2+1):
        free = 0; big = []
        for cnt, hu, inF, ext in classes(n, f, h, e):
            if s < ext or cnt == 0: continue
            d = (s-ext) % 2
            if d and inF: continue
            k = (s-ext-d)//2
            free += cnt*Cb(hu-1, k-1); big += [Cb(hu, k)]*cnt
        big.sort(reverse=True)
        best = max(best, free + sum(big[:f+1]))
    return best*Tm(s)

def indep_coef(n):
    f, N, t, h = counts.params(n)
    cn0, cn1 = conn_table(3*t//4+3)
    out = []; q = Fr(1)
    for j in range(1, t//2+1):
        q /= comb(N-1-3*(j-1), 2)
        out.append((E1i(n, f, h, j, cn0, cn1)+E2i(n, f, h, j, t))*q)
    return out

if __name__ == "__main__":
    cn0, cn1 = conn_table(12)
    assert all(cn0[m] == counts.conn(m, 0) and cn1[m] == counts.conn(m, 1) for m in range(1, 13)), "conn mismatch"
    print("conn: EGF and recursion agree for m <= 12;", cn0[:7], cn1[:7])
    lo, hi = int(sys.argv[1]), int(sys.argv[2]); allok = True
    for n in range(lo, hi+1, 2):
        ci = indep_coef(n); cc = counts.coef(n)
        assert len(ci) == len(cc)
        ge = all(a >= b for a, b in zip(cc, ci))
        a, _ = counts.best_a(n, cc)
        Wc = sum(c*a**(3*(i+1)) for i, c in enumerate(cc)); Wi = sum(c*a**(3*(i+1)) for i, c in enumerate(ci))
        ok = ge and Wc <= a-1
        allok &= ok
        print(n, "counts>=indep:", ge, "a =", a, "W_counts = %.6f" % float(Wc), "W_indep = %.6f" % float(Wi),
              "a-1 = %.6f" % float(a-1), "OK" if ok else "FAIL", flush=True)
    print("ALL OK" if allok else "SOME FAIL")
