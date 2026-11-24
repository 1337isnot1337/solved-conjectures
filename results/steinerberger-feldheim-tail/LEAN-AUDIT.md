# Steinerberger’s quantitative Feldheim-tail conjecture

## Formalized statement

`SteinerbergerFeldheim.counterexample` proves a counterexample to both original existential inequalities, with the probabilities, expectation, and median interpreted literally. The witness is the probability law whose survival function on the nonnegative half-line is

\[
S(x)=\exp(-x-x^2/200).
\]

Its density there is \((1+x/100)S(x)\). The Lean measure is the Lebesgue measure restricted to the positive half-line, with this density. The formalization proves total mass one, absolute continuity with respect to Lebesgue measure, almost-sure nonnegativity, positive mass above every real cutoff, integrability of the identity random variable, and a strictly positive expectation. It constructs a median with probability one half on each side. `median_unique` proves that the median specified by these half-probability equations is unique.

The exact two events are defined by

\[
A_z=\{(x,y):x+y\ge2z,\ \min(x,y)\le z\},
\qquad
B_z=\{(x,y):x+y\ge2z,\ \min(x,y)\ge z\}.
\]

The ratio `tailRatio μ z` is \((\mu\otimes\mu)(A_z)/(\mu\otimes\mu)(B_z)\), with both probabilities converted from extended nonnegative reals to reals. The denominator is proved strictly positive at every positive threshold. The coordinate maps on the product space are proved independent, and both pushforward measures are proved equal to the constructed law.

For every real \(z>0\), the endpoint proves

\[
R(z)<\frac{2(\log 2)z}{m},
\qquad
R(z)<\frac{2z}{\mathbb E X}.
\]

The quantifier ranges over every positive real threshold. The statement is not restricted to a numerical sample or asymptotic range. Thus the same law refutes both proposed existence statements.

## Sources and attribution

The proposer is **Stefan Steinerberger**. The exact questions appear in §1.3 of [*A Sharp Estimate for Probability Distributions*, arXiv:1801.00663v3](https://arxiv.org/pdf/1801.00663), and as Questions 1 and 2 in §24 of [*Some Open Problems*, March 31, 2026](https://faculty.washington.edu/steinerb/openproblems.pdf).

The argument formalized here is the existing [analytic proof](PROOF.md), first published in this repository through [PR #397](https://github.com/1337isnot1337/solved-conjectures/pull/397), commit `6a8c0b0ac8c5a903405782b0a0df03c9ad78cdc6`. Credit for that recorded proof remains **Cinna Davis and GPT-6.2 Astra**, in the repository’s stated order. This is a formalization of that argument, not a new counterexample or an independent priority claim.

The [existing source audit](AUDIT.md) records the scope of the prior-resolution search and its uncertainty. That uncertainty is unchanged. The original qualitative Feldheim–Feldheim theorem is a different statement and is not refuted here.

## Proof correspondence

| Lean source | Mathematical obligation |
| --- | --- |
| [SteinerbergerFeldheimBasic.lean](../../lean/Conjectures/SteinerbergerFeldheimBasic.lean) | Constructs the actual law; proves normalization by improper integration of the survival derivative, exact open and closed tails, absolute continuity, null singletons, positive support, unbounded support, smoothness of the density formula, and strict decrease of the survival function. |
| [SteinerbergerFeldheimBounds.lean](../../lean/Conjectures/SteinerbergerFeldheimBounds.lean) | Proves the uniform profile bound `401/400` for every positive real threshold. The small-parameter branch uses convexity of the exponential and a polynomial integral. The large-parameter branch uses the Gaussian half-line integral and `π < 4`. |
| [SteinerbergerFeldheimQuantities.lean](../../lean/Conjectures/SteinerbergerFeldheimQuantities.lean) | Identifies the actual expectation with the survival integral using the layer-cake theorem, proves `0 < E[X] ≤ 9903/10000`, constructs the actual median, proves uniqueness, and establishes both strict normalization gaps. |
| [SteinerbergerFeldheimProbability.lean](../../lean/Conjectures/SteinerbergerFeldheimProbability.lean) | Calculates the denominator event, applies product-measure Fubini to a half-event, performs the affine substitution, proves the ratio bounds, verifies independent identically distributed coordinates, and supplies the complete existential counterexample. |

The implementation uses the union bound for the two choices of the below-threshold variable. This gives the inequality needed for the disproof directly. The written proof obtains equality by observing that their intersection is null. Both routes give the same uniform upper bound, and no disjointness or probability-to-integral identity is assumed.

The mean estimate uses the real Gamma integral already proved in mathlib to evaluate the exponential moments of orders zero, two, and four. The negative-exponential quadratic estimate is proved in this formalization by differentiating its remainder and using `1 + x ≤ exp x`.

## Scope

This completes the disproof of the two original quantitative conjectures. It does not claim Lean proofs of the entry’s separate smoothing perturbation, the family of all smaller positive epsilon parameters, strict log-concavity, asymptotic rate statements, or the later positive universal-constant supplements. Those additional results are not needed for either original disproof. The density formula itself is proved smooth, and it is positive on the entire nonnegative half-line.

The two questions belong to one existing conjecture entry. This formalization counts as one completed entry.

## Verification

The integrator independently compared the endpoint with §1.3 of the original v3 paper and §24 of the March 2026 list. This review checked the exact two events, every-positive-threshold quantifier, finite positive expectation, actual median, absolute continuity, nonnegative support, and unbounded support. Source and checker hashes agree with the frozen receipt.

The pinned toolchain is Lean `4.35.0`, and mathlib is pinned at `56a005855ea17e0b0958f73ec801ae140b0a1679` by the existing manifest.

Verification freshly compiles the complete four-module project import closure with warnings treated as errors, audits every owned declaration using the unchanged `scripts/audit_lean_all_owned.py` implementation, and replays the complete project closure using the unchanged stock-kernel workflow:

```sh
cd lean
lake env python3 ../scripts/replay_lean.py --root Conjectures.SteinerbergerFeldheimProbability
```

The required audit endpoints are `counterexample`, `strict_counterbounds`, `median_unique`, `independent_coordinates`, `first_coordinate_law`, and `second_coordinate_law`, all in namespace `SteinerbergerFeldheim`. The allowed foundational axioms remain exactly `propext`, `Classical.choice`, and `Quot.sound`. No project-specific axiom, unfinished proof, or compiled decision oracle is used.

The [target-scoped receipt](../../docs/verification/lean-steinerberger-feldheim-20261124/receipt.json), completed on 24 November 2026 at 16:48:58 UTC, records source hashes, verification-script hashes, toolchain and manifest hashes, exact commands, endpoint inventory, and gate results. All four fresh strict compilations passed. The audit checked all 103 owned declarations, including 92 theorems and all six required endpoints; the complete four-module stock-kernel replay passed. This receipt describes the complete closure of this result; it does not claim that the repository-wide gate for unrelated entries was run as part of this target check.
