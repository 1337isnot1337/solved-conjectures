#!/usr/bin/env python3
"""Replay the directed Hamilton-cycle joins in two exact layered controls."""

from itertools import product


def torus_order(modulus, rank):
    if rank == 1:
        return [(i,) for i in range(modulus)]
    order = []
    first_coordinate = 0
    for tail in torus_order(modulus, rank - 1):
        order.extend(((first_coordinate + i) % modulus, *tail) for i in range(modulus))
        first_coordinate = (first_coordinate + modulus - 1) % modulus
    return order


def check_lift(modulus, shifts, reference, additions):
    layer_count = len(shifts)
    rank = len(reference[0])
    zero = (0,) * rank
    deck = set(product(range(modulus), repeat=rank))

    def add(a, b):
        return tuple((x + y) % modulus for x, y in zip(a, b))

    def subtract(a, b):
        return tuple((x - y) % modulus for x, y in zip(a, b))

    origins = [zero]
    for shift in reference[:-1]:
        origins.append(add(origins[-1], shift))

    def change_origin(i, shift):
        return subtract(add(origins[i], shift), origins[(i + 1) % layer_count])

    current_reference = [change_origin(i, shift) for i, shift in enumerate(reference)]
    current_shifts = [
        {change_origin(i, shift) for shift in allowed} for i, allowed in enumerate(shifts)
    ]
    successor = {
        (i, a): ((i + 1) % layer_count, add(a, shift))
        for i, shift in enumerate(current_reference)
        for a in deck
    }
    voltage = current_reference[-1]
    subgroup = {tuple((j * x) % modulus for x in voltage) for j in range(modulus)}
    assert len(subgroup) == modulus and current_reference[:-1] == [zero] * (layer_count - 1)

    for i, basis in additions:
        offsets = [
            tuple(
                sum(c * vector[j] for c, vector in zip(coefficients, basis)) % modulus
                for j in range(rank)
            )
            for coefficients in torus_order(modulus, len(basis))
        ]
        enlarged = {add(u, w) for u in subgroup for w in offsets}
        assert len(enlarged) == len(subgroup) * len(offsets)
        remaining = set(deck)
        while remaining:
            b = min(remaining)
            remaining.difference_update(add(b, u) for u in enlarged)
            for w, following in zip(offsets, offsets[1:] + offsets[:1]):
                source = (i, add(b, w))
                step = subtract(following, w)
                assert step in basis
                old_target = ((i + 1) % layer_count, add(source[1], current_reference[i]))
                new_shift = add(current_reference[i], step)
                assert successor[source] == old_target and new_shift in current_shifts[i]
                successor[source] = (old_target[0], add(source[1], new_shift))
        subgroup = enlarged

    assert subgroup == deck
    start = (0, zero)
    visited = set()
    vertex = start
    for _ in range(len(successor)):
        assert vertex not in visited
        visited.add(vertex)
        new = successor[vertex]
        i, x = vertex
        j, y = new
        assert j == (i + 1) % layer_count
        assert subtract(add(y, origins[j]), add(x, origins[i])) in shifts[i]
        vertex = new
    assert vertex == start and visited == successor.keys()
    print(f"Verified the forward Hamilton cycle with {len(visited)} vertices.")


if __name__ == "__main__":
    z, e1, e2, e3 = (0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1)
    check_lift(4, [{z, e1}, {z, e2}, {z, e3}, {z}], [e1, z, z, z], [(1, [e2]), (2, [e3])])
    check_lift(9, [{z, e1, e2}, {z}, {z}, {e3}], [z, z, z, e3], [(0, [e1, e2])])
