"""Exact finite controls for the winding arithmetic and dual patch formulas."""

from collections import defaultdict
from functools import cache
from itertools import combinations_with_replacement, product


@cache
def path_spectra(modulus, multiplicities):
    """Enumerate actual orientations by their counts within each bundle."""
    possible_nets = [
        range(-count, count + 1, 2) for count in multiplicities
    ]
    by_internal_demand = defaultdict(set)
    for nets in product(*possible_nets):
        demand = tuple((right - left) % modulus
                       for left, right in zip(nets, nets[1:]))
        by_internal_demand[demand].add(nets[0] % modulus)
    spectra = {frozenset(values) for values in by_internal_demand.values()}
    if len(by_internal_demand) < modulus ** (len(multiplicities) - 1):
        spectra.add(frozenset())
    return tuple(spectra)


def deficits(modulus, path):
    return [max(0, modulus - count - 1) for count in path]


def quotient_lower_bound(modulus, path, divisor):
    quotient, extra = zip(*(divmod(value, divisor)
                            for value in deficits(modulus, path)))
    fiber_size = modulus // divisor
    return divisor - sum(extra) // (fiber_size - sum(quotient))


def terminal_sums(modulus, spectra):
    sums = {0}
    for values in spectra:
        sums = {(left + right) % modulus for left in sums for right in values}
    return sums


def strong_by_enumeration(modulus, paths):
    return all(len(terminal_sums(modulus, spectra)) == modulus
               for spectra in product(*(path_spectra(modulus, path) for path in paths)))


def check_paths():
    tested = 0
    for modulus in (3, 5, 7, 9):
        for size in (1, 2, 3):
            for path in product(range(1, modulus), repeat=size):
                spectrum = path_spectra(modulus, path)
                deficit = sum(deficits(modulus, path))
                assert min(map(len, spectrum)) == max(0, modulus - deficit)
                if deficit < modulus:
                    for divisor in range(2, modulus + 1):
                        if modulus % divisor == 0:
                            assert min(len({x % divisor for x in a}) for a in spectrum) >= (
                                quotient_lower_bound(modulus, path, divisor)
                            )
                tested += 1
    return tested


def check_patches():
    tested = 0
    for modulus, counts in ((3, (2, 3)), (5, (2, 3)), (7, (2,)), (9, (2,))):
        paths = [(i,) for i in range(1, modulus)]
        paths += list(product(range(1, modulus), repeat=2))
        for count in counts:
            for patch in combinations_with_replacement(paths, count):
                lengths = [modulus - sum(deficits(modulus, path)) for path in patch]
                expected = min(lengths) > 0 and sum(size - 1 for size in lengths) >= modulus - 1
                assert strong_by_enumeration(modulus, patch) == expected
                tested += 1

    assert strong_by_enumeration(7, ((4, 4),) * 3)
    composite_patch = ((5, 5),) * 4
    assert strong_by_enumeration(9, composite_patch)
    for divisor in (3, 9):
        assert sum(quotient_lower_bound(9, path, divisor) - 1
                   for path in composite_patch) >= divisor - 1

    periodic_spectra = []
    for bundle_size, omitted_classes in ((12, {1, 2}), (12, {1, 2}), (13, {2})):
        modulus = 15
        inv_two = pow(2, -1, modulus)
        allowed = {net * inv_two % modulus for net in range(-bundle_size, bundle_size + 1, 2)}
        first_gap = set(range(modulus)) - allowed
        forbidden = [{(x + 3 * repetition) % modulus for x in first_gap}
                     for repetition in range(5)]
        remaining = set(range(modulus)).difference(*forbidden)
        assert len(remaining) == modulus - 5 * (14 - bundle_size)
        assert len({x % 3 for x in remaining}) == 3 - len(omitted_classes)
        periodic_spectra.append(remaining)
    assert len(terminal_sums(15, periodic_spectra)) == 10
    return tested


def check_windings():
    for k in range(1, 151):
        q = 4 * k + 1
        short_obstructions = [
            length
            for length in range(3, 12 * k + 4)
            if any(j % 2 == length % 2 and j * q < 2 * length < j * (q + 1)
                   for j in range(1, (2 * length - 1) // q + 1))
        ]
        assert short_obstructions == [10 * k + 3]
    return 150


if __name__ == "__main__":
    print("Path types checked:", check_paths())
    print("Prime or two-path patches checked:", check_patches())
    print("Odd-girth parameters checked:", check_windings())
