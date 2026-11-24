# Németh–Seberry–Shu conjecture

**Status: incomplete formalization.** The congruence and final counting reduction are proved in Lean. The analytic construction of the separated permanent values is not formalized. This entry therefore contributes **zero completed results** to the current formalization campaign.

## Checked statements

- [NemethSeberryShuCongruence.lean](../../lean/Conjectures/NemethSeberryShuCongruence.lean) defines the binary circulant with entries `1` precisely when `j - i ∈ S`, identifies its permanent with the number of supported permutations, constructs the translation-conjugation action, and identifies its fixed points with the support `S`. The prime-group orbit theorem then proves `permanent_modEq_card`: for every prime `p` and every subset `S` of `ZMod p`, the permanent is congruent to `S.card` modulo `p`.
- `card_eq_of_permanent_eq` proves that equal permanents have equal row sums when both row sums are less than `p`. `row_family_count` injects any family of distinct permanent values at different row sums into the actual finite set of all binary-circulant permanent values.
- [NemethSeberryShuCounting.lean](../../lean/Conjectures/NemethSeberryShuCounting.lean) proves the exact dense-row count and the reduction from uniform dense-row separation to eventual domination of every linear bound. In particular, `dense_family_count` gives the written proof's lower bound `M * (floor(2p/3) - ceil(p/3) + 1)`. `eventually_superlinear_of_dense_families` and `no_eventual_linear_bound_of_dense_families` have an explicit finite-family premise.

These statements quantify over all prime orders. The permanent is Mathlib's `Matrix.permanent`; the value set ranges over every binary support. The supported permutations use `i - σ(i) ∈ S`, matching Mathlib's permutation convention in the permanent sum. The fixed points are consequently translations by `-s`; this sign convention leaves the count `S.card` unchanged.

## Remaining obligation

The missing theorem is the following statement, already named by the checked interface:

```lean
∀ M : ℕ, ∃ N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
  NemethSeberryShu.HasDensePermanentFamilies q M
```

Here `HasDensePermanentFamilies q M` means that for **every** integer row sum `k` in `[ceil(q/3), floor(2q/3)]`, there are `M` binary supports of cardinality exactly `k` with pairwise distinct permanents. The threshold must be uniform over all these row sums.

The written proof supplies this input through §§1–2: a probabilistic construction with a prescribed Fourier mode and exact-cardinality repair; Fourier diagonalization and Parseval; the uniform permanent asymptotic of McCullagh in the form stated by Divoux–Wang, Proposition 3.1 and Remark 2.1; and a compactness argument giving a uniform positive separation between the selected amplitudes. None of these analytic steps has been replaced by an axiom. They remain unformalized. The stronger quadratic refinement is also unformalized.

## Source and credit

The exact argument formalized is §3 of the existing [written disproof](PROOF.md). The congruence is the binary case of Brualdi and Newman's [Theorem 3.2](https://nvlpubs.nist.gov/nistpubs/jres/69B/jresv69Bn3p159_A1b.pdf). The original conjecture is due to Németh, Seberry and Shu; see their [1979 paper, p. 181](https://documents.uow.edu.au/~jennie/WEBPDF/071_1979.pdf). The repository's existing entry credits the disproof to Cinna Davis and GPT-6.2 Astra and records its external audit. This partial formalization makes no additional claim about priority. The unresolved formal dependency is the uniform asymptotic cited in [Divoux–Wang](https://arxiv.org/html/2610.23755v1#S3).

## Verification

[Machine-readable receipt](../../docs/verification/lean-nemeth-seberry-shu-20261124/receipt.json). An independent review checked both modules against §3, including Mathlib’s permanent convention, the fixed-point sign, and the uniform dense-row quantifiers; no gap was found within this partial scope.

Target closure verification completed on **24 November 2026 at 16:30:34 UTC**, using Lean `v4.35.0` and the repository's pinned manifest. Both modules also passed with `-DautoImplicit=false -DwarningAsError=true`.

The unchanged repository all-owned declaration audit checked **49 declarations, including 37 theorem declarations**, across the two local modules and required all six endpoints listed below. It found only the standard axioms `propext`, `Classical.choice`, and `Quot.sound`. The unchanged stock kernel replay checked the entire two-module local import closure. No `sorry`, `admit`, project-specific axioms, or native-evaluation axioms are used.

Required endpoints:

```text
NemethSeberryShu.permanent_modEq_card
NemethSeberryShu.card_eq_of_permanent_eq
NemethSeberryShu.row_family_count
NemethSeberryShu.dense_family_count
NemethSeberryShu.eventually_superlinear_of_dense_families
NemethSeberryShu.no_eventual_linear_bound_of_dense_families
```

Verified source SHA-256 values:

```text
NemethSeberryShuCongruence.lean
5f8d00d7d0dc9731c523b272c8e45abb9204d47566cd9ff82eb447988d5d2daa
NemethSeberryShuCounting.lean
9a86041e1e05cab7433e7827911675d1c3166607ebcb171f30194c917e061a12
```

The target checks do not assert that the full repository gate has run. Integration and repository-wide verification are recorded separately by the campaign maintainer.
