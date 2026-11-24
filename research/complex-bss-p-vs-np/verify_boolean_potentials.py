"""Exact finite checks for signs and normalizations in the research note.

These checks do not prove the general statements; their proofs are in
BOOLEAN_POTENTIAL_RESULTS.md.
"""

from itertools import permutations, product

import sympy as sp


def permanent(matrix):
    m = matrix.rows
    return sp.expand(
        sum(sp.prod(matrix[i, p[i]] for i in range(m)) for p in permutations(range(m)))
    )


def check_rank_case(m, rank):
    b = sp.symbols(f"b0:{m}")
    s = sp.symbols(f"s0:{rank}")
    u = sp.Matrix(m, rank, lambda i, a: i + a + 1 + sp.I * ((i + a) % 2))
    v = sp.Matrix(rank, m, lambda a, j: (-1) ** (a + j) * (a + j + 1))
    x = u * v
    y = permanent(x)
    p = sp.prod(sum(u[i, a] * s[a] for a in range(rank)) for i in range(m))
    differences = [sp.expand(p)]
    for j in range(m):
        previous = differences[-1]
        translated = previous.subs(
            {s[a]: s[a] + v[a, j] for a in range(rank)}, simultaneous=True
        )
        differences.append(sp.expand(translated - previous))
        assert sp.Poly(differences[-1], *s).total_degree() <= m - j - 1
    assert sp.expand(differences[-1] - y) == 0

    residuals = []
    for pfx in range(m + 1):
        subs = {s[a]: sum(v[a, j] * b[j] for j in range(pfx, m)) for a in range(rank)}
        conditional = (
            sp.Rational(1, 2**pfx)
            * sp.prod(2 * b[j] - 1 for j in range(pfx, m))
            * differences[pfx].subs(subs, simultaneous=True)
        )
        delta = sp.Rational(1, 2**pfx) * sp.prod(1 - b[j] for j in range(pfx, m))
        residuals.append(conditional - y * delta)

    for bits in product((0, 1), repeat=m):
        at = dict(zip(b, bits))
        divergence = 0
        for i in range(m):
            flipped = dict(at)
            flipped[b[i]] = 1 - bits[i]
            divergence += (residuals[i].subs(at) - residuals[i].subs(flipped)) / 2
        assert sp.expand(residuals[0].subs(at) - divergence) == 0

    def kernel(values):
        return sp.prod(2 * q - 1 for q in values) * sp.prod(
            sum(x[i, j] * values[j] for j in range(m)) for i in range(m)
        )

    for offset in (0, 1):
        at = [sp.Rational(j + 2 + offset, j + 3) for j in range(m)]
        average = sum(
            kernel([1 - at[j] if flip[j] else at[j] for j in range(m)])
            for flip in product((0, 1), repeat=m)
        ) / 2**m
        expected = y * sp.prod((2 * q - 1) ** 2 for q in at) / 2**m
        assert sp.expand(average - expected) == 0


def check_delta_path(m):
    for c in product((0, 1), repeat=m):
        vertices = [tuple(c[j] if j < i else 0 for j in range(m)) for i in range(m + 1)]
        for b in product((0, 1), repeat=m):
            divergence = 0
            for i in range(m):
                if c[i]:
                    flipped = tuple(1 - b[j] if j == i else b[j] for j in range(m))
                    divergence += int(b == vertices[i + 1]) - int(flipped == vertices[i + 1])
            residual = -int(b == (0,) * m) - divergence
            assert residual == -int(b == c)


def check_quotient_recurrence():
    b, z = sp.symbols("b z")
    for a, c in ((b**2 + z, b**3 - 1), ((b - z) ** 5, b**4 + z * b + 2)):
        a0, a1 = a.subs(b, 0), a.subs(b, 1)
        c0, c1 = c.subs(b, 0), c.subs(b, 1)
        ra, rc = (1 - b) * a0 + b * a1, (1 - b) * c0 + b * c1
        g = b**2 - b
        ha, hc = sp.div(sp.expand(a - ra), g, b)[0], sp.div(sp.expand(c - rc), g, b)[0]
        h_product = ha * c + ra * hc + (a1 - a0) * (c1 - c0)
        r_product = (1 - b) * a0 * c0 + b * a1 * c1
        assert sp.expand(a * c - r_product - g * h_product) == 0


if __name__ == "__main__":
    rank_cases = [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (2, 2), (3, 2), (4, 2)]
    for m, rank in rank_cases:
        check_rank_case(m, rank)
    for m in range(1, 7):
        check_delta_path(m)
    check_quotient_recurrence()
    print(f"PASS: {len(rank_cases)} exact complex rank cases; delta paths m=1..6; quotient recurrence.")
