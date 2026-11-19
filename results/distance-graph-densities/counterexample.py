"""Exact finite-word checks for the counterexample and the small exceptions."""

from fractions import Fraction

DIFFERENCES = (1, 50, 57)


def dense_prefix_word(length, density, differences=DIFFERENCES):
    """Can every nonempty prefix have density strictly above the threshold?"""
    numerator, denominator = density.as_integer_ratio()
    needed = length * numerator // denominator + 1
    conflicts = [
        sum(
            1 << j
            for j in range(length)
            if abs(i - j) in differences
        )
        for i in range(length)
    ]

    def deadline(count):
        # Before the next occupied site j, the prefix [0,j) has this count.
        return (denominator * count - 1) // numerator if count else 0

    def search(available, count):
        if count >= needed:
            return True
        if count + available.bit_count() < needed:
            return False

        # Partition available sites into cliques, each begun at its least site.
        # Before the next clique begins, at most one site from each previous
        # clique can be occupied. This bounds every prefix at a clique start.
        remaining = available
        upper = count
        while remaining:
            site_bit = remaining & -remaining
            site = site_bit.bit_length() - 1
            if site > deadline(upper):
                return False
            upper += 1
            remaining ^= site_bit
            clique_candidates = remaining & conflicts[site]
            while clique_candidates:
                other = clique_candidates & -clique_candidates
                remaining ^= other
                clique_candidates &= remaining & conflicts[other.bit_length() - 1]
        if upper < needed:
            return False

        choices = available & ((1 << (deadline(count) + 1)) - 1)
        while choices:
            chosen = choices & -choices
            choices ^= chosen
            available ^= chosen
            if search(available & ~conflicts[chosen.bit_length() - 1], count + 1):
                return True
        return False

    return search((1 << length) - 1, 0)


# Gap, k, numerator, denominator, and length of the upper-bound certificate.
SMALL_CASES = (
    (5, 2, 1, 3, 3),
    (5, 3, 4, 11, 11),
    (5, 4, 2, 5, 5),
    (5, 5, 1, 3, 128),
    (5, 7, 3, 8, 16),
    (5, 12, 5, 13, 39),
    (7, 2, 3, 10, 10),
    (7, 3, 5, 13, 13),
    (7, 4, 2, 5, 5),
    (7, 5, 6, 17, 17),
    (7, 6, 3, 7, 7),
    (7, 7, 1, 3, 128),
    (7, 9, 2, 5, 128),
    (7, 11, 5, 12, 24),
    (7, 14, 2, 5, 128),
    (7, 16, 7, 17, 51),
    (7, 18, 8, 19, 38),
    (7, 23, 5, 12, 128),
    (7, 25, 11, 26, 78),
    (7, 32, 14, 33, 99),
)


def has_modular_witness(differences, density):
    for i, first in enumerate(differences):
        for second in differences[i + 1:]:
            period = first + second
            if (density * period).denominator != 1:
                continue
            width = int(density * period)
            for step in range(1, period):
                if any(min(step * d % period, -step * d % period) < width for d in differences):
                    continue
                points = {x for x in range(period) if step * x % period < width}
                if len(points) == width and all(
                    (x + d) % period not in points for x in points for d in differences
                ):
                    return True
    return False


if __name__ == "__main__":
    exact = Fraction(25, 58)
    residues = {i for i in range(58) if (25 * i) % 58 < 25}
    assert len(residues) == 25
    assert all((i + d) % 58 not in residues for i in residues for d in DIFFERENCES)
    assert dense_prefix_word(58, exact)
    assert dense_prefix_word(116, Fraction(24, 58))
    assert not dense_prefix_word(116, exact)
    predicted = Fraction(4 * 50 - 2, 9 * 50 + 9)
    assert predicted - exact == Fraction(1, 2958)
    print("Exact density 25/58. Conjecture 39 predicts 22/51.")

    for gap, k, numerator, denominator, length in SMALL_CASES:
        density = Fraction(numerator, denominator)
        differences = (1, k, k + gap)
        assert has_modular_witness(differences, density), differences
        assert not dense_prefix_word(length, density, differences), differences
    print(f"Verified all {len(SMALL_CASES)} small exceptional cases.")
