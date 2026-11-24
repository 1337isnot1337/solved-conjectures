#!/usr/bin/env python3
"""Finite checks for the decreasing-band and one-entry-tail statements."""

from bisect import bisect_left
from collections import Counter
from itertools import combinations, permutations


def increasing(t):
    return all(a < b for a,b in zip(t,t[1:]))


def ranks(w):
    tails = []
    for v in w:
        i = bisect_left(tails,v)
        if i == len(tails):
            tails.append(v)
        else:
            tails[i] = v
        yield i+1


def check(n):
    counts = Counter()
    for w in permutations(range(1,n+1)):
        if any(increasing(t[:-1]) and not t[0] < t[-1] < t[1]
               for t in combinations(w,5)):
            continue
        j = next((i for i,h in enumerate(ranks(w)) if h == 4),n)
        r = n-j
        counts[r] += 1
        if r < 2:
            continue
        x, *tail = w[j:]
        witnesses = [t for t in combinations([a for a in w[:j] if a<x],3)
                     if increasing(t)]
        assert witnesses
        left,right = max(t[0] for t in witnesses),min(t[1] for t in witnesses)
        assert all(left < t < right for t in tail)
        band = [t for t in w[:j] if left<t<right]
        assert all(a>b for a,b in zip(band,band[1:]))
        assert not any(increasing(t[:3]) and t[-1]>t[0] for t in combinations(tail,4))
    if n:
        exact_one = 0
        for w in permutations(range(1,n)):
            rank = list(ranks(w))
            if max(rank,default=0) > 3:
                continue
            first = min((v for v,h in zip(w,rank) if h==3),default=n)
            exact_one += n-first
        assert counts[1] == exact_one
    return sum(counts.values())


if __name__ == '__main__':
    totals = [check(n) for n in range(9)]
    assert totals[:6] == [1,1,2,6,24,116]
    print('Literal counts and all band/tail implications through length 8:', totals)
