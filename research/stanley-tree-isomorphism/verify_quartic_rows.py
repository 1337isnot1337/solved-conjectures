"""Check mixed pendant projections and the exceptional competitor with three hubs."""

from collections import defaultdict
from itertools import combinations, product


def mixed_pairs(groups):
    distinct_groups = list(dict.fromkeys(groups))
    group_vectors = {g: tuple(int(g == h) for h in distinct_groups) for g in distinct_groups}
    by_vector = defaultdict(set)
    for i, j in combinations(range(len(groups)), 2):
        for other in distinct_groups:
            vector = tuple(a + b - c for a, b, c in zip(
                group_vectors[groups[i]], group_vectors[groups[j]], group_vectors[other]))
            by_vector[vector].add((i, j))
    return group_vectors, by_vector


def quotient_checks():
    examples = total = 0
    for leaf_count in range(5, 19):
        for sizes in ((), (2,), (3,), (2, 2)):
            blocks = list(sizes) + [1] * (leaf_count - sum(sizes))
            groups = [label for label, size in enumerate(blocks) for _ in range(size)]
            singles, pairs = mixed_pairs(groups)
            for vector, options in pairs.items():
                if vector not in singles.values():
                    assert len(options) <= 4
                    continue
                g = next(label for label, unit in singles.items() if unit == vector)
                constrained = set(i for i, label in enumerate(groups) if label == g or blocks[label] > 1)
                assert len(constrained) <= 5
                if len(constrained) == leaf_count:
                    assert leaf_count == 5 and sizes == (2, 2) and blocks[g] == 1
                    assert len(options) == 4
                    assert all(any(groups[v] == g for v in pair) for pair in options)
            total += len(pairs)
            examples += 1
    return examples, total


def three_hub_checks():
    tests = matches = 0
    for p, q, pendant, at in product(range(1, 21), range(1, 21), range(1, 21), range(3)):
        points = [0, p, p + q]
        from_leaf = sorted(pendant + abs(s - points[at]) for s in points)
        same = from_leaf == sorted([p, q, p + q])
        assert same == (at == 1 and max(p, q) == 2 * min(p, q) and pendant == min(p, q))
        matches += same
        tests += 1
    return tests, matches


if __name__ == '__main__':
    examples, vectors = quotient_checks()
    tests, matches = three_hub_checks()
    print(f'{examples} quotient types through 18 leaves, {vectors} mixed projected vectors')
    print(f'{tests} three-hub metric configurations, {matches} equal multisets, all forced 2:1 cases')
