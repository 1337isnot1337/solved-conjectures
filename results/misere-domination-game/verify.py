#!/usr/bin/env python3
"""Independent minimax checks for the octal formula and the graph outcomes."""
from argparse import ArgumentParser
from functools import cache

from solve import cycle_first_wins, heap_previous_wins, path_first_wins


def children(piles):
    for i, h in enumerate(piles):
        if i and piles[i-1] == h:
            continue
        others = piles[:i] + piles[i+1:]
        for d in range(1, 4):
            if h < d:
                continue
            left = h-d
            for first in range(1+left//2 if d == 3 else 1):
                yield tuple(sorted(others + tuple(x for x in (first, left-first) if x)))


@cache
def exact_previous_wins(piles):
    return bool(piles) and all(not exact_previous_wins(child) for child in children(piles))


def partitions(total, minimum=1):
    if not total:
        yield ()
    for largest_allowed_first in range(minimum, total+1):
        for tail in partitions(total-largest_allowed_first, largest_allowed_first):
            yield (largest_allowed_first,) + tail


def graph_exact(n, cycle):
    masks = []
    for v in range(n):
        adj = {v}
        if cycle or v:
            adj.add((v-1) % n)
        if cycle or v < n-1:
            adj.add((v+1) % n)
        masks.append(sum(1<<u for u in adj))

    @cache
    def winner(u):
        return not u or any(not winner(u & ~m) for m in masks if u & m)

    return winner((1<<n)-1)


def main():
    ap = ArgumentParser()
    ap.add_argument("--limit", type=int, default=29)
    args = ap.parse_args()
    checked = 0
    for total in range(args.limit+1):
        for heaps in partitions(total):
            assert exact_previous_wins(heaps) == heap_previous_wins(heaps), heaps
            checked += 1
    for n in range(1, 26):
        assert graph_exact(n, False) == path_first_wins(n), ("path",n)
        if n >= 3:
            assert graph_exact(n, True) == cycle_first_wins(n), ("cycle",n)
    comparison = [(27,4,2,2,2,2,2,2,1),(25,2,2,2,2,2,2,2,1)]
    assert [exact_previous_wins(tuple(sorted(x))) for x in comparison] == [True,False]

    # Use the unbounded formula to test the constructive parameter-family witnesses.
    for period in range(1, 151):
        k = 2*period+31
        r = period//2
        c = k+3 if period % 4 != 2 else k+2*r+7
        h = 2*c+4
        assert heap_previous_wins([h]+[2]*k)
        assert not heap_previous_wins([h-period]+[2]*k)
        h = 2*(k+3)+4
        assert heap_previous_wins([h]+[2]*k)
        assert not heap_previous_wins([h-1,1]+[2]*(k-1))
        h = 2*(k+5)+5
        assert heap_previous_wins([h,4,1]+[2]*k)
        assert not heap_previous_wins([h-2,2,1]+[2]*k)
    print(f"{checked:,} exact octal partitions, 48 direct graph positions, and 450 period witness checks")


if __name__ == "__main__":
    main()
