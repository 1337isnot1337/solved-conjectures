#!/usr/bin/env python3
"""Finite checks for the 3-occurrence 3-CNF -> Hamiltonian-cycle polynomial projection.

Only tests small n and structural invariants. The circuit lower bound is an
external theorem and is not established by this program.
"""
from __future__ import annotations

from collections import Counter, defaultdict
from itertools import combinations, permutations, product


class CNFBuilder:
    def __init__(self):
        self.next_var = 1
        self.clauses = []
        self.gates = []

    def var(self):
        v = self.next_var
        self.next_var += 1
        return v

    def land(self, x, y):
        z = self.var()
        self.clauses.extend(([-z, x], [-z, y], [z, -x, -y]))
        self.gates.append((z, "and", x, y))
        return z

    def lor(self, x, y):
        z = self.var()
        self.clauses.extend(([-x, z], [-y, z], [x, y, -z]))
        self.gates.append((z, "or", x, y))
        return z

    def or_all(self, terms):
        terms = list(terms)
        if not terms:
            raise ValueError("Expected at least one term")
        result = terms[0]
        for term in terms[1:]:
            result = self.lor(result, term)
        return result

    def exactly_one(self, terms):
        terms = list(terms)
        self.clauses.append([self.or_all(terms)])
        for a, b in combinations(terms, 2):
            self.clauses.append([-a, -b])

    def eq(self, a, b):
        self.clauses.extend(([-a, b], [a, -b]))


def build(n):
    if n < 3:
        raise ValueError("n >= 3 required")
    t = CNFBuilder()
    b = {(pos, vert): t.var() for pos in range(2, n + 1)
         for vert in range(2, n + 1)}
    e = {(i, j): t.var() for i in range(1, n + 1)
         for j in range(1, n + 1) if i != j}
    for pos in range(2, n + 1):
        t.exactly_one(b[pos, j] for j in range(2, n + 1))
    for vert in range(2, n + 1):
        t.exactly_one(b[pos, vert] for pos in range(2, n + 1))
    for i, j in e:
        if i == 1:
            rhs = b[2, j]
        elif j == 1:
            rhs = b[n, i]
        else:
            rhs = t.or_all(t.land(b[pos, i], b[pos + 1, j])
                           for pos in range(2, n))
        t.eq(e[i, j], rhs)
    return t, b, e


def split_occurrences(clauses):
    new_clauses = []
    copies = defaultdict(list)
    nextvar = 1
    for clause in clauses:
        newclause = []
        for lit in clause:
            u = nextvar
            nextvar += 1
            copies[abs(lit)].append(u)
            newclause.append(u if lit > 0 else -u)
        new_clauses.append(newclause)
    for vs in copies.values():
        if len(vs) > 1:
            for a, b in zip(vs, vs[1:] + vs[:1]):
                new_clauses.append([-a, b])
    return new_clauses, dict(copies), nextvar - 1


def satisfied(clauses, values):
    return all(any(values[abs(lit)] == (lit > 0) for lit in clause)
               for clause in clauses)


def evaluate(builder, b, e, bvalues):
    values = dict(bvalues)
    n = max(pos for pos, _ in b)
    for (i, j), eid in e.items():
        if i == 1:
            values[eid] = values[b[2, j]]
        elif j == 1:
            values[eid] = values[b[n, i]]
        else:
            values[eid] = any(values[b[pos, i]]
                              and values[b[pos + 1, j]]
                              for pos in range(2, n))
    for z, op, a, c in builder.gates:
        values[z] = (values[a] and values[c]) if op == "and" else (values[a] or values[c])
    return values


def structural_test(n):
    builder, b, e = build(n)
    split, copies, nvars = split_occurrences(builder.clauses)
    occurrences = Counter(abs(lit) for clause in split for lit in clause)
    assert max(map(len, split)) <= 3
    assert max(occurrences.values()) <= 3
    assert len(copies) == builder.next_var - 1
    assert all(occurrences[i] >= 1 for i in range(1, nvars + 1))
    return builder, b, e, split, copies, nvars


def test(n):
    builder, b, e, split, copies, nvars = structural_test(n)
    satisfying_monomials = []
    for bits in product((False, True), repeat=(n - 1) ** 2):
        bvalues = dict(zip(b.values(), bits))
        values = evaluate(builder, b, e, bvalues)
        good = satisfied(builder.clauses, values)
        split_values = {copy: values[var]
                        for var, cc in copies.items() for copy in cc}
        assert good == satisfied(split, split_values)
        if good:
            weighted = frozenset(edge for edge, var in e.items()
                                 if split_values[copies[var][0]])
            satisfying_monomials.append(weighted)
    expected = [frozenset(zip((1,) + p, p + (1,)))
                for p in permutations(range(2, n + 1))]
    assert len(satisfying_monomials) == len(expected)
    assert len(set(satisfying_monomials)) == len(expected)
    assert set(satisfying_monomials) == set(expected)
    print(f"n={n} original vars={builder.next_var-1} clauses={len(builder.clauses)} "
          f"split vars={nvars} clauses={len(split)} "
          f"monomials={len(satisfying_monomials)} expected={len(expected)}")


if __name__ == "__main__":
    for n in (3, 4):
        test(n)
    for n in (5, 6, 7, 8):
        _, _, _, _, _, numvars = structural_test(n)
        print(f"n={n} structural checks passed ({numvars} variables)")
