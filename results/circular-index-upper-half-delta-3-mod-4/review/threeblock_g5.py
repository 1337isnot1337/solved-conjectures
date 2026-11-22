#!/usr/bin/env python3
"""Exhaustive (no SAT) re-check of PROOF.md §8, g=5 (Delta=23): three forward-form
blocks (each block = perfect matchings of V(E_c),V(E_c+1),V(E_c+2) by edges whose
length is not in S, blocks pairwise edge-disjoint), insertion colours c1<c2<c3 in Z_62
with cyclic gaps >= 2 and c1 in 0..5, k in {2,8} (the only k with a feasible single block,
re-checked by oneblock_brute.py).  Claim: no solution."""
import sys, time

g = int(sys.argv[1]) if len(sys.argv) > 1 else 5
KS = [int(x) for x in sys.argv[2].split(',')] if len(sys.argv) > 2 else [2, 8]
ONLY = tuple(int(x) for x in sys.argv[3].split(',')) if len(sys.argv) > 3 else None
n = 6 * g + 1
P = 2 * n
L = lambda x, y: min((y - x) % n, (x - y) % n)


def matchings_distinct(W):
    out = []
    def rec(rem, used):
        if not rem:
            out.append(frozenset(used)); return
        x = rem[0]
        for y in rem[1:]:
            l = L(x, y)
            if l in used:
                continue
            rec([z for z in rem[1:] if z != y], used | {l})
    rec(sorted(W), frozenset())
    return out


def pms(V, S):
    out = []
    def rec(rem, acc):
        if not rem:
            out.append(frozenset(acc)); return
        x = rem[0]
        for y in rem[1:]:
            if L(x, y) not in S:
                rec([z for z in rem[1:] if z != y], acc + [(min(x, y), max(x, y))])
    rec(sorted(V), [])
    return out


def main():
    t0 = time.time()
    total_inst = 0
    sols = 0
    for k in KS:
        W0 = set(range(0, k)) | set(range(2 * g + 1 + k, 4 * g + 1))
        W1 = set(range(1, k + 1)) | set(range(2 * g + 1 + k, 4 * g + 1))
        Vs = []
        for c in range(P):
            a = ((4 * g + 1) * c) % P
            Vs.append(frozenset((x + a // 2) % n for x in (W1 if a % 2 else W0)))
        Ss = {s0 | s1 for s0 in matchings_distinct(W0) for s1 in matchings_distinct(W1) if not (s0 & s1)}
        triples = [(c1, c2, c3) for c1 in range(6) for c2 in range(c1 + 2, P) for c3 in range(c2 + 2, P)
                   if c1 + P - c3 >= 2]
        if ONLY:
            triples = [ONLY]
        print("k=%d: %d length sets S, %d colour triples" % (k, len(Ss), len(triples)))
        total_inst += len(triples)
        for S in Ss:
            PM = [pms(Vs[c], S) for c in range(P)]
            blockok = [all(PM[(c + j) % P] for j in range(3)) for c in range(P)]
            for (c1, c2, c3) in triples:
                if not (blockok[c1] and blockok[c2] and blockok[c3]):
                    continue
                seq = [PM[(c + j) % P] for c in (c1, c2, c3) for j in range(3)]
                # backtrack: 9 matchings, globally edge-disjoint
                def bt(i, used):
                    if i == 9:
                        return True
                    for F in seq[i]:
                        if not (F & used):
                            if bt(i + 1, used | F):
                                return True
                    return False
                if bt(0, frozenset()):
                    sols += 1
                    print("SOLUTION k=%d S=%s colours=%s" % (k, sorted(S), (c1, c2, c3)))
        print("  done k=%d, %.1fs" % (k, time.time() - t0)); sys.stdout.flush()
    print("instances (k, triple) = %d; solutions found: %d" % (total_inst, sols))


if __name__ == "__main__":
    main()
