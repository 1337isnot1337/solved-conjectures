"""Exact accounting for new and multiply represented sums of Ulam prefixes."""

from density_probes import restricted_pair_counts, terms_to


def main():
    cutoffs = (1024, 4096, 16384, 65536, 262144)
    terms = terms_to(cutoffs[-1])
    members = supported = crowded = diagonals = 0
    births = cancellations = 0
    record_birth = record_cancel = (0, 0)
    index = 0
    for cutoff in cutoffs:
        while index < len(terms) and terms[index] <= cutoff:
            term = terms[index]
            pairs = members << term
            new = (pairs & ~supported).bit_count()
            canceled = (pairs & supported & ~crowded).bit_count()
            if new > record_birth[0]:
                record_birth = (new, term)
            if canceled > record_cancel[0]:
                record_cancel = (canceled, term)
            births += new
            cancellations += canceled
            crowded |= pairs & supported
            supported |= pairs
            members |= 1 << term
            diagonals |= 1 << (2 * term)
            index += 1

        last = terms[index - 1]
        pending = ((supported & ~crowded) >> (last + 1)).bit_count()
        internal_crowded = (crowded & ((1 << (cutoff + 1)) - 1)).bit_count()
        full = (1 | members | diagonals | supported).bit_count()
        if births != supported.bit_count() or cancellations != crowded.bit_count():
            raise ValueError("the incremental and final support counts disagree")
        if births != index - 2 + cancellations + pending:
            raise ValueError("the accepted, crowded and pending counts do not partition the sums")
        print(f"X={cutoff} terms={index} full={full} births={births} "
              f"cancellations={cancellations} pending={pending} crowded_through_X={internal_crowded}")
    print(f"largest birth count {record_birth[0]} at {record_birth[1]}")
    print(f"largest cancellation count {record_cancel[0]} at {record_cancel[1]}")

    member_set = set(terms)
    counts = restricted_pair_counts(member_set)
    if len(counts) <= 2 * terms[-1]:
        raise ValueError("the independent convolution must include all pair sums")
    if births != sum(r > 0 for r in counts) or cancellations != sum(r > 1 for r in counts):
        raise ValueError("the integer convolution disagrees with the restricted sumset")
    check_full = sum(r > 0 or n == 0 or n in member_set or
                     (n % 2 == 0 and n // 2 in member_set) for n, r in enumerate(counts))
    if full != check_full or pending != counts[last + 1:].count(1):
        raise ValueError("the integer convolution disagrees with the full or pending count")


if __name__ == "__main__":
    main()
