# Caiolo–Ferroni–Hoster conjecture

**Screened.** Ranked. Rank 13 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/README.md).

## Recorded scope

The source describes the result as follows.

> Complete proposed disproof of CFH Conjecture 7.3 and its augmented extension: simple rank-five matroids for every prime power q ≥ 17 have a dual Chow polynomial with no real roots and an augmented dual Chow polynomial with only one simple real root.

## Audit finding

The rank-five matroid family, the associated dual Chow polynomial and the augmented variant are the recorded targets. Hoster–Stump on simplicial posets is a different statement. The rank threshold supplement is distinct from the first counterexample.

## Source outline

- [Theorem](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/PROOF.md#L5).
- [Construction and matroid verification](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/PROOF.md#L11).
- [Exact flag enumeration](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/PROOF.md#L29).
- [Dual gamma-polynomial certificate](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/PROOF.md#L61).
- [Literature and priority](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/PROOF.md#L103).
- [Replay](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/PROOF.md#L112).

## Provenance

- Path first added on the first-parent history on 2026-11-24T07:32:56Z. [Commit 0879f31bf](https://github.com/1337isnot1337/solved-conjectures/commit/0879f31bffcd94bb9c814cf79df558d5271b95e4).
- Latest change to this landing file at the snapshot on 2026-11-24T15:43:48-08:00. [Commit cb2f3ab96](https://github.com/1337isnot1337/solved-conjectures/commit/cb2f3ab96c2c48738ece6e404e2c5577e5df0ad8).
- Coordination and prior review. [#111](https://github.com/1337isnot1337/solved-conjectures/issues/111) · [#560](https://github.com/1337isnot1337/solved-conjectures/issues/560) · [#597](https://github.com/1337isnot1337/solved-conjectures/pull/597).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/PROOF.md) · [LEAN_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/LEAN_REVIEW.md) · [RANKS.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/caiolo-ferroni-hoster/RANKS.md)

## Literature checks

- Dual Chow polynomials of matroids and posets (HTTP 200). [Retrieved address](https://arxiv.org/abs/2605.28474v1).
- Chow polynomials and chain polynomials of matroids are not log-concave (HTTP 200). [Retrieved address](https://arxiv.org/abs/2610.17135v1).
- Real-rooted polynomials: open problems \| SymCat (HTTP 200). [Retrieved address](https://www.symmetricfunctions.com/realRootedOpenProblems.htm).
- Citation-index seed records. [Dual Chow polynomials of matroids and posets](https://doi.org/10.48550/arxiv.2605.28474) · [Chow polynomials and chain polynomials of matroids are not log-concave](https://doi.org/10.48550/arxiv.2610.17135).
- External solution records sharing a cited identifier. [Problems/hoster-stump-2025-chow-polynomials-simplicial-posets.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/hoster-stump-2025-chow-polynomials-simplicial-posets.md).
- Crossref query “Caiolo–Ferroni–Hoster conjecture caiolo ferroni hoster” returned 0 displayed records (HTTP 0).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Replay dual Chow and symmetric edge polytope counterexamples — exit 0. [Command and output](../evidence/replays/061.txt).
