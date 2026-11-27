"""Independent finite checks of the dual-A minimum and its Hessian."""

from collections import defaultdict
from functools import cache
from itertools import product
from math import ceil, cos, exp, fsum, gcd, isclose, isqrt, log1p, pi, sin, sqrt


def mobius(n):
    p = 2
    sign = 1
    while p * p <= n:
        if n % p == 0:
            n //= p
            if n % p == 0:
                return 0
            sign = -sign
        p += 1
    return -sign if n > 1 else sign


@cache
def ramanujan(n, exponent):
    divisor = gcd(n, exponent)
    return sum(d * mobius(n // d) for d in range(1, divisor + 1) if divisor % d == 0)


def staircase_series(n, cutoff):
    """Specialize the zero-sum root-lattice theta series at a regular n-gon."""
    counts = {(0, 0, 0): 1}
    for j in range(n):
        extended = defaultdict(int)
        for (degree, total, residue), count in counts.items():
            bound = isqrt(cutoff - degree)
            for a in range(-bound, bound + 1):
                key = degree + a * a, total + a, (residue + j * a) % n
                extended[key] += count
        counts = extended
    # Every primitive character gives the same sum, by permuting the n labels.
    # Their average at residue r is the integer Ramanujan sum c_n(r) / phi(n).
    phi = ramanujan(n, 0)
    result = [0] * (cutoff + 1)
    for (degree, total, residue), count in counts.items():
        if total == 0:
            result[degree] += count * ramanujan(n, residue)
    if any(c % phi for c in result):
        raise ArithmeticError("nonintegral regular-phase coefficient")
    return [c // phi for c in result]


def euler_quotient(n, cutoff):
    coeffs = [1] + [0] * cutoff
    for k in range(2, cutoff + 1, 2):
        for _ in range(n):
            for r in range(cutoff, k - 1, -1):
                coeffs[r] -= coeffs[r - k]
        for r in range(n * k, cutoff + 1):
            coeffs[r] += coeffs[r - n * k]
    return coeffs


def direct_lattice(alpha, x, v, radius):
    """Enumerate representatives in Z^n modulo the integer diagonal.

    Along v in the sum-zero hyperplane, obtain the log-Hessian from the exact
    Gaussian derivative formula, independent of the theta Fourier computation.
    """
    n = len(x)
    norm_x = fsum(a * a for a in x)
    dot_xv = fsum(a * b for a, b in zip(x, v))
    grids = [range(-radius, radius + 1)] * (n - 1)
    lookups = [
        {k: (k * k - 2 * k * x[j], k * v[j]) for k in grids[j]}
        for j in range(n - 1)
    ]
    mass = first = second = 0.0
    for a in product(*grids):
        pairs = [lookup[k] for lookup, k in zip(lookups, a)]
        distance = norm_x + fsum(pair[0] for pair in pairs) - sum(a) ** 2 / n
        weight = exp(-alpha * distance)
        dot = fsum(pair[1] for pair in pairs) - dot_xv
        mass += weight
        first += dot * weight
        second += dot * dot * weight
    curvature = (4 * alpha**2 * (second / mass - (first / mass) ** 2)
                 - 2 * alpha * fsum(xi * xi for xi in v))
    return mass, curvature


def spectral_values(alpha, h, v):
    n = len(h)
    q = exp(-pi**2 / alpha)
    limit = ceil(30 * alpha / pi**2) + 2
    log_ratio = fsum(n * log1p(-q ** (2 * j)) - log1p(-q ** (2 * j * n))
                     for j in range(1, limit))
    mass = sqrt(n) * (pi / alpha) ** ((n - 1) / 2) * exp(log_ratio)
    terms = []
    for r in range(1, limit):
        re = fsum(a * cos(2 * pi * r * z) for a, z in zip(v, h))
        im = fsum(a * sin(2 * pi * r * z) for a, z in zip(v, h))
        t = q ** (2 * r)
        terms.append(t * (re * re + im * im) / (1 - t) ** 2)
    return mass, 8 * pi**2 * fsum(terms)


def main():
    for n in range(2, 12):
        if staircase_series(n, 30) != euler_quotient(n, 30):
            raise ArithmeticError(f"formal Euler quotient mismatch at N={n}")
    print("Exact integer coefficients through degree 30 agree for N=2,...,11.")
    for n in (3, 5, 6):
        h = [(j - (n - 1) / 2) / n for j in range(n)]
        v = [1, -1] + [0] * (n - 2)
        for alpha in (4, 9, 19):
            reference = spectral_values(alpha, h, v)
            observed = direct_lattice(alpha, h, v, 5)
            if any(not isclose(a, b, rel_tol=5e-10, abs_tol=4e-11)
                   for a, b in zip(reference, observed)):
                raise ArithmeticError(f"N={n}, alpha={alpha}: {observed} vs {reference}")
            x = [a + 0.12 * b for a, b in zip(h, v)]
            other = direct_lattice(alpha, x, v, 5)[0]
            if other <= observed[0] or observed[1] <= 0:
                raise ArithmeticError(f"unexpected sign at N={n}, alpha={alpha}")
            print(f"N={n} alpha={alpha:2d} mass={observed[0]:.10g} "
                  f"curvature={observed[1]:.10g} displaced ratio={other / observed[0]:.10g}")


if __name__ == "__main__":
    main()
