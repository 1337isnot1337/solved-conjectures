"""Enumerate perfect permutations first and check every three-edge submatching."""
from collections import Counter, defaultdict
from itertools import combinations, permutations


def family_rows(k, t):
    labels = [('H', i) for i in range(k)] + [('L', j) for j in range(t)]
    def edge(a, b):
        return a[0] != b[0] or (a == b and (a[0] == 'L' or a[1] < 2*k-t))
    return tuple(sum(1 << j for j,b in enumerate(labels) if edge(a,b)) for a in labels)


def verify(rows):
    n = len(rows)
    edges = [(i,j) for i,row in enumerate(rows) for j in range(n) if row >> j & 1]
    extensions = defaultdict(int)
    full = 0
    for perm in permutations(range(n)):
        if not all(rows[i] >> j & 1 for i,j in enumerate(perm)):
            continue
        perfect = tuple(enumerate(perm))
        bits = sum(1 << (i*n+j) for i,j in perfect)
        full += 1
        for triple in combinations(perfect, 3):
            if triple in extensions:
                extensions[triple] &= bits
            else:
                extensions[triple] = bits
    count = 0
    necessary = set()
    for triple in combinations(edges, 3):
        if len({i for i,j in triple}) != 3 or len({j for i,j in triple}) != 3:
            continue
        assert triple in extensions
        count += 1
        for edge in edges:
            i,j = edge
            if edge not in triple and extensions[triple] >> (i*n+j) & 1:
                necessary.add(edge)
    assert count == len(extensions) and necessary == set(edges)
    degrees = [row.bit_count() for row in rows] + [sum(row >> j & 1 for row in rows) for j in range(n)]
    assert (2*n,len(edges),degrees.count(4)) == (16,36,10)
    return count,full,len(necessary)


def isomorphism(first, second):
    n=len(first)
    incoming=lambda rows:[tuple(i for i,row in enumerate(rows) if row >> j & 1) for j in range(n)]
    target=incoming(second)
    for p in permutations(range(n)):
        if any(first[i].bit_count()!=second[p[i]].bit_count() for i in range(n)):continue
        mapped=[tuple(sorted(p[i] for i in col)) for col in incoming(first)]
        if Counter(mapped)!=Counter(target):continue
        available=defaultdict(list)
        for j,col in enumerate(target):available[col].append(j)
        q=tuple(available[col].pop() for col in mapped)
        assert all((first[i] >> j & 1)==(second[p[i]] >> q[j] & 1) for i in range(n) for j in range(n))
        return p,q
    return None


if __name__ == '__main__':
    canonical=family_rows(3,5)
    separate=(108,228,116,155,187,102,101,155)
    for label,rows in [('Two-block construction',canonical),('Original deletion-search witness',separate)]:
        matches,perfect,failed=verify(rows)
        print(f'{label}: {matches} three-edge matchings, {perfect} perfect permutations, {failed} obstructed deletions.')
    print('Side-preserving isomorphism:',isomorphism(canonical,separate))
