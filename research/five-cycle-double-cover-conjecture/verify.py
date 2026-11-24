"""Construct and check five-covers for prescribed unions of circuits."""

from collections import Counter, defaultdict
from itertools import product


def edge(u, v):
    return tuple(sorted((u, v)))


def cycle_edges(cycle):
    return [edge(u, v) for u, v in zip(cycle, cycle[1:] + cycle[:1])]


def components(edges):
    group = {}
    adjacency = defaultdict(set)
    for u, v in edges:
        adjacency[u].add(v)
        adjacency[v].add(u)
    count = 0
    for root in adjacency:
        if root in group:
            continue
        group[root] = count
        stack = [root]
        while stack:
            for v in adjacency[stack.pop()]:
                if v not in group:
                    group[v] = count
                    stack.append(v)
        count += 1
    return group, count, adjacency


def binary_rank(rows):
    basis = {}
    for row in rows:
        while row and row.bit_length() in basis:
            row ^= basis[row.bit_length()]
        if row:
            basis[row.bit_length()] = row
    return len(basis)


def endpoint_parities(zeros, component, count):
    result = [0] * count
    for u, v in zeros:
        result[component[u]] ^= 1
        result[component[v]] ^= 1
    return result


def circuit_values(circuits, alpha, shifts):
    values = {}
    for circuit, shift in zip(circuits, shifts):
        value = shift
        for u, e in zip(circuit, cycle_edges(circuit)):
            value ^= alpha[u]
            values[e] = value
        assert value == shift
    return values


def rotation(value, exponent):
    return (value - 1 + exponent) % 3 + 1


def join_path(adjacency, start, end):
    previous = {start: None}
    stack = [start]
    while end not in previous:
        u = stack.pop()
        for v in adjacency[u]:
            if v not in previous:
                previous[v] = u
                stack.append(v)
    result = set()
    while end != start:
        result.add(edge(end, previous[end]))
        end = previous[end]
    return result


def check_cover(flow, circuits, zeros, adjacency, component):
    endpoints = defaultdict(list)
    for e in zeros:
        for v in e:
            endpoints[component[v]].append(v)
    join = set()
    for vertices in endpoints.values():
        assert len(vertices) % 2 == 0
        for u, v in zip(vertices[::2], vertices[1::2]):
            join ^= join_path(adjacency, u, v)
    prescribed = {e for circuit in circuits for e in cycle_edges(circuit)}
    second = zeros | join
    third = prescribed ^ second
    even_sets = [prescribed, second]
    for mask in (1, 2, 3):
        even_sets.append(third ^ {e for e, value in flow.items() if (value & mask).bit_count() % 2})
    for layer in even_sets:
        assert all(count % 2 == 0 for count in Counter(v for e in layer for v in e).values())
    assert Counter(e for layer in even_sets for e in layer) == Counter({e: 2 for e in flow})


def check(circuits, colours, expected_rank, expected_groups):
    group, count, adjacency = components(colours)
    alpha = {v: colours[edge(v, next(iter(adjacency[v])))] for circuit in circuits for v in circuit}
    assert all(len(adjacency[v]) == 1 for v in alpha)
    assert all({colours[edge(v, u)] for u in adjacency[v]} == {1, 2, 3}
               for v in adjacency if v not in alpha)
    t = [[0] * len(circuits) for _ in range(count)]
    for j, circuit in enumerate(circuits):
        for v in circuit:
            t[group[v]][j] ^= alpha[v]
    rank = binary_rank(sum(colour << (2 * j) for j, colour in enumerate(row)) for row in t)
    assert rank == expected_rank
    active = [(i, count + j) for i, row in enumerate(t) for j, colour in enumerate(row) if colour]
    active_groups, _, _ = components(active)
    for i in range(count):
        if i not in active_groups:
            active_groups[i] = len(set(active_groups.values()))
    assert set(active_groups.values()) == set(range(expected_groups))
    assert rank == count - expected_groups

    success = 0
    for rotations in product(range(3), repeat=expected_groups):
        rotated = {
            e: rotation(value, rotations[active_groups[group[e[0]]]]) for e, value in colours.items()
        }
        ports = {v: rotated[edge(v, next(iter(adjacency[v])))] for v in alpha}
        for shifts in product(range(4), repeat=len(circuits)):
            values = circuit_values(circuits, ports, shifts)
            zeros = {e for e, value in values.items() if not value}
            if not any(endpoint_parities(zeros, group, count)):
                check_cover(rotated | values, circuits, zeros, adjacency, group)
                success += 1
                break
    assert success % 2 == 1


def insert_petersen(circuits, colours, replaced):
    """Replace an edge by a Petersen two-pole and prescribe its outer pentagon."""
    colour = colours.pop(replaced)
    used_vertices = {v for e in colours for v in e} | set(replaced)
    start = 1 + max(used_vertices)
    outer = list(range(start, start + 5))
    inner = list(range(start + 5, start + 10))
    inner_order = [inner[i] for i in (0, 2, 4, 1, 3)]
    chosen = [rotation(value, colour - 1) for value in (1, 2, 1, 2, 3)]
    inner_colours = dict(zip(cycle_edges(inner_order), chosen))
    removed = edge(inner_order[0], inner_order[1])
    assert inner_colours[removed] == colour
    for u, v in zip(outer, inner):
        surrounding = [value for e, value in inner_colours.items() if v in e]
        colours[edge(u, v)] = surrounding[0] ^ surrounding[1]
    del inner_colours[removed]
    colours.update(inner_colours)
    for u, v in zip(replaced, removed):
        colours[edge(u, v)] = colour
    circuits.append(outer)


def main():
    circuits = [[0, 1, 2], [4, 5, 3]]
    colours = {(0, 3): 1, (1, 4): 2, (2, 5): 3}
    check(circuits, colours, expected_rank=2, expected_groups=1)
    insert_petersen(circuits, colours, (0, 3))
    check(circuits, colours, expected_rank=2, expected_groups=1)

    circuits = [[0, 1, 2, 3]]
    colours = {(0, 2): 1, (1, 3): 2}
    insert_petersen(circuits, colours, (0, 2))
    check(circuits, colours, expected_rank=0, expected_groups=2)
    print("Three exact prescribed five-cover replays passed, including two Petersen two-poles.")


if __name__ == "__main__":
    main()
