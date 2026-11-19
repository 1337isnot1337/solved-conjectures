"""Compute the independence number and an attaining character from two relations."""
from math import gcd


def floor_sum(count, modulus, slope, offset):
    """Sum floor((slope*i + offset)/modulus) for 0 <= i < count."""
    total = 0
    while True:
        quotient, slope = divmod(slope, modulus)
        total += quotient * count * (count - 1) // 2
        quotient, offset = divmod(offset, modulus)
        total += quotient * count
        height = slope * count + offset
        if height < modulus:
            return total
        count, offset = divmod(height, modulus)
        modulus, slope = slope, modulus


def quotient_optimum(m, k, s):
    """Relations (m,0),(s,k). Return (alpha, coordinate residues) modulo m*k."""
    if m < 1 or k < 1:
        raise ValueError("both diagonal entries must be positive")
    s %= m
    order = m * k

    def upper_row(h):
        return min(m - 1, (order - h) // k)

    def count_pairs(h, end):
        start = (h + k - 1) // k
        count = end - start + 1
        if count <= 0:
            return 0
        return (
            floor_sum(count, m, s, order - h + s*start)
            - floor_sum(count, m, s, h - 1 + s*start)
        )

    low, high = 0, order // 2 + 1
    while high - low > 1:
        mid = (low + high) // 2
        if count_pairs(mid, upper_row(mid)):
            low = mid
        else:
            high = mid
    h = low
    if h == 0:
        return 0, (0, 0)

    # Locate the first nonempty row, then its first admissible residue.
    left, right = (h + k - 1) // k - 1, upper_row(h)
    while right - left > 1:
        mid = (left + right) // 2
        if count_pairs(h, mid):
            right = mid
        else:
            left = mid
    y = h + (-s*right - h) % m
    return h, (k*right, y)


def circulant_optimum(n, a, b):
    """Return (alpha, (t*a mod n,t*b mod n)) for a connected circulant."""
    if n < 2 or gcd(n, gcd(a, b)) != 1:
        raise ValueError("a connected circulant of order at least two is required")
    k = gcd(n, a)
    m = n // k
    s = (-b * pow(a // k, -1, m)) % m
    return quotient_optimum(m, k, s)
