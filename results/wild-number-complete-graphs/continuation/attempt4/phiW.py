"""Task B numerics: weighted potential L_c (c(sigma) = prod_{j=2}^{sigma/3} 3j/(3j-kappa), c(0)=0)
along an L-greedy peeling path. At each state prints m, Phi, L, L* (contracted), the error
E = [sum_ill Lambda*(A) + 2 N3 c(3)/K]/(C-I), (kappa/m) L, best L(T\\A), and checks Lemma W:
   min_legal L(T\\A) <= L* + E  (L* <= (1-kappa/m) L).
Exact arithmetic not needed here (numerics only); floats."""
import sys, random, math, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[1] / 'attempt3'))
import fac
from fractions import Fraction

def lT(m): return math.lgamma(m+1) - math.lgamma(m//3+1) - (m//3)*math.log(6)
def pm(m, s): return math.exp(lT(s) + lT(m-s) - lT(m))

KAPPA = float(sys.argv[3]) if len(sys.argv) > 3 else 3.0
def cfun(sig):
    if sig <= 0: return 0.0
    v = 1.0
    for j in range(2, sig//3 + 1): v *= 3*j/(3*j - KAPPA)
    return v

def parts_list(d):
    seen = {};
    for v, P in d.items(): seen[P] = 1
    return list(seen)

def knap(sizes, m):
    N = [0]*(m+1); N[0] = 1
    for sz in sizes:
        for s in range(m, sz-1, -1): N[s] += N[s-sz]
    return N

def Lval(parts, m, star=False):
    tot = 0.0
    for d in parts:
        N = knap([len(P) for P in parts_list(d)], m)
        for s in range(3, m, 3):
            if not N[s]: continue
            sig = min(s, m-s)
            if star:
                w = (s/m)*cfun(min(s-3, m-s)) + ((m-s)/m)*cfun(min(s, m-3-s))
            else:
                w = cfun(sig)
            tot += N[s]*pm(m, s)*w
    return tot

def wstar(s, m): return (s/m)*cfun(min(s-3, m-s)) + ((m-s)/m)*cfun(min(s, m-3-s))

def straddle_mass(d, A, m):
    """sum over S in S_u straddled by A of p(s)*wstar(s)"""
    ps = parts_list(d); A = set(A)
    meet = [P for P in ps if P & A]; rest = [P for P in ps if not (P & A)]
    U = sum(len(P) for P in meet)
    Nall = knap([len(P) for P in ps], m)
    Nr = knap([len(P) for P in rest], m)
    tot = 0.0
    for s in range(3, m, 3):
        cnt = Nall[s] - Nr[s] - (Nr[s-U] if s-U >= 0 else 0)
        if cnt: tot += cnt*pm(m, s)*wstar(s, m)
    return tot

class State:
    def __init__(s, L):
        n = len(L); s.n = n; s.T = set(range(n))
        P = [[-1]*n for _ in range(n)]
        for a in range(n):
            for b in range(n):
                if a != b: P[L[a][b]][a] = b
        s.parts = []
        for u in range(n):
            d = {u: frozenset([u])}
            for a in range(n):
                if a != u: d[a] = frozenset([a, P[u][a]])
            s.parts.append(d)
    def beta(s, A):
        A = frozenset(A); b = 0
        for d in s.parts:
            if frozenset().union(*[d[a] for a in A]) == A: b += 1
        return b
    def after(s, A):
        A = frozenset(A); new = []
        for d in s.parts:
            U = frozenset().union(*[d[a] for a in A]); M = U - A
            nd = {}
            for v, P in d.items():
                if v in A: continue
                nd[v] = M if v in U else P
            new.append(nd)
        return new

def run(L, rnd, every=3, sample=None):
    S = State(L); n = S.n
    while len(S.T) > 6:
        m = len(S.T); T = sorted(S.T)
        Lc = Lval(S.parts, m); Ls = Lval(S.parts, m, True)
        trip = list(itertools.combinations(T, 3))
        ill = []; leg = []
        for A in trip:
            b = S.beta(A)
            (ill if b else leg).append((A, b))
        N3 = sum(b for A, b in ill); K = (m-1)*(m-2)/2; C = len(trip)
        lam = sum(sum(straddle_mass(d, A, m) for d in S.parts) for A, b in ill)
        E = (lam + 2*N3/K)/(C - len(ill))
        # best legal move by L
        cand = leg if sample is None else rnd.sample(leg, min(sample, len(leg)))
        best = None; tot = 0.0
        for A, _ in cand:
            np_ = S.after(A); v = Lval(np_, m-3); tot += v
            if best is None or v < best[0]: best = (v, A, np_)
        avg = tot/len(cand)
        Phi = Lval(S.parts, m) if KAPPA == 0 else None
        print('m %3d L %.4f L* %.4f (1-k/m)L %.4f E %.5f k/m*L %.4f I %d avgLegal %.4f bound %.4f min %.4f ok %s' % (
            m, Lc, Ls, (1-KAPPA/m)*Lc, E, KAPPA/m*Lc, len(ill), avg, Ls+E, best[0], avg <= Ls+E+1e-9 if sample is None else '-'), flush=True)
        S.parts = best[2]; S.T -= set(best[1])

if __name__ == '__main__':
    n = int(sys.argv[1]); seed = int(sys.argv[2])
    L = fac.near(n, 'dbl', seed)
    run(L, random.Random(1))
