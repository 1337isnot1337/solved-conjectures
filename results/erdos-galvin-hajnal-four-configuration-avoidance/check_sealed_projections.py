"""Finite smoke check for the sealed-page projection in COHEN-PRODUCT.md."""
from functools import lru_cache
from itertools import combinations


@lru_cache(maxsize=None)
def pages(vertices, graph):
    result = {pair: [] for pair in graph}
    for a, b, c in combinations(vertices, 3):
        pairs = ((a, b), (a, c), (b, c))
        if all(pair in graph for pair in pairs):
            for pair, third in zip(pairs, (c, b, a)):
                result[pair].append(third)
    return result


def valid(vertices, graph):
    return all(
        len(thirds) < 2 or all(z > pair[1] for z in thirds)
        for pair, thirds in pages(vertices, graph).items()
    )


def induced(vertices, graph):
    return frozenset(pair for pair in graph if all(x in vertices for x in pair))


def extends(old_vertices, old_graph, vertices, graph):
    return (
        set(old_vertices) <= set(vertices)
        and old_graph == induced(old_vertices, graph)
        and all(
            [z for z in pages(vertices, graph)[pair] if z < pair[1]]
            == [z for z in thirds if z < pair[1]]
            for pair, thirds in pages(old_vertices, old_graph).items()
        )
    )


@lru_cache(maxsize=None)
def graph_states(vertices):
    pairs = tuple(combinations(vertices, 2))
    return tuple(
        graph
        for mask in range(1 << len(pairs))
        if valid(
            vertices,
            graph := frozenset(pair for i, pair in enumerate(pairs) if mask >> i & 1),
        )
    )


def main():
    count = 0
    for old_vertices in combinations(range(7), 4):
        for cut in range(1, 7):
            root = tuple(v for v in old_vertices if v < cut)
            if not root or len(root) == 4:
                continue
            for inner_vertices in combinations(range(cut), min(cut, 4)):
                if not set(root) <= set(inner_vertices):
                    continue
                vertices = tuple(sorted(set(old_vertices) | set(inner_vertices)))
                for old_graph in graph_states(old_vertices):
                    restricted = induced(root, old_graph)
                    for inner_graph in graph_states(inner_vertices):
                        if not extends(root, restricted, inner_vertices, inner_graph):
                            continue
                        union = old_graph | inner_graph
                        assert valid(vertices, union)
                        assert extends(old_vertices, old_graph, vertices, union)
                        assert extends(inner_vertices, inner_graph, vertices, union)
                        count += 1
    assert count == 141_480
    print(f"Checked {count:,} sealed projections with overlapping supports.")


if __name__ == "__main__":
    main()
