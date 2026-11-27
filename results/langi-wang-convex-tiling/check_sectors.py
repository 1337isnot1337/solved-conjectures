"""Floating-point geometry check for one stage of the disk-window construction."""

from itertools import combinations
from math import cos, dist, hypot, isclose, pi, sin


def require(condition, message):
    if not condition:
        raise ValueError(message)


def regular_vertices(count, radius):
    angles = (pi / 4 + 2 * pi * j / count for j in range(count))
    return [(radius * cos(angle), radius * sin(angle)) for angle in angles]


def twice_triangle_area(a, b, c):
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def check_tile(vertices, center, radius):
    """Check strict counterclockwise turns and clearance from every supporting line."""
    area = 0.0
    for i, a in enumerate(vertices):
        b = vertices[(i + 1) % len(vertices)]
        c = vertices[(i + 2) % len(vertices)]
        require(twice_triangle_area(a, b, c) > 0, "Nonconvex or degenerate corner")
        area_at_center = twice_triangle_area(a, b, center)
        require(area_at_center / dist(a, b) >= radius * (1 - 1e-12),
                "Proposed inball crosses a tile edge")
        area += area_at_center / 2
    return area


def regular_area(count, radius):
    return count * radius**2 * sin(2 * pi / count) / 2


def check_wedges(count, radius, half_side):
    arc = regular_vertices(count, radius)[:count // 4 + 1]
    wedge = [(half_side, half_side), *arc, (-half_side, half_side)]
    center = (0, radius / 2)
    total_area = (2 * half_side)**2
    for _ in range(4):
        require(all(hypot(*p) <= radius * (1 + 1e-12) for p in wedge),
                "Wedge exceeds the test disk")
        total_area += check_tile(wedge, center, radius / 8)
        wedge = [(-y, x) for x, y in wedge]
        center = (-center[1], center[0])
    require(isclose(total_area, regular_area(count, radius), rel_tol=1e-12),
            "Wedges and square do not recover the inner polygon's area")


def check_ring(count, radius, test_radius):
    delta = 2 * pi / count
    next_radius = radius * (1 + 2 * delta)
    inner = regular_vertices(count, radius)
    outer = regular_vertices(count // 2, next_radius)
    ball_radius = radius * delta / 4
    require(ball_radius >= 1, "Sector inball radius is below 1")
    require(next_radius * cos(delta) >= radius * (1 + delta),
            "Outer chord cuts the claimed radial strip")
    total_area = 0.0
    for j, left in enumerate(inner):
        right = inner[(j + 1) % count]
        start = outer[j // 2]
        end = outer[(j // 2 + 1) % len(outer)]
        middle = ((start[0] + end[0]) / 2, (start[1] + end[1]) / 2)
        outer_left, outer_right = (middle, end) if j % 2 else (start, middle)
        tile = [left, outer_left, outer_right, right]
        angle = pi / 4 + (j + 0.5) * delta
        center_radius = radius * (1 + delta / 2)
        center = (center_radius * cos(angle), center_radius * sin(angle))
        total_area += check_tile(tile, center, ball_radius)
        diameter = max(dist(a, b) for a, b in combinations(tile, 2))
        require(diameter <= 20 * ball_radius, "Sector diameter exceeds the aspect bound")
        require(max(hypot(*p) for p in tile) > test_radius,
                "Sector is wholly contained in the test disk")
    annulus_area = regular_area(count // 2, next_radius) - regular_area(count, radius)
    require(isclose(total_area, annulus_area, rel_tol=1e-12),
            "Sector areas do not recover the polygonal annulus")
    return next_radius


def main():
    count = 512
    test_radius = 512
    half_side = test_radius / 8
    check_wedges(count, test_radius, half_side)
    radius = test_radius
    rings = sectors = 0
    while count > 4:
        radius = check_ring(count, radius, test_radius)
        rings += 1
        sectors += count
        count //= 2
    require(radius * cos(pi / 4) > test_radius,
            "Final square does not strictly contain the test disk")
    print(f"Checked 4 wedges, {rings} coarsening rings and {sectors} convex sectors.")


if __name__ == "__main__":
    main()
