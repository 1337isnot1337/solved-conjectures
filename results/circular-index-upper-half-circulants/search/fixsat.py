"""Perfect (p,q)-edge-colouring of a GIVEN graph on n = 2m+1 vertices (|E|*q == p*m), by SAT.
Classes are matchings of k = m/q edges; every q consecutive classes form a matching.
Function solve(n, E, p, q, timeout) -> ('sat', classes) | ('unsat', None) | ('timeout', None)."""
import sys, time
from math import gcd
from fractions import Fraction
from pysat.formula import CNF, IDPool
from pysat.card import CardEnc, EncType
from pysat.solvers import Solver


def solve(n, E, p, q, assumptions_first_window=True, solver='cadical153'):
    m = (n - 1) // 2
    assert Fraction(len(E), m) == Fraction(p, q), (len(E), m, p, q)
    assert m % q == 0 or gcd(p, q) != 1
    k = m // q
    pool = IDPool(); cnf = CNF()
    E = [tuple(sorted(e)) for e in E]
    Z = lambda e, c: pool.id(('z', e, c % p))
    for e in E:
        lits = [Z(e, c) for c in range(p)]
        cnf.extend(CardEnc.equals(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
    for c in range(p):
        cnf.extend(CardEnc.equals([Z(e, c) for e in E], k, vpool=pool, encoding=EncType.seqcounter).clauses)
    inc = {v: [e for e in E if v in e] for v in range(n)}
    for v in range(n):
        for c in range(p):
            lits = [Z(e, c + t) for t in range(q) for e in inc[v]]
            cnf.extend(CardEnc.atmost(lits, 1, vpool=pool, encoding=EncType.seqcounter).clauses)
    if assumptions_first_window:
        cnf.append([Z(E[0], 0)])       # colour rotation symmetry
    with Solver(name=solver, bootstrap_with=cnf.clauses) as S:
        ok = S.solve()
        if not ok: return 'unsat', None
        model = set(l for l in S.get_model() if l > 0)
    cls = {c: [e for e in E if Z(e, c) in model] for c in range(p)}
    return 'sat', cls


def verify(n, E, p, q, cls):
    allE = [e for c in range(p) for e in cls[c]]
    assert sorted(allE) == sorted(tuple(sorted(e)) for e in E)
    for c in range(p):
        vs = [v for t in range(q) for e in cls[(c + t) % p] for v in e]
        assert len(vs) == len(set(vs)) == n - 1, ("window", c)
    return True
