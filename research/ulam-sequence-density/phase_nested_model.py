"""Check a positive component of the cutoff-400 phase recurrence."""

from collections import Counter, deque
from fractions import Fraction

from phase_return_model import (
    ANCHOR, LENGTH, P, Q, check_cuts, check_rotation_returns, cut, gate_at,
    nonnegative, number, scale, subtract,
)
from verify import ulam_shift_mask


CUTOFF = 400
SHIFTS = ulam_shift_mask(CUTOFF + 1) >> 1
MEMORY = (1 << CUTOFF) - 1
FIRST_TIMES = (60_002, 373_657)
SECOND_LENGTH = 28
SECOND_TIMES = (14, 33)


def gate_runs(phase, first, last):
    gate = gate_at(phase)
    runs = []
    previous = first - 1
    for t in range(first, last):
        if gate(t):
            runs.append(t - previous - 1)
            previous = t
    return runs, last - previous - 1


def apply_runs(memory, runs, trailing):
    count = 0
    for run in runs:
        memory = (memory << run) & MEMORY
        bit = (memory & SHIFTS).bit_count() == 1
        memory = ((memory << 1) | bit) & MEMORY
        count += bit
    return (memory << trailing) & MEMORY, count


def first_level(low, middle, high):
    codes = []
    for (left, right), steps in zip(((low, middle), (middle, high)), FIRST_TIMES):
        check_cuts(LENGTH, LENGTH + steps, left, right)
        sample = Fraction(number(left) + number(right), 2 * Q)
        codes.append([gate_runs((sample + color) / 3, LENGTH, LENGTH + steps) for color in range(3)])

    queue = deque()
    seen = set()
    for color in range(3):
        phase = (ANCHOR + color) / 3
        code = gate_runs(phase, 0, LENGTH)
        gate = gate_at(phase)
        for lag in range(1, 103):
            if gate(-lag):
                memory, _ = apply_runs(1 << (lag - 1), *code)
                if memory and (color, memory) not in seen:
                    queue.append((color, memory))
                    seen.add((color, memory))
    assert Counter(color for color, _ in seen) == {0: 8, 1: 14, 2: 12}

    edges = {}
    while queue:
        color, memory = queue.popleft()
        outgoing = []
        for code in codes:
            new_memory, count = apply_runs(memory, *code[color])
            assert new_memory
            target = ((color + 1) % 3, new_memory)
            if target not in seen:
                seen.add(target)
                assert len(seen) <= 70
                queue.append(target)
            outgoing.append((target, count))
        edges[color, memory] = outgoing
    assert len(edges) == 70
    print("First return maps preserve a set of 70 positive memories.")
    return edges


def stable(endpoint):
    return number(endpoint) * 10**16 >= 3 * Q * abs(endpoint[1])


def check_inner_cuts(period, step, first, last, low, high):
    for t in range(first, last):
        moved = scale(t, step)
        ceiling = -(-number(moved) // number(period))
        endpoint = subtract(scale(ceiling, period), moved)
        assert stable(endpoint) and stable(subtract(period, endpoint))
        assert stable(subtract(low, endpoint)) or stable(subtract(endpoint, high))


def inner_word(period, step, initial, first, last):
    circumference = number(period)
    distance = number(step)
    return [
        int((initial + t * distance) % circumference >= circumference - distance)
        for t in range(first, last)
    ]


def second_level(edges, period, step):
    low = (524327, -2301944)
    middle = (2832856, -12437040)
    high = (1855645, -8146807)
    assert stable(low) and stable(subtract(period, high))
    check_inner_cuts(period, step, 0, SECOND_LENGTH + 1, low, high)
    positive, _ = check_rotation_returns(low, middle, high, period, step, SECOND_TIMES, stable)
    width = subtract(high, low)
    assert positive[0] * width[1] - positive[1] * width[0] == -1

    image = set(edges)
    anchor = Fraction(number(low) + number(high), 2)
    for letter in inner_word(period, step, anchor, 0, SECOND_LENGTH):
        image = {edges[state][letter][0] for state in image}
    assert len(image) == 6
    print("A word of 28 induced symbols leaves six positive memories.")

    output = []
    for (left, right), steps in zip(((low, middle), (middle, high)), SECOND_TIMES):
        check_inner_cuts(period, step, SECOND_LENGTH, SECOND_LENGTH + steps + 1, left, right)
        center = Fraction(number(left) + number(right), 2)
        word = inner_word(period, step, center, SECOND_LENGTH, SECOND_LENGTH + steps)
        permutation = {}
        counts = []
        for start in image:
            state = start
            total = 0
            for letter in word:
                state, count = edges[state][letter]
                total += count
            permutation[start] = state
            counts.append(total)
        assert set(permutation.values()) == image
        print(f"Second return {steps}: output counts {sorted(counts)}.")
        output.append((permutation, sorted(counts), sum(FIRST_TIMES[i] for i in word)))

    start = next(iter(image))
    cycle = {start}
    state = output[0][0][start]
    while state not in cycle:
        cycle.add(state)
        state = output[0][0][state]
    assert cycle == image and state == start
    assert all(state == output[1][0][state] for state in image)
    assert output[0][1] == [344145, 344163, 344201, 344210, 344236, 344585]
    assert output[1][1] == [813251] * 6
    lengths = (subtract(middle, low), subtract(high, middle))
    assert tuple(sum(lengths[j][i] * output[j][2] for j in range(2)) for i in range(2)) == (1, 0)
    counts = tuple(sum(o[1]) for o in output)
    formula = tuple(sum(lengths[j][i] * counts[j] for j in range(2)) for i in range(2))
    assert formula == (52052894, -228526942)
    print("Positive density is (52052894 - 228526942*alpha)/6.")


def override_sites(low, high, color, steps):
    # At nominal slope use a larger strip, covering movement of the
    # phase and both endpoints throughout the slope bracket.
    margin = 3 * Q * 1001
    denominator = 10**9
    sites = []
    for t in range(LENGTH, LENGTH + steps):
        left = (number(low) + color * Q + 3 * P * t) % (3 * Q)
        right = left + number(subtract(high, low))
        if any(left * denominator <= b * Q * denominator + margin
               and right * denominator >= b * Q * denominator - margin for b in (1, 2)):
            sites.append(t)
    return sites


def check_overrides(edges, low, middle, high):
    assert 403_647 + LENGTH + max(FIRST_TIMES) < 10**7
    branches = ((low, middle), (middle, high))
    plans = []
    for (left, right), steps in zip(branches, FIRST_TIMES):
        center = Fraction(number(left) + number(right), 2 * Q)
        colors = []
        for color in range(3):
            sites = override_sites(left, right, color, steps)
            starts = [LENGTH, *(t + 1 for t in sites)]
            stops = [*sites, LENGTH + steps]
            colors.append([gate_runs((center + color) / 3, start, stop)
                           for start, stop in zip(starts, stops)])
        plans.append(colors)

    seen = set(edges)
    queue = deque(sorted(seen))
    minima = list(FIRST_TIMES)
    while queue:
        color, memory = queue.popleft()
        for part, plan in enumerate(plans):
            blocks = plan[color]
            possible = {memory: 0}
            for block in blocks[:-1]:
                moved = {}
                for state, count in possible.items():
                    target, added = apply_runs(state, *block)
                    for bit in (0, 1):
                        edited = ((target << 1) | bit) & MEMORY
                        total = count + added + bit
                        moved[edited] = min(moved.get(edited, total), total)
                possible = moved
            for state, count in possible.items():
                target, added = apply_runs(state, *blocks[-1])
                assert target
                minima[part] = min(minima[part], count + added)
                next_state = ((color + 1) % 3, target)
                if next_state not in seen:
                    seen.add(next_state)
                    assert len(seen) <= 187
                    queue.append(next_state)
    assert len(seen) == 187 and minima == [4711, 29715]
    lengths = [subtract(right, left) for left, right in branches]
    lower_rate = tuple(sum(m * length[i] for m, length in zip(minima, lengths)) for i in range(2))
    assert stable(subtract(scale(1000, lower_rate), (79, 0)))
    print("Narrow overrides preserve 187 positive memories, with lower density at least 0.079.")


def main():
    low, middle, high = map(cut, (29_990, 403_647, 343_645))
    check_cuts(-102, LENGTH + 1, low, high)
    step, negative = check_rotation_returns(low, middle, high, (1, 0), (0, 1), FIRST_TIMES, nonnegative)
    assert all((steps - displacement[0]) % 3 == 1
               for steps, displacement in zip(FIRST_TIMES, (step, negative)))
    edges = first_level(low, middle, high)
    second_level(edges, subtract(high, low), step)
    check_overrides(edges, low, middle, high)


if __name__ == "__main__":
    main()
