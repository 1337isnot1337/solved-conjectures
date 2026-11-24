#!/usr/bin/env python3
"""Exact controls for the interval and sparse Fourier frequency arguments."""

from fractions import Fraction as F
from itertools import product
from math import ceil, floor


def subtract_open(intervals, hole):
    lower, upper = hole
    kept = []
    for start, end in intervals:
        if upper <= start or end <= lower:
            kept.append((start, end))
            continue
        if start <= lower:
            kept.append((start, lower))
        if upper <= end:
            kept.append((upper, end))
    return kept


def longest_survivor(interval, scales, frequency, hole):
    start, end = interval
    lower, upper = hole
    kept = [interval]
    for scale in scales:
        step = scale * frequency
        for index in range(floor(step * start) - 1, ceil(step * end) + 1):
            kept = subtract_open(kept, ((index + lower) / step, (index + upper) / step))
    return max(kept, key=lambda term: term[1] - term[0])


def check_intervals():
    scales = (F(1), F(1001, 1000), F(997, 1000), F(1003, 1000))
    hole = (F(1, 2), F(1, 2) + F(1, 128))
    assert len(scales) * (hole[1] - hole[0]) <= F(1, 24)
    interval = (F(21, 20), F(23, 20))
    frequency = 5
    tested = []
    for _ in range(6):
        assert interval[1] - interval[0] >= F(1, 2 * frequency)
        before = interval
        interval = longest_survivor(interval, scales, frequency, hole)
        assert before[0] <= interval[0] < interval[1] <= before[1]
        assert interval[1] - interval[0] >= F(1, 16 * len(scales) * frequency)
        tested.append(frequency)
        frequency *= 32

    for endpoint, scale, past in product(interval, scales, tested):
        phase = (endpoint * scale * past) % 1
        assert not hole[0] < phase < hole[1]


def check_frequencies():
    frequencies = [32**exponent for exponent in range(2, 7)]
    degrees = (2, 3, 1, 4, 3)
    for index, frequency in enumerate(frequencies):
        earlier = sum(a * b for a, b in zip(frequencies[:index], degrees[:index]))
        assert frequency > 2 * earlier

    zero_terms = 0
    for coefficients in product(*(range(-degree, degree + 1) for degree in degrees)):
        total = sum(a * b for a, b in zip(coefficients, frequencies, strict=True))
        if total == 0:
            zero_terms += 1
            assert not any(coefficients)
        else:
            assert 2 * abs(total) >= frequencies[0]
    assert zero_terms == 1


if __name__ == "__main__":
    check_intervals()
    check_frequencies()
    print("Erdős similarity: simultaneous interval deletion and frequency separation passed")
