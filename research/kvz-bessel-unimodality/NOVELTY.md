# Karp–Vishnyakova–Zhang's Bessel-ratio unimodality conjecture

> **Prior-resolution correction, 21 November 2026.** [Trure issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199), public since 1 November, already proves the exact full-domain unimodality assertion. The independent proof remains mathematically valid, but this historical review does not establish novelty. The result has been withdrawn; see [PRIOR_RESOLUTION_CORRECTION.md](PRIOR_RESOLUTION_CORRECTION.md).

## Historical scope and conclusion (superseded)

Audit date: 20 November 2026. The target is the full unimodality assertion
for arbitrary ordered real orders greater than minus one and arbitrary
ordered positive scales. It is the first assertion of Conjecture 1 in
arXiv:2408.01755v2, not the separate log-concavity clause.

The 20 November audit reported that it had located no earlier proof. That assessment missed the complete 1 November proof in Trure issue 25199 and is superseded by the correction above. The Bessel differential-equation and Wronskian argument is an independent reproof of an already resolved assertion.

The initial proof was committed as
`9a5f90c84d13e85352b79402e4e79fc0f7819c2a`. An independent mathematical
review is in [AUDIT-ANALYSIS.md](AUDIT-ANALYSIS.md), committed at
`7c9886eecce9c358544585b16563c8f75cd8839f`. A second independent complete
review and primary-literature audit is in [AUDIT-ROOT.md](AUDIT-ROOT.md),
committed at `704d221d742cd10bdf95a3610eb5f47802691f1f`. Both reviews pass,
including all negative-order and equality cases. The exact diagnostic
verifier independently passed 130 coefficient identities and 10 endpoint
and coefficient-positivity checks. These bounded algebraic checks support
the written proof; they do not replace its all-parameter argument.

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
| J. Segura, *Monotonicity Properties for Ratios and Products of Modified Bessel Functions and Sharp Trigonometric Bounds* (2021), [full article](https://link.springer.com/article/10.1007/s00025-021-01531-1) | The relevant definitions and theorems concern adjacent-order ratios at one argument, double ratios, and products of first- and second-kind functions. Theorem 6 concerns a fixed-order logarithmic derivative and double ratio. No arbitrary-order, two-scale unimodality theorem was located. |
| Z.-H. Yang and S.-Z. Zheng, *Monotonicity of the ratio of modified Bessel functions of the first kind with applications* (2018), [full article](https://link.springer.com/article/10.1186/s13660-018-1648-4) | Theorem 1.1 classifies a rational expression in the adjacent-order ratio multiplied by the argument, with an auxiliary parameter. Its stated applications and prior-result discussion concern that quantity. |
| Z.-H. Yang and S.-Z. Zheng, *Monotonicity and convexity of the ratios of the first kind modified Bessel functions and applications* (2018), [full PDF](https://files.ele-math.com/articles/mia-21-09.pdf), DOI 10.7153/mia-2018-21-09 | Theorems 1–5 concern products divided by an average-order function, order-convexity of logarithmic derivatives, and same-argument four-factor quotients. Later propositions give adjacent-order bounds. These statements do not supply the full two-scale classification. |
| Á. Baricz and T. K. Pogány, *Probabilistic and Analytical Aspects of the Symmetric and Generalized Kaiser–Bessel Window Function* (2023), [full article](https://link.springer.com/article/10.1007/s00365-023-09627-3) | Section 4.1 uses a Bessel product formula for density properties. Sections 4.6–4.8 concern parameter derivatives of window densities, whose Bessel factors have a fixed half-order difference and constrained arguments. The inspected statements do not assert the arbitrary-two-order, arbitrary-two-scale ratio theorem. |
| [Karp's current publication list](https://dmkrp.wordpress.com/publications/) | Inspected through its August 2026 entries. It retains the 2025 source paper and lists later work in other topics. No titled follow-up claiming this unimodality result was located. A publication list is not a full-text audit of every listed article. |
| [Yi Zhang's current homepage](https://yzhang1616.github.io/) and the author copy above | The homepage was inspected and the accessible author manuscript read at the conjecture. No later resolution was located there. |

The first three added primary-paper checks above are recorded independently
in [AUDIT-ROOT.md](AUDIT-ROOT.md). That audit also inspected the matched
Bessel entries in the [Pudim application index](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md).
Their displayed claims concern square-root log-concavity, Riccati
inequalities, adjacent-order bounds, second-kind functions, or real-order
total positivity. None of the inspected displayed claims is the present
two-scale ratio theorem. This index check does not certify every underlying
proof, and no such broader certification is claimed.

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
search. Both independent mathematical reviews are complete and pass. No
claim of external peer review or exhaustive priority certification is made.

The proof does not claim novelty for the differential equation, convergent
Bessel series, elementary sign analysis, or the general use of Wronskians
to compare solutions of second-order equations. It contains no reliance
on the false unrestricted log-concavity clause.
