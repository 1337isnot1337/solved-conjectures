# de Joannis de Verclos’s projective rigidity conjecture

**Lean status:** none.

A line-null planar probability measure whose support has Hausdorff dimension greater than one is determined up to projectivity by its finite order-type laws. The sampling measure itself need not have Hausdorff dimension greater than one.

The proof reconstructs cross-ratios on typical line slices by comparing transverse displacements. The slice projectivities determine a plane projectivity, which then extends to the entire orientation coupling.

[Conjecture 5 in *Limits of Order Types*](https://arxiv.org/html/1811.02236v1#Thmtheorem5) · [Proof](PROOF.md) · [Independent review and sources](AUDIT.md) · [Tracking issue #853](https://github.com/1337isnot1337/solved-conjectures/issues/853)

Run `python3 results/de-verclos-projective-rigidity/check_geometry.py` from the repository root. The earlier [positive-area proof](POSITIVE-AREA.md) and [parallel-segment proof](PARALLEL-SEGMENTS.md) remain available. The [secant](SECANTS.md) and [incidence](INCIDENCE.md) arguments of Cinna Davis are used in the full proof.

Adam Benazouz contributed the full proof. [Original contribution](https://github.com/1337isnot1337/solved-conjectures/pull/960) · [Contributor profile](https://github.com/adamben04)
