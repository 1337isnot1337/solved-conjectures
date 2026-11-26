# Ma–Tang’s random subset-sum threshold conjecture

**Screened.** Ranked. Rank 8 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/README.md).

## Recorded scope

The source describes the result as follows.

> Proves the sharp universal second-order coefficient, with an independently audited bounded-remainder match along orders three times a power of two.

## Audit finding

The target in Problem 4.1 is the second-order limsup. On the groups of order 3 times a power of two, conditioning on distinct samples costs at most order k²/N. In the proposed fiber construction, each nonzero column type with at least two occupied coordinates can be signed to sum to zero modulo three, by pairing and using a triple when its size is odd. The probability bound excludes singleton types with high probability. The subsequence supplies the lower limsup and Ma–Tang supply the matching upper bound.

## Source outline

- [Proof](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/PROOF.md#L15).
- [Priority and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/PROOF.md#L69).

## Provenance

- Path first added on the first-parent history on 2026-11-24T14:48:52Z. [Commit 2ca11704d](https://github.com/1337isnot1337/solved-conjectures/commit/2ca11704d512f37b7d9b0abb2678d68d54940b1b).
- Latest change to this landing file at the snapshot on 2026-11-25T07:26:43Z. [Commit 68b5c5a06](https://github.com/1337isnot1337/solved-conjectures/commit/68b5c5a0667b06fc64c66817adbec265d2df648d).
- Coordination and prior review. [#490](https://github.com/1337isnot1337/solved-conjectures/issues/490).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/PROOF.md) · [BOUNDED-REMAINDER.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/BOUNDED-REMAINDER.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ma-tang-random-subset-sums/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2602.05768v2) (13 pages). problem 4.1 on PDF p. 12.
- [Source PDF](https://arxiv.org/pdf/2510.01300v2) (7 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- An Erd\H{o}s problem on random subset sums in finite abelian groups (HTTP 200). [Retrieved address](https://arxiv.org/abs/2602.05768v2).
- The Permanent Rank of a Matrix (Part Three) Note on the Additive Basis Conjecture (HTTP 200). [Retrieved address](https://arxiv.org/abs/2510.01300v2).
- PDF header (HTTP 200). [Retrieved address](https://www.renyi.hu/~p_erdos/1965-15.pdf).
- Citation-index seed records. [An Erdős problem on random subset sums in finite abelian groups](https://doi.org/10.48550/arxiv.2602.05768) · [The Permanent Rank of a Matrix (Part Three) Note on the Additive Basis Conjecture](https://doi.org/10.48550/arxiv.2510.01300).
- Crossref query “Ma–Tang’s random subset-sum threshold conjecture ma tang random subset sums” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.
