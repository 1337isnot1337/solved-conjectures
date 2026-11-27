#!/usr/bin/env python3
"""Verify recurrence closure and the complete bulk rule for 0.3123."""
from functools import cache
from itertools import combinations_with_replacement, product

THRESHOLDS=(19,6)
PERIOD=7
RADIUS=4
P_RESIDUES=({1},{5},{0,1},{3,4},set(),{2,3,6},set())


def children(a,b,x,y):
    heaps=(a,b,x,y)
    for i,n in enumerate(heaps):
        for value in ([0] if n in (1,2,4) else [])+[n-j for j in (1,3,4) if n>j]:
            moved=heaps[:i]+(value,)+heaps[i+1:]
            yield tuple(sorted(moved[:2])+sorted(moved[2:]))


@cache
def direct(a,b,x,y):
    return b+y>0 and not any(direct(*o) for o in children(a,b,x,y))


def norm(value,threshold):
    return value if value<threshold else threshold+(value-threshold)%PERIOD


def predicted(a,b,x,y):
    m=norm(x,THRESHOLDS[0])
    d=norm(y-x,THRESHOLDS[1])
    return direct(a,b,m,m+d)


def bulk(m,d):
    return d>0 and m%7 in P_RESIDUES[d%7]


def main():
    prefixes=list(combinations_with_replacement(range(3),2))
    count=0
    for (a,b),m,d in product(prefixes,*(range(t+RADIUS+PERIOD) for t in THRESHOLDS)):
        h=(a,b,m,m+d)
        assert predicted(*h)==(b+m+d>0 and not any(predicted(*o) for o in children(*h))),h
        count+=1
    assert count==3060
    checks=0
    for m,d in product(range(13,26),range(13)):
        assert predicted(1,2,m,m+d)==bulk(m,d),(m,d)
        checks+=1
    assert checks==169
    assert not bulk(14,11)
    assert bulk(25,10)
    print(f'{count} recurrence representatives and {checks} bulk cases pass.')


if __name__=='__main__':
    main()
