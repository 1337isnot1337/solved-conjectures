"""Assemble certificates.json for the distance-graph note from the probe data, validating everything on the way."""
import json, math, os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.join(HERE, '..', '..', '..')   # repository root when this folder is research/oravcova-sotak/search
from fractions import Fraction

SPOR = {
 5: """1 3 4 5 9 1/6
1 2 3 5 8 2/11
1 3 4 5 18 2/11
1 4 5 6 7 2/11
1 3 4 5 11 3/16
1 7 8 9 15 3/16
2 5 7 8 9 3/16
2 3 5 8 19 4/21
3 5 8 9 13 4/21
3 5 8 11 13 4/21
1 3 4 5 27 6/31
1 4 5 6 27 6/31""",
 6: """1 2 5 6 7 8 2/13
2 5 6 8 10 11 2/13
1 4 5 6 7 22 2/13
1 2 3 5 8 18 3/19
2 3 5 6 8 11 3/19
2 5 6 7 8 11 3/19
1 3 4 5 18 46 4/25
1 3 4 5 7 24 5/31
1 4 5 6 7 33 6/37""",
 7: open(os.path.join(REPO, 'results', 'seven-speed-spectrum', 'sporadic.txt')).read().strip(),
 8: open(os.path.join(REPO, 'results', 'eight-speed-spectrum', 'sporadic.txt')).read().strip(),
}
def parse(txt):
    rows = []
    for line in txt.splitlines():
        parts = line.split()
        if not parts: continue
        rows.append((tuple(int(x) for x in parts[:-1]), parts[-1]))
    return rows

def periodic_ok(word, D, k):
    p = len(word)
    return all(0 <= c < k for c in word) and all(word[i] != word[(i + d) % p] for d in D for i in range(p))
def word_ok(z, D, k):
    return all(0 <= c < k for c in z) and all(z[i] != z[i + d] for d in D for i in range(len(z) - d))
def semigroup(gens, upto):
    S = [False] * (upto + 1); S[0] = True
    for n in range(1, upto + 1):
        S[n] = any(n >= g and S[n - g] for g in gens)
    return S
def loneliness(D):
    best = Fraction(0)
    D = sorted(D)
    for i in range(len(D)):
        for j in range(i, len(D)):
            q = D[i] + D[j]
            for a in range(q + 1):
                t = Fraction(a, q)
                m = min(abs(d * t - round(d * t)) for d in D)
                if m > best: best = m
    return best
tostr = lambda w: ''.join(str(c) for c in w)

cert = {"format": 1, "sporadic": {}, "one_parameter": [], "two_parameter": {}}
exceptional = {(1,2,3,5,8): 26, (1,4,5,6,7): 24, (1,2,3,4,5,7,12): 38}   # first interval tried by dg_run.py
shortest = {(1,2,3,5,8): 13, (1,4,5,6,7): 17, (1,2,3,4,5,7,12): 19}      # shortest non-colourable intervals (checked by verify.py)
for k in (5, 6, 7, 8):
    rows = parse(SPOR[k]); out = {}
    for line in open('out%d.txt' % k):
        d = json.loads(line); out[tuple(d["D"])] = d
    assert set(out) == set(D for D, _ in rows), k
    lst = []
    for D, L in rows:
        assert len(D) == k and math.gcd(*D) == 1 and list(D) == sorted(D)
        Lf = loneliness(D); a, b = L.split('/')
        assert Lf == Fraction(int(a), int(b)) and Lf < Fraction(1, k), (D, L, Lf)
        o = out[D]
        if o["chi"] == "<=k":
            assert o["cert"].startswith("period ")
            p, w = o["cert"][7:].split(": "); w = [int(c) for c in w]; assert len(w) == int(p)
            assert periodic_ok(w, D, k), D
            lst.append({"D": list(D), "L": L, "colourable": True, "period": int(p), "word": tostr(w)})
        else:
            assert D in exceptional and o["cert"] == "interval N=%d" % exceptional[D]
            lst.append({"D": list(D), "L": L, "colourable": False, "interval": shortest[D]})
    cert["sporadic"][str(k)] = lst
    print("k=%d: %d sporadic sets, %d with periodic colourings, %d exceptional" % (k, len(lst), sum(x["colourable"] for x in lst), sum(not x["colourable"] for x in lst)))

for name in ("A5", "A6", "W2", "W3"):
    f = json.load(open('fam_%s.json' % name))
    W, k, r, u = f["W"], f["k"], f["r"], f["u"]
    w = max(W + [r]); assert len(u) == w and r not in W
    loops = {}
    for l, z in f["loops"].items():
        l = int(l); assert len(z) == l + w and z[:w] == u and z[l:] == u and word_ok(z, W + [r], k), (name, l)
        loops[l] = z
    gens = sorted(loops); assert gens == f["generators"]
    S = semigroup(gens, 2000); gap = max(n for n in range(2001) if not S[n]); assert gap == f["largest_gap"]
    assert all(S[n] for n in range(gap + 1, gap + 1 + gens[0]))
    direct = {}
    for x in range(k, gap + r + 2 * k, k):
        assert x not in W
        if (x - r >= 1 and S[x - r]) or S[x + r]: continue
        dd = f["direct"][str(x)]; assert len(dd["word"]) == dd["period"] and periodic_ok(dd["word"], W + [x], k), (name, x)
        direct[str(x)] = {"period": dd["period"], "word": tostr(dd["word"])}
    assert set(direct) == set(f["direct"])
    cert["one_parameter"].append({"name": name, "W": W, "k": k, "r": r, "state": tostr(u),
                                  "loops": {str(l): tostr(loops[l]) for l in gens}, "largest_gap": gap, "direct": direct})
    print("family %s: W=%s k=%d r=%d, %d loops, generators %s, largest gap %d, direct x=%s" % (name, W, k, r, len(gens), gens, gap, sorted(map(int, direct))))

Sgen = [(1,0),(0,1),(1,1),(2,1),(3,1),(3,2)]
def Dset(s, t): return sorted(set(abs(a * s + b * t) for a, b in Sgen))
def orbit(b):
    seen = {b}; todo = [b]
    while todo:
        s, t = todo.pop()
        for nb in ((-s, t + 3 * s), (s + t, -t)):
            if nb not in seen: seen.add(nb); todo.append(nb)
    return sorted(seen)
bases = []
for fn, b0 in (("base_1_2_3_5_7_8.json", (2, 1)),):
    f = json.load(open(fn)); B, u = f["B"], f["u"]; w = max(B); assert len(u) == w
    vecs = orbit(b0); assert len(vecs) == 12 and all(Dset(*v) == B for v in vecs)
    loops = {}
    for l, z in f["loops"].items():
        l = int(l); assert len(z) == l + w and z[:w] == u and z[l:] == u and word_ok(z, B, 6)
        loops[l] = z
    gens = sorted(loops); S = semigroup(gens, 3000); gap = max(n for n in range(3001) if not S[n])
    assert gap == f["largest_gap"] and all(S[n] for n in range(gap + 1, gap + 1 + gens[0]))
    bases.append({"B": B, "vectors": [list(v) for v in vecs], "state": tostr(u), "loops": {str(l): tostr(loops[l]) for l in gens}, "largest_gap": gap})
    print("base %s: 12 vectors, generators %s, largest gap %d" % (B, gens, gap))
cert["two_parameter"] = {"forms": [list(x) for x in Sgen], "base": bases[0]}
S1 = semigroup([int(l) for l in bases[0]["loops"]], 5000)
g1 = bases[0]["largest_gap"]; cnt = 0
for s_ in range(-200, 201):
    for t in range(1, 201):
        if math.gcd(abs(s_), t) != 1: continue
        D = Dset(s_, t)
        if len(D) != 6 or D[0] == 0: continue
        if abs(s_ - 2 * t) > g1 or abs(s_ + 3 * t) > g1: continue
        cnt += 1
        assert any((N := abs(s_ * t0 - t * s0)) >= 1 and S1[N] for s0, t0 in bases[0]["vectors"]), (s_, t)
print("two-parameter family: %d members in the finite region |s-2t|,|s+3t| <= %d, all covered by the single base" % (cnt, g1))
json.dump(cert, open(os.path.join(HERE, '..', 'certificates.json'), 'w'), indent=1)
print("written")
