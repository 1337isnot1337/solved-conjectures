"""Empirical trajectory of the peeling potential Phi (Theorem P of REPORT.md) along a Phi-greedy
peeling, for odd n = 0 mod 3 (all blocks triples).  Phi(T) = sum_u sum_{S union of pi_u-parts,
0<|S|<m, 3 | |S|} p_m(|S|), p_m(s) = T(s)T(m-s)/T(m).  Phi < 2  ==>  a seal-free completion exists.
Prints m, Phi, and the first m at which Phi < 2."""
import sys, random, math, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[2] / 'theorem-a'))
import n1f, fac

def lT(m):  # log of number of triple partitions of an m-set
    return math.lgamma(m+1) - math.lgamma(m//3+1) - (m//3)*math.log(6)

def phi_of(parts_sizes_per_colour, m):
    tot = 0.0
    p = {s: math.exp(lT(s)+lT(m-s)-lT(m)) for s in range(3, m, 3)}
    for sizes in parts_sizes_per_colour:
        N = [0]*(m+1); N[0] = 1
        for sz in sizes:
            for s in range(m, sz-1, -1):
                N[s] += N[s-sz]
        tot += sum(N[s]*p[s] for s in range(3, m, 3))
    return tot

class State:
    def __init__(self, L):
        n = len(L); self.n = n
        self.T = set(range(n))
        P = [[-1]*n for _ in range(n)]
        for a in range(n):
            for b in range(n):
                if a != b: P[L[a][b]][a] = b
        # parts[u]: dict vertex -> frozenset part
        self.parts = []
        for u in range(n):
            d = {u: frozenset([u])}
            for a in range(n):
                if a != u: d[a] = frozenset([a, P[u][a]])
            self.parts.append(d)
    def legal(self, A):
        A = frozenset(A)
        for d in self.parts:
            U = frozenset().union(*[d[a] for a in A])
            if U == A: return False
        return True
    def after(self, A):
        A = frozenset(A); new = []
        for d in self.parts:
            U = frozenset().union(*[d[a] for a in A]); M = U - A
            nd = {}
            for v, P in d.items():
                if v in A: continue
                nd[v] = M if v in U else P
            new.append(nd)
        return new
    def sizes(self, parts):
        out = []
        for d in parts:
            seen = set(); s = []
            for v, P in d.items():
                if P not in seen: seen.add(P); s.append(len(P))
            out.append(s)
        return out

def run(L, rnd, sample=25):
    S = State(L); n = S.n; traj = []
    first = None
    while len(S.T) > 3:
        m = len(S.T)
        ph = phi_of(S.sizes(S.parts), m)
        traj.append((m, ph))
        if ph < 2 and first is None: first = m
        T = sorted(S.T); x = T[0]
        cands = [c for c in itertools.combinations(T[1:], 2)]
        rnd.shuffle(cands); best = None; tried = 0
        for c in cands:
            A = (x,) + c
            if not S.legal(A): continue
            tried += 1
            np_ = S.after(A); v = phi_of(S.sizes(np_), m-3)
            if best is None or v < best[0]: best = (v, A, np_)
            if tried >= sample: break
        if best is None: return traj, first, 'STUCK'
        S.parts = best[2]; S.T -= set(best[1])
    return traj, first, 'OK'

if __name__ == '__main__':
    n = int(sys.argv[1]); seeds = int(sys.argv[2])
    rnd = random.Random(5)
    for s in range(seeds):
        L = n1f.cyclic(n) if s == 0 else fac.near(n, 'dbl', s)
        traj, first, st = run(L, rnd)
        show = [(m, round(p, 3)) for m, p in traj if m in (n, n-3, n-6, (2*n//3)//3*3, (n//2)//3*3, (n//3)//3*3, 15, 12, 9, 6)]
        print(n, 'seed', s, st, 'first m with Phi<2:', first, show, flush=True)
