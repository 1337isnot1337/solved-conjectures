# Quantitative decision lower bound for the permanent graph

**Screened.** Research branch (catalogue link). [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/README.md).

## Recorded scope

The source describes the result as follows.

> Status: complete written derivation from two imported results, with three completed internal adversarial reviews. Anthropic's VP ≠ VNP theorem and its pinned border lower bound are treated as valid under the repository's standing research assumption; Bürgisser's factor theorem is the other imported input. This is a consequence of the imported theorems, not a newly solved named conjecture. No Lean formalization of this deduction or independent formal verification of the imported theorem is claimed.

## Source outline

- [1. Statement and computational model](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L7).
- [2. Two imported results and their conventions](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L36).
- [2.1. Arithmetic and approximative straight-line complexity](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L38).
- [2.2. Bürgisser's factor theorem](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L53).
- [2.3. The pinned permanent border lower bound](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L81).
- [3. Algebraic facts about the graph](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L103).
- [4. Extracting a small nonzero multiple from one path](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L122).
- [5. From the multiple to a compatible border circuit](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L159).
- [6. Quantitative lower bound](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L197).
- [8. Uniform BSS machines and arbitrary constants](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L248).
- [9. A specified nonscalar-operation convention](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L279).
- [10. Scope, prior work, and the BSS campaign](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md#L316).

The ledger includes the intervening sections.

## Provenance

- Path first added on the first-parent history on 2026-11-23T23:51:20Z. [Commit ea3e902bd](https://github.com/1337isnot1337/solved-conjectures/commit/ea3e902bdaa897eb1f12694c081503e13a04ba95).
- Latest change to this landing file at the snapshot on 2026-11-23T23:55:45Z. [Commit 29e9702cd](https://github.com/1337isnot1337/solved-conjectures/commit/29e9702cdf20a70d75738d9cb2ed695559c9f145).
- Coordination and prior review. [#247](https://github.com/1337isnot1337/solved-conjectures/issues/247) · [#248](https://github.com/1337isnot1337/solved-conjectures/issues/248) · [#249](https://github.com/1337isnot1337/solved-conjectures/pull/249).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/PROOF.md) · [SOURCES.md](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/SOURCES.md) · [REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/ccd46fe75b25fbf32ab7a6139509f5bb2dad6201/research/bss-permanent-graph/REVIEW.md)

## Literature checks

- The Complexity of Factors of Multivariate Polynomials (HTTP 200). [Retrieved address](https://arxiv.org/abs/1812.06828v1).
- formal-math/vp-vnp/paper.pdf at 11b6c7e3c927df2658f513b6b68ea7f8929c62c5 · anthropics/formal-math · GitHub (HTTP 200). [Retrieved address](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf).
- formal-math/vp-vnp/Statement.lean at 11b6c7e3c927df2658f513b6b68ea7f8929c62c5 · anthropics/formal-math · GitHub (HTTP 200). [Retrieved address](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean).
- Citation-index seed records. [The Complexity of Factors of Multivariate Polynomials](https://doi.org/10.1007/s10208-002-0059-5) · [Correction To: The Complexity of Factors of Multivariate Polynomials](https://doi.org/10.1007/s10208-020-09477-6) · [Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent](https://doi.org/10.48550/arxiv.2606.25121).
- Crossref query “Quantitative decision lower bound for the permanent graph” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 6 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
