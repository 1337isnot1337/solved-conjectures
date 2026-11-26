# Kauers–Koutschan recurrence conjecture

**Screened.** Ranked. Rank 128 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/README.md).

## Recorded scope

The source describes the result as follows.

> A Schur-character formula for signed adjacency blocks proves the specified order-eight and order-thirteen recurrences for all permutation lengths.

## Source outline

- [1. Inclusion–exclusion on two chains](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/PROOF.md#L5).
- [2. A Schur moment](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/PROOF.md#L20).
- [3. Extracting the count](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/PROOF.md#L54).
- [4. A two-step recurrence for the full sum](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/PROOF.md#L71).
- [5. Exact substitution into the conjectured operators](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/PROOF.md#L92).

## Provenance

- Path first added on the first-parent history on 2026-11-21T09:58:56-06:00. [Commit 86920639a](https://github.com/1337isnot1337/solved-conjectures/commit/86920639aca25ddfadde09de1af7dd0b9b9a67e3).
- Latest change to this landing file at the snapshot on 2026-11-25T18:14:46-06:00. [Commit 79bed2721](https://github.com/1337isnot1337/solved-conjectures/commit/79bed272124870b8ef33a4e750170c78d9fbaa16).
- Coordination and prior review. [#218](https://github.com/1337isnot1337/solved-conjectures/issues/218) · [#281](https://github.com/1337isnot1337/solved-conjectures/pull/281).

The original record contains 16 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kauers-koutschan-recurrence/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2202.07966) (8 pages). conjecture 10 on PDF p. 7.
- [Source PDF](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimPDF/perms.pdf) (14 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Jaideep Sai Padhi (2026-08-11). [Solutions to Five Challenge Problems in Enumerative and Algorithmic Combinatorics, with an Account of the Human-Machine Methodology Employed](https://doi.org/10.48550/arxiv.2608.11290).

- Guessing with Little Data (HTTP 200). [Retrieved address](https://arxiv.org/abs/2202.07966).
- PDF header (HTTP 200). [Retrieved address](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimPDF/perms.pdf).
- A189281 - OEIS (HTTP 200). [Retrieved address](https://oeis.org/A189281).
- Citation-index seed records. [Solutions to Five Challenge Problems in Enumerative and Algorithmic Combinatorics, with an Account of the Human-Machine Methodology Employed](https://doi.org/10.48550/arxiv.2608.11290).
- Crossref query “Kauers–Koutschan recurrence conjecture kauers koutschan recurrence” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

Independently compiled Conjectures.KauersKoutschanCertificate from the frozen source, checked its printed axiom reports and ran stock leanchecker. [Exact commands, module scope, outputs and exit status](../evidence/lean-replays/receipts.json).

- Check the Kauers–Koutschan recurrence — exit 0. [Command and output](../evidence/replays/064.txt).

9 of 11 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
