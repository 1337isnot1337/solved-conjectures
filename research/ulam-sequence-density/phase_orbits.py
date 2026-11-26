"""Check exact periodic orbits and a single phase-boundary correction."""

from verify import ulam_shift_mask

PERIOD = 540
MEMORY = 51
SHIFTS = ulam_shift_mask(MEMORY + 1) >> 1
KEEP = (1 << MEMORY) - 1


def run_period(state, correction=None):
    ones = 0
    for n in range(PERIOD):
        residue = (221 * n) % PERIOD
        bit = PERIOD < 3 * residue < 2 * PERIOD and (state & SHIFTS).bit_count() == 1
        if n == correction:
            bit = not bit
        ones += bit
        state = ((state << 1) | bit) & KEEP
    return state, ones


if __name__ == "__main__":
    first = 163840
    second = 21990232555520
    fast = 21990232719360
    correction = 79
    first_image, first_count = run_period(first)
    second_image, second_count = run_period(second)
    if (first_image, second_image, first_count + second_count) != (second, first, 61):
        raise SystemExit("The two-period orbit failed.")
    if run_period(fast) != (fast, 61):
        raise SystemExit("The one-period orbit failed.")
    residue = 221 * correction % PERIOD
    if min(abs(3 * residue - PERIOD), abs(3 * residue - 2 * PERIOD)) != 3:
        raise SystemExit("The correction is outside the specified boundary band.")
    if run_period(0, correction)[0] != first or run_period(first, correction)[0] != fast:
        raise SystemExit("The correction transitions failed.")
    print("Verified densities 61/1080 and 61/540 and a one-bit transition at phase 179/540.")
