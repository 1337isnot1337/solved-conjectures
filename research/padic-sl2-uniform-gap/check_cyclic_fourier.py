"""Check the integer autocorrelations underlying the exact Fourier overlaps."""

from math import gcd
from random import Random

from check_transfer import action, element


def projective_permutation(g, p, n):
    return [action(g, p * y, p * n, p * n)[0] // p for y in range(n)]


def permutation_power(perm, exponent):
    result = list(range(len(perm)))
    if exponent < 0:
        inverse = result.copy()
        for i, value in enumerate(perm):
            inverse[value] = i
        perm = inverse
        exponent = -exponent
    while exponent:
        if exponent % 2:
            result = [perm[x] for x in result]
        perm = [perm[x] for x in perm]
        exponent //= 2
    return result


def check_case(p, M, trials, word_depth=1):
    n = p**M
    q = p * n
    rng = Random(592 * q)
    for trial in range(trials):
        def higher():
            return p**2 * rng.randrange(q // p**2) if trial else 0

        z = element(1 + higher(), higher(), p + higher(), q)
        def deep_higher():
            step = p**(word_depth+1)
            return step * rng.randrange(q // step) if trial else 0

        w = element(1 + deep_higher(), p**word_depth + deep_higher(), deep_higher(), q)
        step = projective_permutation(z, p, n)
        orbit = [0]
        for _ in range(n - 1):
            orbit.append(step[orbit[-1]])
        assert step[orbit[-1]] == 0 and len(set(orbit)) == n
        inverse = [0] * n
        for k, value in enumerate(orbit):
            inverse[value] = k
        w_action = projective_permutation(w, p, n)
        for j in (-p, -1, 1, 2, p, p**2):
            iterate = permutation_power(w_action, j)
            f = [inverse[iterate[y]] for y in orbit]
            doubled = f + f
            for h in range(n):
                step_size = gcd(n, p**(word_depth+1) * j * h)
                counts = [0] * n
                for k, value in enumerate(f):
                    counts[(doubled[k + h] - value) % n] += 1
                # The claimed coset has n/step_size entries; the total
                # count is n, so this also checks vanishing off the coset.
                assert all(counts[a] == step_size
                           for a in range(h % step_size, n, step_size)), (p, M, trial, j, h)
    print(f"p={p}, M={M}, word depth {word_depth}: {trials} pairs, 6 powers, all {n} shifts and inputs")


if __name__ == "__main__":
    for prime, depth, pairs in ((3, 2, 4), (3, 4, 12), (3, 5, 5),
                                (5, 3, 8), (5, 4, 3), (7, 3, 5)):
        check_case(prime, depth, pairs)
    for prime, depth, word_depth in ((3, 5, 2), (3, 5, 3), (5, 4, 2)):
        check_case(prime, depth, trials=3, word_depth=word_depth)
