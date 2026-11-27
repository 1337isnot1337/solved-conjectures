"""Exact K4 certificate for the first maximal connected-link palette orbit."""
from fractions import Fraction
from itertools import combinations, permutations, product

H = range(6)
allowed = {tuple(map(int, s)) for s in
           "012 013 023 014 024 134 015 125 035 045".split()}
aut = [p for p in permutations(H)
       if {tuple(sorted(p[i] for i in t)) for t in allowed} == allowed]
constant = 2
star_weights = {
    (0, 0, 2): 133,
    (2, 3, 4): -483,
}
leaf_weights = {
    (0, 0, 2, 0): 519,
    (0, 0, 2, 5): 247,
    (0, 1, 1, 2): -3,
    (0, 1, 2, 0): -314,
    (0, 1, 2, 1): 556,
    (0, 1, 2, 3): -1302,
    (0, 2, 0, 0): 59,
    (0, 2, 0, 1): 383,
    (0, 2, 0, 2): -168,
    (0, 2, 0, 5): -106,
    (0, 2, 1, 0): 315,
    (0, 2, 1, 2): 2170,
    (0, 2, 1, 3): -1137,
    (0, 2, 1, 5): -837,
    (0, 2, 2, 1): 41,
    (0, 2, 2, 2): 88,
    (0, 2, 2, 3): -267,
    (0, 2, 2, 5): -127,
    (0, 2, 3, 0): 373,
    (0, 2, 3, 1): -165,
    (0, 2, 3, 2): 439,
    (0, 2, 3, 5): 441,
    (1, 1, 0, 1): 28,
    (1, 1, 2, 1): 860,
    (1, 1, 2, 2): -314,
    (1, 1, 2, 3): 1012,
    (1, 1, 2, 5): -314,
    (1, 2, 0, 0): 594,
    (1, 2, 0, 2): 714,
    (1, 2, 0, 3): -930,
    (1, 2, 0, 5): -708,
    (1, 2, 1, 0): -121,
    (1, 2, 1, 1): 587,
    (1, 2, 1, 3): 493,
    (1, 2, 2, 0): 755,
    (1, 2, 2, 1): 159,
    (1, 2, 2, 3): -241,
    (1, 2, 2, 5): -123,
    (1, 2, 5, 0): 315,
    (1, 2, 5, 1): 710,
    (1, 2, 5, 3): -802,
    (2, 2, 0, 2): 233,
    (2, 2, 1, 0): -207,
    (2, 2, 1, 2): 123,
    (2, 2, 1, 3): -1550,
    (2, 2, 3, 0): 476,
    (2, 2, 3, 2): 1122,
    (2, 2, 3, 4): -247,
    (2, 2, 3, 5): -1368,
    (2, 2, 5, 1): 247,
    (2, 2, 5, 2): 247,
    (2, 3, 0, 0): 435,
    (2, 3, 2, 1): 87,
    (2, 3, 2, 2): 440,
    (2, 3, 2, 3): -682,
    (2, 3, 2, 4): -561,
    (2, 5, 1, 0): 1158,
    (2, 5, 2, 2): 247,
    (2, 5, 2, 3): 123,
}

def star(a, b, c):
    key = min(tuple(sorted((p[a], p[b], p[c]))) for p in aut)
    return star_weights.get(key, 0)

def leaf(a, b, c, d):
    key = min((min(p[a], p[b]), max(p[a], p[b]), p[c], p[d])
              for p in aut)
    return leaf_weights.get(key, 0)

def main():
    S = {x: star(*x) for x in product(H, repeat=3)}
    L = {x: leaf(*x) for x in product(H, repeat=4)}
    centered = {x: 6 * g - sum(L[(*x[:3], h)] for h in H)
                for x, g in L.items()}
    edges = list(combinations(range(4), 2))
    index = {e: j for j, e in enumerate(edges)}
    def edge(i, j):
        return index[min(i, j), max(i, j)]
    flags = [(edge(i, j), edge(i, k), edge(i, l), edge(j, k))
             for i, j, k, l in permutations(range(4))]
    faces = [(edge(i, j), edge(i, k), edge(j, k))
             for i, j, k in combinations(range(4), 3)]
    good = 0
    lower = worst = 10**9
    for x in product(H, repeat=6):
        value = 24 * constant + sum(
            S[x[a], x[b], x[d]] + centered[x[a], x[b], x[c], x[d]]
            for a, b, d, c in flags)
        worst = min(worst, value)
        for face in faces:
            t = tuple(sorted(x[i] for i in face))
            if len(set(t)) == 3 and t not in allowed:
                break
        else:
            good += 1
            lower = min(lower, value)
    expectation = 24 * constant + 24 * Fraction(sum(S.values()), 6**3)
    assert (good, lower, expectation) == (14172,16,Fraction(-3188,3)), (good,lower,expectation,worst)
    print("accepted labelled K4s:", good)
    print("minimum accepted:", lower, "minimum unrestricted:", worst)
    print("unconditional expectation:", expectation)

if __name__ == "__main__":
    main()
