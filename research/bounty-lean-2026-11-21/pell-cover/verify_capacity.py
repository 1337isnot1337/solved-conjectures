"""Independent, integer-only checker for a finite-period covering obstruction.

Usage: python verify_capacity.py capacity120-odd.json
No optimizer, NumPy, or SymPy is used. The default period-120 prime list is
checked by trial division and complete product reconstruction.
"""
import json
from math import gcd, isqrt, prod
from pathlib import Path
import sys


def pair(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, 2 * b + a
    return a, b


def verify(path):
    data = json.loads(Path(path).read_text())
    period = data["period"]
    assert type(period) is int
    assert type(data["n_parity"]) is int and data["n_parity"] in (0, 1)
    assert type(data["total_weight"]) is int and type(data["total_capacity"]) is int
    assert period == 120, "This standalone verifier supplies the period-120 factorization only."
    factors = {2: 3, 3: 2, 5: 2, 7: 1, 11: 1, 19: 1,
               29: 1, 31: 2, 41: 1, 59: 1, 269: 1, 601: 1, 2281: 1}
    for p in factors:
        assert all(p % d for d in range(2, isqrt(p) + 1))
    a, b = pair(period)
    assert prod(p**e for p, e in factors.items()) == gcd(a, b - 1)
    cells = data["weighted_cells"]
    assert type(cells) is list and cells
    assert all(type(cell) is list and len(cell) == 3 and all(type(x) is int for x in cell)
               for cell in cells)
    assert len({(s, t) for s, t, w in cells}) == len(cells)
    assert all(type(r) is int for r in data["fixed_congruences"].values())
    assert all(type(c) is int for c in data["capacities"].values())
    fixed = {int(p): int(r) for p, r in data["fixed_congruences"].items()}
    assert set(fixed).issubset(set(factors) - {2})
    assert all(0 <= r < p for p, r in fixed.items())
    pell = [pair(i)[0] for i in range(period)]
    total_weight = 0
    for s, t, w in cells:
        assert 0 <= s < period and 0 <= t < period and w > 0
        assert s % 2 != data["n_parity"]
        assert all((pell[s] + 2 * pell[t]) % p != r for p, r in fixed.items())
        total_weight += w
    capacities = {}
    for p in factors:
        if p == 2 or p in fixed:
            continue
        buckets = {}
        for s, t, w in cells:
            r = (pell[s] + 2 * pell[t]) % p
            buckets[r] = buckets.get(r, 0) + w
        capacities[p] = max(buckets.values(), default=0)
    total_capacity = sum(capacities.values())
    assert total_weight == data["total_weight"]
    assert total_capacity == data["total_capacity"]
    assert capacities == {int(p): c for p, c in data["capacities"].items()}
    assert total_capacity < total_weight
    return {"certificate": str(path), "verified": True, "total_weight": total_weight,
            "total_capacity": total_capacity, "scope": "finite-period covering method only"}


if __name__ == "__main__":
    for arg in sys.argv[1:]:
        print(json.dumps(verify(arg)))
