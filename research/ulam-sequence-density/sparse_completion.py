"""Finite replay of the two-bit construction, using direct unordered pair counts."""

from upper_bound import ulam_prefix


def counts_through(terms, limit):
    counts = [0] * (limit + 1)
    for i, a in enumerate(terms):
        for j in range(i + 1, len(terms)):
            target = a + terms[j]
            if target > limit:
                break
            counts[target] += 1
    return counts


def main():
    limit = 32768
    indices = [n for n in range(1, limit + 1) if n.bit_count() <= 2]
    counts = counts_through(indices, limit)
    if [n for n, r in enumerate(counts) if r == 1] != [3, 4] or max(counts) != 6:
        raise ValueError("binary index counts disagree")

    last, block = 47, 64
    prefix = ulam_prefix(last)
    terms = prefix + [n for n in range(last + 1, limit + 1) if (n // block).bit_count() <= 2]
    members = set(terms)
    if prefix[-1] != last or terms[:len(prefix)] != prefix:
        raise ValueError("incorrect seed prefix")
    counts = counts_through(terms, limit)
    for n in range(3, limit + 1):
        if (n in members and counts[n] == 0) or (counts[n] == 1 and n not in members):
            raise ValueError(f"one-sided recurrence fails at {n}")
        if n >= 7 * block and counts[n] == 1:
            raise ValueError(f"unexpected singleton at {n}")
    if any(b > 2 * a for a, b in zip(terms, terms[1:])) or max(counts) > 16 * block:
        raise ValueError("ratio or multiplicity bound fails")
    print(f"Through {limit}: {len(terms)} selected, largest restricted count {max(counts)}, "
          f"{sum(n in members and counts[n] >= 2 for n in range(3, limit + 1))} "
          "multiply represented selections.")


if __name__ == "__main__":
    main()
