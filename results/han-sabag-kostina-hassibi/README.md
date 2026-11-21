# Han–Sabag–Kostina–Hassibi's conjecture

Status: complete written disproof; the full counterexample, exact sparse infimum and open-family gap are [Lean-checked](../../lean/Conjectures/HanSabagCounterexample.lean). The separate exact infimum for each assignment has not yet been fully formalized. The standalone source, all-owned axiom audit and stock-kernel replay passed; the merged-package gate is pending.

The Lyapunov positivity conjecture in [arXiv:2406.17196v2](https://arxiv.org/pdf/2406.17196v2), Conjecture 1, is false. The [proof](PROOF.md) constructs a rational feasible encoder of power $`23825/22491`$, while every encoder with exactly one nonzero entry per column has infimal power at least $`481/441`$. The strict gap is $`706/22491`$.

All four possible source-to-channel assignments are treated with arbitrary nonzero encoder coefficients. A symbolic calculation also gives an open interval of channel gains with the same failure. The argument refutes the full universal matrix conjecture and does not depend on a numerical optimization, a sampled parameter range, or failure of an infimum to be attained.

The claim concerns the stated matrix optimization. It does not assert a separate resolution of the general communication-code stabilization problem. These notes remain unrefereed.

## Files

- [PROOF.md](PROOF.md): complete disproof and open family.
- [SOURCES.md](SOURCES.md): original statement and bounded prior-art audit.
- [ALGEBRA_REVIEW.md](ALGEBRA_REVIEW.md): independent source and mathematical review.
- [ANALYSIS_REVIEW.md](ANALYSIS_REVIEW.md): second independent review.
- [verify.py](verify.py): exact rational and symbolic diagnostics.

Run `python3 verify.py` with SymPy installed. The shared Lean module checks the full matrix counterexample and the open-family uniform gap; the individual exact assignment infima remain outside its scope.

Research coordination: [issue 197](https://github.com/1337isnot1337/solved-conjectures/issues/197).
