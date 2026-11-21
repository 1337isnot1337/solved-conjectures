# Chen–Khare–Sahi's conjecture

The proposed counterexample to Conjecture 5 of Chen, Khare and Sahi's
*Majorization via positivity of Jack and Macdonald polynomial differences*
uses the standard monic Macdonald family. The normalized difference for
$`(4,2,0)\succeq(4,1,1)`$ at $`q=1/10,t=9/10`$ lies outside the full
Muirhead semiring.

A rational linear functional is nonnegative on every product needed to
generate the degree-six part of that semiring, while its value on the
Macdonald difference is

```math
-\frac{4538292661539}{106631184392870}\lt0.
```

The proof covers all semiring products through an exhaustive reduction to
38 products and seven ordinary monomials. It also proves that every
rectangular translate of the partition pair is a counterexample. A
Hall–Littlewood calculation supplies a continuous family of parameters
with the same obstruction.

Under this standard Macdonald convention, this refutes the equivalence
asserted in Conjecture 5 through its semiring clause. The weaker evaluation-positivity inequality remains a
separate question; Sra has proved that inequality for this same partition
pair. The Jack-semiring Conjecture 4 is not resolved by this package.

## Current formalization scope

The current endpoints use the standard monic triangular Macdonald eigenfunctions. Stable Hall orthogonality followed by specialization is being formalized separately. The manuscript's literal truncated finite-variable Hall pairing conflicts with that convention; the [degree-three diagnostic](https://github.com/1337isnot1337/solved-conjectures/issues/201#issuecomment-7065320695) must be reconciled before claiming a full literal-source formalization.

All 16 existing modules passed fresh strict Lean 4.35 compilation with warnings treated as errors. The complete owned/private audit checked 1,454 declarations, including 1,254 theorem declarations, 816 private declarations and all 49 required endpoints. Only `propext`, `Classical.choice` and `Quot.sound` are allowed. Independent stock-kernel replay of the revised closure and the combined repository gate remain pending. The README badge remains partial.

[Compatibility receipt](../../docs/verification/lean-cks-compatibility-20261121/receipt.json).

## Files

- [Proof](PROOF.md): the complete semiring separation and the infinite
  family of rectangular translates.
- [Hall–Littlewood parameter family](HALL_LITTLEWOOD.md): an independent
  interval calculation and continuation to admissible positive parameters.
- [Source and priority audit](SOURCE_AUDIT.md): primary definitions and
  quantifiers, earlier results, archive searches, and their limits.
- [Independent mathematical review](ANALYSIS_REVIEW.md).
- [Independent root review](ROOT_REVIEW.md): full semiring coverage, two polynomial-identification methods, family arguments and current source comparison.
- [Exact verifier](verify.py): all 38 products, the defining Macdonald
  difference equations, and the rational separating value.
- [Independent cone check](independent_cone_check.py): a separate
  implementation of the exhaustive semiring calculation.
- [Independent orthogonality check](independent_orthogonality_check.py):
  construction from the defining Hall inner product, without the branching
  or difference-operator code.

All three verification scripts use only the Python standard library:

```sh
python verify.py
python independent_cone_check.py
python independent_orthogonality_check.py
```

The written argument and rational certificates are complete. They have
been independently reviewed within this research campaign; no external
peer-review claim is made. Lean checks the semiring separation and both families for the explicit monic triangular eigenfunction characterization. The repository-wide verification gate remains pending; see the [Lean status report](../../docs/lean-status.md).

Primary source: Hong Chen, Apoorva Khare and Siddhartha Sahi,
[arXiv:2509.19649v2](https://arxiv.org/html/2509.19649v2), Conjecture 5,
equation (5.7). Coordination and discovery history are in
[issue #201](https://github.com/1337isnot1337/solved-conjectures/issues/201).
