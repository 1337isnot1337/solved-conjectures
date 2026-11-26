# Erdős’s bounded blocking-set problem

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/README.md).

## Recorded scope

The source describes the result as follows.

> Translation planes of bounded dimension over a kernel field of bounded characteristic have blocking sets meeting each line in a uniformly bounded number of points.

## Audit finding

The scalar covering step uses a vector space of dimension s+1 mapping into a quotient of dimension at most s. Each nonzero kernel therefore contributes a scalar representative that meets the chosen affine line. The number of representatives and the maximum intersection per translate both depend on p and e. Small extension degree is treated by the whole line construction. These bounds do not supply one absolute constant over every finite projective plane.

## Source outline

- [Theorem](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/PROOF.md#L5).
- [A graph with small intersections in every direction](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/PROOF.md#L17).
- [Making every affine line meet the set](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/PROOF.md#L25).
- [Scope and earlier work](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/PROOF.md#L43).
- [A non-Desarguesian check](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/PROOF.md#L49).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#803](https://github.com/1337isnot1337/solved-conjectures/issues/803).

The original record contains 3 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-bounded-blocking-set/PROOF.md)

## Literature checks

- [Source PDF](https://users.renyi.hu/~p_erdos/1981-16.pdf) (22 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/2510.15332) (15 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- 1159 \| Erdős Problems (HTTP 200). [Retrieved address](https://www.erdosproblems.com/1159).
- Source URL (HTTP 403). [Retrieved address](https://www.sciencedirect.com/science/article/pii/S1071579715000507).
- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~p_erdos/1981-16.pdf).
- Crossref query “Erdős’s bounded blocking-set problem erdos bounded blocking set” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check finite cases for five open-problem results — exit 0. [Command and output](../evidence/replays/013.txt).

The original result page marks independent proof review pending.
