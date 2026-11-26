# Erdős–Hammer convex-subset problem

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/README.md).

## Recorded scope

The source describes the result as follows.

> The binary Erdős–Szekeres order-type limit has convex-subset probability $`2^{-k^2/4+O(k\log k)}`$. Balanced substitutions give a quadratic exponent of at least one half for the minimum limiting density.

## Audit finding

The cup recurrence gives u₂=1 and u₃=1/2. Inserting these in the binary split recurrence gives P₃=1 and P₄=5/7. Completing the square yields the stated leading quadratic exponent 1/4 for that binary order type. The limit first fixes k and lets the host size increase. It does not give the existence of Erdős and Hammer’s different total-count limit.

## Source outline

- [Proofs](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/README.md#L9).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#832](https://github.com/1337isnot1337/solved-conjectures/issues/832).

The original record contains 7 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/README.md) · [BINARY-LIMIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/BINARY-LIMIT.md) · [COUNT-PROFILE.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/COUNT-PROFILE.md) · [DENSITY.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/DENSITY.md) · [FLAT-SUBSTITUTION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/FLAT-SUBSTITUTION.md) · [STEEP-SUBSTITUTION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hammer-838/STEEP-SUBSTITUTION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/1811.02236) (32 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/1604.08657) (7 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Xavier Goaoc, Alfredo Hubard, Rémi de Joannis de Verclos, Jean‐Sébastien Sereni et al. (2015-01-01). [Limits of Order Types](https://doi.org/10.4230/lipics.socg.2015.300).
- Andrew Suk (2016-09-30). [On the Erdős-Szekeres convex polygon problem](https://doi.org/10.1090/jams/869).

- 838 \| Erdős Problems (HTTP 200). [Retrieved address](https://www.erdosproblems.com/838).
- Limits of Order Types (HTTP 200). [Retrieved address](https://arxiv.org/abs/1811.02236).
- Limits of Order Types (HTTP 200). [Retrieved address](https://doi.org/10.4230/LIPIcs.SOCG.2015.300).
- Citation-index seed records. [Limits of Order Types](https://doi.org/10.4230/lipics.socg.2015.300) · [On the Erdős-Szekeres convex polygon problem](https://doi.org/10.1090/jams/869).
- Crossref query “Erdős–Hammer convex-subset problem erdos hammer 838” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check finite cases for five open-problem results — exit 0. [Command and output](../evidence/replays/013.txt).

The original result page marks independent proof review pending.
