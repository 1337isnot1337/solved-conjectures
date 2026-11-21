# Review of the quadratic-dominance reductions

Independent algebraic review, 20 November 2026 (America/Chicago), of [the quadratic-dominance note](../combinatorial/quadratic_permanental_dominance.md). The review checks two reductions. It does not prove quadratic permanental dominance or add a resolved conjecture.

## Source-status correction

The algebraic reductions in this review remain correct. A later source check on the same research date found that the standard-block norm inequality and the equivalent total Fischer-deficit comparison follow from Pate's 2008 indicator theorem by using `A direct_sum conjugate(A)`. [The correction](pate_packet_correction.md) records the general proof and the source-access limit. Thus the total standard-block compensation is established. The stronger rowwise inequality and the separate bounds for all other irreducible blocks are not established by this deduction. The earlier review verified the displayed algebra; it did not justify treating the standard case as a new open target.

## Direct sums

The direct-sum proof is correct. If `A` and `B` have orders `r,s`, every nonzero permutation product of `A direct_sum B` comes from `S_r x S_s`. In an orthogonal irreducible decomposition of the restricted representation, the corresponding Fourier matrix is a direct sum of the matrices `F_mu(A) tensor F_nu(B)`, with the restriction multiplicities.

Frobenius norm squares multiply under tensor products and add under orthogonal direct sums. The identity

```math
\sum_{\mu,\nu}m_{\mu,\nu}d_\mu d_\nu=d_\lambda
```

then gives the stated closure. No multiplicity factor or representation degree is missing. This also justifies excluding disconnected support at a first failing order.

## A first counterexample can be singular

Assume the conjecture holds in every smaller order, and for every singular correlation matrix of order `n`. Let `A` be a positive definite correlation matrix of order `n`.

If `A=I`, then `F_lambda(A)=I_(d_lambda)` and the bound is immediate. Otherwise, `0<lambda_min(A)<1`, because all eigenvalues are positive, their sum is `n`, and equality of the smallest eigenvalue with one would force `A=I`. Set

```math
t=1-\lambda_{\min}(A),\qquad
B=\frac{A-\lambda_{\min}(A)I}{1-\lambda_{\min}(A)}.
```

Then `0<t<1`, `B` is a singular correlation matrix, and `A=(1-t)I+tB` as required.

The subset expansion in the draft is exact. Choosing the `I` summand at each index outside `S` forces the permutation to fix that complement. Fixed points inside `S` still contribute the `tB` summand, so the expansion counts all choices, including permutations with additional fixed points. The empty subset contributes the identity representation matrix and has permanent one.

For proper `S`, restriction to `S_S` is an orthogonal sum of irreducible representations of `S_|S|`. Applying the smaller-order assumptions to those summands gives

```math
\|X_S\|_F^2\le d_\lambda\mathop{\mathrm{per}}(B[S])^2.
```

For `S=[n]`, the assumed singular case gives the same bound. All subset weights `t^|S|(1-t)^(n-|S|)` are nonnegative, so the triangle inequality and the scalar permanent expansion yield

```math
\|F_\lambda(A)\|_F\le\sqrt{d_\lambda}\mathop{\mathrm{per}}A.
```

Positive diagonal congruence multiplies every permutation product by the same positive scalar, and therefore preserves the ratio in the quadratic inequality. A zero diagonal entry of a PSD matrix forces the corresponding row and column to vanish; every permutation product is then zero, giving the trivial equality case.

Thus, if any counterexample exists, one of minimum order can be chosen singular, with positive diagonal and connected support. The proof does not require the singular matrix to have rank two, and it gives no further rank bound.

## Other formulas checked

The standard-representation reformulation is correct: the permutation representation on singletons has matrix entries `a_ij per A(i|j)`, contains one trivial summand, and has the standard representation as its orthogonal complement. Its trivial eigenvalue is `per A`. Subtracting that one contribution converts the quadratic bound into the displayed sum of squared absolute entries.

The two-row representation formula from the subset permutation modules is also correct. For `j<=n/2`, the `j`-subset module contains each shape `(n-r,r)`, `0<=r<=j`, once. Subtracting the Frobenius norm square of the `(j-1)`-subset matrix therefore isolates the shape `(n-j,j)`.

These are exact structural reductions. The numerical diagnostics in the author file do not establish the remaining singular connected case.

## The standard-block deficit identity

The final deficit paragraph is also correct. Write `p=per A`, `Gamma_ij=a_ij per A(i|j)`, and

```math
\delta_i=p-\Gamma_{ii},\qquad L=pI-\Gamma.
```

The one-index case of Lieb's permanent inequality gives `delta_i>=0`. The matrix `Gamma` is Hermitian, so

```math
\|\Gamma\|_F^2=np^2-2p\mathop{\mathrm{tr}}L+\mathop{\mathrm{tr}}L^2,
\qquad
\mathop{\mathrm{tr}}L^2=\sum_i\delta_i^2+
\sum_{i\ne j}|\Gamma_{ij}|^2.
```

Consequently the standard-block inequality is equivalent to each of

```math
\mathop{\mathrm{tr}}L^2\le 2p\mathop{\mathrm{tr}}L,
\qquad
\sum_{i\ne j}|\Gamma_{ij}|^2
\le\sum_i\delta_i(2p-\delta_i).
```

The stated generic obstruction is exact. If `u=(1,1,-1,-1)/2` and `H=J_4/4+3uu^T`, then `H` is PSD, has row sums one and diagonal entries one, and has eigenvalues `3,1,0,0`. Hence `||H||_F^2=10>4`. The example is not asserted to be a permanental `Gamma`; it shows that positivity, row sums, and the diagonal inequalities alone do not imply the required Frobenius bound. The Pate deduction retains additional structure from the permanent cofactors. The generic example does not contradict that theorem.
