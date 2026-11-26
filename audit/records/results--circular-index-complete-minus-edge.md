# Mazák–Zrubák conjecture on complete graphs minus an edge

**Screened.** Ranked. Rank 149 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/README.md).

## Recorded scope

The source describes the result as follows.

> Mazák–Zrubák, arXiv Conjecture 2: for every even `d>=6`, the circular chromatic index of `K_{d+1}` minus one edge is `d+1`. By Guichard's theorem a smaller value would give a proper `(d+1)`-edge-colouring with acyclic digraph of consecutive colours, and the proof excludes such colourings. One independent model referee pass; the scripts check `d=4` and `d=6`.

## Audit finding

The two packages share the exact single-edge theorem: in the second notation n=d+1. The catalogue identifies the second proof explicitly. The few-edge package also determines exact indices for deletion patterns and gives a counterexample on eleven vertices. The two result directories must not be interpreted as two independent resolutions of Mazák–Zrubák Conjecture 2.

## Source outline

- [Statement](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L5).
- [Step 1. Acyclic colourings](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L21).
- [Step 2. Colour classes, the source and the sink](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L31).
- [Step 3. The longest-path levels form a linear order](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L40).
- [Step 4. Runs](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L75).
- [Step 5. The table with $`2h`$ columns](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L107).
- [Step 6. The vertex $`b`$ separates unwrapped from wrapped vertices](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L153).
- [Step 7. Where the other vertices have their junctions](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L167).
- [Step 8. The contradiction](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L188).
- [What is new](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L205).
- [Verification](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L209).
- [Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md#L225).

## Provenance

- Path first added on the first-parent history on 2026-11-21T08:37:37-06:00. [Commit d44211ef0](https://github.com/1337isnot1337/solved-conjectures/commit/d44211ef0883124b2aaf042c335c68acbe597859).
- Latest change to this landing file at the snapshot on 2026-11-26T02:03:35-06:00. [Commit 08acaebf8](https://github.com/1337isnot1337/solved-conjectures/commit/08acaebf819f6aa4920927034b8beaa19fb1a8ea).
- Coordination and prior review. [#147](https://github.com/1337isnot1337/solved-conjectures/issues/147).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/FORMALIZATION.md) · [LEAN_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edge/LEAN_REVIEW.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2603.08822) (15 pages). conjecture 2 on PDF p. 7 · problem 2 on PDF p. 12.
- [Source PDF](https://arxiv.org/pdf/2603.08822v1) (15 pages). conjecture 2 on PDF p. 7 · problem 2 on PDF p. 12.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Circular chromatic index of small graphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/2603.08822).
- Circular chromatic index of small graphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/2603.08822v1).
- Citation-index seed records. [Circular chromatic index of small graphs](https://doi.org/10.48550/arxiv.2603.08822).
- Crossref query “Mazák–Zrubák conjecture on complete graphs minus an edge” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the Mazák–Zrubák lemmas for complete graphs minus an edge — exit 0. [Command and output](../evidence/replays/116.txt).

6 of 6 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
