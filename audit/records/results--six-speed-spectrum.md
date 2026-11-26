# Six-speed Loneliness Spectrum Conjecture

**Screened.** Ranked. Rank 158 on the original main table, marker 🟢. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/README.md).

## Recorded scope

The source describes the result as follows.

> The values below 1/6 are exactly (P−1)/(6P) for P ≥ 7 congruent to ±1 modulo 6. Cordella’s nine sporadic sextuples exhaust the exceptions to the three known families. Lean verifies realization of every proposed value by six distinct positive primitive speeds; actual rational-lattice, Gram and integer-factor components are proved, and the registered norm wrappers use the proved four-speed bound and retain `hplane`. Universal classification remains incomplete. Lean also proves the conditional two-parameter radius estimate; the finite plane enumeration remains incomplete.

## Audit finding

The computational proof has several independent stages. A previous successful GitHub-hosted run used the same result directory and modular-sieve source as the audited tree. Its log confirms four prime-product bounds (145 primes), 15 three-parameter covers, 78 noncritical maps and nine sporadic values. The degree of partial Lean coverage remains as stated on the landing page. [Hosted replay](https://github.com/1337isnot1337/solved-conjectures/actions/runs/45822175370/job/139916962874).

## Source outline

- [A gap for planes and bounds for integer directions](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/PROOF.md#L32).
- [Finite-field certificates](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/PROOF.md#L65).
- [From six to four parameters](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/PROOF.md#L73).
- [From three parameters to the finite list](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/PROOF.md#L88).
- [Reproduction and status](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/PROOF.md#L104).

## Provenance

- Path first added on the first-parent history on 2026-11-18T18:47:28-06:00. [Commit 56b5895f5](https://github.com/1337isnot1337/solved-conjectures/commit/56b5895f522ed30bd92b8e629a9326db672f73fc).
- Latest change to this landing file at the snapshot on 2026-11-19T14:29:31-06:00. [Commit 4076592d2](https://github.com/1337isnot1337/solved-conjectures/commit/4076592d21b4bf77ee050803fe1d99c74d1f6568).

The original record contains 8 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/six-speed-spectrum/PROOF.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2609.03444v2) (18 pages). conjecture 6.2 on PDF p. 3, 14 · question 6.6 on PDF p. 16, 17.
- [Source PDF](https://arxiv.org/pdf/2609.02604) (15 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- F. Cordella (2026-09-03). [Odd denominators in the Lonely Runner spectrum for six speeds](https://doi.org/10.48550/arxiv.2609.03444).
- Jaan Allikvere (2026-09-02). [Fourteen and fifteen lonely runners](https://doi.org/10.48550/arxiv.2609.02604).
- Hyunjun Yi, Karam Gill, Bryan Bu (2026-10-28). [Four runners that are barely lonely](https://doi.org/10.48550/arxiv.2610.40694).

- Odd denominators in the Lonely Runner spectrum for six speeds (HTTP 200). [Retrieved address](https://arxiv.org/abs/2609.03444v2).
- Amending the Lonely Runner Spectrum Conjecture (HTTP 200). [Retrieved address](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v33i1p38).
- Source URL (HTTP 202). [Retrieved address](https://escholarship.org/uc/item/3mx8w3js).
- Citation-index seed records. [Odd denominators in the Lonely Runner spectrum for six speeds](https://doi.org/10.48550/arxiv.2609.03444) · [Fourteen and fifteen lonely runners](https://doi.org/10.48550/arxiv.2609.02604) · [Four runners that are barely lonely](https://doi.org/10.48550/arxiv.2610.40694).
- Crossref query “Six-speed Loneliness Spectrum Conjecture six speed spectrum” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Verify the six-speed loneliness spectrum — exit 0. [Command and output](../evidence/replays/105.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
