#!/usr/bin/env python3
"""Finite exact audit of the shifted-tree comparison lemmas.

This checks combinatorial boundary cases; it is not a proof for all n,
a CMI computation, Lean verification, or a prize-completion certificate.
"""

import argparse
import itertools
import json


def tree_paths(size):
    paths = [[] for _ in range(size)]

    def split(lo, hi, depth):
        if hi - lo == 1:
            return
        mid = (lo + hi) // 2
        for leaf in range(lo, hi):
            paths[leaf].append((lo, mid, hi, depth))
        split(lo, mid, depth + 1)
        split(mid, hi, depth + 1)

    split(0, size, 0)
    return paths


def cycle(features, infinity):
    ordered = list(features) + [infinity]
    return [(x, 1) for x in ordered] + [(x, -1) for x in reversed(ordered)]


def losses(features, labels, thresholds):
    return [sum(int((x >= t) != bool(labels[x])) for x in features)
            for t, orientation in thresholds]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--max-n', type=int, default=6)
    args = parser.parse_args()
    totals = dict(sample_pairs=0, aligned_leaves=0, inactive_nodes=0,
                  aligned_nodes=0, maximum_leaf_cost_difference=0,
                  maximum_child_gap_difference=0)
    per_n = []
    for n in range(1, args.max_n + 1):
        universe = list(range(n + 1))
        infinity = n + 1
        size = 2 * (n + 1)
        paths = tree_paths(size)
        structures = []
        for u, v in itertools.combinations(universe, 2):
            z0 = [x for x in universe if x != v]
            z1 = [x for x in universe if x != u]
            c0, c1 = cycle(z0, infinity), cycle(z1, infinity)
            common = set(c0) & set(c1)
            alignments = []
            for anchor in sorted(common):
                p0, p1 = c0.index(anchor), c1.index(anchor)
                # Position the same common anchor at each abstract tree leaf.
                for leaf, path in enumerate(paths):
                    theta0, theta1 = (p0 - leaf) % size, (p1 - leaf) % size
                    seq0 = [c0[(h + theta0) % size] for h in range(size)]
                    seq1 = [c1[(h + theta1) % size] for h in range(size)]
                    nodes = []
                    inactive_seen = False
                    for lo, mid, hi, depth in path:
                        assert hi - lo <= (size + 2**depth - 1) // 2**depth
                        active = (any(x == u for x, _ in seq0[lo:hi]) or
                                  any(x == v for x, _ in seq1[lo:hi]))
                        assert not (inactive_seen and active)
                        if not active:
                            assert seq0[lo:hi] == seq1[lo:hi]
                            inactive_seen = True
                        nodes.append((lo, mid, hi, active))
                    alignments.append((theta0, theta1, nodes))
            structures.append((z0, z1, c0, c1, alignments))
        before = dict(totals)
        for labels in itertools.product((0, 1), repeat=n + 1):
            for z0, z1, c0, c1, alignments in structures:
                totals['sample_pairs'] += 1
                l0, l1 = losses(z0, labels, c0), losses(z1, labels, c1)
                for theta0, theta1, nodes in alignments:
                    a0 = l0[theta0:] + l0[:theta0]
                    a1 = l1[theta1:] + l1[:theta1]
                    maximum = max(abs(x - y) for x, y in zip(a0, a1))
                    assert maximum <= 3
                    totals['maximum_leaf_cost_difference'] = max(
                        totals['maximum_leaf_cost_difference'], maximum)
                    totals['aligned_leaves'] += size
                    for lo, mid, hi, active in nodes:
                        d0 = min(a0[lo:mid]) - min(a0[mid:hi])
                        d1 = min(a1[lo:mid]) - min(a1[mid:hi])
                        difference = abs(d0 - d1)
                        assert difference <= 8
                        totals['maximum_child_gap_difference'] = max(
                            totals['maximum_child_gap_difference'], difference)
                        totals['aligned_nodes'] += 1
                        if not active:
                            assert len({a0[h] - a1[h] for h in range(lo, hi)}) == 1
                            assert d0 == d1
                            totals['inactive_nodes'] += 1
        per_n.append({'n': n, 'sample_pairs': totals['sample_pairs'] - before['sample_pairs'],
                      'aligned_nodes': totals['aligned_nodes'] - before['aligned_nodes'],
                      'inactive_nodes': totals['inactive_nodes'] - before['inactive_nodes']})
    print(json.dumps({'result': 'PASS', 'max_n': args.max_n, 'totals': totals,
                      'per_n': per_n,
                      'scope': 'Exact finite audit only; the uniform theorem needs its written proof.'}, indent=2))


if __name__ == '__main__':
    main()
