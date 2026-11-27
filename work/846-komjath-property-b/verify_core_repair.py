"""Exhaust the finite one-point repair choices on ordered edges up to five points."""
from itertools import permutations


def is_split(edge, red):
    return 0 < (edge & red) < edge


def outcomes(order, red):
    """Return (final coloring, number of flips) for every legal choice."""
    states = [(red, 0)]
    protected = 0
    for edge in order:
        fresh = edge & ~protected
        if not fresh:
            return []
        following = []
        for coloring, steps in states:
            if is_split(edge, coloring):
                following.append((coloring, steps))
                continue
            choices = fresh
            while choices:
                point = choices & -choices
                choices ^= point
                following.append((coloring ^ point, steps + 1))
        states = following
        protected |= edge
    return states


def main():
    then_cases = tests = flips = nontrivial = 0
    for size in range(2, 6):
        edges = [edge for edge in range(1 << size) if edge.bit_count() >= 2]
        for length in range(1, min(4, size)):
            for order in permutations(edges, length):
                core_candidates = [edge for edge in edges if edge not in order
                                   and all((edge & processed).bit_count() != 1
                                           for processed in order)]
                for initial in range(1 << size):
                    core = [edge for edge in core_candidates if is_split(edge, initial)]
                    for final, steps in outcomes(order, initial):
                        then_cases += 1
                        flips += steps
                        assert all(is_split(edge, final) for edge in order)
                        for edge in core:
                            assert is_split(edge, final)
                            tests += 1
                            nontrivial += bool((initial ^ final) & edge)
    # Without the cross-intersection condition a previously split core edge can lose a color.
    assert is_split(0b101, 0b100)
    assert any(not is_split(0b101, final) for final, _ in outcomes([0b011], 0b100))
    assert nontrivial and flips
    print(f'{then_cases:,} complete repair histories; {flips:,} point flips')
    print(f'{tests:,} protected core-edge checks; {nontrivial:,} include a changed core point')


if __name__ == '__main__':
    main()
