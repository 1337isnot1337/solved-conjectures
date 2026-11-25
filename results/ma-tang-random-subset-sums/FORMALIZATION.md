# Lean formalization

**Complete Lean verification of the original question.** [Ma–Tang, arXiv:2602.05768v2, Problem 4.1](https://arxiv.org/html/2602.05768v2#S4) asks for the second-order constant in the universal threshold for covering a finite abelian group by subset sums of a uniformly chosen subset.

- [`MaTangLimsup.maTang_limsup`](../../lean/Conjectures/MaTangLimsup.lean) proves that the literal real logarithm limsup of the normalized threshold is `1 / Real.log 2`.
- `MaTangLimsup.mixed_refined_lower` proves the third-log lower correction in equation (1) of the [written proof](PROOF.md), with an existential constant valid for all sufficiently large binary dimensions. `mixed_normalized_tendsto` proves convergence along the same mixed orders.
- `MaTangCoreLeast.threshold` is the least size for which all models of the given order have at least half successful samples. Each model provides a complete duplicate-free group enumeration. The sample list contains each unordered subset exactly once, and success counts literal subset-sum coverage. Associativity, identity, commutativity and invertible translations give precisely the finite abelian group structure. The upper and lower proofs use the same threshold.

The upper proof formalizes the smoothing route from [Erdős–Rényi, Theorem 2](https://www.renyi.hu/~p_erdos/1965-15.pdf) using exact translation-energy and missing-count identities. The lower proof uses the repository’s existing mixed binary/ternary obstruction. The history, mathematical authorship and priority qualifications of the written result are unchanged. The separate fourth-log and bounded-error refinements in [BOUNDED-REMAINDER.md](BOUNDED-REMAINDER.md), and the prime-order sharp coefficient, are not part of this formalization.

Pinned Lean 4.35.0 strict compilation and stock replay passed for all 32 modules. The all-owned transitive axiom gate checked 1514 declarations (1099 theorems, 96 private) and 31 required endpoints. [Receipt](verification/limsup-receipt.json) · [Exact endpoint audit](verification/TargetAudit.lean).

Reproduce the exact scoped check from the repository root using the pinned dependencies:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.MaTangLimsup \
  --require MaTangLimsup.maTang_limsup \
  --require MaTangLimsup.mixed_refined_lower \
  --require MaTangLimsup.mixed_normalized_tendsto \
  --out /tmp/ma-tang-limsup-verification
```
