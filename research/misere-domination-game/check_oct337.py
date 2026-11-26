#!/usr/bin/env python3
"""Exact misere outcomes of the published-parameter mismatch in octal .337."""
from functools import cache


def options(state):
    for i, h in enumerate(state):
        if i and state[i-1] == h:
            continue
        rest = state[:i] + state[i+1:]
        for d in (1, 2):
            if h >= d:
                yield tuple(sorted(rest + ((h-d,) if h > d else ())))
        if h >= 3:
            for j in range((h-3)//2 + 1):
                pieces = tuple(k for k in (j, h-3-j) if k)
                yield tuple(sorted(rest + pieces))


@cache
def losing(state):
    # Under misere convention an empty position is won by the player to move.
    return bool(state) and all(not losing(child) for child in options(state))


if __name__ == "__main__":
    a = tuple(sorted((27, 4, 2, 2, 2, 2, 2, 2, 1)))
    b = tuple(sorted((25, 2, 2, 2, 2, 2, 2, 2, 1)))
    assert losing(a) and not losing(b)
    print("P:", tuple(reversed(a)))
    print("N:", tuple(reversed(b)))
    witnesses = [x for x in options(b) if losing(x)]
    print("Winning move from N to:", tuple(reversed(witnesses[0])))
    print(losing.cache_info())
