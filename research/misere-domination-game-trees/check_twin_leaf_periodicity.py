#!/usr/bin/env python3
"""Check the twin-leaf cutoff against direct closed-neighborhood minimax."""
from functools import cache
from random import Random


def mex(values):
    a = 0
    while a in values:
        a += 1
    return a


def build(masks, v):
    @cache
    def run(u, k):
        if not u and not k:
            return 0, True
        ans = []
        if k:
            ans.append(run(u & ~(1 << v), k - 1))
        for j, a in enumerate(masks):
            if (u & a) or (j == v and k):
                ans.append(run(u & ~a, 0 if j == v else k))
        return mex({g for g, _ in ans}), any(not w for _, w in ans)
    return run


def direct(masks, v, k):
    n = len(masks)
    leaf_mask = ((1 << k) - 1) << n
    full = list(masks) + [(1 << v) | (1 << (n + j)) for j in range(k)]
    full[v] |= leaf_mask

    @cache
    def minimax(u):
        if not u:
            return 0, True
        ans = [minimax(u & ~a) for a in full if u & a]
        return mex({g for g, _ in ans}), any(not w for _, w in ans)

    return lambda u: minimax(u | leaf_mask)


def test(masks, v, direct_check):
    n = len(masks)
    run = build(masks, v)
    compare = [direct(masks, v, k) for k in range(7)] if direct_check else []
    checked = 0
    last = [0, 0]
    for u in range(1 << n):
        for k, d in enumerate(compare):
            assert run(u, k) == d(u)
        K = 2*u.bit_count() + 1
        for k in range(1, K+7):
            a, b = run(u, k), run(u, k+2)
            for i in (0, 1):
                if a[i] != b[i]:
                    assert k < K
                    last[i] = max(last[i], k)
            checked += 1
    return checked, last


if __name__ == '__main__':
    rng = Random(190291)
    total = 0
    record = [0, 0]
    for n in range(1, 10):
        for _ in range(20):
            masks = [1 << i for i in range(n)]
            for i in range(n):
                for j in range(i):
                    if rng.random() < .22:
                        masks[i] |= 1 << j
                        masks[j] |= 1 << i
            v = rng.randrange(n)
            count, last = test(masks,v,n <= 6)
            total += count
            for i in (0, 1):
                record[i] = max(record[i], last[i])
    print(total, "recurrence comparisons; last witnessed nonperiodic positive k:",record)
