#!/usr/bin/env python3
"""Independent check of the Remark in PROOF.md §3: for small g, all pairs (W0, W1) of
2g-subsets of Z_n (n = 6g+1), each a union of <= 2 cyclic intervals, with 0 the start of a
run of W0, satisfying the cyclic-ansatz window conditions, are (up to x -> -x, i.e.
(W0,W1) -> (-W0+t, 1-W1+t)) members of the k-family W0=[0,k-1]u[2g+1+k,4g], W1=[1,k]u[...]."""
import sys

g = int(sys.argv[1]) if len(sys.argv) > 1 else 3
n = 6 * g + 1
P = 2 * n
m = 2 * g


def two_interval_sets():
    out = set()
    for s in range(n):
        for a in range(1, m + 1):
            A = [(s + i) % n for i in range(a)]
            if a == m:
                out.add(frozenset(A)); continue
            for s2 in range(n):
                W = frozenset(A + [(s2 + i) % n for i in range(m - a)])
                if len(W) == m:
                    out.add(W)
    return out


def ok(W0, W1):
    V = []
    for c in range(P):
        a = ((4 * g + 1) * c) % P
        V.append({(x + a // 2) % n for x in (W1 if a % 2 else W0)})
    return all(not (V[c] & V[(c + 1) % P]) and not (V[c] & V[(c + 2) % P]) for c in range(P))


sets = two_interval_sets()
W0s = [W for W in sets if 0 in W and (n - 1) not in W]
sol = [(W0, W1) for W0 in W0s for W1 in sets if ok(W0, W1)]
fam = set()
for k in range(1, 2 * g):
    B = set(range(2 * g + 1 + k, 4 * g + 1))
    fam.add((frozenset(set(range(k)) | B), frozenset(set(range(1, k + 1)) | B)))
direct, refl, other = 0, 0, []
for W0, W1 in sol:
    if (W0, W1) in fam:
        direct += 1; continue
    found = False
    for t in range(n):
        R0 = frozenset((-x + t) % n for x in W0)
        R1 = frozenset((1 - x + t) % n for x in W1)
        if (R0, R1) in fam:
            found = True; break
    if found:
        refl += 1
    else:
        other.append((sorted(W0), sorted(W1)))
print("g=%d: %d window-valid pairs; %d in k-family, %d reflections of k-family, %d other"
      % (g, len(sol), direct, refl, len(other)))
for o in other[:20]:
    print("  other:", o)
print("k-family all valid:", all(ok(a, b) for a, b in fam))
