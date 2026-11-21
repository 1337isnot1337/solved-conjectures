# Contraction routes and their limits

Status: research only. These calculations distinguish sufficient conditions from the full conjecture. The failed sufficient conditions below are not counterexamples to Bourin's conjecture, and no priority claim is made for these route observations.

Write

```math
S=A+B,\qquad C_t=A^tB^{1-t}+B^tA^{1-t}.
```

## The symmetric sandwich need not be a contraction

A factorization $`C_t=S^{1/2}KS^{1/2}`$ with $`\|K\|_{\mathrm{op}}\leq1`$ would prove every unitarily invariant norm inequality by the matrix Cauchy–Schwarz inequality. Such a contraction does not always exist.

Let $`u,v`$ be independent unit vectors in dimension two, let $`c=u^*v`$, and put $`A=a uu^*`$, $`B=b vv^*`$, where $`a,b>0`$. If $`V=[u,v]`$, then

```math
S=V\begin{bmatrix}a&0\\0&b\end{bmatrix}V^*,
\qquad
C_t=V\begin{bmatrix}
0&a^tb^{1-t}c\\
a^{1-t}b^t\overline c&0
\end{bmatrix}V^*.
```

The matrix $`W=S^{-1/2}V\mathop{\mathrm{diag}}(\sqrt a,\sqrt b)`$ is unitary. Conjugating by it gives the exact formula

```math
\|S^{-1/2}C_tS^{-1/2}\|_{\mathrm{op}}
=|c|\max\{(a/b)^{t-1/2},(a/b)^{1/2-t}\}.
```

For every fixed $`t\ne1/2`$ and fixed nonzero overlap of modulus less than one, this is unbounded as the ratio of eigenvalues tends to infinity. For an exact instance take $`a=256,b=1,t=1/4,u=(1,0)^T,v=(3/5,4/5)^T`$. Then

```math
C_{1/4}=\frac1{25}\begin{bmatrix}612&48\\768&0\end{bmatrix},
\qquad
S=\frac1{25}\begin{bmatrix}6409&12\\12&16\end{bmatrix},
\qquad
\|S^{-1/2}C_{1/4}S^{-1/2}\|_{\mathrm{op}}=\frac{12}{5}.
```

The sum is invertible. Adding sufficiently small positive multiples of the identity to both summands preserves the strict failure by continuity, so singular summands are not essential to this obstruction. The original conjecture is already known for dimension two; the example only excludes this sandwich factorization as a general proof route.

## A natural spectral multiplier fails both endpoint contractions

For positive definite matrices with spectral resolutions $`A=\sum_i a_iE_i`$ and $`B=\sum_j b_jF_j`$, consider the complex-linear map

```math
\Phi_t(Z)=\sum_{i,j}\frac{a_i^tb_j^{1-t}}{a_i+b_j}E_iZF_j
+\sum_{i,j}\frac{a_i^{1-t}b_j^t}{a_i+b_j}F_jZE_i.
```

Because $`E_iSF_j=(a_i+b_j)E_iF_j`$ and likewise in the opposite order, $`\Phi_t(S)=C_t`$. If this map were simultaneously contractive on the trace and operator norms, interpolation of symmetric norms would supply the desired domination. It is not contractive on either endpoint norm in general.

At $`t=0`$, let $`X`$ be the unique solution of $`AX+XB=B`$. The first sum at $`Z=I`$ is $`X`$. The corresponding sum with numerator $`a_i`$ is $`I-X`$, so

```math
\Phi_0(I)=I+X-X^*.
```

For the exact positive definite pair

```math
A=\begin{bmatrix}1&0\\0&4\end{bmatrix},
\qquad B=\begin{bmatrix}2&1\\1&2\end{bmatrix},
\qquad X=\begin{bmatrix}5/8&1/8\\4/35&11/35\end{bmatrix},
```

direct multiplication verifies the Sylvester equation, and

```math
\Phi_0(I)=I+\begin{bmatrix}0&3/280\\-3/280&0\end{bmatrix},
\qquad
\|\Phi_0(I)\|_{\mathrm{op}}=
\sqrt{1+\frac9{78400}}>1.
```

Each elementary map $`Z\mapsto E_iZF_j`$ is selfadjoint for the complex Hilbert–Schmidt inner product, as is $`Z\mapsto F_jZE_i`$. Their coefficients are real. Hence $`\Phi_t`$ is Hilbert–Schmidt selfadjoint, and duality makes its induced trace-norm and operator-norm bounds equal. Both exceed one at this pair for $`t=0`$, and continuity preserves the strict failure for sufficiently small positive $`t`$.

This excludes only the displayed multiplier. It does not prove that every linear map sending $`S`$ to $`C_t`$ fails endpoint contractivity.

## A positive-block reduction already present in the literature

For $`0<t\leq1/2`$, set

```math
P=A^t,\quad Q=B^t,\quad U=A^{1-2t},\quad V=B^{1-2t},
\qquad
R_t=B^tA^{1-2t}B^t+A^tB^{1-2t}A^t.
```

For positive definite matrices, with endpoint cases obtained where appropriate by continuity, the following factorization is exact:

```math
\begin{bmatrix}P&Q\\Q&P\end{bmatrix}
\begin{bmatrix}U&0\\0&V\end{bmatrix}
\begin{bmatrix}P&Q\\Q&P\end{bmatrix}
=\begin{bmatrix}S&C_t^*\\C_t&R_t\end{bmatrix}\geq0.
```

The standard block-matrix Cauchy–Schwarz inequality therefore gives, for every unitarily invariant norm,

```math
\|C_t\|_u^2\leq\|S\|_u\,\|R_t\|_u.
```

Thus $`R_t\prec_w S`$ would suffice for the full target. It is a stronger sufficient statement, not an established fact of this checkpoint. At $`t=1/2`$ one has $`R_t=S`$ for positive definite summands; the desired conclusion for semidefinite summands follows by regularization.

This sandwiched expression is already the functional studied by Mostafa Hayajneh, Saja Hayajneh, and Fuad Kittaneh, *A Unitarily Invariant Norm Inequality for Positive Semidefinite Matrices and a Question of Bourin*, Results in Mathematics 78:158 (2023), [DOI10.1007/s00025-023-01929-z](https://doi.org/10.1007/s00025-023-01929-z). Their notation uses the complementary parameter. The publisher abstract and its first-page preview give exactly

```math
\|R_t\|_u\leq 2^{1-4t}\|S\|_u,\qquad 0\leq t\leq1/4.
```

The same preview explicitly connects the constant-one endpoint to Bourin's inequality at $`t=1/4`$. Only the publisher abstract and first page of this nine-page paper were available in this check, so this note makes no assertion about its other intermediate statements. It records the prior route to prevent mistaking the block reduction or the sandwiched functional for a new conjecture resolution.
