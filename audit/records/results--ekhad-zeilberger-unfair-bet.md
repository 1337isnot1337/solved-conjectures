# Ekhad–Zeilberger’s most unfair bet conjecture

**Screened.** Ranked. Rank 128 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/README.md).

## Recorded scope

The source describes the result as follows.

> Determines the pair of words maximizing the leading difference of win probabilities in Litt’s game for every word length and alphabet size. Includes the sponsor’s full-alphabet convention.

## Source outline

- [The overlap formula](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/PROOF.md#L13).
- [Nonconstant words](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/PROOF.md#L24).
- [The constant loser and equality](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/PROOF.md#L55).
- [When the two words must use the full alphabet](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/PROOF.md#L59).

## Provenance

- Path first added on the first-parent history on 2026-11-21T10:08:50-06:00. [Commit 2fcba744c](https://github.com/1337isnot1337/solved-conjectures/commit/2fcba744ca207a1026da1c3761dd6707dfd36fe3).
- Latest change to this landing file at the snapshot on 2026-11-25T13:16:33Z. [Commit 7c0f59c34](https://github.com/1337isnot1337/solved-conjectures/commit/7c0f59c34f99b9200c8924b921f142da88a8d36c).
- Coordination and prior review. [#219](https://github.com/1337isnot1337/solved-conjectures/issues/219).

The original record contains 7 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/FORMALIZATION.md) · [LEAN_CANDIDATE.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ekhad-zeilberger-unfair-bet/LEAN_CANDIDATE.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2503.19035) (41 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/2405.16660) (11 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Simon Segert (2024-05-26). [A proof that HT is more likely to outnumber HH than vice versa in a sequence of n coin flips](https://doi.org/10.48550/arxiv.2405.16660).

- How to Answer Questions of the Type: If you toss a coin n times, how likely is HH to show up more than HT? (HTTP 200). [Retrieved address](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimhtml/litt.html).
- Source URL (HTTP 200). [Retrieved address](https://sites.math.rutgers.edu/~zeilberg/tokhniot/Litt.txt).
- The generalized Alice HH vs Bob HT problem (HTTP 200). [Retrieved address](https://arxiv.org/abs/2503.19035).
- Citation-index seed records. [A proof that HT is more likely to outnumber HH than vice versa in a sequence of n coin flips](https://doi.org/10.48550/arxiv.2405.16660).
- Crossref query “Ekhad–Zeilberger’s most unfair bet conjecture ekhad zeilberger unfair bet” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check extremal word pairs in Litt's game — exit 0. [Command and output](../evidence/replays/063.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
