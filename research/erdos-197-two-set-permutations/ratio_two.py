"""Compute the sharp obstruction for two colours with a factor-two precedence rule."""
from itertools import combinations
from pathlib import Path
from sys import argv

from pysat.formula import CNF
from pysat.solvers import Solver


def finite_instance(n):
    # Variables 1 to n record the colour of each integer.
    compare = {}
    for a, b in combinations(range(1, n + 1), 2):
        if b <= 2 * a:
            compare[a, b] = n + len(compare) + 1

    def before(a, b):
        if a > b:
            return -before(b, a)
        return compare.get((a, b), constant)

    # A positive constant records the required orientation of every distant pair.
    constant = n + len(compare) + 1
    formula = CNF()
    formula.append([1])
    formula.append([constant])

    def add(clause):
        if constant not in clause:
            formula.append([lit for lit in clause if lit != -constant])

    for a, b, c in combinations(range(1, n + 1), 3):
        ab, bc, ac = before(a, b), before(b, c), before(a, c)
        add([-ab, -bc, ac])
        add([ab, bc, -ac])
        if a + c == 2 * b:
            for colour in ((a, b, c), (-a, -b, -c)):
                add([*colour, ab, bc])
                add([*colour, -ab, -bc])
    return formula, before


def main(n, directory):
    formula, before = finite_instance(n)
    stem = directory / ('ratio-two-' + str(n))
    formula.to_file(str(stem.with_suffix('.cnf')))
    with Solver(name='cadical195', bootstrap_with=formula, with_proof=True) as solver:
        possible = solver.solve()
        print(n, formula.nv, len(formula.clauses), possible, flush=True)
        if possible:
            positive = {v for v in solver.get_model() if v > 0}
            def truth(literal):
                if literal < 0:
                    return -literal not in positive
                return literal in positive
            values = range(1, n + 1)
            rank = {b: sum(truth(before(a, b)) for a in values if a != b) for b in values}
            colours = {a: int(a in positive) for a in values}
            assert sorted(rank.values()) == list(range(n))
            for a, b in combinations(values, 2):
                if b > 2 * a:
                    assert rank[a] < rank[b]
                c = 2 * b - a
                if c <= n and colours[a] == colours[b] == colours[c]:
                    assert not min(rank[a], rank[c]) < rank[b] < max(rank[a], rank[c])
            with stem.with_suffix('.witness').open('w') as out:
                print(' '.join(str(colours[a]) for a in values), file=out)
                print(' '.join(map(str, sorted(values, key=rank.get))), file=out)
        else:
            proof = solver.get_proof()
            assert proof
            with stem.with_suffix('.drat').open('w') as out:
                for line in proof:
                    print(line, file=out)


if __name__ == '__main__':
    for argument in argv[1:]:
        main(int(argument), Path.cwd())
