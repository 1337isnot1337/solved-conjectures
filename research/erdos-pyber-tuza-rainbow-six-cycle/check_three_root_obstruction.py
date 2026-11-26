"""Exact three-root coupling obstruction for the rainbow six-cycle reduction."""
from itertools import combinations, product
from fractions import Fraction


def main():
    chosen = [("435102", "120453"), ("054321", "012345"), ("432105", "105432")]
    pairs = ((0,1), (1,2), (2,0))
    support = set()
    costs = []
    for b, c in chosen:
        block = [(a, int(b[a]), int(c[a])) for a in range(6)]
        assert all({row[k] for row in block} == set(range(6)) for k in range(3))
        costs.append(sum(sum(t[i] != t[j] for i,j in pairs) for t in block))
        support.update(block)
    assert costs == [18, 8, 16]
    e = Fraction(1,6)
    assert sum(w*d for w,d in zip([1-2*e,e,e], costs))/6 == Fraction(8,3)
    unequal = [{frozenset((t[i], t[j])) for t in support if t[i]!=t[j]} for i,j in pairs]
    assert all(len(a|b|c)<6 for a,b,c in product(*unequal))
    for i,j in combinations(range(3),2):
        adj = [set() for _ in range(12)]
        for t in support:
            u,v = t[i],t[j]+6
            adj[u].add(v)
            adj[v].add(u)
        reached = {0}
        for _ in range(12):
            reached |= set().union(*(adj[v] for v in reached))
        assert len(reached) == 12
    print(f"{len(support)} joint outcomes; all three overlaps connected, no disjoint rainbow matching")


if __name__ == "__main__":
    main()
