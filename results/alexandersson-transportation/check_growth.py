"""Exact checks of the Rodrigues identities, energy calculation, and sample root counts."""

from fractions import Fraction
from math import comb


def evaluate(p, x):
    result = 0
    for coefficient in reversed(p):
        result = result * x + coefficient
    return result


def rodrigues(n):
    # Coefficient of x^j after differentiating (x^2 - 1)^n n times
    # and dividing by 2^n n!.
    return [
        Fraction((-1) ** (n - (j + n) // 2) * comb(n, (j + n) // 2)
                 * comb(n + j, n), 2**n) if (j + n) % 2 == 0 else 0
        for j in range(n + 1)
    ]


def energy_identity(x, c, y, d):
    gap = 1 - x*x
    weight = 4*c + 1
    momentum = 2*gap*d - x*y
    denominator = weight*gap + 1
    # Both sides are multiplied by sqrt(gap) * denominator^2.
    left = -x*(y*y*denominator**2 + momentum**2*denominator)
    left += gap*(2*y*d*denominator**2
                 + 2*momentum*(-x*d-(2*c+1)*y)*denominator
                 + 2*weight*x*momentum**2)
    assert left == -2*x*momentum**2


def check():
    from check import sturm

    substitutions = 0
    energy_values = 0
    for n in range(33):
        p = rodrigues(n)
        coeff = p + [0, 0]
        for j, v in enumerate(p):
            assert (j*(j+1)-n*(n+1))*v == (j+1)*(j+2)*coeff[j+2]
        k = n//2
        central = Fraction(comb(2*k, k), 4**k)
        assert (k+1)*central**2 <= 1
        assert coeff[0] == ((-1)**k*central if n % 2 == 0 else 0)
        assert coeff[1] == ((-1)**k*n*central if n % 2 else 0)
        raw = [comb(n, j)**2 for j in range(n+1)]
        for z in map(Fraction, ('0', '1/32', '1/8', '1/3', '1', '3/2')):
            x = (1-z)/(1+z)
            assert evaluate(raw, -z) == (1+z)**n*evaluate(p, x)
            substitutions += 1
        for x in map(Fraction, ('0', '1/8', '1/2', '3/4', '31/32')):
            for y, d in ((-3, 2), (1, -4), (2, 0), (0, 7)):
                energy_identity(x, n*(n+1), y, d)
                energy_values += 1
    print(f'33 polynomial differential equations, {substitutions} exact substitutions, '
          f'{energy_values} rational energy identities.')
    counts = []
    for n in (12, 16, 24, 32, 48, 64):
        p = [comb(n, j)**2-(n if j == 1 else 0) for j in range(n+1)]
        left, right = sturm(p)
        counts.append((n, n-(left-right)))
    print('Exact nonreal counts by degree:', counts)
    assert counts[0] == (12, 2)


if __name__ == '__main__':
    check()
