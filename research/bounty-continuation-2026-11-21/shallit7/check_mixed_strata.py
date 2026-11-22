"""Check the 105-run example using the shift operators in Kászonyi's Definition 4."""
from itertools import combinations


N = 105
PRIMES = (3, 5, 7)


def differences(vector, shifts):
    for shift in shifts:
        vector = [entry - vector[(i+shift) % N] for i, entry in enumerate(vector)]
    return vector


def main():
    steps = [N//p for p in PRIMES]
    pairs = tuple(combinations(PRIMES, 2))
    exponent = [sum(i % p == i % q == 0 for p, q in pairs) for i in range(N)]
    for constant in (0, 1, 23):
        vector = [constant + x for x in exponent]
        for size in (1, 2, 3):
            for subset in combinations(steps, size):
                assert any(differences(vector, subset)) == (size <= 2)
    # A pair-supported vector with zero full difference would make the images
    # of its basis vectors proportional. Its entries may have either sign.
    images = []
    for i in range(N):
        unit = [int(i == j) for j in range(N)]
        full = differences(unit, steps)
        support = frozenset(j for j, x in enumerate(full) if x)
        assert len(support) == 8
        images.append(support)
    assert len(set(images)) == N
    print('105 runs; each of the three pair differences is nonzero; triple difference vanishes.')
    print('All 105 columns of the triple-difference map have distinct eight-element supports.')


if __name__ == '__main__':
    main()
