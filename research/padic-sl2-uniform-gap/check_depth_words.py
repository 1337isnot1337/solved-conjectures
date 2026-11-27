"""Compare Fibonacci word evaluations with their predicted first Lie digits."""

from itertools import product
from random import Random

from check_transfer import bracket, element, multiply


AXES = ((1, 0, 0), (0, 1, 1), (0, 1, -1))


def inverse(g, modulus):
    a, b, c, d = g
    return (d, -b % modulus, -c % modulus, a)


def lifted(axis, depth, p, modulus, rng):
    scalar = rng.randrange(1, p)
    step = p**depth
    digits = tuple(scalar*x % p for x in axis)
    h, e, f = (step*(x + p*rng.randrange(modulus // (p*step))) for x in digits)
    return element(1+h, e, f, modulus), digits


def check(p, a, b, steps, rng):
    depths = [b, b+a]
    while len(depths) <= steps:
        depths.append(depths[-1] + depths[-2])
    modulus = p**(depths[-1]+1)
    final_axes = set()
    for axis in range(3):
        first, first_digit = lifted(AXES[axis], a, p, modulus, rng)
        second, second_digit = lifted(AXES[(axis+1) % 3], b, p, modulus, rng)
        u = inverse(second, modulus)
        v = multiply(multiply(first, second, modulus), inverse(first, modulus), modulus)
        digits = [tuple(-x % p for x in second_digit), bracket(first_digit, second_digit, p)]
        for i, depth in enumerate(depths):
            if i >= 2:
                digits.append(bracket(digits[i-2], digits[i-1], p))
            h, e, f = digits[i]
            want = (h, e, f, -h % p)
            step = p**depth
            actual = (u[0]-1, u[1], u[2], u[3]-1)
            assert all(z % (p*step) == step*x for z, x in zip(actual, want))
            assert any(want)
            if i == steps:
                pivot = next(x for x in (h, e, f) if x)
                final_axes.add(tuple(x*pow(pivot, -1, p) % p for x in (h, e, f)))
            u, v = (multiply(u, v, modulus),
                    multiply(inverse(u, modulus), inverse(v, modulus), modulus))
    assert final_axes == {tuple(x % p for x in axis) for axis in AXES}
    return 3 * len(depths)


if __name__ == "__main__":
    random = Random(592)
    total = sum(check(p, a, b, j, random) for p, a, b, j in
                product((3, 5, 7), (1, 2, 5), (1, 3), (3, 6, 9)))
    print(f"Verified {total:,} exact word depths and digits, including all three axes.")
