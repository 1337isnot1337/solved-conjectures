"""Exact single-color exchange and lattice-rank checks on test matroids."""

from collections import defaultdict
from itertools import combinations, product
from random import Random


class Components:
    def __init__(self, size):
        self.parent = list(range(size))

    def find(self, x):
        while self.parent[x] != x:
            x = self.parent[x]
        return x

    def join(self, left, right):
        self.parent[self.find(left)] = self.find(right)


def mod_rank(rows, modulus):
    pivots = {}
    for row in rows:
        a = [x % modulus for x in row]
        for col in range(len(a)):
            value = a[col]
            if not value:
                continue
            if col not in pivots:
                scale = pow(value, -1, modulus)
                pivots[col] = [scale * x % modulus for x in a]
                break
            a = [(x - value * y) % modulus for x, y in zip(a, pivots[col])]
    return len(pivots)


def check_input(rows, is_base):
    rank = len(rows)
    elements = [x for row in rows for x in row]
    colors = [range(i * rank, (i + 1) * rank) for i in range(rank)]
    def base(labels):
        chosen = frozenset(elements[i] for i in labels)
        return len(chosen) == rank and is_base(chosen)
    initial = list(colors[0])
    matroid = Components(len(elements))
    for e in range(rank, len(elements)):
        for j, f in enumerate(initial):
            if base([*initial[:j], e, *initial[j + 1:]]):
                matroid.join(e, f)
    rainbow = [selected for selected in product(*colors) if base(selected)]
    assert rainbow
    swaps = Components(len(elements))
    for i, color in enumerate(colors):
        fibers = defaultdict(list)
        for selected in rainbow:
            fibers[selected[:i] + selected[i + 1:]].append(selected[i])
        for fiber in fibers.values():
            for e in fiber[1:]:
                swaps.join(fiber[0], e)
        for e, f in combinations(color, 2):
            assert (swaps.find(e) == swaps.find(f)) == (matroid.find(e) == matroid.find(f))
    components = len({matroid.find(e) for e in range(len(elements))})
    vectors = [tuple(int(e in selected) for e in range(len(elements))) for selected in rainbow]
    expected_rank = rank * rank - rank - components + 2
    for modulus in (2, 3, 5, 101):
        assert mod_rank(vectors, modulus) == expected_rank


def main():
    rng = Random(261100941)
    vamos_nonbases = {frozenset((2*a, 2*a+1, 2*b, 2*b+1))
                      for a, b in combinations(range(4), 2) if (a, b) != (2, 3)}
    non_pappus_lines = {frozenset(line) for line in (
        (0,1,2), (3,4,5), (0,4,6), (1,3,6), (0,5,7), (2,3,7), (1,5,8), (2,4,8),
    )}
    def non_pappus_independent(subset):
        return len(subset) < 3 or (len(subset) == 3 and subset not in non_pappus_lines)
    def free_extension_basis(subset):
        previous = subset - {10}
        return len(subset) == 4 and non_pappus_independent(previous - {9})
    cases = [(range(8), 4, lambda subset: subset not in vamos_nonbases),
             (range(9), 3, non_pappus_independent),
             (range(11), 4, free_extension_basis),
             (range(11), 4, lambda subset: len(subset & {9, 10}) == 1
              and non_pappus_independent(subset - {9, 10}))]
    checked = 0
    for ground, rank, is_base in cases:
        families = [row for row in combinations(ground, rank) if is_base(frozenset(row))]
        for _ in range(48):
            check_input(rng.choices(families, k=rank), is_base)
            checked += 1
    print(f'{checked} inputs passed single-color connectivity and four exact modular rank checks')


if __name__ == '__main__':
    main()
