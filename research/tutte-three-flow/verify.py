#!/usr/bin/env python3
"""Check the exact finite controls in the Tutte 3-flow research note."""

from itertools import product


def boundary_extensions(edges, prescription):
    """All divergence vectors extending the directions at vertex zero."""
    incident = [i for i, edge in enumerate(edges) if 0 in edge]
    remaining = [i for i, edge in enumerate(edges) if 0 not in edge]
    order = 1 + max(max(edge) for edge in edges)
    extensions = set()
    for internal in product((-1, 1), repeat=len(remaining)):
        directions = dict(zip(incident, prescription))
        directions.update(zip(remaining, internal))
        divergence = [0] * order
        for i, (u, v) in enumerate(edges):
            divergence[u] += directions[i]
            divergence[v] -= directions[i]
        if all(value % 3 == 0 for value in divergence):
            extensions.add(tuple(divergence))
    return extensions


def check_prescriptions():
    four_ports = [(0, 1)] * 2 + [(0, 2)] * 2 + [(1, 2)] * 3
    patterns = [p for p in product((-1, 1), repeat=4) if sum(p) == 0]
    assert all(boundary_extensions(four_ports, p) for p in patterns)
    assert boundary_extensions(four_ports, (-1, -1, 1, 1)) == {(0, 3, -3)}

    five_ports = [(0, 1)] * 3 + [(0, 2)] * 2 + [(1, 2)] * 2
    patterns = [p for p in product((-1, 1), repeat=5) if abs(sum(p)) == 3]
    assert all(boundary_extensions(five_ports, p) for p in patterns)
    print("Verified six four-port and ten five-port prescriptions.")


def check_hall_obstruction():
    block = [(i, 5 + (5 * i + k) % 8) for i in range(5) for k in range(5)]
    block += [(5 + j, 6 + j) for j in range(0, 8, 2)]
    degrees = [sum(i in edge for edge in block) for i in range(13)]
    assert degrees == [5] * 6 + [4] * 7

    full_mask = (1 << 13) - 1
    allowed_small_cuts = {1 << i for i in range(6, 13)}
    allowed_small_cuts |= {full_mask ^ mask for mask in allowed_small_cuts}
    actual_small_cuts = set()
    for mask in range(1, full_mask):
        cut_size = sum(((mask >> u) ^ (mask >> v)) & 1 for u, v in block)
        assert cut_size >= 4
        if cut_size == 4:
            actual_small_cuts.add(mask)
    assert actual_small_cuts == allowed_small_cuts

    edges = block + [(u + 13, v + 13) for u, v in block]
    edges += [(i, i + 13) for i in range(6, 13)]
    edges = {frozenset(edge) for edge in edges}
    assert len(edges) == 65
    assert all(sum(i in edge for edge in edges) == 5 for i in range(26))
    a_components = [(i,) for i in range(5)]
    a_components += [(i + 13, i + 14) for i in range(5, 13, 2)]
    b_components = [(i + 13,) for i in range(5)]
    b_components += [(i, i + 1) for i in range(5, 13, 2)]
    for components in (a_components, b_components):
        shore = {v for component in components for v in component}
        actual = {edge for edge in edges if edge <= shore}
        expected = {frozenset(component) for component in components if len(component) == 2}
        assert actual == expected
    neighbors = {
        j for j, component in enumerate(b_components)
        if any(frozenset((i, v)) in edges for i in range(5) for v in component)
    }
    assert neighbors == set(range(5, 9))
    print("Verified the 5-edge-connected control and the five-to-four Hall obstruction.")


if __name__ == "__main__":
    check_prescriptions()
    check_hall_obstruction()
