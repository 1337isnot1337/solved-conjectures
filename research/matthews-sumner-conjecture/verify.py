"""Replay all ten local demands directly on cofacial cubic fragments."""

from itertools import combinations


def panel(order, step):
    """Remove a spoke and its two ends from a prism or the dodecahedron."""
    edges = set()
    for i in range(order):
        edges.add(tuple(sorted((i, (i + 1) % order))))
        edges.add(tuple(sorted((order + i, order + (i + step) % order))))
        edges.add((i, order + i))
    internal = sorted(edge for edge in edges if not {0, order}.intersection(edge))
    return internal, (1, order + step, 2 * order - step, order - 1)


def cubic_cap(edges, ports):
    added = max(max(edge) for edge in edges) + 1
    cap = [added + i for i in range(4)]
    return [*edges, *zip(ports, cap), *zip(cap, cap[1:] + cap[:1])]


def check_edge_connectivity(edges):
    """No deletion of at most three edges leaves two edgeful components."""
    for removed in combinations(edges, 3):
        adjacency = {}
        for edge in edges:
            if edge not in removed:
                u, v = edge
                adjacency.setdefault(u, []).append(v)
                adjacency.setdefault(v, []).append(u)
        stack = [next(iter(adjacency))]
        seen = set(stack)
        while stack:
            for v in adjacency[stack.pop()]:
                if v not in seen:
                    seen.add(v)
                    stack.append(v)
        assert seen == adjacency.keys(), removed


def vertex_sets_of_paths(adjacency, u, v):
    stack = [(u, 1 << u)]
    reachable = set()
    while stack:
        last, visited = stack.pop()
        if last == v:
            reachable.add(visited)
            continue
        for neighbor in adjacency[last]:
            if not visited & (1 << neighbor):
                stack.append((neighbor, visited | (1 << neighbor)))
    return reachable


def check_demands(edges, ports):
    adjacency = {}
    for u, v in edges:
        adjacency.setdefault(u, []).append(v)
        adjacency.setdefault(v, []).append(u)
    edge_masks = [(1 << u) | (1 << v) for u, v in edges]
    paths = {
        (i, j): vertex_sets_of_paths(adjacency, ports[i], ports[j])
        for i, j in combinations(range(4), 2)
    }
    all_ports = sum(1 << port for port in ports)

    for (i, j), sets in paths.items():
        # Adjacent endpoints require all ports. Opposite endpoints require either third port.
        required = (all_ports,)
        if j - i == 2:
            required = tuple(all_ports ^ (1 << ports[k]) for k in range(4) if k not in (i, j))
        for mask in required:
            assert any(
                nodes & mask == mask and all(nodes & edge for edge in edge_masks)
                for nodes in sets
            ), (i, j, mask)

    for first, second in (((0, 1), (2, 3)), ((0, 3), (1, 2))):
        assert any(
            not left & right and all((left | right) & edge for edge in edge_masks)
            for left in paths[first]
            for right in paths[second]
        ), (first, second)


def main():
    cases = [(order, 1) for order in range(3, 14)] + [(10, 2)]
    for order, step in cases:
        edges, ports = panel(order, step)
        check_edge_connectivity(cubic_cap(edges, ports))
        check_demands(edges, ports)
    print(f"{10 * len(cases)} exact local demands passed across {len(cases)} capped fragments.")


if __name__ == "__main__":
    main()
