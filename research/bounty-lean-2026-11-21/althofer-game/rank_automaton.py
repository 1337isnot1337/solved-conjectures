"""Build the binary automaton for a game horizon and count its accepted words."""
from collections import deque
from fractions import Fraction
from math import factorial
import argparse

from check_remoteness import horizon


def build(initial, advance, output):
    states = [initial]
    indexes = {initial: 0}
    edges = []
    values = []
    for state in states:
        row = []
        for bit in (0, 1):
            successor = advance(state, bit)
            if successor not in indexes:
                indexes[successor] = len(states)
                states.append(successor)
            row.append(indexes[successor])
        edges.append(tuple(row))
        values.append(output(state))
    return edges, values


def minimize(machine):
    edges, values = machine
    # Refine the output partition by predecessors of a splitter block.
    inverse = [[[] for _ in edges] for _ in (0, 1)]
    for q, row in enumerate(edges):
        for bit, child in enumerate(row):
            inverse[bit][child].append(q)
    bins = {}
    for q, value in enumerate(values):
        bins.setdefault(value, set()).add(q)
    blocks = list(bins.values())
    label = [0] * len(edges)
    for i, block in enumerate(blocks):
        for q in block:
            label[q] = i
    queue = deque(range(len(blocks)))
    pending = set(queue)
    while queue:
        i = queue.popleft()
        pending.remove(i)
        splitter = blocks[i].copy()
        for bit in (0, 1):
            pieces = {}
            for child in splitter:
                for q in inverse[bit][child]:
                    pieces.setdefault(label[q], set()).add(q)
            for old, part in pieces.items():
                if len(part) == len(blocks[old]):
                    continue
                blocks[old].difference_update(part)
                new = len(blocks)
                blocks.append(part)
                for q in part:
                    label[q] = new
                # A pending block must still be processed in both pieces.
                add = new if old in pending or len(part) <= len(blocks[old]) else old
                if add not in pending:
                    queue.append(add)
                    pending.add(add)
    # Rebuild in reachability order so the initial state is numbered zero.
    representatives = [next(iter(block)) for block in blocks]
    return build(label[0], lambda g, b: label[edges[representatives[g]][b]],
                 lambda g: values[representatives[g]])


# -1 marks a transducer still stripping its initial low zero bits.
def feed(edges, q, bit):
    if q < 0:
        return edges[0][1] if bit else -1
    return edges[q][bit]


def next_horizon(machine):
    edges, values = machine

    def move(stream, bit):
        carry, q = stream
        carry, out = divmod(3*bit + carry, 2)
        return carry, feed(edges, q, out)

    def result(stream):
        carry, q = stream
        while carry:
            carry, out = divmod(carry, 2)
            q = feed(edges, q, out)
        assert q >= 0
        return values[q]

    # Valid words start and end with 1. Track the single-bit word separately.
    start = ('start',)
    dead = ('invalid',)

    def advance(state, bit):
        if state == dead:
            return dead
        if state == start:
            if bit == 0:
                return dead
            return ('one', move((-1, -1), 1), move((1, -1), 1))
        _, minus, plus = state
        return (bit, move(minus, bit), move(plus, bit))

    def output(state):
        last = state[0]
        if last == 'one':
            return -1
        if last != 1:
            return 0
        return -min(result(state[1]), result(state[2]))

    return minimize(build(start, advance, output))


def leading_term(edges, values, sign):
    """Return the pole order and leading Laurent coefficient at z=1."""
    back = [[] for _ in edges]
    for q, row in enumerate(edges):
        for child in row:
            back[child].append(q)
    live = {q for q, value in enumerate(values) if value == sign}
    todo = list(live)
    while todo:
        for parent in back[todo.pop()]:
            if parent not in live:
                live.add(parent)
                todo.append(parent)

    # Kosaraju with explicit stacks to support large acyclic prefixes.
    seen = set()
    order = []
    for root in live:
        if root in seen:
            continue
        stack = [(root, False)]
        while stack:
            q, leaving = stack.pop()
            if leaving:
                order.append(q)
            elif q not in seen:
                seen.add(q)
                stack.append((q, True))
                stack.extend((child, False) for child in edges[q] if child in live)
    components = []
    assigned = set()
    for root in reversed(order):
        if root in assigned:
            continue
        group = {root}
        assigned.add(root)
        stack = [root]
        while stack:
            for parent in back[stack.pop()]:
                if parent not in assigned:
                    assigned.add(parent)
                    group.add(parent)
                    stack.append(parent)
        components.append(group)

    terms = {}
    for group in reversed(components):
        exits = []
        cyclic = len(group) > 1 or any(q in edges[q] for q in group)
        for q in group:
            if cyclic:
                assert sum(child in group for child in edges[q]) == 1
            if values[q] == sign:
                exits.append((0, Fraction(1)))
            exits.extend(terms[child] for child in edges[q] if child in live and child not in group)
        degree = max(d for d, _ in exits)
        coeff = sum(c for d, c in exits if d == degree)
        if cyclic:
            degree += 1
            coeff /= len(group)
        for q in group:
            terms[q] = degree, coeff
    return terms[0]


def evaluate(edges, values, n):
    q = 0
    while n:
        n, bit = divmod(n, 2)
        q = edges[q][bit]
    return values[q]


def restrict_residues(machine, modulus):
    edges, values = machine

    def advance(state, bit):
        q, residue, weight = state
        return edges[q][bit], (residue + bit*weight) % modulus, 2*weight % modulus

    return build((0, 0, 1 % modulus), advance, lambda state: (values[state[0]], state[1]))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--horizon', type=int, default=4)
    parser.add_argument('--check-below', type=int, default=2000)
    parser.add_argument('--modulus', type=int, default=1, choices=(1, 3, 9, 27))
    args = parser.parse_args()
    machine = ([(2, 1), (2, 2), (2, 2)], [0, -1, 0])
    print('horizon  states  degree  leading constant')
    for t in range(args.horizon + 1):
        if t:
            machine = next_horizon(machine)
        edges, values = machine
        for n in range(1, args.check_below, 2):
            assert evaluate(edges, values, n) == horizon(n, t), (n, t)
        for n in range(2, args.check_below, 2):
            assert evaluate(edges, values, n) == 0
        sign = 1 if t % 2 else -1
        degree, coefficient = leading_term(edges, values, sign)
        assert degree == (t+1)//2
        j = (t+1)//2
        expected = Fraction(4, 9)**(j-1) / factorial(j) if j else Fraction(1)
        if t and t % 2 == 0:
            expected *= Fraction(2, 3)
        assert coefficient == expected * factorial(j)
        if args.modulus > 1 and t:
            mod_edges, mod_values = restrict_residues(machine, args.modulus)
            for a in range(args.modulus):
                deg, coeff = leading_term(mod_edges, mod_values, (sign, a))
                assert (deg, coeff) == (degree, coefficient / args.modulus)
        print(f'{t:7} {len(edges):7} {degree:7}  {coefficient / factorial(degree)}', flush=True)


if __name__ == '__main__':
    main()
