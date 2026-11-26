# Lean proof of the rank-six power-rank formula

Principia Math in Progress refuted the particular-rank clause of Conjecture 5.3 in September with a rank-eight recurrence whose power ranks detect perfect squares. Both proofs use the same eventual-quasipolynomial interpretation. The result here gives a separate rank-six sequence and its exact power ranks for every exponent at least 49. [Earlier proof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-366795/mathdb-366795-solution.tex). The dated checks below describe the repository work.

## Exact scope

The Lean development formalizes the existing proof in
[PROOF.md](PROOF.md), Sections 1–5, for the actual integer sequence

```math
s(n)=n(1+8^n)+2^n-16^n.
```

The recurrence rank is the least order of a constant-coefficient linear
recurrence that holds from some index onward and whose constant coefficient
is nonzero. Recurrence existence and minimality are proved for each power;
the rank is not defined to be the coefficient sum or the displayed formula.

The complete final endpoint is
`RowlandSistosBarron.rowland_sistos_barron_counterexample` in
[`RowlandSistosBarronTheorem.lean`](../../lean/Conjectures/RowlandSistosBarronTheorem.lean).
It states that the sequence has rank six, that every pointwise power has a
tail recurrence, and that for every integer $M\ge49$,

```math
R(M)=\frac{7M^2+3M+2}{2}
      -3\mathbf1_{M\bmod2=0}-6\mathbf1_{M\text{ is a square}}.
```

It also states that $R$ is not eventually quasipolynomial. The proof is
uniform over every field of characteristic zero, so it applies to recurrence
coefficients and residue polynomials over the rationals, reals, or complex
numbers. The integer sequence is explicitly cast into the selected field.

`RowlandSistosBarron.particularRankConjecture_false` refutes the corresponding
universal assertion for integer constant-recursive sequences. The definition
`EventuallyQuasipolynomial` quantifies over every positive period, every
family of residue polynomials, and every eventual threshold.

## Source and attribution

The conjecture is due to **Eric Rowland and Jesús Sistos Barrón** in
*Complexity of powers of a constant-recursive sequence*,
[arXiv:2501.14643v1](https://arxiv.org/html/2501.14643v1), Section 5,
Conjecture 5.3. Section 2 supplies the source's tail-recurrence definition.

The argument formalized here is the repository's recorded counterexample,
dated 20 November 2026 and published in commit `254d92d2`, with its
[independent audit](INDEPENDENT-AUDIT.md) and [prior-work audit](NOVELTY.md).
Proof-source attribution follows the repository's declared authors,
**Cinna Davis and GPT-6.2 Astra**. The result files name no different
result-specific proof author, and no additional authorship is inferred.
This formalization does not claim a new mathematical counterexample or settle
priority beyond the existing record.

The source uses “pseudo-polynomial” without an explicit definition. The
formal theorem uses the precise quasipolynomial interpretation: polynomial
on each residue class modulo a single fixed positive integer. Author
confirmation of the terminology remains distinct from kernel verification.
The general-rank eventual-polynomiality clause is outside this result.
The prior work of the Omega Institute on the different fixed-rank finiteness
conjecture and Shivam Patel's general-rank argument remains credited in
[NOVELTY.md](NOVELTY.md); neither is counted as a new result here.

## Statement audit

| Mathematical object | Lean representation and proved bridge |
| --- | --- |
| Actual integer sequence | `integerSequence : ℕ → ℤ` is the displayed formula. |
| Actual pointwise power | `poweredSequence M n = (integerSequence n : K)^M`. |
| Tail recurrence | `IsTailRecurrence`; `isTailRecurrence_iff` gives the literal equation for every sufficiently large index. |
| Minimum rank | `tailRecurrenceRank` uses the least recurrence order; existence and lower bounds are proved. |
| Exponential-polynomial expansion | `poweredSequence_eq_exponential_sum` evaluates the actual bivariate polynomial power. |
| Distinct roots | `two_pow_injective`; every base $2^k$ is nonzero. |
| Rank from coefficients | `poweredSequence_tailRecurrenceRank`, proved using the complete annihilator product and tail translation. |
| All cancellations | `coefficientPolynomial_rank_residue_one`, `coefficientPolynomial_rank_residue_two`, and `coefficientPolynomial_rank_upper`. |
| Exact exceptional counts | `parity_cancellation_count` and `square_cancellation_count`. |
| Uniform rank formula | `coefficientRank_formula`, then `rankSequence_formula` and `rankSequence_formula_div`. |
| Failure of every eventual quasipolynomial | `rankSequence_not_eventuallyQuasipolynomial`. |

No recurrence-independence, coefficient-cancellation, or rank-formula premise
is assumed in the final source theorem. The results hold for all powers in
the stated range. Finite numerical checks do not supply the unbounded claim.

## Proof organization

The `Difference`, `Exponential`, `Annihilator`, `Characteristic`, and
`Recurrence` modules prove the general minimum tail-recurrence theorem for
finite sums of polynomial multiples of distinct nonzero exponential bases.
They use the literal shift on sequences and prove every required annihilator
multiplicity. The `Sequence` module connects that theorem to the integer
sequence and its actual powers.

The `CoefficientsBasic`, `CoefficientsExpansion`, `CoefficientsDuality`,
`CoefficientsBounds`, `Krawtchouk`, `CoefficientsDegrees`,
`CancellationCounts`, `Sums`, and `Coefficients` modules formalize the
bivariate expansion, Krawtchouk identities, degree classification, and exact
sum over all possible exponents. The exceptional next coefficients are
proved nonzero for every $M\ge49$.

The `Quasipolynomial` module follows the recorded square-gap argument with a
direct polynomial identity. For any proposed period $q>0$, infinitely many
nonsquares of the form $(2q(t+N+50))^2+2q$ force the residue-zero polynomial
to equal the baseline quadratic. A sufficiently large square in that same
residue class contradicts the square correction. This proves the same
conclusion without an additional analytic unboundedness lemma.

## Verification

Completed on **24 November 2026 at 17:09:57 UTC**. The complete project
closure passed all three checks:

- Fresh strict compilation of all **17** project modules, treating warnings
  as errors. Each newly written source module also passed with
  `autoImplicit=false`.
- The repository's unchanged all-owned-declaration audit: **286** owned
  declarations, including **261** theorems, **5** private declarations, and
  **11** explicitly required source/bridge endpoints. The only transitive
  axioms are `propext`, `Classical.choice`, and `Quot.sound`.
- The repository's unchanged stock Lean kernel replay of the complete
  project import closure rooted at `Conjectures.RowlandSistosBarronTheorem`.

Compiler: `leanprover/lean4:v4.35.0`. The target receipt is
[`receipt.json`](../../docs/verification/rowland-20261124/receipt.json). It records the SHA-256 hash of every source module, the pinned
manifest, both unchanged repository verification scripts, each command, and
every exit status. The target check does not claim to have run the full
repository gate. The [separate aggregate attempt](../../docs/verification/rowland-20261124/aggregate-attempt.json)
exited 1 at 17:22:08 UTC because Lake attempted to rebuild missing Mathlib
artifact archives in the read-only shared dependency cache, beginning with
`Mathlib.Tactic.Translate.Core`; the [full failure log](../../docs/verification/rowland-20261124/aggregate-attempt.log)
is retained. This is not a pass. Hosted aggregate verification remains separate. The
[supplementary exact check](../../docs/verification/rowland-20261124/supplementary-check.json)
was also rerun through exponent 180; it is not a proof premise.

There are no `sorry`, `admit`, project-specific axioms, or native-evaluation
axioms in this verified closure. This is one complete formalized result
from the pre-existing Rowland–Sistos Barrón entry.
