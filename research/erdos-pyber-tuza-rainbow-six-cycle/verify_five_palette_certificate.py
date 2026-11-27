"""Verify a five-vertex colour-palette obstruction using only exact arithmetic."""
from fractions import Fraction
from functools import cache
from itertools import combinations, permutations, product
from collections import Counter

H = range(6)
E4 = list(combinations(range(4), 2))
E5 = E4 + [(i, 4) for i in range(4)]
P4 = list(permutations(range(4)))
P5 = list(permutations(range(5)))
TREE_SHAPES = [
    [(0, 1), (0, 2), (0, 3), (0, 4)],
    [(0, 1), (1, 2), (2, 3), (3, 4)],
    [(0, 1), (0, 2), (0, 3), (1, 4)],
]

def indices(edges, shape, p):
    return tuple(edges.index(tuple(sorted((p[i], p[j])))) for i, j in shape)

def verify(data):
    W = data.WEIGHTS
    F = {tuple(map(int, s)) for s in data.ALLOWED.split()}
    A = [p for p in permutations(H)
         if {tuple(sorted(p[i] for i in t)) for t in F} == F]
    allowed = {x for x in product(H, repeat=3)
               if len(set(x)) < 3 or tuple(sorted(x)) in F}
    four_faces = [tuple(E4.index(e) for e in combinations(t, 2))
                  for t in combinations(range(4), 3)]
    fp = [indices(E4, E4, p) for p in P4]
    base = {}
    for x in product(H, repeat=6):
        if x in base or any(tuple(x[i] for i in t) not in allowed
                            for t in four_faces):
            continue
        for a in A:
            inverse_hue = tuple(a.index(c) for c in H)
            for p, k in zip(P4, fp):
                y = tuple(a[x[i]] for i in k)
                inv = tuple(p.index(i) for i in range(4))
                base.setdefault(y, (x, []))[1].append((inverse_hue, inv))

    @cache
    def leafkey(x, d):
        y, transformations = base[x]
        # Here p maps new (canonical) indices to old ones. The old
        # anchor 0 goes to the new index p.index(0).
        return ('L4', min((y, p.index(0), a[d]) for a, p in transformations))

    @cache
    def leafweight(x, d):
        return (6 * W.get(leafkey(x, d), 0)
                - sum(W.get(leafkey(x, c), 0) for c in H))

    tree_values = []
    for j, T in enumerate(TREE_SHAPES):
        tp = []
        for p in P5:
            permuted = [tuple(sorted((p[i], p[k]))) for i, k in T]
            if all(e in T for e in permuted):
                tp.append(tuple(T.index(e) for e in permuted))
        tree_values.append({
            x: W.get(('T', j, min(tuple(a[x[i]] for i in p)
                                  for p in tp for a in A)), 0)
            for x in product(H, repeat=4)})
    expectation = (120 * W.get('1', 0) + Fraction(
        120 * sum(sum(t.values()) for t in tree_values), 6**4))
    assert 54 * expectation == data.EXPECTED_TIMES_54 and expectation < 0

    mat = {}
    for h, coefficient, v in data.PAIR_SQUARES:
        positions = [(a, b) for a, b in product(H, repeat=2)
                     if (h, a, b) in allowed]
        assert len(v) == len(positions) and coefficient >= 0
        mat[h] = (coefficient, dict(zip(positions, v)))
    @cache
    def pairweight(s):
        r, u, v, w, x = s
        total = 0
        for a in A:
            if a[r] in mat:
                coeff, m = mat[a[r]]
                total += coeff * m[a[u], a[v]] * m[a[w], a[x]]
        return total

    leaf_positions = [indices(E5, E4+[(0, 4)], p) for p in P5]
    pair_positions = [indices(E5, [(0,1),(0,2),(1,2),(0,3),(1,3)], p)
                      for p in P5]
    tree_positions = [(j, indices(E5, T, p)) for j, T in enumerate(TREE_SHAPES)
                      for p in P5]
    sub = [tuple(i for i in range(5) if i != j) for j in range(5)]
    four_patterns = [tuple(E5.index(e) for e in combinations(t, 2)) for t in sub]
    spokes = [tuple(E5.index(tuple(sorted((i, j)))) for i in t)
              for j, t in enumerate(sub)]

    def is_representative(x):
        for T, R in zip(four_patterns, spokes):
            y, changes = base[tuple(x[i] for i in T)]
            if y < x[:6]:
                return False
            if y == x[:6]:
                z = tuple(x[i] for i in R)
                if any(tuple(a[z[i]] for i in p) < x[6:] for a, p in changes):
                    return False
        return True

    count, minimum = 0, None
    for y in sorted({z for z, _ in base.values()}):
        for z in product(H, repeat=4):
            if any((c, z[i], z[j]) not in allowed for c, (i, j) in zip(y, E4)):
                continue
            x = y + z
            if not is_representative(x):
                continue
            count += 1
            score = 120 * W.get('1', 0)
            score += sum(tree_values[j][tuple(x[i] for i in p)]
                         for j, p in tree_positions)
            for p in leaf_positions:
                q = tuple(x[i] for i in p)
                score += leafweight(q[:6], q[6])
            if mat:
                score -= sum(pairweight(tuple(x[i] for i in p))
                             for p in pair_positions)
            minimum = score if minimum is None else min(minimum, score)
    assert minimum == data.MINIMUM_GOOD and minimum >= 0
    assert count == data.EXPECTED_REPRESENTATIVES
    print("allowed K5 representatives:", count)
    print("minimum accepted score:", minimum)
    print("upper bound on expectation:", expectation)

if __name__ == '__main__':
    import importlib
    import sys
    verify(importlib.import_module(sys.argv[1] if len(sys.argv) > 1
                                   else 'five_palette_certificate_C'))
