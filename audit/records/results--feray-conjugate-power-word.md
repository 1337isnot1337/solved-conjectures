# Féray’s conjugate-power word-measure conjectures

**Screened.** Ranked. Rank 8 on the original main table, marker ⬜. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/README.md).

## Recorded scope

The source describes the result as follows.

> Proves both cycle limits and total-variation mixing for the stated permutation word, with sharp distance asymptotic e⁻¹/(n−1).

## Audit finding

Conjugating the second power by an independent uniform permutation gives a uniform conjugacy class law conditional on the type of the first permutation. The conditional law is constant for every representative, which establishes the independence step used by Plancherel. Direct joint counts over every ordered pair in S5 squared reproduced exact factorization for three pairs of positive and negative exponents. The asymptotic rate additionally uses the cited character and zeta estimates.

## Source outline

- [1. Conditional independence](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/PROOF.md#L10).
- [2. Mixing two classes with few cycles](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/PROOF.md#L22).
- [3. Averaging the cycle type](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/PROOF.md#L53).
- [Scope and relation to earlier work](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/PROOF.md#L67).

## Provenance

- Path first added on the first-parent history on 2026-11-24T15:13:33Z. [Commit 199c6a7f6](https://github.com/1337isnot1337/solved-conjectures/commit/199c6a7f6c7423d7c83d1397f2657b593b0506c7).
- Latest change to this landing file at the snapshot on 2026-11-24T15:12:46Z. [Commit 04d615ed8](https://github.com/1337isnot1337/solved-conjectures/commit/04d615ed8a4d64e96ea0540d914038014e9b787f).
- Coordination and prior review. [#493](https://github.com/1337isnot1337/solved-conjectures/issues/493).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/PROOF.md) · [SHARP-RATE.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/feray-conjugate-power-word/SHARP-RATE.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2411.04347v4) (50 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/2009.00897) (53 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Michael D. Larsen, Aner Shalev (2008-07-30). [Characters of symmetric groups: sharp bounds and applications](https://doi.org/10.1007/s00222-008-0145-7).
- Martin W. Liebeck, Aner Shalev (2004-12-16). [Character degrees and random walks in finite groups of Lie type](https://doi.org/10.1112/s0024611504014935).
- Lucas Teyssier, Paul Thévenin (2024-11-07). [Characters of symmetric groups: sharp bounds on virtual degrees and the Witten zeta function](https://doi.org/10.48550/arxiv.2411.04347).

- PDF header (HTTP 200). [Retrieved address](https://ems.press/content/serial-article-files/53596?nt=1).
- Characters of symmetric groups: sharp bounds on virtual degrees and the Witten zeta function (HTTP 200). [Retrieved address](https://arxiv.org/abs/2411.04347v4).
- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1007/s00222-008-0145-7).
- Citation-index seed records. [Characters of symmetric groups: sharp bounds and applications](https://doi.org/10.1007/s00222-008-0145-7) · [Character degrees and random walks in finite groups of Lie type](https://doi.org/10.1112/s0024611504014935) · [Characters of symmetric groups: sharp bounds on virtual degrees and the Witten zeta function](https://doi.org/10.48550/arxiv.2411.04347).
- Crossref query “Féray’s conjugate-power word-measure conjectures feray conjugate power word” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

[Independent finite comparison](../evidence/check_proof_steps.py).

The computational runs in this audit do not include a separate executable check for this entry.
