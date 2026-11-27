"""Check sparse and oscillating extensions using direct unordered pair counts."""

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


def check_odd_rule(limit):
    terms = [n for n in range(1, limit + 1)
             if n.bit_count() == 1 or (n + 1).bit_count() == 1]
    members = set(terms)
    counts = counts_through(terms, limit)
    missed = []
    for n in range(3, limit + 1):
        half = n // 2
        if n % 2:
            weight = (half + 1).bit_count()
            expected = int(weight == 1) + 2 * int(weight == 2)
        else:
            expected = int(half.bit_count() == 2) + int((half + 1).bit_count() == 2)
        if counts[n] != expected or (n in members and counts[n] != 1):
            raise ValueError(f"dyadic pair formula fails at {n}")
        if counts[n] == 1 and n not in members:
            missed.append(n)
    if missed[0] != 6 or any(n % 2 for n in missed):
        raise ValueError("wrong parity or first location of missed singletons")
    print(f"Through {limit}: dyadic pairs select {len(terms)} terms "
          f"and omit {len(missed)} even singletons.")


def check_oscillation(prefix_cutoff):
    prefix = ulam_prefix(prefix_cutoff)
    p, q = prefix[-2:]
    a, d = p + q, p + 2 * q
    word = "110" + ("11010" * 5 + "110" * 7) * 3
    fixed = prefix + [a, d, a + d, 2 * d]
    terms = fixed + [a + j * d for j in range(3, len(word)) if word[j] == "1"]
    limit = a + (len(word) - 1) * d
    counts = counts_through(terms, limit)
    small_sums = {f + t for f in fixed for t in terms if f != t and f + t <= limit}
    if [n for n in terms if n <= prefix_cutoff] != prefix:
        raise ValueError("the extension changes its prescribed prefix")
    if any(counts[n] != 1 for n in terms if n > 2):
        raise ValueError("a selected term in the oscillating extension lost uniqueness")
    if small_sums != {n for n, count in enumerate(counts) if count}:
        raise ValueError("a represented target in the extension lacks a short summand")


def main():
    limit = 32768
    check_odd_rule(limit)
    for cutoff in (2, 8, 69):
        check_oscillation(cutoff)
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
