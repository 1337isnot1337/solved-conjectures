"""Check the determinant progressions in digit-arrays.md against actual triples."""

from itertools import product


def coordinate_values(base, alphabet_size, depth):
    values = [0]
    for _ in range(depth):
        values = [base * x + digit for x in values for digit in range(alphabet_size)]
    return values


def check_array(base, width, height, depth):
    points = set(product(coordinate_values(base, width, depth),
                         coordinate_values(base, height, depth)))
    horizontal = width - 1
    digit_bound = horizontal * (height - 1)
    place_sum = sum(base ** j for j in range(depth))
    dense = width * height > base
    checks = 0
    for place in range(depth):
        step = base ** place
        dx, dy = horizontal * step, step
        determinants = set()
        long_determinants = set()
        for x, y in points:
            if (x + dx, y + dy) not in points:
                continue
            for cx, cy in points:
                value = dx * (cy - y) - dy * (cx - x)
                determinants.add(value)
                if abs(cx - x) >= horizontal * base ** (depth - 1):
                    long_determinants.add(value)
        if dense:
            expected = {step * e for e in range(-digit_bound * place_sum,
                                                 digit_bound * place_sum + 1)}
            assert expected <= determinants
            checks += len(expected)
            if depth > 1 and place == 0:
                prefix_sum = place_sum - base ** (depth - 1)
                expected_long = set(range(-digit_bound * prefix_sum,
                                          digit_bound * prefix_sum + 1))
                assert expected_long <= long_determinants
                checks += len(expected_long)
        elif place == depth - 1:
            expected = {step * e for e in range(digit_bound + 1)}
            assert expected <= determinants
            checks += len(expected)
    return checks


if __name__ == "__main__":
    arrays = [(2, 2, 2, 4), (3, 2, 2, 4), (3, 3, 2, 3), (4, 4, 2, 2),
              (4, 2, 2, 3), (5, 3, 2, 3), (7, 3, 2, 3), (8, 2, 2, 4),
              (11, 5, 3, 2), (17, 5, 3, 2), (19, 5, 3, 1)]
    total = sum(check_array(*parameters) for parameters in arrays)
    print(f"Checked {total} determinant requirements on {len(arrays)} arrays.")
