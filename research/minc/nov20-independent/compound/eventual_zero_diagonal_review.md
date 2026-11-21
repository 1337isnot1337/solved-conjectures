# Independent review of the eventual zero-diagonal theorem

Date: 20 November 2026 (America/Chicago).

Reviewed file: [explicit_eventual_zero_diagonal.md](../inequalities/explicit_eventual_zero_diagonal.md).

Result: the multicolumn capacity inequality, its Frobenius consequence,
and the stated eventual uniqueness theorem are valid. I found no missing
normalization, boundary hypothesis, or constant in the displayed proof.
The result remains partial for Minc Conjecture 44.

## Primary coefficient theorem

I independently opened [Lelarge's arXiv:1507.04739v2](https://arxiv.org/pdf/1507.04739)
and checked the definition of the substochastic domain, the entropy
formula, and Theorem 4. The theorem uses the maximum matching size nu(W),
not the ambient matrix order, in its binomial probability factor. Thus
the factor is exactly one when the requested matching size is nu(W).

For a positive doubly stochastic A and a proper k-column set S, the
matrix W used in the proof has exactly k nonzero columns, all positive.
Therefore nu(W)=k. The proposed marginal X, equal to A on S and zero
elsewhere, has total mass k. Its row sums lie strictly between zero and
one, and its selected column sums equal one. It belongs to precisely the
domain in Lelarge's theorem. No optimization or entropy-maximizing
property of this X is required.

I also opened [Lavi's Proposition 2.1](https://arxiv.org/html/2609.29262v1#S2)
and checked the coefficient-capacity normalization d_m=m!/m^m, including
the stated stability closure operations. The imported Gurvits theorem
applies to the polynomial used here.

## Differentiation and capacity

The derivative defining q_S selects each column of S once and uses
distinct rows because each factor of p_A is linear. A size-k matching
of W saturates all columns of S and appears exactly once. Consequently

```math
q_S(x)=\left(\prod_i L_i\right)\sigma_k(W)
```

has no factorial or binomial factor. Its full squarefree coefficient in
the remaining variables is exactly per A.

Substituting X in the Bethe entropy gives

```math
S_B(W,X)=
-\sum_i c_i\log L_i
+\sum_{i,\,j\in S}(1-a_{ij})\log(1-a_{ij})
-\sum_i(1-c_i)\log(1-c_i).
```

The column-monomer terms vanish both on the selected columns and on the
zero columns. After adding the prefactor product of L_i, the remaining
row factors are precisely

```math
\prod_i\left(\frac{L_i}{1-c_i}\right)^{1-c_i}.
```

Their weighted arithmetic-geometric mean bound contains each outside
variable with exponent equal to its column sum, which is one. This
proves the claimed lower bound on Cap(q_S). Real stability, degree,
number of variables, and nonnegative coefficients satisfy Gurvits's
hypotheses, with m=n-k.

The positive approximation A_epsilon=(1-epsilon)A+epsilon J is used only
to establish the finite inequality. Passing to its limit uses continuity
of permanents and t^t at t=0. It does not assume continuity or attainment
of capacity and therefore covers entries zero and one correctly.

## Global quadratic estimate

The pointwise bound f''>=1 yields the displayed column inequality with
coefficient 1/2. Selecting k columns with at least k/n of the total
squared deviation is valid for every integer 1<=k<n.

I independently checked the sign in the baseline telescoping identity.
For h(x)=(x-1)log(1-1/x), one has

```math
-h'(x)=\sum_{\ell\ge2}\frac1{\ell x^\ell}
\le\frac1{2x(x-1)}.
```

The largest derivative bound on every integration interval used is
1/[2(n-k)(n-k+1)]. Summing n-m from zero to k-1 gives exactly the loss
k(k-1)/[4(n-k)(n-k+1)]. Thus equation (10) has the correct sign and
constant.

## Threshold and uniqueness

With epsilon=10^-6, n>=6,000,000 ensures
n epsilon/3 <= floor(n epsilon/2) <= n epsilon/2. The positive term in
the global estimate is then at least epsilon^2/6. The loss is at most
epsilon^2/[16(1-epsilon/2)^2], and its denominator is strictly larger
than 15. The resulting strict gap is epsilon^2/10=10^-13.

The local proof bounds the higher-degree Hessian remainder by 934/1000.
The quadratic coefficient is n/(n-1)<=2, so the upper Hessian bound 3
is valid. The value and first derivative at the centered origin are one
and zero, respectively. Integrating gives the stated normalized upper
bound 1+(3/2)||B||_F^2.

At U_n, ||U_n-J_n||_F^2=1/(n-1). At the stated threshold
n=20,000,000,000,000, this is inside the local ball and
3/[2(n-1)]<10^-13. Both comparisons persist for larger n. I checked these
threshold inequalities directly with exact rational arithmetic.

Thus every exterior matrix has permanent strictly larger than that of
U_n, including any proposed equality case. The interior comparison uses
the already reviewed orthogonality and vanishing first variation at U_n,
and is strict unless A=U_n. The two closed regions cover the boundary of
the local ball as well. This proves the claimed eventual theorem and
uniqueness.

This review does not establish priority, and the proof does not settle
the remaining smaller orders. It contributes zero completed full Minc
entries under the stated task requirements.
