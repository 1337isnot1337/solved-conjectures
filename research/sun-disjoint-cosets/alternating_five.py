"""Check the subgroup indices and the two Sylow-coset assertions in A_5."""

from collections import defaultdict
from itertools import permutations


def even_permutations():
    for permutation in permutations(range(5)):
        inversions = sum(x > y for i, x in enumerate(permutation)
                         for y in permutation[i + 1:])
        if inversions % 2 == 0:
            yield permutation


def generate(generators, multiply):
    elements = [0]  # the identity permutation
    seen = {0}
    for x in elements:
        for generator in generators:
            y = multiply[x][generator]
            if y not in seen:
                seen.add(y)
                elements.append(y)
    return frozenset(seen)


def all_cosets():
    group = list(even_permutations())
    index = {x: i for i, x in enumerate(group)}
    multiply = [[index[tuple(x[i] for i in y)] for y in group] for x in group]
    trivial = frozenset({0})
    queue = [(trivial, ())]
    seen = {trivial}
    cosets = defaultdict(set)
    for subgroup, generators in queue:
        subgroup_index = len(group) // len(subgroup)
        for row in multiply:
            cosets[subgroup_index].add(frozenset(row[y] for y in subgroup))
        for x in range(1, len(group)):
            if x not in subgroup:
                larger = generate(generators + (x,), multiply)
                if larger not in seen:
                    seen.add(larger)
                    queue.append((larger, generators + (x,)))
    return cosets


if __name__ == "__main__":
    cosets = all_cosets()
    assert sorted(cosets) == [1, 5, 6, 10, 12, 15, 20, 30, 60]
    sylow_cosets = cosets[12]
    assert len(sylow_cosets) == 72
    for index in (10, 20):
        tested = 0
        for first in cosets[index]:
            for second in cosets[15]:
                assert any(first & cell and second & cell for cell in sylow_cosets)
                tested += 1
        print(f"Indices {index} and 15: {tested} pairs meet a common Sylow 5-coset")
