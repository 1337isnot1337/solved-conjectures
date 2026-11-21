# Novelli–Thibon: source and priority audit

Audit date: 21 November 2026. Target: Conjecture 5.7 of *Noncommutative chromatic quasi-symmetric functions, Macdonald polynomials, and the Yang–Baxter equation*. This records a bounded public-source search, not a proof that no unpublished or unindexed argument exists.

## Exact target and versions

- [arXiv:2502.09072v1](https://arxiv.org/html/2502.09072v1), submitted 13 February 2025: Conjecture 5.7, equations (87)–(88). The conjecture concerns the multiplicity-weighted product of monomials in each Schur coefficient of the modified multi-t function.
- [arXiv:2502.09072v2](https://arxiv.org/html/2502.09072v2), 4 November 2025: same conjecture and numbering; Definition 5.3, equation (57), defines the modified function used in the proof. Lemma 4.2, equation (35), gives its needed LLT expansion. The manuscript's section 6.5 now credits Abreu–Nigro for a separate modular-law observation; this does not concern the monomial-product conjecture.
- Published version: JCTA 220 (May 2026), article 106130, [DOI 10.1016/j.jcta.2025.106130](https://doi.org/10.1016/j.jcta.2025.106130). The publisher's public abstract/metadata were inspected; direct full text returned HTTP 403. The full author arXiv v2 was accessible.
- The source's exponent is printed d_mu, but the Schur coefficient is indexed by lambda. Its own displayed example for s_321 in H_222 uses exponent 8, which is d_321; d_222 is 3. The proof explicitly corrects this index to d_lambda and establishes the intended general identity. A typographical counterexample is not claimed.
- The source's separate Conjecture 5.4 concerns nonnegativity of Schur coefficients. It is not part of the result proved here. The monomial product makes algebraic sense with signed integer multiplicities and our proof does not assume 5.4.

## Underlying published mathematics

1. Haglund and Wilson, [*Macdonald polynomials and chromatic quasisymmetric functions*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v27i3p37/pdf/), EJC 27(3) (2020), P3.37, DOI 10.37236/9011, arXiv:1701.05622. Definitions 1–3 and 14 fix the French diagram, top-to-bottom/left-to-right reading order, attacking pairs, legs and arms, and optional vertical edges. These definitions were separately checked by the independent reviewer. The graph expansion is credited, not claimed as new.
2. Haglund–Haiman–Loehr, *A combinatorial formula for Macdonald polynomials*, JAMS 18 (2005), 735–761, is the origin of the filling formula. The present proof derives the precise modified multi-t version directly from Novelli–Thibon's Definition 5.3, avoiding dependence on ambiguous untilded conventions in that article.
3. Lee–Oh–Rhoades, [*Haglund's conjecture for multi-t Macdonald polynomials*, arXiv:2203.04590v3](https://arxiv.org/pdf/2203.04590), 14 February 2023, Discrete Mathematics 346 (2023), 113360. Its multi-t definition attaches parameters to individual cells, specialized by setting them equal, unlike Novelli–Thibon's grouping by leg labels. Theorem 1.1 is a two-row LLT identity; Theorems 4.1–4.2 are stretching-specialization identities. Section 5.2 discusses possible tableau statistics. No first-derivative or monomial-product theorem was found. This paper predates the target and does not state the target conclusion.
4. The one-comparison word identity and the one-cell Pieri rule are standard elementary inputs, proved or explained in the manuscript. The proposed deduction is the universal first-order parameter identity and hence the monomial product for every Schur coefficient.

## Discovery indexes

- [MathDB 367096](https://mathdb.com/p/367096/monomial-product-property-for-multi-t-macdonald-coefficients): open label, no posted solutions when inspected. The page reproduces the indexing error. Its additional claimed source arXiv:1705.10957 is wrong: that identifier is Zhibek Kadyrsizova's *Nearly Commuting Matrices*, an unrelated commutative-algebra paper. That cross-reference was checked against the actual arXiv record and excluded as evidence.
- [Emergent Mind, Product formula for coefficients of multi-t Macdonald polynomials](https://www.emergentmind.com/open-problems/product-formula-multi-t-macdonald-coefficients): still presents the assertion as an open problem and points to the original paper. It also reproduces the indexing typo. No resolution was linked.
- SymCat's [modified Macdonald page](https://www.symmetricfunctions.com/macdonaldH.htm), including the current source at `PerAlexandersson/symmetricfunctions.com` commit `d1bf822ab4c05b5a62b7b4d65e5d9439b55071e0`, was inspected for the target and related recent developments. It lists other Macdonald conjectures and resolutions, without a matching monomial-product resolution.

Index labels are only discovery information. They are not relied upon to override an earlier proof.

## Web searches

Both built-in search engines were used. Searches included these exact phrases or combinations, followed by inspection of relevant primary results:

- Novelli Thibon monomial product conjecture proof;
- Novelli Thibon Conjecture 5.7;
- multi-t Macdonald derivative;
- Macdonald monomial-product conjecture;
- Kostka Macdonald first moments;
- Macdonald sum of the exponents;
- Macdonald first-order e_2;
- Macdonald monomial product Novelli;
- multi-t Macdonald proof monomial;
- Kostka-Macdonald derivative 1;
- the target title and arXiv identifier;
- related Haglund multi-t identities and the authors' publication listings.

No earlier proof or disproof of the intended all-partition monomial-product formula was found. Search results about Macdonald positivity, stretching, and generic Hecke traces were distinguished by their actual statements.

## Global GitHub searches and inspected hits

Global GitHub code searches supplemented web searches. This is necessary: during this campaign, author-name searches found prior proofs missed by arXiv-identifier searches.

| Query | Result and follow-up |
|---|---|
| `"2502.09072"` | Six hits, consisting of feed records and numeric false matches; no mathematical proof hit. One initial request timed out, then the repeat completed. |
| `"Novelli" "Thibon" "monomial" "conjecture"` | 91 hits, largely Sage references, bibliographies, feeds, and corpus sources. All potentially relevant proof/corpus titles were inspected; listed below. |
| `"Macdonald" "monomial-product"` | One hit, an unrelated Mathematica unit-test identifier in `PerAlexandersson/Mathematica-packages`, `Tests/SymmetricFunctions.wlt`, commit `237b9b8b30cb6f88c546814688a09dd7f41c9246`. Its nearby code tests multiplication in a monomial basis, not the conjecture. |
| `"Macdonald" "monomial product"` | Nine hits, software and unrelated algebra files; no matching conjecture proof. |
| `"Thibon" "derivative" "Macdonald"` | Primarily Sage code/references and lecture sources. No matching result found among plausible mathematical hits. |
| `"Novelli" "monomial" repo:the-omega-institute/trureturing-source-theories` | No hits. |
| `"Novelli" "Macdonald" repo:VladimirReshetnikov/ProveIt` | No hits. |
| `"Thibon" "monomial" repo:VladimirReshetnikov/ProveIt` | One unrelated report on ordered tuple relations, inspected. |
| `"Macdonald" "monomial-product" extension:md` | No hits. |

An overbroad `"Macdonald" "first moments"` search also produced a plausible-looking `bjbraams/lean-CKMA/GAPS-REVIEW.md` hit. Inspection showed that “first moments” referred to Wasserstein spaces and “Macdonald” to Atiyah–Macdonald; it is unrelated. No Lean work was performed.

The following corpus hits were fetched at commit `3b9207c03d9dc146f393f68bcb683bbc4583979a` of `AlexenderSokolov/cross-theory-formal-database` and screened by title and target-related passages:

- `editable-corpus/sources/188271/source0.tex`: *Lexical tableaux and quasisymmetric functions*;
- `editable-corpus/sources/207712/source0.tex`: Lascoux operators, parking functions, real zeros;
- `editable-corpus/items/943_author_proof.tex`: odd single-part generators of the K-theoretic peak algebra;
- `editable-corpus/sources/179906/source0.tex`: *The peak algebra in noncommuting variables*;
- `editable-corpus/sources/186201/source0.tex`: *The noncommutative KP hierarchy and its solution via descent algebra*;
- `editable-corpus/sources/204743/source0.tex`: antipodes of q-quasisymmetric and noncommutative quasisymmetric functions;
- `editable-corpus/sources/185532/source0.tex`: *A formula for the Jack super nabla operator*.

None states this conjecture or proves the parameter first-moment identity. The `VladimirReshetnikov/ProveIt` hit is `SetTheory/Cardinals/docs/reports/generating-functions-and-asymptotics/oeis-sequence-asymptotics/a173217-ordered-tuple-relations/article.tex`, titled *Exact pole sectors and integer recovery for ordered tuple relations*; it is unrelated.

## Repository duplication and review

The current repository's HISTORY was searched for Novelli, Thibon, multi-t, and monomial-product; no previous entry was found. Its issue search for Novelli returned no matches before research issue #180 was created.

The verifier regenerates Schur coefficients via permutation fundamental expansions and an independent Kostka conversion. It checks the first-moment formulas for 209 partition pairs of sizes 1–6 and exactly reproduces the full s_321 coefficient printed in the primary source. These are convention checks, not the all-size proof.

The graph/number-theory reviewer independently checked the exact primary graph definitions, the optional-edge reduction, the reading-order comparison identity, both parameter counts, and the Pieri interpretation, reporting no mathematical gap. The root review is separate. This is internal mathematical review, not external peer review.

## Hook-coefficient supplement

The final unnumbered sentence after Conjecture 5.7 proposes the hook coefficient as the elementary symmetric function of the cell alphabet with its distinguished weight 1 removed. Section 6 of the proof derives this for all partitions from the Carlsson–Mellit evaluation in the source's Theorem 3.2, equation (20), and the optional-edge expansion. The evaluation theorem and its incoming-degree convention are credited explicitly. This is a supplement within the same named package, not an additional resolution count.

The independent reviewer checked Theorem 3.2 directly, the inversion in the modified LLT convention, the omega and plethystic signs, the local factorization and the reversal of leg labels within each column. The exact verifier also matches all 135 hook coefficients for input partitions of sizes 1–6. The hook supplement has the same bounded priority limitations as the package; no separate exclusive-priority assertion is made for this consequence of the cited evaluation.

## Additional global issue search

On 21 November 2026 the global GitHub issue query `"Novelli" "Thibon" "conjecture"` returned this repository's #180/#156 and [the-omega-institute/trureturing #24901](https://github.com/the-omega-institute/trureturing/issues/24901). The root reviewer read that issue's full body and comments; the combinatorics lane independently inspected its exact target and its Novelli–Thibon references. The issue concerns L. Edson Jeffery's Chebyshev square-sum product in OEIS A052750. Its Novelli–Thibon citation is their unrelated 2014 combinatorial-count paper arXiv:1403.5962. It neither states nor resolves the 2025 multi-parameter Macdonald monomial-product Conjecture 5.7. This is an additional bounded negative check, not an exhaustive priority guarantee.
