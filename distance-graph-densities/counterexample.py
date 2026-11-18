"""Exact upper and lower certificates for differences 1, 50 and 57."""

from fractions import Fraction

DIFFERENCES = (1, 50, 57)


def dense_prefix_word(length, density):
    """Can every nonempty prefix have density strictly above the threshold?"""
    numerator, denominator = density.as_integer_ratio()
    needed = length * numerator // denominator + 1
    conflicts = [
        sum(
            1 << j
            for j in range(length)
            if abs(i - j) in DIFFERENCES
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
