#!/usr/bin/env python3
"""Check the misère quotient operations and separation witnesses."""
from random import Random
from check_oct337 import losing


def clip(w,e):
    return e if e is not None and e>=(-1 if w%2==0 else 0) else None


def profile(heaps):
    weights = [(1 if h<4 else h//2-2, 5 if h%2 else 3)
               for h in heaps if h not in (1,4,5)]
    w = sum(c for c,_ in weights)
    m = max((2*c-w-t for c,t in weights), default=None)
    if weights == [(2,5)]:
        m = -1
    return sum(heaps)%2,w,clip(w,m)


def add(a,b):
    s,w,e = a
    t,v,f = b
    g = max((r for r in (e-v if e is not None else None,
                         f-w if f is not None else None) if r is not None), default=None)
    return (s+t)%2,w+v,clip(w+v,g)


def losing_profile(a):
    s,w,e = a
    return bool(s) if not w else not s and (bool(w%2)==(e is not None))


def context(a,b):
    s,w,e = a
    t,v,f = b
    if s!=t:
        k = max(w,v)+4
        return [1]*s + [2]*(k+(k+w)%2)
    if w%2 != v%2:
        c=max(w,v)+7
        return [1]*s + [2*c+4]
    if w!=v:
        c=max(w,v)+1
        return [1]*s + [2*c+4]
    if e!=f:
        g=max(r for r in (e,f) if r is not None)
        return [1]*s+[2]*max(0,g)
    return None


if __name__ == "__main__":
    rng = Random(928930)
    checked, witnesses = 0, 0
    for _ in range(6000):
        a = rng.choices(range(1,40), k=rng.randrange(12))
        b = rng.choices(range(1,40), k=rng.randrange(12))
        pa,pb=profile(a),profile(b)
        assert profile(a+b) == add(pa,pb)
        if sum(a)<=28:
            assert losing_profile(pa)==losing(tuple(sorted(a)))
        y=context(pa,pb)
        if y is not None:
            py=profile(y)
            assert losing_profile(add(pa,py)) != losing_profile(add(pb,py))
            witnesses+=1
        checked+=1
    print(checked, "product checks;", witnesses, "distinguishing contexts")
