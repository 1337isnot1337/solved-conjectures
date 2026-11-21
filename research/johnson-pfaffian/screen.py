"""Exact exploratory screen for Johnson Conjecture 7.1.

The kernels are f(r)=product(base**max(knot-r,0)).  Their logarithms
are positive sums of decreasing convex hinge functions.  Finite positive
checks are diagnostics only.  No output is a proof without a certificate.
"""
from functools import lru_cache
from pathlib import Path
import json
import random
import time


def evaluate(points, hinges):
    n = len(points)
    a = [[0] * n for _ in range(n)]
    for i in range(n):
        for j in range(i + 1, n):
            d = points[j] - points[i]
            a[i][j] = 1
            for knot, base in hinges:
                a[i][j] *= base ** max(knot - d, 0)

    @lru_cache(None)
    def rec(vertices):
        if not vertices:
            return 1, 1, ()
        i = vertices[0]
        pf = 0
        best = 0
        matching = None
        for pos, j in enumerate(vertices[1:], 1):
            tail = vertices[1:pos] + vertices[pos + 1:]
            subpf, subbest, submatching = rec(tail)
            pf += (-1) ** (pos + 1) * a[i][j] * subpf
            candidate = a[i][j] * subbest
            if candidate > best:
                best = candidate
                matching = ((i, j),) + submatching
        return pf, best, matching

    return rec(tuple(range(n)))


def main():
    rng = random.Random(261024371)
    count = 0
    begin = time.monotonic()
    for n in (6, 8, 10, 12):
        for case in range(1500):
            points = [0]
            for _ in range(n - 1):
                points.append(points[-1] + rng.randint(1, 12))
            hinges = [(rng.randint(2, points[-1] + 10), rng.choice((2, 3, 5)))
                      for _ in range(rng.randint(1, 4))]
            pf, maximum, matching = evaluate(points, hinges)
            count += 1
            if pf < maximum:
                result = {'points': points, 'hinges': hinges,
                          'pfaffian': str(pf), 'maximum_matching_product': str(maximum),
                          'matching': matching, 'case': case, 'count': count}
                Path(__file__).with_name('candidate.json').write_text(json.dumps(result, indent=2))
                print('CANDIDATE', json.dumps(result), flush=True)
                return
        print('completed', n, count, 'seconds', time.monotonic() - begin, flush=True)
    print('No obstruction in the stated finite screen; no universal conclusion.', flush=True)


if __name__ == '__main__':
    main()
