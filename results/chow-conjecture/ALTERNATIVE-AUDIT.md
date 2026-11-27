# Scope and independent audit

The analytic tail argument and dyadic finite checker give an alternative written proof of the unranked strict strengthening. Issue #77 records the original deduction of the weak case from Savage–Visontai and the first strictness argument. The Lean receipt covers the unweighted theorem by the refinement method. [Original proof](PROOF.md) · [Priority audit](NOVELTY.md) · [Alternative proof submission](https://github.com/1337isnot1337/solved-conjectures/pull/454)

The exact target is the type-D question in [Chow, JMAA 2022, §5](https://doi.org/10.1016/j.jmaa.2022.126019). The known real-rootedness of each individual polynomial and the [August 2026 half-interlacing results within a degree](https://arxiv.org/abs/2608.02357) do not prove the consecutive cross-degree claim. The weak transition from degree two is sharp because the degree-two polynomial has a double root at minus one.

The independent review checked the Stembridge and logistic identities, endpoint peak and tail estimates, pole expansion and derivative estimates in the bulk, reciprocal sign transfer, and induction. The finite bridge uses exact dyadic signs through degree 128; the analytic bounds handle every subsequent transition.

No Lean verification, external review or absolute priority claim is made.
