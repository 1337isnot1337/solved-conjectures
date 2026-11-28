#!/usr/bin/env python3
"""Check bridge return maps and the explicit regular family."""
from itertools import combinations


def pairings(indices):
    if not indices:
        yield []
        return
    a, *rest = indices
    for b in rest:
        for other in pairings([j for j in rest if j != b]):
            yield [(a, b)] + other


def cycles(p):
    seen = set()
    count = 0
    for i in range(len(p)):
        if i not in seen:
            count += 1
            while i not in seen:
                seen.add(i)
                i = p[i]
    return count


def binary_rank(rows):
    pivots = {}
    for n in rows:
        while n:
            bit = n.bit_length()
            if bit not in pivots:
                pivots[bit] = n
                break
            n ^= pivots[bit]
    return len(pivots)


def check_words():
    count = 0
    for r in range(1, 7):
        for pairs in pairings(list(range(2*r))):
            swap = list(range(2*r))
            rows = [0]*r
            for i, (a, b) in enumerate(pairs):
                swap[a], swap[b] = b, a
                for j, (c, d) in enumerate(pairs):
                    if (a < c < b) != (a < d < b):
                        rows[i] |= 1 << j
            assert cycles([swap[(i+1) % (2*r)] for i in range(2*r)]) == (
                1 + r - binary_rank(rows))
            count += 1
    return count


def edge(a, b):
    return tuple(sorted((a, b)))


def connected_2factor(edges, n):
    adj = [[] for _ in range(n)]
    for a, b in edges:
        adj[a].append(b)
        adj[b].append(a)
    assert all(len(nbrs) == 2 for nbrs in adj)
    seen = set()
    components = 0
    for v in range(n):
        if v in seen:
            continue
        stack = [v]
        components += 1
        while stack:
            w = stack.pop()
            if w not in seen:
                seen.add(w)
                stack.extend(adj[w])
    return components


def regular_example(h):
    m = 2*h
    n = 2*m*h
    remaining = [v for v in range(h) for _ in (0, 1)]
    assign = {0: 0, 2: 1, 1: 2, 1+h: 3}
    for v in assign.values():
        remaining.remove(v)
    for c in range(m):
        if c not in assign:
            assign[c] = remaining.pop()

    def v(x, i):
        return x*h + i

    def shift(x, c):
        return m + ((x+c) % m)

    def ext(x, c):
        i = assign[c]
        return edge(v(x, i), v(shift(x,c), i))

    base = {edge(v(x, i), v(x, (i+1) % h))
            for x in range(2*m) for i in range(h)}
    host = base | {ext(x, c) for x in range(m) for c in range(m)}
    degrees = [sum(a//h % 2 == i and b//h % 2 == i for a,b in host)
               for i in (0,1)]
    assert degrees == [3*h*h, 3*h*h]
    assert len(host) == 2*n

    initial = base - {edge(v(x, 0), v(x, 1)) for x in range(2*m)}
    initial |= {ext(x, c) for x in range(m) for c in (0,2)}
    assert connected_2factor(initial, n) == 2
    S = [0,h,1+m,1+h+m]
    final = initial - {edge(v(x, 2), v(x, 3)) for x in S}
    final |= {ext(x, c) for x in (0,h) for c in (1,1+h)}
    assert final <= host
    assert connected_2factor(final, n) == 1
    assert len(host - final) == n
    return n


def main():
    print(f"Checked {check_words():,} bridge words against binary-rank counts")
    total = sum(regular_example(h) for h in range(4, 30, 2))
    print(f"Checked {total:,} vertices across explicit full-density lifts")


if __name__ == "__main__":
    main()
