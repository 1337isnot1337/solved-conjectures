# Source and prior-resolution audit

Audit date: 2026-11-21. Exact target: Conjecture 1 in Ferreira and Simon, *Convolution of beta prime distribution*, the all-parameter beta-prime self-convolution identity. No earlier proof or disproof of that exact assertion was located in the material examined below. This is a bounded search report, not a guarantee about inaccessible or unindexed work.

## Exact source and classical ingredients

Rui A. C. Ferreira and Thomas Simon, [*Convolution of beta prime distribution*](https://arxiv.org/abs/2108.09244), arXiv:2108.09244v2, revised 19 May 2022; published in Transactions of the American Mathematical Society 376(2) (2023), 855–890, [DOI 10.1090/tran/8748](https://doi.org/10.1090/tran/8748).

The [complete v2 primary PDF](https://arxiv.org/pdf/2108.09244) was read at the definitions and independence conventions, Proposition 3, Proposition 5, Theorems A/B, Conjecture 1, its equivalent double-integral formulation, and the discussion after it. The source's full statement is $`a>0`$, $`0\lt b<1/2`$, with independent beta and beta-prime factors. The already-proved parameter curves are distinguished from the general conjecture. The proof here covers the complete general statement.

The source's latest arXiv version still contains the conjecture. The publisher PDF request returned HTTP 403, so the version of record was not inspected directly. Its bibliographic details were independently confirmed by the [University of Lisbon publication record](https://researchportal.ulisboa.pt/en/publications/convolution-of-beta-prime-distribution/) and the [coauthor's publication list](https://pro.univ-lille.fr/thomas-simon/publications). The readable primary target is explicitly the v2 statement; an inaccessible journal file is not represented as read.

The analytic identities used in the proof were checked in the primary NIST reference:

- [DLMF 15.8.15](https://dlmf.nist.gov/15.8.E15): the quadratic transformation with denominator parameter $`1+A-B`$. Its argument in the proof lies strictly between zero and one, so the stated disk condition is met.
- [DLMF 15.8.1](https://dlmf.nist.gov/15.8.E1): Pfaff's and Euler's transformations. All powers in the proof have positive real bases.
- [DLMF 15.6.1](https://dlmf.nist.gov/15.6.E1): Euler's beta integral, with positive integration parameters.
- Gamma duplication and the beta-function identity are classical normalization formulas. The supplementary verifier checks their use as exact formal gamma-product identities.

Proposition 5 of the source is also rederived in `PROOF.md`, so a miscopied source prefactor would not be a hidden premise. The proof's integral transform is a new application of classical identities to the conjecture; the classical transformations themselves are not claimed as new.

## Later papers and citation leads

| Primary source | Inspected scope | Relation to the target |
|---|---|---|
| Mao–Tian, [*Complete monotonicity of Laplace transform ratios: Density criteria for self-decomposability and additive decomposition*](https://arxiv.org/pdf/2611.24348), arXiv:2611.24348v1, 18 November 2026 | Abstract, introduction, and the full beta-prime application in Section 3, especially Theorem 3.2, Corollary 3.3, and Remark 3.2 | Establishes an additive decomposition in a restricted shape range. It does not establish the full multiplicative square-root identity. Its discussion calls the doubling-quotient result partial; this is nearby current literature, not proof of absence of another result. |
| Sakuma–Ueda, [*Generalized Meixner-type free gamma distributions: convolution formulas and potential correspondence*](https://arxiv.org/pdf/2508.15585), arXiv:2508.15585v1; [published full text](https://doi.org/10.4153/S0008414X25101831) | Both accessible primary versions; the beta-prime definitions, Section 6, and the source citation | Cites Ferreira–Simon for classical beta–gamma background and studies free-probability analogues. The printed Section 6 does not assert the classical independent self-convolution identity. |
| Baricz–Prabhu–Singh–Vijesh, [*Infinitely divisible modified Bessel distributions*](https://arxiv.org/pdf/2406.17721), v2 | Abstract, relevant beta-prime/Tricomi section, and all occurrences of its Ferreira–Simon citation | Uses ratios of Tricomi functions and infinite divisibility. Its cited Ferreira–Simon passage is Section 2 on parameter quotients, not a resolution of Conjecture 1. |
| Giraldi, [*A class of positive Fox H-functions*](https://arxiv.org/pdf/2502.10483), v1 | Introduction, result structure, and full-text searches for the source and convolution target | The accessible preprint concerns positivity obtained from Mellin convolutions, and contains no Ferreira–Simon citation or square-root self-convolution result. A later journal-version citation was a secondary lead; that later full text was not inspected, so it is not counted as checked negative evidence. |
| [Thomas Simon's current publication list](https://pro.univ-lille.fr/thomas-simon/publications) | Entire list, including the later Wright, Mittag–Leffler, and beta-weighted-operator titles | No listed title announces a resolution of the beta-prime identity. A title list alone is only a discovery check. |

The published source's Conjecture 2 would have a larger complete-monotonicity consequence if true. Its known refutation outside the conjectured parameter window neither refutes nor proves the distribution identity considered here.

## Explicitly excluded neighboring resolutions

Two public proof records cite the same original paper but settle different conjectures:

1. [Pudim APP-0077](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md) disproves the necessity direction of the Tricomi complete-monotonicity window, the paper's Conjecture 2. Its complete application index and the corresponding polynomial proof were inspected. The examples use different Tricomi parameter values and do not resolve the beta-prime identity.
2. [trureturing issue #22716](https://github.com/the-omega-institute/trureturing/issues/22716) gives an analytic refutation of Conjecture 3, the direct-argument Gaussian Mills derivative quotient. Its full body and both comments were fetched and checked. Its source audit supplies citation leads, which were separately inspected where relevant above; it contains no proof of Conjecture 1.

Neither neighboring refutation is credited to this result. Likewise the repository's existing Ferreira–Simon Wright, stochastic-order, and diagonal Mittag–Leffler entries concern different papers and functions.

## Literature searches

Both available search engines were used. The stronger engine was used for recent searches. Queries used the full source title, arXiv identifier, both authors, beta-prime and beta prime spellings, self-convolution, square-root mixture, Mellin transform, proof, counterexample, resolution, and the numbered conjecture. Structural searches were included so that an older unnamed beta–gamma identity would not be missed solely because it was not labeled with the conjecturers' names.

Representative queries:

```text
"2108.09244" "Conjecture 1" proof
"Ferreira" "Simon" "conjecture" "beta-prime" identity
"Convolution of beta prime distribution" conjecture resolution
"beta prime" convolution "square root" factorization identity
"beta-prime" "Mellin" "conjecture" proof
"Ferreira" "Simon" "square root" beta conjecture
"beta prime" conjecture site:mathdb.com
"Ferreira" "Simon" site:principia-math.com
```

The returned exact discussions were the original paper and its mirrors. Other relevant results were the November 2026 partial decomposition paper and the distinct public Conjecture 2/3 refutations described above. No matching complete resolution was located. Broad aggregator pages and inaccessible full texts are not treated as inspected papers.

## Repository history and issue audit

The local repository's `HISTORY.md`, `research/`, `README.md`, and `CONTENTS.md` were searched for the author names, source identifier, and beta-prime/convolution variants. Hits were the different Wright and Mittag–Leffler entries, not this distribution identity.

Global GitHub issue searches used the exact source identifier and author/topic combinations. Relevant matches and their available comments were fetched, including:

| Repository issue | Comments inspected | Result |
|---|---:|---|
| solved-conjectures [#87](https://github.com/1337isnot1337/solved-conjectures/issues/87) | 17 | Broad-search false positive; no beta-prime target passage. |
| solved-conjectures [#100](https://github.com/1337isnot1337/solved-conjectures/issues/100) | 9 | Wright-function result and its audit. |
| solved-conjectures [#156](https://github.com/1337isnot1337/solved-conjectures/issues/156) | 39 at retrieval | Current coordination, including other Ferreira–Simon results and our own new reservation. Our own disclosures are excluded from prior-art evidence. |
| solved-conjectures [#164](https://github.com/1337isnot1337/solved-conjectures/issues/164) | 3 | Withdrawn reciprocal q-gamma result; no beta-prime proof. |
| solved-conjectures [#167](https://github.com/1337isnot1337/solved-conjectures/issues/167) | 1 | Sokal/Domb work and a pointer to the separate stochastic-order result. |
| solved-conjectures [#169](https://github.com/1337isnot1337/solved-conjectures/issues/169) | 4 | Withdrawn Hankel-product result; no beta-prime proof. |
| trureturing [#22716](https://github.com/the-omega-institute/trureturing/issues/22716) | 2 | Conjecture 3 only, as detailed above. |
| trureturing [#25199](https://github.com/the-omega-institute/trureturing/issues/25199) | 0 | Modified-Bessel ratio result; broad-search false positive. |
| arXMCP [#513](https://github.com/chris-dare-dev/arXMCP/issues/513) | 4 | Research tooling discussion; no exact target match. |

All listed comment collections were obtained completely at the reported retrieval counts. They were searched for the precise source, names, and target phrases; pertinent matches were read in context. This does not assert that unrelated passages are mathematical inputs.

## Public proof archive checks

The complete nontruncated local trees previously fetched for PrincipiaMathOrg and trureturing were searched for Ferreira, beta-prime, the source identifier, and convolution variants. These cover PrincipiaMathOrg/math-solutions and trureturing Problems, Blueprint S0, S1, S3 Analytic, S3 Zeros, S3 Combinatorics, S3 HilbertOperators, Evidence, and X_Frontier. No matching target path was found; unrelated convolution paths were excluded by their titles. This is a path audit, not a claim to have read every proof in those archives.

Additional archives were inspected:

- [xzwwwwww/math](https://github.com/xzwwwwww/math): current complete recursive tree, 28 entries; no matching target path.
- [10m-u/open-problems-catalog](https://github.com/10m-u/open-problems-catalog): complete recursive tree, 2033 entries; the complete analysis file and all three probability/stochastic-process files were fetched and searched, as was the Ferreira source index. No beta-prime identity entry or proof was found.
- [pudim-project/pudim-ai-demo-zetalaw](https://github.com/pudim-project/pudim-ai-demo-zetalaw): full application index checked, with the exact neighboring Conjecture 2 proof read and excluded as described above.

The shared GitHub code-search endpoint was rate-limited during this research period. No failed code query is counted as negative evidence. The searches and archive reads above use successful issue/file/tree retrievals.

## Assessment

The full identity is explicitly conjectural in the readable latest primary preprint. No exact earlier settlement was found in the completed searches, relevant later papers, historical repository discussions, or examined public archives. The new proof therefore passes the source checks performed so far, subject to the stated access and indexing limits. Correctness and priority are separate assessments; `ALGEBRA_REVIEW.md` records the independent mathematical review.
