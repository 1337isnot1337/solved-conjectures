"""Finite regression checks for section 2. Run with Python 3 and NumPy."""

from fractions import Fraction
from itertools import combinations
from math import comb

import numpy as np


def averaged_projection(traces, mass, size):
    """Conditional expectation in Euclidean coordinates sqrt(mass) * f."""
    count, positions = traces.shape
    matrix = np.zeros((count, count))
    for subset in combinations(range(positions), size):
        _, labels = np.unique(traces[:, subset], axis=0, return_inverse=True)
        for cell in range(labels.max() + 1):
            rows = np.flatnonzero(labels == cell)
            v = np.sqrt(mass[rows] / mass[rows].sum())
            matrix[np.ix_(rows, rows)] += np.outer(v, v)
    return matrix / comb(positions, size)


def root(matrix):
    values, vectors = np.linalg.eigh(matrix)
    if values.min() < -1e-10:
        raise ValueError("Expected positive semidefinite matrix")
    return (vectors * np.sqrt(values.clip(min=0))) @ vectors.T


def run():
    rho = Fraction(21, 20)
    bound = 2 * (rho - 1) / ((1 - Fraction(1, 2)) * (1 - rho / 2))
    assert bound == Fraction(8, 19) < Fraction(1, 2)

    # All thresholds on eight ordered positions have VC dimension one.
    traces = (np.arange(8)[None, :] >= np.arange(9)[:, None]).astype(int)
    mass = np.array([2, 5, 1, 17, 8, 11, 3, 7, 9], dtype=float)
    mass /= mass.sum()
    eye = np.eye(len(mass))
    projections = {m: averaged_projection(traces, mass, m) for m in (1, 2, 4, 8)}
    small, large = projections[1], projections[4]
    assert np.linalg.norm(small @ large - large @ small, 2) > 1e-4
    for m, k_matrix in projections.items():
        for size, big_matrix in projections.items():
            if size >= m:
                overlap = np.linalg.norm(root(eye - big_matrix) @ root(k_matrix), 2)
                assert overlap <= 1 / np.sqrt(size // m) + 1e-8

    # The inverse estimate is algebraic and holds for any overall temperature.
    bands = [small, large - small, eye - large]
    weights = [float(rho) ** -j for j in range(len(bands))]
    operator = sum(b * band for b, band in zip(weights, bands))
    approximate_inverse = sum(band / b for b, band in zip(weights, bands))
    assert np.linalg.norm(approximate_inverse @ operator - eye, 2) <= float(bound)
    inverse = np.linalg.inv(operator)
    upper_bound = 4 * sum(band / b**2 for b, band in zip(weights, bands))
    root(upper_bound - inverse.T @ inverse)

    centered = np.sqrt(mass[:, None]) * (traces - mass @ traces)
    for m, k_matrix in projections.items():
        residual = np.sum(centered * ((eye - k_matrix) @ centered)) / traces.shape[1]
        assert residual <= 1 / (m + 1) + 1e-10
    print("Passed: exact Schur constant, noncommutation, overlap, inverse and residual variance.")


if __name__ == "__main__":
    run()
