# Zhang's Question 8.5 for 18 ≤ n ≤ 57: shifted lonely runner counterexamples

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/README.md).

## Recorded scope

The source describes the result as follows.

> Lean verifies the 40 exact counterexamples to Zhang’s Question 8.5 for $18\le n\le57$. The range $58\le n\le94$ remains open.

## Audit finding

Prior papers already disprove the unrestricted shifted conjecture. This package adds explicitly scoped dimensions, certificates and a one-runner extension. Compare the velocity count, shift denominator and dimension range before attributing any individual case.

## Source outline

- [Question](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L5).
- [Statement](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L19).
- [The two verification methods (verify.py runs both)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L31).
- [Padding lemma (used to find the certificates for n = 37 and n = 38)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L36).
- [Relation to the literature](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L40).
- [How the certificates were found (heuristic; irrelevant to correctness)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L46).
- [Speeds other than 1..n: the speed-change annealer (used for 41 <= n <= 54)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L54).
- [n = 55, 56 and 57](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L65).
- [What did not work (all runs factual; E := 1/gamma − (n+1), needs E > 0)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L74).
- [Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md#L91).

## Provenance

- Path first added on the first-parent history on 2026-11-21T23:18:31-06:00. [Commit e24cae081](https://github.com/1337isnot1337/solved-conjectures/commit/e24cae081c0788dce49553cbb5439c49144ebd8c).
- Latest change to this landing file at the snapshot on 2026-11-26T11:34:18-06:00. [Commit 9212b75b5](https://github.com/1337isnot1337/solved-conjectures/commit/9212b75b59f5fabb173761eecdbfea84b5787421).
- Coordination and prior review. [#110](https://github.com/1337isnot1337/solved-conjectures/issues/110) · [#646](https://github.com/1337isnot1337/solved-conjectures/pull/646) · [#660](https://github.com/1337isnot1337/solved-conjectures/pull/660) · [#755](https://github.com/1337isnot1337/solved-conjectures/pull/755).

The original record contains 70 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/FORMALIZATION.md) · [FROZEN_EXTENSION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/FROZEN_EXTENSION.md) · [REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/REVIEW.md) · [NOTES.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/search/NOTES.md) · [README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/shifted-lonely-runner-counterexamples/search/README.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2608.13599) (21 pages). question 8.5 on PDF p. 18, 19.
- [Source PDF](https://arxiv.org/pdf/2603.24784) (41 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Yuhan Zhang (2026-08-01). [Tight instances of the Lonely Runner Conjecture: one-entry modifications and the growth of speeds](https://doi.org/10.48550/arxiv.2608.13599).
- Daria Poliakova (2026-09-20). [More (shifted) runners, less loneliness](https://doi.org/10.48550/arxiv.2609.23952).

- aadrianvv · GitHub (HTTP 200). [Retrieved address](https://github.com/aadrianvv).
- tomdif (Thomas DiFiore) · GitHub (HTTP 200). [Retrieved address](https://github.com/tomdif).
- Tight instances of the Lonely Runner Conjecture: one-entry modifications and the growth of speeds (HTTP 200). [Retrieved address](https://arxiv.org/abs/2608.13599).
- Citation-index seed records. [Tight instances of the Lonely Runner Conjecture: one-entry modifications and the growth of speeds](https://doi.org/10.48550/arxiv.2608.13599) · [More (shifted) runners, less loneliness](https://doi.org/10.48550/arxiv.2609.23952).
- Crossref query “Zhang's Question 8.5 for 18 ≤ n ≤ 57: shifted lonely runner counterexamples” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Verify the forty shifted lonely-runner certificates — exit 0. [Command and output](../evidence/replays/111.txt).
- Verify the fixed-seed one-runner extension — exit 0. [Command and output](../evidence/replays/112.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
