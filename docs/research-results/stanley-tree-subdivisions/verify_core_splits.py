"""Replay the recovery of the labeled reduced core from single-edge cuts."""

from collections import Counter, defaultdict
from itertools import pairwise


def require(condition, message):
    if not condition:
        raise ValueError(message)


def edge_key(left, right):
    return tuple(sorted((left, right)))


def adjacency(edges):
    graph = defaultdict(list)
    for left, right in edges:
        graph[left].append(right)
        graph[right].append(left)
    return graph


def root_tree(graph, root):
    parent = {root: None}
    order = [root]
    for vertex in order:
        for neighbor in graph[vertex]:
            if neighbor == parent[vertex]:
                continue
            require(neighbor not in parent, "cycle in a test tree")
            parent[neighbor] = vertex
            order.append(neighbor)
    require(len(order) == len(graph), "disconnected test tree")
    return parent, order


def labeled_shape(edges, lengths, leaf_count):
    """An independent canonical encoding of the full weighted tree rooted at leaf 0."""
    graph = adjacency(edges)
    parent, order = root_tree(graph, 0)
    signatures = {}
    for vertex in reversed(order):
        if vertex != 0 and len(graph[vertex]) == 1:
            require(0 < vertex < leaf_count, "unlabeled leaf")
            signatures[vertex] = ("leaf", vertex)
        else:
            children = []
            for child in graph[vertex]:
                if parent[child] == vertex:
                    length = lengths.get(edge_key(vertex, child), 1)
                    children.append((length, signatures[child]))
            signatures[vertex] = ("hub", tuple(sorted(children)))
    return signatures[0]


def topologies(leaf_count):
    """Add a leaf at a hub or subdivide an edge. Removing it reverses one of these moves."""
    if leaf_count == 3:
        return [[(0, -1), (1, -1), (2, -1)]]
    unique = {}
    leaf = leaf_count - 1
    for edges in topologies(leaf_count - 1):
        graph = adjacency(edges)
        hub = min(graph) - 1
        candidates = [edges + [(vertex, leaf)] for vertex in graph if vertex < 0]
        for index, (left, right) in enumerate(edges):
            remainder = edges[:index] + edges[index + 1:]
            candidates.append(remainder + [(left, hub), (right, hub), (hub, leaf)])
        for candidate in candidates:
            signature = labeled_shape(candidate, {}, leaf_count)
            unique[signature] = candidate
    return list(unique.values())


def decorate(edges, core_lengths, arm_orders, cap_orders):
    """Expand each internal edge and attach a unary extension ending in a rooted star."""
    graph = adjacency(edges)
    full_edges = []
    next_vertex = len(arm_orders)
    for (left, right), length in core_lengths.items():
        intermediate = list(range(next_vertex, next_vertex + length - 1))
        next_vertex += len(intermediate)
        full_edges.extend(pairwise([left, *intermediate, right]))
    exterior_sides = Counter()
    for leaf, (order, cap_size) in enumerate(zip(arm_orders, cap_orders, strict=True)):
        require(1 <= cap_size <= order and cap_size != 2, "cap must be a leaf or stripped star")
        hub, = graph[leaf]
        chain = list(range(next_vertex, next_vertex + order - cap_size + 1))
        next_vertex += len(chain)
        full_edges.extend(pairwise([hub, *chain]))
        for _ in range(cap_size - 1):
            full_edges.append((chain[-1], next_vertex))
            next_vertex += 1
        exterior_sides[1] += cap_size - 1
        exterior_sides.update(range(cap_size, order + 1))
    return full_edges, exterior_sides


def one_edge_observations(edges):
    """Record the smaller component once per cut, including an exactly equal split."""
    graph = adjacency(edges)
    parent, order = root_tree(graph, next(iter(graph)))
    sizes = dict.fromkeys(graph, 1)
    total = len(graph)
    folded = Counter()
    for vertex in reversed(order[1:]):
        smaller = min(sizes[vertex], total - sizes[vertex])
        folded[smaller] += 1
        sizes[parent[vertex]] += sizes[vertex]
    return total, folded


def remove_exterior(total, folded, exterior_sides):
    oriented = Counter()
    for side, multiplicity in folded.items():
        oriented[side] += multiplicity
        oriented[total - side] += multiplicity
    for side, multiplicity in exterior_sides.items():
        oriented[side] -= multiplicity
        oriented[total - side] -= multiplicity
    require(all(count >= 0 for count in oriented.values()), "exterior subtraction underflow")
    return +oriented


def subset_orders(arm_orders):
    sums = [0]
    for order in arm_orders:
        sums.extend([value + order for value in sums])
    return sums


def reconstruct(arm_orders, core_order, residual):
    """Decode each interval and construct the labeled tree by attaching clusters to parents."""
    sums = subset_orders(arm_orders)
    sorted_sums = sorted(sums)
    require(all(b - a >= core_order for a, b in pairwise(sorted_sums)), "unseparated subsets")
    oriented = Counter()
    for size, count in residual.items():
        candidates = [mask for mask, value in enumerate(sums) if 1 <= size - value < core_order]
        require(len(candidates) == 1, "ambiguous or unidentified oriented cut")
        oriented[candidates[0]] += count
    full_mask = len(sums) - 1
    leaf_count = len(arm_orders)
    for mask, count in oriented.items():
        require(2 <= mask.bit_count() <= leaf_count - 2, "internal split with fewer than two arms")
        require(oriented[full_mask ^ mask] == count, "opposite split multiplicities disagree")
    # Root the reduced tree at leaf zero. Negative identifiers represent internal vertices.
    lengths = {mask: count for mask, count in oriented.items() if not mask & 1}
    top = full_mask ^ 1
    clusters = {top, *lengths, *(1 << i for i in range(1, leaf_count))}
    edges = [(0, -top)]
    internal_lengths = {}
    for child in sorted(clusters - {top}):
        ancestors = [mask for mask in clusters if mask != child and mask & child == child]
        parent = min(ancestors, key=int.bit_count)
        require(all(parent & mask == parent for mask in ancestors), "nonlaminar split family")
        if child.bit_count() == 1:
            edges.append((child.bit_length() - 1, -parent))
        else:
            edges.append((-child, -parent))
            internal_lengths[edge_key(-child, -parent)] = lengths[child]
    require(1 + sum(internal_lengths.values()) == core_order, "wrong total core length")
    return edges, internal_lengths


def check_model(edges, core_lengths, arm_orders, cap_orders):
    full_edges, exterior_sides = decorate(edges, core_lengths, arm_orders, cap_orders)
    total, observed = one_edge_observations(full_edges)
    core_order = total - sum(arm_orders)
    residual = remove_exterior(total, observed, exterior_sides)
    recovered, lengths = reconstruct(arm_orders, core_order, residual)
    leaf_count = len(arm_orders)
    require(labeled_shape(recovered, lengths, leaf_count) == labeled_shape(edges, core_lengths, leaf_count),
            "reconstructed adjacency, leaf placement or internal edge length differs")
    return total


def equal_half_controls():
    edges = [(0, -1), (1, -1), (-1, -2), (2, -2), (3, -2)]
    lengths = {(-2, -1): 1}
    caps = [1, 1, 1, 1]
    # The longest exterior arm bisects the tree. Both oriented copies must be subtracted.
    orders = [2, 4, 8, 16]
    whole, exterior = decorate(edges, lengths, orders, caps)
    total, observed = one_edge_observations(whole)
    require(observed[total // 2] == 1 and exterior[total // 2] == 1, "missing exterior bisection")
    check_model(edges, lengths, orders, caps)
    # A balanced internal cut survives twice and has six indistinguishable two-arm witnesses.
    orders = [5, 5, 5, 5]
    whole, exterior = decorate(edges, lengths, orders, caps)
    total, observed = one_edge_observations(whole)
    residual = remove_exterior(total, observed, exterior)
    require(observed[11] == 1 and residual == {11: 2}, "balanced internal orientations lost")
    require(subset_orders(orders).count(10) == 6, "expected six candidate pairs without spacing")


def main():
    models = 0
    vertices = 0
    for leaf_count, expected in [(3, 1), (4, 4), (5, 26), (6, 236)]:
        skeletons = topologies(leaf_count)
        require(len(skeletons) == expected, "unexpected number of labeled reduced trees")
        for edges in skeletons:
            internal = sorted(edge_key(v, w) for v, w in edges if v < 0 and w < 0)
            lengths = {edge: 1 + index % 3 for index, edge in enumerate(internal)}
            core_order = 1 + sum(lengths.values())
            offsets = [core_order * (1 << i) for i in range(leaf_count)]
            common = sum(offsets) + 3 * leaf_count + 4
            orders = [common + offset for offset in offsets]
            caps = [(1, 3, 4, 5)[i % 4] for i in range(leaf_count)]
            cutoff = leaf_count * (max(caps) - 1)
            require(max(orders) + cutoff <= sum(orders[:2]), "test outside balanced size regime")
            vertices += check_model(edges, lengths, orders, caps)
            models += 1
    equal_half_controls()
    print(f"{models} labeled reduced trees reconstructed, {vertices} full vertices, "
          "two equal-half orientation controls passed")


if __name__ == "__main__":
    main()
