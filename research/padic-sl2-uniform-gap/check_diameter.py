"""Count conjugator fibers and lift targets in the diameter construction."""

from collections import Counter
from itertools import product
from random import Random

from check_depth_words import inverse
from check_transfer import element, multiply


IDENTITY = (1, 0, 0, 1)


def layer_element(step, digits, modulus):
    h, e, f = digits
    return element((1 + step*h) % modulus, step*e % modulus, step*f % modulus, modulus)


def commutator(u, t, modulus):
    conjugate = multiply(multiply(u, t, modulus), inverse(u, modulus), modulus)
    return multiply(conjugate, inverse(t, modulus), modulus)


def deep_steps(p, d, modulus, rng):
    def perturb(axis):
        digits = tuple(x + p*rng.randrange(modulus // p**(d+1)) for x in axis)
        return layer_element(p**d, digits, modulus)

    return perturb((1, 0, 0)), perturb((0, 1, 1))


def count_fibers(p, a, d, digits, rng):
    modulus = p**(d+a+digits)
    first, second = deep_steps(p, d, modulus, rng)
    left, right = Counter(), Counter()
    for coordinates in product(range(p**digits), repeat=3):
        u = layer_element(p**a, coordinates, modulus)
        left[commutator(u, first, modulus)] += 1
        right[commutator(u, second, modulus)] += 1
    output = Counter()
    for g, ng in left.items():
        for h, nh in right.items():
            output[multiply(g, h, modulus)] += ng * nh
    assert len(output) == p**(3*digits)
    assert set(output.values()) == {p**(3*digits)}
    assert all(all((x-y) % p**(a+d) == 0 for x, y in zip(g, IDENTITY)) for g in output)
    return sum(output.values())


def lift_targets(p, a, d, digits, rng):
    modulus = p**(d+a+digits)
    first, second = deep_steps(p, d, modulus, rng)
    half = pow(2, -1, p)
    for _ in range(20):
        target = layer_element(p**(a+d), (rng.randrange(p**digits) for _ in range(3)), modulus)
        u = v = current = IDENTITY
        for i in range(a, a+digits):
            step = p**(d+i)
            error = multiply(target, inverse(current, modulus), modulus)
            assert all((x-y) % step == 0 for x, y in zip(error, IDENTITY))
            h, e, f = ((error[0]-1) // step, error[1] // step, error[2] // step)
            # [X,H]+[Y,E+F]=(h,e,f) for these two perturbations.
            adjust_u = layer_element(p**i, (0, -half*e % p, half*f % p), modulus)
            adjust_v = layer_element(p**i, (0, h % p, 0), modulus)
            u, v = multiply(adjust_u, u, modulus), multiply(adjust_v, v, modulus)
            current = multiply(commutator(u, first, modulus), commutator(v, second, modulus), modulus)
        assert current == target
    return 20*digits


if __name__ == "__main__":
    random = Random(592)
    cases = ((3, 1, 1, 2), (3, 2, 1, 2), (3, 1, 3, 2), (5, 1, 2, 2), (7, 1, 3, 1))
    pairs = sum(count_fibers(*case, random) for case in cases)
    lifts = sum(lift_targets(p, a, d, 8, random) for p, a, d in product((3, 5, 7), (1, 2), (1, 3, 5)))
    print(f"Verified equal fibers for {pairs:,} conjugator pairs and {lifts:,} successive target digits.")
