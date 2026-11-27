"""Check the finite-shadow load bound and sharp cone examples with exact arithmetic."""
from collections import Counter
from fractions import Fraction
from itertools import combinations
from math import ceil, comb


def capacity_for(coefficient):
    """A hereditary coefficient strictly less than one bounds the pair load."""
    return ceil(max(2 * coefficient, coefficient / (1 - coefficient)))


def select_pairs(triples, capacity):
    """Exhaustively seek two distinct incident pairs per triple within the load."""
    alternatives = [list(combinations(combinations(triple, 2), 2)) for triple in triples]
    selected = []
    usage = Counter()

    def choose(index):
        if index == len(triples):
            return True
        for first, second in alternatives[index]:
            if capacity in (usage[first], usage[second]):
                continue
            selected.append((first, second))
            usage[first] += 1
            usage[second] += 1
            if choose(index + 1):
                return True
            usage[first] -= 1
            usage[second] -= 1
            selected.pop()
        return False

    assert choose(0), (triples, capacity)
    return selected


def check_matchings(triples, selected, capacity):
    """Greedy proper edge coloring of the selected graph on pair vertices."""
    palettes = [set() for _ in range(2 * capacity - 1)]
    for triple, (first, second) in zip(triples, selected):
        assert first != second and set(first) | set(second) == set(triple)
        available = next(part for part in palettes if first not in part and second not in part)
        available.update((first, second))


def check_labelled_host(size):
    pairs = list(combinations(range(size), 2))
    triples = list(combinations(range(size), 3))
    pair_index = {pair: i for i, pair in enumerate(pairs)}
    triple_shadows = [sum(1 << pair_index[p] for p in combinations(t, 2)) for t in triples]
    count = 1 << len(triples)
    shadows = [0] * count
    density = [Fraction(0)] * count
    general = 0
    two_thirds = 0
    for family in range(1, count):
        low_bit = family & -family
        shadows[family] = shadows[family ^ low_bit] | triple_shadows[low_bit.bit_length() - 1]
        indices = [i for i in range(len(triples)) if family & (1 << i)]
        own_ratio = Fraction(len(indices), shadows[family].bit_count())
        ratios_after_deletion = [density[family ^ (1 << i)] for i in indices]
        density[family] = max(own_ratio, *ratios_after_deletion)
        if density[family] >= 1:
            continue
        required = capacity_for(density[family])
        edges = [triples[i] for i in indices]
        assignment = select_pairs(edges, required)
        check_matchings(edges, assignment, required)
        general += 1
        if density[family] <= Fraction(2, 3):
            assert required <= 2
            two_thirds += 1
    return general, two_thirds


def sharp_cones():
    """A cone on the complete graph of order n requires ceil((n−1)/2) load."""
    checks = 0
    for n in range(3, 65):
        # Any subgraph on u vertices has at most u*(n-1)/2 edges.
        # Its cone has one private pair per triple and one spoke per used vertex.
        # The full clique realizes the exact hereditary coefficient.
        coefficient = Fraction(n - 1, n + 1)
        bound = capacity_for(coefficient)
        assert bound == ceil(Fraction(comb(n, 2), n))
        uses = Counter()
        for left, right in combinations(range(n), 2):
            # Assign the private pair and the spoke at the tail of a balanced
            # cyclic orientation, breaking antipodal ties towards larger labels.
            if 2 * (right - left) <= n:
                uses[left] += 1
            else:
                uses[right] += 1
        assert max(uses.values()) == bound
        checks += 1
    return checks


def sharp_coefficient_thresholds():
    """Adding one edge to an even-regular circulant crosses one load threshold."""
    checks = 0
    for load in range(2, 7):
        for n in range(2 * load + 1, 2 * load + 4):
            vertices = range(n)
            graph = {tuple(sorted((v, (v + offset) % n)))
                     for v in vertices for offset in range(1, load)}
            new_edge = (0, load)
            assert new_edge not in graph
            graph.add(new_edge)
            neighbor_masks = [0] * n
            for a, b in graph:
                neighbor_masks[a] |= 1 << b
                neighbor_masks[b] |= 1 << a
            densities = [0] * (1 << n)
            for used in range(1, 1 << n):
                bit = used & -used
                v = bit.bit_length() - 1
                retained = used ^ bit
                densities[used] = densities[retained] + (neighbor_masks[v] & retained).bit_count()
                if used != (1 << n) - 1:
                    assert densities[used] <= (load - 1) * used.bit_count()
            full_edges = densities[-1]
            assert full_edges == (load - 1) * n + 1
            assert capacity_for(Fraction(full_edges, full_edges + n)) == load
            checks += 1
    return checks


if __name__ == '__main__':
    by_size = [check_labelled_host(n) for n in (3, 4, 5)]
    print(f'{sum(general for general, _ in by_size)} systems with hereditary shadow ratio below one')
    print(f'{sum(special for _, special in by_size)} systems satisfying the two-thirds hypothesis')
    print(f'{sharp_cones()} cone examples attaining the predicted finite load')
    print(f'{sharp_coefficient_thresholds()} perturbed circulants with sharp hereditary ratios')
