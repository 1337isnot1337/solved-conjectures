"""Independent small-case weighted trace check by direct forest-triple enumeration.

Uses published definitions 9, 20 and 21 of Tom–Vailaya (2026), not the
transfer identity. Forests enumerate by the NBC larger-neighbor criterion
stated in their section 2.2. Closure colorings count each directed edge.
This is a sanity check, not a proof.
"""
from functools import cache
from heapq import heappop, heappush
from itertools import product
import sys


def unit_interval_graphs(n):
    """Enumerate all nondecreasing largest-neighbor vectors."""
    def go(right):
        i = len(right)
        if i == n:
            yield [(a, b) for a, z in enumerate(right) for b in range(a + 1, z + 1)]
        else:
            for z in range(max(i, right[-1] if i else 0), n):
                yield from go(right + [z])
    yield from go([])


@cache
def compositions(n):
    if n == 0:
        return ((),)
    return tuple((i,) + tail for i in range(1, n + 1) for tail in compositions(n-i))


def component_lists(n, edges):
    ns = [[] for _ in range(n)]
    for a, b in edges:
        ns[a].append(b)
        ns[b].append(a)
    seen = set()
    lists = []
    for r in range(n):
        if r in seen:
            continue
        seq = []
        queue = [r]
        seen.add(r)
        while queue:
            v = heappop(queue)
            seq.append(v)
            for w in ns[v]:
                if w not in seen:
                    seen.add(w)
                    heappush(queue, w)
        lists.append(seq)
    return lists


def forest_diagonal(n, E, j, x, q):
    augmented_n = n + j - 1
    appended = [(u, u + 1) for u in range(n - 1, augmented_n - 1)]
    all_edges = E + appended
    successors = [[None] for _ in range(n)]
    for a, b in E:
        successors[a].append(b)
    elem = [1] + [0] * len(x)
    for a in x:
        for i in range(len(x), 0, -1):
            elem[i] += a * elem[i - 1]
    qint = [sum(q**i for i in range(j)) for j in range(augmented_n + 1)]
    total = 0
    for chosen in product(*successors):
        forest = [(a,b) for a,b in enumerate(chosen) if b is not None] + appended
        comps = component_lists(augmented_n, forest)
        last = next(i for i,comp in enumerate(comps) if n-1 in comp)
        if len(comps[0]) < j:
            continue
        options = [tuple(c for c in compositions(len(comp))
                         if (i or c[0] == j) and (i != last or c[-1] >= j))
                   for i,comp in enumerate(comps)]
        pos = {u: i for i,u in enumerate(v for comp in comps for v in comp)}
        inv = sum(pos[a] > pos[b] for a,b in all_edges)
        for vector in product(*options):
            value = (-1)**sum(len(c)-1 for c in vector) * q**inv
            for i,c in enumerate(vector):
                if i:
                    value *= qint[c[0]]
                for p in c[int(i==0):]:
                    value *= elem[p] if p < len(elem) else 0
            total += value
    return total


def closure_colors(n, E, x, q):
    arcs = [(a, b if b<n-1 else 0) for a,b in E]
    if (0,0) in arcs:
        return 0
    colors = [0]*(n-1)
    prior = [[] for _ in colors]
    for a,b in arcs:
        prior[max(a,b)].append((min(a,b), a<b))
    def go(v):
        if v == n-1:
            return 1
        total = 0
        for c,weight in enumerate(x):
            if any(colors[w]==c for w,_ in prior[v]):
                continue
            asc = sum((colors[w] < c) if fwd else (c < colors[w]) for w,fwd in prior[v])
            colors[v] = c
            total += weight * q**asc * go(v+1)
        return total
    return go(0)


if __name__ == '__main__':
    end = int(sys.argv[1]) if len(sys.argv) > 1 else 6
    for n in range(2,end+1):
        results = 0
        x = tuple(range(2,n+1))
        for E in unit_interval_graphs(n):
            for q in (1,2,5):
                f = sum(forest_diagonal(n,E,k,x,q) for k in range(1,n))
                c = closure_colors(n,E,x,q)
                assert f==c, (n,E,q,f,c)
                results += 1
        print(f'n={n}: {results} exact direct comparisons', flush=True)
