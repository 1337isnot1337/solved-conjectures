#!/usr/bin/env python3
"""Independent point-incidence audit for the Baer projection counts."""
from itertools import combinations
from random import Random

from screen_unital import secant_geometry


def verify(q):
    points, lines, pencils = secant_geometry(q)
    n = len(lines)
    circles = [[] for _ in lines]
    for i, pencil in enumerate(pencils):
        for line in pencil:
            circles[line].append(i)
    join = {pair:i for i, circle in enumerate(circles)
            for pair in combinations(circle,2)}
    assert len(join) == len(points) * (len(points)-1)//2
    adj = [0] * n
    for pencil in pencils:
        mask = sum(1<<x for x in pencil)
        for x in pencil:
            adj[x] |= mask ^ (1<<x)

    def B(x,y):
        return join[tuple(sorted((x,y)))]

    rng = Random(813+q)
    projection_centers = 0
    three_line_triples = 0
    largest_three_line = 0
    for _ in range(100):
        u,v = rng.sample(range(n),2)
        while adj[u] & (1<<v):
            v = rng.randrange(n)
            while v==u:
                v = rng.randrange(n)
        for p1 in circles[u]:
            for q1 in circles[v]:
                core = B(p1,q1)
                total = 0
                for p2 in circles[u]:
                    if p2 == p1:
                        continue
                    count = sum(1 for q2 in circles[v] if q2!=q1
                                and adj[core] & (1<<B(p2,q2)))
                    assert count in (0,1)
                    total += count
                    projection_centers += 1
                assert q-1 <= total <= q
        l1 = rng.randrange(n)
        l2 = rng.choice([i for i in range(n) if adj[l1] & (1<<i)])
        l3 = rng.choice([i for i in range(n) if i not in (l1,l2)
                         and not (adj[l1] | adj[l2]) & (1<<i)])
        count = (adj[l1] & adj[l2] & adj[l3]).bit_count()
        assert count <= 4*q+2
        largest_three_line = max(largest_three_line,count)
        three_line_triples += 1
    print(q, projection_centers, three_line_triples, largest_three_line, flush=True)


if __name__ == "__main__":
    print("q projection centers, 3-line triples, largest common incidence", flush=True)
    for q in (3,5,7):
        verify(q)
