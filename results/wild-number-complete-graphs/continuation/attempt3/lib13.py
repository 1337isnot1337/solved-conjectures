import sys, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[2] / 'theorem-a'))
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

def bad_family(L, D, W):
    n = len(L); Ws = set(W); B = set()
    col = lambda a, b: L[a][b]
    kD = [(a, b, col(a, b)) for a, b in itertools.combinations(D, 2) if col(a, b) in D]
    k = len(kD)
    # class sizes inside W
    cnt = {c: 0 for c in range(n)}
    for a, b in itertools.combinations(W, 2): cnt[col(a, b)] += 1
    colD = set(col(a, b) for a, b in itertools.combinations(D, 2)) & Ws
    d0 = kD[0][2] if k == 1 else None
    for u in W: assert cnt[u] == (3 if u in colD else 2)
    for d in D: assert cnt[d] == (4 if d == d0 else 3)
    def covered(c):
        return set(v for a, b in itertools.combinations(W, 2) if col(a, b) == c for v in (a, b))
    for u in W:
        for a, b in itertools.combinations(W, 2):
            if col(a, b) == u: B.add(frozenset((u, a, b)))
    for d in D:
        unc = Ws - covered(d)
        if d == d0:
            assert len(unc) == 1
            for a, b in itertools.combinations(W, 2):
                if col(a, b) == d: B.add(frozenset(unc | {a, b}))
        else:
            assert len(unc) == 3; B.add(frozenset(unc))
    for u in colD:
        unc = Ws - {u} - covered(u); assert len(unc) == 2; B.add(frozenset(unc | {u}))
    return B, k

