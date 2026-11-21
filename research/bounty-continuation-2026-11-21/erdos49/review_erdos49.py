"""Independent finite cross-check of the E49 blocker reformulation, not a bounty solution."""
from bisect import bisect_left
from math import gcd
import json
from pathlib import Path

LIMIT = 30
phi = [0] + [sum(gcd(n, k) == 1 for k in range(1, n + 1)) for n in range(1, LIMIT + 1)]
primes = [p for p in range(2, LIMIT + 1) if phi[p] == p - 1]
pi = [sum(p <= n for p in primes) for n in range(LIMIT + 1)]
composites = [n for n in range(4, LIMIT + 1) if phi[n] != n - 1]
blockers = {c: frozenset(p for p in primes if phi[c] < p < c) for c in composites}

def strict_length(seq):
    tails = []
    for t in seq:
        j = bisect_left(tails, t)
        if j == len(tails): tails.append(t)
        else: tails[j] = t
    return len(tails)

count = 0
best_by_endpoint = [0] * (LIMIT + 1)
max_chain_length = 0

def visit(chain, after, blocked):
    global count, max_chain_length
    count += 1
    max_chain_length = max(max_chain_length, len(chain))
    if chain:
        last = chain[-1]
        best_by_endpoint[last] = max(best_by_endpoint[last], len(chain) - len(blocked))
        adjoined = sorted(set(chain) | {p for p in primes if p <= last and p not in blocked})
        assert all(phi[x] < phi[y] for x, y in zip(adjoined, adjoined[1:]))
        assert len(adjoined) == pi[last] + len(chain) - len(blocked)
        # Union decomposition into connected intervals of prime indices.
        components = []
        for c in chain:
            L, U = pi[phi[c]] + 1, pi[c]
            assert U - L + 1 == len(blockers[c])
            if L > U:
                # General proof must handle this before component formation.
                continue
            if not components or L > components[-1][1] + 1:
                components.append([L, U])
            else:
                components[-1][1] = U
        assert sum(U - L + 1 for L, U in components) == len(blocked)
    for j in range(after, len(composites)):
        c = composites[j]
        if not chain or phi[chain[-1]] < phi[c]:
            visit(chain + [c], j + 1, blocked | blockers[c])

visit([], 0, frozenset())
max_gain = 0
for N in range(2, LIMIT + 1):
    max_gain = max(max_gain, best_by_endpoint[N])
    assert strict_length(phi[1:N + 1]) == pi[N] + max_gain
assert blockers[4] == {3}
assert phi[4] == phi[3] == 2
assert 3 in blockers[4]
assert 2 not in blockers[4]
result = {
    "status": "passed",
    "method": "enumerated every strictly increasing totient composite chain up to N=30",
    "chains_including_empty": count,
    "largest_chain_size": max_chain_length,
    "prefixes_compared_against_independent_LIS": [2, LIMIT],
    "endpoint_check_c4": {"phi": phi[4], "blockers": sorted(blockers[4])},
    "new_bounty_solutions": 0,
}
Path(__file__).with_name('erdos49-review-check.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
