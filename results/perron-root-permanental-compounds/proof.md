# Perron root of permanental compounds

## Status and exact scope

This is a complete candidate proof of a fully polynomial randomized approximation scheme for the Perron root of every permanental compound of a nonnegative rational matrix. It was developed on 20 November 2026 during the investigation of Minc Problem 18. Two independent internal reviews found no gap in the argument. The result is unrefereed, and the literature audit remains separate from the mathematical proof.

The theorem covers all matrix orders, all compound degrees, reducible matrices, and matrices with zero diagonal. It is an approximation theorem. It does not give an exact polynomial-time algorithm for the permanent or for an algebraic Perron root, and it does not solve Minc's characteristic-polynomial problem.

The [current Minc-list entry](https://yair-lavi.com/mincs-list/problem-18/index.html) asks for an algorithm and identifies general approximation as a natural goal, while recording approximation schemes for positive-diagonal and symmetric matrices. The result below supplies an approximation algorithm on the entire rational nonnegative domain. The original unqualified historical wording should not be silently strengthened to an exact-polynomial-time claim.

Coordination: [issue #140](https://github.com/1337isnot1337/solved-conjectures/issues/140), within [issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139).

## Theorem

Given a nonnegative rational n-by-n matrix A, an integer 0 <= k <= n, and rational parameters 0 < epsilon < 1 and 0 < delta < 1, there is a randomized algorithm which runs in time polynomial in the binary input length, 1/epsilon, and log(1/delta), and returns a nonnegative rational number R such that

```math
\Pr\!\left[(1-\varepsilon)\rho(P_k(A))
       \le R\le(1+\varepsilon)\rho(P_k(A))\right]
       \ge 1-\delta.
```

If the root is zero, the algorithm returns zero deterministically. The algorithm does not construct the binomial(n,k)-by-binomial(n,k) compound. It makes polynomially many constant-relative-accuracy calls to the Jerrum--Sinclair--Vigoda permanent approximation algorithm, on matrices of order O(n squared / epsilon).

Here P_k(A)[I,J]=per(A[I,J]) for k-subsets I,J of [n], and P_0(A)=[1]. Write rho_k=rho(P_k(A)) and d_n=n!/n^n.

## 1. The stable transfer operator

A real polynomial is stable if it has no zero when every variable lies in the open upper half-plane. Zero polynomials are allowed as degenerate limits. Let M denote the operation of deleting every monomial with exponent at least two in any of the x variables. On multiaffine polynomials define

```math
\mathcal T_A f(x)=\mathcal M_x\bigl(f(A^{\mathsf T}x)\bigr).
```

This operator preserves real stability or gives zero, including when other variables are left untouched.

Nonnegative linear substitution preserves the upper-half-plane condition when every substituted form is nonzero. A zero form can be handled by adding a positive perturbation and taking a limit. To verify the truncation operation directly, write a stable polynomial in one variable as f(x)=sum_(j=0)^d a_j x^j, with the other variables retained. For d >= 1, reversing by x^d f(-1/x), differentiating d-1 times, reversing the resulting linear polynomial, and rescaling x by d produces, up to a nonzero constant, a_0+a_1 x. Reversal uses the fact that -1/x remains in the upper half-plane; differentiation and limits preserve stability or give zero. Variables of degree zero need no operation. Applying this one-variable procedure in succession proves the assertion for M.

For a coefficient vector v on k-subsets, let

```math
f_v(x)=\sum_{|J|=k}v_J x^J,
\qquad x^J=\prod_{j\in J}x_j.
```

The coefficient of x^I in T_A f_v is

```math
\sum_{|J|=k}\mathop{\mathrm{per}} A[I,J]\,v_J.
```

Thus the homogeneous degree-k block of T_A is exactly P_k(A), with no factorial normalization. The degree-k block of T_A^t is P_k(A)^t. The notation refers to iteration of the projected operator, not to P_k(A^t), which is generally a different matrix.

The preservation fact is also a known stable-polynomial tool; see Leake--Ryder in the references. The proof above is included to make the treatment of the untouched variables explicit.

## 2. A uniform bound for the sum of traces

For an integer t >= 1 define

```math
Z_t(A)=\sum_{j=0}^{n}\mathop{\mathrm{tr}}(P_j(A)^t),
\qquad \Lambda(A)=\max_{0\le j\le n}\rho_j.
```

The key bound is

```math
d_n\Lambda(A)^t\le Z_t(A)\le2^n\Lambda(A)^t.
\tag{1}
```

Its constants depend on n, not on t or on the exponential compound dimensions.

### Lower bound

Apply T_A^t only to the x variables in

```math
G_t(x,y)=\mathcal T_A^t\!\left[\prod_{i=1}^{n}(x_i+y_i)\right].
```

The initial polynomial is stable. Section 1 shows that G_t is stable, homogeneous of total degree n, and has nonnegative coefficients. It is nonzero because its degree-zero x block is y_1...y_n. Expanding in the two sets of variables gives

```math
G_t(x,y)=\sum_{j=0}^{n}\ 
\sum_{\substack{|I|=j\\|J|=j}}
 (P_j(A)^t)_{I,J}\,x^I y^{[n]\setminus J}.
```

Set p_t(z)=G_t(z,z). This remains stable, homogeneous of degree n in n variables, and nonnegative. The coefficient of z_1...z_n is exactly Z_t(A): the exponent vector in a summand is 1+1_I-1_J, which equals the all-ones vector precisely when I=J.

For a nonnegative homogeneous polynomial p of degree n in n variables put

```math
\mathop{\mathrm{Cap}}(p)=
\inf_{z_1,\ldots,z_n>0}\frac{p(z)}{z_1\cdots z_n}.
```

In this case

```math
\frac{p_t(z)}{z_1\cdots z_n}
=\sum_{j=0}^{n}\sum_{|I|=|J|=j}
 (P_j(A)^t)_{I,J}\frac{z^I}{z^J}.
\tag{2}
```

For each fixed j, the corresponding summand is the sum of all entries of a positive diagonal similarity of P_j(A)^t. That sum is at least the spectral radius rho_j^t: a nonnegative matrix's spectral radius is bounded by its maximum row sum, which is bounded by the sum of all entries. All other terms in (2) are nonnegative. Therefore

```math
\mathop{\mathrm{Cap}}(p_t)\ge\Lambda(A)^t.
```

Gurvits's coefficient-capacity theorem applies to p_t and gives

```math
Z_t(A)=[z_1\cdots z_n]p_t
\ge d_n\mathop{\mathrm{Cap}}(p_t)
\ge d_n\Lambda(A)^t.
```

This proves the lower bound without assuming irreducibility, diagonal positivity, symmetry, aperiodicity, or a spectral gap.

### Upper bound

For any square matrix C of order N, the trace of C^t is the sum of the tth powers of its eigenvalues, counted with algebraic multiplicity. Consequently, for nonnegative C,

```math
0\le\mathop{\mathrm{tr}}(C^t)\le N\rho(C)^t.
```

Apply this to each compound and use sum_j binom(n,j)=2^n. This proves (1).

One can improve d_n in this argument to 2^{-(n-1)} using the degree-sensitive version of Gurvits's theorem, because each z_i has degree at most two in p_t. The weaker displayed constant suffices for the algorithm, so the improvement is not needed below.

## 3. Log-concavity across compound degrees

For t >= 1 let

```math
S_j(t)=\mathbf1^{\mathsf T}P_j(A)^t\mathbf1.
```

The polynomial

```math
q_t(z)=\left.
\mathcal T_A^t\!\left[\prod_{i=1}^{n}(1+x_i)\right]
\right|_{x_1=\cdots=x_n=z}
=\sum_{j=0}^{n}S_j(t)z^j
```

is stable, real, and has nonnegative coefficients and constant coefficient one. Thus all its zeros are real and nonpositive. Newton's inequalities imply log-concavity of S_j(t)/binom(n,j), with trailing zeros allowed.

For each nonnegative matrix C, the sum of all entries of C^t has tth-root limit rho(C). This follows by comparing that sum with any induced matrix norm and using the spectral-radius formula. If C is nilpotent the sum is eventually zero, and the same statement holds. Taking tth roots in Newton's inequalities and then taking limits gives

```math
\rho_j^2\ge\rho_{j-1}\rho_{j+1}
\qquad(1\le j<n).
\tag{3}
```

The positive terms form an initial interval 0,...,m. This requires the full finite-t Newton inequalities, not just the adjacent inequalities (3). If 0<j<ell and S_ell(t)>0, the absence of internal zeros and concavity of log(S_j(t)/binom(n,j)) give

```math
\frac{S_j(t)}{\binom nj}
\ge\left(\frac{S_\ell(t)}{\binom n\ell}\right)^{j/\ell}.
```

Taking tth roots and limits yields rho_j>=rho_ell^(j/ell)>0 whenever rho_ell>0. Equation (3) is already reported on Lavi's problem page; the derivation is supplied here so the approximation reduction does not depend on an unpublished proof of that statement.

## 4. Separating one degree with a positive parameter

For s>0, P_j(sA)=s^j P_j(A). Define

```math
\Lambda(s)=\max_j\rho_j s^j,
\qquad
Z_t(s)=\sum_{j=0}^{n}\mathop{\mathrm{tr}}(P_j(A)^t)s^{jt}.
```

Equation (1), applied to sA, says

```math
d_n^{1/t}\Lambda(s)
\le Z_t(s)^{1/t}\le2^{n/t}\Lambda(s).
\tag{4}
```

If rho_k>0, log-concavity gives the exact identity

```math
\rho_k=\inf_{s>0}\frac{\Lambda(s)}{s^k}.
\tag{5}
```

Indeed, every s gives a value at least rho_k. For 0<k<m, any s in

```math
\frac{\rho_{k-1}}{\rho_k}
\le s\le\frac{\rho_k}{\rho_{k+1}}
```

makes the kth term maximal. The interval is nonempty by (3), and comparisons with more distant terms follow by monotonicity of the adjacent ratios. For k=m, take s at least rho_(m-1)/rho_m. The case k=0 is immediate and will be handled separately by the algorithm.

Thus

```math
d_n\rho_k^t
\le\inf_{s>0}\frac{Z_t(s)}{s^{kt}}
\le2^n\rho_k^t.
\tag{6}
```

Individual traces can vanish for infinitely many t because of periodicity. The argument uses their sum and log-concavity across degrees, so it makes no claim of uniform convergence of an individual trace or of S_k(t).

## 5. Realizing Z_t(s) as one ordinary permanent

Index a matrix M_t(s) by pairs (ell,i), with ell in the cyclic group of order t and i in [n]. Start with the identity matrix of order nt and add sA from each layer to the next:

```math
M_t(s)_{(\ell,i),(r,j)}
=\boldsymbol1_{\ell=r,\ i=j}
 +s a_{ij}\boldsymbol1_{r=\ell+1\pmod t}.
```

When t=1 the two terms may occupy the same entry, so M_1(s)=I+sA. In all cases,

```math
\mathop{\mathrm{per}}M_t(s)=Z_t(s).
\tag{7}
```

For t>=2, a perfect matching chooses some identity edges and some edges going to the next layer. The vertices not using their identity edges in a given layer must be exactly the vertices whose columns receive edges from the preceding layer. Hence their number j is constant across layers. Choosing subsets I_0,...,I_(t-1) and summing the matching weights between consecutive layers gives

```math
s^{jt}\prod_{\ell=0}^{t-1}
\mathop{\mathrm{per}} A[I_\ell,I_{\ell+1}],
\qquad I_t=I_0.
```

Summing yields the trace of P_j(A)^t, then (7). For t=1, expansion of per(I+sA) according to the selected A entries gives the same identity. The t=1 trace formula is classical and appears in Feinsilver--McSorley; it is not claimed as a new identity.

M_t(s) is nonnegative rational whenever A and s are, and its permanent is at least one because all identity edges are present. The permanent approximation oracle therefore never encounters a zero permanent in this reduction.

## 6. Exact detection of a zero root

Let m be the largest number of vertices covered by vertex-disjoint directed cycles in the support digraph of A, with loops counted as cycles. Then

```math
\rho(P_k(A))>0\quad\Longleftrightarrow\quad k\le m.
\tag{8}
```

For the forward direction, a positive directed cycle in the support of P_k(A) supplies a cyclic sequence of k-subsets and a positive matching at every transition. Average its base-edge usages over time. This gives a nonnegative circulation f with identical incoming and outgoing flow at each vertex, each at most one, and total flow k. Add diagonal slack to make a doubly stochastic matrix. By the Birkhoff decomposition, some permutation in its support uses at least k original supported edges: give weight one to every position supported by A and zero to any artificial diagonal slack position. The average permutation weight is at least k. Its nontrivial cycles and its supported fixed points give the required cycle packing.

Conversely, a cycle packing on m vertices defines a permutation of those vertices. Start with any k of them and repeatedly apply this permutation. The resulting periodic sequence of k-subsets is a positive directed cycle in P_k(A), so its spectral radius is positive.

To compute m, solve one maximum-weight assignment problem. Allow every supported position of A with weight one and every unsupported diagonal position with weight zero; forbid all other positions. A feasible assignment always exists because the artificial diagonal is available. Its weight counts exactly the vertices on supported cycles. This is a polynomial-time computation. Equation (8) is also recorded on Lavi's page; it is proved here for completeness.

## 7. A finite rational grid and explicit error bounds

Handle n=0, if that convention is admitted, and k=0 by returning one. For k>0 first compute m as in Section 6; return zero if k>m. If m=0 this handles all positive k.

Let L>=1 be an upper bound on the binary lengths of the numerator and denominator of every positive entry of A. Put

```math
H=n(L+n+1),\qquad
t=Q=\left\lceil\frac{16n}{\varepsilon}\right\rceil,
\qquad r=1+\frac1Q,
\qquad J=\lceil4HQ\rceil.
```

Every positive entry lies between 2^{-L} and 2^L. Every positive entry of P_j(A) is therefore at least 2^{-jL}; a positive cycle shows rho_j>=2^{-jL}. The row-sum bound gives rho_j<=binom(n,j)j!2^{jL}<=n!2^{nL}. Consequently

```math
|\log\rho_j|\le H
```

whenever rho_j>0. A supporting parameter s_* from Section 4 can therefore be chosen with |log s_*|<=2H. The grid s_l=r^l, -J<=l<=J, covers this interval: log(1+1/Q)>=1/(2Q). Some grid point has log-distance at most 1/Q from log s_*.

The function log(Lambda(s)/s^k) is the maximum of affine functions of log s, with slopes j-k between -n and n. It is therefore n-Lipschitz. Hence some grid point satisfies

```math
\frac{\Lambda(s_\ell)}{s_\ell^k}
\le e^{n/Q}\rho_k.
```

Use the permanent FPRAS to obtain, for every grid point, a rational estimate Zhat_l of per(M_t(s_l)), with relative error 1/4 and failure probability at most delta/(2J+1). If any oracle estimate is nonpositive, return zero; this can occur only on the failure event because all exact permanents are at least one. On the event that every call succeeds,

```math
\frac34 Z_t(s_\ell)\le\widehat Z_\ell
\le\frac54 Z_t(s_\ell)
```

simultaneously. The union bound gives this event probability at least 1-delta. Define the intermediate value

```math
R_0=\min_{-J\le\ell\le J}
       \frac{\widehat Z_\ell^{1/t}}{s_\ell^k}.
```

Equations (4) and the supporting grid point yield

```math
\exp\!\left(\frac{\log d_n+\log(3/4)}t\right)\rho_k
\le R_0
\le\exp\!\left(\frac{n\log2+\log(5/4)}t+\frac nQ\right)\rho_k.
```

The elementary bound log(n!)>=n log n-n gives log d_n>=-n. Using log(4/3)<1, log(5/4)<1, log2<1, and t=Q>=16n/epsilon, we obtain the convenient weaker estimates

```math
e^{-\varepsilon/8}\rho_k
\le R_0\le e^{3\varepsilon/16}\rho_k.
```

Approximate R_0 by a positive rational R within a multiplicative factor e^{epsilon/16}; rational bisection for positive tth roots suffices. Then

```math
e^{-3\varepsilon/16}\rho_k
\le R\le e^{\varepsilon/4}\rho_k.
```

For 0<epsilon<1, these bounds imply (1-epsilon)rho_k<=R<=(1+epsilon)rho_k. This proves the stated probability and error guarantee.

### Bit complexity

The grid has 2J+1=O(n squared (L+n)/epsilon) points. Each s_l is a rational power of (Q+1)/Q and has binary length O(J log Q). The oracle matrices have order nt=O(n squared / epsilon), and their entries have polynomial binary length. Every permanent estimate is requested with constant relative accuracy and log((2J+1)/delta) confidence dependence. The Jerrum--Sinclair--Vigoda theorem therefore bounds the total randomized running time by a polynomial in the claimed parameters. Root approximation and rational comparisons have polynomial bit complexity as well.

No real-number oracle, exponentially long grid, exponential-dimensional eigenvector, or unbounded convergence search is hidden in the algorithm.

## 8. Verification and limitations

The standard-library script `verify.py` checks:

- 126 cyclic trace identities with exact integer or rational arithmetic, including t=1 where identity and transition entries overlap;
- 81 Newton inequalities for finite path-sum sequences;
- 2,048 exact comparisons of the cycle-packing criterion with compound support cycles, covering every binary matrix of order three and every degree.

These finite checks validate the algebraic implementation of the reductions. The theorem's unbounded scope comes from the proof above and the two cited general theorems, not from the checks. The script does not implement the Jerrum--Sinclair--Vigoda sampler. This proof gives a complexity result, not a claim of practical speed.

## References and attribution of inputs

1. H. Minc, *Research problems: permanental compounds*, Linear and Multilinear Algebra 19 (1986), 199–201. Original problem source; identified via the surveys rather than independently retrieved in this investigation.
2. G.-S. Cheon and I. M. Wanless, [*An update on Minc's survey of open problems involving permanents*](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), Linear Algebra Appl. 403 (2005), 314–342. Problem 18 is on printed page 338.
3. L. Gurvits, [*Van der Waerden/Schrijver--Valiant like conjectures and stable homogeneous polynomials: one theorem for all*](https://arxiv.org/abs/0711.3496), Electronic J. Combin. 15 (2008), R66. Supplies the coefficient-capacity inequality. For homogeneous polynomials, the right-half-plane and upper-half-plane stability conventions are equivalent by rotation.
4. M. Jerrum, A. Sinclair and E. Vigoda, [*A polynomial-time approximation algorithm for the permanent of a matrix with nonnegative entries*](https://doi.org/10.1145/1008731.1008738), J. ACM 51 (2004), 671–697. [Author manuscript](https://www.dcs.ed.ac.uk/home/mrj/PermanentRev.pdf). Supplies the nonnegative rational permanent FPRAS; it is not a new algorithm introduced here.
5. P. Feinsilver and J. McSorley, [*Zeons, permanents, the Johnson scheme, and generalized derangements*](https://arxiv.org/abs/1710.00788), Int. J. Combinatorics (2011), Article 539030. Identifies permanental compounds as zeon powers and gives the t=1 permanent trace formula.
6. J. D. Leake and N. R. Ryder, [*Generalizations of the Matching Polynomial to the Multivariate Independence Polynomial*](https://alco.centre-mersenne.org/item/ALCO_2019__2_5_781_0/), Algebraic Combinatorics 2 (2019), no. 5, 781–802, DOI [10.5802/alco.63](https://doi.org/10.5802/alco.63). The multiaffine-part stability-preserving operation is discussed near Corollary 3.2. Bibliographic data checked against the journal's primary record on 20 November 2026.
7. Yair Lavi, [Minc Problem 18](https://yair-lavi.com/mincs-list/problem-18/index.html), accessed 20 November 2026. Prior special-class approximation results, log-concavity, and the zero-root criterion are acknowledged above.

The proposed new ingredient is the full-degree stable-symbol trace estimate (1), used with log-concavity and the cyclic permanent reduction to obtain an FPRAS for every nonnegative rational input. Literature searching must test this scope under both the permanental-compound and zeon terminology before priority is asserted.

