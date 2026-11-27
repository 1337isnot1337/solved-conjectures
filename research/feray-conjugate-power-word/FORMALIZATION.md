# Féray’s conjugate-power word-measure conjectures

**Incomplete formalization: exact conditional-class fiber bijections verified.**

Existing entry: [proof, §1](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/feray-conjugate-power-word/PROOF.md); discovery #493; formalization #585. Session start 2026-11-24 18:59 UTC.

Valentin Féray's Problem 5 in [Oberwolfach Reports 2/2026, pp. 146–147](https://ems.press/content/serial-article-files/53596?nt=1#page=66) concerns the length of the cycle containing 1 divided by n, and the ranked normalized cycle-length list, for the word σ τ σ² τ² of two independent uniform permutations. The report also asks for total-variation mixing of this word. The repository proof establishes all three through the conditional class product, finite-group Plancherel and the Teyssier–Thévenin / Larsen–Shalev character estimates and Liebeck–Shalev Witten-zeta bound. Preserve the original proof credit and the scope and priority limits of [the audit](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/feray-conjugate-power-word/AUDIT.md). Not a new discovery; does not cover all primitive words.

[Lean source](../../lean/Conjectures/FerayConjugatePowerWordFibers.lean) uses a core representation of a permutation by a forward and inverse map with both inverse equations. The map (σ,τ) ↦ (στ,τ) is given with its inverse. The exact word identity σ τ σ² τ² = X² Y⁻¹ X Y is proved. For a fixed conjugacy class represented by c, the complete support of the two-output map is the product of the conjugacy classes of c² and c. Any two output pairs in that product have explicitly bijective fibers, with inverse maps checked. The fiber bijections encode the exact symmetry underlying §1's conditional independence, but the finite-cardinality/uniform-distribution bridge is not yet formalized. Nor are the arbitrary nonzero powers supplement, cycle-count bounds, character estimates, Plancherel, Witten-zeta estimate, parity mixing or the total-variation and cycle limits. The custom core representation must be connected to Mathlib Equiv.Perm (and finite counting) before the complete conjecture can be registered.

## Verification

Pinned Lean 4.35.0, strict compilation, transitive axiom audit of the listed theorem endpoints and bijection definitions, and stock leanchecker passed. No Mathlib imports in this module. Mathlib filename search at the pinned revision yielded no conjecture-specific word-measure module; general permutation and representation theory should be reused where available. Repository-wide package checks are still outstanding.

```text
Lean (version 4.35.0, x86_64-unknown-linux-gnu, commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release)
765495e3450e7956fe70768eb4ac7773363d3930447169bb40e92fb177bc5251  Conjectures/FerayConjugatePowerWordFibers.lean
STRICT COMPILE PASSED
'FerayConjugatePowerWord.Permutation.ext' depends on axioms: [Quot.sound]
'FerayConjugatePowerWord.Permutation.one_forward' does not depend on any axioms
'FerayConjugatePowerWord.Permutation.one_backward' does not depend on any axioms
'FerayConjugatePowerWord.Permutation.mul_forward' depends on axioms: [propext]
'FerayConjugatePowerWord.Permutation.mul_backward' depends on axioms: [propext]
'FerayConjugatePowerWord.Permutation.inv_forward' does not depend on any axioms
'FerayConjugatePowerWord.Permutation.inv_backward' does not depend on any axioms
'FerayConjugatePowerWord.Permutation.conj_one' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.Permutation.conj_comp' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.Permutation.conj_inverse' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.Permutation.conj_inverse'' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.Permutation.square_conj' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.Permutation.conj_two_changes' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.Permutation.word_change' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.changeGenerators' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.class_preserved' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.fiberForward' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.fiberBackward' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.fiberBijection' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.fibers_equinumerous' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.fiber_nonempty' depends on axioms: [propext, Quot.sound]
'FerayConjugatePowerWord.fiber_support' depends on axioms: [propext, Quot.sound]
KERNEL REPLAY PASSED
```

No catalogue or completed-result count change.
