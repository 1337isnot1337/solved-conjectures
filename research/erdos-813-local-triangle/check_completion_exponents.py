#!/usr/bin/env python3
"""Check every partial label placement bound using geometric completion moves."""
from functools import lru_cache
from itertools import combinations
from fractions import Fraction

U, V, W, A, B, C, D = range(7)
EDGES = ((U,A),(U,B),(V,A),(V,B),(A,B),
         (U,C),(U,D),(W,C),(W,D),(C,D),(V,W))
DIAMONDS = ((U,V,A,B), (U,W,C,D))
NEIGHBOR = [{j for j in range(7) if (i,j) in EDGES or (j,i) in EDGES}
            for i in range(7)]


@lru_cache(None)
def cost(known):
    if len(known) == 7:
        return 0
    choices = [4 - min(2,len(known & NEIGHBOR[i])) + cost(known | {i})
               for i in range(7) if i not in known]
    for u,v,a,b in DIAMONDS:
        if {u,v} <= known:
            added = {a,b} - known
            if added:
                choices.append((1 if len(added) == 1 else 3) + cost(known | added))
    return min(choices)


def main():
    subsets = {r: list(map(frozenset,combinations(range(7),r)))
               for r in range(1,8)}
    e = [max(cost(known) for known in subsets[r]) for r in range(1,8)]
    k = [max(sum(i in known and j in known for i,j in EDGES)
             for known in subsets[r]) for r in range(1,8)]
    assert e == [13,10,8,6,4,2,0]
    assert k == [0,1,3,5,6,8,11]
    print("largest completion exponents:", e)
    print("maximum required edges:", k)
    exponents = (16,14,14,13,12,11,10)
    relative = [v-20+Fraction(10*r,7) for r,v in enumerate(exponents,1)]
    assert max(relative[:-1]) < 0 == relative[-1]
    print("two-parameter relative variance exponents:", [str(x) for x in relative])


if __name__ == "__main__":
    main()
