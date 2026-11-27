#!/usr/bin/env python3
from functools import cache
from itertools import product

CODES = {
    "3102": ((1, 2), (1, 4), (3, 12, 3), (5, 20, 5)),
    "3122": ((1, 2), (1, 3, 4), (16, 10, 6), (7, 7, 7)),
    "3123": ((1, 2, 4), (1, 3, 4), (20, 18, 12), (7, 7, 7)),
    "3312": ((1, 2, 3), (1, 2, 4), (19, 15, 8), (6, 3, 3)),
}

def check(name, params):
    remove, subtract, bounds, periods = params

    def opts(v):
        for i, x in enumerate(v):
            if x in remove:
                yield tuple(sorted(v[:i] + (0,) + v[i+1:]))
            for k in subtract:
                if x > k:
                    yield tuple(sorted(v[:i] + (x-k,) + v[i+1:]))

    def heaps(a, d, g):
        return a, a+d, a+d+g

    def norm(v):
        a, b, c = v
        gap = (a,b-a,c-b)
        return heaps(*(x if x < t else t+(x-t)%q for x,t,q in zip(gap,bounds,periods)))

    @cache
    def raw(v):
        return any(v) and not any(raw(child) for child in opts(v))

    def formula(v):
        return raw(norm(v))

    counts = 0
    for gap in product(*(range(t+q+4) for t,q in zip(bounds,periods))):
        v = heaps(*gap)
        rhs = any(v) and not any(formula(child) for child in opts(v))
        if rhs != formula(v):
            raise SystemExit(f"{name}: recurrence fails at {v} with gaps {gap}")
        counts += 1
    print(name,counts,"exact representatives",raw.cache_info().currsize,"raw states")

    T, B, G = bounds
    A, P, Q = periods
    frows = {}
    for a in range(T+A):
        # This tests whether moving both large heaps by a common shift is valid
        # in every stable residue of the two variable coordinates.
        least = next(p for p in range(1,P+1)
            if all(formula(heaps(a,d,g)) == formula(heaps(a,d+p,g))
                   for d in range(B,B+P) for g in range(G+Q)))
        frows.setdefault(least,[]).append(a)
    print(name, "three-heap bulk slice classes", frows)
    return frows


if __name__ == "__main__":
    for name, params in CODES.items():
        check(name, params)
