import sys, json, math, time
import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from base_loops import two_loops, loop_at
from family import semigroup, periodic_colouring
def build_base2(B, k, lmax=70, verbose=True):
    B = sorted(B); w = max(B)
    per = [p for p in range(k, 46) if periodic_colouring(B, k, p, budget=50000) is not None]
    pairs = [(a, b) for a in per for b in per if a < b and math.gcd(a, b) == 1]
    pairs.sort(key=lambda ab: (ab[0] - 1) * (ab[1] - 1))
    best = None; tried = 0
    for (a, b) in pairs[:60]:
        z = two_loops(B, k, a, b)
        if z is None: continue
        u = z[:w]; loops = {}
        for l in range(2, lmax + 1):
            zz = loop_at(B, k, u, l)
            if zz is not None: loops[l] = zz
        gens = sorted(loops); mingens = []
        for g in gens:
            S = semigroup(mingens, g) if mingens else [True] + [False] * g
            if not S[g]: mingens.append(g)
        S = semigroup(mingens, 4000)
        gap = max([n for n in range(4001) if not S[n]] or [0])
        if verbose: print("  B=%s pair (%d,%d): generators %s largest gap %d" % (B, a, b, mingens, gap), flush=True)
        if best is None or gap < best["largest_gap"]:
            best = {"B": B, "k": k, "u": u, "generators": mingens, "loops": {str(l): loops[l] for l in mingens}, "largest_gap": gap}
        tried += 1
        if tried >= 4 or gap <= 45: break
    return best, per
if __name__ == "__main__":
    for B in ([1,2,3,5,7,8], [1,3,4,5,6,9]):
        t = time.time(); best, per = build_base2(B, 6)
        print("BASE", B, "periods:", per, "\n ->", None if best is None else (best["generators"], best["largest_gap"]), "[%.0fs]" % (time.time() - t), flush=True)
        if best: json.dump(best, open("base_%s.json" % '_'.join(map(str, B)), "w"))
