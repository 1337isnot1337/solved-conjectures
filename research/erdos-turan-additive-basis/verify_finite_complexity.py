"""Check digit swaps and the read-once path encoding with exact counts."""

from collections import Counter, defaultdict
from itertools import combinations, product
from random import Random


def make_program(length, deterministic, rng):
    start = (0, 0)
    finish = ((1 << length) - 1, 0)
    program = {}
    pending = [start]
    while pending:
        vertex = pending.pop()
        if vertex == finish or vertex in program:
            continue
        mask, _ = vertex
        remaining = [i for i in range(length) if not (mask >> i) & 1]
        queries = rng.sample(remaining, 1 if deterministic else min(2, len(remaining)))
        outgoing = []
        for i, digit in product(queries, range(2)):
            if rng.randrange(9) == 0:
                continue
            following_mask = mask | (1 << i)
            target = finish if following_mask == finish[0] else (following_mask, rng.randrange(3))
            outgoing.append((i, digit, target))
            pending.append(target)
        program[vertex] = outgoing
    return start, finish, program


def accepting_paths(start, finish, program):
    def visit(vertex, states, digits):
        if vertex == finish:
            yield states, digits
            return
        for i, digit, target in program[vertex]:
            yield from visit(target, (*states, target), (*digits, (i, digit)))

    return list(visit(start, (start,), ()))


def check_program(length, deterministic, rng):
    start, finish, program = make_program(length, deterministic, rng)
    paths = accepting_paths(start, finish, program)
    if not paths:
        return None

    segments = defaultdict(set)
    values = set()
    for states, digits in paths:
        values.add(sum(digit << i for i, digit in digits))
        for first, last in combinations(range(length + 1), 2):
            segments[states[first], states[last]].add(tuple(sorted(digits[first:last])))
    bound = max(Counter(x + y for x, y in product(values, repeat=2)).values())
    d = bound.bit_length() - 1

    seen = {}
    trace_count = 0
    for states, digits in paths:
        ambiguous = [
            (first, last)
            for first, last in combinations(range(length + 1), 2)
            if len(segments[states[first], states[last]]) > 1
        ]
        cuts = []
        for first, last in sorted(ambiguous, key=lambda interval: interval[1]):
            if not any(first <= cut < last for cut in cuts):
                cuts.append(last - 1)
        assert len(cuts) <= d
        if deterministic:
            key = tuple((cut, states[cut], digits[cut][1]) for cut in cuts)
        else:
            key = tuple((cut, states[cut], states[cut + 1], digits[cut][1]) for cut in cuts)
        value = sum(digit << i for i, digit in digits)
        assert seen.setdefault(key, value) == value
        trace_count += 1
    return len(values), trace_count


def check_grammar_swaps():
    for depth in range(1, 10):
        values = {}
        for choice in product(range(2), repeat=depth + 2):
            seed, tail, *spine = choice
            left, right = str(seed), str(1 - seed)
            for bit in spine:
                left, right = str(bit) + right, left + str(1 - bit)
            values[choice] = int("1" + left + str(tail) * 2 + right, 2)
        assert len(set(values.values())) == 1 << (depth + 2)
        sums = {value + values[tuple(1 - bit for bit in choice)] for choice, value in values.items()}
        assert len(sums) == 1


def main():
    rng = Random(20261124)
    checks = []
    for deterministic in (False, True):
        for _ in range(16):
            result = check_program(7, deterministic, rng)
            if result is not None:
                checks.append(result)
    check_grammar_swaps()
    traces = sum(traces for _, traces in checks)
    print(f"Exact encodings of {traces} accepting paths over {len(checks)} programs passed.")
    print("Tuple-grammar digit swaps passed at depths 1 through 9.")


if __name__ == "__main__":
    main()
