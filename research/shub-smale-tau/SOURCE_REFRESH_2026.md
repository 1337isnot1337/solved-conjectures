# Primary-source refresh: 24 November 2026

Status: source audit, not a new mathematical result. This check found no primary source proving or disproving the full integer-root tau conjecture, and no theorem supplying the missing unrestricted constant-free extraction from an arbitrary multiple of a consecutive-root polynomial. This is a report of the sources located and inspected, not an exhaustive theorem about the literature. The repository's pinned Anthropic theorem remains a standing premise and was not re-audited.

## 1. Recent tau-related claims

### Exponential sums: conditional direction only

Bläser, Bhattacharjee, Dutta and Mukherjee, *Exponential lower bound via exponential sums*, arXiv:2601.00387v3 (21 January 2026), **Theorem 1.3**, formally **Theorem 6.4**, assumes the tau conjecture to obtain an exponential lower bound for an explicit exponential-sum family. It does not prove tau, and the implication cannot be reversed merely because a lower bound is available elsewhere.

Primary text: <https://arxiv.org/html/2601.00387v3>.

### Finite census: explicitly no asymptotic conclusion

Felipe Santibañez-Leal, *The bottom of the Shub-Smale tau conjecture*, Zenodo 22035884, version 0.03 (20 August 2026), reports a computation for programs of length at most eight and explicitly disclaims an asymptotic result. This older record was revisited in the refresh; the earlier audit in [SOURCES.md](SOURCES.md) inspected version 0.06, dated 5 November 2026, with a nine-gate census and the same explicit absence of an asymptotic conclusion. The version 0.03 initial constants are free -1, 0, 1, so its precise finite-length convention also differs from the repository's initial 1, x convention. The computation itself was not independently reproduced in this audit and is not imported as a proved result.

Primary record: <https://zenodo.org/records/22035884>.

### EDOU NZE: actual source and Lean statements do not claim the full bound

The title *On the Number of Integer Zeros of Straight-Line Polynomials and Smale's 4th Problem* was checked against the author's actual TeX and Lean files, rather than its search-result description. The inspected repository snapshot is commit `ab342bab01cdc0fc50c174c5fab65bfa1f1059d8` (9 September 2026):

- [TeX](https://github.com/flouzzy/smale-problems/blob/ab342bab01cdc0fc50c174c5fab65bfa1f1059d8/preprints/04-Smale-Integer-Polynomial-Roots/smale_integer_roots.tex), blob `d78779df7b0cf51674a3eebfc76bfa085af6c018`.
- [Lean](https://github.com/flouzzy/smale-problems/blob/ab342bab01cdc0fc50c174c5fab65bfa1f1059d8/test_lean/Smale04IntegerRoots.lean), blob `47c098dfeb85c06070444d7aa3c58241e3023cdb`.

The TeX labels the tau assertion as a conjecture and states the BSS separation conditionally. The Lean file contains seven elementary monomial, linear, power, positivity, and integer-exponent lemmas. It contains no straight-line-program model or universal polynomial bound on integer roots. The source was inspected, not compiled. The advertised certification therefore supplies no proof of the research target. This audit imports none of the exposition's broader claims.

## 2. Factor and extraction results checked

Here `s` is circuit size, `D` is the input polynomial's degree, and `d` is the degree of the factor sought. These parameters must not be interchanged.

### November 2026 whitebox-PIT factorization

Bhattacharjee, Kumar, Rai, Ramanathan, Saptharishi and Saraf, *Deterministic factorization of constant depth circuits from whitebox PIT*, ECCC **TR26-310**, 6 November 2026:

- **Theorem 1.1** is the informal result; **Theorem 4.1** gives the formal reduction over the rationals. Its running time and oracle circuit sizes depend polynomially on the input degree `D`, as well as size and number of variables.
- The proof explicitly interpolates coefficients of the specialized univariate polynomial and Hensel-lifts to precision `2D^2+1`. This is not a poly(s, log D) extraction.
- **Theorem 1.2** computes a base-field kernel for a polynomial matrix, also with polynomial dependence on entry degree. It does not provide a compressed exponential-dimensional root filter.

This is a new preprint result about removing a blackbox-PIT requirement. Its stated scope does not change the present gap, even if used in full.

Primary text: <https://eccc.weizmann.ac.il/report/2026/310/download/>. Primary record: <https://eccc.weizmann.ac.il/report/2026/310/>.

### Formula and constant-depth closure; border factor closure

The same six authors, *Closure under factorization from a result of Furstenberg*, arXiv:2506.23214v1, **Theorem 1.1**, gives factor circuits/formulas of size polynomial in `s,D,n`, where `D` is the degree of the input polynomial. The author's publication list identifies the paper with STOC 2026.

Its **Theorem 6.2** restates and reproves Bürgisser's border factor theorem: in characteristic zero, a degree-`d` factor of a size-`s` circuit has border size polynomial in `s,d`, independent of `D`. This genuinely allows arbitrary cofactor support, but in the arbitrary-scalar border model. For the factor `F_N`, its bound is polynomial in `N`, not in `log N`. It does not supply an exact constant-free circuit for `F_N`.

Primary text: <https://arxiv.org/html/2506.23214v1>. Publication list: <https://somnathbtcjee.github.io/publications.html>.

### Low radical degree

Dutta, Saxena and Sinhababu, *Discovering the roots: Uniform closure results for algebraic classes under factoring*, inspected author manuscript (2022), **Theorem 1**: if `f=u_0 u_1` is nonzero and `size(f)+size(u_0)<=s`, every factor of `u_1` has size polynomial in `s+deg(rad(u_1))`. This removes multiplicity from the controlling parameter, but not the number of distinct roots. The paper's general factor conjecture remains open; its **Theorem 2** introduces a non-unit modular division operation whose elimination is left open.

Primary manuscript: <https://www.cse.iitk.ac.in/users/nitin/papers/factor-closure-jacm.pdf>.

### Dense-input GCD does not give compressed GCD

Bhattacharjee et al., *Constant-Depth Circuits for Polynomial GCD over Any Characteristic*, CCC 2026, **Theorem 1**, formally **Theorem 20**, takes the coefficient vectors of degree-bounded univariate polynomials as input. Its size is polynomial in their degrees. It supplies neither a circuit-size-only GCD bound for exponentially high-degree SLP inputs nor a degree-independent root-selection operation. In particular, its root filters are expressed through symmetric functions with degree-sized coefficient lists.

Primary text: <https://drops.dagstuhl.de/storage/00lipics/lipics-vol383-ccc2026/html/LIPIcs.CCC.2026.16/LIPIcs.CCC.2026.16.html>.

### Determinantal and Pfaffian ideals

Dey and Guo, *Debordering Closure Results in Determinantal and Pfaffian Ideals*, ITCS 2026, **Theorem 6** (formal **Theorem 45 / Corollary 46**) extracts a smaller determinant from a nonzero member of a determinantal ideal with an oracle circuit of size polynomial in matrix dimensions and `D`. **Theorem 7** is the Pfaffian analogue. The input-degree dependence is explicitly left open in Section 4.

Their **Theorem 4**, importing Andrews–Forbes STOC 2022 **Theorem 1.1**, gives a degree-independent *border* oracle extraction for these special ideals. No reduction from the promise `F_N | H` to the required determinantal-ideal setting, with a hard target and polynomial overhead in `log N`, has been proved here. The existence of that ideal-specific theorem cannot supply this missing reduction.

Primary text: <https://drops.dagstuhl.de/storage/00lipics/lipics-vol362-itcs2026/html/LIPIcs.ITCS.2026.49/LIPIcs.ITCS.2026.49.html>.

### Constant-free radical extraction remains an explicit conjectural import

Bürgisser and Jindal, *On the Hardness of PosSLP*, SODA 2024, **Conjecture 1.1** asks for polynomial-size constant-free radical circuits with a randomized construction. The text notes that a nonzero integer multiple would suffice for its application. **Conjecture 5.2** is the related radical-complexity conjecture; **Theorem 5.1** retains dependence on the sought factor's degree and multiplicity. None may be substituted for an unconditional degree-independent radical theorem.

Primary text: <https://goravjindal.github.io/assets/pdf/posslpsoda2024.pdf>.

## 3. Consequences for the extraction work already proved here

Let `H=F_N Q` be nonzero, where `F_N=product_{j=1}^N (x-j)` and `tau(H)=s`.

| Proved operation | Parameter that still controls its cost |
| --- | --- |
| Anchored finite-difference extraction | Degree of `Q` |
| Powered-cofactor extraction with supplied bases | Sum of the degrees and charged circuit sizes of those bases |
| Unknown-cofactor recovery by signed logarithmic derivatives and Padé reconstruction | Number of distinct complex roots of `Q` |
| Exact quotient by a supplied monic small-degree polynomial using a quotient-module matrix | Degree of that divisor |
| Functional Boolean inverse | Short representative exists, but its canonical multilinear form, weighted trace, or Boolean-ideal membership certificate is not thereby computed |
| General border factor extraction | Degree of the factor sought; arbitrary field scalars are allowed |

The first three rows handle large multiplicities under stated support bounds. No existing proof bounds those support parameters by a polynomial in `s` for a minimal arbitrary consecutive-root multiple. Nor does minimality alone permit removal of a hidden factor: a shorter circuit for the relevant quotient still has to be constructed or proved to exist.

The general border theorem does apply to arbitrary cofactor support, but `deg(F_N)=N`. A lower-degree hard polynomial would be useful only after a separate polynomial-cost construction producing it from `H`. The repository's unary-oracle/factor lemma explains why ordinary low-degree factor extraction from boundedly many arithmetic compositions is not that missing construction. The Boolean quotient, trace, or exact root-selection step remains unresolved. None of the newly checked papers eliminates it.

Even unrestricted extraction for the consecutive family would still need a lower bound for the resulting family and a quantified transfer to settle the separate BSS route. The full tau conjecture additionally requires arbitrary configurations of integer roots.

## 4. Fully split square chains after Bremner

The search also checked for later constructions of fundamental square chains of depth at least five. It found no such construction. A later primary status statement than Bremner 2008 is Shawn Walker's author post of **16 September 2024**, which reports examples through depth four and asks whether larger ones exist. This dated statement, together with the bounded search, should replace any unsupported assertion of an exhaustive 2026 status.

Primary author post: <https://shawn-walker.net/square-chain-polynomials/>. Walker's arXiv:1902.11164v1, **Proposition 1.1**, proves that a fully split depth-`k` chain with nonzero final coefficient has at least `2^(k-1)+1` distinct roots. **Corollary 3.3** gives a coefficient-height restriction; it is not a nonexistence theorem for depth five or a constant-free complexity lower bound of the strength needed here. Primary paper: <https://arxiv.org/pdf/1902.11164>.

For clarity, rational chains are not a different existence escape. If `P_j=P_{j-1}^2-c_j`, `P_0=x`, has rational coefficients and rational roots, choose a common denominator `D` for the coefficients and roots and set `Q_j(x)=D^(2^j) P_j(x/D)`. Then `Q_0=x` and `Q_j=Q_{j-1}^2-D^(2^j)c_j`, so this is an integer chain with the same depth and distinct-root count. This identity proves existence transfer only. The constants `D^(2^j)c_j` still need charged short programs to yield a tau counterexample. No unbounded-depth family with that charged complexity was found.
