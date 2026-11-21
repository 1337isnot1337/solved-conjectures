# Chen–Kitaev–Zhang source and priority audit

Checked on 21 November 2026. This records searched evidence and limits, not a certificate of worldwide priority.

## Original targets

- Joanna N. Chen, Sergey Kitaev and Philip B. Zhang, *Distributions of statistics on separable permutations*, Discrete Applied Mathematics 355 (2024), 169–179, DOI [10.1016/j.dam.2024.05.004](https://doi.org/10.1016/j.dam.2024.05.004).
- [arXiv:2404.18517v1 full text](https://arxiv.org/html/2404.18517v1), submitted 29 April 2024. Read definitions in Section 1, the single-statistic generating functions and class table in Theorem 5, and all three conjectures in Section 3. Conjecture 1 is the complete mode-two assertion for all four unrestricted record statistics at every length at least three. Conjecture 3 is the complete mode-one assertion for the indicated reducible/irreducible classes at every positive length.
- [Author-hosted manuscript](https://zhangbiaomath.github.io/papers/2024-dam-separable-perms.pdf). The definitions and concluding Conjectures 1–3 agree with the arXiv statement inspected. This is a nineteen-page author manuscript; it is not represented as the eleven-page publisher typesetting.
- [Strathclyde institutional record](https://strathprints.strath.ac.uk/89387/) and [publication record](https://pureportal.strath.ac.uk/en/publications/distributions-of-statistics-on-separable-permutations/) confirm journal metadata and link the submitted manuscript.
- [Publisher record](https://www.sciencedirect.com/science/article/pii/S0166218X24001860). Its exposed text identifies the same record-statistic project and concluding conjectures. The complete publisher version-of-record body was not independently retrieved.

The numbering refers to the original source's distinct conjectures, not to fixed-length cases. All counts use strict records, positive permutations avoiding both 2413 and 3142, and direct-sum indecomposability. The empty and singleton conventions are retained.

## Prior resolution that must be credited

Conjecture 2 is already publicly proved by the trureturing project. It cannot be counted as a new resolution in this campaign.

- [Public problem dossier](https://www.trureturing.org/research/chenkitaevzhang-2024-separable-record-peak-three/).
- [Exact mathematical summary at commit bba1aad31d92f0ac31774c3a7e7c04a3db945c56](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/Blueprint/D5/S1/Words/Patterns/Separable/RecordAllIndex.md).
- [Exact all-index proof source](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/D5/S1/Words/Patterns/Separable/RecordAllIndex.lean).
- [Exact Newton-kernel proof source](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/D5/S1/Words/Patterns/Separable/RecordNewtonPositivity.lean).
- [Newton-kernel mathematical summary](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/Blueprint/D5/S1/Words/Patterns/Separable/RecordNewtonPositivity.md).
- [First declining comparison](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/Blueprint/D5/S1/Words/Patterns/Separable/RecordFirstDecline.md).
- [Complete ordinary-mathematics theory manuscript](https://github.com/the-omega-institute/trureturing-source-theories/blob/2a39da5107abbfa3a72cc883486dbc15a15994a1/docs/develop/theory/SEPARABLE_SIGNED_RECORD_WEIGHTS.md), Sections 1–8. The same content was last edited in the original repository at [commit 981ea68934acbc79c9b83e0b82046977c2bbd08c](https://github.com/the-omega-institute/trureturing/blob/981ea68934acbc79c9b83e0b82046977c2bbd08c/docs/develop/theory/SEPARABLE_SIGNED_RECORD_WEIGHTS.md) on 30 October 2026. It moved repositories on 19 November. The recovered October file and current file have the identical Git blob SHA `5d7a8103aa62a6db00d9f2d74c4881fcb2da9f74`.

The exact source files were read for their mathematics. No Lean installation, compilation, or formalization was performed. The present proof reconstructs the Motzkin recurrence, the sixteen positivity certificates, the propagation argument, and the binomial transform in ordinary mathematics and exact Python. These are reused prior work and are explicitly attributed, regardless of whether the previous project's formal-publication audit was complete.

The older [external issue 12664](https://github.com/the-omega-institute/trureturing/issues/12664) contains a stale partial-stage description. Its body alone cannot override the later explicit full theorem source. The theory manuscript initially returned 404 at its old live location; inspection of its commit history found the move and recovered the complete document. It was then read in full.

The recovered manuscript's Theorem 4.1 proves the irreducible-right-maxima comparison from two records to three. Theorem 6.2 proves the decline from three records to four in the four Conjecture 2 classes. Theorems 7.2 and 8.2 prove kernel positivity and identify every tail difference. Theorem 8.3 states the complete Conjecture 2 conclusion. None of these theorems gives the unrestricted comparison from one to two, the unrestricted comparison from two to three in the opposite direction, or the Conjecture 3 comparison from one to two. Its series called `q` is the present `R`; its series called `U` is the present `F`; its series called `R` is the present reducible series `H-tz`. Accounting for this different notation is necessary when checking whether a result is already present.

## Checks for an earlier Conjecture 1 or 3 resolution

Both web search engines were used for the exact article title; the full author list; hyphenated and Unicode forms of Chen–Kitaev–Zhang; separable record unimodality; peak one, peak two, and peak three; Conjecture 1 and Conjecture 3; and proof, proved, counterexample, and resolution variants. The search was repeated after the mathematical derivation.

The relevant additional records inspected were:

- [External Conjecture 1 issue 20489](https://github.com/the-omega-institute/trureturing/issues/20489). It is a preregistration of the complete mode-two statement. The live API returned no comments; the inspected issue body contains no proof or counterexample. It is evidence of another research attempt, not of a resolution and not of exclusive ownership.
- Searches of the external repository's issues for CKZ, separable records, Conjecture 1, and Conjecture 3. The substantive completed result located was Conjecture 2. The inspected `RecordAllIndex`, `RecordNewtonPositivity`, `RecordFirstDecline`, `RecordPeak`, and full signed-record theory files do not state the present Conjecture 1 or 3 conclusions or the three low-record recurrence reductions. Code searches in the moved source-theories repository combining separable with Conjecture 1 or Conjecture 3 returned respectively two unrelated files and no files. A search of the original separable-pattern code directory for record and peak located the same five prior C2 proof modules.
- [Philip B. Zhang's current bibliography](https://zhangbiaomath.github.io/research), which still links the original paper. The inspected bibliography did not list a follow-up settling these record conjectures.
- [MathDB's mode-two record entry](https://mathdb.com/p/362890/unimodality-conjecture-for-statistics-on-separable-permutati), which still lists the statement as open. This is a discovery aid only: its record says it has never been refreshed, so it is not decisive status evidence.
- Fu, Lin and Zeng, [*On two unimodal descent polynomials*](https://doi.org/10.1016/j.disc.2018.06.010), and the [current SymCat permutation-statistics page](https://www.symmetricfunctions.com/realRootedWords.htm). The separable descent polynomial and its real-rootedness concern a different statistic. A new proof of that already-addressed question is not being claimed here.

No earlier full Conjecture 1 or Conjecture 3 proof was located in this inspected scope. In particular, the prior Conjecture 2 theorem gives the tail from three records, while the present low-record reductions establish the additional comparisons required for the two remaining conjectures. This is a substantive deduction from credited prior work, rather than a relabeling of the identical earlier theorem.

## What remains uncertain

The complete publisher body, all citing bodies, and unpublished communications have not been exhaustively checked. A later discovery of an equivalent earlier argument must change the priority description and campaign count. An independent campaign agent has checked the generating functions, transports, sixteen exact certificates, universal identity, and symbolic low-record reductions; external mathematical review remains open. The correct current label is “complete proposed proof, internally audited, no earlier resolution located in the searched sources,” not an unconditional exclusive-priority claim.

## Campaign accounting

Conjecture 2 adds zero new resolutions. Conjectures 1 and 3 are two distinct fully quantified source statements proved together. Whether the collection counts them as two conjectures or one named research package is an editorial decision; they must not be split further by statistic or length. The repository records these two assertions together as one named result package.
