"""Exact exploratory coefficients; no finite scan is a conjecture proof."""
from math import comb
from time import perf_counter
import argparse
import sympy as s


def p_coeffs(n):
    """a[j][k] is [x^(j-k)y^k z^(n-j)]p_n, by Newton identities."""
    powers = [[0]] + [
        [n * (-1) ** (n * j) * comb(n * j, n * k)
         for k in range(j + 1)] for j in range(1, n + 1)
    ]
    a = [[1]]
    for j in range(1, n + 1):
        row = [0] * (j + 1)
        for i in range(1, j + 1):
            for u, au in enumerate(a[j - i]):
                for v, bv in enumerate(powers[i]):
                    row[u + v] -= au * bv
        assert all(v % j == 0 for v in row)
        a.append([v // j for v in row])
    return {(j - k, k, n - j): v
            for j, row in enumerate(a) for k, v in enumerate(row) if v}


def e_coeffs(n):
    x, y, z = s.symbols('x y z')
    p = s.Poly.from_dict(p_coeffs(n), (x, y, z))
    expr, remainder, mapping = s.symmetrize(p.as_expr(), (x, y, z), formal=True)
    assert remainder == 0
    e = s.Poly(expr, *(a for a, _ in mapping))
    return {mon: int(v) for mon, v in e.terms()}


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--max', type=int, default=20)
    args = parser.parse_args()
    for n in range(2, args.max + 1, 2):
        start = perf_counter()
        coeff = e_coeffs(n)
        absent = [(n - 2*b - 3*c, b, c)
                  for c in range(n//3 + 1)
                  for b in range((n - 3*c)//2 + 1)
                  if (n - 2*b - 3*c, b, c) not in coeff]
        signs = {(b % 2, c % 2): sorted(set(
                    1 if v > 0 else -1 for (a1,b1,c1),v in coeff.items()
                    if b1 % 2 == b % 2 and c1 % 2 == c % 2))
                 for b in range(2) for c in range(2)}
        print(n, 'terms', len(coeff), 'zeros', absent, 'signs', signs,
              'seconds', round(perf_counter()-start,3), flush=True)
        if absent:
            break
