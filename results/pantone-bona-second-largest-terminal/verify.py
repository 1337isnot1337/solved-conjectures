#!/usr/bin/env python3
"""Compare canonical gap enumeration with literal pattern filtering."""

from bisect import bisect_left
from collections import Counter
from itertools import combinations, permutations
from math import comb


def ranks_by_value(word, d):
    rank = [0]*len(word)
    tails = []
    for value in word:
        i = bisect_left(tails, value)
        if i == d:
            return None
        if i == len(tails):
            tails.append(value)
        else:
            tails[i] = value
        rank[value] = i+1
    return rank


def front_statistics(m, d):
    count = 0
    gaps = Counter()
    for w in permutations(range(m)):
        ranks = ranks_by_value(w, d)
        if ranks is None:
            continue
        count += 1
        ends = [i for i,r in enumerate(ranks) if r == d] + [m]
        gaps.update(r-l-1 for l,r in zip(ends, ends[1:]))
    return count, gaps


def canonical_counts(limit, d):
    stats = [front_statistics(m, d) for m in range(limit+1)]
    return [stats[n][0] + sum(
        sum(number*comb(g+n-m, n-m) for g,number in stats[m][1].items())
        for m in range(n)
    ) for n in range(limit+1)]


def literal_count(n, d):
    return sum(
        not any(
            all(t[i]<t[i+1] for i in range(d))
            and not t[d-1]<t[d+1]<t[d]
            for t in combinations(w, d+2)
        )
        for w in permutations(range(n))
    )


if __name__ == '__main__':
    for d in range(2,5):
        result = canonical_counts(8,d)
        assert result == [literal_count(n,d) for n in range(9)], (d,result)
        print(f'd={d}: exact canonical and literal counts match through n=8: {result}')
