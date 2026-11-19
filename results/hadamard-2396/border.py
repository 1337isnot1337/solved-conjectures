"""Verify the index-four border identities, compression patterns, and a full example."""
from itertools import combinations_with_replacement, product
import json
from math import isqrt
from pathlib import Path

import numpy as np


def signs(rows):
    assert all(set(row) <= {"-", "+"} for row in rows)
    return np.array([[1 if c == "+" else -1 for c in row] for row in rows], dtype=np.int64)


def check_border():
    data = json.loads(Path(__file__).with_name("border.json").read_text())
    k, e, f = (signs(data[key]) for key in ("K", "E", "F"))
    gamma = 2 * np.array([[0, 1, 1, 1], [-1, 0, 1, -1],
                          [-1, -1, 0, 1], [-1, 1, -1, 0]])
    assert np.array_equal(k @ k.T, 12 * np.eye(12, dtype=int))
    assert np.array_equal(e @ e.T, 16 * np.eye(12, dtype=int))
    blocks = np.kron(np.eye(4, dtype=int), np.ones((4, 4), dtype=int))
    assert np.array_equal(f @ f.T, 16 * np.eye(16, dtype=int) - 4 * blocks)
    assert np.all(blocks @ e.T == 0)
    assert np.all(np.kron(gamma, np.eye(4, dtype=int)) @ e.T + f @ k.T == 0)
    return k, e, f


def compression_patterns():
    n = 2396
    # After fixing the constant row positive, each of the other three has
    # baseline a and a + 2 in its distinguished coset.
    bound = isqrt(n)
    options = [a for a in range(-149, 148, 2) if abs(4*a + 2) <= bound]
    patterns = [(d, *row) for d in range(1, 150, 2)
                for row in combinations_with_replacement(options, 3)
                if (4*d)**2 + sum((4*a + 2)**2 for a in row) == n]
    assert len(patterns) == 14
    return patterns


def example(k, e, f, cyclic):
    # In each example list the four quotient cosets, each with three entries.
    def quotient_difference(q,u):
        return (u-q) % 4 if cyclic else u ^ q
    q_inverse = [quotient_difference(q,0) for q in range(4)]
    first = "++-++--+++-+" if cyclic else "++-+-++-+-++"
    rows = signs([first, "+++++-+-+-++",
                  "-++--+--+--+", "-++--+-+-+--"]).reshape(4, 4, 3)
    elements = list(product(range(4), range(3)))
    for q, t in elements:
        corr = (rows * np.roll(rows[:, [quotient_difference(q,u) for u in range(4)], :], t, axis=2)).sum()
        assert corr == (48 if (q,t) == (0,0) else -12 if q == 0 else 4)
    assert rows.sum(axis=2).tolist() == [[1,1,1,1], [3,1,1,1], [1,-1,-1,-1], [1,-1,-1,-1]]
    a,b,c,d = (np.array([[row[quotient_difference(q,u), (v-t) % 3] for u,v in elements]
                         for q,t in elements]) for row in rows)
    inverse = [3*q_inverse[q] + (-t) % 3 for q,t in elements]
    def reflect(matrix):
        return matrix[:, inverse]
    m = np.block([[a, reflect(b), reflect(c), reflect(d)],
                  [-reflect(b), a, reflect(d.T), -reflect(c.T)],
                  [-reflect(c), -reflect(d.T), a, reflect(b.T)],
                  [-reflect(d), reflect(c.T), -reflect(b.T), a]])
    f = f.reshape(4,4,12)[:, q_inverse, :].reshape(16,12)
    h = np.block([[k, np.repeat(e, 3, axis=1)],
                  [np.repeat(f, 3, axis=0), m]])
    assert np.all(np.abs(h) == 1)
    assert np.array_equal(h @ h.T, 60*np.eye(60, dtype=int))


if __name__ == "__main__":
    border = check_border()
    for cyclic in (False, True):
        example(*border, cyclic=cyclic)
    print("Order 60: both quotient groups passed full Gram-matrix checks.")
    print("Order 2396: normalized coset-sum patterns", compression_patterns())
