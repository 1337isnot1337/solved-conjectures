"""Compare the asynchronous coupling laws against the literal fair-sign chain."""
from collections import Counter
from fractions import Fraction
from math import comb


def odd_part(n):
    return n // (abs(n) & -abs(n))


def step_counts(counts):
    result = Counter()
    for state, multiplicity in counts.items():
        for sign in (-1, 1):
            result[odd_part(3 * state + sign)] += multiplicity
    return result


def distribution(start, steps):
    counts = Counter({start: 1})
    for _ in range(steps):
        counts = step_counts(counts)
    return {x: Fraction(count, 2**steps) for x, count in counts.items()}


def binomial_endpoints(j, base, sign, steps):
    return {sign + (2**(j - steps - k)) * 3**steps * base:
            Fraction(comb(steps, k), 2**steps) for k in range(steps + 1)}


def coupling_tests():
    cases = 0
    for j in range(8, 21):
        for a in (-4, -1, 0, 2, 4):
            t = (min(j, j + a) - 1) // 2
            for b in range(min(3, t) + 1):
                m = t - b
                peak = Fraction(comb(m, m // 2), 2**m)
                shift_mean = sum(Fraction(comb(b, k), 2**b) * abs(a + b + k)
                                 for k in range(b + 1))
                for n in (1, 2, 7):
                    for s in (-1, 1):
                        p = distribution(2**j * n + s, t)
                        q = distribution(2**(j + a) * 3**b * n + s, m)
                        assert p == binomial_endpoints(j, n, s, t)
                        assert q == binomial_endpoints(j + a, 3**b * n, s, m)
                        distance = sum(abs(p.get(x, 0) - q.get(x, 0))
                                       for x in p.keys() | q.keys()) / 2
                        assert distance <= peak * shift_mean
                        cases += 1
    return cases


def offset_tests():
    cases = 0
    for r in (-33, -17, -5, -1, 1, 3, 7, 13, 31):
        j, horizon = 23, 6
        for n in (1, 4, 11):
            active = [(r, 2**j * n + r, 0)]
            for k in range(horizon + 1):
                children = []
                for offset, actual, halvings in active:
                    assert actual == (2**(j - halvings)) * 3**k * n + offset
                    assert 2**halvings * abs(offset) <= 4**k * abs(r)
                    cases += 1
                    if abs(offset) == 1 or k == horizon:
                        continue
                    for sign in (-1, 1):
                        next_value = 3 * offset + sign
                        valuation = (abs(next_value) & -abs(next_value)).bit_length() - 1
                        children.append((odd_part(next_value), odd_part(3 * actual + sign),
                                         halvings + valuation))
                active = children
    return cases


if __name__ == "__main__":
    print(f"{coupling_tests()} endpoint-law pairs and {offset_tests()} shadow states passed")
