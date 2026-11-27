"""Check the transport of position and translation characters using modular slopes."""

from itertools import product
from random import Random


def check_transport(p, exponent, precision, rng):
    modulus = p**exponent
    coordinate_modulus = p**precision
    step = modulus // coordinate_modulus
    matrix_modulus = p * modulus
    checked = 0
    moves = [(1, 0, p), (1, p, 0), (1 + p, 0, 0)]
    for _ in range(5):
        moves.append(tuple(p * rng.randrange(modulus) + offset for offset in (1, 0, 0)))
    for a, b, c in moves:
        d = (1 + b * c) * pow(a, -1, matrix_modulus) % matrix_modulus
        images = [
            (c // p + d * y) * pow(a + p * b * y, -1, modulus) % modulus
            for y in range(modulus)
        ]
        assert len(set(images)) == modulus
        for y in range(modulus):
            image = images[y]
            difference = (images[(y + step) % modulus] - image) % modulus
            assert difference % step == 0
            shift_in_image = difference // step
            assert shift_in_image % p
            for root in range(1, coordinate_modulus, p):
                v = root * y % coordinate_modulus
                mapped_root = (a * root + p * b * v) % coordinate_modulus
                mapped_v = (c // p * root + d * v) % coordinate_modulus
                assert mapped_root % p == 1
                assert mapped_root * image % coordinate_modulus == mapped_v
                for kappa in range(1, p):
                    source_label = kappa * root**2 % coordinate_modulus
                    target_label = kappa * mapped_root**2 % coordinate_modulus
                    assert target_label * shift_in_image % coordinate_modulus == source_label
                    checked += 1
    expected = {(u, v) for u in range(1, coordinate_modulus, p)
                for v in range(coordinate_modulus)}
    for kappa in range(1, p):
        roots = {kappa * u**2 % coordinate_modulus: u
                 for u in range(1, coordinate_modulus, p)}
        assert set(roots) == set(range(kappa, coordinate_modulus, p))
        points = {(roots[xi], roots[xi] * y % coordinate_modulus)
                  for y, xi in product(range(coordinate_modulus), roots)}
        assert points == expected
        assert len(points) * (modulus // coordinate_modulus**2) == modulus // p
    return checked


if __name__ == "__main__":
    random = Random(592)
    cases = [(3, 4), (3, 5), (3, 6), (5, 4), (7, 4)]
    total = sum(check_transport(p, m, r, random)
                for p, m in cases for r in range(1, m // 2 + 1))
    print(f"Verified {total:,} transported position and character labels.")
