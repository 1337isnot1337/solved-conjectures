"""Reconstruct rational projective matrices from three modular point matches."""

from math import gcd
from random import Random

from check_transfer import multiply


def apply_matrix(A, point):
    a, b, c, d = A
    x, y = point
    return a*x + b*y, c*x + d*y


def primitive(values):
    factor = gcd(*values)
    return tuple(x // factor for x in values)


def det3(rows):
    (a, b, c), (d, e, f), (g, h, i) = rows
    return a*(e*i - f*h) - b*(d*i - f*g) + c*(d*h - e*g)


def reconstruct(sources, targets):
    rows = [(v*x, v*y, -u*x, -u*y) for (x, y), (u, v) in zip(sources, targets)]
    return tuple((-1)**j * det3([row[:j] + row[j+1:] for row in rows]) for j in range(4))


def check(p):
    rng = Random(592 * p)
    count = 0
    for r in (0, 1, 2):
        M = 15 + 5*r
        N = p**M
        for trial in range(50):
            sources = ((0, 1), (p**r, 1), (2*p**r, 1))
            if r == 0 and trial % 2 == 0:
                sources = ((1, 0), (0, 1), (1, 1))
            while True:
                A = tuple(rng.randrange(-14, 15) for _ in range(4))
                if (A[0]*A[3] - A[1]*A[2]) % p:
                    break
            targets = [primitive(apply_matrix(A, x)) for x in sources]
            # This perturbation can disagree with the rational matrix at full
            # precision while having exactly the same three modular matches.
            actual = multiply(A, (1, 0, p**(M-2*r), 1), N)
            for x, (u, v) in zip(sources, targets):
                a, b = apply_matrix(actual, x)
                assert (a*v - b*u) % N == 0
            minors = reconstruct(sources, targets)
            H = max(abs(v) for pair in (*sources, *targets) for v in pair)
            assert 0 < max(map(abs, minors)) <= 6 * H**6
            loss = gcd(N, *minors)
            assert loss < N
            coeffs = primitive(minors)
            assert (coeffs[0]*coeffs[3] - coeffs[1]*coeffs[2]) % p
            for i in range(4):
                for j in range(i):
                    assert (coeffs[i]*actual[j] - coeffs[j]*actual[i]) % (N // loss) == 0
            assert coeffs == primitive(A) or coeffs == tuple(-x for x in primitive(A))
            count += 1
    print(f"p={p}: {count} projective reconstructions including colliding residue digits")


if __name__ == "__main__":
    for prime in (3, 5, 7):
        check(prime)
