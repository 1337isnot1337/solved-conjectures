# Liang’s slice-period conjecture

**Status:** false. In 0.3102, Liang’s Conjecture 4.3 requires eventual diagonal period five in every three-heap slice. In the fixed-heap-two slice, the actual least bulk diagonal period is four. The outcome at gap two repeats P, P, N, N indefinitely, so arbitrarily large positions contradict period five. An exact recurrence transfer proves the entire slice formula, not just the checked finite instances.

This does not refute the weaker possibility of algebraic periodicity with other periods; in fact this slice has least periods five (edge) and four (bulk). This result is not Lean-formalized.

[Proof](PROOF.md) · [Audit](AUDIT.md) · [Exact checker](check.py) · [Independent check](check_independent.cpp)
