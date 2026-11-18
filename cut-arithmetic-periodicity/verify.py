"""Prove the two CUT sequences by exhaustive binary automata operations."""
from functools import cache
from itertools import product


def reachable_machine(start, step, accepts):
    """Explore every state reachable by a word of binary digit pairs."""
    states = [start]
    indices = {start: 0}
    table = []
    final = set()
    for index, state in enumerate(states):
        if accepts(state):
            final.add(index)
        row = []
        for size_bit, value_bit in product(range(2), repeat=2):
            target = step(state, size_bit, value_bit)
            if target not in indices:
                indices[target] = len(states)
                states.append(target)
            row.append(indices[target])
        table.append(tuple(row))
    return table, final


def minimize(machine):
    table, final = machine
    labels = [int(i in final) for i in range(len(table))]
    while True:
        groups = {}
        new = []
        for i, row in enumerate(table):
            signature = (labels[i], *(labels[j] for j in row))
            new.append(groups.setdefault(signature, len(groups)))
        if new == labels:
            break
        labels = new
    result = [None] * len(set(labels))
    for i, row in enumerate(table):
        result[labels[i]] = tuple(labels[j] for j in row)
    assert labels[0] == 0
    return result, {labels[i] for i in final}


PREFIX = (0, 1, 2, 3, 1, 4)
BLOCK = (3, 2, 4, 5, 6, 7, 8, 9, 7, 11, 9, 8)


def candidate(n):
    if n <= 6:
        return PREFIX[n-1]
    q, r = divmod(n-7, 12)
    return 8*q + BLOCK[r]


def candidate_graph():
    # u=2*n-3*g is bounded on the graph and unchanged by (n,g) -> (n+12,g+8).
    bound = max(abs(2*n - 3*candidate(n)) for n in range(1, 19)) + 3

    def step(state, a, b):
        if state is None:
            return None
        u, residue, capped = state
        u = 2*u + 2*a - 3*b
        if abs(u) > bound:
            return None
        return u, (2*residue + a) % 12, min(7, 2*capped + a)

    def accepts(state):
        if state is None:
            return False
        u, residue, capped = state
        if capped == 0:
            return False
        n = capped if capped < 7 else 7 + (residue-7) % 12
        return u == 2*n - 3*candidate(n)

    return minimize(reachable_machine((0, 0, 0), step, accepts))


def rejecting_sinks(table, final):
    return {i for i, row in enumerate(table)
            if i not in final and all(target == i for target in row)}


def pile_sum(left, right):
    """Add pile sizes and XOR values of two independent pile groups."""
    lhs, lf = left
    rhs, rf = right
    ld = rejecting_sinks(lhs, lf)
    rd = rejecting_sinks(rhs, rf)

    @cache
    def successors(i, j, carry_out, a, b):
        targets = []
        for x, z, y in product(range(2), repeat=3):
            carry_in = a + 2*carry_out - x - z
            if carry_in not in (0, 1):
                continue
            s = lhs[i][2*x+y]
            t = rhs[j][2*z+(b^y)]
            if s not in ld and t not in rd:
                targets.append((s, t, carry_in))
        return targets

    def step(states, a, b):
        return frozenset(target for i, j, carry in states
                         for target in successors(i, j, carry, a, b))

    def accepts(states):
        return any(carry == 0 and i in lf and j in rf for i, j, carry in states)

    return minimize(reachable_machine(frozenset([(0, 0, 0)]), step, accepts))


def lower_values(graph):
    """Recognize (n,g) for which g is smaller than the candidate value."""
    table, final = graph

    def step(states, a, b):
        return frozenset((table[i][2*a+w], sign or ((w > b) - (w < b)))
                         for i, sign in states for w in (0, 1))

    def accepts(states):
        return any(i in final and sign == 1 for i, sign in states)

    return minimize(reachable_machine(frozenset([(0, 0)]), step, accepts))


def combine(machines, condition):
    def step(states, a, b):
        return tuple(table[i][2*a+b] for i, (table, _) in zip(states, machines))

    def accepts(states):
        return condition([i in final for i, (_, final) in zip(states, machines)])

    return minimize(reachable_machine((0,)*len(machines), step, accepts))


def main():
    single = candidate_graph()
    parts = {1: single}
    for count in range(2, 10):
        parts[count] = pile_sum(parts[count-1], single)
    lower = lower_values(single)
    for arities in ((2, 3, 9), (2, 3, 8, 9)):
        options = combine([parts[p] for p in arities], any)
        collision = combine([single, options], all)
        missing = combine([lower, options], lambda pair: pair[0] and not pair[1])
        assert not collision[1], "An option attains the proposed value."
        assert not missing[1], "A smaller value is missing."
        print(f"arities {arities}: {len(options[0])} option states; "
              "both error languages empty.")
    assert candidate(18) != candidate(6) + 8
    for p in (3, 6, 9):
        assert any(candidate(n+p) != candidate(n) + 2*p//3 for n in range(7, 19))


if __name__ == "__main__":
    main()
