# Erdős–Hajnal set-mapping conjecture

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/README.md).

## Recorded scope

The source describes the result as follows.

> Matching missing colors to available subsets yields $`H(n)\le \log_2 n+\log_2\log_2 n+O(1)`$. A separate circuit obstruction restricts constructions from binary nullspaces.

## Audit finding

The number of already colored subsets incident to each extra element is 2^(h−1)−h. Different extra elements yield disjoint collections, which permits the probability product. The final request graph has left degree h and right degree at most h, so Hall’s inequality follows by counting edges. Setting q=n supplies an upper bound. The original question is about divergence of the excess and needs a lower bound.

## Source outline

- [Comparison of the two conventions](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/PROOF.md#L13).
- [Matching missing colors to facets](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/PROOF.md#L23).
- [The bound for the original conjecture](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/PROOF.md#L50).
- [Source and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/PROOF.md#L54).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#796](https://github.com/1337isnot1337/solved-conjectures/issues/796).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/PROOF.md) · [binary-circuits.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-set-mapping/binary-circuits.md)

## Literature checks

- [Source PDF](https://www.renyi.hu/~p_erdos/1968-01.pdf) (4 pages). Full text retrieved.
- [Source PDF](https://www.renyi.hu/~gyarfas/Cikkek/ar2erdos.pdf) (13 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- PDF header (HTTP 200). [Retrieved address](https://www.renyi.hu/~p_erdos/1968-01.pdf).
- 624 \| Erdős Problems (HTTP 200). [Retrieved address](https://www.erdosproblems.com/624).
- PDF header (HTTP 200). [Retrieved address](https://www.renyi.hu/~gyarfas/Cikkek/ar2erdos.pdf).
- Crossref query “Erdős–Hajnal set-mapping conjecture erdos hajnal set mapping” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check finite cases for five open-problem results — exit 0. [Command and output](../evidence/replays/013.txt).

The original result page marks independent proof review pending.
