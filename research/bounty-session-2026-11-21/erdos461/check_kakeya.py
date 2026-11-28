"""Check the finite residue construction and the partition comparison."""

from math import isqrt, prod


def primes_below(limit):
    return [n for n in range(2, limit)
            if all(n % d for d in range(2, isqrt(n) + 1))]


def component(value, primes):
    result = 1
    for p in primes:
        while value % p == 0:
            result *= p
            value //= p
    return result


def check(t, auxiliaries, k, start):
    q = prod(auxiliaries)
    primes = primes_below(t)
    small = [p for p in primes if p * k <= t]
    large = [p for p in primes if p * k > t]
    assert q < t / k
    squares = [{x * x % p for x in range(p)} for p in auxiliaries]
    allowed = set()
    for j in range(k + 1):
        classes = {i for i in range(q)
                   if all((4 * i + j * j) % p in residues
                          for p, residues in zip(auxiliaries, squares))}
        assert len(classes) == prod((p + 1) // 2 for p in auxiliaries)
        allowed.update(classes)

    original = [component(start + i, small) for i in range(1, t + 1)]
    # Lift one congruence at a time to test an actual common start.
    modulus = 1
    for p in small:
        power = p
        while power < t:
            power *= p
        modulus *= power
    n = start % modulus
    incidences = 0
    for p in large:
        b = (p * p - 1) % q + 1
        n += modulus * ((-b - n) * pow(modulus, -1, p) % p)
        modulus *= p
        for i in range(b, t + 1, p):
            assert i % q in allowed
            incidences += 1

    group_map = {}
    for i, before in enumerate(original, 1):
        after = component(n + i, small)
        group_map.setdefault(before, after)
        assert group_map[before] == after
    assert len(set(group_map.values())) == len(group_map)
    changed = {i for i in range(1, t + 1) if any((n + i) % p == 0 for p in large)}
    assert all(i % q in allowed for i in changed)
    full = {component(n + i, primes) for i in range(1, t + 1)}
    assert len(group_map) <= len(full) <= len(group_map) + len(changed)
    return incidences


if __name__ == "__main__":
    cases = [(97, (3, 5), 4), (181, (3, 7), 5), (401, (3, 5, 7), 3)]
    counts = [check(t, aux, k, start) for t, aux, k in cases
              for start in (0, 17, 105, 1001)]
    print(f"{len(counts)} CRT completions and {sum(counts)} prime incidences checked")
