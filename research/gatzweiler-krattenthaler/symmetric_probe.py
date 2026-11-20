"""Look for a semigroup-gap disproof of the separate symmetric conjecture.

This restricted search cannot prove positivity. A returned witness is checked
using integer cyclotomic valuations and an exact semigroup computation.
"""
import json
import sys
import time

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp


def trial(n, m, j, limit=0.1):
    target = m + j
    if 3 * j <= target or 2 * j > n + 1:
        return None
    vals = list(range(j, n + 2 - j))
    index = {v: k for k, v in enumerate(vals)}
    size = len(vals)
    rows, lower, upper = [], [], []

    def constrain(row, lo, hi):
        rows.append(row)
        lower.append(lo)
        upper.append(hi)

    for d in range(2, n + 1):
        row = [int((m + i) % d == 0) - int(i % d == 0)
               for i in vals] + [0] * size
        if any(row):
            constrain(row, 0, np.inf)
    for k, i in enumerate(vals):
        row = [0] * (2 * size)
        row[k], row[size + k] = 1, -64
        constrain(row, -np.inf, 0)
        reflection = n + 1 - i
        if i < reflection:
            row = [0] * (2 * size)
            row[k], row[index[reflection]] = 1, -1
            constrain(row, 0, 0)
        partner = target - i
        if partner in index and partner >= i:
            row = [0] * (2 * size)
            row[size + k] = 1
            if partner != i:
                row[size + index[partner]] = 1
            constrain(row, -np.inf, 0 if partner == i else 1)
    lb = np.zeros(2 * size)
    ub = np.r_[np.full(size, 64), np.ones(size)]
    lb[0] = 1
    if target in index:
        ub[index[target]] = 0
    result = milp(np.r_[np.ones(size), np.zeros(size)],
                  integrality=np.ones(2 * size), bounds=Bounds(lb, ub),
                  constraints=LinearConstraint(np.array(rows), lower, upper),
                  options={'time_limit': limit})
    if result.x is None:
        return None
    support = {i: int(round(result.x[k])) for k, i in enumerate(vals)
               if result.x[k] > 0.5}
    assert all(support.get(n + 1 - i, 0) == a for i, a in support.items())
    valuations = {d: sum(a * (int((m+i) % d == 0) - int(i % d == 0))
                         for i, a in support.items())
                  for d in range(1, m + n + 1)}
    assert min(valuations.values()) >= 0
    reachable = [False] * (target + 1)
    reachable[0] = True
    for i in support:
        for k in range(i, target + 1):
            reachable[k] |= reachable[k-i]
    assert not reachable[target]
    return {'n': n, 'm': m, 'support': support,
            'negative_degree': target, 'negative_coefficient': -support[j],
            'valuations': {d: a for d, a in valuations.items() if a}}


def main():
    bound = int(sys.argv[1]) if len(sys.argv) > 1 else 50
    start = time.monotonic()
    trials = 0
    for n in range(3, bound + 1):
        for m in range(1, n):
            for j in range(m // 2 + 1, (n + 1) // 2 + 1):
                trials += 1
                witness = trial(n, m, j)
                if witness is not None:
                    print(json.dumps(witness), flush=True)
                    return
        print(json.dumps({'n': n, 'trials': trials,
                          'elapsed_seconds': round(time.monotonic()-start, 2),
                          'result': 'no_witness_in_restricted_search'}), flush=True)


if __name__ == '__main__':
    main()
