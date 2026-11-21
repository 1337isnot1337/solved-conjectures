# Alexandersson–Saud Maia Leite's conjecture

## Status

**Excluded: an earlier public proof was found. This package contributes zero new resolutions.**

The original statement is Conjecture 3.14 of Per Alexandersson and Leonardo Saud Maia Leite, [*Peaks and peak-nestings on unit interval graphs*, arXiv:2609.38084v1](https://arxiv.org/html/2609.38084v1). It asserts ultra log-concavity for both the unrestricted and connected peak-nesting polynomials, for every positive integer size.

We independently obtained a complete disproof: both polynomial families fail even Poisson ultra log-concavity for every sufficiently large size. Two independent reviewers checked the source correspondence, variance obstruction, elementary height bounds, and exact certificates. However, the final global GitHub issue search found [the-omega-institute/trureturing issue 25927](https://github.com/the-omega-institute/trureturing/issues/25927), created and last updated on **2026-11-03 at 01:35:27 UTC**. That earlier issue supplies a valid full asymptotic disproof by the same variance obstruction, using standard conditioned-tree moment limits. The issue's remaining obligations concern Lean formalization; these do not leave the mathematical conjecture open.

## Contents

- `PROOF.md`: independent elementary proof using path-graph eigenvalues, ballot numbers, Stirling estimates, and reflection, with no Brownian limit theorem.
- `check.py`: standard-library exact checker using three independent counting formulas: confined Dyck walks, a two-wall binomial reflection formula, and bicolored Motzkin excursions.
- `witnesses.json`: four exact coefficient triples and strict integer inequalities.
- `ANALYSIS_REVIEW.md`: independent proof and source audit.
- `ROOT_REVIEW.md`, if present: the parent agent's independent audit.
- `NOVELTY.md`: decisive earlier source, search chronology, and exclusion rationale.

Run `python check.py` from this directory. No floating-point roots or approximate inequality decisions are used.

## Exact certificates

Writing `a_k` for a coefficient, the weaker Poisson necessary inequality is `k*a_k^2 >= (k+1)*a_(k-1)*a_(k+1)`. Finite-degree ultra log-concavity additionally includes the factor `(d-k+1)/(d-k)`.

| Family | Size | Index | Inequality refuted |
|---|---:|---:|---|
| Unrestricted | 210 | 17 | Poisson |
| Connected | 222 | 18 | Poisson |
| Unrestricted | 130 | 15 | Source's degree-65 normalization |
| Connected | 139 | 16 | Source's degree-70 normalization |

All three exact counting methods give the same coefficient triples. Small-size rows also reproduce the source's displayed examples and the correct Catalan totals. The source reports checks through size 200; the finite-degree certificates conflict with that sentence. We explicitly record the conflict without guessing its cause. The Poisson certificates lie beyond 200 and do not depend on the choice of finite ambient degree.

## Scope

The two families form one numbered conjunction, so even without the prior proof this would be one resolution. The ordinary log-concavity question for reduced peak-nesting polynomials in Conjecture 6.8 is different and remains untouched here. No Lean work was performed.
