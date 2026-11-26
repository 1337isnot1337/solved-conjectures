#!/usr/bin/env python3
"""Check marker sets against actual arc BFS, not the buffer argument."""
from collections import deque
from itertools import permutations
from math import prod
import sys


def falling(n, k):
    return prod(range(n-k+1, n+1))


def bfs(n, root):
    dist = {root: 0}
    work = deque([root])
    while work:
        u = work.popleft()
        nxt = u[1:]
        d = dist[u] + 1
        for a in range(n):
            if a not in u:
                v = nxt + (a,)
                if v not in dist:
                    dist[v] = d
                    work.append(v)
    return dist


def run(n, k, h):
    root = tuple(range(h, h+k-1)) + (0,)
    dist = bfs(n, root)
    assert len(dist) == falling(n, k)
    lo, hi = k, 2*k-1
    selected = [prefix + (last,)
                for prefix in permutations(range(h, n), k-1)
                for last in range(h)]
    assert len(selected) == h * falling(n-h, k-1)
    # Automorphisms permuting the alphabet within each of the two palettes
    # act transitively on selected vertices, so one row tests all ordered pairs.
    assert all(lo <= dist[v] <= hi for v in selected if v != root)
    if h == 3:
        assert len(selected) - 2*falling(n-2, k-1) == (n-3*k+1)*falling(n-3, k-2) > 0
    return len(dist), len(selected)-1


def main(extended=False):
    orders = [(9, 3), (10, 3), (12, 4)]
    if extended:
        orders.extend([(11, 3), (16, 4), (15, 5)])
    checks = seen = selected = 0
    for n, k in orders:
        optimum = (n-k+1+k-1)//k
        for h in sorted({2, 3, optimum}):
            a, b = run(n, k, h)
            seen += a
            selected += b
            checks += 1
        root = tuple(range(k))
        d = bfs(n, root)
        assert d[tuple(reversed(root))] == 2*k
        seen += len(d)
        print(n, k, "passed", flush=True)
    print("palette checks:", checks, "BFS vertices:", seen,
          "ordered distance checks:", selected)


if __name__ == "__main__":
    main("--extended" in sys.argv[1:])
