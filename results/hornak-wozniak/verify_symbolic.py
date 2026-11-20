#!/usr/bin/env python3
"""Check the two local endpoint implications over linear integer arithmetic.

The d >= 2 branch relaxes the exact relation h = d*i + u - v to
h >= 2 * i + u - v and q >= h + 2. All actual capacities satisfy that
branch or one of the two exact branches for d = 0 and d = 1.
"""

from itertools import combinations
from z3 import And, If, Int, Ints, Not, Or, SolverFor, Sum, sat, unsat

i, m, offset = Ints("i m offset")
j = i + 1
u = Ints("u0 u1 u2")
v = Ints("v0 v1 v2")
q = Ints("q0 q1 q2")
h = Ints("h0 h1 h2")
pairs = tuple(combinations(range(3), 2))



def minimum(a, b):
    return If(a <= b, a, b)


def maximum(a, b):
    return If(a >= b, a, b)


def endpoint_counts(extra):
    small_residue_sum = Sum(*u) + offset - extra
    lower_quotient = If(small_residue_sum < 0, -1, If(small_residue_sum < i, 0, 1))
    lower_multiple = If(small_residue_sum < 0, -i, If(small_residue_sum < i, 0, i))
    few_big = small_residue_sum - lower_multiple
    many_small = Sum(*q) + lower_quotient - 1 - few_big

    big_residue_sum = Sum(*v) + offset + 1 - extra
    upper_quotient = If(big_residue_sum <= 0, 0, If(big_residue_sum <= j, 1, 2))
    upper_multiple = If(big_residue_sum <= 0, 0, If(big_residue_sum <= j, j, 2 * j))
    few_small = upper_multiple - big_residue_sum
    many_big = Sum(*h) + upper_quotient - 1 - few_small
    return lower_quotient, few_big, many_small, upper_quotient, many_big, few_small


def after_placement(extra, arm):
    lose_small = If(u[arm] < extra, 1, 0)
    lose_big = If(v[arm] < extra, 1, 0)
    small_slots = list(q)
    big_slots = list(h)
    small_residues = list(u)
    big_residues = list(v)
    small_slots[arm] -= lose_small
    big_slots[arm] -= lose_big
    small_residues[arm] += If(u[arm] < extra, i, 0) - extra
    big_residues[arm] += If(v[arm] < extra, j, 0) - extra
    return small_slots, big_slots, small_residues, big_residues, lose_small, lose_big


def largest_endpoint(extra):
    _, _, _, upper_quotient, big, small = endpoint_counts(extra)
    placements = []
    for arm in range(3):
        small_slots, _, _, big_residues, _, lose_big = after_placement(extra, arm)
        carries = upper_quotient - 1 + lose_big
        costs = [j - residue for residue in big_residues]
        ways = [carries <= 0]
        for count in (1, 2):
            for chosen in combinations(range(3), count):
                ways.append(And(carries == count,
                                Sum(*(costs[l] for l in chosen)) <= small,
                                *(small_slots[l] >= costs[l] for l in chosen)))
        placements.append(And(small <= Sum(*small_slots), Or(*ways)))
    return Or(big < 0, *placements)


def smallest_endpoint():
    lower_quotient, big, small, _, _, _ = endpoint_counts(m)
    placements = []
    for arm in range(3):
        _, big_slots, small_residues, _, lose_small, _ = after_placement(m, arm)
        budget = 1 - lower_quotient - lose_small
        free = Sum(*(minimum(a, b) for a, b in zip(small_residues, big_slots)))
        gains = [minimum(i, maximum(0, b-a)) for a, b in zip(small_residues, big_slots)]
        placements.append(And(budget >= 0, Or(big <= free,
                            And(budget >= 1, Or(*(big <= free + gain for gain in gains))))))
    return Or(small < 0, *placements)


def main():
    base = [i >= 2, m >= 1, m < i, Or(offset == 0, offset == 1)]
    for a, b, f, g in zip(u, v, q, h):
        base.extend((0 <= a, a < i, 0 <= b, b < j, g >= 1,
                     Or(And(f == g, g == a - b),
                        And(f == g + 1, g == i+a - b),
                        And(f >= g + 2, g >= 2 * i+a - b))))
    base.extend((Or(*(u[a] + u[b] + offset < i for a, b in pairs)),
                 Or(*(v[a] + v[b] + offset < j for a, b in pairs)),
                 largest_endpoint(0)))
    for name, statement in [('largest', largest_endpoint(m)), ('smallest', smallest_endpoint())]:
        for value in (0, 1):
            solver = SolverFor("QF_LIA")
            solver.add(*base, offset == value, Not(statement))
            outcome = solver.check()
            if outcome != unsat:
                raise RuntimeError(f"{name}, offset {value}: {outcome} {solver.model() if outcome == sat else ''}")
            print(f"{name} endpoint, offset {value}: no counterexample")
if __name__ == "__main__":
    main()
