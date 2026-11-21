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
    old_residue = 208641
    exceptional = {i for i, f in enumerate(terms) if gcd(old_residue - f, MODULUS) == 23}
    assert exceptional == {6, 66, 102, 114}
    modulus = MODULUS * 47 * 107 * 1103
    residue = 182449613961
    assert modulus == 1730759789766 and residue % MODULUS == old_residue
    lifted_terms = fibonacci_period(modulus)
    assert len(lifted_terms) == 288 and gcd(residue - lifted_terms[3], modulus) == 19
    for i in (6, 102, 150, 246):
        assert lifted_terms[i] % 107 == residue % 107 == 8
    for i in (66, 258):
        assert lifted_terms[i] % 47 == residue % 47 == 1
    for i in (114, 210):
        assert lifted_terms[i] % 1103 == residue % 1103 == 378
    cats = [catalan(j) for j in range(23**2)]
    for p in FACTORS[1:]:
        h = (p + 1) // 2
        for b in (1, 2):
            assert sum(c % p != 0 for c in cats[:p**b]) == h**b + h**(b-1)
    for j, c in enumerate(cats):
        assert bool(c % 2) == ((j + 1) & j == 0)
    print("Periods 144 and 288, all residue covers, pivotal classes and digit counts passed.")


if __name__ == "__main__":
    main()
