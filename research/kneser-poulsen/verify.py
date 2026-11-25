"""Exact controls for the wall comparison and lifted configuration."""

from fractions import Fraction
from itertools import combinations
from math import comb
from random import Random


def affine_rank(points):
    origin, *others = points
    rows = [[Fraction(x - y) for x, y in zip(point, origin)] for point in others]
    pivots = {}
    for row in rows:
        for column in range(len(row)):
            value = row[column]
            if not value:
                continue
            if column not in pivots:
                pivots[column] = [entry / value for entry in row]
                break
            row = [entry - value * pivot for entry, pivot in zip(row, pivots[column])]
    return len(pivots)


def squared_distance(left, right):
    return sum((x - y) ** 2 for x, y in zip(left, right))


def cluster_configuration(dim):
    labels = []
    for axis in range(1, dim):
        for index in range(dim + 4):
            offset = Fraction(index, 4 * (dim + 3))
            p, q = [0] * dim, [0] * dim
            p[0], q[0] = 10 * (axis + 1), 20 * (axis + 1)
            p[axis], q[axis] = offset, offset + offset ** 2
            labels.append((tuple(p), tuple(q), Fraction(1)))

    for axis in range(1, dim - 1):
        x = 10 * (axis + 1) + 5
        labels.append(((x,) + (0,) * (dim - 1),
                       (2 * x,) + (0,) * (dim - 1), Fraction(9, 2)))
    return labels


def check_cluster_lifts():
    checked_pairs = 0
    for dim in range(4, 9):
        labels = cluster_configuration(dim)
        overlap = [set() for _ in labels]
        for i, j in combinations(range(len(labels)), 2):
            p_i, q_i, r_i = labels[i]
            p_j, q_j, r_j = labels[j]
            initial = squared_distance(p_i, p_j)
            assert initial <= squared_distance(q_i, q_j)
            if initial <= (r_i + r_j) ** 2:
                overlap[i].add(j)
                overlap[j].add(i)
            checked_pairs += 1

        paired = [p + q for p, q, _ in labels]
        assert affine_rank(paired) == 2 * dim - 1
        for i, neighbors in enumerate(overlap):
            assert neighbors
            for j in neighbors:
                if i < j:
                    possible = {i, j} | (neighbors & overlap[j])
                    assert affine_rank([paired[a] for a in possible]) <= 3
        assert all(squared_distance(labels[i][0], (20,) + (0,) * (dim - 1)) <= 1
                   for i in range(dim + 4))
    return checked_pairs


def check_radical_foot():
    rng = Random(599)
    for _ in range(500):
        centers = [tuple(rng.randrange(-9, 10) for _ in range(5)) for _ in range(3)]
        i, j, a = centers
        if i == j:
            continue
        r_i, r_j, r_a = [rng.randrange(1, 25) for _ in range(3)]
        d2 = squared_distance(i, j)
        fraction = Fraction(d2 + r_i - r_j, 2 * d2)
        foot = tuple(x + fraction * (y - x) for x, y in zip(i, j))
        power_i = squared_distance(foot, i) - r_i
        assert power_i == squared_distance(foot, j) - r_j
        difference = ((1 - fraction) * squared_distance(a, i)
                      + fraction * squared_distance(a, j) - fraction * d2 + r_i - r_a)
        assert difference == squared_distance(foot, a) - r_a - power_i


def check_negative_walls():
    for order in range(2, 17):
        width = 4 * order - 1
        b = 2 + order * width
        a_squared = b ** 2 - 2 * b
        r_squared = a_squared - (order - 2) * width
        assert r_squared > 0
        assert Fraction(b ** 2 - a_squared, 2 * b) == 1

        cap_squared = [r_squared - a_squared + k * width for k in range(order + 1)]
        assert max(cap_squared[:-2]) <= 0
        assert min(cap_squared[-2:]) >= width
        cube = 2 ** width
        volumes = [0] * (order - 1) + [cube, cube]
        difference = sum((-1) ** (order - k) * comb(order, k) * value
                         for k, value in enumerate(volumes))
        assert difference == -(order - 1) * cube


if __name__ == "__main__":
    print("Cluster endpoint pairs checked:", check_cluster_lifts())
    check_radical_foot()
    print("Radical-foot identities checked on 500 seeded inputs")
    check_negative_walls()
    print("Negative cube-wall differences checked for 15 derivative orders")
