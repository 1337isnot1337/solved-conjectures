"""Finite checks for the density identity, rainbow encoding, and upper construction."""

from itertools import combinations, product
from math import comb, isqrt


def matchings(vertices):
    if not vertices:
        yield ()
        return
    first, *rest = vertices
    yield from matchings(rest)
    for position, mate in enumerate(rest):
        remaining = rest[:position] + rest[position + 1 :]
        for matching in matchings(remaining):
            yield ((first, mate),) + matching


def all_subsets(size):
    for length in range(size + 1):
        yield from combinations(range(size), length)


def check_matching_systems():
    size = 6
    subsets = list(all_subsets(size))
    pair_lists = {subset: list(combinations(subset, 2)) for subset in subsets}
    triple_lists = {subset: list(combinations(subset, 3)) for subset in subsets}
    possible_layers = [list(matchings(list(range(apex)))) for apex in range(size)]
    maxima = [0] * (size + 1)
    systems = 0
    for layers in product(*possible_layers):
        systems += 1
        colors = {pair: pair for pair in combinations(range(size), 2)}
        triples = set()
        for apex, matching in enumerate(layers):
            for first, second in matching:
                triples.add((first, second, apex))
                colors[second, apex] = colors[first, apex]
        for subset in subsets:
            edges = sum(edge in triples for edge in triple_lists[subset])
            restricted_colors = [colors[pair] for pair in pair_lists[subset]]
            rainbow = len(set(restricted_colors)) == len(restricted_colors)
            assert (edges == 0) == rainbow
            length = len(subset)
            maxima[length] = max(maxima[length], edges)
            assert edges <= (length - 1) ** 2 // 4
    assert maxima == [0, 0, 0, 1, 2, 4, 6]
    return systems, systems * len(subsets)


def check_top_pairs():
    size = 6
    pairs = [pair for pair in combinations(range(size), 2) if pair[0] > 0]
    choices = [range(-1, middle) for middle, _ in pairs]
    maximum = 0
    assignments = 0
    for outputs in product(*choices):
        triples = {(lower, middle, top) for (middle, top), lower in zip(pairs, outputs) if lower >= 0}
        assignments += 1
        maximum = max(maximum, len(triples))
        assert len(triples) <= comb(size - 1, 2)
    assert maximum == 10
    return assignments


def check_forced_patterns():
    center = 0
    spokes = (1, 2)
    extensions = (3, 4, 5)
    triples = {(center, spoke, extension) for spoke in spokes for extension in extensions}
    triples.add(extensions)
    assert len(triples) == 7
    link_path = (3, 1, 4, 2)
    for a, b in zip(link_path, link_path[1:]):
        assert tuple(sorted((center, a, b))) in triples

    patterns = 0
    for spokes_per_group in range(1, 9):
        width = 1 + spokes_per_group
        for num_groups in range(1, 10):
            vertices = width * num_groups
            edges = set()
            for center in range(0, vertices, width):
                for spoke in range(center + 1, center + width):
                    for later in range(center + width, vertices):
                        edges.add((center, spoke, later))
            assert len(edges) == spokes_per_group * width * comb(num_groups, 2)
            patterns += 1
    return patterns


def check_integer_estimates():
    for n in range(1, 1001):
        assert sum(j // 2 for j in range(n)) == (n - 1) ** 2 // 4
        k = isqrt(n)
        groups = n // (k + 1)
        lower = k * (k + 1) * comb(groups, 2)
        assert n * n - 2 * lower <= 6 * n * (k + 1)


if __name__ == '__main__':
    systems, subsets = check_matching_systems()
    assignments = check_top_pairs()
    patterns = check_forced_patterns()
    check_integer_estimates()
    print(f'{systems} matching systems and {subsets} subset tests')
    print(f'{assignments} top-pair functions, {patterns} group patterns, and 1,000 integer bounds')
