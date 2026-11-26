"""Exact finite checks for the projective-ball transfer in issue 592."""

from itertools import product
from random import Random


def pairing(x, y, p):
    # (h, e, f) denotes [[h, e], [f, -h]].
    h, e, f = x
    k, b, c = y
    return (2 * h * k + e * c + f * b) % p


def bracket(x, y, p):
    h, e, f = x
    k, b, c = y
    return ((e * c - f * b) % p, 2 * (h * b - e * k) % p,
            2 * (f * k - h * c) % p)


def check_planes(p):
    algebra = list(product(range(p), repeat=3))
    nonzero = set(algebra) - {(0, 0, 0)}
    planes = {}
    for a in nonzero:
        plane = {b for b in algebra if pairing(a, b, p) == 0}
        assert len(plane) == p**2
        assert {bracket(d, a, p) for d in algebra} == plane
        planes[a] = plane - {(0, 0, 0)}
    for a in nonzero:
        assert set.union(*(planes[b] for b in planes[a])) == nonzero
    print(f"p={p}: all {len(nonzero)**2} ordered nonzero character pairs")


def multiply(g, h, q):
    a, b, c, d = g
    e, f, i, j = h
    return ((a * e + b * i) % q, (a * f + b * j) % q,
            (c * e + d * i) % q, (c * f + d * j) % q)


def element(a, b, c, q):
    return (a, b, c, (1 + b * c) * pow(a, -1, q) % q)


def action(g, x, q, coarse):
    a, b, c, d = g
    weight = (a + b * x) % q
    slope = (c + d * x) * pow(weight, -1, coarse) % coarse
    return slope, weight


def check_action(p, k, exhaustive=True):
    q = p**k
    coarse = q // p
    shift = coarse // p
    step = range(0, q, p)
    rng = Random(592 * q)

    def sample():
        return element(1 + rng.choice(step), rng.choice(step), rng.choice(step), q)

    if exhaustive:
        elements = (element(1 + a, b, c, q) for a, b, c in product(step, repeat=3))
    else:
        elements = (sample() for _ in range(120))

    count = 0
    for g in elements:
        h = sample()
        gh = multiply(g, h, q)
        beta = g[1] // p % p
        diag = (g[0] - 1) // p % p
        assert gh[1] // p % p == (beta + h[1] // p) % p
        assert (gh[0] - 1) // p % p == (diag + (h[0] - 1) // p) % p
        fixed_phases = [0] * p
        for x in range(0, coarse, p):
            gx, weight = action(g, x, q, coarse)
            neighbor, next_weight = action(g, (x + shift) % coarse, q, coarse)
            assert neighbor == (gx + shift) % coarse
            assert next_weight == weight * (1 + coarse * beta) % q
            if k >= 4:
                # On X_(k-1), a one-digit longer shift picks up the
                # diagonal character after the sibling phase is removed.
                longer = shift // p
                shifted, _ = action(g, (x + longer) % coarse, q, coarse)
                assert shifted == (gx + longer - 2 * diag * shift) % coarse
            hx, hw = action(h, x, q, coarse)
            after, gw = action(g, hx, q, coarse)
            assert action(gh, x, q, coarse) == (after, hw * gw % q)
            if gx == x and weight % coarse == 1:
                fixed_phases[2 * ((weight - 1) // coarse) % p] += 1

        # Sum the induced characters over the allowed diagonal twists by
        # orthogonality. Divide out their count and the common multiplicity.
        # The regular H-sector character is supported on the last layer.
        a, b, c, d = g
        if (a % coarse, b % coarse, c % coarse, d % coarse) == (1, 0, 0, 1):
            last_phase = ((a - 1) // coarse - (d - 1) // coarse) % p
            fixed_phases[last_phase] -= coarse // p
        # An integer combination of p-th roots is zero iff all counts agree.
        assert len(set(fixed_phases)) == 1
        count += 1
    if exhaustive:
        assert count == p ** (3 * (k - 1))
    print(f"p={p}, level={k}: {count} matrices, {coarse // p} slopes each"
          + (" (exhaustive)" if exhaustive else " (seeded sample)"))


if __name__ == "__main__":
    for prime in (3, 5, 7):
        check_planes(prime)
    for prime, level in ((3, 3), (3, 4), (5, 3)):
        check_action(prime, level)
    for prime, level in ((3, 6), (5, 5), (7, 4)):
        check_action(prime, level, exhaustive=False)
