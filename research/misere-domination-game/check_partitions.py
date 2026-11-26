#!/usr/bin/env python3
"""Audit the three-part recurrence directly against graph closed-neighborhood play."""
from functools import cache
from random import Random


def win(ch):
    return not ch or not all(ch)


def nextparts(path, cycle, run):
    for t, parts in enumerate((path, cycle, run)):
        for i, h in enumerate(parts):
            if i and parts[i-1] == h:
                continue
            opts = []
            if t == 0:
                opts.append((max(0,h-2),))
            elif t == 1:
                opts.append((h-3,))
            else:
                opts.extend((h-d,) for d in (1,2) if h>=d)
            if t != 1 and h >= 3:
                opts.extend((i,h-3-i) for i in range((h-3)//2+1))
            left = [path,cycle,run]
            left[t] = parts[:i]+parts[i+1:]
            for opt in opts:
                yield left[0],left[1],tuple(sorted(left[2]+tuple(x for x in opt if x)))


@cache
def encoded(path, cycle, run):
    return win([encoded(*child) for child in nextparts(path,cycle,run)])


def direct(path, cycle):
    nbr = []
    off = 0
    for iscycle, lengths in ((False,path),(True,cycle)):
        for n in lengths:
            for i in range(n):
                local = {i}
                if i or iscycle:
                    local.add((i-1)%n)
                if i+1 < n or iscycle:
                    local.add((i+1)%n)
                nbr.append(sum(1<<(off+j) for j in local))
            off += n

    @cache
    def f(mask):
        return win([f(mask&~s) for s in nbr if s&mask])
    return f((1<<off)-1)


if __name__ == "__main__":
    rng = Random(928)
    tests = set()
    for n in range(1,18):
        tests.add(((n,),()))
        if n>=3:
            tests.add(((),(n,)))
    for _ in range(350):
        rem = rng.randrange(1,18)
        path,cycle = [],[]
        while rem:
            n=rng.randrange(1,rem+1)
            (cycle if n>=3 and rng.randrange(2) else path).append(n)
            rem -= n
        tests.add((tuple(sorted(path)),tuple(sorted(cycle))))
    for p,c in tests:
        assert encoded(p,c,()) == direct(p,c), (p,c)
    print(len(tests),"untouched graph positions agree in independent engines")
