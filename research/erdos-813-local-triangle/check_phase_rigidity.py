#!/usr/bin/env python3
"""Independent rank audit of the incidence six-cycle constraints."""
from itertools import combinations
from random import Random
from screen_unital import secant_geometry


def rank(vectors):
    leading = {}
    for x in vectors:
        while x:
            k = x.bit_length()
            if k in leading:
                x ^= leading[k]
            else:
                leading[k] = x
                break
    return len(leading)


def audit(q):
    points, lines, pencils = secant_geometry(q)
    pol = [set() for _ in lines]
    for x, ids in enumerate(pencils):
        for line in ids:
            pol[line].add(x)
    join = {tuple(sorted((x, y))): i for i, ps in enumerate(pol)
            for x, y in combinations(ps, 2)}
    indices = range(len(points))
    for x, y in combinations(indices, 2):
        xy = join[x, y]
        l, r = set(pencils[x]) - {xy}, set(pencils[y]) - {xy}
        adj = [frozenset(b for b in r if pol[a] & pol[b]) for a in l]
        assert all(len(s) == q for s in adj)
        for i, s in enumerate(adj):
            assert all(len(s & t) <= 1 for t in adj[:i])
            assert sum(not(s & t) for j, t in enumerate(adj) if i != j) == q-2

    rng = Random(251 + q)
    rows = []
    for p in [1.0, 0.85, 0.7]:
        chosen = {i for i in range(len(lines)) if rng.random() < p}
        parent = list(range(len(points) + len(lines)))

        def root(a):
            while a != parent[a]:
                a = parent[a]
            return a

        k = 0
        flags = {}
        for i, ps in enumerate(pol):
            if i in chosen:
                for x in ps:
                    flags[x, i] = 1 << k
                    parent[root(x)] = root(len(points) + i)
                    k += 1
        used_nodes = list(indices) + [len(points) + i for i in chosen]
        cycle_dim = k - len(used_nodes) + len({root(i) for i in used_nodes})

        def rows6():
            for x, y, z in combinations(indices, 3):
                e, f, g = join[x,y], join[x,z], join[y,z]
                if e != f and e in chosen and f in chosen and g in chosen:
                    yield flags[x,e] ^ flags[y,e] ^ flags[x,f] ^ flags[z,f] ^ flags[y,g] ^ flags[z,g]
        got = rank(rows6())
        assert got <= cycle_dim
        if got != cycle_dim:
            # Verify that the two sufficient local hypotheses do not both hold.
            def link(x, y):
                return join[tuple(sorted((x, y)))] in chosen
            nb = [set(y for y in indices if x != y and link(x, y)) for x in indices]
            universal = all(nb[x] & nb[y] & nb[z] for x,y,z in combinations(indices,3))
            def connected(s):
                if not s:
                    return False
                nxt = [next(iter(s))]
                reached = set(nxt)
                while nxt:
                    for v in (nb[nxt.pop()] & s) - reached:
                        reached.add(v)
                        nxt.append(v)
                return reached == s
            links = universal and all(connected(nb[x] & nb[y]) for x,y in combinations(indices,2)
                                      if y not in nb[x])
            assert not links
        rows.append((len(chosen), got, cycle_dim))
    return len(points), rows


if __name__ == "__main__":
    for q in (3, 5):
        print(q, audit(q))
