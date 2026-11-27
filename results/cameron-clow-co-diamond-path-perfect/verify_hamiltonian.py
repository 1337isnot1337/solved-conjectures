#!/usr/bin/env python3
"""Independent finite search for and check of critical co-diamond examples."""
from functools import lru_cache
from itertools import combinations, product
from random import Random


def bits(mask):
    while mask:
        low = mask & -mask
        yield low.bit_length()-1
        mask ^= low


def build(s, labels, edges, mask):
    n = s+len(labels)
    g = [0]*n
    for a,b in ((a, j+s) for a in range(s) for j,t in enumerate(labels) if a+1 != t):
        g[a] |= 1<<b
        g[b] |= 1<<a
    for j in bits(mask):
        a,b = edges[j]
        a += s; b += s
        g[a] |= 1<<b
        g[b] |= 1<<a
    return g


def codiamond(g, full):
    for u in range(len(g)):
        for v in bits(g[u] & ((1<<u)-1)):
            common = full & ~(g[u]|g[v])
            for w in bits(common):
                if common & ~(g[w]|(1<<w)):
                    return False
    return True


def can_color(g, live, k):
    color = [0]*k
    def rec(unset, used):
        if not unset:
            return True
        def key(v):
            return sum(bool(g[v]&c) for c in color[:used]), (g[v]&unset).bit_count()
        v = max(bits(unset), key=key)
        rest = unset ^ (1<<v)
        for c in range(min(used+1, k)):
            if not (g[v]&color[c]):
                color[c] ^= 1<<v
                if rec(rest, max(used, c+1)):
                    return True
                color[c] ^= 1<<v
        return False
    return rec(live, 0)


def check(g, s):
    n = len(g)
    full = (1<<n)-1
    if not codiamond(g, full):
        return (0, 0)
    if any(not any((g[v]>>w)&1 for v,w in combinations(S,2))
           for S in combinations(range(n),s+1)):
        return (0, 0)
    k = next(k for k in range(1,n+1) if can_color(g, full, k))
    if any(not can_color(g, full^(1<<v), k-1) for v in range(n)):
        return (1, 0)
    for j in range(s):
        for cut in combinations(range(n),j):
            live = full ^ sum(1<<v for v in cut)
            seen = frontier = live & -live
            while frontier:
                step = 0
                for u in bits(frontier):
                    step |= g[u]
                frontier = step & live & ~seen
                seen |= frontier
            assert seen == live, (s,g,cut)
    @lru_cache(None)
    def cycle(v, rest):
        if not rest:
            return bool(g[v]&1)
        return any(cycle(w, rest^(1<<w)) for w in bits(rest&g[v]))
    assert cycle(0, full^1), (s,g)
    return (1, 1)


def main():
    rng = Random(9217)
    tested = eligible = critical = 0
    def evaluate(s, labels, edges, mask):
        nonlocal tested, eligible, critical
        a,b = check(build(s, labels, edges, mask),s)
        tested += 1; eligible += a; critical += b
    for s in (3,4):
        for r in range(s,6):
            edges = list(combinations(range(r),2))
            for extra in product(range(s+1),repeat=r-s):
                labels = tuple(range(1,s+1)) + extra
                for mask in range(1<<len(edges)):
                    evaluate(s,labels,edges,mask)
    for s in (3,4,5):
        for _ in range(1000):
            r = rng.randint(s+1, min(8,s+4))
            labels = tuple(range(1,s+1)) + tuple(rng.choices(range(s+1),k=r-s))
            edges = list(combinations(range(r),2))
            evaluate(s,labels,edges,rng.getrandbits(len(edges)))
    assert critical>0
    print(f"Checked {tested:,} labeled near joins; {eligible:,} were co-diamond-free with the prescribed maximum independent set; {critical:,} were vertex-critical and passed connectivity and Hamilton-cycle checks.")

if __name__ == "__main__":
    main()
