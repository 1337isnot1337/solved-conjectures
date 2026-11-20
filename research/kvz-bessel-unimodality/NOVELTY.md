# Karp–Vishnyakova–Zhang's Bessel-ratio unimodality conjecture

## Scope and current conclusion

Audit date: 20 November 2026. The target is the full unimodality assertion
for arbitrary ordered real orders greater than minus one and arbitrary
ordered positive scales. It is the first assertion of Conjecture 1 in
arXiv:2408.01755v2, not the separate log-concavity clause.

No earlier proof of this exact all-parameter assertion has been located in
the inspected sources. The new argument is a short application of the
classical Bessel differential equation and a Wronskian identity. Those
tools are not claimed as new. This is a bounded literature assessment, not
a guarantee of exclusive priority or external peer review.

The initial proof was committed as
`9a5f90c84d13e85352b79402e4e79fc0f7819c2a`. An independent mathematical
review is in [AUDIT-ANALYSIS.md](AUDIT-ANALYSIS.md), committed at
`7c9886eecce9c358544585b16563c8f75cd8839f`. Root is conducting an additional
independent review and broad primary-literature check. Final result
publication remains subject to that review.

## Exact source and version checks

| Source | Directly inspected statement or scope |
| --- | --- |
| [arXiv:2408.01755v1](https://arxiv.org/pdf/2408.01755v1), 3 August 2024, printed page 11 | Conjecture 2 contains the full unimodality assertion, followed by a stronger positive-order log-concavity assertion. |
| [arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755v2), 1 March 2025, printed page 12 | Renumbered Conjecture 1 retains the two assertions and the same parameter domain. The argument before Theorem 4.3 proves only the special condition of an even positive integer order difference. |
| [Yi Zhang's author copy](https://yzhang1616.github.io/Unimodality_KVZ.pdf), printed page 11 | The accessible copy retains the first-version numbering and both assertions. It contains no complete unimodality proof in place of the conjecture. |
| [Publisher record](https://link.springer.com/article/10.1007/s00025-025-02431-4) | Confirms *Results in Mathematics* 80, article 112, publication on 20 May 2025. The retrieved publisher page exposes the abstract, references, and appendices, but its main text is a subscription preview. The exact assertion was therefore checked against the primary preprints and author copy. |

The source includes an otherwise unused nonnegative parameter in the
conjecture's introductory assumptions. It does not occur in the Bessel
ratio. Omitting that unused parameter from the theorem changes neither
the function nor its parameter domain.

The proof covers the entire surviving assertion. Its equality cases and
negative orders are part of that domain. The five-case classification in
`PROOF.md` does not create separate result claims for those cases.

## The earlier log-concavity disproof

The full public
[Trure Turing problem and result record](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/)
was read, including its encoded claim, witness, scope assessment, and
limitations. Its claim is the universal positive-order log-concavity
assertion. Its witness uses equal orders one tenth and scales one and two.
The scope assessment explicitly marks the unimodality assertion as
untouched and open.

Thus the compound conjecture has already been refuted as a conjunction,
but its separately stated full unimodality assertion survives. This work
proves that assertion. It must not be described as a new disproof of the
log-concavity assertion or as a proof of the original conjunction. No work
on the prior source's formal certificate was performed.

The public record does not itself establish the absence of an earlier
unimodality proof. The independent searches and scope comparisons below
are still necessary.

## Primary literature checked in this lane

| Work | Inspected scope and distinction |
| --- | --- |
| Feng Qi, *Properties of modified Bessel functions and completely monotonic degrees of differences between exponential and trigamma functions*, *Mathematical Inequalities & Applications* 18 (2015), 493–518; [full journal PDF](https://files.ele-math.com/articles/mia-18-37.pdf), [arXiv:1302.6731](https://arxiv.org/abs/1302.6731) | The main theorems and their stated unimodality functions were inspected. These involve the fixed-order functions with orders one or two, exponential expressions, and complete-monotonicity degrees for exponential/trigamma differences. They do not state the arbitrary-order, arbitrary-scale Bessel-ratio theorem. |
| Zakaria Derbazi, *On Preserving or Reversing Higher-Order Unimodality and Convexity by Sign-Regular Kernels*, [arXiv:2502.13136v2](https://arxiv.org/pdf/2502.13136) | The full searchable preprint concerns general transformation rules. Searches of its text found neither a Bessel application nor a conjecture statement. Its general tools are related to the source paper's topic, but no resolution of the present specific assertion was located. |
| [DLMF Section 10.28](https://dlmf.nist.gov/10.28) | Records classical Bessel Wronskian identities, including the opposite-order identity at a common argument. It is background for the method, not a located statement of the full two-scale unimodality classification. The proof derives its own Wronskian identity directly from the differential equation. |
| [Karp's current publication list](https://dmkrp.wordpress.com/publications/) | Inspected through its August 2026 entries. It retains the 2025 source paper and lists later work in other topics. No titled follow-up claiming this unimodality result was located. A publication list is not a full-text audit of every listed article. |
| [Yi Zhang's current homepage](https://yzhang1616.github.io/) and the author copy above | The homepage was inspected and the accessible author manuscript read at the conjecture. No later resolution was located there. |

Root's independent review additionally screens Segura's 2021 Riccati-ratio
paper, the Yang–Zheng Bessel-ratio papers, current public solution catalogs,
and related real-order total-positivity claims. Its exact scope findings
should be read with the root audit once that file is available.

## Searches and what they found

Both available search engines were used. Searches combined the exact
paper title, author names, conjecture numbering in both versions, Bessel
ratios, unimodality, proof, resolution, Wronskians, different orders,
different arguments, and monotonicity. Recent-result queries were also
run for the period following the first preprint.

Representative query strings included:

- `"modified Bessel" "ratio" "unimodality"`
- `"Bessel" "Wronskian" "unimodality"`
- `"Bessel" "ratio" "different arguments" "monotonicity"`
- `"Bessel" "ratio" "different orders" monotonicity`
- `"Karp" "Vishnyakova" "Bessel" unimodality solved`
- `"Bessel-ratio" "unimodality" -log-concavity`
- `"Properties of modified Bessel functions" "unimodality" Qi pdf`

Exact-target results led to the source paper, its author copies, and the
separate log-concavity refutation. Broader results led to the primary
papers discussed above and to adjacent-order bounds, products of first-
and second-kind functions, Kaiser–Bessel densities, and other distinct
questions. Search snippets were used as leads, not as sufficient evidence
that a long paper excludes the target.

## Limits and claim discipline

The Bessel literature is large. These searches cannot rule out an obscure
earlier corollary or an unpublished argument. The proof should be described
as an internally reviewed resolution of the full surviving unimodality
assertion, with no earlier exact resolution located by the documented
search, if the remaining independent review passes.

The proof does not claim novelty for the differential equation, convergent
Bessel series, elementary sign analysis, or the general use of Wronskians
to compare solutions of second-order equations. It contains no reliance
on the false unrestricted log-concavity clause.
