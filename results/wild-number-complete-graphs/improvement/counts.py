"""Per-vertex event counts for the vertex-clique cluster condition (see IMPROVEMENT.md, Sections 3-4).
n odd; f = 0,4,5 for n = 0,1,2 mod 3; F a fixed rainbow, sub-valid f-set; N = n-f; t = N/3; h = (n-1)/2.
coef(n) returns, for j = 1..floor(t/2), the exact rational
    c_j = [ E1(j) + E2(j) ] * q_j,   q_j = T(N-3j)/T(N)  (probability that j given disjoint triples are blocks)
where E1(j), E2(j) are upper bounds on the number of events (partial matchings of j triples) of type E1/E2
whose vertex set contains a fixed z in V\\F.  Condition checked: sum_j c_j a^{3j} <= a-1."""
from fractions import Fraction as Fr
from math import comb, factorial
from functools import lru_cache

def C(a, b): return comb(a, b) if 0 <= b <= a else 0
def T(m): return factorial(m)//(factorial(m//3)*6**(m//3)) if m % 3 == 0 and m >= 0 else 0

@lru_cache(None)
def conn(m, d):
    """number of partitions into triples of (m disjoint edges + d in {0,1} isolated vertex) whose
    quotient (triples adjacent when an edge joins them) is connected; recursion on the component of a root."""
    tot = 2*m+d
    if tot % 3 or tot == 0 or m == 0: return 0
    s = 0
    for mm in range(1, m+1):
        for dd in range(0, d+1):
            if (mm, dd) == (m, d): continue
            if (2*mm+dd) % 3 or (2*(m-mm)+d-dd) % 3: continue
            s += C(m-1, mm-1)*conn(mm, dd)*T(2*(m-mm)+d-dd)
    return T(tot)-s

FZERO = 0   # block size of the fixed block F when n = 0 mod 3 (0: no fixed block; 3: a fixed valid triple)
def params(n):
    f = {0: FZERO, 1: 4, 2: 5}[n % 3]; N = n-f; t = N//3; h = (n-1)//2
    return f, N, t, h

def e2classes(n, f, h):
    """(max #colours, ext = #F-vertices matched outside F, #free edges, u may lie outside F)"""
    if f == 3: return [(3, 1, h-2, True), (n, 3, h-3, True), (3, 2, h-2, False)]
    if f == 4: return [(6, 2, h-3, True), (n, 4, h-4, True), (4, 3, h-3, False)]
    if f == 5: return [(10, 3, h-4, True), (n, 5, h-5, True), (5, 4, h-4, False)]
    return []

def E1(n, j):
    f, N, t, h = params(n); s = 3*j
    if s % 2 == 0:
        k = s//2
        if f == 0: c = (n-1)*C(h-1, k-1)
        elif f == 3: c = 6*C(h-3, k-1) + (n-10)*C(h-4, k-1)
        elif f == 4: c = 10*C(h-4, k-1) + (n-11-4)*C(h-5, k-1)
        else: c = 15*C(h-5, k-1) + (n-16-5)*C(h-6, k-1)
        return c*conn(k, 0)
    k = (s-1)//2
    if f == 0: c = C(h, k) + (n-1)*C(h-1, k-1)
    elif f == 3: c = C(h-2, k) + 3*C(h-3, k-1) + (n-7)*C(h-4, k-1)
    elif f == 4: c = C(h-3, k) + 6*C(h-4, k-1) + (n-11)*C(h-5, k-1)
    else: c = C(h-4, k) + 10*C(h-5, k-1) + (n-16)*C(h-6, k-1)
    return c*conn(k, 1)

def E2(n, j):
    f, N, t, h = params(n); s = 3*j
    if f == 0 or 2*j >= t: return 0
    c = 0; mx = 0
    for ncol, ext, hf, out in e2classes(n, f, h):
        if s < ext: continue
        d = (s-ext) % 2
        if d and not out: continue
        k = (s-ext-d)//2
        c += ncol*C(hf-1, k-1); mx = max(mx, C(hf, k))
    return (c + (f+1)*mx)*T(s)

def coef(n):
    f, N, t, h = params(n)
    return [Fr((E1(n, j)+E2(n, j))*T(N-3*j), T(N)) for j in range(1, t//2+1)]

def best_a(n, co=None):
    co = co or coef(n); fl = [float(c) for c in co]; b = None
    for k in range(2, 800):
        a = 1+k/2000
        s = a-1-sum(c*a**(3*(i+1)) for i, c in enumerate(fl))
        if b is None or s > b[1]: b = (Fr(2000+k, 2000), s)
    return b

def exact_check(n, a, co=None):
    co = co or coef(n)
    W = sum(c*a**(3*(i+1)) for i, c in enumerate(co))
    return W <= a-1, W
