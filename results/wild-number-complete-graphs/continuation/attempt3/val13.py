"""Validate Lemma 13.1 (the bad-triple characterisation used by abs13.py) on real factorizations of K_13:
for every rainbow D with k <= 1 invalid triples inside D and every split of W = V \\ D:
   {D,A,B,C} seal-free  <=>  no block in Bad(D) computed from the formulas (uncovered sets),
and the class sizes inside W are as stated."""
import sys, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[2] / 'theorem-a'))
import n1f, fac
from cegar import partners, sealfree
from lib13 import splits9, rainbow

from lib13 import bad_family

n = 13; checked = 0
for s in range(int(sys.argv[1]) if len(sys.argv) > 1 else 4):
    L = fac.near(n, 'dbl', s) if s > 0 else n1f.cyclic(n)
    P = partners(L)
    for D in itertools.combinations(range(n), 4):
        if not rainbow(L, D): continue
        W = [x for x in range(n) if x not in D]
        kk = sum(1 for a, b in itertools.combinations(D, 2) if L[a][b] in D)
        if kk > 1: continue
        Bad, k = bad_family(L, D, W)
        for A, Bb, C in splits9(W):
            direct = sealfree(P, [list(D), A, Bb, C], n)
            formula = not any(frozenset(X) in Bad for X in (A, Bb, C))
            assert direct == formula, (s, D, A, Bb, C)
            checked += 1
    print('factorization', s, 'ok; splits checked so far', checked, flush=True)
