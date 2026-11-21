"""Exact checks for the cycle weights, available surplus and Laplacian comparison."""

from fractions import Fraction as F
from itertools import combinations, permutations
from math import prod


def permanent(a):
    return sum(prod(a[i][j] for i, j in enumerate(p)) for p in permutations(range(len(a))))


def simple_cycles(neighbors):
    def visit(path):
        start, v = path[0], path[-1]
        for w in neighbors[v]:
            if w == start and len(path) >= 3 and path[1] < v:
                yield tuple(path)
            elif w > start and w not in path:
                yield from visit(path + [w])
    for i in range(len(neighbors)):
        yield from visit([i])


def check_graph(order, edges):
    nbr = [set() for _ in range(order)]
    for i,j in edges:
        nbr[i].add(j)
        nbr[j].add(i)
    deg = [len(row) for row in nbr]
    lap = [[deg[i] if i == j else -int(j in nbr[i]) for j in range(order)] for i in range(order)]
    for missing in [None, *range(order)]:
        idx = [i for i in range(order) if i != missing]
        sub = [[lap[i][j] for j in idx] for i in idx]
        assert permanent([[v*v for v in row] for row in sub]) <= permanent(sub)*prod(deg[i] for i in idx)
    if min(deg) < 2:
        return 0
    mass = {(i,j): F(0) for i in range(order) for j in nbr[i]}
    count = 0
    for cyc in simple_cycles(nbr):
        count += 1
        weight = prod(F(1,deg[i]**2) for i in cyc)
        denom = prod(deg[i]-1 for i in cyc)
        pooled = F(0)
        for i,j in zip(cyc, cyc[1:]+cyc[:1]):
            w = F(1,deg[i]*deg[j])
            surplus = (w-w*w/2)/(deg[i]+deg[j]-1) - w*w
            assert surplus >= 0
            for u,v in ((i,j),(j,i)):
                probability = F(deg[u]-1,denom)
                mass[u,v] += probability
                pooled += probability*surplus/2
        assert pooled >= 2*weight
    assert max(mass.values(),default=0) <= 1
    return count


if __name__ == '__main__':
    graph_count = cycle_count = 0
    for n in (3,4,5):
        possible = list(combinations(range(n),2))
        for mask in range(1 << len(possible)):
            edges = [e for i,e in enumerate(possible) if mask >> i & 1]
            cycle_count += check_graph(n,edges)
            graph_count += 1
    print(f"Passed {graph_count} simple graphs and {cycle_count} first-return cycle budgets.")
