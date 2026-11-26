#!/usr/bin/env python3
"""Check the odd-graph families and the second bisector reduction."""
from itertools import combinations


def ksets(n, k):
    for seq in combinations(range(n), k):
        yield sum(1 << i for i in seq)


def og(s, x, y):
    j = (x & y).bit_count()
    return min(2 * (s - j), 2 * j + 1)


def strict_triangle(a, b, c):
    return a + b + c > 2 * max(a, b, c)


def check_even(s):
    b = (2*s) & (-2*s)
    m = 2*s // b
    blocks = [((1 << m) - 1) << (m*i) for i in range(b)]
    pairs = [
        tuple(sum(blocks[u] for u in range(b) if ((a & u).bit_count() % 2) == t)
              for t in range(2))
        for a in range(1, b)
    ]
    chosen = set(x for pair in pairs for x in pair)
    assert len(chosen) == 2 * (b-1)
    assert all(strict_triangle(og(s, x, y), og(s, y, z), og(s, x, z))
               for x,y,z in combinations(chosen, 3))
    count = 0
    for x in ksets(2*s+1, s):
        count += 1
        if x not in chosen:
            assert any(abs(og(s, x, a) - og(s, x, b)) == 1 for a,b in pairs)
    return count, len(chosen)


def check_cusp(r):
    all_rs = tuple(ksets(2*r+1, r))
    c = (1 << (r-1)) - 1
    y1, y2 = (1 << r) - 1, ((1 << r) - 1) << r
    seeds = [(c | (1 << a), y) for a in range(r-1, 2*r+1) for y in (y1,y2)]
    def john(x, y):
        return r - (x & y).bit_count()
    def rho(x, y):
        d = john(x[0], y[0]) + john(x[1], y[1])
        return min(2*d, 4*r+3-2*d)
    dist = {(i,j):rho(x,y) for i,x in enumerate(seeds) for j,y in enumerate(seeds) if i<j}
    assert all(strict_triangle(dist[i,j],dist[j,k],dist[i,k])
               for i,j,k in combinations(range(len(seeds)), 3))
    leftover = 0
    for x in ((u,v) for u in all_rs for v in all_rs):
        if x in seeds:
            continue
        dx = [rho(x, y) for y in seeds]
        terminal = any(abs(dx[i]-dx[j]) == dij for (i,j),dij in dist.items())
        is_cusp = john(x[1],y1) == john(x[1],y2) == (x[0] & c).bit_count() + 1
        assert terminal != is_cusp
        if is_cusp:
            assert set(dx) <= {2*r, 2*r+1}
            leftover += 1
    return len(all_rs)**2, leftover


if __name__ == "__main__":
    for s in (2,4,6,8,10):
        print("even parameter", s, "order and terminal size:", check_even(s))
    for r in (1,2,3,4):
        print("bisector r =", r, "size and cusp residual:", check_cusp(r))
