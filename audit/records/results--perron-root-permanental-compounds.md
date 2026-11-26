# Perron root of permanental compounds

**Screened.** Ranked. Rank 4 on the original main table, marker ⬜. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/README.md).

## Recorded scope

The source describes the result as follows.

> A general FPRAS for every nonnegative rational input and every compound degree, with deterministic zero detection. This answers the randomized approximation formulation of Minc Problem 18; exact polynomial-time eigenvalue computation and the characteristic-polynomial problem are not claimed. The proof is unrefereed and priority remains provisional.

## Source outline

- [Status and exact scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L3).
- [Theorem](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L13).
- [1. The stable transfer operator](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L27).
- [2. A uniform bound for the sum of traces](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L56).
- [Lower bound](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L74).
- [Upper bound](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L124).
- [3. Log-concavity across compound degrees](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L136).
- [4. Separating one degree with a positive parameter](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L172).
- [5. Realizing Z_t(s) as one ordinary permanent](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L217).
- [Bit complexity](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L336).
- [8. Verification and limitations](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L342).
- [References and attribution of inputs](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md#L352).

The ledger includes the intervening sections.

## Provenance

- Path first added on the first-parent history on 2026-11-20T17:44:46-06:00. [Commit 559ca8662](https://github.com/1337isnot1337/solved-conjectures/commit/559ca8662d20e85c064f24b89fe45a4c8d808c63).
- Latest change to this landing file at the snapshot on 2026-11-20T17:54:04-06:00. [Commit 4a0b9f3f0](https://github.com/1337isnot1337/solved-conjectures/commit/4a0b9f3f0e4116f61a47fe0532157372f9c813bf).
- Coordination and prior review. [#139](https://github.com/1337isnot1337/solved-conjectures/issues/139) · [#140](https://github.com/1337isnot1337/solved-conjectures/issues/140).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/README.md) · [proof.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/proof.md) · [priority-audit-addendum.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/priority-audit-addendum.md) · [review-inequalities.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/review-inequalities.md) · [review-sign-matrices.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/review-sign-matrices.md) · [source-audit.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/perron-root-permanental-compounds/source-audit.md)

## Literature checks

- [Source PDF](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf) (29 pages). conjecture 17 on PDF p. 13 · conjecture 18 on PDF p. 13 · problem 17 on PDF p. 25 · problem 18 on PDF p. 25.
- [Source PDF](https://arxiv.org/pdf/0711.3496) (31 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Mark Jerrum, Alistair Sinclair, Eric Vigoda (2001-07-06). [A polynomial-time approximation algorithm for the permanent of a matrix with non-negative entries](https://doi.org/10.1145/1008731.1008738).
- Jonathan Leake, Nick Ryder (2019-10-08). [Generalizations of the Matching Polynomial to the Multivariate Independence Polynomial](https://doi.org/10.5802/alco.63).
- Thierry Huillet (2007-07-19). [Occupancy statistics arising from weighted particle rearrangements](https://doi.org/10.1088/1751-8113/40/31/001).
- Dongsheng Wei (2026-09-13). [Generators of stability-preserving semigroups, spectral gaps, and classical ground-state computation](https://doi.org/10.48550/arxiv.2609.26802).
- Weiqi Jiang (2026-08-23). [Discrete Concavity of Token-Graph Spectral Radii via Lorentzian Semigroups](https://doi.org/10.48550/arxiv.2609.25037).

- Problem 18: Perron root of permanental compounds – Yair Lavi (HTTP 200). [Retrieved address](https://yair-lavi.com/mincs-list/problem-18/index.html).
- PDF header (HTTP 200). [Retrieved address](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf).
- Van der Waerden/Schrijver-Valiant like Conjectures and Stable (aka Hyperbolic) Homogeneous Polynomials : One Theorem for all (HTTP 200). [Retrieved address](https://arxiv.org/abs/0711.3496).
- Citation-index seed records. [A polynomial-time approximation algorithm for the permanent of a matrix with non-negative entries](https://doi.org/10.1145/1008731.1008738) · [Generalizations of the Matching Polynomial to the Multivariate Independence Polynomial](https://doi.org/10.5802/alco.63) · [Occupancy statistics arising from weighted particle rearrangements](https://doi.org/10.1088/1751-8113/40/31/001) · [Generators of stability-preserving semigroups, spectral gaps, and classical ground-state computation](https://doi.org/10.48550/arxiv.2609.26802) · [Discrete Concavity of Token-Graph Spectral Radii via Lorentzian Semigroups](https://doi.org/10.48550/arxiv.2609.25037).
- External solution records sharing a cited identifier. [Problems/wong-bravyi-gosset-liu-2026-conjecture-2-phase-shifted-extension.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/wong-bravyi-gosset-liu-2026-conjecture-2-phase-shifted-extension.md) · [Problems/reyes-dalfo-fiol-2024-new-laplacian-layer-maxima.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/reyes-dalfo-fiol-2024-new-laplacian-layer-maxima.md) · [Problems/apte-parekh-sud-2025-token-graph-cut-bound.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/apte-parekh-sud-2025-token-graph-cut-bound.md).
- Crossref query “Perron root of permanental compounds perron root permanental compounds” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check permanental-compound trace and support identities — exit 0. [Command and output](../evidence/replays/053.txt).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
