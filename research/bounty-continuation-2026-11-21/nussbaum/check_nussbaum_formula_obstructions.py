#!/usr/bin/env python3
"""Exact checks of cited method obstructions, not prize counterexamples."""
import importlib.util
import itertools
import json
from pathlib import Path


def load_evaluator():
    here = Path(__file__).resolve().parent
    source = here / "search_nussbaum_orbit.py"
    if not source.exists():
        source = here.parent / "conjectures/search_nussbaum_orbit.py"
    spec = importlib.util.spec_from_file_location("nussbaum_search", source)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def check_cycle(module, states, formulas):
    assert len(set(states)) == len(states)
    for clauses in formulas:
        for clause in clauses:
            assert len({j for j, bit in clause}) == len(clause)
    for i, state in enumerate(states):
        image = tuple({0: 0, 1: -1, 2: 1}[module.formula_value(f, state)]
                      for f in formulas)
        assert image == states[(i + 1) % len(states)]


def main():
    module = load_evaluator()
    known = [(1, -1, 1, -1), (-1, 1, -1, 1),
             (0, -1, 0, -1), (-1, 0, -1, 0),
             (1, -1, 0, -1), (-1, 1, -1, 0),
             (0, -1, 1, -1), (-1, 0, -1, 1)]
    formulas, missing = module.narrow_formulas(known)
    assert not missing and formulas is not None
    check_cycle(module, known, formulas)

    rotating = [(1, -1), (-1, 1)]
    rotating_formulas = [[[(1, 1)], [(1, 0)]], [[(0, 1)], [(0, 0)]]]
    check_cycle(module, rotating, rotating_formulas)
    assert all(tuple(module.formula_value(f, v) for f in rotating_formulas)
               == (2, 2) for v in itertools.product((0, 1), repeat=2))

    mixed = [(0, -1, -1), (-1, 0, 0)]
    mixed_formulas = [[[(0, 0), (1, 1), (2, 0)]],
                      [[(0, 1), (1, 0), (2, 0)]],
                      [[(0, 1), (1, 0), (2, 0)]]]
    check_cycle(module, mixed, mixed_formulas)
    sizes = [sum(module.complete(s, v)
                 for v in itertools.product((0, 1), repeat=3)) for s in mixed]
    assert sizes == [4, 2]

    print(json.dumps({
        "known_eight_cycle_narrow_extension": "PASS",
        "known_eight_cycle_formulas": formulas,
        "boolean_dynamics_lift_failure": "PASS",
        "whole_face_permutation_failure": "PASS",
        "mixed_completion_sizes": sizes,
        "scope": "All periods are within the conjectured bound. These are exact method obstructions only.",
        "full_bounty_solutions": 0,
    }, indent=2))


if __name__ == "__main__":
    main()
