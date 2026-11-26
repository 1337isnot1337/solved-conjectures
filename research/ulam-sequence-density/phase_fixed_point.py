"""Check the fixed phase profiles and the cutoff-69 recovery certificate."""

from fractions import Fraction
from math import floor

from verify import ulam_shift_mask

LOW = Fraction(2219, 5422)
HIGH = Fraction(35725, 87292)
MID = (LOW + HIGH) / 2
THIRD = Fraction(1, 3)

LAGS_51 = (
    0, 303, 347, 88, 176, 220, 5, 137, 181, 269, 313, 54, 142, 186, 274,
    15, 59, 362, 3, 306, 47, 91, 394, 135, 179, 267, 311, 52, 140, 184,
    272, 13, 57, 360,
)
LAGS_69 = (
    461, 224, 246, 527, 268, 549, 593, 53, 75, 356, 97, 378, 400, 681, 422,
    703, 725, 185, 466, 251, 554, 36, 598, 58, 339, 620, 80, 361, 642, 383,
    664, 686, 427, 708, 168, 190, 234, 515, 41, 322, 63, 344, 366, 647, 388,
    669, 691, 151, 195, 476, 542, 2, 464, 227, 508, 249, 552, 574, 596, 56,
    337, 618, 78, 359, 640, 381, 662, 684, 425, 706, 166, 188, 232, 513,
    39, 320, 61, 342, 364, 645, 386, 667, 689, 149, 193, 474, 540, 0,
)


def value(endpoint, slope):
    return endpoint[0] + endpoint[1] * slope


def require(condition, message):
    if not condition:
        raise SystemExit(message)


def normalize(endpoint):
    constant, lag = endpoint
    shifted = (constant - floor(value(endpoint, MID)), lag)
    require(
        all(0 <= value(shifted, slope) <= 1 for slope in (LOW, HIGH)),
        "An endpoint crosses the wrap boundary.",
    )
    return shifted


def check_model(cutoff, base, endpoint_lags, expected_length):
    mask = ulam_shift_mask(cutoff + 1)
    shifts = [lag for lag in range(1, cutoff + 1) if mask & (1 << lag)]
    ends = [normalize((base, lag)) for lag in endpoint_lags]
    require(ends == sorted(ends, key=lambda end: value(end, MID)), "Unordered support.")
    intervals = list(zip(ends[::2], ends[1::2]))
    cuts = {(0, 0), (1, 0), (THIRD, 0), (2 * THIRD, 0), *ends}
    cuts.update(normalize((c, lag + s)) for c, lag in ends for s in shifts)
    cuts = sorted(cuts, key=lambda endpoint: value(endpoint, MID))

    def occupied(phase):
        return any(value(a, MID) < phase < value(b, MID) for a, b in intervals)

    for a, b in zip(cuts, cuts[1:]):
        require(
            all(value(a, slope) <= value(b, slope) for slope in (LOW, HIGH))
            and value(a, MID) < value(b, MID),
            "Two cuts cross inside the slope interval.",
        )
        x = (value(a, MID) + value(b, MID)) / 2
        hits = sum(occupied((x - s * MID) % 1) for s in shifts)
        require(
            occupied(x) == (THIRD < x < 2 * THIRD and hits == 1),
            "The fixed-point equation failed.",
        )

    length = [sum(b[i] - a[i] for a, b in intervals) for i in range(2)]
    require(length == expected_length, "Unexpected interval length.")
    print(f"Cutoff {cutoff}: verified {len(intervals)} intervals and {len(cuts)-1} phase cells.")
    print(f"Density is {length[1]}*theta {length[0]:+}.")
    return intervals, cuts, occupied, shifts


def check_outside_witness(intervals, cuts, occupied, shifts):
    x = Fraction(1237, 4000)
    require(
        all((value(cut, LOW) - x) * (value(cut, HIGH) - x) > 0 for cut in cuts),
        "The outside witness crosses a cut.",
    )
    require(not occupied(x), "The outside witness lies in the model.")
    require([s for s in shifts if occupied((x - s * MID) % 1)] == [48], "Bad shift count.")
    for a, b in intervals:
        for c, d in intervals:
            for lift in (x, x + 1):
                require(
                    all(value(a, t) + value(c, t) > lift for t in (LOW, HIGH))
                    or all(value(b, t) + value(d, t) < lift for t in (LOW, HIGH)),
                    "The outside witness lies in the tail sumset.",
                )
    print("Verified a forced exterior birth near phase 1237/4000.")


def check_boundary_recovery(intervals, shifts):
    slope = Fraction(350477575, 856371966)
    error = Fraction(1, 10**10)
    width = Fraction(1, 20_000)
    memory = 69
    horizon = 800
    expected = {THIRD: (333, 37, -1), 2 * THIRD: (794, 88, 0)}
    ends = [(value(a, slope), value(b, slope)) for a, b in intervals]
    cuts = {(0, 0), (THIRD, 0), (2 * THIRD, 0)}
    cuts.update(endpoint for pair in intervals for endpoint in pair)
    translated_cuts = {
        (constant, lag - t)
        for constant, lag in cuts
        for t in range(-memory, horizon + 1)
    }
    for boundary, outcome in expected.items():
        lo, hi = boundary - width, boundary + width
        for constant, lag in translated_cuts:
            constant -= floor(constant + lag * slope)
            left = constant + lag * slope - abs(lag) * error
            right = constant + lag * slope + abs(lag) * error
            require(
                right < lo or left > hi or (left == right == boundary),
                "A translated phase cut crosses one of the recovery cells.",
            )
        for direction in (-1, 1):
            initial = boundary + direction * width / 2
            phases = [(initial + t * slope) % 1 for t in range(-memory, horizon + 1)]
            reference = [any(a < phase < b for a, b in ends) for phase in phases]
            edited = reference[:memory] + [not reference[memory]]
            last_change = memory
            changes = 1
            balance = int(edited[-1]) - int(reference[memory])
            for i in range(memory + 1, len(phases)):
                bit = THIRD < phases[i] < 2 * THIRD and sum(edited[i - s] for s in shifts) == 1
                edited.append(bit)
                if bit != reference[i]:
                    last_change = i
                    changes += 1
                    balance += int(bit) - int(reference[i])
                if i - last_change == memory:
                    break
            require(i - last_change == memory, "The edited memory did not recover.")
            require((i - memory, changes, balance) == outcome, "Unexpected recovery counts.")
        print(f"Boundary {boundary}: recovery by {outcome[0]}, changed bits {outcome[1]}, balance {outcome[2]}.")
    for distance in range(1, max(outcome[0] for outcome in expected.values()) + 1):
        phase = 3 * distance * slope
        bound = abs(phase - round(phase)) / 3 - distance * error
        require(bound > 2 * width, "Two editable sites can occur before recovery.")


if __name__ == "__main__":
    check_outside_witness(*check_model(51, THIRD, LAGS_51, [-58, 142]))
    intervals, _, _, shifts = check_model(69, 2 * THIRD, LAGS_69, [-225, 550])
    check_boundary_recovery(intervals, shifts)
