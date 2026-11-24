#!/usr/bin/env python3
"""Exact sanity checks of the two insertion trees and the common formal series."""
import argparse
from collections import Counter
from itertools import combinations


def pattern(word):
    return tuple(1 + sum(x < value for x in word) for value in word)


BASIS = ((2, 1, 3, 4), (4, 2, 1, 5, 3), (2, 4, 1, 5, 3))
OTHER = ((2, 1, 4, 3), (4, 2, 1, 3, 5), (2, 4, 1, 3, 5))


def legal_by_basis(word, basis):
    """Literal occurrences using the inserted maximum, not the proof's rule."""
    n = len(word)
    gaps = set(range(n + 1))
    for pat in basis:
        p = pat.index(len(pat))
        shorter = pat[:p] + pat[p + 1 :]
        for selected in combinations(range(n), len(pat) - 1):
            if pattern(tuple(word[i] for i in selected)) == shorter:
                lo = 0 if p == 0 else selected[p - 1] + 1
                hi = n if p == len(shorter) else selected[p]
                gaps.difference_update(range(lo, hi + 1))
    return tuple(sorted(gaps))


def label(word, gaps, y):
    n = len(word)
    d = next((i + 1 for i in range(1, n) if word[i - 1] > word[i]), n + 1)
    if y:
        if gaps == tuple(range(len(gaps))):
            return ('A', d - 1, len(gaps) - 1)
        assert gaps[:d] == tuple(range(d)) and len(gaps) > d and gaps[d] > d
        assert gaps[d:] == tuple(range(gaps[d], gaps[d] + len(gaps) - d))
        return ('B', d - 1, len(gaps) - 1)
    assert gaps == tuple(range(len(gaps)))
    b = min((j + 1 for i, j, k in combinations(range(n), 3)
             if word[j] < word[i] < word[k]), default=n + 1)
    k = len(gaps)
    if b == k:
        return ('A', d - 1, k - 1)
    assert d == b and b < k
    return ('B', d - 1, k - 1)


def children(state):
    tag, a, m = state
    top = m + 1 if tag == 'A' else a + 1
    return [('A', h, top) for h in range(1, a + 2)] + [
        ('B', a, mp) for mp in range(a + 1, m + 1)]


def brute(upto, y):
    basis = OTHER if y else BASIS
    frontier = [((), ('A', 0, 0))]
    totals = [1]
    for n in range(upto):
        follow = []
        for word, old_state in frontier:
            gaps = legal_by_basis(word, basis)
            observed = []
            for g in gaps:
                child = word[:g] + (n + 1,) + word[g:]
                child_state = label(child, legal_by_basis(child, basis), y)
                follow.append((child, child_state))
                observed.append(child_state)
            assert Counter(observed) == Counter(children(old_state)), (word, old_state)
        frontier = follow
        totals.append(len(frontier))
    return totals


def tree(upto):
    counts = Counter({('A', 0, 0): 1})
    output = [1]
    for _ in range(upto):
        following = Counter()
        for state, count in counts.items():
            for child in children(state):
                following[child] += count
        counts = following
        output.append(sum(counts.values()))
    return output


def cubic(upto):
    p = [0] * (upto + 1)
    # p = x + x*p + (1-x)*(p**2+p**3)
    for i in range(1, upto + 1):
        def sq(j):
            return sum(p[a] * p[j-a] for a in range(1, j))
        def cube(j):
            return sum(p[a] * sq(j-a) for a in range(1, j - 1))
        p[i] = (i == 1) + p[i-1] + sq(i) + cube(i) - sq(i-1) - cube(i-1)
    return [1] + p[1:]


if __name__ == '__main__':
    arg = argparse.ArgumentParser()
    arg.add_argument('--brute', type=int, default=8)
    arg.add_argument('--series', type=int, default=40)
    options = arg.parse_args()
    through = max(options.brute, options.series)
    count = tree(through)
    assert count == cubic(through)
    assert count[:options.brute+1] == brute(options.brute, False)
    assert count[:options.brute+1] == brute(options.brute, True)
    print('Literal basis and child checks for both classes through n=%d.' % options.brute)
    print('Tree and cubic coefficient checks through n=%d.' % through)
    print(count[:min(12, through+1)])
