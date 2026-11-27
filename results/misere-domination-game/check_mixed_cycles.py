#!/usr/bin/env python3
"""Audit mixed-cycle proxy rules and loss of pure quotient congruence."""
from functools import cache
from itertools import combinations_with_replacement

from verify import children as options
from check_quotient import losing_profile, profile


@cache
def previous(heaps, cycles):
    if not (heaps or cycles):
        return False
    if any(previous(a,cycles) for a in options(heaps)):
        return False
    for i, n in enumerate(cycles):
        if i and cycles[i-1] == n:
            continue
        new = tuple(sorted(heaps+((n-3,) if n>3 else ())))
        if previous(new,cycles[:i]+cycles[i+1:]):
            return False
    return True


def proxy(heaps, cycles):
    active = False
    for n in cycles:
        if n in (3,7):
            heaps += (1,)
        elif n in (5,9):
            heaps += (2,2)
        elif n not in (4,8):
            active = True
    p=profile(heaps)
    return (not p[0] and not p[1]%2) if active else losing_profile(p)


if __name__ == "__main__":
    states = 0
    allowed = (3,4,5,6,7,8,9,10,12,14)
    for r in (1,2,3):
        for cycles in combinations_with_replacement(allowed, r):
            for k in (0,1,2,3):
                for heaps in combinations_with_replacement(range(1,15), k):
                    if sum(heaps)+sum(n-3 for n in cycles)>20:
                        continue
                    assert previous(heaps,cycles)==proxy(heaps,cycles), (heaps,cycles)
                    states+=1
    for n,x,y in [(11,(19,),(3,16)),(13,(1,19),(1,3,16))]:
        assert profile(x) == profile(y)
        assert previous(x,(n,)) != previous(y,(n,))
    for c in range(2,11):
        for k in range(8):
            f = k%2==0 and (k<c if c%2==0 else k>=c-1)
            assert previous((2,)*k,(2*c+7,)) == f
            assert previous((1,)+(2,)*k,(2*c+7,)) == (k%2==0 and not f)
    print(f"{states:,} mixed-cycle positions, two quotient distinctions and 144 threshold contexts")
