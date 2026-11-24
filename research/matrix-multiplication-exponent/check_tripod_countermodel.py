#!/usr/bin/env python3
"""Exact rational checks for the tripod scalar countermodel.

The charge formula is compared with independent quadratic optimization
over every probability-support face on a seven-point tripod. Retraction
checks use one common random map for all subsets in each test law.
No tensor spectral point or unrestricted tensor monotonicity is tested.
"""

from fractions import Fraction as F
from itertools import combinations_with_replacement, product


R = F(3, 8)
O = (-1, F(0))
ENDPOINTS = tuple((arm, R) for arm in range(3))
POINTS = (O,) + tuple((arm, radius) for arm in range(3) for radius in (R / 2, R))


def distance(x, y):
    arm_x, radius_x = x
    arm_y, radius_y = y
    return abs(radius_x - radius_y) if arm_x == arm_y else radius_x + radius_y


def charge_formula(points):
    points = tuple(set(points))
    if not points:
        return F(0)
    occupied_arms = {arm for arm, radius in points if radius}
    has_center = any(radius == 0 for _, radius in points)
    if len(occupied_arms) == 1 and not has_center:
        radii = [radius for _, radius in points]
        return max(radii) - min(radii)
    radii = [max((radius for arm, radius in points if arm == i), default=F(0)) for i in range(3)]
    a, b, c = radii
    denominator = a * b + a * c + b * c
    harmonic_term = a * b * c / denominator if denominator else F(0)
    return a + b + c - harmonic_term


def solve_square(matrix, rhs):
    """Rational Gaussian elimination, independent of the charge formula."""
    rows = [[F(x) for x in row] + [F(y)] for row, y in zip(matrix, rhs)]
    size = len(rows)
    for col in range(size):
        pivot = next((i for i in range(col, size) if rows[i][col]), None)
        if pivot is None:
            raise ArithmeticError("Singular stationary-point system")
        rows[col], rows[pivot] = rows[pivot], rows[col]
        factor = rows[col][col]
        rows[col] = [x / factor for x in rows[col]]
        for i in range(size):
            if i != col and rows[i][col]:
                factor = rows[i][col]
                rows[i] = [x - factor * y for x, y in zip(rows[i], rows[col])]
    return tuple(row[-1] for row in rows)


def exact_face_maxima(points):
    """Enumerate every support face and solve its quadratic stationarity equations.

    Every global maximum is stationary on the relative interior of its
    minimal support face. All these systems are nonsingular for the test
    configuration. Thus maximizing over their feasible solutions is exact.
    """
    n = len(points)
    result = [F(0)] * (1 << n)
    feasible_faces = 0
    for mask in range(1, 1 << n):
        ids = [i for i in range(n) if mask >> i & 1]
        size = len(ids)
        metric = [[distance(points[i], points[j]) for j in ids] for i in ids]
        matrix = [row + [F(-1)] for row in metric] + [[F(1)] * size + [F(0)]]
        solution = solve_square(matrix, [F(0)] * size + [F(1)])
        mu = solution[:-1]
        if min(mu) >= 0:
            feasible_faces += 1
            value = 2 * sum(mu[i] * mu[j] * metric[i][j] for i in range(size) for j in range(size))
            result[mask] = value
        for i in ids:
            result[mask] = max(result[mask], result[mask ^ (1 << i)])
    return result, feasible_faces


def barycenter(points, weights):
    moments = [F(0), F(0), F(0)]
    for (arm, radius), weight in zip(points, weights):
        if radius:
            moments[arm] += weight * radius
    total = sum(moments)
    positive = [(arm, 2 * moment - total) for arm, moment in enumerate(moments) if 2 * moment > total]
    assert len(positive) <= 1
    return positive[0] if positive else O


def check_joint_law(first, second, probability):
    weights = (probability, 1 - probability)
    new_points = ENDPOINTS + tuple(
        barycenter((ENDPOINTS[first[i]], ENDPOINTS[second[i]]), weights)
        for i in range(2)
    )
    maps = ((0, 1, 2) + first, (0, 1, 2) + second)
    checks = 0
    for mask in range(1, 1 << 5):
        ids = [i for i in range(5) if mask >> i & 1]
        lhs = charge_formula(new_points[i] for i in ids)
        rhs = sum(
            weight * charge_formula(ENDPOINTS[mapping[i]] for i in ids)
            for weight, mapping in zip(weights, maps)
        )
        assert lhs <= rhs, (first, second, probability, mask, lhs, rhs)
        checks += 1
    assert charge_formula(new_points) == 1
    return checks


def main():
    optimized, feasible = exact_face_maxima(POINTS)
    for mask in range(1 << len(POINTS)):
        subset = [point for i, point in enumerate(POINTS) if mask >> i & 1]
        assert optimized[mask] == charge_formula(subset), (mask, optimized[mask], charge_formula(subset))

    submodular_checks = 0
    for left in range(1 << len(POINTS)):
        for right in range(1 << len(POINTS)):
            if left & right:
                assert optimized[left] + optimized[right] >= optimized[left | right] + optimized[left & right]
                submodular_checks += 1

    assignments = tuple(product(range(3), repeat=2))
    equal_laws = tuple(combinations_with_replacement(assignments, 2))
    equal_checks = sum(check_joint_law(first, second, F(1, 2)) for first, second in equal_laws)
    # Unequal weights exercise interior barycenters instead of only center/endpoints.
    unequal_checks = sum(check_joint_law(first, second, F(1, 3)) for first, second in product(assignments, repeat=2))

    assert charge_formula(ENDPOINTS) == 1
    assert sum(distance(ENDPOINTS[i], ENDPOINTS[(i + 1) % 3]) for i in range(3)) == F(9, 4)
    flat = (O, (0, F(1)), (0, F(1)))
    assert charge_formula(flat) == 1
    assert sorted(distance(flat[i], flat[j]) for i in range(3) for j in range(i + 1, 3)) == [0, 1, 1]

    print(f"All 128 seven-point subset charges match independent exact face optimization ({feasible} feasible stationary faces).")
    print(f"Intersecting submodularity: all {submodular_checks} labeled subset pairs checked exactly.")
    print(f"Coherent retraction extension: {len(equal_laws)} equal-weight joint laws, {equal_checks} subset inequalities.")
    print(f"Interior barycenter extension: 81 one-third/two-thirds joint laws, {unequal_checks} subset inequalities.")
    print("Original full charge=1 and perimeter=9/4; flattening test has charge1 and distances(1,1,0).")


if __name__ == "__main__":
    main()
