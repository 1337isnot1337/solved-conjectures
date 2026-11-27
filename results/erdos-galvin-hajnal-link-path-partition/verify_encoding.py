"""Exhaustive finite checks of the pair coloring for the three-edge tight path."""

from collections import Counter, defaultdict
from itertools import combinations, permutations


def choose_colors(triples):
    """Return the repeated pair-color classes, using distinct colors per class."""
    uses = defaultdict(set)
    for triple in triples:
        for pair in combinations(triple, 2):
            uses[pair].add(triple)

    unseen = set(triples)
    groups = []
    while unseen:
        seed = unseen.pop()
        component = {seed}
        pending = [seed]
        while pending:
            for pair in combinations(pending.pop(), 2):
                neighbors = unseen.intersection(uses[pair])
                unseen.difference_update(neighbors)
                component.update(neighbors)
                pending.extend(neighbors)

        core = set.intersection(*(set(edge) for edge in component))
        if len(component) == 1:
            groups.append(list(combinations(seed, 2))[:2])
        elif len(core) == 2:
            for edge in component:
                groups.append([pair for pair in combinations(edge, 2) if set(pair) != core])
        else:
            vertices = set.union(*(set(edge) for edge in component))
            assert len(vertices) == 4 and len(component) in (3, 4)
            center = next(x for x in sorted(vertices) if sum(x in edge for edge in component) == 3)
            others = sorted(vertices - {center})
            groups.append([tuple(sorted((center, x))) for x in others])
            if len(component) == 4:
                groups.append(list(combinations(others, 2))[:2])
    return groups


def check_family(triples):
    groups = choose_colors(triples)
    assigned = {}
    for color, group in enumerate(groups):
        assert 2 <= len(group) <= 3
        for pair in group:
            assert pair not in assigned
            assigned[pair] = color
    for edge in triples:
        colors = [assigned.get(pair, pair) for pair in combinations(edge, 2)]
        assert len(set(colors)) < 3


def check_order(n):
    triples = list(combinations(range(n), 3))
    index = {edge: i for i, edge in enumerate(triples)}
    # Generate forbidden copies independently from the five-vertex tight-path order.
    blockers = defaultdict(set)
    for path in permutations(range(n), 5):
        indices = sorted(index[tuple(sorted(path[j:j + 3]))] for j in range(3))
        a, b, c = indices
        blockers[c].add((1 << a) | (1 << b))

    tested = Counter()
    def visit(start, mask, family):
        check_family(family)
        tested[len(family)] += 1
        for j in range(start, len(triples)):
            if all(mask & prior != prior for prior in blockers[j]):
                family.append(triples[j])
                visit(j + 1, mask | (1 << j), family)
                family.pop()

    visit(0, 0, [])
    return sum(tested.values())


if __name__ == "__main__":
    for order in range(1, 7):
        print(f"{order} vertices: {check_order(order):,} link-path-free systems")
