# Johnson's conjecture

Research checkpoint, 21 November 2026. Issue: [#211](https://github.com/1337isnot1337/solved-conjectures/issues/211).

## Target and significance

The exact target is Conjecture 7.1 of William Johnson, *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, [arXiv:2610.24371v1](https://arxiv.org/abs/2610.24371v1), printed page 14. For every positive nonincreasing log-convex function and every ordered even set of real points, it asks whether the distance-kernel Pfaffian dominates every perfect-matching product.

This is an all-order, all-kernel quantitative Pfaffian inequality. The source has already established positivity and the rainbow-matching bound for the larger class of convex kernels. Its historical motivation comes from collinear central configurations, but that nonvanishing problem is already settled by the source and is not claimed again here. The proposed advance is the uniform comparison with the largest matching product, and a structural matrix class for which every such comparison holds. The target was selected for this general matrix inequality, rather than for a bounded case or a numerical record.

## Proposed complete argument

`PROOF.md` establishes the all-matching inequality for arbitrary products of circular interval factors with parameters at least one and arbitrary positive vertex factors. The only imported theorem is Johnson's existing Proposition 4.2, the endpoint inequality for nonnegative additive interval matrices.

The new step is elementary but changes which pairs the imported inequality can remove. After a cyclic cut, replace every wrapped interval by its complement and absorb the difference into positive diagonal factors. The remaining ordinary interval product expands into a nonnegative additive interval matrix. Therefore the endpoint inequality applies to any cyclically adjacent pair. Every noncrossing matching can be removed one adjacent pair at a time. Uncrossing proves all matchings. Finally, nonnegative mixed differences of the normalized logarithm put every kernel in the original conjecture into the multiplicative interval class.

The written proof has passed independent mathematical reviews in `COMBINATORICS_REVIEW.md`, `ANALYSIS_REVIEW.md`, and `ROOT_REVIEW.md`. Johnson's already stated kernel uncrossing reduction is credited explicitly; the new factorwise argument extends it to the circular matrix class. The full current priority audit is tracked separately. This checkpoint does not declare the priority gate complete and is not an entry in the accepted result catalogue.

## Investigations that led to the proof

The initial exact diagnostics sampled 6,000 decreasing log-convex hinge kernels in orders six through twelve and found no obstruction. A more general interval-product diagnostic sampled 4,000 matrices in the same orders. These are finite observations, not evidence sufficient to prove the conjecture.

A full expansion in the twelve nontrivial interval variables at order six has 3,216 monomials and coefficientwise dominates every matching-product expansion. Selected variable families at order eight also passed. The resulting general coefficientwise assertion remains unproved here and is not required by `PROOF.md`.

Direct Schur-complement closure fails. On six vertices, let only the factor for the interval from vertex two through vertex four have value greater than one. Eliminating the first two vertices produces a four-by-four matrix that violates one of the multiplicative four-point inequalities. Thus entrywise growth of a Schur complement cannot justify the proposed induction. The final proof uses cyclic relabeling and diagonal scaling instead.

`verify.py` performs exact supplementary checks of the gauge identity, cyclic signs, interval coefficients, adjacent-pair conventions, and logarithmic reconstruction. Its output in `check-output.json` explicitly states that the finite checks do not prove the universal assertion.

## ArtificialZeng source extension

The pinned ArtificialZeng/AI-Has-Taste snapshot is `65eb1f5a92a3a8b80c9e92187825ac9231f86fb2`, with the full coverage and binary limits documented in [the retrospective audit](../2026-11-21-artificialzeng-priority/AUDIT.md).

For this new target, the additional expression `pfaff|2610[.]24371|wlpjohnson|kalmanson`, applied after Unicode NFKC normalization and case folding, produced zero hits across all 14,105 regular UTF-8 file bodies and all 472 converted PDF texts. The normalization includes typographic ligatures in PDF extraction, so spellings such as Pfaﬀian are searched as pfaffian. The saved report was regenerated after this correction. The compact report is `artificial-prior/matches.json`. This is a full-body search of those text sources, not a filename-only search. The two textless knight-tour figures, capped numeric gzip bodies, and other binary exclusions remain explicit in the referenced retrospective audit.

To repeat the target-specific pass after running the retrospective archive and PDF scanners:

```sh
python3 scan_artificial_prior.py --archive /path/to/artificialzeng.tar.gz --pdf-directory /path/to/supplement
```

The wider current-source and prior-resolution audit is being conducted independently. In particular, a mathematically valid consequence of an earlier theorem still requires a search for an earlier proof of this exact separately stated conjecture.
