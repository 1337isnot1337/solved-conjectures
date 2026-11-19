"""Check sharp periodic examples and the finite window obstructions independently."""
from math import gcd


def multiplicities(a, b, period, centers):
    counts = [0] * period
    for center in centers:
        for offset in (0, a, b, a + b):
            counts[(center + offset) % period] += 1
    return counts


def check_examples(a, b):
    if (a + b) % 2:
        even = a if a % 2 == 0 else b
        half = even & -even
        assert multiplicities(a, b, 2 * half, range(0, half, 2)) == [1] * (2 * half)
        return
    width = a + 1
    for packing in (True, False):
        height = b - 1 if packing else b + 1
        period = width * height + (1 if packing else -1)
        offset = 0 if packing else width
        centers = {
            b * (row * width + col + offset) % period
            for row in range(0, height, 2)
            for col in range(0, width, 2)
        }
        assert 4 * len(centers) == width * height
        counts = multiplicities(a, b, period, centers)
        assert counts.count(1) == period - 1
        assert counts.count(0 if packing else 2) == 1


def exact_window(a, b, length, packing):
    """Can each test site be covered exactly once? Packing also checks outside collisions."""
    offsets = (0, a, b, a + b)
    test_sites = (1 << length) - 1
    centers = sorted({i - d for i in range(length) for d in offsets})
    rows = []
    choices = [0] * length
    for row, center in enumerate(centers):
        covered = {center + d for d in offsets}
        rows.append(covered if packing else {j for j in covered if 0 <= j < length})
        for j in covered:
            if 0 <= j < length:
                choices[j] |= 1 << row

    conflicts = [
        sum(1 << j for j, other in enumerate(rows) if covered & other)
        for covered in rows
    ]
    inside = [sum(1 << j for j in covered if 0 <= j < length) for covered in rows]

    def search(uncovered, available):
        if not uncovered:
            return True
        sites = uncovered
        smallest = None
        while sites:
            bit = sites & -sites
            sites ^= bit
            options = choices[bit.bit_length() - 1] & available
            if not options:
                return False
            if smallest is None or options.bit_count() < smallest.bit_count():
                smallest = options
        while smallest:
            bit = smallest & -smallest
            smallest ^= bit
            row = bit.bit_length() - 1
            if search(uncovered & ~inside[row], available & ~conflicts[row]):
                return True
        return False

    return search(test_sites, (1 << len(centers)) - 1)


def main():
    pairs = windows = 0
    for b in range(2, 82):
        for a in range(1, b):
            if gcd(a, b) != 1:
                continue
            check_examples(a, b)
            pairs += 1
            if a % 2 and b % 2 and b <= 11:
                for packing in (True, False):
                    limit = a * b + b + (-a if packing else a)
                    assert not exact_window(a, b, limit, packing), (a, b, limit)
                    assert exact_window(a, b, limit - 1, packing), (a, b, limit - 1)
                    windows += 2
    print(f"Checked the constructions for {pairs} coprime pairs and {windows} exact window decisions.")


if __name__ == "__main__":
    main()
