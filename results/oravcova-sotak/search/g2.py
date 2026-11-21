import sys, json, math, time
import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from family import semigroup, periodic_colouring
def forms(s, t): return (s, t, s + t, 2*s + t, 3*s + t, 3*s + 2*t)
def Dset(s, t): return tuple(sorted(set(abs(x) for x in forms(s, t))))
def orbit(b):
    seen = {b}; todo = [b]
    while todo:
        s, t = todo.pop()
        for nb in ((-s, t + 3*s), (s + t, -t)):
            if nb not in seen: seen.add(nb); todo.append(nb)
    return sorted(seen)
def valid(s, t):
    f = forms(s, t)
    return math.gcd(abs(s), abs(t)) == 1 and 0 not in f and len(set(abs(x) for x in f)) == 6
if __name__ == "__main__":
    b1 = json.load(open("base_1_2_3_5_7_8.json")); b2 = json.load(open("base_1_3_4_5_6_9.json"))
    S1 = semigroup(b1["generators"], 5000); S2 = semigroup(b2["generators"], 5000)
    O1 = orbit((2, 1)); O2 = orbit((1, 3))
    print("orbit of (2,1):", O1, [Dset(*b) for b in O1][:2]); print("orbit of (1,3):", O2, [Dset(*b) for b in O2][:2])
    assert all(Dset(*b) == (1,2,3,5,7,8) for b in O1) and all(Dset(*b) == (1,3,4,5,6,9) for b in O2)
    def covered(s, t):
        for (s0, t0) in O1:
            N = abs(s * t0 - t * s0)
            if N >= 2 and N < len(S1) and S1[N]: return ("B1", (s0, t0), N)
        for (s0, t0) in O2:
            N = abs(s * t0 - t * s0)
            if N >= 2 and N < len(S2) and S2[N]: return ("B2", (s0, t0), N)
        return None
    unc = []; total = 0
    R = 400
    for s in range(-R, R + 1):
        for t in range(1, R + 1):          # (s,t) and (-s,-t) give the same set
            if not valid(s, t): continue
            total += 1
            if covered(s, t) is None: unc.append((s, t))
    print("valid members with |s|,t <= %d: %d ; not covered by the two base orbits: %d" % (R, total, len(unc)))
    print(sorted(unc, key=lambda p: max(abs(p[0]), p[1]))[:80])
    print("max |coordinate| among uncovered:", max(max(abs(s), t) for s, t in unc) if unc else None)
    json.dump(unc, open("g2_uncovered.json", "w"))
