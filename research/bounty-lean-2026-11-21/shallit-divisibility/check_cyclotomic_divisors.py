"""Exact arithmetic checks and one unbounded unary-automaton replay."""

from functools import cache
from itertools import product
from math import gcd, lcm
from random import Random


def multiplicative_order(base, modulus):
    value = base % modulus
    exponent = 1
    while value != 1:
        value = value * base % modulus
        exponent += 1
    return exponent


def check_loop_insertions():
    rng = Random(229)
    checked = 0
    for base, width in ((2, 2), (2, 3), (3, 2), (5, 1)):
        slope = base**width
        for modulus in range(2, 65):
            if gcd(modulus, base) != 1:
                continue
            order = multiplicative_order(base, modulus)
            low, high = sorted(rng.sample(range(slope), 2))
            for offset in range(modulus):
                digits = []
                value = offset
                for _ in range(order):
                    value, digit = divmod(value, slope)
                    digits.append(digit)
                assert value == 0
                start = rng.randrange(modulus)
                state = start
                for pass_number in range(slope - 1):
                    for digit in reversed(digits):
                        block = high if digit > pass_number else low
                        state = (slope * state + block) % modulus
                assert state == (start + (high - low) * offset) % modulus
                checked += 1
    return checked


def evaluate(coefficients, x):
    value = 0
    for coefficient in reversed(coefficients):
        value = value * x + coefficient
    return value


def monomial_remainders(polynomial, rows):
    degree = len(polynomial) - 1
    current = [1] + [0] * (degree - 1)
    result = []
    for _ in range(rows):
        result.append(current)
        top = current[-1]
        current = [a - top * b for a, b in zip([0] + current[:-1], polynomial)]
    return result


def accepts_carries(coefficients, x):
    carry = 0
    for coefficient in coefficients:
        carry, residue = divmod(coefficient + carry, x)
        if residue:
            return False
    return carry == 0


def check_polynomial_folding():
    rng = Random(287)
    # X-1, X+1, Phi_3, Phi_6, X^3-1, Phi_3*Phi_4.
    polynomials = ((-1, 1), (1, 1), (1, 1, 1), (1, -1, 1),
                   (-1, 0, 0, 1), (1, 1, 2, 1, 1))
    hits = misses = 0
    for poly, x in product(polynomials, range(2, 18)):
        degree = len(poly) - 1
        row_count = degree + 4
        reductions = monomial_remainders(poly, row_count)
        divisor = evaluate(poly, x)
        for j in range(30):
            numerator = rng.randrange(x**row_count)
            if j % 2 == 0:
                numerator -= numerator % divisor
            value = numerator
            rows = []
            for _ in range(row_count):
                value, digit = divmod(value, x)
                rows.append(digit)
            remainder = [sum(a * row[i] for a, row in zip(rows, reductions))
                         for i in range(degree)] + [0]
            folded, residue = divmod(evaluate(remainder, x), divisor)
            coefficients = [a - folded * b for a, b in zip(remainder, poly)]
            assert accepts_carries(coefficients, x) == (numerator % divisor == 0)
            assert residue == numerator % divisor
            if residue:
                misses += 1
            else:
                hits += 1
    return hits, misses


# Example relation in base two. The numerator is a string of ones of
# length 1 modulo 3, with arbitrary common-padding zeros. The divisor is
# 2**m-1. If n is a successful length, n mod 3m (with zero replaced by
# 3m) still works, since 2**(3m) is 1 modulo the divisor. Three rows
# therefore suffice. This example runs the unary construction to a repeated
# state, without assuming a finite cutoff for the exponent m.
START, ZERO, ONE, TWO, DEAD = range(5)
TRANSITIONS = ((START, ONE), (DEAD, ONE), (DEAD, TWO),
               (DEAD, ZERO), (DEAD, DEAD))
IDENTITY = tuple(range(5))


@cache
def extend_map(mapping, digit):
    return tuple(TRANSITIONS[state][digit] for state in mapping)


@cache
def extend_column(state):
    maps, multiple, difference = state
    children = []
    for digits in product(range(2), repeat=3):
        # Compare the three-row sum with multiple times the all-one row.
        delta = 2 * difference + sum(digits) - multiple
        if abs(delta) <= 3:
            next_maps = tuple(extend_map(f, bit) for f, bit in zip(maps, digits))
            children.append((next_maps, multiple, delta))
    return children


def accepting(state):
    maps, _, difference = state
    q = START
    for mapping in maps:
        q = mapping[q]
    return q == ONE and difference == 0


def check_unary_automaton():
    reachable = frozenset(((IDENTITY,) * 3, h, 0) for h in range(4))
    seen = {}
    answers = []
    while reachable not in seen:
        seen[reachable] = len(answers)
        answers.append(any(map(accepting, reachable)))
        reachable = frozenset(child for state in reachable for child in extend_column(state))
    start = seen[reachable]
    period = len(answers) - start
    # Independently, 2**m-1 divides 2**n-1 exactly when m divides n
    # for m>=1, so an n equal to 1 modulo 3 exists exactly if 3 does not divide m.
    assert period % 3 == 0
    assert all(answer == (m % 3 != 0) for m, answer in enumerate(answers) if m >= 1)
    return start, period


def check_repeated_factor_lifts():
    rng = Random(196)
    checked = attainable = obstructed = 0
    for base, m in product((2, 3, 4, 5, 6, 7, 9), range(1, 5)):
        x = base**m
        for factor, h in ((x - 1, 1), (x + 1, 2), (x * x + x + 1, 3)):
            for exponent in (2, 3):
                modulus = factor**exponent
                if not 1 < modulus <= 9000:
                    continue
                for width in (1, 2, 3):
                    block_slope = base**width
                    period = lcm(2, h, width)
                    w = x**period - 1
                    for _ in range(4):
                        prefix = rng.randrange(10)
                        digit_block = rng.randrange(1, block_slope)
                        coefficient = (block_slope - 1) * prefix + digit_block
                        suffix_width = rng.randrange(1, 6)
                        tail_slope = base**suffix_width
                        tail = rng.randrange(tail_slope)
                        numerator = prefix * tail_slope + tail
                        g = gcd(modulus, coefficient * w // (block_slope - 1))
                        orbit = set()
                        state = prefix % modulus
                        increment = digit_block * w // (block_slope - 1)
                        while state not in orbit:
                            orbit.add(state)
                            state = ((1 + w) * state + increment) % modulus
                        assert state == prefix % modulus
                        direct = {(r * tail_slope + tail) % modulus for r in orbit}
                        assert direct == set(range(numerator % g, modulus, g))
                        if 0 in direct:
                            attainable += 1
                        else:
                            obstructed += 1
                        checked += 1
    return checked, attainable, obstructed


if __name__ == "__main__":
    print("Modular translations checked:", check_loop_insertions())
    print("Folded divisible and nondivisible inputs:", check_polynomial_folding())
    print("Unary automaton preperiod and period:", check_unary_automaton())
    print("Lift orbits, with and without a multiple:", check_repeated_factor_lifts())
