"""Exact-support search for a symmetric first-numerator semigroup gap.

The solver is only a discovery device. Every returned candidate is rechecked
with integer cyclotomic valuations and exact semigroup reachability. A failed
or time-limited solve proves nothing about the conjecture.
"""
import json
import sys
import time
from collections import Counter

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import csr_matrix


def representations(target, lo, hi, least=None):
    """All nondecreasing multisets of allowed positive integers summing to t."""
    start = lo if least is None else least
    for first in range(start, min(hi, target) + 1):
        remainder = target - first
        if remainder == 0:
            yield (first,)
        elif remainder >= first:
            for rest in representations(remainder, lo, hi, first):
                yield (first,) + rest


def trial(n, m, j, max_coins=4, limit=0.15):
    target = m + j
    if (max_coins + 1) * j <= target or 2 * j > n + 1:
        return None, 'outside_restriction'
    vals = list(range(j, n + 2 - j))
    orbits = []
    for i in vals:
        r = n + 1 - i
        if i <= r:
            orbits.append((i,) if i == r else (i, r))
    index = {i: h for h, orbit in enumerate(orbits) for i in orbit}
    count = len(orbits)
    forbidden = {tuple(sorted({index[i] for i in rep}))
                 for rep in representations(target, j, n + 1 - j)}
    if (index[j],) in forbidden:
        return None, 'forced_support_represents_target'

    data, row_idx, col_idx, lower, upper = [], [], [], [], []

    def constrain(entries, lo, hi):
        r = len(lower)
        for c, value in entries.items():
            if value:
                row_idx.append(r)
                col_idx.append(c)
                data.append(value)
        lower.append(lo)
        upper.append(hi)

    for d in range(2, n + 1):
        row = {h: sum(int((m+i) % d == 0) - int(i % d == 0)
                      for i in orbit) for h, orbit in enumerate(orbits)}
        if any(row.values()):
            constrain(row, 0, np.inf)
    for h in range(count):
        constrain({h: 1, count+h: -64}, -np.inf, 0)
        constrain({h: 1, count+h: -1}, 0, np.inf)
    for group in forbidden:
        constrain({count+h: 1 for h in group}, -np.inf, len(group)-1)
    matrix = csr_matrix((data, (row_idx, col_idx)),
                        shape=(len(lower), 2*count), dtype=float)
    lb = np.zeros(2*count)
    ub = np.r_[np.full(count, 64), np.ones(count)]
    lb[index[j]] = 1
    result = milp(np.r_[[len(orb) for orb in orbits], np.zeros(count)],
                  integrality=np.ones(2*count), bounds=Bounds(lb, ub),
                  constraints=LinearConstraint(matrix, lower, upper),
                  options={'time_limit': limit})
    if result.x is None:
        return None, str(result.status)
    support = {i: int(round(result.x[h]))
               for h, orbit in enumerate(orbits) if result.x[h] > 0.5
               for i in orbit}
    assert min(support) == j
    assert all(support[n+1-i] == a for i,a in support.items())
    v = {d: sum(a*(int((m+i) % d == 0)-int(i % d == 0))
                for i,a in support.items()) for d in range(1, m+n+1)}
    assert min(v.values()) >= 0
    reachable = [False]*(target+1)
    reachable[0] = True
    for i in support:
        for t in range(i, target+1):
            reachable[t] |= reachable[t-i]
    assert not reachable[target]
    return {'n': n, 'm': m, 'support': support, 'target': target,
            'negative_coefficient': -support[j],
            'valuations': {d:a for d,a in v.items() if a}}, 'witness'


def main():
    bound = int(sys.argv[1]) if len(sys.argv)>1 else 100
    start_n = int(sys.argv[2]) if len(sys.argv)>2 else 3
    regime = sys.argv[3] if len(sys.argv)>3 else 'large_shift'
    start = time.monotonic()
    outcomes = Counter()
    for n in range(start_n, bound+1):
        shifts = range(n, n+12) if regime=='large_shift' else range(1,n)
        for m in shifts:
            for j in range(m//4+1, (n+1)//2+1):
                witness, status = trial(n,m,j)
                outcomes[status] += 1
                if witness is not None:
                    print(json.dumps(witness), flush=True)
                    return
        print(json.dumps({'n':n,'outcomes':dict(outcomes),
                          'elapsed':round(time.monotonic()-start,2)}),flush=True)


if __name__ == '__main__':
    main()
