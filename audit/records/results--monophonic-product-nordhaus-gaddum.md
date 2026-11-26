# Chandran–Di Stefano–Haritha–Thomas–Tuite monophonic product conjecture

**Screened.** Ranked. Rank 55 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/README.md).

## Recorded scope

The source describes the result as follows.

> The full independent monophonic product inequality is false. Triangle-expanded and subdivided prisms give counterexamples on every order $15s$ for $s\geq3$ with exact color counts for both graphs.

## Audit finding

The November 3 subdivided 6-clique refutes the independent monophonic sum prediction. The repository separates the general-position bounds from the monophonic product. Failure of a sum bound does not imply failure of its product analogue. The product witness at s=3 gives 540>529.

## Source outline

- [A subdivision lemma](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/PROOF.md#L16).
- [Counting colors in the cubic case](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/PROOF.md#L30).
- [The counterexample family and exact color counts](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/PROOF.md#L43).

## Provenance

- Path first added on the first-parent history on 2026-11-26T08:28:00-06:00. [Commit f28ae7849](https://github.com/1337isnot1337/solved-conjectures/commit/f28ae7849240de65abd1e033abc9d6c6195f8b1a).
- Latest change to this landing file at the snapshot on 2026-11-26T09:25:28-06:00. [Commit d57704cd3](https://github.com/1337isnot1337/solved-conjectures/commit/d57704cd3224ef8fdd369fd1c8d6042b99645891).
- Coordination and prior review. [#847](https://github.com/1337isnot1337/solved-conjectures/issues/847).

The original record contains 6 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/monophonic-product-nordhaus-gaddum/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2408.13494v2) (28 pages). conjecture 9.3 on PDF p. 26.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Ullas Chandran S.V., Gabriele Di Stefano, S. Haritha, Elias John Thomas et al. (2026-08-28). [Colouring a graph with position sets](https://doi.org/10.26493/1855-3974.3454.a3c).
- P. Graham (2026-11-03). [A subdivided 6-clique breaks a conjectured sum bound for independent monophonic-position colorings](https://doi.org/10.5281/zenodo.23915320).

- Colouring a graph with position sets (HTTP 200). [Retrieved address](https://arxiv.org/abs/2408.13494v2).
- Source URL (HTTP 403). [Retrieved address](https://oro.open.ac.uk/107103/8/107103.pdf).
- Colouring a graph with position sets (HTTP 200). [Retrieved address](https://doi.org/10.26493/1855-3974.3454.a3c).
- Citation-index seed records. [Colouring a graph with position sets](https://doi.org/10.26493/1855-3974.3454.a3c) · [A subdivided 6-clique breaks a conjectured sum bound for independent monophonic-position colorings](https://doi.org/10.5281/zenodo.23915320).
- Crossref query “Chandran–Di Stefano–Haritha–Thomas–Tuite monophonic product conjecture monophonic product nordhaus gaddum” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 2 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the independent monophonic product counterexample — exit 0. [Command and output](../evidence/replays/009.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
