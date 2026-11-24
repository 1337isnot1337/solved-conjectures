# Lean formalization of the zero-sector counterexample

The [Lean module](../../lean/Conjectures/CardonZeroSector.lean) refutes the full universal [Question 6.1](https://arxiv.org/abs/1802.02641). The endpoint is `CardonZeroSector.cardon_question_6_1_false`.

The proof applies the actual diagonal operator to the real-rooted polynomial `(X - 1)^3` at `p = 3` and positive `α = log(16/15)/6`. It rewrites the output as a rescaled rational cubic, proves that cubic has negative discriminant, and proves the sector condition fails using an actual complex root. It does not infer nonreal roots from a numerical plot or an approximate root.

One witness suffices to refute the universal claim. The stronger small-parameter result for every real `p > 2` in the written proof is separate and is not formalized here.
