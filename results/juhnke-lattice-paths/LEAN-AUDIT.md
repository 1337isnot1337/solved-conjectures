# Juhnke’s arbitrary-step lattice-path log-concavity conjecture

## Status

The Lean formalization is complete for every dimension `d ≥ 2` and every
step count. The complete 18-module import closure passed strict compilation,
the repository’s all-owned declaration audit, and stock Lean kernel replay
on 2026-11-24 at 16:54:46 UTC. This is one named result; the boundary
dimensions and the separate log-concavity and unimodality conclusions are
not additional counted results. Repository-wide integration checks and
publication are recorded separately by the campaign coordinator.

The campaign began at 2026-11-24T16:19:51Z. This work formalizes the existing
entry `results/juhnke-lattice-paths`; it does not propose a new conjecture or a
new mathematical resolution.

## Statement and attribution

The source is Martina Juhnke’s Problem 9, Conjecture 6, in
[*Enumerative Combinatorics*, Oberwolfach Report 2/2026, printed pp. 149–150](https://ems.press/content/serial-article-files/53596?nt=1#page=70).
It counts arbitrary positive-length east and north steps from `(2,1)` to
either `(d−1,d)` or `(d,d−1)`, by the number of steps. The conclusion is
log-concavity and unimodality for every admissible dimension. Conjecture 6
does not impose the diagonal avoidance or coherence conditions of the
preceding Conjecture 5.

The argument formalized here is the repository’s existing
[`PROOF.md`](PROOF.md), introduced in commit
[`2080aced`](https://github.com/1337isnot1337/solved-conjectures/commit/2080aced)
by Cinna Davis. The repository credits its mathematical work to Cinna Davis
and GPT-6.2 Astra; the Juhnke entry does not identify a different external
proof author. The original proposer is Martina Juhnke. The polynomial
translation criterion is attributed in that argument to Francesco Brenti,
[*Unimodal, Log-Concave and Pólya Frequency Sequences in Combinatorics*](https://doi.org/10.1090/memo/0413).
The Lean proof establishes the required translation result directly through
the operators `I + ε d/dz` and a coefficientwise limit. The repository’s
reported search did not locate an earlier exact resolution; this
formalization makes no stronger priority claim.

## Source audit

For `m = d−3 ≥ 1`, the endpoint displacements are `(m,m+2)` and
`(m+1,m+1)`, each with `2m+2` unit edges. A unit word with `r` maximal
direction runs gives the contribution `X^r(1+X)^(2m+2−r)`: direction changes
force cuts, and every other interior position permits an independent cut.

The formal path representation is a genuine ordered list of positive step
lengths with east/north labels. Its equivalent representation by a Mathlib
`Composition` and a Boolean label for each part is finite. The source bridge
proves expansion into unit words, preservation of the endpoint and number of
steps, and the correspondence between maximal runs and alternating positive
compositions. There are no unproved hypotheses asserting the enumeration.

For positive endpoint displacements `a,b`, the exact unit-word counts are

```
R_(2j+2) = 2 choose(a−1,j) choose(b−1,j)
R_(2j+3) = choose(a−1,j+1) choose(b−1,j)
           + choose(a−1,j) choose(b−1,j+1).
```

These formulas hold for every natural `j`, including indices beyond the
support. The proof uses an explicit equivalence with the first direction
and two independent positive compositions. It does not replace the paths
with a synthetically defined sequence.

The arithmetic modules prove the combined run sequence’s log-concavity,
positivity on its support, and zero coefficients outside it. Reversal and
translation then give log-concavity of the run-expansion polynomial.
Unimodality is derived from the verified nonnegative finite-support strong
log-concavity inequalities.

The dimension-three polynomial `X + 3X²` and the dimension-two
empty path are boundary cases of the same all-dimensional result. They are
not counted as separate results.

## Lean files

- `JuhnkeLogConcavity.lean`, `JuhnkeRuns.lean`, `JuhnkePolynomial.lean`, and
  `JuhnkeUnimodality.lean`: uniform coefficient inequalities, translation,
  reversal, and unimodality.
- `JuhnkeCompositions.lean`, `JuhnkeRunLengths.lean`,
  `JuhnkeAlternating.lean`, and `JuhnkeUnitRuns.lean`: actual positive
  compositions and exact unit-word run counts.
- `JuhnkePathsBasic.lean`, `JuhnkePathsCuts.lean`,
  `JuhnkePathsRuns.lean`, `JuhnkePathsSteps.lean`,
  `JuhnkePathsPolynomial.lean`, `JuhnkePathsBoundary.lean`,
  `JuhnkePathsBoundaryConcavity.lean`, and `JuhnkePathsOriginal.lean`: literal
  path semantics, their counting polynomial, and both boundary dimensions.
- `JuhnkeConjecture.lean`: identification of the two endpoint families
  with the uniform run-expansion polynomial.
- `JuhnkePathsTheorem.lean`: the full original-coordinate endpoint,
  `Juhnke.juhnke_conjecture`, with separate theorems
  `Juhnke.originalPathCount_logConcave` and
  `Juhnke.originalPathCount_unimodal` for the natural path counts.

All files are under `lean/Conjectures/` and use the `Juhnke` namespace.

## Verification

The [complete verification receipt](../../docs/verification/juhnke-20261124/receipt.json)
records a fresh strict compilation of all 18 project modules imported by
`Conjectures.JuhnkePathsTheorem`, with warnings treated as errors. The
unchanged repository all-owned audit checked 577 declarations, including
502 theorems and 11 required endpoints. The only transitive axioms were
`propext`, `Classical.choice`, and `Quot.sound`; there are no admitted
proofs or unproved project-specific axioms.

The required endpoints include both natural-count conclusions and the
literal-list, cut, maximal-run, alternating-composition, polynomial, and
original-endpoint bridges. This checks the semantic connection to the
source, in addition to the final coefficient inequalities. The repository’s
unchanged [stock kernel replay](../../docs/verification/juhnke-20261124/replay.log)
passed for all 18 modules. The receipt records all source hashes, the
verification-script hashes, and the pinned Lean 4.35.0 toolchain.

This receipt covers the complete Juhnke import closure. It does not claim
that the repository-wide integration gate has run.

The existing `check.py` was run unchanged from the published entry. Its
independent last-step recurrence agreed with the run formulas and
log-concavity inequalities for every `3 ≤ d ≤ 62`. This finite diagnostic
supports the source audit; the Lean theorems use unbounded dimension and
run-count parameters.

## Independent statement review

The integrator compared the final theorem with Conjecture 6 on printed page 150 of the original report, including both original endpoints, arbitrary positive integer step lengths, all dimensions, and both conclusions. The `literalPathStepsEquiv` theorem gives a bijection with ordinary ordered lists of positive east/north steps and preserves length and displacement. The natural count is the cardinality of the actual endpoint-and-step-count subtype. No diagonal restriction, assumed counting formula, or fixed-dimension premise is introduced. All copied source and verification-script hashes match the frozen receipt.
