# Chauhan–Dubey's conjecture

Unresolved screening checkpoint, 21 November 2026. No proof, counterexample,
repository issue, or completed-result count has been produced.

## Exact target

Bharat Pratap Chauhan and Dipti Dubey,
[*On semimonotone matrices of exact order two*](https://arxiv.org/html/2603.00639v1),
arXiv:2603.00639v1, Conjecture 3.12. The journal article is
[*Linear and Multilinear Algebra* 74(5), 671–685 (2026)](https://doi.org/10.1080/03081087.2026.2636706).
The full arXiv statement and definitions were read. The publisher preview
and author-uploaded journal text also preserve Conjecture 3.12.

A real matrix is semimonotone when every nonzero nonnegative vector has
at least one positive coordinate whose image coordinate is nonnegative.
An n-by-n matrix belongs to E0_2 when every principal submatrix of order
n−2 is semimonotone, and no principal submatrix of order n−1 or n is
semimonotone. The conjecture says that every such matrix has negative
determinant and an inverse with nonpositive off-diagonal entries. There is
no assumption that the original matrix is a Z-matrix.

This is the whole original conjecture over all permitted matrix sizes.
No fixed-size positive verification would count as a resolution.

## Sources and exclusions checked

Both web search engines were queried using the exact title, authors,
conjecture number, exact-order terminology, determinant, and inverse-Z
conclusion. Global GitHub issue searches used the source identifier,
authors, semimonotone, and the conjecture number. No resolution of
Conjecture 3.12 was located in that bounded screen. Global code search was
not retried because the shared quota was exhausted. This is not a complete
priority audit.

Two earlier public issues must be distinguished from this target:

- [TT 22517](https://github.com/the-omega-institute/trureturing/issues/22517)
  gives the row/column negative-entry-count question in Remark 4.1, first
  bullet. Its argument explicitly leaves the determinant/inverse question
  and Conjecture 3.12 unsettled.
- [TT 22883](https://github.com/the-omega-institute/trureturing/issues/22883)
  gives a complete elementary singular counterexample to the all-k question
  in Remark 4.1, second bullet. Its parameters are n=4, k=3. It does not
  satisfy the k=2 hypothesis of Conjecture 3.12 and cannot be reused as a
  refutation of that conjecture.

Conjecture 3.11 adds the assumption that A itself is a Z-matrix. Its scope
overlaps the older F0-matrix literature, including
[*A short survey of Z-matrices and new results on the subclass of
F0-matrices*](https://arxiv.org/abs/2305.05547). A secondary index marks that
neighboring target claimed-solved, but the decisive full primary theorem
has not yet been inspected. No novelty claim is made for Conjecture 3.11.

## Structural observations and cautions

Each principal (n−1)-block is almost semimonotone. The established inverse
theorem, reproduced as source Theorem 2.2, therefore makes each such block
invertible with entrywise nonpositive inverse. This is a useful necessary
condition; no proof has yet extended it to the full matrix.

Almost semimonotone matrices need not have all proper principal minors
nonnegative. Wendler's
[*The almost semimonotone matrices*](https://www.degruyterbrill.com/document/doi/10.1515/spma-2019-0023/pdf?licenseType=open-access)
gives a four-by-four counterexample on page 297. Its Conjecture 4.1 also
asks for determinant negativity and a unique negative eigenvalue for the
general almost-semimonotone class. Those facts cannot be assumed without
a later complete source.

No computational search was run for Conjecture 3.12 before the final
campaign-delivery review paused this screening.
