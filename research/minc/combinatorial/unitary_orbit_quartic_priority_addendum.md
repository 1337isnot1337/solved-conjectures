# Priority addendum: the fourth-order unitary-orbit expansion

Audit date: 20 November 2026 (America/Chicago). Target: [the published research checkpoint](unitary_orbit_quartic_germ.md), fetched at its reported modification time `2026-11-21T02:56:19Z`.

**Finding.** No earlier statement of the checkpoint's full all-order optimized fourth-order asymptotic, including its sign-symmetric spectral equality condition, was identified in the sources inspected. This is a bounded search result, not a novelty certificate. The coefficient expansion and cycle-counting ingredients are explicitly prior work. Several original extremal papers remain inaccessible in full. No full solution of Minc Problem 1 is claimed, and no conjecture count changes.

## What was audited

For a fixed trace-zero real spectrum `x`, write `s_j=sum_i x_i^j` and let `Z_x` be its zero-diagonal Hermitian unitary orbit. The specific claim under audit is


```math
M_n(1+\varepsilon x)
=1+\tfrac12s_2\varepsilon^2+\tfrac13s_3\varepsilon^3
+\Gamma_n(x)\varepsilon^4+o(\varepsilon^4),
```



```math
\Gamma_n(x)=\tfrac34s_4+(\tfrac18-\tfrac1n)s_2^2
-\min_{H\in Z_x}\mathcal D(H),
```


with the checkpoint's nonnegative deficit `D`, and `min D=0` exactly when the multiset `x` is invariant under negation. The diagonal drift in the optimized coefficient is part of the target. Merely expanding `per(I+epsilon H)` for fixed `H` is a different, classical statement.

## Directly identified prior ingredients

**Principal-subpermanent coefficients.** Merris, Rebman and Watkins [1, p. 274] explicitly identify the coefficients of `per(tI-A)` as sums of principal subpermanents. Their Theorem 2.1, pp. 276–277, derives the edge-and-cycle expansion for a graph adjacency matrix. Thus equation (4) of the checkpoint and the permutation-cycle mechanism behind its quartic formulas are not new. The paper's own text, rather than a generated platform summary, was inspected on pp. 273–278 of the mirrored journal article.

Grover [2, v1, Theorem 2.3, p.4] gives, for arbitrary complex matrices,


```math
D^m\mathop{\mathrm{per}}(A)[X,\ldots,X]
=m!\sum_{|I|=|J|=m}
 \mathop{\mathrm{per}}A(I\mid J)\mathop{\mathrm{per}}X[I,J].
```


Putting `A=I` leaves only `I=J` and gives precisely the identity-edge expansion at every degree, including degree four. The corresponding formula is Theorem 3.3, equation (3.10), in v2. Neither inspected permanent section optimizes those coefficients over a unitary orbit.

**Complex cycle products.** Mehatari, Kannan and Samanta [3, Theorem 3.2 and Corollary 3.2, p.7 of v2] give the permanental Sachs formula for complex unit gain graphs. Reversing each cycle pairs its product with its conjugate, producing its real part. Their hypothesis fixes nonzero edge moduli at one; arbitrary magnitudes in the checkpoint are the direct weighted permutation expansion, not literally that theorem's stated domain. The four-cycle bookkeeping should be presented as elementary coefficient algebra, not as a separate priority claim.

**The quartic deficit.** For any complex matrix, expansion of the Gram matrix gives


```math
\mathop{\mathrm{tr}}((A^*A)^2)
=\sum_j\left(\sum_i|a_{ij}|^2\right)^2
 +\sum_{j\ne\ell}|(A^*A)_{j\ell}|^2
\ge\sum_{i,j}|a_{ij}|^4.
```


The checkpoint's identity (18) is half this difference for zero-diagonal Hermitian `H`. Its equality support is a weighted partial permutation; Hermitian symmetry and the zero diagonal reduce it to disjoint two-vertex blocks and isolated zeros. Opposite eigenvalue pairs then follow directly. This is an assessment of the elementary algebra, not an attribution of the exact constrained statement to an uninspected paper. No independent novelty claim should be made for the norm inequality or its matching-support calculation.

The potentially distinct contribution is the optimized asymptotic that makes this constrained quantity the actual fourth-order coefficient, including attainable diagonal drift and approximation at disconnected support. The sources above do not provide that variational conclusion.

## Original maximum and constant-diagonal papers

Grone, Johnson, de Sá and Wolkowicz [4] was retrieved from Wolkowicz's university website and read through OCR of all five pages. It proves the necessary commutation condition with the permanental adjoint, derives the order-two answer, and discusses order three. Its derivative and Lagrange-multiplier argument is prior groundwork for orbit stationarity. The inspected paper does not state the all-order near-scalar expansion or the quartic constrained equality result.

Drew and Johnson's maximum paper [5] was accessible through the publisher abstract, which restricts its completed optimization to real symmetric order three. Their two-page Mehta counterexample [6] was confirmed in the publisher's volume contents, but its body was not obtained. Hu's 1996 publisher abstract [7] explicitly extends the order-three formula to complex Hermitian matrices and characterizes maximizers. These completed order-three results already encompass any order-three specialization of the checkpoint, whether or not their proofs use a Taylor expansion. Their abstracts do not establish an all-order local theorem. The unread bodies prevent ruling out additional relevant remarks.

The earlier [repository source audit](unitary_orbit_source_audit.md) remains controlling for the classical normal-matrix permanent bound and its 1966 equality theorem. That equality theorem concerns a different inequality; a shared monomial-support description is not evidence that it already contains the optimized quartic coefficient.

## Current dossier and search scope

Holden's September 2026 [primary LaTeX dossier](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/matrix-inequalities-and-norms/MI-16/solution.tex) was fetched again: 46,356 characters, reported modification `2026-09-13T01:11:38Z`. Its section structure and passages matching perturbation, Taylor, near-scalar, quartic, fourth-order, zero-diagonal, and sign-symmetric terms were checked. Its asymptotic section concerns the large-order transition threshold in the one-exceptional-eigenvalue family. That is distinct from fixed-order, arbitrary-direction expansion about the scalar spectrum. This was a targeted text check, not a fresh full proof review. No counterpart of the target theorem was found there.

Both search engines were used, including exact paper titles and combinations of permanent, prescribed spectrum, unitary orbit, near-scalar, fourth-order, quartic, zero diagonal, and entrywise fourth powers; current searches also used a one-year window. No source matching the entire target was recovered. This does not certify absence from unindexed papers or books.

## References and exact access limits

1. R. Merris, K. R. Rebman, W. Watkins, *Permanental polynomials of graphs*, LAA **38** (1981), 273–288, [DOI 10.1016/0024-3795(81)90026-4](https://doi.org/10.1016/0024-3795(81)90026-4). [Publisher record](https://www.sciencedirect.com/science/article/pii/0024379581900264); [mirrored primary journal text](https://www.academia.edu/21075680/Permanental_polynomials_of_graphs). Publisher abstract accessible by search; direct opening returned HTTP 403. Primary paper text on pp. 273–278 was inspected from the mirror; the entire article was not audited.
2. P. Grover, *Higher order derivatives and perturbation bounds for some functions of matrices*, [arXiv:1007.4402v1](https://arxiv.org/pdf/1007.4402v1), archived 26 July 2010. Its title became *Derivatives of Multilinear Functions of Matrices* in [v2](https://arxiv.org/pdf/1007.4402v2), corresponding to the 2013 book chapter. The permanent sections and relevant theorem statements were read in both versions. Direct web access to v1 failed, but public HTTP retrieval succeeded; no access restriction remained for the inspected text.
3. R. Mehatari, M. R. Kannan, A. Samanta, *On the adjacency matrix of a complex unit gain graph*, [arXiv:1812.03747v2](https://arxiv.org/pdf/1812.03747v2), 3 October 2019; [DOI 10.1080/03081087.2020.1776672](https://doi.org/10.1080/03081087.2020.1776672). Full primary PDF available; Section 3's permanent formulas and proofs were inspected.
4. R. Grone, C. R. Johnson, E. M. de Sá, H. Wolkowicz, *A note on maximizing the permanent of a positive definite Hermitian matrix, given the eigenvalues*, LMA **19** (1986), 389–393, [DOI 10.1080/03081088608817733](https://doi.org/10.1080/03081088608817733). [Author-hosted PDF](https://www.math.uwaterloo.ca/~hwolkowi/henry/reports/PAPER10.pdf), 235,195 bytes, SHA256 `2c378743422f5cd33ff7943349c9854424628b53cf7e1b5384d5b493687f6870`. Its text layer was unreadable; all five pages were rendered and OCRed. Some isolated displayed formulas remain poorly OCRed, but the theorem, proof structure, and complete section content were readable.
5. J. H. Drew, C. R. Johnson, *The maximum permanent of a 3-by-3 positive semidefinite matrix, given the eigenvalues*, LMA **25** (1989), 243–251, [DOI 10.1080/03081088908817947](https://doi.org/10.1080/03081088908817947). Publisher abstract inspected; direct HTML and PDF returned HTTP 403. Full text not read.
6. The same authors, *Counterexample to a conjecture of Mehta regarding permanental maximization*, LMA **25** (1989), 253–254, [DOI 10.1080/03081088908817948](https://doi.org/10.1080/03081088908817948). Publisher contents metadata inspected; direct HTML and PDF returned HTTP 403. Full text not read.
7. S.-A. Hu, *Maximum permanent and Hermitian matrices*, LAA **235** (1996), 93–105, [DOI 10.1016/0024-3795(94)00121-9](https://doi.org/10.1016/0024-3795(94)00121-9). Publisher abstract inspected; direct page and PDF returned HTTP 403. Full text not read. Hu's 1994 predecessor and Mehta's 1977 book were not obtained in this pass.

The defensible priority wording is: **an independently derived local result whose exact all-order optimized formulation was not found in this bounded audit; priority remains provisional.** The general prescribed-spectrum maximum remains uncomputed.
