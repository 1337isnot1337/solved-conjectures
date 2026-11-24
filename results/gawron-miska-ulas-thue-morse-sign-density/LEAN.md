# Lean formalization

**Complete disproof of the original Conjecture 5.8.** This receipt supersedes the earlier checked recurrence-only reduction. The stronger [exact-density theorem](EXACT_DENSITY.md) is not included.

Maciej Gawron, Piotr Miska and Maciej Ulas, [Arithmetic properties of coefficients of power series expansion of ∏(1-x^(2^n))^t, arXiv:1703.01955v1](https://arxiv.org/pdf/1703.01955), define the integer coefficient (t_m(n)) of the formal product in the introduction and Section 2 (PDF p. 2) and pose Conjecture 5.8 (PDF p. 31). The recurrence for (m=2) also appears in Andrzej Schinzel's Appendix, Lemma 6.1. The disproof follows the repository's [signed-block proof](PROOF.md) (discovery [#440](https://github.com/1337isnot1337/solved-conjectures/issues/440); Davis / GPT-6.2 Astra attribution retained), including both exception sets, not only a single finite counterexample. The [bounded prior-resolution search](AUDIT.md) remains a bounded search; no absolute priority or outside-review claim is made.

## Statement audit

`ThueMorseSignDensityProduct.truncCoeff` constructs the ordinary finite product coefficients from the exact multiplication operation by (1-q^d): (f(n)-f(n-d)) for (n\ge d), and (f(n)) otherwise. Repeating this operation (m) times gives the (m)-th power of that factor. The prefix contains every factor indexed (0\le i<L) with (d=2^i). `prefix_stable` and `t_eq_prefix` prove coefficient stabilization for all sufficiently long prefixes; `t` is therefore the coefficient of the paper's infinite formal product. `prefix_step`, `t_even`, `t_odd` and the predecessor recurrences establish the actual hypotheses of the separately checked signed-block core. There is no recurrence assumption in the final theorem.

`exception` is exactly the paper's sign-exception predicate in the **input index** (n) for (3n+j), using ((-1)^j), (m\ge2), (j=0,1). The list `exceptions m j X` is duplicate-free and contains precisely the exceptional indices (n<X). Its length equals the true finite-prefix cardinality. `DensityZero` expresses the limit equal to zero by testing all positive rational epsilons (a/b), with (X>0) and the equivalent strict integer comparison (b\,C(X)<aX). Positive rationals are cofinal at zero, so this is the standard epsilon definition of the paper's natural-density assertion; no assumption of the existence of a limiting density is used. `densityZero_reciprocal` also proves equivalence to the reciprocal-integer epsilon form. `InfinitelyMany` expresses unboundedness, equivalently infinitude for subsets of the naturals.

`conjecture_false` negates the full universally quantified source conjecture. The stronger checked endpoint `both_counterexamples` gives both infinite exception sets for (m=2), disproves density zero for each, and proves the lower and complementary upper finite-prefix estimates for **every** (X\ge0). In particular
[
\lfloor X/512\rfloor\le C_0(X)\le X-\lfloor X/512\rfloor,\qquad
\lfloor X/256\rfloor\le C_1(X)\le X-\lfloor X/256\rfloor .
]
These are the exact inequalities in the original written disproof. They yield the documented positive lower-density and upper-density bounds. They do not claim the separately documented exact density (1/2) theorem or anything about Conjecture 5.2. The proof is self-contained in the pinned core library and is independent of the separate valuation formalization.

## Exact scoped verification receipt

- Source commit: [471a5984bb7bd0936cf1b78bc1827ca1d8ff68e2](https://github.com/1337isnot1337/solved-conjectures/commit/471a5984bb7bd0936cf1b78bc1827ca1d8ff68e2)
- Compiler: Lean 4.35.0, commit `eb6cafb7290e8bd5f2937522d8d804f58f02bafc`, Linux x86-64.
- All three modules strictly compiled with `lean -j1 -DwarningAsError=true -R lean -o ...`.
- The repository's `audit_lean_all_owned.py` generated and validated the audit for the entire local import closure computed by `replay_lean.py`. Result: **250 owned declarations, 212 theorems, 119 private declarations, 27 required endpoints, three modules; passed**. The audit allowed only `propext`, `Classical.choice`, and `Quot.sound`. No unproved project-specific axioms, admitted results, or `sorryAx`.
- Independent pinned stock-kernel replay: `python3 scripts/replay_lean.py --root Conjectures.ThueMorseSignDensity` passed for all three modules. Both the all-owned audit and replay returned exit status zero.

| Module | SHA-256 |
| --- | --- |
| [ThueMorseSignDensityProduct.lean](../../lean/Conjectures/ThueMorseSignDensityProduct.lean) | `cdfc130cd8726c9bc616742ecd9f26b7a20e3a80758ed299781c6fd2ee08ad1c` |
| [ThueMorseSignDensityCore.lean](../../lean/Conjectures/ThueMorseSignDensityCore.lean) | `a4f715d8e08a77a826ac92e982ca123dce651ff0afc5b905214af8000682bbbf` |
| [ThueMorseSignDensity.lean](../../lean/Conjectures/ThueMorseSignDensity.lean) | `1daa845988ef152727be572876af444e054cec08cf44caa5a56279d220dc57f7` |

Required endpoints:

- `ThueMorseSignDensityProduct.prefix_step`
- `ThueMorseSignDensityProduct.prefix_stable`
- `ThueMorseSignDensityProduct.t_eq_prefix`
- `ThueMorseSignDensityProduct.t_even`
- `ThueMorseSignDensityProduct.t_odd`
- `ThueMorseSignDensity.recurrence`
- `ThueMorseSignDensity.t_nonzero`
- `ThueMorseSignDensity.signed_identity0`
- `ThueMorseSignDensity.signed_identity1`
- `ThueMorseSignDensity.exceptions_nodup`
- `ThueMorseSignDensity.exceptions_mem`
- `ThueMorseSignDensity.count_eq`
- `ThueMorseSignDensity.exception0_iff`
- `ThueMorseSignDensity.exception1_iff`
- `ThueMorseSignDensity.exception_block0`
- `ThueMorseSignDensity.exception_block1`
- `ThueMorseSignDensity.usual_block0`
- `ThueMorseSignDensity.usual_block1`
- `ThueMorseSignDensity.lower_bound0`
- `ThueMorseSignDensity.lower_bound1`
- `ThueMorseSignDensity.upper_bound0`
- `ThueMorseSignDensity.upper_bound1`
- `ThueMorseSignDensity.densityZero_reciprocal`
- `ThueMorseSignDensity.not_zero_density0`
- `ThueMorseSignDensity.not_zero_density1`
- `ThueMorseSignDensity.conjecture_false`
- `ThueMorseSignDensity.both_counterexamples`

This is the exact **scoped** proof verification. Package-wide and hosted integration gates are separate.
