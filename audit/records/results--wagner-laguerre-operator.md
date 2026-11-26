# Wagner's Laguerre-operator conjecture

**Earlier public resolution.** Ranked. Rank 71 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/README.md).

## Recorded scope

The source describes the result as follows.

> Complete proposed disproof of Conjecture 4.3 as stated in arXiv:2108.01827v2. The positive shifted Laguerre–Pólya function exp(z)+1 is sent by the first Laguerre operator to −exp(z), which has negative coefficients at every index. The separate sequence-transform conjectures are unaffected; final typeset wording and full later-paper access remain unconfirmed.

## Audit finding

Earlier exact disproof. The September manuscript uses the very same witness 1 + exp(z). Its approximants c + (1 + az/N)^N meet the shifted-class condition and the Taylor derivatives are eventually positive. L₁(1 + exp z) = −exp z, whose Taylor derivatives are all negative. The earlier proof also handles every odd positive Laguerre index. The archived repository landing page simultaneously claimed no Lean and a complete Lean proof.

[Earlier resolution](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-351518/mathdb-351518-solution.tex). [Correction on main](https://github.com/1337isnot1337/solved-conjectures/pull/891).

## Source outline

- [Exact target and status](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md#L3).
- [Definitions and their quantifiers](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md#L35).
- [Proof](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md#L51).
- [Mechanism and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md#L98).
- [Prior-art audit](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md#L119).
- [Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md#L133).
- [Independent review](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md#L144).

## Provenance

- Path first added on the first-parent history on 2026-11-24T07:36:48Z. [Commit 584f430c4](https://github.com/1337isnot1337/solved-conjectures/commit/584f430c4a9138b7a0fee63cffd3949439ebcdf3).
- Latest change to this landing file at the snapshot on 2026-11-25T07:45:08Z. [Commit b13f09c42](https://github.com/1337isnot1337/solved-conjectures/commit/b13f09c4289ae9a633697eaa481bccace0cdb3ab).
- Coordination and prior review. [#137](https://github.com/1337isnot1337/solved-conjectures/issues/137).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/wagner-laguerre-operator/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2108.01827v2) (13 pages). conjecture 4.1 on PDF p. 10 · conjecture 4.3 on PDF p. 11.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Ian Wagner (2022-10-16). [On a new class of Laguerre–Pólya type functions with applications in number theory](https://doi.org/10.2140/pjm.2022.320.177).
- Jia-tao Fan, Xingwei Wang (2026-04-21). [The operators preserving real-rootedness and inequalities for symmetric function](https://doi.org/10.1016/j.aam.2026.103092).
- Xingwei Wang, Neil Yang (2024-04-19). [Laguerre inequalities and complete monotonicity for the Riemann Xi-function and the partition function](https://doi.org/10.1090/tran/9081).

- On a new class of Laguerre-P\'{o}lya type functions with applications in number theory (HTTP 200). [Retrieved address](https://arxiv.org/abs/2108.01827v2).
- On a new class of Laguerre–Pólya type functions with applications in number theory (HTTP 200). [Retrieved address](https://msp.org/pjm/2022/320-1/p07.xhtml).
- On a new class of Laguerre–Pólya type functions with applications in number theory (HTTP 200). [Retrieved address](https://msp.org/pjm/2022/320-1/pjm-v320-n1-p07-s.pdf).
- Citation-index seed records. [On a new class of Laguerre–Pólya type functions with applications in number theory](https://doi.org/10.2140/pjm.2022.320.177) · [The operators preserving real-rootedness and inequalities for symmetric function](https://doi.org/10.1016/j.aam.2026.103092) · [Laguerre inequalities and complete monotonicity for the Riemann Xi-function and the partition function](https://doi.org/10.1090/tran/9081).
- External solution records sharing a cited identifier. [mathdb-351518/mathdb-351518-solution.tex](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-351518/mathdb-351518-solution.tex).
- Crossref query “Wagner's Laguerre-operator conjecture wagner laguerre operator” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
