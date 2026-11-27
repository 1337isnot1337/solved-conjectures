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


if __name__ == '__main__':
    print(f'{row_completion()} exact completed marginal rows')
    print(f'{cap_controls()} farthest-cap deficit controls')
    print(f'{sector_charges()} source-sector charging inequalities')
