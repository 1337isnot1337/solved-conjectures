"""Finite regressions for README.md, not a proof of the general statements."""
from functools import lru_cache
from itertools import combinations, product, permutations
import argparse


def compositions(total, n):
    if n == 1:
        yield (total,)
    else:
        for i in range(total + 1):
            for rest in compositions(total - i, n - 1):
                yield (i,) + rest


def adjacency(n, edges):
    a = [[] for _ in range(n)]
    for i, j in edges:
        a[i].append(j)
        a[j].append(i)
    return tuple(tuple(x) for x in a)


def physical_solver(adj, root=0):
    @lru_cache(None)
    def solves(c):
        if c[root]:
            return True
        for i, m in enumerate(c):
            if m < 2:
                continue
            for j in adj[i]:
                d = list(c)
                d[i] -= 2
                d[j] += 1
                if solves(tuple(d)):
                    return True
        return False
    return solves


def quotient_solver(adj, root=0):
    # State lists numbers of available pairs and odd piles in each fiber.
    @lru_cache(None)
    def solves(state):
        for i, (pairs, odds) in enumerate(state):
            if i == root or not pairs:
                continue
            for j in adj[i]:
                if j == root:
                    return True
                d = list(state)
                d[i] = (pairs - 1, odds)
                p, o = d[j]
                d[j] = (p + 1, o - 1) if o else (p, 1)
                if solves(tuple(d)):
                    return True
        return False
    return solves


def blowup(adj, sizes):
    fibers = []
    k = 0
    for s in sizes:
        fibers.append(tuple(range(k, k + s)))
        k += s
    edges = []
    for i, fiber in enumerate(fibers):
        edges.extend(combinations(fiber, 2))
        for j in adj[i]:
            if i < j:
                edges.extend(product(fiber, fibers[j]))
    return adjacency(k, edges), fibers


def compress(c, fibers):
    return tuple((sum(c[j] // 2 for j in f),
                  sum(c[j] % 2 for j in f)) for f in fibers)


def worst_state(masses, sizes, root=0):
    ret = []
    for i, (m, s) in enumerate(zip(masses, sizes)):
        if i == root:
            ret.append((0, 0))
        else:
            p = max(0, (m - s + 1) // 2)
            ret.append((p, m - 2*p))
    return tuple(ret)


def connected(adj):
    seen = {0}
    stack = [0]
    while stack:
        i = stack.pop()
        for j in adj[i]:
            if j not in seen:
                seen.add(j)
                stack.append(j)
    return len(seen) == len(adj)


def exact_check():
    cases = 0
    graphs = [(2, [(0,1)]), (3, [(0,1),(1,2)]),
              (3, [(0,1),(1,2),(2,0)]),
              (4, [(0,1),(1,2),(2,3),(3,0)]),
              (4, [(0,1),(0,2),(0,3)]),
              (4, [(0,1),(1,2),(2,3)])]
    for n, edges in graphs:
        adj = adjacency(n, edges)
        qs = quotient_solver(adj)
        for sizes in product((1,2), repeat=n):
            physical, fibers = blowup(adj, sizes)
            if len(physical) > 7:
                continue
            ps = physical_solver(physical)
            for t in range(7):
                for c in compositions(t, len(physical)):
                    immediate = bool(c[0]) or any(c[j] >= 2 for j in fibers[0][1:])
                    assert ps(c) == (immediate or qs(compress(c, fibers))), (edges, sizes, c)
                    cases += 1
            ps.cache_clear()
    print("physical vs quotient comparisons:", cases)


def rooted_number(adj, qs):
    n = len(adj)
    sizes = (1,)*n
    t = n
    while True:
        if all(qs(worst_state((0,) + c, sizes))
               for c in compositions(t, n-1)):
            return t
        t += 1


def tree_sizes(adj):
    sizes = [0]*len(adj)
    sizes[0] = 1
    def f(i, parent):
        h = max((1 + f(j, i) for j in adj[i] if j != parent), default=0)
        if i:
            sizes[i] = 2**h
        return h
    f(0, -1)
    return tuple(sizes)


def small_search(nmax=6):
    # Every connected graph labelled by 0,...,n-1, rooted at 0,
    # modulo permutations fixing 0. Check all distributions at the
    # computed rooted number for candidate clique blowups of that order.
    seen = set()
    checked = 0
    for n in range(2, nmax+1):
        E = list(combinations(range(n), 2))
        for mask in range(1 << len(E)):
            edges = [e for k, e in enumerate(E) if (mask >> k) & 1]
            if len(edges) < n-1:
                continue
            adj = adjacency(n, edges)
            if not connected(adj):
                continue
            sig = min(tuple(sorted((min(p[i],p[j]), max(p[i],p[j]))
                                   for i,j in edges))
                      for tail in permutations(range(1,n)) for p in [(0,)+tail])
            if (n, sig) in seen:
                continue
            seen.add((n,sig))
            qs = quotient_solver(adj)
            p = rooted_number(adj, qs)
            if len(edges) == n-1:
                sizes = tree_sizes(adj)
                assert sum(sizes) == p, (edges, sizes, p)
                assert all(qs(worst_state((0,) + m, sizes))
                           for m in compositions(p,n-1)), (edges, sizes, p)
            if p != n:
                masses = list(compositions(p,n-1))
                found = None
                for extra in compositions(p-n,n-1):
                    sizes = (1,) + tuple(x+1 for x in extra)
                    if all(qs(worst_state((0,) + m, sizes)) for m in masses):
                        found = sizes
                        break
                assert found is not None, ("no tight rooted blowup",n,edges,p)
            checked += 1
            qs.cache_clear()
        print("rooted isomorphism classes checked through", n, ":", checked, flush=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--nmax", type=int, default=6)
    args = parser.parse_args()
    assert 2 <= args.nmax <= 6
    exact_check()
    small_search(args.nmax)
