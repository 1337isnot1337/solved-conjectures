# Priority audit

Audit date: 21 November 2026.

## Decisive earlier resolution

Primary public source: [the-omega-institute/trureturing issue 25927](https://github.com/the-omega-institute/trureturing/issues/25927), titled *Research line: Alexandersson–Leite Conjecture 3.14 (arXiv:2609.38084) — informal Dyck-height refutation and Lean gaps*.

The GitHub issue API returned:

- Created: `2026-11-03T01:35:27Z`.
- Updated: `2026-11-03T01:35:27Z`.
- State: open.
- Comments: zero.
- Author account: `macstudio-2[bot]`.

The issue gives the original coefficient-height correspondence and a complete asymptotic contradiction. Its conditioned geometric tree model gives Dyck height mean asymptotic to `sqrt(pi*n)` and variance asymptotic to `(pi^2/3-pi)*n`; bounded rounding preserves linear variance. A self-contained size-bias argument establishes the necessary ULC inequality `variance <= mean`. It concludes that both original polynomial families violate ULC eventually.

The mathematical argument is sufficient without an explicit finite witness. The issue's unresolved tasks are formalization tasks, and our user explicitly excludes Lean work. Its cautious use of the word informal does not erase the complete mathematical refutation. Our elementary proof and exact finite certificates are independent additions to a known disproof, not a new resolution.

## Original source audit

The [current arXiv abstract](https://arxiv.org/abs/2609.38084) still lists only v1, submitted 29 September 2026. The [full HTML](https://arxiv.org/html/2609.38084v1) and PDF were inspected. Section 2.1, Corollary 3.13, and Conjecture 3.14 agree on the finite-degree normalization and the two height groupings. The source's finite check through size 200 conflicts with our exact finite-degree certificates; that conflict is recorded in `PROOF.md` and `README.md`.

## Searches performed before the decisive hit

Both public-web search engines were used with the arXiv identifier, full title, both authors' names, Conjecture 3.14, and combinations of peak-nesting with counterexample, ultra log-concavity, log-concavity, variance, and Dyck height. The original paper, author-maintained catalog, OEIS references, and abstract mirrors were found. None of these ordinary web results exposed the earlier issue.

The author's [homepage](https://alexandersson.symmetricfunctions.com/) and current arXiv record were checked. Local repository Markdown and repository-scoped issue searches for the identifier, author surname, and peak-nesting did not reveal a prior solution. The current repository contained discussions of possible overlap with Catalan-peak and Fuss–Catalan work, not a solution of this conjecture.

The decisive final check was a **global GitHub issue search for the exact quoted identifier `2609.38084`**. That search returned issue 25927 with the full earlier proof. A separate global code query for the identifier returned citations and overlap notes; a further code query was rate limited and was not needed after the decisive issue was inspected.

## Disposition

Do not add this package to the new-results count. Preserve it under research as a source-checked independent reproof, exact-certificate contribution, and explicit exclusion. Target tracking is in [solved-conjectures issue 183](https://github.com/1337isnot1337/solved-conjectures/issues/183), with coordination in issue 156.
