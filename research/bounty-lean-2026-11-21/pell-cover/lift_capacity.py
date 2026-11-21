"""Recompute exact capacities of the period-120 certificates lifted to 840.

These particular lifts fail to give an obstruction. The output records exact
integers and does not infer that no other weight assignment could succeed.
"""
import json
from math import gcd, prod
from pathlib import Path


def pair(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, 2*b + a
    return a, b


def main():
    period = 840
    factors = {int(p): e for p, e in json.loads(Path("period840-primes.json").read_text()).items()}
    a, b = pair(period)
    assert prod(p**e for p, e in factors.items()) == gcd(a, b-1)
    primes = [p for p in factors if p > 2]
    exact_pell = [pair(i)[0] for i in range(period)]
    values = {p: [x % p for x in exact_pell] for p in primes}
    out = []
    sources = ["capacity120-odd.json"] + [f"capacity120-even-mod3-{a}.json" for a in range(3)]
    for source in sources:
        data = json.loads(Path(source).read_text())
        assert data["period"] == 120
        fixed = {int(p): r for p, r in data["fixed_congruences"].items()}
        cells = [(s+120*i, t+120*j, w) for s, t, w in data["weighted_cells"]
                 for i in range(7) for j in range(7)]
        capacities = {}
        for p in primes:
            if p in fixed:
                assert all((values[p][s]+2*values[p][t]) % p != fixed[p] for s, t, w in cells)
                continue
            buckets = {}
            for s, t, w in cells:
                r = (values[p][s] + 2*values[p][t]) % p
                buckets[r] = buckets.get(r, 0) + w
            capacities[p] = max(buckets.values())
        weight = sum(w for s, t, w in cells)
        capacity = sum(capacities.values())
        record = {"source_certificate": source, "lifted_period": period,
                  "weighted_cells": len(cells), "total_weight": weight,
                  "total_capacity": capacity, "capacities": capacities,
                  "capacity_ratio_approx": capacity/weight,
                  "obstruction_obtained": capacity < weight}
        out.append(record)
        print(json.dumps({k: v for k, v in record.items() if k != "capacities"}), flush=True)
    Path("lift840-summary.json").write_text(json.dumps(out, indent=2) + "\n")


if __name__ == "__main__":
    main()
