# Gyárfás’s planar degree-repetition problem

**Screened.** Ranked. Rank 55 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/README.md).

## Recorded scope

The source describes the result as follows.

> For every order at least 16, gives a noncollinear rational planar point set in which each number of incident spanned lines occurs at most twice. Two is optimal.

## Source outline

- [Construction](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/PROOF.md#L7).
- [Degrees on the axis](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/PROOF.md#L31).
- [Degrees off the axis](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/PROOF.md#L41).

## Provenance

- Path first added on the first-parent history on 2026-11-26T03:30:10-06:00. [Commit 43152d525](https://github.com/1337isnot1337/solved-conjectures/commit/43152d525a05947dff68a735c5298ac8a8a3dfae).
- Latest change to this landing file at the snapshot on 2026-11-26T04:20:02-06:00. [Commit 4ab337ada](https://github.com/1337isnot1337/solved-conjectures/commit/4ab337ada1436b127c8cffb0cf0ec53ec418fcd9).
- Coordination and prior review. [#156](https://github.com/1337isnot1337/solved-conjectures/issues/156) · [#785](https://github.com/1337isnot1337/solved-conjectures/issues/785).

The original record contains 7 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-planar-degree-repetition/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf) (7 pages). problem 2 on PDF p. 5 · problem 3 on PDF p. 5 · problem 4 on PDF p. 5.
- [Source PDF](https://arxiv.org/pdf/1208.4714) (72 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf).
- Publications 2000— 2009 (HTTP 200). [Retrieved address](https://www.renyi.hu/~gyarfas/index_files/publications_2000_2009.htm).
- On sets defining few ordinary lines (HTTP 200). [Retrieved address](https://arxiv.org/abs/1208.4714).
- Crossref query “Gyárfás’s planar degree-repetition problem gyarfas planar degree repetition” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

Rebuilt the complete local import closure of `Conjectures.GyarfasPlanarWitness` (3 modules) and replayed each compiled module in the stock kernel. All 13 named endpoints passed the axiom check. [Exact scope, source digests, commands and outputs](../evidence/lean-replays/small-closures.json).

- Count the incident lines in the Gyárfás planar construction — exit 0. [Command and output](../evidence/replays/018.txt).

2 of 2 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
