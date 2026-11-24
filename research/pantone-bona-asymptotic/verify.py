#!/usr/bin/env python3
"""Check the canonical decomposition and tableau count on small inputs."""

from collections import defaultdict
from itertools import combinations, permutations, product
from math import comb


def row_extensions(shape):
    for row, size in enumerate(shape):
        if row == 0 or size < shape[row-1]:
            yield shape[:row] + (size+1,) + shape[row+1:]


def step(level):
    nxt = defaultdict(int)
    for shape, paths in level.items():
        for target in row_extensions(shape):
            nxt[target] += paths
    return nxt


def counts(d, limit):
    levels = [{(0,)*d: 1}]
    for _ in range(limit):
        levels.append(step(levels[-1]))
    good = {}
    for s, level in enumerate(levels):
        partial = {shape: paths for shape, paths in level.items() if shape[-1]}
        for i in range(s, limit+1):
            good[i,s] = sum(paths*levels[i][shape] for shape, paths in partial.items())
            partial = step(partial)
    result = []
    for n in range(limit+1):
        ans = sum(paths*paths for paths in levels[n].values())  # empty tail
        for i in range(n):
            ans += sum(comb(n-s-1,i-s)*good[i,s] for s in range(i+1))
        result.append(ans)
    return result


def avoids(word, d):
    for group in combinations(word, d+2):
        front = group[:-1]
        if all(u<v for u,v in zip(front, front[1:])) and group[-1] < front[-1]:
            return False
    return True


def word_waiting_event(word, d):
    target = d
    for a in word:
        if a == target:
            target -= 1
    return target == 0


def has_decreasing(word,d):
    return any(all(a>b for a,b in zip(t,t[1:])) for t in combinations(word,d))


if __name__ == '__main__':
    for d in range(1,5):
        observed = counts(d,7)
        expected = [sum(avoids(w,d) for w in permutations(range(n))) for n in range(8)]
        assert observed == expected, (d,observed,expected)
        for s in range(7):
            for word in product(range(1,d+1),repeat=s):
                assert word_waiting_event(word,d) == has_decreasing(word,d)
        print(f'd={d}: canonical Tableau counts match literal avoiders: {observed}')
