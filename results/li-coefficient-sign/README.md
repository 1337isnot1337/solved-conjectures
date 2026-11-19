# Chromatic symmetric functions: a non-spider counterexample to Li's coefficient-sign prediction

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

**Status:** unrefereed; exact computations checked; apparent novelty in the *non-spider* class, subject to independent literature review.

A tree on 31 vertices with maximum degree 4 has all 6,842 connected partition types and satisfies

```math
[e_3e_2^{14}]X_T = 29 > 0, \qquad b_{(3,2^{14})}(T)=8.
```

Here `X_T` is the chromatic symmetric function, and `b_lambda(T)` is the number of connected partitions of type `lambda`. The tree is neither a spider nor a caterpillar. It answers **Problem 4.9** and the **first question of Problem 4.6** of [Ethan Y. H. Li, *A quantitative way to e-positivity of trees*, arXiv:2503.09484v2](https://arxiv.org/abs/2503.09484) in the negative, even under the non-spider restriction emphasized in the paper.

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

Vertex 0 has degree 4 but is adjacent to only **one** leaf. Vertex 8 has degree 3. These facts defeat the proposed two-leaf necessity in Li's Problem 4.6 and rule out the spider class.

## Files and verification

- [`proof.pdf`](proof.pdf): the original three-page note, with the original Python verifier embedded as a PDF attachment.
- [`PROOF.md`](PROOF.md): text of the proof, with its hypotheses and coefficient calculation.
- [`verify.py`](verify.py): original verifier, extracted byte-for-byte from the PDF; uses the Python standard library.
- [`independent_check.py`](independent_check.py): independent calculation of the coefficient using bipartition parity and vertex deletion.
- [`NOVELTY.md`](NOVELTY.md): scoped prior-art search and the reasons not to claim broader novelty.

Run:

```bash
python3 results/li-coefficient-sign/verify.py
python3 results/li-coefficient-sign/independent_check.py
```

The main verifier counts all `2^30` edge subsets by exact dynamic programming, certifies representative cuts for all 6,842 integer partitions of 31, finds eight triple-plus-pairs partitions, and checks the elementary coefficients both from edge-cut expansions and from five independent exact proper-coloring evaluations.

## Precise novelty claim

**Do not claim that Li's Problems 4.6 and 4.9 had no counterexamples at all.** Older spider examples already falsify the unrestricted coefficient-sign assertion; older arbitrarily vertex-decomposable examples also contradict the one-degree-four-vertex expectation. The contribution here is an explicit **non-spider, non-caterpillar** 31-vertex counterexample with exact coefficient `+29` and eight connected triple-plus-pairs partitions.

No prior explicit non-spider example answering Li's sign question was located in the literature search described in [`NOVELTY.md`](NOVELTY.md), as of 17 November 2026. This negative search is *not* proof of first discovery or independent peer review. For Li's exact wording, cite [Section 4, Problems 4.6 and 4.9](https://arxiv.org/pdf/2503.09484).

## Lean formalization

Lean proves the structural facts about the explicit tree, the full
`[e_3 e_2^14] X_T = +29` coefficient (including independence from the finite
colour set), the connected-partition count `b_{(3,2^14)}(T) = 8`, and that all
6,842 integer partitions of 31 occur as connected partition types. See
[`LEAN.md`](LEAN.md) for the exact theorems and module map.
