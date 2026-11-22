#!/usr/bin/env python3
"""Exhaustive (no SAT) re-check of the one-block negative claims of PROOF.md §8:
forward insertion of ONE block into the cyclic q=3 base on n=6g+1 with
W0=[0,k-1] u [2g+1+k,4g], W1=[1,k] u [2g+1+k,4g], k=1..2g-1, any insertion colour.
Claim: impossible for g=2,3,4; for g=5 possible only for k in {2,8}."""
import sys
from functools import lru_cache


def run(g):
    n = 6 * g + 1
    L = lambda x, y: min((y - x) % n, (x - y) % n)

    def matchings(W):
        out = []
        def rec(rem, used, acc):
            if not rem:
                out.append((frozenset(used), tuple(acc))); return
            x = rem[0]
            for y in rem[1:]:
                l = L(x, y)
                if l in used:
                    continue
                r2 = [z for z in rem[1:] if z != y]
                rec(r2, used | {l}, acc + [(x, y)])
        rec(sorted(W), frozenset(), [])
        return out

    def has_pm(V, forbidden):
        V = tuple(sorted(V))
        @lru_cache(maxsize=None)
        def rec(rem):
            if not rem:
                return True
            x = rem[0]
            for y in rem[1:]:
                if L(x, y) not in forbidden:
                    if rec(tuple(z for z in rem[1:] if z != y)):
                        return True
            return False
        return rec(V)

    feasible = {}
    for k in range(1, 2 * g):
        W0 = set(range(0, k)) | set(range(2 * g + 1 + k, 4 * g + 1))
        W1 = set(range(1, k + 1)) | set(range(2 * g + 1 + k, 4 * g + 1))
        # class vertex sets V(E_c)
        Vs = []
        for c in range(2 * n):
            a = ((4 * g + 1) * c) % (2 * n)
            Vs.append(frozenset((x + a // 2) % n for x in (W1 if a % 2 else W0)))
        ok_window = all(not (Vs[c] & Vs[(c + 1) % (2 * n)] or Vs[c] & Vs[(c + 2) % (2 * n)]
                             or Vs[(c + 1) % (2 * n)] & Vs[(c + 2) % (2 * n)]) for c in range(2 * n))
        assert ok_window
        A, B = matchings(W0), matchings(W1)
        Ss = set()
        for s0, _ in A:
            for s1, _ in B:
                if not (s0 & s1):
                    Ss.add(s0 | s1)
        good = []
        for S in Ss:
            for c in range(6):
                if all(has_pm(Vs[c + j], S) for j in range(3)):
                    good.append(c)
        feasible[k] = (len(Ss), sorted(set(good)))
    return feasible


if __name__ == "__main__":
    for g in map(int, sys.argv[1:]):
        f = run(g)
        print("g=%d:" % g, {k: v for k, v in f.items()},
              "-> one block feasible for k in", [k for k, v in f.items() if v[1]])
        sys.stdout.flush()
