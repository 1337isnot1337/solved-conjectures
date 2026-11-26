# Steinke–Zakynthinou’s agnostic VC learning conjecture

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/README.md).

## Recorded scope

The source describes the result as follows.

> Lean proves the companion paper’s distribution-free Conjecture 4.18 for every positive sample size. For $`n\ge d`$, the same proper learner attains fixed-pairing information at most $`19{,}712d`$ nats and expected empirical excess at most $`583\sqrt{d/n}`$ on every sample. For the iid version, a written disproof uses standard Borel names and jointly universally measurable evaluation. Other Lean-verified statements give positive and negative results under distinct measurability hypotheses.

## Source outline

- [Statement and conventions](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/PROOF.md#L5).
- [1. The learner and its empirical error](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/PROOF.md#L19).
- [2. Averaged prediction projections](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/PROOF.md#L49).
- [3. Removing one example](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/PROOF.md#L102).
- [4. Information in the returned hypothesis](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/PROOF.md#L150).
- [A measurable globally consistent ERM suffices](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/PROOF.md#L176).

## Provenance

- Path first added on the first-parent history on 2026-11-21T20:10:10-06:00. [Commit 9c0d21762](https://github.com/1337isnot1337/solved-conjectures/commit/9c0d2176295c320383e551b548186c54a3825c89).
- Latest change to this landing file at the snapshot on 2026-11-24T04:00:34Z. [Commit 9ff45916e](https://github.com/1337isnot1337/solved-conjectures/commit/9ff45916e73de83d2ea64ef1bcc1750f102ea206).
- Coordination and prior review. [#240](https://github.com/1337isnot1337/solved-conjectures/issues/240).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/PROOF.md) · [SCOPE.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/steinke-zakynthinou-agnostic-vc/SCOPE.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2001.09122v3) (58 pages). conjecture 4.18 on PDF p. 24.
- [Source PDF](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) (7 pages). conjecture 6 on PDF p. 4.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Thomas Steinke, Lydia Zakynthinou (2020-01-24). [Reasoning About Generalization via Conditional Mutual Information](https://doi.org/10.48550/arxiv.2001.09122).
- Mahdi Haghifam, Gintare Karolina Dziugaite, Shay Moran, Daniel M. Roy (2021-12-06). [Towards a Unified Information-Theoretic Framework for Generalization](https://doi.org/10.48550/arxiv.2111.05275).
- Mateus Jesus de Arruda Campos, Gabriel Fernandes, Vinicius de Oliveira Rodrigues (2026-08-31). [A Borel Concept Class of VC Dimension One with a Non-PAC Consistent Learner in ZFC](https://doi.org/10.48550/arxiv.2608.30246).

- Reasoning About Generalization via Conditional Mutual Information (HTTP 200). [Retrieved address](https://arxiv.org/abs/2001.09122v3).
- PDF header (HTTP 200). [Retrieved address](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf).
- Reasoning About Generalization via Conditional Mutual Information (HTTP 200). [Retrieved address](https://arxiv.org/abs/2001.09122).
- Citation-index seed records. [Reasoning About Generalization via Conditional Mutual Information](https://doi.org/10.48550/arxiv.2001.09122) · [Towards a Unified Information-Theoretic Framework for Generalization](https://doi.org/10.48550/arxiv.2111.05275) · [A Borel Concept Class of VC Dimension One with a Non-PAC Consistent Learner in ZFC](https://doi.org/10.48550/arxiv.2608.30246).
- Crossref query “Steinke–Zakynthinou’s agnostic VC learning conjecture steinke zakynthinou agnostic vc” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the agnostic VC projection estimates — exit 0. [Command and output](../evidence/replays/073.txt).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
