# Conjectures statement audit: registry positions 161–326

Status at 2026-11-21 17:24 UTC: no verified solution, counterexample, or statement defect found. This is a completed screening checkpoint, not an award claim. No proof was submitted and no payment was made.

## Scope and exact environment

All 166 source-metadata records were retrieved successfully from `conjectures-io/conjectures-tasks`, using `versions/<task_id>/source-metadata.json`, and their displayed theorem types were screened. Selected definitions were then checked in the exact upstream base and the validator's audit patch. This is not a claim that every transitive definition of all 166 targets was audited.

The frozen generated repository is `6adcbe13652f4e7c69ad02a783465ae2a99d5cb3`. It is built from upstream FormalConjectures revision `7d1a8c9912747679d0093f6d1216420c33ee5ffa` plus the audit patch with SHA-256 `352280407fbbe83e636aa07a5c090aab15c6353c7cd77c0491284cd40df51275`. The patch hash was independently recomputed locally. The generated revision is not an upstream GitHub commit, so fetching upstream files at that generated hash would be incorrect.

`metadata-snapshot.json` records every exact task ID, target type hash, task bundle hash, metadata type, and source path in this slice. `pinned-base-sources.json` preserves 67 retrieved base files. The latter are explicitly BASE sources: the audit patch can materially change their mathematics. Neither file asserts that a target remains unclaimed or that an award would be approved.

## Discarded candidate defects

| Candidate | Check and conclusion |
|---|---|
| Erdős 517: cancel repeated powers in an entire series | `HasFabryGaps n` contains `StrictMono n` as well as `n(k)/k → ∞`. Pairing repeated exponents with opposite coefficients does not satisfy the frozen hypothesis. |
| Erdős 647: an unbounded natural-number supremum might default to zero | The index is `Fin n`, so the supremum is over a finite nonempty set when `n > 24`. This is the intended bounded maximum. |
| Erdős 695 upper bound: the first index might force a prime below one | At `k = 0`, choosing the freely specified error value `o 0 = -1` gives exponent `0^0 = 1` and right side `exp 1`; the prime 2 is allowed. The little-o condition does not restrict finitely many initial values. This does not prove the conjecture, but defeats this proposed contradiction. |
| Hardy–Littlewood: repeated shifts and an upper-bound-only conclusion | These are defects of the raw base source already repaired in the frozen patch. The patch requires `m 0 = 0` and `Function.Injective m`, and changes Big-O to asymptotic equivalence. No new defect is claimed. |
| Normality of pi: only one-digit frequencies | The patch explicitly separates simple normality and normality, then defines normality using every finite digit block. The frozen target uses the repaired predicate. |
| Inscribed square: repeated vertices | `IsRectangle` requires adjacent vertices distinct, equal diagonal midpoints and lengths, and aspect ratio one. A repeated-point or collapsed rectangle does not satisfy these conditions. |
| Erdős 70: cardinal continuum confused with the real order | The frozen patch replaces the main target with `RealCardinalRamsey3`, using an order embedding into the usual real line. The incorrect raw-base reading is not the frozen problem. |
| Lovász Hamilton path: empty connected graph | Mathlib's `SimpleGraph.Connected` includes `Nonempty V`. The empty graph is excluded. |
| Hilbert 6 mean-field limit: empty interface or a totalized integral | The statement includes existence of a classical solution, a positive-mass smooth initial density, force integrability, and a deviation event that includes failure of particle-trajectory existence. The suspected vacuity routes do not apply. |
| Hilbert 12 geometric/Stark formulations: unrestricted oracle or missing existence | The geometric formulation requires one flat separated scheme of finite type with commuting Frobenius lifts. The Stark formulation includes existence of the Artin map and analytic continuation, with explicit finite-place and infinite-place normalization. No proof or counterexample was obtained. |

Further definitions checked included extremal graph quantities, finite cycle counts, prime-factor functions, factorial and divisor sums, binomial coefficients, finite projective planes, Goormaghtigh repunits, Hamming covering density, numerical-semigroup data, exact matrix multiplication, polynomial minimal graphs, and the Polya variational eigenvalue definitions. These checks found no concrete proof or refutation in this slice.

## Award scope and stopping point

The [submission terms](https://conjectures.io/submission-terms), version 13 effective 2026-11-11, and the [manual review criteria](https://github.com/conjectures-io/conjectures-validator/blob/main/docs/MANUAL_REVIEW_CRITERIA.md), policy version 4, distinguish a mathematical resolution from a genuine defect in a frozen statement. The stated defect award is capped at the smaller of USD 750 equivalent and the locked bounty. It requires an exact verified proof/refutation and the platform's review; discovering a suspicious expression or a base-source error already repaired by the patch does not establish eligibility.

No existing admitted theorem, hidden assumption, changed challenge, or platform bypass was used as a proposed proof. There is no candidate artifact ready for submission. The audit stops here so that work can return to a mathematical target.

## Primary source locations

- [Conjectures task registry and immutable version bundles](https://github.com/conjectures-io/conjectures-tasks)
- [Validator repository and review policy](https://github.com/conjectures-io/conjectures-validator)
- [Pinned upstream FormalConjectures base](https://github.com/google-deepmind/formal-conjectures/tree/7d1a8c9912747679d0093f6d1216420c33ee5ffa)
- Exact per-target URLs, hashes, and theorem names are in `metadata-snapshot.json`.
