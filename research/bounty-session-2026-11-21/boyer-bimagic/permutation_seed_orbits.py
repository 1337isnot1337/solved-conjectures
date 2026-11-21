"""Exact orbit audit for permutation seeds in the restricted Boyer ansatz.

Convention: p maps the basis vector e_i to e_{p(i)}. Matrices using row
permutations instead give the inverses; all three orbit conclusions agree.
"""
import hashlib
import itertools
import json
from pathlib import Path


N = 5
IDENTITY = tuple(range(N))
REVERSAL = tuple(reversed(range(N)))


def compose(p, q):
    return tuple(p[q[i]] for i in range(N))


def inverse(p):
    return tuple(p.index(i) for i in range(N))


def order(p):
    q, n = IDENTITY, 0
    while True:
        q = compose(q, p)
        n += 1
        if q == IDENTITY:
            return n


def trace(p):
    return sum(p[i] == i for i in range(N))


def main():
    permutations = list(itertools.permutations(range(N)))
    centralizer = [s for s in permutations
                   if compose(s, REVERSAL) == compose(REVERSAL, s)]
    seeds = [p for p in permutations if order(p) == 4
             and trace(p) == trace(compose(REVERSAL, p)) == 1]
    remaining, orbits = set(seeds), []
    while remaining:
        representative = min(remaining)
        orbit = {compose(compose(s, representative), inverse(s)) for s in centralizer}
        assert orbit <= set(seeds)
        remaining -= orbit
        orbits.append({
            "representative": representative,
            "members": sorted(orbit),
            "size": len(orbit),
            "affine_b_values": [b for b in range(N)
                                if tuple((2*i+b) % N for i in range(N)) in orbit],
            "all_commute_with_reversal": all(compose(p, REVERSAL) == compose(REVERSAL, p)
                                              for p in orbit),
        })
    assert len(centralizer) == 8 and len(seeds) == 18
    assert [o["size"] for o in orbits] == [8, 8, 2]
    assert {inverse(p) for p in orbits[0]["members"]} == set(orbits[1]["members"])
    assert orbits[2]["all_commute_with_reversal"]
    source = Path(__file__)
    result = {
        "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "permutations_checked": len(permutations),
        "permutation_centralizer_size": len(centralizer),
        "eligible_order_four_seeds": len(seeds),
        "orbits": orbits,
        "first_two_orbits_related_by_transposition": True,
        "third_orbit_commutes_with_reversal": True,
        "scope": "Classification of permutation seeds only; not all rational orthogonal matrices.",
    }
    output = source.with_name("permutation_seed_orbits.json")
    output.write_text(json.dumps(result, indent=2)+"\n")
    print(json.dumps({k: result[k] for k in ["permutations_checked", "permutation_centralizer_size",
                                           "eligible_order_four_seeds", "first_two_orbits_related_by_transposition",
                                           "third_orbit_commutes_with_reversal"]}))


if __name__ == "__main__":
    main()
