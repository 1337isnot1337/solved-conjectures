"""For random near-1-factorizations of K_13: for each rainbow 4-set D, does V\\D split into 3 triples
giving a seal-free partition? Report the fraction of rainbow D that fail."""
import sys, random, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[2] / 'theorem-a'))
import n1f, fac
from cegar import partners, sealfree

def splits9(W):
    W = list(W); a = W[0]
    for p in itertools.combinations(W[1:], 2):
        A = [a, *p]; R = [x for x in W if x not in A]; b = R[0]
        for q in itertools.combinations(R[1:], 2):
            B = [b, *q]; C = [x for x in R if x not in B]
            yield A, B, C

def rainbow(L, D):
    cols = [L[a][b] for a, b in itertools.combinations(D, 2)]
    return len(set(cols)) == 6

n = 13
seeds = int(sys.argv[1]) if len(sys.argv) > 1 else 20
for s in range(seeds):
    L = fac.near(n, "dbl", s) if s > 0 else n1f.cyclic(n)
    P = partners(L)
    tot = fail = 0; minok = 999
    for D in itertools.combinations(range(n), 4):
        if not rainbow(L, D): continue
        tot += 1
        W = [x for x in range(n) if x not in D]
        ok = sum(1 for A, B, C in splits9(W) if sealfree(P, [list(D), A, B, C], n))
        minok = min(minok, ok)
        if ok == 0: fail += 1
    print('seed', s, 'rainbow D', tot, 'D with no good split', fail, 'min #good splits', minok, flush=True)
