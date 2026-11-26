#!/usr/bin/env python3
"""Exact regression for completely balanced abelian Cayley colorings."""
from itertools import permutations, product
from math import prod
from random import Random


def group(moduli):
    pts = list(product(*(range(m) for m in moduli)))
    at = {x:i for i,x in enumerate(pts)}
    add = [[at[tuple((a+b) % m for a,b,m in zip(x,y,moduli))]
            for y in pts] for x in pts]
    signs = [(i, at[tuple((-a) % m for a,m in zip(x,moduli))])
             for i,x in enumerate(pts) if i]
    return add, [(a,b) for a,b in signs if a < b]


def matchings(items):
    if not items:
        yield []
        return
    for j in range(1, len(items)):
        for tail in matchings(items[1:j]+items[j+1:]):
            yield [items[0]+items[j], *tail]


def verify(add, parts):
    n = len(add)
    assert len(parts) == 6 and all(len(d)==(n-1)//6 for d in parts)
    assert set().union(*(set(d) for d in parts)) == set(range(1,n))
    sums = [set() for _ in range(6)] + [{0}]
    for i in range(5,-1,-1):
        sums[i] = {add[a][b] for a in parts[i] for b in sums[i+1]}
    assert len(sums[0]) == n
    current=0
    one=[]
    for i, part in enumerate(parts):
        a = next(a for a in part if any(add[add[current][a]][b]==0 for b in sums[i+1]))
        one.append(a)
        current=add[current][a]
    assert current==0
    for order in permutations(one):
        walk=[0]
        for a in order:
            walk.append(add[walk[-1]][a])
        if walk[-1] == 0 and len(set(walk[:-1])) == 6:
            return
    raise AssertionError("No simple ordering of the chosen zero sum")


def main():
    for mods in ((25,), (5,5)):
        add,pairs=group(mods)
        cases=0
        for part in matchings(tuple(pairs)):
            verify(add,part)
            cases+=1
        print("Exhaustive group",mods,cases,"partitions")
    rng=Random(870)
    for mods in ((13,), (37,), (49,), (7,7), (61,), (97,), (5,5,13), (5,13)):
        n=prod(mods)
        if n%12 != 1:
            continue
        add,pairs=group(mods)
        t=n//12
        for _ in range(20):
            rng.shuffle(pairs)
            verify(add,[sum(pairs[i*t:(i+1)*t],()) for i in range(6)])
        print("Checked",mods,"20 sampled partitions")


if __name__ == "__main__":
    main()
