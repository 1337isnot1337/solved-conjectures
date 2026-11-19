"""Direct checks of the cycle and interlacing lemmas. Run with Python 3."""
from collections import Counter
from itertools import accumulate, zip_longest


def partitions(n, maximum):
    if n == 0:
        yield ()
    for first in range(min(n, maximum), 0, -1):
        for tail in partitions(n - first, first):
            yield (first,) + tail


def move(state, picks):
    newborn = sum(picks[h] for h in state)
    survivors = [h - picks[h] for h in state if h > picks[h]]
    return tuple(sorted([newborn] + survivors, reverse=True)), newborn


def fixed_profile(h, picks):
    result = []
    while h:
        result.append(h)
        h -= picks[h]
    return tuple(result)


def require(condition, detail):
    if not condition:
        raise ArithmeticError(detail)


def verify_rule(n, layers, all_states):
    picks = list(accumulate(layers, initial=0))
    profiles = [fixed_profile(h, picks) for h in range(1, n + 1)]
    stable = max((p for p in profiles if sum(p) <= n), key=sum)
    next_state, birth = {}, {}
    for state in all_states:
        next_state[state], birth[state] = move(state, picks)
    tau = [0]
    for r in range(1, n + 1):
        tau.append(1 if layers[r - 1] else 1 + tau[r - picks[r]])

    done, counts = set(), Counter()
    for state in all_states:
        path = {}
        while state not in done and state not in path:
            path[state] = len(path)
            state = next_state[state]
        done.update(path)
        if state not in path:
            continue
        cycle = list(path)[path[state]:]
        period = len(cycle)
        births = [birth[p] for p in cycle]
        low, high = min(births), max(births)
        detail = (n, layers, cycle)
        require(high - picks[high] <= low, detail)
        for r in range(1, high + 1):
            for t, size in enumerate(births):
                require((size >= r) == (births[(t - tau[r]) % period] >= r), detail)
        for p in cycle:
            require(all(u <= v for u, v in zip_longest(p[1:], stable, fillvalue=0)), detail)
            require(all(u <= v for u, v in zip_longest(stable[1:], p, fillvalue=0)), detail)
        counts.update(cycles=1, recurrent_states=period)
    counts.update(rules=1, states=len(all_states))
    return counts


def main():
    totals = Counter()
    for n in range(1, 15):
        states = list(partitions(n, n))
        for mask in range(1 << (n - 1)):
            layers = [1] + [(mask >> j) & 1 for j in range(n - 1)]
            totals.update(verify_rule(n, layers, states))
    print("All admissible rules for 1 through 14 cards:", dict(totals))
    for n in range(1, 1001):
        b = n // 2 + 1
        h = (n + b) // 2
        picks = [min(b, i) for i in range(n + 2)]
        fixed = fixed_profile(h, picks)
        require(sum(fixed) <= n < sum(fixed_profile(h + 1, picks)), (n, fixed))
        require(move(fixed, picks)[0] == fixed, (n, fixed))
        other = tuple(x for x in (b, n - b) if x)
        require(move((n,), picks)[0] == other, n)
        require(move(other, picks)[0] == (n,), n)
    print("Counterexample formulas agree with direct moves for 1 through 1000 cards.")


if __name__ == "__main__":
    main()
