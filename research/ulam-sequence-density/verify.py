"""Check the finite prefix criterion for the U(1,2) upper density bound."""

import math
import sys

WINDOW = 4096
NUMERATOR = 193
DENOMINATOR = 800


def ulam_shift_mask(width):
    """Return a mask with bit s set for each Ulam number s below width."""
    counts = bytearray(width)
    terms = []
    for target in range(1, width):
        if target > 2 and counts[target] != 1:
            continue
        for smaller in terms:
            total = target + smaller
            if total >= width:
                break
            counts[total] = min(2, counts[total] + 1)
        terms.append(target)
    return sum(1 << term for term in terms)


def find_dense_prefixes():
    """Test for an admissible window with every prefix above 193/800."""
    full_window = (1 << WINDOW) - 1
    shifts = ulam_shift_mask(WINDOW)
    successors = [(shifts << x) & full_window for x in range(WINDOW)]
    goal = NUMERATOR * WINDOW // DENOMINATOR + 1

    # Before placing the next point at x, the prefix of length x contains
    # size points. Its density is above the bound iff x*NUMERATOR < size*DENOMINATOR.
    allowed_positions = [
        (1 << min(WINDOW, (size * DENOMINATOR - 1) // NUMERATOR + 1)) - 1
        for size in range(goal)
    ]
    sys.setrecursionlimit(max(sys.getrecursionlimit(), goal + 100))
    visited = 0

    def search(candidates, hit_once, size):
        nonlocal visited
        visited += 1
        if size == goal:
            return True

        eligible = candidates & allowed_positions[size]
        while eligible:
            position = eligible & -eligible
            eligible ^= position
            candidates ^= position

            # A future point becomes forbidden as soon as it has two
            # selected predecessors at Ulam-number distances.
            new_hits = successors[position.bit_length() - 1]
            if search(candidates & ~(hit_once & new_hits), hit_once | new_hits, size + 1):
                return True
        return False

    # The window starts at a selected point, which is placed at offset zero.
    exists = search(full_window ^ 1, shifts, 1)
    return exists, visited


def periodic_witness_is_admissible():
    """Check the density-127/540 witness for the same local constraints."""
    shifts = ulam_shift_mask(WINDOW)
    residues = [221 * s % 540 for s in range(1, WINDOW) if shifts & (1 << s)]
    return (
        len(residues) == 382
        and math.gcd(221, 540) == 1
        and all(sum((r - s) % 540 < 127 for s in residues) <= 1 for r in range(127))
    )


def periodic_word_obeys_small_update():
    """Verify a nonzero periodic orbit of the small-summand recurrence."""
    shifts = ulam_shift_mask(WINDOW)
    residues = [s % 188 for s in range(1, WINDOW) if shifts & (1 << s)]
    selected = {0, 5, 134}
    return all(
        (x in selected) == (sum((x - s) % 188 in selected for s in residues) == 1)
        for x in range(188)
    )


if __name__ == "__main__":
    if not periodic_witness_is_admissible():
        raise SystemExit("The periodic witness failed.")
    print("Verified the density-127/540 periodic witness.", flush=True)
    if not periodic_word_obeys_small_update():
        raise SystemExit("The finite-shift recurrence witness failed.")
    print("Verified the density-3/188 finite-shift recurrence witness.", flush=True)
    has_counterexample, visited = find_dense_prefixes()
    if has_counterexample:
        raise SystemExit("The prefix criterion failed.")
    print(f"Verified {NUMERATOR}/{DENOMINATOR} with window {WINDOW}.")
    print(f"Exhausted {visited:,} search nodes.")
