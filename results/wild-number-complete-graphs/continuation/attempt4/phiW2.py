"""Cheaper Task-B numerics for larger n: along an L-greedy path (25 sampled legal moves per step) report
m, Phi, L, L*, kappa/m*L, D_max (max ill-degree), zeta_max (max #colours where v is a singleton),
M* = sum_S p w* sigma, and E_bound = (D_max*M* + 2*N3/K)/(C - I) (the crude error of Lemma W)."""
import sys, random, math, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[1] / 'attempt3'))
import fac
import phiW
from phiW import Lval, State, knap, parts_list, pm, wstar

def stats(S, m):
    T = sorted(S.T); n = S.n
    ill = {v: 0 for v in T}; N3 = 0; Ms = 0.0; zeta = {v: 0 for v in T}; I = set()
    for d in S.parts:
        ps = parts_list(d); sz = [len(P) for P in ps]
        N = knap(sz, m)
        for s in range(3, m, 3):
            if N[s]: Ms += N[s]*pm(m, s)*wstar(s, m)*min(s, m-s)
        sing = [P for P in ps if len(P) == 1]; two = [P for P in ps if len(P) == 2]; three = [P for P in ps if len(P) == 3]
        for P in sing: zeta[next(iter(P))] += 1
        trip = [P for P in three] + [P1 | P2 for P1 in sing for P2 in two] + [a | b | c for a, b, c in itertools.combinations(sing, 3)]
        for A in trip:
            N3 += 1; I.add(A)
    for A in I:
        for v in A: ill[v] += 1
    return max(ill.values()), max(zeta.values()), sum(zeta.values())/len(T), Ms, N3, len(I)

def run(L, rnd, sample=25, kappa=3.0):
    S = State(L); n = S.n
    while len(S.T) > 9:
        m = len(S.T); T = sorted(S.T)
        Lc = Lval(S.parts, m); Ls = Lval(S.parts, m, True)
        D, z, zavg, Ms, N3, I = stats(S, m)
        K = (m-1)*(m-2)/2; C = m*(m-1)*(m-2)/6
        Eb = (D*Ms + 2*N3/K)/(C - I)
        best = None; tries = 0
        while tries < sample:
            A = tuple(rnd.sample(T, 3))
            if S.beta(A): continue
            tries += 1
            np_ = S.after(A); v = Lval(np_, m-3)
            if best is None or v < best[0]: best = (v, A, np_)
        print('m %3d L %.3f L* %.3f k/m*L %.4f Eb %.4f ratio %.2f Dmax %d (m^2/9=%d) zeta_max %d zeta_avg %.2f a=N3/K %.3f' % (
            m, Lc, Ls, kappa/m*Lc, Eb, Eb/(kappa/m*Lc), D, m*m//9, z, zavg, N3/K), flush=True)
        S.parts = best[2]; S.T -= set(best[1])

if __name__ == '__main__':
    n = int(sys.argv[1]); seed = int(sys.argv[2])
    run(fac.near(n, 'dbl', seed), random.Random(seed))
