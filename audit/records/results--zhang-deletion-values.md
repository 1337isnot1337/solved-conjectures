# Zhang's Question 8.4: deletion values of the lonely runner

**Screened.** Ranked. Rank 162 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/README.md).

## Recorded scope

The source describes the result as follows.

> For `n >= 3`, `1 <= r <= n-1`, and `V = [n-1] \ {r}`, `LR(V) = 1/r` when `2r > n-1`, and `LR(V) = 2/D_r` when `2r <= n-1`, where `D_r` is the least integer at least `n+r` coprime to `r`. In particular the strict inequality holds for all `n >= 4` and `1 <= r <= n-2`. **Contributed by @aadrianvv.**

## Source outline

- [Statement](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/PROOF.md#L5).
- [Proof](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/PROOF.md#L30).
- [Remarks](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/PROOF.md#L50).
- [Verification](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/PROOF.md#L56).
- [Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/PROOF.md#L64).

## Provenance

- Path first added on the first-parent history on 2026-11-20T20:54:08-06:00. [Commit 99542221a](https://github.com/1337isnot1337/solved-conjectures/commit/99542221a85290fd62754efc8e392708d94bab20).
- Latest change to this landing file at the snapshot on 2026-11-26T05:43:00-06:00. [Commit b9e6bd570](https://github.com/1337isnot1337/solved-conjectures/commit/b9e6bd5707adcecd84859c1a69b2d7e113140113).
- Coordination and prior review. [#130](https://github.com/1337isnot1337/solved-conjectures/issues/130) · [#143](https://github.com/1337isnot1337/solved-conjectures/pull/143).

The original record contains 5 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/zhang-deletion-values/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2608.13599) (21 pages). question 8.4 on PDF p. 18.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Yuhan Zhang (2026-08-01). [Tight instances of the Lonely Runner Conjecture: one-entry modifications and the growth of speeds](https://doi.org/10.48550/arxiv.2608.13599).

- aadrianvv · GitHub (HTTP 200). [Retrieved address](https://github.com/aadrianvv).
- Tight instances of the Lonely Runner Conjecture: one-entry modifications and the growth of speeds (HTTP 200). [Retrieved address](https://arxiv.org/abs/2608.13599).
- Citation-index seed records. [Tight instances of the Lonely Runner Conjecture: one-entry modifications and the growth of speeds](https://doi.org/10.48550/arxiv.2608.13599).
- Crossref query “Zhang's Question 8.4: deletion values of the lonely runner” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Verify Zhang's lonely-runner deletion values — exit 0. [Command and output](../evidence/replays/110.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
