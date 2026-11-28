# Brualdi's cohesive-matrix conjecture: source audit

Research date: 20 November 2026 (America/Chicago). This audit concerns the named family

```math
C_n=J_n-I_n+E_{nn},\qquad n\geq4,
```

where J_n is the unnormalized all-ones matrix. Relabeling the free diagonal position from 1 to n does not change the problem. The intended assertion is that C_n is cohesive in every such order. This would settle a named subsidiary conjecture recorded on Minc's Problem 14 page, not characterize all cohesive supports.

## Current scope and prior results

1. **Lavi's current Problem 14 page.** Directly refreshed at https://yair-lavi.com/mincs-list/problem-14/index.html . It records Song's non-barycentricity result, the Hong–Jun–Kim–Song proof for C_4, and a newer exact proof for C_5. It does not claim the general family is cohesive. The complete Problem 14 remains open.

2. **Cheon–Wanless survey.** G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, Linear Algebra and its Applications 403 (2005), 314–342. Public author copy: https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf . The discussion of Problems 14 and 15 explicitly distinguishes Song's non-barycentricity theorem from the still-open cohesiveness assertion for orders at least five. This is a historical status source; the current C_5 advance must be added separately.

3. **Brualdi's original paper.** R. A. Brualdi, *An interesting face of the polytope of doubly stochastic matrices*, Linear and Multilinear Algebra 17 (1985), 5–18, DOI 10.1080/03081088508817637. The current Minc page and the survey attribute the named family conjecture to this paper. Its full text was not obtained in this audit; no additional theorem is inferred from its title or citations.

4. **Song's 1995 paper.** S.-Z. Song, *A conjecture on permanents*, Linear Algebra and its Applications 222 (1995), 91–95, DOI 10.1016/0024-3795(93)00286-9. An author-attributed full-text upload is indexed at https://www.academia.edu/27485050/A_conjecture_on_permanents . The theorem concerns non-barycentricity of C_n. It does not prove general cohesiveness. OCR can turn the inequality n>=4 into n>4, so the threshold is also checked against the current Minc page and the 2005 survey.

5. **Hong–Jun–Kim–Song.** S.-M. Hong, Y.-B. Jun, S.-J. Kim and S.-Z. Song, *A cohesive matrix in a conjecture on permanents*, Bulletin of the Korean Mathematical Society 33 (1996), 127–133. The primary bibliographic record was found, but full text was not retrieved. The scope C_4 is supported by the survey and Lavi's page; no all-order conclusion is attributed to this paper.

6. **Minc's diagonal-zero paper.** H. Minc, *Minimum permanents of doubly stochastic matrices with prescribed zero entries on the main diagonal*, Linear Algebra and its Applications 201 (1994), 135–154, DOI 10.1016/0024-3795(94)90111-2. Publisher record and abstract: https://www.sciencedirect.com/science/article/pii/0024379594901112 . Its minimum formula for the face with three prescribed diagonal zeros is explicitly conditional on a symmetric minimizer. It cannot be used to assume that a C_n minimizer is symmetric, or to eliminate asymmetric boundary zeros. The full paper was not obtained in this audit.

7. **The PSW family is different.** Pula–Song–Wanless (2011), Song (2013), and Cheon–Song (2024) treat faces with a large identity block and repeated cross-block supports. Their row/column averaging steps do not apply to C_n, whose forbidden top diagonal positions differ from row to row. Cheon–Song's current publisher record and full public paper explicitly concern their stated identity-block family: https://dml.cz/bitstream/handle/10338.dmlcz/152279/CzechMathJ_74-2024-1_15.pdf . A repaired PSW proof does not by itself settle Brualdi's conjecture.

Searches used both web engines, including exact titles, the phrases “Brualdi cohesive C_n”, “cohesive diagonal permanents”, and fresh 2026 queries. No general resolution or prior DAG-exclusion theorem was located. This is a bounded source audit, not a claim that every historical or inaccessible text has been inspected.

## Strict Alexandrov–Fenchel input and attribution

For a nonnegative (n−2) by n matrix R, define

```math
f_R(x,y)=\mathop{\mathrm{per}}\begin{pmatrix}x\\y\\R\end{pmatrix}.
```

The precise nondegeneracy criterion used in the team draft is that f_R has signature (0,1,n−1) when R has no zero rectangle whose row count plus column count is at least n−1. In that case equality in Alexandrov–Fenchel for nonzero nonnegative x,y forces proportionality, provided f_R(y,y)>0. Stochastic x,y are then equal.

Two primary references support this input:

- A. A. Panov, *On the signature and kernel of the bilinear form associated with a permanent*, Russian Mathematical Surveys 39:6 (1984), 219–220, DOI 10.1070/RM1984v039n06ABEH003190. Public English PDF: https://www.mathnet.ru/links/a301ed41849e632a177821beeb0c2fb0/rm2512_eng.pdf . The indexed primary PDF text includes both the signature discussion and the exact equality criterion: the difference between x and its f_R-projection onto y lies in the kernel. Direct PDF opens failed during this agent's audit, while primary full-text search extraction succeeded; another team agent opened the same PDF.
- Ravindra Bapat, *A matrix of permanents*, Linear Algebra and its Applications 56 (1984), 57–62, DOI 10.1016/0024-3795(84)90113-7. Publisher record: https://www.sciencedirect.com/science/article/pii/0024379584901137 . Its abstract independently states the nonsingularity criterion and its application to equality in Alexandrov's inequality.

Panov's note added in proof credits the latter paper. The name is rendered “Barat” in one OCR extraction; the publisher identifies the author as Ravindra Bapat. Bibliographies should use Bapat.

This input provides rigidity after the required zero-rectangle exclusion. It does not, by itself, rule out an acyclic graph of additional zeros in the full minimizing matrix.

## A precise obstruction to a weaker DAG argument

At a putative minimizer, equality of the free-row cofactors means that every maximal permanent of the top (n−1) by n rectangle is the same. That condition alone, even together with strictly positive completion and the strong zero-rectangle condition, does not exclude a DAG of extra zeros.

For n=5, take

```math
R=\begin{pmatrix}
0&0&7/20&7/20&3/10
\\ 2/7&0&1/4&1/4&3/14
\\ 1/4&11/32&0&7/32&3/16
\\ 1/4&11/32&7/32&0&3/16
\end{pmatrix}.
```

Every row sum is one. All five maximal permanents equal 231/5120. Its column-deficit vector is

```math
u=(3/14,5/16,29/160,29/160,31/280)>0.
```

Appending u makes a doubly stochastic matrix in the C_5 face. The only extra zero is (1,2), so the extra-zero graph is a DAG. There is no zero rectangle with row count plus column count at least four. The matrix is not asserted to satisfy the other minimizing conditions and is not a counterexample to cohesiveness.

There is a general reason equal maximal minors are weak. If B is an (n−1) by n matrix with positive maximal permanents p_j, scaling column j by p_j makes every maximal permanent equal to their product. Subsequent independent row normalizations multiply every maximal permanent by the same factor and preserve equality. For the displayed example, start with the zero-one support with top diagonal zeros and the one additional zero (1,2); its maximal permanents are (8,11,7,7,6).

Any DAG exclusion must therefore retain the full positive-support cofactor equations and the inequalities at allowed zero entries, not just the free-row equations.
