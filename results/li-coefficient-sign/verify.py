"""Reproduce the counterexample to Li's non-spider sign prediction (Python 3)."""
from collections import Counter
from itertools import combinations
from fractions import Fraction
from math import prod


# Each sequence lists consecutive vertices on a path. This is the edge list.
PATHS = [(0, 1), (0, 2, 3), (0, *range(4, 15)), (8, 15), (0, *range(16, 31))]
N = 31
EDGES = [(u, v) for path in PATHS for u, v in zip(path, path[1:])]
ADJ = [set() for _ in range(N)]
for u, v in EDGES:
    ADJ[u].add(v)
    ADJ[v].add(u)


def partitions(total, minimum=1):
    if total == 0:
        yield ()
    for first in range(minimum, total + 1):
        for tail in partitions(total - first, first):
            yield (first,) + tail


def cut_counts():
    """Edge-cut DP. A state records the root size and all detached sizes."""
    states = [Counter({(1, ()): 1}) for _ in range(N)]
    witness = [{(1, ()): 0} for _ in range(N)]
    # Descending child labels process every descendant before its parent.
    for bit, (parent, child) in sorted(enumerate(EDGES), key=lambda x: -x[1][1]):
        merged, masks = Counter(), {}
        for (a, closed_a), left_count in states[parent].items():
            left_mask = witness[parent][a, closed_a]
            for (b, closed_b), right_count in states[child].items():
                closed = tuple(sorted(closed_a + closed_b))
                ways = left_count * right_count
                mask = left_mask | witness[child][b, closed_b]
                keep = (a + b, closed)
                cut = (a, tuple(sorted(closed + (b,))))
                merged[keep] += ways
                merged[cut] += ways
                masks.setdefault(keep, mask)
                masks.setdefault(cut, mask | (1 << bit))
        states[parent], witness[parent] = merged, masks
    counts, examples = Counter(), {}
    for (a, closed), count in states[0].items():
        kind = tuple(sorted(closed + (a,)))
        counts[kind] += count
        examples.setdefault(kind, witness[0][a, closed])
    return counts, examples


def actual_components(mask):
    """Rebuild the components of one cut using disjoint sets."""
    representative = list(range(N))

    def find(v):
        while representative[v] != v:
            v = representative[v]
        return v

    for bit, (u, v) in enumerate(EDGES):
        if not mask & (1 << bit):
            representative[find(v)] = find(u)
    return tuple(sorted(Counter(find(i) for i in range(N)).values()))


def triple_blocks():
    """A forest has at most one perfect matching. Match leaves first."""
    answer = []
    for center in range(N):
        for v, w in combinations(sorted(ADJ[center]), 2):
            rem = set(range(N)) - {center, v, w}
            while rem:
                leaf = next(i for i in rem if len(ADJ[i] & rem) <= 1)
                mates = ADJ[leaf] & rem
                if not mates:
                    break
                rem -= mates | {leaf}
            if not rem:
                answer.append(tuple(sorted((v, center, w))))
    return sorted(answer)


def multiply(a, b):
    result = Counter()
    for i, u in a.items():
        for j, v in b.items():
            result[i + j] += u * v
    return result


def e_coefficients(counts):
    """Evaluate the power-sum expansion with e2=1, e3=t, all others zero."""
    powers = [{0: 3}, {}, {0: -2}]
    for k in range(3, N + 1):
        # Newton sums for the three formal roots of z^3 + z - t.
        current = Counter({i: -u for i, u in powers[k - 2].items()})
        current.update({i + 1: u for i, u in powers[k - 3].items()})
        powers.append(current)
    result = Counter()
    for kind, count in counts.items():
        term = {0: (-1)**(N-len(kind)) * count}
        for size in kind:
            term = multiply(term, powers[size])
        result.update(term)
    return {i: u for i, u in result.items() if u}


def coloring_value(weights):
    """Direct proper three-coloring recurrence, independent of edge cuts."""
    def visit(v, parent):
        children = [visit(w, v) for w in ADJ[v] if w != parent]
        return [x * prod(sum(c) - c[i] for c in children)
                for i, x in enumerate(weights)]

    return sum(visit(0, -1))


def main():
    assert sorted(v for _, v in EDGES) == list(range(1, N))
    assert all(u < v for u, v in EDGES)
    assert [(i, len(a)) for i, a in enumerate(ADJ) if len(a) > 2] == [(0, 4), (8, 3)]
    counts, examples = cut_counts()
    expected = set(partitions(N))
    assert len(expected) == 6842 and set(counts) == expected
    assert sum(counts.values()) == 2**30
    assert all(actual_components(examples[p]) == p for p in expected)
    triples = triple_blocks()
    assert len(triples) == counts[(2,)*14 + (3,)] == 8
    coeffs = e_coefficients(counts)
    assert coeffs == {1: 29, 3: 83, 5: -6304, 7: -6800, 9: -8384}

    # Five values determine the five coefficients: after dividing by e2^14 e3
    # the right side is a polynomial of degree 4 in e3^2 / e2^3.
    arguments = set()
    for t in (1, 2, 3, 4, 5):
        colors = (1, t, -1-t)
        e2 = -(1+t+t*t)
        e3 = prod(colors)
        value = sum(c * e3**b * e2**((N-3*b)//2) for b, c in coeffs.items())
        assert coloring_value(colors) == value
        arguments.add(Fraction(e3**2, e2**3))
    assert len(arguments) == 5
    print("All 6842 partition types certified by explicit cuts; 2^30 cuts counted.")
    print("Triples with matching complement:", triples)
    print("e-coefficients by exponent of e3:", sorted(coeffs.items()))
    print("Five independent exact coloring evaluations agree.")


if __name__ == "__main__":
    main()
