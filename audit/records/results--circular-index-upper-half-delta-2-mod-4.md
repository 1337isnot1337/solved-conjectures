# Graphs with circular chromatic index in the upper half for Δ ≡ 2 mod 4

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/README.md).

## Recorded scope

The source describes the result as follows.

> **Status:** Written proof of Theorems 1 and 1′. It has been through one independent referee pass by a second model instance, which re-derived every hand claim, found no mathematical error and accepted the note; its minor points are applied. The note is otherwise unrefereed. Proposition 2 rests on computer-checked colourings.

## Audit finding

The archived reviewer noted that an original negative control counted repeated lengths without exercising the real checker. The audited verifier now feeds both malformed matchings directly to check_family_B and requires rejection. The historical review and the later source are consistent once their versions are distinguished.

## Source outline

- [1. Statement](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L5).
- [2. Definitions and two lemmas](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L27).
- [3. The base matchings](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L43).
- [3.1 $`M_0`$ (all $`g ge 7`$)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L53).
- [3.2 $`M_1`$ for odd $`g ge 7`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L60).
- [3.3 $`M_1`$ for even $`g ge 8`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L68).
- [3.4 Conclusion of the base problem, and $`g = 6`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L90).
- [4. The colouring and the graph](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L106).
- [5. Proof of Theorems 1 and 1′](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L168).
- [6. What is proved, computed, open](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L182).
- [7. Verification](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L189).
- [8. Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L199).

## Scope and prior work recorded by the source

The following qualifications come from the pinned manuscript or its accompanying review.

> The exact value is known only for $`\Delta=10`$, where $`\chi'_c(K_{11}-2K_2)=32/3`$.

[Original passage](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/README.md#L31).

> Computer-certified (not human-checked):** $`\Delta = 10, 14, 18, 22`$ via the SAT-found colourings of $`K_n - tK_2`$ (Proposition 2); there the exact value of $`\chi'_c`$ is known only for $`\Delta = 10`$ ($`32/3`$, see the other folder), otherwise only the interval.

[Original passage](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md#L185).

## Provenance

- Path first added on the first-parent history on 2026-11-21T23:18:31-06:00. [Commit e24cae081](https://github.com/1337isnot1337/solved-conjectures/commit/e24cae081c0788dce49553cbb5439c49144ebd8c).
- Latest change to this landing file at the snapshot on 2026-11-26T01:34:25-06:00. [Commit 516fc1f99](https://github.com/1337isnot1337/solved-conjectures/commit/516fc1f9917db994c95417a3631392ac39cb13d2).
- Coordination and prior review. [#152](https://github.com/1337isnot1337/solved-conjectures/issues/152).

The original record contains 18 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/FORMALIZATION.md) · [REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-delta-2-mod-4/review/REVIEW.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2603.08822) (15 pages). problem 6 on PDF p. 13 · problem 7 on PDF p. 13.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Ján Mazák, Filip Zrubák (2026-03-09). [Circular chromatic index of small graphs](https://doi.org/10.48550/arxiv.2603.08822).

- aadrianvv · GitHub (HTTP 200). [Retrieved address](https://github.com/aadrianvv).
- Circular chromatic index of small graphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/2603.08822).
- Citation-index seed records. [Circular chromatic index of small graphs](https://doi.org/10.48550/arxiv.2603.08822).
- Crossref query “Graphs with circular chromatic index in the upper half for Δ ≡ 2 mod 4” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the upper-half graphs for maximum degree 2 mod 4 — exit 0. [Command and output](../evidence/replays/100.txt).

2 of 2 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
