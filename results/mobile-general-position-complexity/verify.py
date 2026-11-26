#!/usr/bin/env python3
"""Independent source recolouring and actual GP token-sliding search.

All true mobile moves are enumerated after quotienting interchangeable universal
vertices. Geodesic tests use host BFS, not the clique-reconfiguration argument.
"""
from collections import deque
from itertools import combinations, product
from random import Random
import sys

START, SIM, BRIDGE, SWEEP, LEFT, RIGHT = range(6)


def source_components(m, edges):
    configurations = {a for a in product(range(4), repeat=m)
                      if all(a[v] != a[w] for v,w in edges)}
    comp = {}
    for a in sorted(configurations):
        if a in comp:
            continue
        comp[a] = a
        q = [a]
        for b in q:
            for i in range(m):
                for c in range(4):
                    z = b[:i] + (c,) + b[i+1:]
                    if z in configurations and z not in comp:
                        comp[z] = a
                        q.append(z)
    return comp


def gadget(m, ed, s, t):
    ed = {tuple(sorted(e)) for e in ed}
    b = 6 + 5*m
    l = b+1
    n = b+l
    edge = [set() for _ in range(n)]
    for x, y in combinations(range(n), 2):
        if y >= b:
            good = True
        elif y < 6:
            good = (x,y) in {(START,LEFT),(SIM,LEFT),(BRIDGE,LEFT),
                             (BRIDGE,RIGHT),(SWEEP,RIGHT)}
        elif x < 6:
            i, a = divmod(y-6, 5)
            good = (x in (LEFT,RIGHT,SWEEP) or
                    x == START and a == s[i] or
                    x == SIM and a < 4 or
                    x == BRIDGE and a in (4,t[i]))
        else:
            i,a = divmod(x-6,5)
            j,c = divmod(y-6,5)
            good = i != j and (a == 4 or c == 4 or a != c or (i,j) not in ed)
        if good:
            edge[x].add(y)
            edge[y].add(x)
    start = (START,LEFT) + tuple(6+5*i+v for i,v in enumerate(s))
    return edge,b,l,start


def distances(edge):
    n = len(edge)
    all_d = []
    for u in range(n):
        d = [-1]*n
        d[u] = 0
        q = [u]
        for v in q:
            for w in edge[v]:
                if d[w] == -1:
                    d[w] = d[v]+1
                    q.append(w)
        all_d.append(d)
    return all_d


def check_host(edge, b, l, r, start):
    d = distances(edge)
    assert max(max(row) for row in d) == 2
    forbidden = [[0]*b for _ in range(b)]
    # Test GP triples using BFS distances. Because the bank vertices are all
    # true twins, using a fixed occupied representative covers every orbit.
    for x,y,z in combinations(range(b+1), 3):
        if (d[x][y]+d[y][z] == d[x][z] or
            d[x][z]+d[z][y] == d[x][y] or
            d[y][x]+d[x][z] == d[y][z]):
            if z == b:
                forbidden[x][y] |= 1 << b
                forbidden[y][x] |= 1 << b
            else:
                forbidden[x][y] |= 1 << z
                forbidden[y][x] |= 1 << z
                forbidden[x][z] |= 1 << y
                forbidden[z][x] |= 1 << y
                forbidden[y][z] |= 1 << x
                forbidden[z][y] |= 1 << x
    assert r > b  # one universal is always present in this test
    low = r-l
    legal = set()

    def enumerate_states(chosen, begin, mask):
        if len(chosen) >= low:
            legal.add(mask)
        for j in range(begin,b):
            if any(forbidden[i][j] & (mask | 1 << b) for i in chosen):
                continue
            enumerate_states(chosen+[j], j+1, mask | 1 << j)

    enumerate_states([],0,0)
    edgemasks = [sum(1 << v for v in edge[i] if v < b) for i in range(b)]
    start = sum(1 << v for v in start)
    last = (1 << b)-1
    comp_best, start_best, tested = False, False, 0
    todo = set(legal)
    while todo:
        a = todo.pop()
        q = [a]
        visited = 0
        has_start = False
        for a in q:
            visited |= a
            has_start |= a == start
            tested += 1
            occupied = a.bit_count()
            vacant = last ^ a
            if r-occupied < l:
                for x in bits(a):
                    push(a ^ (1<<x),todo,q)
            if r-occupied > 0:
                for y in bits(vacant):
                    push(a | (1<<y),todo,q)
            for x in bits(a):
                for y in bits(vacant & edgemasks[x]):
                    push(a ^ (1<<x) ^ (1<<y),todo,q)
        comp_best |= visited == last
        if has_start:
            start_best = visited == last
    return comp_best,start_best,tested


def bits(a):
    while a:
        lsb=a & -a
        yield lsb.bit_length()-1
        a ^= lsb


def push(z,todo,q):
    if z in todo:
        todo.remove(z)
        q.append(z)


def main(extended=False):
    rnd = Random(923)
    instances = positive = negative = tested = 0
    for m in range(1,6 if extended else 5):
        possible = list(combinations(range(m),2))
        graphs = [tuple(e for j,e in enumerate(possible) if mask & (1<<j))
                  for mask in range(1<<len(possible))
                  if extended or m <= 3 or mask%7 == 0 or mask == 63] if m <= 4 else [
                       tuple(e for e in possible if rnd.random() < (j%7)/7)
                       for j in range(25)]
        for ed in graphs:
            comp = source_components(m,ed)
            if not comp:
                continue
            options = sorted(comp)
            pairs = [(rnd.choice(options),rnd.choice(options)) for _ in range(6)]
            pairs += [(options[0],options[0]),(options[0],options[-1])]
            for s,t in sorted(set(pairs)):
                edge,b,l,start = gadget(m,ed,s,t)
                r = l+m+1
                yes = comp[s] == comp[t]
                got, fixed, counts = check_host(edge,b,l,r,start)
                over,over_fixed,more = check_host(edge,b,l,r+1,start)
                assert got == fixed == yes and not over and not over_fixed, (
                    m,ed,s,t,yes,got,fixed,over)
                instances += 1
                positive += yes
                negative += not yes
                tested += counts+more
        print("through",m,"instances",instances,"+/-",positive,negative,
              "configuration orbits",tested,flush=True)
    assert positive and negative


if __name__ == "__main__":
    main("--extended" in sys.argv[1:])
