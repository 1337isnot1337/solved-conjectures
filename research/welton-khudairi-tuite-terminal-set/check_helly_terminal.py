"""Atlas regression for terminal sets; pip install networkx."""
from itertools import combinations
import networkx as nx


def dists(g):
    return dict(nx.all_pairs_shortest_path_length(g))


def ball_helly(g, d):
    balls = sorted({frozenset(v for v in g if d[u][v] <= r)
                    for u in g for r in range(max(d[u].values()) + 1)},
                   key=lambda b: (len(b), sorted(b)))
    h = nx.Graph()
    h.add_nodes_from(range(len(balls)))
    h.add_edges_from((i, j) for i, j in combinations(h, 2) if balls[i] & balls[j])
    return all(frozenset.intersection(*(balls[i] for i in c))
               for c in nx.find_cliques(h))


def weakly_bridged(g, d):
    # Definition via the equivalent vertex (V) and edge (E) conditions.
    for u in g:
        prev = {v: {w for w in g[v] if d[u][w] == d[u][v]-1} for v in g}
        if any(not g.has_edge(x, y) for v in g for x, y in combinations(prev[v], 2)):
            return False
        if any(d[u][x] == d[u][y] and not (prev[x] & prev[y]) for x, y in g.edges):
            return False
    return True


def general_position(s, d):
    for x, y, z in combinations(s, 3):
        a, b, c = sorted((d[x][y], d[y][z], d[z][x]))
        if a + b == c:
            return False
    return True


def no_endpoint(u, s, d):
    return all(abs(d[u][x] - d[u][y]) < d[x][y] for x, y in combinations(s, 2))


def terminal_sets(g, d):
    nodes = frozenset(g)
    for k in range(1, len(nodes) + 1):
        for seq in combinations(sorted(nodes), k):
            s = frozenset(seq)
            if general_position(s, d) and all(not no_endpoint(u, s, d) for u in nodes-s):
                yield s


def check_profiles(g, d):
    # Check the stronger assertion for every intercomponent pair and every split.
    nodes = frozenset(g)
    checked = 0
    for k in range(2, len(nodes) + 1):
        for seq in combinations(sorted(nodes), k):
            s = frozenset(seq)
            if not general_position(s, d):
                continue
            candidates = [u for u in nodes-s if no_endpoint(u, s, d)]
            for x, y in combinations(seq, 2):
                for p in range(1, d[x][y]):
                    assert any(d[u][x] == p and d[u][y] == d[x][y]-p for u in candidates)
                    checked += 1
    return checked


def main():
    h_count = w_count = p_count = profile_count = 0
    weak_nonclique = None
    for g in nx.graph_atlas_g():
        if not g or not nx.is_connected(g):
            continue
        d = dists(g)
        h, w = ball_helly(g, d), weakly_bridged(g, d)
        if not (h or w):
            continue
        cliques = set(map(frozenset, nx.find_cliques(g)))
        terminals = set(terminal_sets(g, d))
        if h:
            assert terminals == cliques
            h_count += 1
            profile_count += check_profiles(g, d)
            for p in range(2, nx.diameter(g)+1):
                power = nx.power(g, p)
                dp = dists(power)
                assert set(terminal_sets(power, dp)) == set(map(frozenset, nx.find_cliques(power)))
                p_count += 1
        if w:
            assert cliques <= terminals
            w_count += 1
            if terminals - cliques and weak_nonclique is None:
                weak_nonclique = list(g.edges), sorted(min(terminals-cliques, key=lambda s: (len(s), sorted(s))))
    print(f"{h_count} Helly graphs, {p_count} Helly power instances, {profile_count} specified geodesic splits")
    print(f"{w_count} weakly bridged graphs; first nonclique terminal set with edge list: {weak_nonclique}")


if __name__ == "__main__":
    main()
