"""Check the conventions used in the proof of Chow's conjecture.

These finite exact checks are not the all-rank proof. They independently
enumerate the defining signed permutations and compare two recurrences.
Requires SymPy for exact polynomial gcds.
"""

from itertools import permutations, product
import sympy as sp

x = sp.Symbol("x")


def next_row(row, n):
    assert len(row) == 2 * n
    total = sum(row)
    prefix = [sp.Integer(0)]
    for f in row:
        prefix.append(prefix[-1] + f)
    return [sp.expand(total + (x - 1) * prefix[(n * i + n) // (n + 1)])
            for i in range(2 * n + 2)]


def defining_polynomial(n):
    counts = [0] * (n + 1)
    for p in permutations(range(1, n + 1)):
        for signs in product((-1, 1), repeat=n):
            if sum(s < 0 for s in signs) % 2:
                continue
            w = tuple(a * s for a, s in zip(p, signs))
            descents = int(w[0] + w[1] < 0)
            descents += sum(w[i] > w[i + 1] for i in range(n - 1))
            counts[descents] += 1
    return sum(c * x**i for i, c in enumerate(counts))


def main():
    a = [sp.Integer(1)]
    b = [sp.Integer(1)]
    for n in range(1, 33):
        a.append(sp.expand((1 + (n - 1) * x) * a[-1]
                           + x * (1 - x) * sp.diff(a[-1], x)))
        b.append(sp.expand((1 + (2 * n - 1) * x) * b[-1]
                           + 2 * x * (1 - x) * sp.diff(b[-1], x)))
    row = [sp.Integer(2), 2 * x, 2 * x, 2 * x*x]
    previous = None
    for n in range(2, 33):
        d = sp.expand(sum(row) / 2)
        independent = sp.expand(b[n] - n * 2**(n - 1) * x * a[n - 1])
        assert d == independent, ("Stembridge mismatch", n)
        assert sp.degree(d, x) == n
        if n <= 6:
            assert d == defining_polynomial(n), ("definition mismatch", n)
        if n >= 3:
            assert sp.degree(sp.gcd(d, sp.diff(d, x)), x) == 0
        if n >= 4:
            assert sp.degree(sp.gcd(d, previous), x) == 0
        cutoffs = [(n * i + n) // (n + 1) for i in range(2 * n + 2)]
        assert set(cutoffs) == set(range(2 * n + 1))
        new = next_row(row, n)
        assert sp.expand(new[0] - 2*d) == 0
        assert sp.expand(new[-1] - 2*x*d) == 0
        # Two adjacent cutoff classes differ by (x-1) times one old entry.
        representatives = {t: i for i, t in enumerate(cutoffs)}
        for j in range(2 * n):
            assert sp.expand(new[representatives[j+1]]
                             - new[representatives[j]]
                             - (x-1)*row[j]) == 0
        previous, row = d, new
    print("PASS: defining signed permutations agree for n=2..6")
    print("PASS: refined recurrence equals Stembridge identity for n=2..32")
    print("PASS: exact degree, squarefreeness, consecutive gcd, cutoff and difference checks")
    print("Finite checks only; the all-rank proof is in research/chow/proof.md")


if __name__ == "__main__":
    main()
