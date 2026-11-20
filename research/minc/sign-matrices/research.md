# Sign matrices and Hadamard permanents

Research date: 2026-11-20. No resolution is claimed for any of the four assigned Minc-list targets. The results below are exact reductions and documented failed routes, not additions to the solved-conjecture count.

## Targets and status checks

| Minc entry | Full target | Status supported by sources |
|---|---|---|
| Conjecture 36 | For every n, attain the least allowed nonzero sign-matrix permanent 2^(n-floor(log2(n+1))). | Open in the August 2026 Ingram–Razborov publication. Lavi reports constructions through 32, but a separate September certificate submission reports constructions through 35. |
| Problem 5 | Determine whether a real Hadamard matrix of order greater than 2 can have zero permanent. | Open on the current Lavi page. Sylvester matrices are settled by Chabaud, and Lavi reports all orders below 512 plus other families. |
| Problem 7 | Determine every order admitting a nonsingular sign matrix with equal absolute permanent and determinant. | Open on the current Lavi page. Orders 2, 3, 4 and 2^k-1 (k>=2) are excluded; Lavi reports explicit constructions through order 30. |
| Conjecture 30 | For Hermitian positive semidefinite A,B, prove per(A Hadamard-product B) <= per(A)per(B). | Open on the current Lavi page; full cases through order 6 and rank at most 3 are reported. |

### Sources read

1. Lavi, Conjecture 36: https://yair-lavi.com/mincs-list/conjecture-36/index.html
2. Lavi, Problem 5: https://yair-lavi.com/mincs-list/problem-5/index.html
3. Lavi, Problem 7: https://yair-lavi.com/mincs-list/problem-7/index.html
4. Lavi, Conjecture 30: https://yair-lavi.com/mincs-list/conjecture-30/index.html
5. Ian M. Wanless, *Permanents of matrices of signed ones*, Linear and Multilinear Algebra 53 (2005), 427–433, DOI 10.1080/03081080500093990. Public manuscript: https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf
6. DeVon Ingram and Alexander Razborov, *On the range of the permanent of (±1)-matrices*, Linear Algebra and its Applications 743 (2026), 271–285. https://arxiv.org/html/2507.09433v1 ; published introduction: https://www.sciencedirect.com/science/article/pii/S0024379526001928
7. Ulysse Chabaud, *On the permanent of Sylvester-Hadamard matrices*, https://arxiv.org/pdf/1802.08001 . The proof uses multiplicative closure of the rows, a property not available for arbitrary Hadamard matrices.
8. Separate finite certificate submission: https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/arithmetic-and-complexity/AC-11/README.md . Its 2026-09-11 status says n<=35, explicitly retaining every n>=36. This is not a full solution and does not establish external peer review.

Both search engines were used, with exact names, minimum-positive-permanent wording, Hadamard nonvanishing wording, and Wang determinant/permanent equality wording. The 2019 paper titled *Kräuter conjecture on permanents is true* concerns a different rank-dependent upper bound and does not settle Conjecture 36.

## Exact border reduction

Let A be an n by n sign matrix. Fix a row r, write a_r for that row, and take a sign column u. Define

B = [[A,u],[a_r,-u_r]].

Then

- det(B) = -2 u_r det(A);
- per(B) = sum over i != r of u_i per(A[i <- a_r]),

where A[i <- a_r] means replace row i by row r.

Proof of the determinant identity: subtract row r from the appended row. That row becomes zero in its first n entries and has final entry -2u_r. Expansion along it gives the identity, including for singular A.

Proof of the permanent identity: expand along the appended column. The bottom term is -u_r per(A). The term indexed by row r is u_r per(A), so these cancel. Deleting row i and retaining the appended row produces A with row i replaced by row r, up to a row permutation, which does not change its permanent.

Consequently, if A is nonsingular and |per(A)|=|det(A)|, this border produces another equality example exactly when a signed sum of the n-1 duplicate-row permanents equals either 2 per(A) or -2 per(A).

This is a reduction, not an existence theorem: no universal signed-sum statement has been proved. In particular, an unconditional extension in every order is impossible because Mersenne orders are excluded.

### Exact computational checks

`border_probe.py` uses arbitrary-precision integers for subset permanent computation and rational Gaussian elimination for determinants. It checks the published Wanless examples at orders 5, 6, and 8 through 13, and computes the signed-sum condition for the first three choices of r. The output is `border_probe.txt`.

The probe recovers extensions for the order-5 example and for some rows of each tested order-8 through order-13 example. For the order-6 example, none of the tested rows admits the required extension to excluded order 7. These checks support the identities but neither prove an all-order construction nor provide any new eligible finite result.

## Why a simple Kronecker construction fails

For any m by m matrix A, let K = [[A,A],[A,-A]]. If m is odd, per(K)=0.

To prove this, use variables x_1,...,x_m and y_1,...,y_m. The permanent is the coefficient of the squarefree monomial x_1...x_m y_1...y_m in

product_i ((a_i dot x)+(a_i dot y))((a_i dot x)-(a_i dot y))
= product_i ((a_i dot x)^2-(a_i dot y)^2).

Every term on the right has even total x-degree. The target monomial has odd x-degree m, so its coefficient is zero. Meanwhile det(K)=(-2)^m det(A)^2 is nonzero when A is nonsingular. Thus the direct H_2 tensor construction from odd-order bases cannot preserve determinant/permanent equality.

For even m the same formula gives a signed sum over choices of m/2 squared factors, not the simple multiplicative formula that would be needed for an induction.

## Failed Hadamard positivity route

For a real n by n matrix H,

per(H) = 2^(-n) sum over x in {-1,1}^n of (product_j x_j)(product_i (Hx)_i).

A possible proof by termwise sign agreement fails already for the Sylvester matrix of order 16. The exact script `hadamard_sign_probe.py` supplies two sign vectors whose nonzero summands have opposite signs. Thus orthogonality alone does not make this Rademacher estimator a sum of nonnegative terms.

This obstruction does not contradict nonvanishing. It only rules out a proposed proof mechanism.

## Remaining gaps

- Minimum attainment needs an exact all-order construction or a distributional argument hitting the least lattice value. The universal divisibility theorem alone is insufficient.
- Determinant/permanent equality needs a uniform construction across all allowed orders; the border identity leaves a nontrivial subset-sum existence question.
- Hadamard nonvanishing cannot be obtained by carrying the Sylvester row-group argument to matrices whose rows do not form a group. No replacement symmetry or 2-adic invariant has been proved here.
- Chollet's conjecture remains open. Its Gaussian-moment interpretation does not justify discarding off-diagonal pairs of permutation terms, because those terms can have negative real parts.

## Paired-row reduction for odd orders

Let V be any m by 2m sign matrix with rows v_i. Form a rectangular 2m by (2m+1) sign matrix C whose rows occur in pairs (v_i,+1), (v_i,-1). Its row-form product is

product_i ((v_i dot x)^2-y^2).

Every permanental cofactor obtained by deleting an x-column vanishes: the squarefree monomial in the remaining columns has y-degree one, while the displayed polynomial has only even y-degrees. The cofactor obtained by deleting the last column is per(V doubled), where every row of V is repeated twice. Thus completing C by any sign row gives permanent equal to plus or minus per(V doubled), determined only by the last entry of that row.

Consequently, a sufficient construction for Conjecture 36 at n=2m+1 is an m by 2m sign matrix V with

abs(per(V doubled)) = 2^(2m-floor(log2(m+1))).

This is an exact structural reduction. No general attaining construction for V has been obtained. In particular, replacing V by [A,A] produces the permanent of A tensor J_2, which does not in general equal 2^m per(A); treating it as such would be an invalid induction. At m=2, taking orthogonal sign rows gives a doubled-row permanent of -8, but this small case supplies no universal recurrence.

## Fixed-determinant upper-triangular sign family

For Problem 7 one can restrict attention, as a possible sufficient family, to matrices A satisfying a_ij=1 for j<=i, a_(i,i+1)=-1, and arbitrary signs above the first superdiagonal. Every such matrix has det(A)=2^(n-1). Subtract row i+1 from row i for i=1,...,n-1 simultaneously (or in increasing order so the source rows remain original). The first n-1 transformed rows have zeros through column i and entry -2 at column i+1; the last row is all ones. Expansion in the first column gives the formula. The permanent remains uncontrolled, and no all-order choice attaining absolute permanent 2^(n-1) was proved. The Mersenne-order obstruction prevents any unconditional extension step that ignores the order.

## Additional Chollet prior-art exclusions

A broader search found rank-four work omitted from the concise Lavi progress summary:

- Yicen Ma, *Quantitative Chollet Inequalities for Matrices of Rank at Most Four: Spectral bounds and an order-nine tight-frame construction*, arXiv:2609.37461v1, 28 September 2026. https://arxiv.org/html/2609.37461v1 . This claims the full rank-four class for n>=10 and a tight-frame subclass at n=9, with rational certificates.
- Scott Schubr, *Chollet's inequality for positive semidefinite matrices of rank at most four*, edition 4, 2 November 2026. https://research.luminaryoddities.com/chollets-inequality-positive-semidefinite-matrices-rank-at-most-four/v/4 . This claims rank at most four in every order, combining a border argument with prior inputs. Only its abstract, stated scope and dependency description were inspected here; its full proof package was not independently verified.
- Pant and Singh's actual arXiv title is *On Chollet's Permanent Conjecture for Graph Laplacians*: https://arxiv.org/html/2604.24192v1 . Section 4.2.1 already contains a diagonal-closure lemma, so deriving closure under nonnegative diagonal additions is not new progress.

These exclusions prevent treating rank-four cases or elementary diagonal closure as fresh resolutions. None of the sources above claims unrestricted Chollet for all ranks.
