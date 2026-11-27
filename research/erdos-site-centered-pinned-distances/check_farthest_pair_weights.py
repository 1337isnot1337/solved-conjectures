"""Exact controls for radial pair normalization, cap separation and cell charging."""

from fractions import Fraction
from itertools import product


def require(condition, message):
    if not condition:
        raise ValueError(message)


def row_completion():
    checks = 0
    for count in range(2, 8):
        shells = [Fraction(1, 2 ** (i + 1)) for i in range(count - 1)]
        shells.append(shells[-1])
        for directions in (5, 7, 11):
            sites = list(product(range(count), range(directions)))
            mass = {site: shells[site[0]] / directions for site in sites}
            half_width = [min(j, (directions - 3) // 2) for j in range(count)]

            def weight(a, b):
                shell, first = a
                other_shell, second = b
                difference = abs(first - second)
                if shell == other_shell and min(difference, directions - difference) <= half_width[shell]:
                    return 1 / (2 * shells[shell])
                return Fraction(0)

            raw = {a: sum(weight(a, b) * mass[b] for b in sites) for a in sites}
            missing = sum((1 - raw[a]) * mass[a] for a in sites)
            require(missing > 0, 'no residual row mass')
            for a in sites:
                expected = Fraction(2 * half_width[a[0]] + 1, 2 * directions)
                require(raw[a] == expected, 'raw angular row integral')
                row = sum((weight(a, b) + (1 - raw[a]) * (1 - raw[b]) / missing)
                          * mass[b] for b in sites)
                require(row == 1, 'completed marginal')
                checks += 1
    return checks


def cap_controls():
    checks = 0
    for exponent in range(5, 15):
        angular_scale = Fraction(1, 2 ** exponent)
        for pin in (Fraction(1, 4), Fraction(2, 5), Fraction(1, 2)):
            for portion in (Fraction(0), Fraction(1, 3), Fraction(1)):
                depth = angular_scale ** 2 * portion
                # 1 - cos(theta) <= theta^2/2 on a core target.
                upper = (depth * (2 + 2 * pin - depth)
                         + pin * (1 - depth) * (angular_scale / 2) ** 2)
                require(upper < 4 * angular_scale ** 2, 'core deficit')
                # Beyond the outer angular window use 1 - cos(theta) >= 2 theta^2 / pi^2.
                # For depth <= 1/2 the coefficient 2*pin*(1-depth) is at least 1/4.
                lower = Fraction(1, 4) * 2 * (20 * angular_scale) ** 2 / 10
                require(lower > upper, 'outer angular deficit')
                require(5 * angular_scale ** 2 > upper, 'outer depth deficit')
                checks += 1
    return checks


def sector_charges():
    checks = 0
    for cells, scale, mass in product(range(1, 15), range(1, 65), range(1, 65)):
        require(cells ** 3 * mass ** 2 * scale >= min(mass, cells * scale) ** 3,
                'mixed term cannot cover the good pin mass')
        checks += 1
    return checks


def chord_pair_geometry():
    checks = 0
    directions = [(1, 0, 1), (3, 4, 5), (-5, 12, 13), (7, -24, 25)]
    for vx, vy, norm in directions:
        normal = (Fraction(vx, norm), Fraction(vy, norm))
        tangent = (-normal[1], normal[0])
        for offset, first, second in product(range(-1, 2), range(-2, 3), range(-2, 3)):
            if first == second:
                continue
            for h, k in product(range(1, 5), repeat=2):
                if h == k:
                    continue
                circle_height = Fraction(first**2 + h**2 - second**2 - k**2, 2 * (first - second))
                center = tuple(offset * n + circle_height * t for n, t in zip(normal, tangent))
                radius_squared = (first - circle_height)**2 + h**2
                vertices = set()
                for height, half_length in ((first, h), (second, k)):
                    midpoint = tuple(offset * n + height * t for n, t in zip(normal, tangent))
                    endpoints = [tuple(m + sign * half_length * n for m, n in zip(midpoint, normal))
                                 for sign in (-1, 1)]
                    vertices.update(endpoints)
                    for point, opposite in zip(endpoints, reversed(endpoints)):
                        signed_distance = sum(a * n for a, n in zip(point, normal)) - offset
                        reflected = tuple(a - 2 * signed_distance * n for a, n in zip(point, normal))
                        require(reflected == opposite, 'chord reflection')
                        require(sum((a - c)**2 for a, c in zip(point, center)) == radius_squared,
                                'common circle')
                require(len(vertices) == 4, 'distinct vertices')
                checks += 1
    return checks


def shell_offset_controls():
    checks = 0
    for exponent in range(15, 81):
        scale = Fraction(1, 2**exponent)
        thickness = scale**2
        # Both endpoints have radii at least 0.99. For the angular window
        # in the proof, 2*sin(theta/2) lies between 0.99*theta and theta.
        lower_chord = Fraction(99, 100)**2 * Fraction(3, 1000) * scale
        upper_chord = Fraction(46, 100) * thickness + Fraction(35, 10000) * scale
        lower_offset = Fraction(99, 100) * Fraction(44, 100) * thickness / upper_chord
        upper_offset = Fraction(46, 100) * thickness / lower_chord
        require(lower_offset >= 100 * scale, 'raw shell lower offset')
        require(upper_offset <= 200 * scale, 'raw shell upper offset')
        require(200 * scale < Fraction(1, 16), 'mixed-group axis contamination')
        minimum_midpoint_squared = ((1 - thickness)**2 - (200 * scale)**2
                                    - (scale / 400)**2)
        require(minimum_midpoint_squared > Fraction(9, 10)**2, 'midpoint sign separation')
        # The angular diameter is at most four times the Euclidean distance
        # when both radii are at least 0.9.
        require(4 * (2 * thickness + scale / 200) < scale / 8, 'resampled endpoint angle')
        checks += 1
    for numerator in range(1, 60):
        masses = [Fraction(1, 3), Fraction(1, 3), Fraction(1, 3) - Fraction(numerator, 360)]
        for i in range(3):
            row = Fraction(0)
            for j in range(3):
                if j != i:
                    k = 3 - i - j
                    entry = (masses[i] + masses[j] - masses[k]) / 2
                    require(entry > 0, 'residual cross-group mass')
                    row += entry
            require(row == masses[i], 'residual cross-group row sum')
            checks += 1
    return checks


if __name__ == '__main__':
    print(f'{row_completion()} exact completed marginal rows')
    print(f'{cap_controls()} farthest-cap deficit controls')
    print(f'{sector_charges()} source-sector charging inequalities')
    print(f'{chord_pair_geometry()} nonrectangular common-axis trapezoids')
    print(f'{shell_offset_controls()} axis-only shell and residual marginal controls')
