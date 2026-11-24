#!/usr/bin/env python3
"""Check the six-terminal separation witness using integer arithmetic."""

from collections import Counter
from itertools import combinations, permutations, product


PORTS = frozenset(range(6))
APART_PAIRS = (
    "23|14|05", "23|04|15", "13|24|05", "13|04|25",
    "02|34|15", "01|34|25", "02|14|35", "01|24|35",
)
OTHER_PAIRS = (
    "03|24|15", "03|14|25", "12|34|05", "12|04|35",
    "02|13|45", "01|23|45",
)
SINGLE_SPLITS = (
    "234|015", "034|125", "124|035", "0123|45", "123|045",
    "023|145", "013|245", "03|1245", "012|345", "12|0345",
)
DOUBLE_TRIPLES = ("134|025", "024|135", "014|235")
EXCLUDED_PAIR_SPLITS = {frozenset(pair) for pair in ((4, 5), (0, 3), (1, 2))}


def partitions(items):
    if not items:
        yield ()
        return
    first, *rest = items
    for partition in partitions(rest):
        yield (frozenset({first}), *partition)
        for i, block in enumerate(partition):
            yield (*partition[:i], block | {first}, *partition[i + 1:])


def parse_partition(text):
    return tuple(frozenset(map(int, block)) for block in text.split("|"))


def load(trace, block):
    return sum(trace[i] for i in block) % 5


def balanced(trace, partition):
    return all(load(trace, block) == 0 for block in partition)


def coefficients():
    terms = [(-7, (PORTS,))]
    terms.extend((1, parse_partition(p)) for p in SINGLE_SPLITS)
    terms.extend((2, parse_partition(p)) for p in DOUBLE_TRIPLES)
    terms.extend((-2, parse_partition(p)) for p in APART_PAIRS)
    terms.extend((-1, parse_partition(p)) for p in OTHER_PAIRS)
    for pair in map(frozenset, combinations(sorted(PORTS), 2)):
        if pair not in EXCLUDED_PAIR_SPLITS:
            terms.append((2, (pair, PORTS - pair)))
    return terms


def witness(traces):
    terms = coefficients()
    triple = parse_partition("234|015")
    plus_pair = parse_partition("13|04|25")
    minus_pair = parse_partition("02|14|35")
    f, g = [], []
    for trace in traces:
        value = sum(weight for weight, p in terms if balanced(trace, p))
        total = 5 + 5 * balanced(trace, triple)
        total += 4 * (balanced(trace, plus_pair) - balanced(trace, minus_pair))
        f.append(value)
        g.append(total - 5 * value)
    return f, g


def tree_conditions():
    for partition in partitions(sorted(PORTS)):
        if any(len(block) < 2 for block in partition):
            continue
        splits = []
        for block in partition:
            first, *rest = sorted(block)
            for size in range(2, len(block) - 1):
                for members in combinations(rest, size - 1):
                    side = frozenset((first, *members))
                    splits.append((side, block - side))
        for size in range(4):
            for selected in combinations(splits, size):
                if any(a & c and a & d and b & c and b & d
                       for (a, b), (c, d) in combinations(selected, 2)):
                    continue
                yield partition, tuple(a for a, _ in selected)


def cycle_conditions():
    for partition in partitions(sorted(PORTS)):
        if len(partition) not in (5, 6):
            continue
        first, *others = sorted(partition, key=min)
        for tail in permutations(others):
            if min(tail[0]) > min(tail[-1]):
                continue
            blocks = (first, *tail)
            yield blocks, ()
            if len(blocks) == 5:
                yield blocks, tuple(block for block in blocks if len(block) == 2)


def cycle_has_flow(trace, blocks):
    partial = 0
    visited = {0}
    for block in blocks:
        partial = (partial + load(trace, block)) % 5
        visited.add(partial)
    return len(visited) < 5


def main():
    traces = [(1, *tail) for tail in product(range(1, 5), repeat=5)
              if (1 + sum(tail)) % 5 == 0]
    f, g = witness(traces)
    assert Counter(f) == {0: 123, 1: 79, 2: 3}
    assert Counter(g) == {0: 82, 1: 12, 5: 66, 6: 3, 9: 12, 10: 27, 14: 3}
    assert all(a * b == 0 for a, b in zip(f, g))

    forest_supports = set()
    for partition, splits in tree_conditions():
        forest_supports.add(tuple(i for i, trace in enumerate(traces)
                                  if balanced(trace, partition)
                                  and all(load(trace, part) for part in splits)))
    forest_supports.discard(())
    all_supports = set(forest_supports)
    for blocks, splits in cycle_conditions():
        support = tuple(i for i, trace in enumerate(traces)
                        if cycle_has_flow(trace, blocks)
                        and all(load(trace, part) for part in splits))
        if support:
            all_supports.add(support)
    assert len(forest_supports) == 321
    assert len(all_supports) == 741
    minima = (min(sum(f[i] for i in support) for support in all_supports),
              min(sum(g[i] for i in support) for support in all_supports))
    assert minima == (1, 30)
    print(f"{len(traces)} normalized traces, {len(forest_supports)} forest supports, "
          f"{len(all_supports)} total cactus supports")
    print("Disjoint nonnegative witnesses with minimum support sums", minima)


if __name__ == "__main__":
    main()
