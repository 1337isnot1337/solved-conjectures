# Source scope and prior-result audit

Checked 23 November 2026. No new proof of the target is claimed.

## 2. Scope of the pinned Anthropic theorem

Pinned commit: `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`.

The locally inspected files are `vp-vnp/Statement.lean` and `vp-vnp/Solution.lean` at that commit. Relevant interfaces:

- `Statement.MainTheorem` / `Solution.mainTheorem`, using `Paper.thm_allfields`.
- `Statement.MainTheoremApprox` / `Solution.mainTheoremApprox`, using `Paper.thm_approx`.
- `Statement.Separation` / `Solution.separation`.
- `Statement.SeparationClosure` / `Solution.separationClosure`.

The permanent conclusion is over characteristic different from 2; it applies over C. There is an absolute c>0 and a threshold depending on the characteristic such that circuit size exceeds m^(c (log_2 m)^(1/3)). Constants and variable inputs count as gates. The circuit model uses sums and products with arbitrary field constants. A subtraction gate is simulated by adding a product with -1 at constant overhead. Approximation is expressed by a circuit over Laurent series whose output coefficients have the target constant term and no negative powers.

VP and its closure explicitly impose a polynomial bound on total degree. F_{2^n} has degree 2^n. A short circuit for it would not, just from its length, put this family in the VP class indexed by n. More importantly, none of these interfaces states that a short circuit for a polynomial with many integer roots yields a short circuit for the permanent. Such a reduction remains to be proved. The known implication from a tau root bound to permanent hardness cannot be reversed by citing permanent hardness.

## 3. A precise local-field obstruction

Koiran–Portier–Rojas, arXiv:1309.0486v1, Example 1.16 gives, for any fixed prime p,

```math
h_{p,1}(x)=x(1-x),\qquad h_{p,n+1}(x)=\bigl(p^{3^{n-1}}-h_{p,n}(x)\bigr)h_{p,n}(x).
```

It has degree 2^n, exactly 2^n distinct roots in Z_p, and tau(h_{p,n})=O_p(n). Its integer roots are exactly 0 and 1. The last statement is elementary: at every other integer x the initial value is negative, and a negative value stays negative under u -> (positive-u)u. The power p^(3^(n-1)) is updated by cubing, so each stage uses four arithmetic gates apart from a fixed initialization.

### Proposition 2 (finite-palette obstruction; consequence of the cited example)

For every fixed finite set S of primes there are nonzero g_n in Z[x] with tau(g_n)=O_S(n), at least 2^n distinct real roots, and at least 2^n distinct roots in Q_p for every p in S. Nevertheless g_n has at most two integer roots.

Proof. Put C_0=x and C_{n+1}=C_n^2-2. For n>=1,

```math
C_n(2\cos\theta)=2\cos(2^n\theta).
```

Thus C_n has exactly 2^n distinct real roots and tau(C_n)<=2n+1. It has no integer roots: an odd input gives an odd value throughout, and an even input gives C_n(x)=2 modulo 4 for every n>=1. Define

```math
g_n=C_n\prod_{p\in S}h_{p,n}.
```

The product is nonzero. The circuit has O_S(n) gates. Its roots include the 2^n real roots of C_n and, in Q_p, the 2^n roots of h_{p,n}. Its only possible integer roots are 0 and 1. If S is nonempty both occur. QED.

Consequently no fixed finite choice of real and p-adic completions can support a bound of the form

```math
\min_{L\in\{\mathbb R\}\cup\{\mathbb Q_p:p\in S\}}\#Z_L(f)\le(1+\tau(f))^C.
```

for all nonzero f, regardless of C. This does not rule out an adaptive choice among unboundedly many primes, and does not disprove the integer-root conjecture.

## 4. Exact direction of the supplied 2013 paper

Theorem 1.14(I) of Koiran–Portier–Rojas records the tau-conjecture implications for BSS separation and constant-free permanent hardness. Theorem 1.2 assumes a polynomial bound on the number of valuations of integer roots for every sum-product-sparse polynomial at one fixed prime, and concludes constant-free permanent hardness. Theorem 1.15 gives a related implication from the Adelic SPS Conjecture. These are sufficient conditions; the now-imported permanent result supplies none of their root-count hypotheses. General SLPs are not automatically polynomial-size SPS expressions.

The same paper's Example 1.16 refutes polynomial Q_p-root bounds for arbitrary short SLPs. Its paragraph preceding that example also warns that selecting a sufficiently large prime makes all nonzero root valuations equal, so an existentially chosen prime with few valuations is not a useful root-count premise by itself.

## 5. Prior-result and openness check

Checked current primary-source pages on 23 November 2026:

1. Bhattacharjee–Blaeser–Dutta–Mukherjee, `Exponential lower bound via exponential sums`, arXiv:2601.00387v3 (21 January 2026), full version of ICALP 2024: uses the tau conjecture as an assumption to prove exponential-sum lower bounds. It does not prove tau.
2. Santibanez-Leal, Zenodo 23980033, version 0.06 (5 November 2026), reached through the newer-version link from supplied search record 22035884: reports a finite census through nine gates and explicitly states that it makes no asymptotic decision. Its computation was not rerun here. Its claim that exponent one remains open is not adopted: Smale's 1998 Problem 4 already states that the exponent must be at least two, and BLOCK_PRODUCTS.md reconstructs the charged upper-bound argument.
3. Charles Edou Nze's `flouzzy/smale-problems` README explicitly marks problem 04 open. The entire 97-line `test_lean/Smale04IntegerRoots.lean` was inspected: it proves elementary monomial/linear/power facts, not the universal tau inequality. The Zenodo landing page 22148642 was inaccessible through the web tool, but its author's primary GitHub repository resolves the scope.

No checked source supplies the missing arbitrary-integer-root bound or the weaker all-multiples consecutive-root lower bound. This is a statement of the audit's findings, not a proof that no other publication exists.


## Primary-source links

- [Shub–Smale manuscript, dated 21 June 1994](https://janos.cs.technion.ac.il/COURSES/238900-13/Papers-1/ShubSmale-pap97.pdf), Introduction Theorems 1–2, Section 3 Theorem 1, Section 4 Propositions 1–2. The URL filename does not establish a 1997 publication date.
- [Anthropic pinned Statement.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean) and [Solution.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Solution.lean). The exact interfaces above were read. The existing BSS source audit identifies written Theorem N.5 with the approximate interface; no upstream kernel replay was done here.
- [Koiran–Portier–Rojas, arXiv:1309.0486v1](https://arxiv.org/html/1309.0486v1), Definition 1.13, Theorems 1.2, 1.14(I), 1.15 and Example 1.16.
- [Bhattacharjee–Bläser–Dutta–Mukherjee, arXiv:2601.00387v3](https://arxiv.org/abs/2601.00387v3), conditional lower bounds, not a proof of τ.
- [Santibañez-Leal finite census, Zenodo 23980033](https://zenodo.org/records/23980033), version 0.06, 5 November 2026. Its computation was not rerun.
- [Edou Nze's source repository](https://github.com/flouzzy/smale-problems) and [the inspected elementary Lean file](https://github.com/flouzzy/smale-problems/blob/main/test_lean/Smale04IntegerRoots.lean).
- [Erdős, Beweis eines Satzes von Tschebyschef, 1932](https://users.renyi.hu/~p_erdos/1932-01.pdf), the unnumbered theorem proving Bertrand's postulate.

- [Walker, Coefficient growth in square chains, arXiv:1902.11164v1](https://arxiv.org/pdf/1902.11164), Proposition 1.1, Corollary 2.1 and Proposition 2.3. This restricted-model result is discussed in ARITHMETIC.md; coefficient bitlength is not constant-free straight-line complexity.


## Additional source checks for the continued attack

- Rojas, *Additive Complexity and the Roots of Polynomials Over Number Fields and p-adic Fields*, arXiv:math/0201154v2 (2 April 2002), Theorem 1; published in ANTS 2002, LNCS 2369, pp. 506–515, DOI 10.1007/3-540-45455-1_39. GATE_COUNTS.md retains its specialization to Q_2 and the gate-count optimization only conditionally. The underlying unrestricted multivariate valuation step has an explicit counterexample; no repaired proof covering all required circuit systems was verified. This does not assert that the final numerical root inequality itself is false.
- Rojas, *A Direct Ultrametric Approach to Additive Complexity and the Shub–Smale Tau Conjecture*, arXiv:math/0304100v2 (9 April 2003), Theorem 2 and Proposition 2. The stated all-C_p valuation bound is not used: GATE_COUNTS.md gives the explicit counterexample (1+x)^16−1 and identifies the failed Newton-polygon containment under addition. This does not refute the separate 2002 fixed-field theorem. The fixed-residue-class equivalence is reconstructed independently.
- Smale, *Mathematical Problems for the Next Century*, second version 7 August 1998, Problem 4. It explicitly records the necessary exponent lower bound 2 from Strassen's results. Koiran–Portier–Rojas arXiv:1309.0486v1 explains fast multipoint evaluation immediately after Theorem 1.14. BLOCK_PRODUCTS.md gives the charged construction without importing a polynomial-multiplication black box.
- Beukers–Schlickewei, *The equation x+y=1 in finitely generated groups*, Acta Arithmetica 78 (1996), Theorem 1.1, DOI 10.4064/aa-78-2-189-199. GATE_COUNTS.md applies it only to one fixed scalar group, and proves why per-input groups or coordinatewise trace vectors do not supply that hypothesis.
- Alekseev–Grigoriev–Hirsch–Tzameret, arXiv:1911.06738v1, Definition 13 and Theorem 3.9; updated ECCC TR19-142 revision 1 (28 December 2022), Theorem 4.13 and Section 4.2.4. BOOLEAN_INVERSE.md separates the charged inverse representative, a full IPS certificate, and Boolean multilinearization.
- The pinned Anthropic internal interfaces checked for the transfer are Paper.LowDeg.lem_lowdeg, Paper.Flat.lem_balanced, and Paper.Postpone.lem_postpone. Their ordinary-degree and decomposition hypotheses are kept explicit in BOOLEAN_INVERSE.md. No quotient-algebra extension is assumed.

- Risler, *Complexité et géométrie réelle*, Séminaire Bourbaki exposé 637 (November 1984), Astérisque 133–134 (1986), Proposition 3.1, primary scanned text https://www.numdam.org/article/SB_1984-1985__27__89_0.pdf . The displayed C^(k^2) real-root theorem and preceding additive model were visually inspected. This is the source of the unconditional gate-count tradeoff.
- Rojas, arXiv:math/0110327v3, Section 2, underlying the 2002 imported arithmetic bound: GATE_COUNTS.md gives an isolated triangular-system counterexample to the unrestricted edge-count and mixed-volume proof steps. Goldstein–Rojas–Stone–Vera, DOI10.1145/3832046.3832061, published 18 August 2026, describes the tropical-genericity restriction in its primary abstract. No inaccessible full text is reported as inspected.

## Normalization, Galois and factor sources

- Qi Cheng, *Straight Line Programs and Torsion Points on Elliptic Curves*, [author manuscript](https://qcheng2023.github.io/paper/BSS.pdf), Introduction page 1. The source-transfer worker checked its rational-root formulation using 1,x programs; the root worker's subsequent fetch returned an access error. NORMALIZATION.md proves the explicit charged reductions independently and claims no priority for the formulation.
- J. S. Milne, *Algebraic Number Theory*, version 3.08 (19 July 2020), [Theorem 8.31](https://jmilne.org/math/CourseNotes/ANT.pdf). Only the existential realization of Frobenius conjugacy classes and their densities is imported. The common-fixed-point selection lemma is proved in CIRCUIT_HISTORY.md. No effective prime-size bound is imported.
- Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, [arXiv:1812.06828v1](https://arxiv.org/html/1812.06828v1), Theorem 1.3. This is the 17 December 2018 version correcting Theorem 5.7 of the 2004 publication. Its approximate low-degree-factor bound, expressed through exclusion complexity, is applied in INVERSE_TESTS.md only to a factor of a nonzero small circuit polynomial. The bound does not provide a cheap Boolean quotient operation.
- The same version's Lemma 3.3, Proposition 3.4 and Lemma 3.6 are the precise interfaces for ORACLE_FACTORS.md. The new proof supplies the finite-jet replacement for arbitrary unary gates, a formal-unit regularity argument and explicit scalar-gate accounting. Generic-point existence and the factor-reconstruction framework are attributed to the source, rather than presented as a new lower-bound method.
- Dutta–Saxena–Sinhababu, *Discovering the roots: Uniform closure results for algebraic classes under factoring*, [2022 JACM author manuscript](https://www.cse.iitk.ac.in/users/nitin/papers/factor-closure-jacm.pdf), Theorems 1 and 2. The exact factor bound retains the radical degree, and the alternative modular division can have a nonunit denominator. For a multiple of F_N the radical degree is at least N.
- Bürgisser, *Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*, [arXiv:2606.25121v2](https://arxiv.org/html/2606.25121v2), 19 October 2026, Theorem 1.1, Conjecture 1.1 and Section 1.4. The theorem's implication runs from the stated BSS separation to constant-free Valiant separation. The converse from border hardness is a conjecture in this source; extension of resultant hardness to all nonzero multiples is identified as an unresolved step.
- Phillipson–Rojas, *Fewnomial Systems with Many Roots, and an Adelic Tau Conjecture*, [arXiv:1011.4128v5](https://arxiv.org/html/1011.4128v5), 6 November 2012, Example 2.5, Theorem 2.7 and the subsequent adelic conjecture. The conjecture is for restricted SPS expressions. Example 2.5 constructs many roots at any finite preselected palette of p-adic places and does not produce many integer roots.

## Anchored extraction and later arithmetic tests

- Dutta–Jindal–Pandey–Sinhababu, *Arithmetic Circuit Complexity of Division and Truncation*, CCC 2021, LIPIcs 200, article 25, [published version](https://drops.dagstuhl.de/storage/00lipics/lipics-vol200-ccc2021/LIPIcs.CCC.2021.25/LIPIcs.CCC.2021.25.pdf). Theorem 13 gives the univariate low-degree-divisor bound and Theorem 18 the multivariate extension. Problem 1 and Section 4 retain the unrestricted division-elimination question, including an exponentially large monomial divisor. ANCHORED_DIFFERENCES.md supplies its own charged quotient-matrix proof for the needed split divisor.
- Mazur, *Modular curves and the Eisenstein ideal*, Publications Mathématiques de l'IHÉS 47 (1977), 33–186, [primary text](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), Theorem (7′) on printed page 35. Rational torsion-point orders are at most ten or exactly twelve. ELLIPTIC_SPECIALIZATIONS.md imports this restriction with its field hypothesis.
- Stange, *Integral Points on Elliptic Curves and Explicit Valuations of Division Polynomials*, Canadian Journal of Mathematics 68(5) (2016), 1120–1158, DOI [10.4153/CJM-2015-005-0](https://doi.org/10.4153/CJM-2015-005-0). The published Propositions 2.1 and 2.2(i),(v) give the zero, weight and divisibility identities used in the elliptic specialization proof. The corresponding arXiv version is 1108.3051v4 (29 December 2014); the published numbering is used.
- Győry–Hajdu–Tijdeman, *Irreducibility criteria of Schur-type and Pólya-type*, Monatsh. Math. 163 (2011), [author manuscript](https://math.unideb.hu/sites/default/files/inline-files/ght20.pdf), Introduction and Theorem 4.1. The classical Schur history is cited in HARMONIC_FAMILIES.md; the required square-plus-one lemma is proved there directly and is not claimed as original.
- Jones–Levy, *Eventually stable rational functions*, [arXiv:1603.00673v2](https://arxiv.org/pdf/1603.00673v2), 2 May 2017, Definition 1.1, Conjecture 1.2 and Theorem 1.3; DeMark–Hindes–Jones–Misplon–Stoll–Stoneman, *Eventually stable quadratic polynomials over Q*, New York J. Math. 26 (2020), 526–561, [published text](https://nyjm.albany.edu/j/2020/26-25v.pdf), Theorem 1.5 and Conjecture 1.7. These provide context for HARMONIC_FAMILIES.md, not a uniform theorem for arbitrary rational quadratic sequences. The fixed-integer-coefficient factor counts used there are proved in the note.
- Walker, [arXiv:1902.11164v1](https://arxiv.org/pdf/1902.11164), Propositions 1.1, 2.3 and 3.2, Lemma 3.1, and Corollaries 2.1 and 3.3. DENSE_SQUARE_CHAINS.md proves its cofactor-sensitive extensions separately. The imported full-splitting coefficient-growth bound is not applied to partial splitting, and coefficient bit length is not substituted for constant-free circuit length.
- Fulton, *Algebraic Curves*, [electronic edition of 28 January 2008](https://users.math.msu.edu/users/magyarp/Math419H/Fulton-Alg-Curves.pdf), Section 5.3, Corollary 3, printed page 58. Its Bézout consequence is the only external intersection theorem used for the quadratic-fold depth estimate. The convex-arc lattice estimate and all special-curve reductions are proved in FOLD_CHAINS.md.

The matrix-power, rational-level and fold restrictions are not cited as known bounds for arbitrary SLPs. The new notes reconstruct their proofs and separate the models. The earlier source audits and the open target classification remain unchanged.

## Powered extraction, radical recovery and adaptive anchors

- Kaltofen, *Single-Factor Hensel Lifting and its Application to the Straight-Line Complexity of Certain Polynomials*, STOC 1987, pp. 443–452, [primary paper](https://userpages.cs.umbc.edu/phatak/691a/supl/hensel-kaltofen-1987.pdf), Theorems 1–3. Theorem 2 retains the degree of the extracted root polynomial. Section 2 already gives the Kronecker-substitution permanent obstruction for accelerating arbitrary high derivatives; POWERED_COFACTORS.md uses the same coefficient encoding for finite differences and states its symbolic compiler quantifiers explicitly.
- Bürgisser–Jindal, *On the Hardness of PosSLP*, SODA 2024, [author text](https://goravjindal.github.io/assets/pdf/posslpsoda2024.pdf), Conjecture 1.1 and Section 5, especially Conjecture 5.2 and Remark 5.1. These distinguish general radical extraction from ordinary low-degree factor extraction. COFACTOR_RECOVERY.md does not assume either conjecture: it retains the radical degree of the unknown cofactor and proves its scalar accounting directly.
- Beukers–Schlickewei, the 1996 paper cited above, Theorem 1.1 in the [author text dated 8 January 2007](https://webspace.science.uu.nl/~beuke106/s-units.pdf). INTEGER_GATE_BUDGETS.md applies it to the single fixed group generated by prime supports of two chosen evaluations. Its bound is 2^(8r+8) for rank r.
- Fan–Pollack, *The maximal order of the shifted-prime divisor function*, [arXiv:2510.14167v1](https://arxiv.org/html/2510.14167v1), 15 October 2025, Theorem 1.1, equation (1.4). Only the unconditional lower bound for infinitely many n is imported. Combined with the proved fixed-divisor identity, it defeats every polynomial raw-prime-support bound for adaptively chosen evaluations of short monic squarefree polynomials.
- Győry–Hajdu–Tijdeman, the 2011 paper cited above, Theorem 4.1 and Remark 4.1. The exact threshold is 2d(c)(2+floor(log₂|c|)), with d(c) the positive divisor count. The unit case and its four-point sharpness are proved independently in INTEGER_GATE_BUDGETS.md.

## Explicit square-chain construction

- Andrew Bremner, *When Can (((X²−P)²−Q)²−R)²−S² Split into Linear Factors?*, Experimental Mathematics 17(4) (2008), 385–390, DOI [10.1080/10586458.2008.10128879](https://doi.org/10.1080/10586458.2008.10128879), [primary article text](https://scispace.com/pdf/when-can-x-2-p-2-q-2-r-2-s-2-split-into-linear-factors-3nneuzjm0b.pdf). Equations (2–2), (2–7), the inverse map following (2–7), and the paired transformation on printed page 388 supply the first degree-16 family. SQUARE_CHAIN_EXTENSION.md reconstructs its charged constants and proves the additional rational-prefix obstruction with explicit exact certificates. The paper's infinite families have fixed degree; they are not unbounded-root counterexamples to tau. No claim of priority is made for the source's construction.


## Second-family scope and source refresh

- Bremner, the 2008 primary article cited above, Section 3, printed pages 389–390, supplies the second plane cubic and its fixed-degree root representatives. SQUARE_CHAIN_SECOND.md derives an explicit birational map and proves its additional prefix-collision statements. The first and second families are not asserted to exhaust rational square chains.
- [SOURCE_REFRESH_2026.md](SOURCE_REFRESH_2026.md) records the inspected 2026 factorization, border-factor, dense-GCD and ideal-extraction statements with theorem numbers and versioned primary links. It also inspects the actual TeX and Lean scope of a recent tau-related preprint. No checked source supplies the unrestricted root bound or a constant-free, degree-independent extraction from all consecutive-root multiples.
- [SELECTION_SCOPE.md](SELECTION_SCOPE.md) supplies primary references for the factorial/primorial powering relation, including Cheng's 25 May 2004 author version, Lemma 1, and Markström, Integers 15 (2015), A6. Its quantitative difference-group comparison cites the inspected Alon–Solymosi author version, Theorems 1 and 11. The new implications are proved directly in the note.
