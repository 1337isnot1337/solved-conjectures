"""Exact finite checks for common circle sides, fiber counts and the two disk Jacobians."""

from collections import Counter, defaultdict
from fractions import Fraction
from itertools import combinations, permutations
from math import gcd


def require(condition, message):
    if not condition:
        raise ValueError(message)


def normalized_line(a, b, c):
    divisor = gcd(gcd(a, b), c)
    if a < 0 or (a == 0 and b < 0):
        divisor = -divisor
    return a // divisor, b // divisor, c // divisor


def pair_lines(left, right):
    x, y = left
    u, v = right
    a, b = u - x, v - y
    carrier = normalized_line(b, -a, b * x - a * y)
    axis = normalized_line(2 * a, 2 * b, u*u + v*v - x*x - y*y)
    return carrier, axis


def check_carriers():
    points = [(x, y) for x in range(5) for y in range(5)]
    pairs = {pair: pair_lines(*pair) for pair in combinations(points, 2)}
    carrier_counts = defaultdict(Counter)
    for carrier, axis in pairs.values():
        carrier_counts[axis][carrier] += 1
    chosen = {axis: min(c for c, count in counts.items() if count == max(counts.values()))
              for axis, counts in carrier_counts.items()}
    line_sites = {line: {point for point in points if line[0]*point[0] + line[1]*point[1] == line[2]}
                  for line in set(chosen.values())}
    triangles = []
    for x, y in points:
        shells = defaultdict(list)
        for u, v in points:
            if (u, v) != (x, y):
                shells[(u-x)**2 + (v-y)**2].append((u, v))
        for bases in shells.values():
            triangles.extend(combinations(bases, 3))

    witnessed = 0
    for cutoff in [2, 3, 4, 5]:
        retained = {line for line, sites in line_sites.items() if len(sites) >= cutoff}
        intersections = {p for p in points if sum(p in line_sites[line] for line in retained) >= 2}
        require(len(intersections) <= len(retained)*(len(retained)-1)//2, "intersection bound")
        for triangle in triangles:
            marked = []
            for pair in combinations(triangle, 2):
                line, axis = pairs[pair]
                if line == chosen[axis] and line in retained:
                    marked.append((set(pair), line))
            for (side, line), (other, second_line) in combinations(marked, 2):
                shared = side & other
                require(line != second_line and len(shared) == 1, "distinct lines at shared base")
                require(shared <= intersections, "shared point missing from carrier intersections")
                witnessed += 1
    require(witnessed > 0, "missing two-side test")
    return len(triangles), witnessed


def determinant(rows):
    matrix = [[Fraction(value) for value in row] for row in rows]
    answer = Fraction(1)
    for i in range(len(matrix)):
        pivot = next((j for j in range(i, len(matrix)) if matrix[j][i]), None)
        if pivot is None:
            return 0
        if pivot != i:
            matrix[pivot], matrix[i] = matrix[i], matrix[pivot]
            answer = -answer
        value = matrix[i][i]
        answer *= value
        for j in range(i + 1, len(matrix)):
            factor = matrix[j][i] / value
            for col in range(i + 1, len(matrix)):
                matrix[j][col] -= factor * matrix[i][col]
    return answer


def cross(a, b):
    return a[0] * b[1] - a[1] * b[0]


def check_models():
    directions = []
    for t in map(Fraction, [-4, -2, -1, 0, 1, 2, 4]):
        directions.append(((1-t*t)/(1+t*t), 2*t/(1+t*t)))
    directions.append((Fraction(-1), Fraction(0)))
    chords = 0
    for ux, uy in directions:
        vx, vy = -uy, ux
        for t in [Fraction(-1, 2), Fraction(0), Fraction(1, 2)]:
            for s1, s2 in permutations([Fraction(i, 4) for i in range(-2, 3)], 2):
                rows = [[t*vx-s1*ux, ux, vx, 0], [t*vy-s1*uy, uy, vy, 0],
                        [t*vx-s2*ux, ux, 0, vx], [t*vy-s2*uy, uy, 0, vy]]
                require(abs(determinant(rows)) == abs(s1-s2), "directional chord Jacobian")
                chords += 1
    circles = 0
    for a, b, c in combinations(directions, 3):
        twice_area = abs(cross((a[0]-c[0], a[1]-c[1]), (b[0]-c[0], b[1]-c[1])))
        require(twice_area > 0, "three distinct circle points are noncollinear")
        for radius in [Fraction(1, 3), Fraction(2, 3)]:
            rows = []
            for index, (x, y) in enumerate((a, b, c)):
                dx = [0, 0, 0]
                dy = [0, 0, 0]
                dx[index] = -radius * y
                dy[index] = radius * x
                rows.extend([[1, 0, x, *dx], [0, 1, y, *dy]])
            require(abs(determinant(rows)) == radius**3 * twice_area, "circle triple Jacobian")
            circles += 1
    return chords, circles


def check_fiber_counts():
    cases = 0
    for heavy in range(3):
        for other in range(4 - heavy):
            escaped = 3 - heavy - other
            require(2*escaped >= heavy-2*other, "heavy fiber lower bound")
            cases += 1
    orders = set(permutations(("heavy", "heavy", "other")))
    require(all(sum(order[i] == "heavy" for order in orders) == 2 for i in range(3)),
            "two-thirds sharp marginal")
    return cases


if __name__ == "__main__":
    triangles, witnesses = check_carriers()
    chords, circles = check_models()
    count = check_fiber_counts()
    print(f"{triangles} finite circle triples and {witnesses} marked side-pair witnesses")
    print(f"{chords} exact chord Jacobians and {circles} exact circumcircle Jacobians")
    print(f"{count} fiber population counts and the two-thirds equality case")
