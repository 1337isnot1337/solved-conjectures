# González D’León–Wachs’s complete-graph specialization question

**Earlier public resolution.** Ranked. Rank 96 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gonzalez-dleon-wachs-complete-graphs/README.md).

## Recorded scope

The source describes the result as follows.

> Gives an exact Laguerre product and Gamma-moment formula, strict ordinary coefficient log-concavity, and the real-zero count for equal variables.

## Audit finding

Earlier exact answer. The Omega Institute merged its proof on November 23 at 19:39:18 UTC. The repository opened its discovery issue November 24 at 14:02:41 UTC. In the coefficient extraction, Omega’s P_r(z) equals L_{r−2}^{(1)}(−z)/(r−1) coefficient by coefficient. Both use degree n−k for k blocks, and allow every r>2. Direct weighted-poset Möbius inversion agrees for n=1..4 and r=3,4. The Gamma-moment representation, coefficient inequalities and zero count are preserved as a supplement.

[Earlier resolution](https://github.com/the-omega-institute/trureturing/pull/33676). [Correction on main](https://github.com/1337isnot1337/solved-conjectures/pull/891).

## Source outline

- [1. The Laguerre product](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gonzalez-dleon-wachs-complete-graphs/PROOF.md#L18).
- [2. Strict log-concavity and real zeros](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gonzalez-dleon-wachs-complete-graphs/PROOF.md#L53).

## Provenance

- Path first added on the first-parent history on 2026-11-24T14:12:23Z. [Commit 9415898e8](https://github.com/1337isnot1337/solved-conjectures/commit/9415898e8c7dfa9681946b8a94a83ba678de3b00).
- Latest change to this landing file at the snapshot on 2026-11-25T20:33:34Z. [Commit 6621e8953](https://github.com/1337isnot1337/solved-conjectures/commit/6621e8953cdab69c204d9842f1ebbd5e0a2fdaac).
- Coordination and prior review. [#482](https://github.com/1337isnot1337/solved-conjectures/issues/482).

The original record contains 26 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gonzalez-dleon-wachs-complete-graphs/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gonzalez-dleon-wachs-complete-graphs/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gonzalez-dleon-wachs-complete-graphs/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gonzalez-dleon-wachs-complete-graphs/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2608.08692v2) (59 pages). question 7.1 on PDF p. 55 · conjecture 7.3 on PDF p. 56, 57.
- [Source PDF](https://arxiv.org/pdf/1309.5527) (50 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Rafael S. González D’León, Michelle L. Wachs (2026-08-09). [Weighted bond posets and a new chromatic symmetric function](https://doi.org/10.48550/arxiv.2608.08692).

- Weighted bond posets and a new chromatic symmetric function (HTTP 200). [Retrieved address](https://arxiv.org/abs/2608.08692v2).
- On the (co)homology of the poset of weighted partitions (HTTP 200). [Retrieved address](https://arxiv.org/abs/1309.5527).
- DLMF: §18.2 General Orthogonal Polynomials ‣ General Orthogonal Polynomials ‣ Chapter 18 Orthogonal Polynomials (HTTP 200). [Retrieved address](https://dlmf.nist.gov/18.2.vi).
- Citation-index seed records. [Weighted bond posets and a new chromatic symmetric function](https://doi.org/10.48550/arxiv.2608.08692).
- External solution records sharing a cited identifier. [Problems/gonzalez-dleon-wachs-question-7-1.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/gonzalez-dleon-wachs-question-7-1.md) · [Problems/gonzalez-dleon-wachs-conjecture-4-13-2-refutation.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/gonzalez-dleon-wachs-conjecture-4-13-2-refutation.md).
- Crossref query “González D’León–Wachs’s complete-graph specialization question gonzalez dleon wachs complete graphs” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 2 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- results/gonzalez-dleon-wachs-complete-graphs/check_complete.py — exit 0. [Command and output](../evidence/replays/204.txt).

7 of 7 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
