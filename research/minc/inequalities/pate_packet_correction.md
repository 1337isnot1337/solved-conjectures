# Pate's indicator inequality and Gaussian packet replacement

Research checkpoint, 20 November 2026 (America/Chicago). This is a prior-art correction and a deduction from an established theorem. It is not a new resolution of Marcus's or Chollet's conjecture.

## The established inequality

For a positive semidefinite Hermitian matrix `H` of order `N`, define the complementary-permanent matrix


```math
\mathcal C_s(H)_{U,V}
=\mathop{\mathrm{per}}H[U,V]\mathop{\mathrm{per}}H[U^c,V^c],
\qquad |U|=|V|=s.
```


Pate proved that every indicator vector `x` satisfies


```math
x^*\mathcal C_s(H)x\leq \|x\|_2^2\mathop{\mathrm{per}}H. \tag{P}
```


The source is T. H. Pate, [*On permanental compounds*](https://www.sciencedirect.com/science/article/pii/S0024379507002273), Linear Algebra and its Applications 429 (2008), 1093–1101, DOI [10.1016/j.laa.2007.05.019](https://doi.org/10.1016/j.laa.2007.05.019). The primary publisher abstract states this precise indicator-vector result; the abstract is also available in the [author publication record](https://www.researchgate.net/publication/242987400_On_permanental_compounds). The full 2008 text was not obtained in this pass. Its statement and notation are reproduced explicitly in Section 5 of M. A. Aouichaoui and F. Zhang, [*A Solution to a Permanent Conjecture of Pate*](https://www.preprints.org/manuscript/202609.2464), posted 29 September 2026. That section was read in full. The 2026 article's new two-index theorem is separate from the older indicator theorem used here.

The restriction to indicator vectors matters. The inequality for every complex vector would assert a spectral bound that is false. No such extension is used below.

## The endpoint derivative in Marcus's replacement path

Let `A` have order `mk`, with disjoint packets `I_1,...,I_m`, each of size `k`. Write `A` as a Gram matrix of linear forms, and let `p_i` be the product of the forms in packet `I_i`. Put


```math
G_{ij}=\langle p_i,p_j\rangle_F=\mathop{\mathrm{per}}A[I_i,I_j],
\qquad F=\prod_{i=1}^m p_i.
```


Let `Y` be an independent proper complex Gaussian vector with covariance `G`, and define


```math
M(t)=\mathbb E\prod_{i=1}^m
\left|\sqrt t\,p_i+\sqrt{1-t}\,Y_i\right|^2,
\qquad 0\leq t\leq1.
```


This is a polynomial in `t`: homogeneous degrees force the same number of `p` packets on the holomorphic and antiholomorphic sides. Terms with no `Y` give `t^m per(A)`. Terms with one `Y` on each side give


```math
t^{m-1}(1-t)
\sum_{i,j=1}^m G_{ij}
\mathop{\mathrm{per}}A[I_i^c,I_j^c].
```


All other terms vanish to order at least two at `t=1`. Consequently


```math
M'(1)=m\mathop{\mathrm{per}}A-
\sum_{i,j=1}^m
\mathop{\mathrm{per}}A[I_i,I_j]
\mathop{\mathrm{per}}A[I_i^c,I_j^c]\geq0. \tag{1}
```


The inequality is exactly (P) for the indicator of the `m` packet subsets. Thus the endpoint derivative is already controlled in every order and at every packet size. This does not prove that `M'(t)` is nonnegative in the interior, or that `M(1)>=M(0)`.

## Every two-part Chollet occupation coefficient

Let `B` be any positive semidefinite Hermitian matrix of order `n`. For `0<=r<=n`, define


```math
T_r(B)=\sum_{\substack{S,T\subseteq[n]\\|S|=|T|=r}}
\left|\mathop{\mathrm{per}}B[S,T]\,
\mathop{\mathrm{per}}B[S^c,T^c]\right|^2.
```


Then the established theorem implies


```math
\boxed{T_r(B)\leq\binom nr\bigl(\mathop{\mathrm{per}}B\bigr)^2.} \tag{2}
```


For `0<r<n`, apply (P) to


```math
H=B\oplus\overline B,
\qquad
U_S=S\cup(n+S),\quad |S|=r.
```


Both blocks of `H` are positive semidefinite. There are `binom(n,r)` selected subsets, all of size `2r`. Block diagonality gives


```math
\mathop{\mathrm{per}}H[U_S,U_T]
=\left|\mathop{\mathrm{per}}B[S,T]\right|^2,
```


and the same identity holds for the complementary minors. Hence the selected principal sum of `C_{2r}(H)` is `T_r(B)`, while `per(H)=(per B)^2`. This proves (2). The cases `r=0,n` are equalities by direct inspection.

In particular, taking `r=1` proves


```math
\sum_{i,j=1}^n
\left|b_{ij}\mathop{\mathrm{per}}B(i\mid j)\right|^2
\leq n\bigl(\mathop{\mathrm{per}}B\bigr)^2. \tag{3}
```


The earlier note [Gaussian replacement note](../sign-matrices/chollet_gaussian_replacement.md) treated (3) as an unproved residual. That status should be corrected: (3), and the entire two-part family (2), follow from Pate's 2008 theorem.

The same correction applies to the standard-representation discussion in [quadratic-dominance note](../combinatorial/quadratic_permanental_dominance.md). The natural permutation representation on `n` points is the direct sum of the trivial representation and the standard representation. The Fourier matrix in that module is `C_1(B)`, up to a transpose convention. Its trivial block is the scalar `p=per B`, so (3) gives


```math
\|F_{(n-1,1)}(B)\|_F^2
=\|\mathcal C_1(B)\|_F^2-p^2
\leq(n-1)p^2.
```


Thus the standard-representation case of quadratic permanental dominance is established in every order by this implication of the older theorem. Equivalently, the total Fischer-deficit compensation written in the earlier note is established. Its stronger row-by-row variant does not follow from this argument and is not asserted.

For general `r<=n/2`, (2) gives


```math
\|\mathcal C_r(B)\|_F^2
=\sum_{j=0}^r\|F_{(n-j,j)}(B)\|_F^2
\leq\binom nr p^2.
```


This is a bound on a sum of two-row Fourier blocks. For `r>=2`, subtracting the upper bound for `r-1` is invalid: two upper bounds do not bound their difference. Therefore this observation does not prove the separate quadratic inequality for every two-row shape, much less for every irreducible character.

## Two-copy mixing and the exact limit of this deduction

Let `X` and `W` be independent proper complex Gaussian vectors with covariances `B` and `conj(B)`, and put `Z_i=X_i W_i`. Let `Z'` be an independent copy. For `0<=t<=1`, expansion by the index sets using the first copy gives


```math
\mathbb E\prod_{i=1}^n
\left|\sqrt t\,Z_i+\sqrt{1-t}\,Z'_i\right|^2
=\sum_{r=0}^n t^r(1-t)^{n-r}T_r(B)
\leq\bigl(\mathop{\mathrm{per}}B\bigr)^2. \tag{4}
```


Thus every mixture of two independent copies satisfies the required upper product-moment bound. In particular, equal two-copy averaging cannot violate the Chollet comparison at its first averaging step.

Equation (4) is not a proof for an arbitrary number of independent copies. In the occupation-coefficient induction, after fixing the first row and column sets `S,T`, the remaining matrix is `B[S^c,T^c]`. When `S!=T`, this is a cross-minor, which need not be Hermitian or positive semidefinite. Applying (2) to that matrix is invalid. Equivalently, after one mixing step the coordinate is a sum of two products of independent Gaussian forms, and it generally has no representation as one product of two Gaussian linear forms. The class used in the proof has not been shown closed under mixing.

For at least three occupied copies, the still-unproved sufficient coefficient comparison is


```math
\sum_{\substack{(S_1,\ldots,S_q),(T_1,\ldots,T_q)
\\ \text{ordered partitions of }[n],\ |S_j|=|T_j|=\alpha_j}}
\prod_{j=1}^q\left|\mathop{\mathrm{per}}B[S_j,T_j]\right|^2
\leq
\binom n{\alpha_1,\ldots,\alpha_q}
\bigl(\mathop{\mathrm{per}}B\bigr)^2. \tag{5}
```


The all-singleton case of (5) is already Chollet's self-pair inequality, after division by `n!`. The two-part deduction therefore does not remove the full conjecture's remaining difficulty. No solved-entry count changes.

## A further cofactor-product consequence

Put


```math
D_{ij}=b_{ij}\mathop{\mathrm{per}}B(i\mid j).
```


Another direct consequence of (P) is


```math
\boxed{\mathop{\mathrm{per}}D\leq(\mathop{\mathrm{per}}B)^n.} \tag{6}
```


Take `H=B^{direct_sum n}`, of order `n^2`, and index its entries by `(r,i)` with `1<=r,i<=n`. For each permutation `sigma`, select the `n`-element subset


```math
U_\sigma=\{(r,\sigma(r)):1\leq r\leq n\}.
```


There are `n!` distinct subsets. Block diagonality yields


```math
\mathcal C_n(H)_{U_\sigma,U_\tau}
=\prod_{r=1}^n
b_{\sigma(r),\tau(r)}\mathop{\mathrm{per}}B(\sigma(r)\mid\tau(r))
=\prod_{r=1}^n D_{\sigma(r),\tau(r)}.
```


The selected matrix is the Schur power matrix of `D`. Each of its row sums is `per D`, so applying (P) gives `n! per D <= n! per H = n!(per B)^n`, proving (6) without a limit or asymptotic extraction.

The matrix `D` is positive semidefinite by the Gram representation of permanental minors and the Schur product theorem. Its row sums are `per B` by Laplace expansion. When `per B>0`, (6) says that the permanent of `D/(per B)` is at most one. This concerns a specific cofactor product, whose entries can have complex phases. It does not assert the same upper bound for every positive semidefinite line-sum-one matrix.

No transformation is known here that converts (6) into `per(|B|^2)<=(per B)^2`. In particular, appending an identity block only appends the corresponding scalar block to `D`; it cancels out of (6) and yields the same original inequality. A padding argument that discards the complementary cofactors would be invalid. This is recorded as a corollary of a prior theorem, with no claim that the corollary's formulation is new.

## Check of the reduction

The accompanying [exact certificate script](pate_packet_certificates.py) checks the selected-subset indexing and the two-copy polynomial identity in exact arithmetic on a fixed rational Gram example. It also exhibits a nonprincipal cross-minor that is not Hermitian, so the proposed induction's missing hypothesis is explicit. The proof of (2) is the general block-diagonal argument above; a bounded check is not used as its justification.
