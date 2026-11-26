# Hegyvári’s conjecture

**Screened.** Ranked. Rank 8 on the original main table, marker ⬜. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/README.md).

## Recorded scope

The source describes the result as follows.

> Proves strong completeness of the two-ray set across the remaining rational ratios that are not powers of two, with exact strong-completeness obstructions.

## Audit finding

The 2024 paper titled A conjecture of Hegyvári describes a partial result. Kohlmeyer–Kruer cover irrational ratios; the new argument is for the remaining rational ratios outside the powers of two. The repo explicitly assumes at least one parameter is nondyadic and uses the set of distinct positive floor values.

## Source outline

- [1. Exact statement and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L9).
- [2. What is taken from Kohlmeyer–Kruer](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L15).
- [Non-dyadic quotients](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L30).
- [3. The proof](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L44).
- [Case I: both reciprocal ratios are non-dyadic](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L46).
- [Case II: an odd integer ratio](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L52).
- [4. Distinct values and arbitrary finite deletions](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L66).
- [5. Strong-completeness converse](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md#L70).

## Provenance

- Path first added on the first-parent history on 2026-11-24T12:21:20Z. [Commit d7a796c0d](https://github.com/1337isnot1337/solved-conjectures/commit/d7a796c0d20e30d3fd743318ac688dee51496212).
- Latest change to this landing file at the snapshot on 2026-11-24T12:21:04Z. [Commit 6432592c0](https://github.com/1337isnot1337/solved-conjectures/commit/6432592c03b24aed190ed7b3204ed942a40a8da4).
- Coordination and prior review. [#446](https://github.com/1337isnot1337/solved-conjectures/issues/446).

The original record contains 3 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hegyvari-floor-doubling/PROOF.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2607.14071v6) (36 pages). Full text retrieved.
- [Source PDF](https://hexagonmath.org/pdf/2611.00768v1) (13 pages). problem 354 on PDF p. 1.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Norbert Hegyvári (1989-03-01). [Some remarks on a problem of Erdős and Graham](https://doi.org/10.1007/bf02170065).
- Steve Fan (2026-07-15). [Strongly complete sets and a conjecture of Erdős](https://doi.org/10.48550/arxiv.2607.14071).

- Strongly complete sets and a conjecture of Erd\H{o}s (HTTP 200). [Retrieved address](https://arxiv.org/abs/2607.14071v6).
- Completeness of two floor-doubling sequences (HTTP 200). [Retrieved address](https://hexagonmath.org/2611.00768v1).
- PDF header (HTTP 200). [Retrieved address](https://hexagonmath.org/pdf/2611.00768v1).
- Citation-index seed records. [Some remarks on a problem of Erdős and Graham](https://doi.org/10.1007/bf02170065) · [Strongly complete sets and a conjecture of Erdős](https://doi.org/10.48550/arxiv.2607.14071).
- Crossref query “Hegyvári’s conjecture hegyvari floor doubling” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.
