# Kovalev's conjecture

**Screened.** Ranked. Rank 45 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/README.md).

## Recorded scope

The source describes the result as follows.

> Complete proposed disproof of Conjecture 6.1. A uniform positive diagonal matrix family violates the lower Hardy-duality comparison in every order at least 500001. The supporting functional has dual norm exactly one; analytic Gaussian bounds give a strict rational separation. The separate upper inequality is not resolved.

## Source outline

- [Statement and proposed disproof](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PROOF.md#L3).
- [1. A Gaussian description of a dual unit vector](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PROOF.md#L33).
- [2. One large coordinate and many small coordinates](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PROOF.md#L109).
- [3. Rational lower bounds for the two expectations](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PROOF.md#L194).
- [4. Completion of the counterfamily](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PROOF.md#L292).
- [5. Elementary certificates for the constants](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PROOF.md#L334).

## Provenance

- Path first added on the first-parent history on 2026-11-21T02:30:25-06:00. [Commit 7982d9f30](https://github.com/1337isnot1337/solved-conjectures/commit/7982d9f30025124dda76e183707ed521d1f372b0).
- Latest change to this landing file at the snapshot on 2026-11-26T06:08:43-06:00. [Commit 72c5ba2a0](https://github.com/1337isnot1337/solved-conjectures/commit/72c5ba2a0199b7e49432f7a038db831d24a78a6a).
- Coordination and prior review. [#209](https://github.com/1337isnot1337/solved-conjectures/issues/209).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PROOF.md) · [SOURCES.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/SOURCES.md) · [ALGEBRA_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/ALGEBRA_REVIEW.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/FORMALIZATION.md) · [PRIOR_AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/PRIOR_AUDIT.md) · [ROOT_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-hardy-duality/ROOT_REVIEW.md)

## Literature checks

- Hardy-type norms of matrices (HTTP 200). [Retrieved address](https://arxiv.org/abs/2607.17373).
- DLMF: §10.32 Integral Representations ‣ Modified Bessel Functions ‣ Chapter 10 Bessel Functions (HTTP 200). [Retrieved address](https://dlmf.nist.gov/10.32.E9).
- DLMF: §10.25 Definitions ‣ Modified Bessel Functions ‣ Chapter 10 Bessel Functions (HTTP 200). [Retrieved address](https://dlmf.nist.gov/10.25.E2).
- Citation-index seed records. [Near-isometric duality of Hardy norms with applications to harmonic mappings](https://doi.org/10.1016/j.jmaa.2020.124040) · [A converse to the Schwarz lemma for planar harmonic maps](https://doi.org/10.1016/j.jmaa.2020.124908) · [A Focus on Near-Isometric Duality of Hardy Norms with Applications Corresponding to Harmonic Mappings](https://doi.org/10.35629/0743-1012121133) · [Hardy-type norms of matrices](https://doi.org/10.48550/arxiv.2607.17373).
- External solution records sharing a cited identifier. [mathdb-369172/mathdb-369172-solution.tex](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369172/mathdb-369172-solution.tex) · [mathdb-369171/mathdb-369171-solution.tex](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369171/mathdb-369171-solution.tex).
- Crossref query “Kovalev's conjecture kovalev hardy duality” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check Kovalev counterfamily constants — exit 0. [Command and output](../evidence/replays/045.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
