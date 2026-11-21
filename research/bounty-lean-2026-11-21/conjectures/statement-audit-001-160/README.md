# Frozen statement audit: entries 1–160

Date: 21 November 2026. This is a definition audit, not a solved problem or an award claim.

The [Conjectures review policy](https://github.com/conjectures-io/conjectures-validator/blob/main/docs/MANUAL_REVIEW_CRITERIA.md)
permits a formalization-defect award when a proof of the exact published target
succeeds because its mathematical meaning differs materially from the intended
problem. The award is capped at the smaller of $750 equivalent and the locked
bounty, paid in Subnet 66 Alpha. Verification, review, and payment remain separate.
No submission, fee, account operation, or log upload was made.

## Reproducible source identity

The source base is
`google-deepmind/formal-conjectures@7d1a8c9912747679d0093f6d1216420c33ee5ffa`.
The validator applies
[formal-conjectures-audit-fixes.patch](https://github.com/conjectures-io/conjectures-tasks/blob/main/tiers/tier-1/formal-conjectures-audit-fixes.patch)
to obtain source commit `6adcbe13652f4e7c69ad02a783465ae2a99d5cb3`.
That generated commit is not an upstream GitHub ref.

The complete patch was retrieved by Git blob
`33b460b4aff52026c9b37373bef6d0642477b244` and its bytes independently checked
against SHA-256
`352280407fbbe83e636aa07a5c090aab15c6353c7cd77c0491284cd40df51275`.
The file endpoint had silently returned empty content for this large file;
that empty response was not treated as the source.

[target-types.json](target-types.json) records the 160 published statement
headers and immutable task identities. Each header comes from
`versions/<task_id>/source-metadata.json` in the task repository.
A pretty-printed type can hide an inferred domain. It is a screening input,
not a substitute for the definitions and exact task contract.

## Concrete apparent defects rejected

| Target | Source check | Conclusion |
| --- | --- | --- |
| Erdős 243 | The hypothesis is `Summable ((1 : ℚ) / a ·)`, not merely real convergence. | Rational summability already encodes a rational sum. The proposed sequence `a(n)=2^(2^n)` is not a counterexample without a rationality proof. |
| Erdős 324, quintic | The domain is pairs of natural numbers with `a < b`. | Cancellation from signed pairs `(-a,a)` is outside the domain. |
| Erdős 1068 | The imported `InfinitelyConnected` definition requires `Nontrivial V` and infinitely many internally disjoint paths for every distinct pair. | Empty and singleton induced subgraphs do not satisfy it. |
| Erdős 14 | `allUniqueSums` identifies the two orders of a pair explicitly. | Ordered-pair double counting does not trivialize either target. |
| Erdős 1056 | Strictly increasing boundaries define consecutive nonempty intervals; every interval product must be 1 modulo a prime. | The omitted explicit upper bound by the prime does not immediately help: the union interval cannot contain a multiple of that prime, and translating all boundaries by a common multiple of the prime yields a bounded witness. |
| Erdős 143 | `WellSeparatedSet` includes containment in `(1,∞)`, infinitude, countability, and the required multiple-separation inequalities. | Negative points and a divergent accumulation at 1 are not admissible shortcuts. |
| Erdős 247 | The unbounded limsup is taken in `EReal`. | The infinity condition is not an unintended real supremum convention. |
| Erdős 257 | The possible zero index contributes zero under Lean's division convention; the remaining positive-index series is geometrically dominated. | Adding index zero does not create the proposed irrationality failure. |
| Erdős 357 | `HasDistinctSums` is injectivity on finite order-connected sets. Empty sets are included, but positive terms make their zero sum distinct. | The empty interval does not make the admissible class empty. |
| Erdős 461 | The patched source defines the smooth component with prime multiplicity and counts distinct images. It separately checks `t=0` and `t=1`. | The zero-length boundary case is consistent with the uniform bound. |
| Erdős 479 | The elaborated type includes an unused extra integer binder. | Universal quantification over that inhabited type does not change the underlying problem. |

Source files and helper definitions were read at the base revision and
compared with the relevant patch sections. These checks reject specific
shortcuts. They do not prove that every definition is correct.

## Outcome

No proof or refutation of an award target was obtained. No verified
formalization defect was found among these checks. The 160 headers are not
160 audited mathematical resolutions, and their presence in the registry
does not establish that a reward remains available.
