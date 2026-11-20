#!/usr/bin/env python3
"""Check small oriented graphs by direct enumeration of dominating sets."""

from itertools import combinations, product


def minimal_dominating_sets(order, arcs):
    closed_out = [1 << v for v in range(order)]
    for tail, head in arcs:
        closed_out[tail] |= 1 << head

    full = (1 << order) - 1
    covered = [0] * (full + 1)
    for subset in range(1, full + 1):
        vertex = subset & -subset
        covered[subset] = covered[subset ^ vertex] | closed_out[vertex.bit_length() - 1]

    minimal = set()
    for subset in range(1, full + 1):
        if covered[subset] != full:
            continue
        if all(
            covered[subset ^ (1 << v)] != full
            for v in range(order)
            if subset & (1 << v)
        ):
            minimal.add(subset)
    return minimal


def support_components(edges):
    components = []
    for edge in edges:
        merged = edge
        separate = []
        for component in components:
            if component & edge:
                merged |= component
            else:
                separate.append(component)
        components = separate + [merged]
    return components


def check_orientations(max_order, tournament):
    checked = disconnected = 0
    states = (1, -1) if tournament else (0, 1, -1)
    for order in range(1, max_order + 1):
        pairs = list(combinations(range(order), 2))
        for directions in product(states, repeat=len(pairs)):
            arcs = [
                (u, v) if direction == 1 else (v, u)
                for direction, (u, v) in zip(directions, pairs)
                if direction
            ]
            edges = minimal_dominating_sets(order, arcs)
            components = support_components(edges)
            if len(components) != 1:
                assert not tournament and len(components) == 2
                for component in components:
                    centre_candidates = component
                    for edge in edges:
                        if edge & component:
                            assert edge.bit_count() == 2
                            centre_candidates &= edge
                    assert centre_candidates
                disconnected += 1
            checked += 1
    return checked, disconnected


def check_star_constructions():
    checked = 0
    for sizes in product(range(1, 5), repeat=4):
        if min(sizes[:2]) != 1 or min(sizes[2:]) != 1:
            continue
        a1, a2, b1, b2 = (
            list(range(sum(sizes[:i]), sum(sizes[: i + 1])))
            for i in range(4)
        )
        neighbourhoods = {
            a1[0]: a1 + b1,
            a2[0]: a2 + b2,
            b1[0]: a2 + b1,
            b2[0]: a1 + b2,
        }
        arcs = {
            (u, v)
            for v, incoming in neighbourhoods.items()
            for u in incoming
            if u != v
        }
        for part, incoming in (
            (a1, a2 + b1),
            (a2, a1 + b2),
            (b1, a2 + b2),
            (b2, a1 + b1),
        ):
            arcs.update((u, v) for u in incoming for v in part[1:])
        extra = sum(sizes)
        arcs.update((u, extra) for u in range(extra))
        assert all((v, u) not in arcs for u, v in arcs)
        expected = {(1 << u) | (1 << v) for u, v in product(a1, a2)}
        expected.update((1 << u) | (1 << v) for u, v in product(b1, b2))
        assert minimal_dominating_sets(extra + 1, arcs) == expected
        checked += 1
    return checked


def main():
    tournaments, _ = check_orientations(6, tournament=True)
    oriented_graphs, disconnected = check_orientations(5, tournament=False)
    constructions = check_star_constructions()
    print(f"Checked {tournaments:,} labelled tournaments through order 6.")
    print(
        f"Checked {oriented_graphs:,} labelled oriented graphs through order 5 "
        f"({disconnected:,} with disconnected support)."
    )
    print(f"Checked {constructions} realizations of two stars with an isolated vertex.")


if __name__ == "__main__":
    main()
