# Lean scope for Xu–Zhou’s diameter–Laplacian conjecture

**Status: partial.** This is the initial checkpoint for the inclusive
eigenvalue bound in [Xu and Zhou’s Conjecture 1.1](https://doi.org/10.13001/ela.2024.8757),
printed page 775 (preprint [Conjecture 5.1](https://arxiv.org/html/2401.03777v2#S5)).
It does not claim the full clique-chain inequality or sharpness family.

- [Spectral reduction](../../lean/Conjectures/XuZhouSpectral.lean):
  uses the actual Hermitian matrix eigenbasis and eigenvalues, with
  multiplicity. A strict Rayleigh-bound subspace injects into the
  eigencoordinates below the cutoff. The complementary count includes
  eigenvalues exactly at the cutoff. A separate observation lemma counts
  nonnegative eigenvalues when the zero space is nonpositive and contains
  no nonzero matrix kernel vector.
- [Literal distance layers](../../lean/Conjectures/XuZhouDistanceLayers.lean):
  a connected finite simple graph has a surjective layer map indexed by
  its diameter plus one. Every edge stays in one layer or between
  neighboring layers. A subset of any prescribed admissible cardinality
  can keep at least one representative of every layer.
- [Quadratic comparison](../../lean/Conjectures/XuZhouLaplacianEnergy.lean):
  uses the actual graph Laplacian’s finite squared-difference formula to
  prove that graph completion cannot decrease the energy.
- [Marking budget](../../lean/Conjectures/XuZhouMarking.lean):
  implements the clique-chain marking rules, with a local charge that
  redirects a redundant mark to a large layer between two size-two layers.
  The resulting set has cardinality at most the total surplus over one
  vertex per layer.

The recorded argument and its scope are in [PROOF.md](PROOF.md), with
the written result credited to Cinna Davis. The original proposers are
Leyou Xu and Bo Zhou. Credit to the earlier results for individual
parameter slices, and the limits on the priority search, are unchanged.
[Discovery and verification issue #487](https://github.com/1337isnot1337/solved-conjectures/issues/487).

The [receipt](verification/receipt.json) records strict source compilation,
the all-owned axiom audit, and pinned stock-kernel replay. Reproduce with
`scripts/verify_lean_target.py`, root `Conjectures.XuZhouLaplacianPartial`,
and the endpoints in the receipt. The aggregate gate is separate.
