# Hegyvári’s conjecture

**Incomplete formalization: verified transport and integer carry reductions only.**

Existing result: [published proof, §§2–3](https://github.com/1337isnot1337/solved-conjectures/blob/d7a796c0d20e30d3fd743318ac688dee51496212/results/hegyvari-floor-doubling/PROOF.md), [result entry](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/hegyvari-floor-doubling), discovery #446, formalization #581. The current session started 2026-11-24 18:59 UTC.

The exact original result is the strong completeness of the positive distinct union of the two real floor-doubling rays after deleting any finite subset, for positive parameters whose ratio is not a power of two and at least one of which is not dyadic. Hegyvári’s stronger conjecture is recorded in [Steve Fan, arXiv:2607.14071v6, §1 and Remark 4.2](https://arxiv.org/html/2607.14071v6). The [Kohlmeyer–Kruer paper](https://hexagonmath.org/2611.00768v1) supplies the irrational-ratio result and tower arguments; the repository proof supplies the rational-ratio extensions. Preserve the proof authorship and credit in the original entry and audit; no new discovery or absolute priority is asserted.

[Lean source](../../lean/Conjectures/HegyvariFloorDoublingTransport.lean) proves eight universally quantified lemmas in core Lean. Forward transport is an eventual positive bounded return between binary-mark sequences; composition and self-transport give bounded gaps. An abstract binary recurrence and exact integer carry bounds prove that, for an odd integer multiplier, a sufficiently long zero run following a mark forces a simultaneous mark in the multiplied ray. Combining this with the reverse transport gives bounded gaps in the first ray. These match the combinatorial portions of §3, without taking the tower conclusions as axioms.

Still required: construct the real floor-doubling rays and show their binary-step recurrence and carry bounds; relate non-dyadic parameters to unbounded marks; formalize or import and audit the exact tower criteria, derive both transport directions in Case I and the integer-part common-mark criterion for Case II; show the second ray has bounded zero gaps where required; establish the indexed-to-distinct sumset and finite-deletion bridge, and prove the complete quantified conjecture. The two cases and the converse are not formally settled by this file.

## Verification

Pinned Lean 4.35.0, strict compilation and per-endpoint transitive axiom output, followed by stock leanchecker. No Mathlib imports in this module. The repository-wide build and all-owned audit are not yet run; they must pass before registration. Mathlib filename search at the pinned commit found no conjecture-specific module; this does not rule out relevant reusable general lemmas.

```text
Lean (version 4.35.0, x86_64-unknown-linux-gnu, commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release)
2a2a1c78daa6ae95ebb898a06c42315db532f4db47b6404c2b7d7520447d4fdd  Conjectures/HegyvariFloorDoublingTransport.lean
STRICT COMPILE PASSED
'HegyvariFloorDoubling.transport_comp' depends on axioms: [propext, Quot.sound]
'HegyvariFloorDoubling.boundedGaps_of_selfTransport' depends on axioms: [propext, Quot.sound]
'HegyvariFloorDoubling.boundedGaps_of_two_transports' depends on axioms: [propext, Quot.sound]
'HegyvariFloorDoubling.boundedGaps_of_longRun_response' depends on axioms: [propext, Classical.choice, Quot.sound]
'HegyvariFloorDoubling.binaryStep_lower' depends on axioms: [propext, Quot.sound]
'HegyvariFloorDoubling.zeroRun_expansion' depends on axioms: [propext, Quot.sound]
'HegyvariFloorDoubling.oddMultiplier_response' depends on axioms: [propext, Quot.sound]
'HegyvariFloorDoubling.boundedGaps_of_oddMultiplier' depends on axioms: [propext, Classical.choice, Quot.sound]
KERNEL REPLAY PASSED
```

No catalogue or completed-result count change.
