# The Steiner triple system sail problem

**Screened.** Ranked. Rank 26 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/README.md).

## Recorded scope

The source describes the result as follows.

> Every two-coloring of the blocks of any sufficiently large Steiner triple system has a positive fraction of monochromatic sails, including a linear number of disjoint sails of one color.

## Source outline

- [Count the spokes at each point](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/PROOF.md#L11).
- [Opposite-colored blocks force an odd spoke count](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/PROOF.md#L32).
- [Combine the counts](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/PROOF.md#L42).
- [Vertex-disjoint monochromatic sails](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/PROOF.md#L51).

## Provenance

- Path first added on the first-parent history on 2026-11-26T06:00:57-06:00. [Commit 550d7b930](https://github.com/1337isnot1337/solved-conjectures/commit/550d7b9303db37eccd2f22582a8c7383d94d65ab).
- Latest change to this landing file at the snapshot on 2026-11-26T07:23:42-06:00. [Commit 296b835f1](https://github.com/1337isnot1337/solved-conjectures/commit/296b835f1edb25aca63924a0a5ad7ca261d248eb).
- Coordination and prior review. [#813](https://github.com/1337isnot1337/solved-conjectures/issues/813).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steiner-triple-system-sail/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://users.renyi.hu/~gyarfas/Cikkek/182_jcd1.pdf) (10 pages). Full text retrieved.
- [Source PDF](https://real.mtak.hu/162708/1/ejc40.pdf) (9 pages). question 2.8 on PDF p. 6.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Elliot Granath, András Gyárfás, Jerry Hardee, Trent Watson et al. (2017-09-14). [Ramsey theory on Steiner triples](https://doi.org/10.1002/jcd.21585).
- Zoltán Füredi, András Gyárfás (2017-10-09). [The linear Turán number of the k-fan](https://doi.org/10.48550/arxiv.1710.03042).

- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~gyarfas/Cikkek/182_jcd1.pdf).
- PDF header (HTTP 200). [Retrieved address](https://real.mtak.hu/162708/1/ejc40.pdf).
- Source URL (HTTP 403). [Retrieved address](https://doi.org/10.1002/jcd.21585).
- Citation-index seed records. [Ramsey theory on Steiner triples](https://doi.org/10.1002/jcd.21585) · [The linear Turán number of the k-fan](https://doi.org/10.48550/arxiv.1710.03042).
- Crossref query “The Steiner triple system sail problem steiner triple system sail” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the Steiner triple system sail counts — exit 0. [Command and output](../evidence/replays/015.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
