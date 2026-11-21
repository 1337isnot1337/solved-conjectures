"""Check the Fibonacci period, pivotal residues and Catalan digit counts."""
from math import comb, gcd

MODULUS = 312018
FACTORS = (2, 3, 7, 17, 19, 23)


def fibonacci_period(modulus):
    terms = []
    a, b = 0, 1
    while True:
        terms.append(a)
        a, b = b, (a + b) % modulus
        if (a, b) == (0, 1):
            return terms


def catalan(index):
    return comb(2 * index, index) // (index + 1)


def main():
    terms = fibonacci_period(MODULUS)
    assert len(terms) == 144
    for residue, index in ((208641, 6), (218331, 30)):
        assert all(gcd(residue - f, MODULUS) > 1 for f in terms)
        assert gcd(residue - terms[index], MODULUS) == 23
    cats = [catalan(j) for j in range(23**2)]
    for p in FACTORS[1:]:
        h = (p + 1) // 2
        for b in (1, 2):
            assert sum(c % p != 0 for c in cats[:p**b]) == h**b + h**(b-1)
    for j, c in enumerate(cats):
        assert bool(c % 2) == ((j + 1) & j == 0)
    print("Period 144, both full residue covers, both pivotal classes and digit counts passed.")


if __name__ == "__main__":
    main()
