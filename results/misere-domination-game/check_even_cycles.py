#!/usr/bin/env python3
"""Audit the even-cycle-plus-heap formula against direct game recursion."""
from functools import cache
from itertools import product
from random import Random


def options(heaps, cycles):
    for i, h in enumerate(heaps):
        if i and h == heaps[i-1]:
            continue
        for d in (1, 2, 3):
            if d > h:
                continue
            z = h-d
            for x in range(1+z//2 if d==3 else 1):
                new = heaps[:i]+heaps[i+1:]+tuple(j for j in (x,z-x) if j)
                yield tuple(sorted(new)),cycles
    for i, c in enumerate(cycles):
        if i and c == cycles[i-1]:
            continue
        yield tuple(sorted(heaps+(c-3,))),cycles[:i]+cycles[i+1:]


@cache
def exact_p(heaps, cycles):
    return bool(heaps or cycles) and all(not exact_p(*x) for x in options(heaps,cycles))


def prediction(h,c):
    if any(x not in (4,8) for x in c):
        weight = sum((1 if k<=3 else k//2-2) for k in h if k not in (1,4,5))
        return sum(h)%2==0 and weight%2==0
    return exact_p(h,())


if __name__ == "__main__":
    rng = Random(930)
    cycles = [(4,), (6,), (8,), (10,), (12,), (4,8), (4,6), (6,6), (6,10),
              (6,8,10), (4,8,12), (6,10,14)]
    heaps = [()]+[tuple(sorted(a)) for n in range(1,4)
                  for a in product(range(1,7),repeat=n)]
    pairs = set(product(heaps,cycles))
    for _ in range(350):
        h = tuple(sorted(rng.choices(range(1,17),k=rng.randrange(6))))
        c = tuple(sorted(rng.choices(range(4,21,2),k=rng.randint(1,3))))
        pairs.add((h,c))
    pairs = {(h,c) for h,c in pairs if sum(h)+sum(x-3 for x in c)<=27}
    for h,c in pairs:
        assert exact_p(h,c)==prediction(h,c), (h,c)
    print(f"{len(pairs):,} even-cycle and heap configurations agree")
