#!/usr/bin/env python3
"""Exact finite regression tests for the two sides of the threshold."""
from itertools import combinations
from math import comb
from random import Random


def choose_mask(sets):
    result = 0
    for i in sets:
        result |= 1 << i
    return result


def dominates(mask, closed, target=None):
    if target is None:
        target = (1 << len(closed)) - 1
    hit = 0
    while mask:
        bit = mask & -mask
        hit |= closed[bit.bit_length() - 1]
        mask ^= bit
    return hit & target == target


def optimum(closed):
    for size in range(len(closed) + 1):
        for cand in combinations(range(len(closed)), size):
            if dominates(choose_mask(cand), closed):
                return cand
    raise AssertionError("All vertices always dominate")


def path_closed(n):
    return [choose_mask(range(max(0, i-1), min(n, i+2)))
            for i in range(n)]


def test_interfaces():
    count = 0
    for k in range(2, 8):
        n = 3*k - 2
        ports = choose_mask(range(0, n, 3))
        whole = (1 << n)-1
        nonports = whole ^ ports
        closed = path_closed(n)
        assert dominates(ports, closed)
        for c in range(k):
            for pts in combinations(range(n), c):
                count += 1
                m = choose_mask(pts)
                if dominates(m, closed, nonports):
                    assert c == k-1 and not (m & ports)
                    assert not dominates(m, closed)
        for p in range(0, n, 3):
            m = choose_mask(list(range(1, p, 3)) + list(range(p+2, n, 3)))
            assert m.bit_count() == k-1 and not (m & ports)
            assert dominates(m, closed, whole ^ (1 << p))
    return count


def test_lifts():
    lifts = 0
    for n in range(1, 5):
        for g in range(1 << comb(n, 2)):
            G = [{i} for i in range(n)]
            H = [path_closed(4)[i%4] << (4*(i//4)) for i in range(4*n)]
            ports = [0]*n
            edges = {}
            for v in range(1, n):
                for u in range(v):
                    if g & (1 << (comb(v, 2)+u)):
                        a, b = 4*u+3*(ports[u]//2), 4*v+3*(ports[v]//2)
                        ports[u] += 1
                        ports[v] += 1
                        H[a] |= 1 << b
                        H[b] |= 1 << a
                        G[u].add(v)
                        G[v].add(u)
                        edges[u, v] = a, b
                        edges[v, u] = b, a
            assert all(x.bit_count() <= 4 for x in H)
            C = list(map(choose_mask, G))
            gamma = len(optimum(C))
            O = set(optimum(H))
            assert len(O) == n + gamma
            P = {v for v in range(n) if sum((4*v+j) in O for j in range(4)) >= 2}
            assert dominates(choose_mask(P), C) and len(P) == gamma
            S = set(optimum(C))
            T = set()
            for v in range(n):
                if v in S:
                    T.update((4*v, 4*v+3))
                else:
                    u = min(S & G[v])
                    port, _ = edges[v, u]
                    T.add(4*v+(2 if port % 4 == 0 else 1))
            assert len(T) == len(O) and dominates(choose_mask(T), H)
            lifts += 1
    return lifts


def order_region(G, vertices):
    endpoints = [i for i in vertices if len(G[i] & vertices) <= 1]
    p = min(endpoints or vertices)
    seq = [p]
    remaining = vertices - {p}
    while remaining:
        nex = min(G[seq[-1]] & remaining)
        seq.append(nex)
        remaining.remove(nex)
    return seq


def block_solution(G, block):
    labels = sorted(block)
    closed = [choose_mask(j for j, v in enumerate(labels)
               if v == u or v in G[u]) for u in labels]
    return {labels[i] for i in optimum(closed)}


def verify_stream(rows, L, test_optimum=True):
    G = []
    owner = {}
    selected = set()
    blocks = {}
    result = {}
    for v, neighs in enumerate(rows):
        G.append(set(neighs))
        for u in neighs:
            G[u].add(v)
        assert all(len(adj) <= 2 for adj in G)
        ids = {owner[u] for u in neighs}
        area = {v}
        old = set(selected)
        for i in ids:
            area |= blocks.pop(i)
            selected -= result.pop(i)
        seq = order_region(G, area)
        if len(seq) < L:
            segments = [seq]
        else:
            q, a = divmod(len(seq), L)
            segments = [seq[:L+a]]
            segments.extend(seq[L+a+j*L:L+a+(j+1)*L] for j in range(q-1))
        for seg in segments:
            S = set(seg)
            id_ = min(S)
            blocks[id_] = S
            result[id_] = block_solution(G, S)
            selected |= result[id_]
            for u in S:
                owner[u] = id_
        assert len(old ^ selected) <= 4*L+1
        assert all(u in selected or G[u] & selected for u in range(v+1))
        assert (set().union(*blocks.values()) == set(range(v+1)) and
                sum(map(len, blocks.values())) == v+1)
        assert all(len(B) <= 2*L for B in blocks.values())
        assert all(len(B) >= L or all(G[u] <= B for u in B)
                   for B in blocks.values())
        cuts = sum(owner[u] != owner[w] for u, adj in enumerate(G)
                   for w in adj if u < w)
        assert cuts*L <= v+1
        if test_optimum:
            gamma = len(optimum([choose_mask(adj | {u})
                                  for u, adj in enumerate(G)]))
            assert len(selected) <= gamma + cuts


def test_block_streams():
    count = 0
    for n in range(1, 7):
        for g in range(1 << comb(n, 2)):
            rows = [set() for _ in range(n)]
            degrees = [0]*n
            for v in range(1, n):
                for u in range(v):
                    if g & (1 << (comb(v, 2)+u)):
                        rows[v].add(u)
                        degrees[u] += 1
                        degrees[v] += 1
            if max(degrees) <= 2:
                for L in (1, 2, 3, 5):
                    verify_stream(rows, L)
                count += 1
    rng = Random(996)
    for _ in range(100):
        n = 48
        order = rng.sample(range(n), n)
        edges = [(order[i-1], order[i]) for i in range(n)]
        rows = [set() for _ in range(n)]
        for a, b in edges:
            rows[max(a, b)].add(min(a, b))
        for L in (2, 3, 5):
            verify_stream(rows, L, test_optimum=False)
    return count


if __name__ == "__main__":
    print(f"Path interfaces: {test_interfaces():,} selections; "
          f"global lifts: {test_lifts()} exact optima", flush=True)
    print(f"Degree-two blocks: {test_block_streams():,} ordered graphs, all prefixes, "
          "100 larger cycle streams")
