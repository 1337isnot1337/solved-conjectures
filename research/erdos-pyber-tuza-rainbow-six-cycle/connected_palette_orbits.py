#!/usr/bin/env python3
"""All global complement-free palette families with connected links and no common hue."""
from itertools import combinations, permutations

N = 6
F = (1 << N) - 1
palettes = sorted(sum(1 << i for i in t) for t in combinations(range(N),3))
perms = []
for p in permutations(range(N)):
    perms.append({t: sum(1 << p[i] for i in range(N) if t & (1 << i))
                  for t in palettes})


def good(family):
    if any(F ^ t in family for t in family):
        return False
    for i in range(N):
        bit = 1 << i
        if all(t & bit for t in family):
            return False
        edges = [t ^ bit for t in family if t & bit]
        pool = F ^ bit
        reached = pool & -pool
        for _ in range(N-2):
            for e in edges:
                if e & reached:
                    reached |= e
        if reached != pool:
            return False
    return True


def fmt(family):
    return " ".join("".join(str(i) for i in range(N) if t & (1<<i))
                    for t in sorted(family))


def main():
    for size in (8, 9, 10):
        remaining={frozenset(f) for f in combinations(palettes,size) if good(set(f))}
        print(f"{size} palettes: {len(remaining)} labelled families")
        while remaining:
            f=min(remaining,key=lambda t:sorted(t))
            orbit={frozenset(p[t] for t in f) for p in perms}
            assert orbit <= remaining
            remaining-=orbit
            print(len(orbit),fmt(f))

if __name__ == "__main__":
    main()
