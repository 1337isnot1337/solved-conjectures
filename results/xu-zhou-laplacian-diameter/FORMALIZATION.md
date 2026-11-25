# Lean scope for Xu–Zhou’s diameter–Laplacian conjecture

**Status: complete for Conjecture 1.1.** Lean proves the original
inclusive eigenvalue bound from [Xu and Zhou](https://doi.org/10.13001/ela.2024.8757),
printed page 775 (preprint [Conjecture 5.1](https://arxiv.org/html/2401.03777v2#S5)).
The statement uses the actual graph diameter and the actual graph
Laplacian. Each eigencoordinate is counted separately, so multiplicities
and both interval endpoints are retained. The hypotheses
`2 ≤ d`, `c ≤ d - 2`, and `d ≤ n - 2 - c` imply the source's
redundant `max(2,c) ≤ d` condition. The separate sharpness family
is not claimed in Lean.

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

- [Tridiagonal matrix](../../lean/Conjectures/XuZhouTridiagonal.lean)
  defines the real symmetric quotient matrix with off-diagonal ones and
  diagonal entries from the two neighbor sizes.
- [Nonpositive restriction](../../lean/Conjectures/XuZhouQuotientEnergy.lean)
  compares its quadratic form on unmarked coordinates to minus a graph
  Laplacian plus a nonpositive diagonal. The first coordinate has a
  strictly negative residual coefficient if it is unmarked.
- [Closed-cutoff count](../../lean/Conjectures/XuZhouQuotientInertia.lean)
  shows that a kernel vector vanishing at the marks vanishes at the first
  coordinate and hence everywhere, by the tridiagonal recurrence. The
  observation lemma bounds the number of nonnegative eigenvalues by the
  total layer surplus. Zero eigenvalues are included.

- [Literal clique-chain bound](../../lean/Conjectures/XuZhouCliqueChain.lean)
  groups the graph quadratic energy by the actual layer fibers. Rescaling
  the layer-constant vectors identifies the shifted form with the
  tridiagonal quotient. The negative space of the quotient maps
  injectively to graph vectors with Rayleigh value strictly below four.
  Their dimension proves the complementary bound of twice the surplus.
- [Zero extension](../../lean/Conjectures/XuZhouZeroExtension.lean)
  preserves squared norm, and the additional energy is at most the
  number of discarded vertices times squared norm. It accounts for the
  difference between the principal submatrix and the induced Laplacian.
- [Original statement](../../lean/Conjectures/XuZhouDiameter.lean)
  retains exactly `d+c+2` vertices with every distance layer represented.
  The lifted strict spectral space has dimension at least `d-c` at the
  source cutoff. Lean bounds the cardinal of the closed-interval
  eigencoordinates by `n-d+c` without any numerical computation.

The recorded argument and its scope are in [PROOF.md](PROOF.md), with
the written result credited to Cinna Davis. The original proposers are
Leyou Xu and Bo Zhou. Credit to the earlier results for individual
parameter slices, and the limits on the priority search, are unchanged.
[Discovery and verification issue #487](https://github.com/1337isnot1337/solved-conjectures/issues/487).

The [receipt](verification/receipt.json) records strict source compilation,
the all-owned axiom audit, and pinned stock-kernel replay. Reproduce with
`scripts/verify_lean_target.py`, root `Conjectures.XuZhouLaplacianFull`,
`--per-module-replay`, and the endpoints in the receipt. The aggregate gate is separate.
