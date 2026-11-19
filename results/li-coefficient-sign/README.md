# Chromatic symmetric functions: a non-spider counterexample to Li's coefficient-sign prediction

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

**Status:** main counterexample conclusions verified in Lean and registered. The complete 44-module source, literal-statement, owned and raw-proof-occurrence audits, and stock-kernel checks have passed with authenticated artifacts. The note remains unrefereed, and apparent novelty in the *non-spider* class remains subject to independent literature review.

A tree on 31 vertices with maximum degree 4 has all 6,842 connected partition types and satisfies

```math
[e_3e_2^{14}]X_T = 29 > 0, \qquad b_{(3,2^{14})}(T)=8.
```

Here `X_T` is the chromatic symmetric function, and `b_lambda(T)` is the number of connected partitions of type `lambda`. The tree is neither a spider nor a caterpillar. It answers **Problem 4.9** and the **first question of Problem 4.6** of [Ethan Y. H. Li, *A quantitative way to e-positivity of trees*, arXiv:2503.09484v2](https://arxiv.org/abs/2503.09484v2) in the negative, even under the non-spider restriction emphasized in the paper.

The result does **not** refute the Dahlberg--She--van Willigenburg conjecture that every tree of maximum degree at least 4 is not `e`-positive. Indeed, another coefficient of this tree is negative:

```math
[e_2^8e_3^5]X_T=-6304.
```

## The explicit tree

The vertex set is `{0, 1, ..., 30}`. Consecutive vertices along the following five paths are adjacent:

```text
(0, 1)
(0, 2, 3)
(0, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
(8, 15)
(0, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30)
```

Vertex 0 is the unique vertex of degree 4 and is adjacent to only **one** leaf. Vertex 8 has degree 3. These facts defeat the proposed two-leaf necessity in the first question of Li's Problem 4.6 and rule out the spider class. This tree does not refute the second question of Problem 4.6, which asks about uniqueness of the degree-4 vertex. The separate informal prediction contradicted by `b_(3,2^14)(T)=8` is that this partition count equals 1.

## Files and verification

- [`proof.pdf`](proof.pdf): the original three-page note, with the original Python verifier embedded as a PDF attachment.
- [`PROOF.md`](PROOF.md): text of the proof, with its hypotheses and coefficient calculation.
- [`LEAN.md`](LEAN.md): exact theorem statements, finite-colour scope, attribution, and verification procedure for the Lean development.
- [`verify.py`](verify.py): original verifier, extracted byte-for-byte from the PDF; uses the Python standard library.
- [`independent_check.py`](independent_check.py): independent calculation of the coefficient using bipartition parity and vertex deletion.
- [`NOVELTY.md`](NOVELTY.md): scoped prior-art search and the reasons not to claim broader novelty.

Run:

```bash
python3 results/li-coefficient-sign/verify.py
python3 results/li-coefficient-sign/independent_check.py
```

The main verifier counts all `2^30` edge subsets by exact dynamic programming, certifies representative cuts for all 6,842 integer partitions of 31, finds eight triple-plus-pairs partitions, and checks the elementary coefficients both from edge-cut expansions and from five independent exact proper-coloring evaluations.

## Lean statement coverage

The Lean development assembles the tree properties, coverage of every connected partition type, and the exact triple-plus-pairs count in `LiCounterexample.counterexample`. Its blocks are actual nonempty, pairwise disjoint vertex sets covering the tree; connectivity is expressed by walks whose vertices remain in the block. The additional equivalence `LiConnectedPartitions.cutPartitionEquiv` identifies deleted-edge subsets with all such connected vertex partitions. Its cardinality theorem gives `2^30 = 1,073,741,824` connected vertex partitions in total, while 6,842 counts their distinct block-size types.

The coefficient development starts from the finite proper-colouring polynomial and uses Mathlib's inverse elementary-symmetric algebra equivalence. It proves each coefficient below for every finite colour set of cardinality at least 31:

| Elementary monomial | Coefficient |
| --- | ---: |
| `e₂¹⁴ e₃` | `29` |
| `e₂¹¹ e₃³` | `83` |
| `e₂⁸ e₃⁵` | `−6304` |
| `e₂⁵ e₃⁷` | `−6800` |
| `e₂² e₃⁹` | `−8384` |

These are the five degree-31 monomials using only `e₂` and `e₃`; the table is not the complete elementary expansion. The negative entry also yields a theorem that the full elementary coordinates are not coefficientwise nonnegative.

The finite-colour stability theorems identify the intended stable coefficients. The development does not construct a separate infinite-variable symmetric-function ring. The threshold 31 is the degree bound used in the transfer theorems; no minimal-colour claim is made for these particular coefficients.

The original 38-module development is by [aadrianvv](https://github.com/aadrianvv), contributed in [PR #35](https://github.com/1337isnot1337/solved-conjectures/pull/35). The six additional modules and verification work are coordinated in [issue #39](https://github.com/1337isnot1337/solved-conjectures/issues/39), [#40](https://github.com/1337isnot1337/solved-conjectures/issues/40), and [#41](https://github.com/1337isnot1337/solved-conjectures/issues/41). The authenticated source, stock-kernel, and raw-occurrence evidence is recorded in [`LEAN.md`](LEAN.md).

The Lean proofs use leaf elimination, exact interpolation, graph-component certificates, and a proved matching/partition correspondence. The Python edge-cut dynamic program and the vertex-deletion derivation in [`PROOF.md`](PROOF.md) remain alternative computational arguments; their implementations are not certified by these Lean theorems.

## Precise novelty claim

**Do not claim that Li's Problems 4.6 and 4.9 had no counterexamples at all.** Older spider examples already falsify the unrestricted coefficient-sign assertion; older arbitrarily vertex-decomposable examples also contradict the one-degree-four-vertex expectation. The contribution here is an explicit **non-spider, non-caterpillar** 31-vertex counterexample with exact coefficient `+29` and eight connected triple-plus-pairs partitions.

No prior explicit non-spider example answering Li's sign question was located in the literature search described in [`NOVELTY.md`](NOVELTY.md), as of 17 November 2026. This negative search is *not* proof of first discovery or independent peer review. For Li's exact wording, cite [Section 4, Problems 4.6 and 4.9](https://arxiv.org/pdf/2503.09484v2).
