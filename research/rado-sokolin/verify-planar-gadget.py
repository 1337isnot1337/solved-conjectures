#!/usr/bin/env python3
"""Exact independent-set audit of the 52-tile gadget in Dall'Ara-Dumitrescu Fig. 5.

Coordinates transcribed from 52.pdf in arXiv:2604.17509v3 source release.
Uses only Python standard library; no optimizer or floating point evaluation.
"""
from functools import lru_cache

S = (
    [(x, 0, 1) for x in range(14)]
    + [(x, y, 1) for x in (0, 3, 4, 9, 10, 13) for y in (1, 2)]
    + [(x, 3, 1) for x in (0, 1, 2, 11, 12, 13)]
    + [(x, 4, 1) for x in (2, 11)]
    + [(x, 5, 1) for x in range(2, 12)]
    + [(x, 1, 2) for x in (1, 5, 7, 11)]
    + [(x, 3, 2) for x in (3, 5, 7, 9)]
)
assert len(S) == 52
area = sum(s**2 for x, y, s in S)
cells = {(i, j) for x, y, s in S for i in range(x, x+s)
         for j in range(y, y+s)}
assert area == len(cells) == 76   # interiors of tiles do not overlap.

def intersect(a, b):
    x, y, s = a
    u, v, t = b
    return x <= u+t and u <= x+s and y <= v+t and v <= y+s

N = tuple(sum(1 << j for j, b in enumerate(S) if intersect(a, b)) for a in S)
W = tuple(s**2 for x,y,s in S)

def bits(mask):
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit

@lru_cache(None)
def optimum(mask):
    if not mask: return 0
    i = max(bits(mask), key=lambda j: ((mask & N[j]).bit_count(), W[j]))
    return max(optimum(mask ^ (1<<i)), W[i] + optimum(mask & ~N[i]))

all_tiles = (1<<len(S)) - 1
no_bottom = sum(1 << i for i, (x,y,s) in enumerate(S) if y!=0)
print('width=14 height=6 squares=52 union=76')
print('max disjoint area:', optimum(all_tiles))
print('max without bottom:', optimum(no_bottom))
print('recursive states:', optimum.cache_info().currsize)
assert optimum(all_tiles) == 19
assert optimum(no_bottom) == 18
