# Steinerberger's quantitative Feldheim-tail conjecture

Independent source and statement audit, 2026-11-24 16:38:50 UTC.

## Decision

The four frozen modules formalize a full counterexample to both original
existential inequalities in §1.3 of Stefan Steinerberger's *A Sharp Estimate
for Probability Distributions*, arXiv:1801.00663v3 (15 February 2018), pp. 2–3.
No statement, denominator, quantifier, or probability-model discrepancy was
found. This is one completed existing-entry formalization for campaign
accounting, subject to the coordinator's integration and publication gates.

The audit read the primary PDF text and inspected the displayed question on
page 3 visually: <https://arxiv.org/pdf/1801.00663>. It also read the existing
entry and `PROOF.md` at repository main commit
`23af608da3c74e58e894f793f62ee93e56450221`, all 804 lines of the four frozen
Lean modules, and the scoped verification receipt and logs.

The source asks whether every admissible distribution admits a positive
threshold where the joint-event ratio is at least `2 * log 2 * z / median`,
or respectively `2 * z / expectation`. The measures are absolutely
continuous, nonnegative, and not compactly supported; the mean version
requires a finite expectation. `Real.log` is the natural logarithm used in
that displayed question.

## Statement and semantic checks

| Obligation | Checked formal content | Result |
|---|---|---|
| Full threshold range | `median_bound_fails` and `mean_bound_fails` give strict opposite inequalities for every real `z > 0`. The top-level propositions negate the existential guesses. | Pass |
| Actual joint numerator | `numeratorEvent z` is exactly `{(x,y) | 2*z ≤ x+y ∧ min x y ≤ z}`. | Pass |
| Actual joint denominator | `denominatorEvent z` is exactly `{(x,y) | 2*z ≤ x+y ∧ z ≤ min x y}`. Its rectangle identity is proved, rather than substituted by definition. | Pass |
| Nonzero denominator | `denominatorEvent_pos` proves the real probability is positive for every `z ≥ 0`; it equals `survival z ^ 2`. | Pass |
| Independent common law | Probabilities use `law.prod law`; `coordinates_independent` and `coordinates_identically_distributed` identify the coordinate random variables. | Pass |
| Probability normalization | The derivative of negative survival is integrated on the positive half-line. `law_univ` establishes mass one. | Pass |
| Absolute continuity | The law is a Lebesgue density on `Ioi 0`, and `law_absolutelyContinuous` proves the measure relation. | Pass |
| Positive and unbounded support | `law_pos_ae` gives strict positivity almost everywhere; `law_unbounded` gives positive mass above every real threshold. `law_not_compactly_supported` explicitly excludes any compact full-mass set. | Pass |
| Median semantics | `IsMedian` uses the usual two half-mass inequalities. Both halves equal one half at the explicit median. The median is positive and unique, so selection conventions cannot weaken the disproof. | Pass |
| Expectation semantics | `law_integrable_id` proves integrability of the actual identity random variable; `law_mean` proves its integral equals the survival integral using layer cake. | Pass |
| Constant comparison | The integral bound is `401/400`; both `log 2 / medianValue` and `1 / meanValue` are strictly greater. Multiplication by `2*z` preserves strictness for every positive threshold. | Pass |
| Genuine one-law counterexample | `counterexample` bundles one admissible law, one genuine median, a finite positive expectation, positive denominator, and both strict failures for all positive thresholds. | Pass |

The numerator computation uses product-measure integration over the actual
crossing events. Their intersection is null because the measure has no
atoms. The affine substitution then gives
`eventRatio law z = 2 * z * tailIntegral z`; this is a proved probability
bridge, not a surrogate definition.

The analytic proof follows the argument already recorded in the entry:
survival `exp (-x - x^2/200)`, secant and quadratic exponential estimates in
the small-parameter regime, a Gaussian bound in the other regime, exact
exponential moments for the mean, and the positive root of the median
equation. The fixed coefficient `1/200` is a witness for the universally
quantified conjecture; the proof covers every threshold, so it is not an
isolated numerical verification.

## Scope boundaries and attribution

The original conjecture hypotheses require absolute continuity. The separate
global smoothing perturbation, strict log-concavity assertion, variable
epsilon extension, asymptotic rate supplements, and smaller-constant existence
results in the repository are not formalized by these endpoints. They are
unnecessary for this full disproof and receive no additional completion count.
The earlier qualitative Feldheim–Feldheim theorem is a distinct statement.

The modules credit Stefan Steinerberger as proposer and identify the existing
repository argument contributed by Cinna Davis at
`6a8c0b0ac8c5a903405782b0a0df03c9ad78cdc6`. They preserve the limitation of the
repository's prior-resolution search. This review makes no new priority claim.

## Frozen snapshot and verification evidence

The independent review recomputed all four current source hashes and matched
them to `verification/receipt.json`:

| Module suffix | SHA-256 |
|---|---|
| `Analysis` | `0d81c9abf672c493920d756eacdaaee9c4a2fee0b3133fcec3605f7e8921ad2d` |
| `Law` | `8665e86225ca17431a5709b64857f368b2c03709dfa7bdb9e8c8a55fe3a53a6d` |
| `Joint` | `b2ddc78725e90ed799a56a5b5f12a65025ec34d48f6797edd6a70e21c19580e3` |
| Main module | `e6a59a626f6b65f5f94aaba9a6c57f12be52f2ad7c6ee09d38852e5d93b735e4` |

It also recomputed and matched every recorded step-log hash, audit-source
hash, and declaration-inventory hash. All recorded steps have exit code zero.
The all-owned audit reports 125 declarations, 109 theorems, four modules,
and 18 required endpoints; all 125 individual transitive axiom records use
only `propext`, `Classical.choice`, and `Quot.sound`. No direct project axiom
appears. The stock-kernel log lists exactly the four expected modules.

This was an independent mathematical/source/statement review and evidence
consistency check. It did not repeat the author's already-passed isolated
build and replay commands, and it does not claim the repository-wide gate,
hosted CI, publication, or website validation.
