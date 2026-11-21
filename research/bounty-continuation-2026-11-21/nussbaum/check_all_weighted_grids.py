"""Exact arithmetic certificate for the two finite steps in all-weighted-grids.md."""

from fractions import Fraction
from functools import cache
from math import comb


def peak_variance(left, right):
    nearest_to_half = max(left, min(Fraction(1, 2), right))
    return nearest_to_half * (1 - nearest_to_half)


def certify_rectangle(u0, u1, v0, v1, depth=0):
    # A is a lower bound on the positive terms; squaring removes the square root.
    minimum_w = min(u + v - 2*u*v for u in (u0, u1) for v in (v0, v1))
    zero_term = (1-u1)*(1-v1)*(1 - (1-v0)**int(8*u0))
    one_term = u0*v0*(1 - v1**int(8*(1-u1)))
    lower = Fraction(17, 5)*minimum_w + Fraction(5, 7)*(zero_term + one_term)
    if lower**2 >= 256 * peak_variance(u0, u1)**2 * peak_variance(v0, v1):
        return 1, depth

    if depth >= 28:
        raise AssertionError(("uncertified rectangle", u0, u1, v0, v1))
    if u1-u0 > v1-v0:
        mid = (u0+u1)/2
        rectangles = ((u0, mid, v0, v1), (mid, u1, v0, v1))
    else:
        mid = (v0+v1)/2
        rectangles = ((u0, u1, v0, mid), (u0, u1, mid, v1))
    children = [certify_rectangle(*rectangle, depth+1) for rectangle in rectangles]
    return sum(leaves for leaves, _ in children), max(level for _, level in children)


@cache
def middle(width):
    return comb(width, width//2)


@cache
def required_width(count):
    width = 0
    while middle(width) < count:
        width += 1
    return width


def minimum_extra_bits(eligible, patterns):
    covered = 0
    for size in range(eligible + 1):
        covered += comb(eligible, size)
        if covered >= patterns:
            return size
    return None


def pair_possible(n, distance, labels, multiplicity):
    outside_width = middle(n-distance)
    if labels * multiplicity**2 > (1 << distance) * outside_width**2:
        return False
    patterns = (multiplicity + outside_width - 1) // outside_width
    for weight in range(distance//2 + 1):
        ones = minimum_extra_bits(weight, patterns)
        zeros = minimum_extra_bits(distance-weight, patterns)
        if ones is None or zeros is None:
            continue
        choices = comb(distance-ones-zeros, weight-ones)
        if choices >= labels:
            return True
    return False


def average_distance_bound(n, centers):
    return n * (centers**2 // 4) // comb(centers, 2)


def possible(a, n, b, multiplicity):
    if b*multiplicity > middle(n):
        return False
    if 3*a > 28 and b**(3*a-28) >= a**(5*a):
        return False
    radius = n - required_width(multiplicity)
    if radius < 1:
        return False
    diameter = min(n, 2*radius)
    if b**((a-1)*diameter) > 1 << (a*radius*(diameter-1)):
        return False
    if not any(pair_possible(n, s, b, multiplicity) for s in range(a+1, diameter+1)):
        return False
    for centers, labels in ((a, b), (b, a)):
        largest = min(diameter, average_distance_bound(n, centers))
        if not any(pair_possible(n, s, labels, multiplicity)
                   for s in range(required_width(labels), largest+1)):
            return False
    return True


def exclude_interval(a, n, lo, hi):
    if hi < lo:
        return 0
    multiplicity = (1 << n) // (a*hi) + 1
    if not possible(a, n, lo, multiplicity):
        return 1
    if lo == hi:
        raise AssertionError(("unexcluded parameters", a, n, lo, multiplicity))
    if hi.bit_length()-lo.bit_length() > 2:
        cut = 1 << ((hi.bit_length()+lo.bit_length())//2)
    else:
        cut = (lo+hi)//2
    assert lo <= cut < hi
    return 1 + exclude_interval(a, n, lo, cut) + exclude_interval(a, n, cut+1, hi)


def main():
    leaves, depth = certify_rectangle(Fraction(1, 8), Fraction(7, 8),
                                      Fraction(0), Fraction(1))
    print(f"Scalar inequality: {leaves} certified rectangles, maximum depth {depth}")
    total = 0
    for a in range(2, 23):
        n = 1
        while a*middle(n) > 1 << n:
            max_columns = middle(average_distance_bound(n, a))
            total += exclude_interval(a, n, a, max_columns)
            n += 1
        print(f"Side {a}: checked all candidate dimensions below {n}.")
    print(f"{total} nonempty parameter intervals checked; none survive.")


if __name__ == "__main__":
    main()
