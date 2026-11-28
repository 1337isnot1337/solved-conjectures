# Exact second variation on the zero-diagonal doubly stochastic face

Research note (20 November 2026, US Central). Target: Minc Conjecture 44, [Lavi's live problem page](https://yair-lavi.com/mincs-list/conjecture-44/index.html).

**Status: an all-order local identity, not a resolution of Conjecture 44.** Burghduff (1995) already proved that the uniform zero-diagonal matrix is a strict local permanent minimizer. The explicit symmetric/skew decomposition below is an independent calculation. Its priority relative to Burghduff's full paper has **not** been established; we did not obtain or inspect that full text. The conjectured *global* minimum for all zero-diagonal doubly stochastic matrices remains open.

## The exact quadratic form

Let `n >= 4`, `U=(J-I)/(n-1)`, and let `B` be any **real** `n x n` matrix with

- `b_ii=0` for all `i`;
- every row and column sum equal to zero.

Set `S=(B+B^T)/2` and `K=(B-B^T)/2`. Write `d_m` for the number of derangements of `m` objects, including `d_0=1`, `d_1=0`. Then

```math
\mathop{\mathrm{per}}(U+tB)=
\frac{d_n}{(n-1)^n}
+\frac{t^2}{2(n-1)^{n-2}}
\left[
\bigl(d_{n-2}+2d_{n-3}+2d_{n-4}\bigr)\|S\|_F^2
+\bigl(d_{n-2}+2d_{n-3}\bigr)\|K\|_F^2
\right]+O(t^3).
\tag{1}
```

Consequently the Hessian of the permanent at `U`, restricted to the zero-diagonal, zero-row-sum, zero-column-sum tangent space, is positive definite. The Hessian has exactly two eigenvalues, on its symmetric and skew-symmetric subspaces respectively:

```math
\lambda_S=\frac{d_{n-2}+2d_{n-3}+2d_{n-4}}{(n-1)^{n-2}},
\qquad
\lambda_K=\frac{d_{n-2}+2d_{n-3}}{(n-1)^{n-2}}.
\tag{2}
```

For `n=5`, the two eigenvalues coincide; otherwise the symmetric eigenspace has larger curvature. This formula concerns a local neighborhood only; it does not compare `U` with points elsewhere in the face.

## Derivation from permanent minors

Let

```math
D(N,j)=\sum_{r=0}^j(-1)^r\binom jr (N-r)!
```

be the number of permutations of `N` objects avoiding `j` specified fixed points. For two-element row and column sets `R,C`, the matrix `U[R^c,C^c]` has `n-4+|R\cap C|` forbidden diagonal entries. The coefficient of `t^2` in the multilinear permanent expansion is therefore

```math
[t^2]\mathop{\mathrm{per}}(U+tB)=
\frac{1}{(n-1)^{n-2}}
\sum_{|R|=|C|=2}
\mathop{\mathrm{per}}(B[R,C])D(n-2,n-4+|R\cap C|).
\tag{3}
```

Put `w_q=D(n-2,n-4+q)`, for `q=0,1,2`. The exact quadratic interpolation is

```math
w_q=w_0+(w_1-w_0)q+(w_2-2w_1+w_0)\binom q2.
```

Three universal identities follow solely from the tangent constraints:

```math
\sum_{|R|=|C|=2}\mathop{\mathrm{per}}(B[R,C])
=\frac12\|B\|_F^2;
\tag{4}
```

```math
\sum_{|R|=|C|=2}|R\cap C|\mathop{\mathrm{per}}(B[R,C])=0;
\tag{5}
```

```math
\sum_{|R|=|C|=2}\binom{|R\cap C|}{2}\mathop{\mathrm{per}}(B[R,C])
=\frac12\mathop{\mathrm{tr}}(B^2).
\tag{6}
```

For (4), write the left side as half the sum of `b_ij b_kl` over `i != k, j != l`, and use inclusion-exclusion against zero row/column sums. For (5), fix the common label `p` in `R\cap C`. The contribution is
`sum_(i != p,j != p) (b_pp b_ij+b_pj b_ip)= (sum_j b_pj)(sum_i b_ip)=0`.
For (6), `R=C={p,q}` forces `per B[R,R]=b_pq b_qp` because `b_pp=b_qq=0`, and summing gives half the trace.

Pascal's identity yields the exact finite differences

```math
D(N,j+1)-D(N,j)=-D(N-1,j),\qquad
D(N,j+2)-2D(N,j+1)+D(N,j)=D(N-2,j).
```

Thus `w_2-2w_1+w_0=d_(n-4)`, while counting permutations via their fixed points on the two *unrestricted* positions gives

```math
w_0=D(n-2,n-4)=d_{n-2}+2d_{n-3}+d_{n-4}.
```

Substituting into (3) using (4)–(6),

```math
[t^2]\mathop{\mathrm{per}}(U+tB)=
\frac{w_0\|B\|_F^2+d_{n-4}\mathop{\mathrm{tr}}(B^2)}
{2(n-1)^{n-2}}.
\tag{7}
```

Since `tr(B^2)=||S||_F^2-||K||_F^2` and `||B||_F^2=||S||_F^2+||K||_F^2`, equation (7) is (1). The first derivative vanishes: every allowed off-diagonal position of `U` has the same permanental cofactor, and the sum of the entries of `B` is zero. Both coefficients in (1) are strictly positive when `n>=4`, since `d_(n-2)>0`.

## Exact verification and literature boundary

The accompanying [standard-library exact checker](verify_zero_diagonal_second_variation.py) evaluates the quadratic coefficient independently via permanental minors, without using (7), and compares it with the formula on differences of derangement permutation matrices for every `n=4,5,6,7` in 24 fixed-seed tests. These checks were run locally. The all-order conclusion comes from (3)–(7), not from finite experiments.

Sources: [Lavi, Minc Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html); J. B. Burghduff, *Minimum permanents of doubly stochastic matrices with zero main diagonal*, Linear and Multilinear Algebra **40** (1995), 125–140, [doi:10.1080/03081089508818428](https://doi.org/10.1080/03081089508818428). Burghduff's abstract already asserts the strict local minimum, so that implication is **not new**. The publication's complete proof is inaccessible in the present source check, so it would be inappropriate to claim priority for the Hessian eigenvalues. The exact identity may be useful for future global estimates, but as it stands resolves no open MINCS entry.

Coordination: [MINCS research issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139).
