"""Task B: per-vertex Lemma X numerics. Potential L = sum_u sum_S p_m(|S|) sigma(S)/3 (kappa=3).
For each x: gain mu(x) = sum_{S in S_u, x in small side} p (both S and complement counted),
error bound Err_x = [I_x*rho(x) + sum_y ill(x,y)*nu(y)]/(K - I_x).  Lemma X: some legal A through x has
L(T\\A) <= L - mu(x) + Err_x.  Report best x: (mu - Err)/(3L/m) ('efficiency'), and check vs actual min."""
import sys, random, math, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[1] / 'attempt3'))
import fac
from phiW import State, parts_list, knap, pm

def vertex_masses(S, m):
    T = sorted(S.T)
    mu = {v: 0.0 for v in T}; rho = {v: 0.0 for v in T}; nu = {v: 0.0 for v in T}; L = 0.0
    P = [pm(m, s) if s % 3 == 0 and 0 < s < m else 0.0 for s in range(m + 1)]
    trip_sets = {}
    for d in S.parts:
        ps = parts_list(d); sz = [len(q) for q in ps]
        N = knap(sz, m)
        for s in range(3, m, 3): L += N[s] * P[s] * min(s, m - s) / 3
        for q in ps:
            k = len(q)
            Nw = [0] * (m + 1)
            for j in range(m + 1): Nw[j] = N[j] - (Nw[j - k] if j >= k else 0)
            a = b = c = 0.0
            for s in range(3, m, 3):
                if s - k < 0: continue
                cnt = Nw[s - k]               # sets S containing q, |S| = s
                if not cnt: continue
                if s <= m - s:                # q in small side S
                    a += cnt * P[s] * (2 if 2 * s != m else 1)  # S and its complement
                    rho_w = (s / 3 - 1); nu_w = s / 3
                    b += cnt * P[s] * rho_w * 2; c += cnt * P[s] * nu_w * 2
                # if q in big side: x not in small side -> contributes to nu only via other vertices
            for v in q: mu[v] += a; rho[v] += b; nu[v] += c
        sing = [q for q in ps if len(q) == 1]; two = [q for q in ps if len(q) == 2]; three = [q for q in ps if len(q) == 3]
        for A in three + [p1 | p2 for p1 in sing for p2 in two] + [x | y | z for x, y, z in itertools.combinations(sing, 3)]:
            trip_sets[A] = 1
    # rho: sets with sigma>=6 only (sigma=3 sets have weight 0): b included sigma=3 with weight 0 -> fine
    ill = {v: 0 for v in T}; pair = {}
    for A in trip_sets:
        for v in A: ill[v] += 1
        for a_, b_ in itertools.combinations(sorted(A), 2):
            pair[a_, b_] = pair.get((a_, b_), 0) + 1; pair[b_, a_] = pair.get((b_, a_), 0) + 1
    return L, mu, rho, nu, ill, pair, len(trip_sets)

def run(Lm, rnd, sample=30):
    S = State(Lm); n = S.n
    while len(S.T) > 9:
        m = len(S.T); T = sorted(S.T); K = (m - 1) * (m - 2) / 2
        L, mu, rho, nu, ill, pair, I = vertex_masses(S, m)
        best = None
        for x in T:
            err = (ill[x] * rho[x] + sum(pair.get((x, y), 0) * nu[y] for y in T if y != x)) / (K - ill[x])
            val = mu[x] - err
            if best is None or val > best[0]: best = (val, x, mu[x], err)
        val, x, mux, err = best
        # actual best legal move through x
        cands = [A for A in itertools.combinations([v for v in T if v != x], 2)]
        rnd.shuffle(cands); bm = None; tries = 0
        for A in cands:
            A = (x,) + A
            if S.beta(A): continue
            np_ = S.after(A)
            Ln = vertex_masses_L(np_, m - 3)
            if bm is None or Ln < bm[0]: bm = (Ln, A, np_)
            tries += 1
            if tries >= sample: break
        print('m %3d L %.3f 3L/m %.4f best x: mu %.4f err %.4f eff %.2f | max mu %.4f | bound %.3f found %.3f' % (
            m, L, 3 * L / m, mux, err, val / (3 * L / m), max(mu.values()), L - val, bm[0]), flush=True)
        S.parts = bm[2]; S.T -= set(bm[1])

def vertex_masses_L(parts, m):
    L = 0.0
    for d in parts:
        N = knap([len(q) for q in parts_list(d)], m)
        for s in range(3, m, 3): L += N[s] * pm(m, s) * min(s, m - s) / 3
    return L

if __name__ == '__main__':
    n = int(sys.argv[1]); seed = int(sys.argv[2])
    run(fac.near(n, 'dbl', seed), random.Random(seed))
