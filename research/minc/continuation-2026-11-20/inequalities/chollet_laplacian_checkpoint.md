# Chollet's conjecture

Research checkpoint, 2026-11-21. These are exact variational identities and a
remaining sufficient condition. No proof of the sufficient condition is given.
No named conjecture is resolved by this document.

The separate `chollet_projection_checkpoint.md` proves an auxiliary result in
the region $`n\geq\mathop{\mathrm{rank}}(A)^2`$. This document investigates the
missing rank reduction. The inequality under investigation remains

```math
R(A):=\frac{\mathop{\mathrm{per}}(A\circ\overline A)}{
                  (\mathop{\mathrm{per}}A)^2}\leq1
```

for complex correlation matrices.

## 1. Gram-metric variations require no diagonal tangent constraint

Write $`A_{ij}=v_i^*v_j`$, with unit vectors $`v_i\in\mathbb C^r`$. For any
Hermitian $`r\times r`$ matrix $`H`$, set

```math
A_H(t)_{ij}=v_i^*(I+tH)v_j.
```

For sufficiently small real $`t`$, this is positive semidefinite with positive
diagonal. Its diagonal normalization is a correlation matrix of the same rank.
Positive diagonal congruence leaves $`R`$ unchanged. Consequently a local
maximum of $`R`$ over correlation matrices is stationary, with nonpositive
second derivative, along every Hermitian $`H`$.

The normalized path need not remain in the same face of the correlation
elliptope. This is a rank-preserving variation, not a claim that every such
path is a diagonal-preserving affine face direction.

Let $`H_1,\ldots,H_{r^2}`$ be an orthonormal real basis of the Hermitian
matrices for $`\langle H,K\rangle=\mathop{\mathrm{tr}}(HK)`$. Then

```math
\sum_a(v_i^*H_av_j)(v_k^*H_av_l)=A_{il}A_{kj}.
\tag{1}
```

This follows by expanding the standard diagonal, real symmetric, and imaginary
skew-symmetric matrix-unit basis. It includes the imaginary directions and
therefore applies to complex matrices, not just real ones.

## 2. Permutation monomials and their Laplacian

For $`\sigma\in S_n`$, put

```math
f_\sigma=\prod_i A_{i,\sigma(i)},\quad
f=(f_\sigma)_{\sigma\in S_n},\quad
P=\sum_\sigma f_\sigma=\mathop{\mathrm{per}}A,\quad Q=\|f\|^2.
```

Thus $`R=\|f/P\|^2`$. Let $`\partial_a`$ denote the derivative along
$`A_{H_a}(t)`$, and write $`\Delta=\sum_a\partial_a^2`$, evaluated at
the current matrix. For a transposition $`\tau`$, let
$`(R_\tau f)_\sigma=f_{\sigma\circ\tau}`$.

Using (1), the two differentiated factors of $`f_\sigma`$ exchange their
column indices. Therefore

```math
\Delta f_\sigma=2\sum_{\tau\text{ transposition}} f_{\sigma\circ\tau},
\qquad \Delta P=n(n-1)P.
\tag{2}
```

The second identity uses the sum over all permutations. It cannot be applied
separately to one factor of $`Q=\sum_\sigma f_\sigma\overline{f_\sigma}`$:
the conjugate factor is then still indexed by the original permutation.

Define two nonnegative energies:

```math
E=\sum_{\tau\text{ transposition}}\|f-R_\tau f\|^2,
\qquad
V=\sum_a\left\|\partial_a f-\frac{\partial_a P}{P}f\right\|^2.
\tag{3}
```

Equation (2) gives

```math
\mathop{\mathrm{Re}}\langle f,\Delta f\rangle=n(n-1)Q-E.
\tag{4}
```

Apply the quotient rule to $`u=f/P`$. Since $`P`$ is real and positive,

```math
\Delta u=\frac{\Delta f}{P}-\frac{\Delta P}{P}u
             -2\sum_a\frac{\partial_aP}{P}\partial_a u.
```

Taking the Laplacian of $`R=\|u\|^2`$ yields the exact drift identity

```math
\boxed{\quad
\Delta R+2\sum_a(\partial_a\log P)(\partial_aR)
 =\frac2{P^2}(V-E).
\quad}
\tag{5}
```

In particular, at a stationary ratio,

```math
\Delta R=\frac2{P^2}(V-E).
\tag{6}
```

No sign for $`V-E`$ has been proved. Positivity of $`V`$ and $`E`$
separately does not establish such a sign.

## 3. The transposition energy is an explicit squared-minor sum

Set $`C=A\circ\overline A`$. For a two-element subset $`I`$, let $`I^c`$
denote its complement. Then

```math
\boxed{\quad
E=2\sum_{\substack{|I|=2\\|J|=2}}
 |\det A[I|J]|^2\,\mathop{\mathrm{per}}C[I^c|J^c].
\quad}
\tag{7}
```

For $`\tau=(ij)`$, the difference $`f_\sigma-f_{\sigma\circ\tau}`$
factors as

```math
\left(A_{i,\sigma(i)}A_{j,\sigma(j)}
-A_{i,\sigma(j)}A_{j,\sigma(i)}\right)
\prod_{k\ne i,j}A_{k,\sigma(k)}.
```

Take its squared modulus. Summing over the remaining bijections gives the
complementary permanent in (7). Each unordered column pair has two orders,
which supplies the factor two.

Every summand in (7) is nonnegative, since $`C`$ is entrywise nonnegative.
This formula identifies exactly the energy that a successful derivative
argument would need to control.

For completeness, let $`T=\sum_a\|\partial_af\|^2`$. Expanding (1) gives

```math
T=\sum_{\sigma}\sum_{i,j}
 A_{ij}A_{\sigma(j),\sigma(i)}
 \left(\prod_{k\ne i}A_{k,\sigma(k)}\right)
 \left(\prod_{l\ne j}\overline{A_{l,\sigma(l)}}\right).
\tag{8}
```

This is nonnegative because it is a sum of squared derivative norms, despite
the possible complex phases in the displayed expansion. For correlation
matrices, its terms with $`i=j`$ sum to
$`\sum_{i,k}\mathop{\mathrm{per}}C(i|k)`$. Its remaining terms can be written

```math
\sum_{\substack{i\ne j\\k\ne l}}
A_{ij}A_{jl}A_{lk}A_{ki}\,
\mathop{\mathrm{per}}C(ij|kl).
```

The notation in the last display deletes ordered distinct row and column
indices; the resulting complementary submatrix does not depend on their order.

Let $`K`$ be the Hermitian matrix satisfying
$`\partial_HP/P=\mathop{\mathrm{tr}}(KH)`$. It is positive semidefinite and
$`\mathop{\mathrm{tr}}K=n`$, as follows from the symmetric-tensor expression for
the permanent and homogeneity. At a stationary ratio,

```math
V=T-Q\mathop{\mathrm{tr}}(K^2).
\tag{9}
```

Indeed stationarity says
$`\mathop{\mathrm{Re}}\langle f,\partial_af\rangle=Q\partial_aP/P`$,
which gives (9) upon expanding (3).

## 4. A precise sufficient ascent statement

Together with the separately proved rank-square bound, the prior results for
rank at most three, and Ma's rank-four result for $`n\geq10`$, the following
statement would resolve the full conjecture. Those prior results cover all
remaining cases with $`r^2\leq n`$; general rank four in orders seven through
nine is not being asserted here.

> At every stationary correlation matrix with $`R>1`$ and rank
> $`r`$ satisfying $`r^2>n`$, the energies in (3) satisfy $`V>E`$.

A global maximum exists because the correlation elliptope is compact and
$`P\geq1`$. If there were a violation, choose a global maximum with value
greater than one. The rank-square result and the stated prior results exclude
$`r^2\leq n`$, while the
stated strict energy inequality and (6) would contradict the nonpositive
trace of the Hessian at a local maximum.

This sufficient statement is unproved. It is not a new solved problem, and it
must not be listed as one. No ordinary Cauchy--Schwarz or variance inequality
found in this investigation compares the two sides as required.

The restriction to violating values matters. At $`A=I_n`$, the permutation
vector is the identity basis vector. Its normalized first derivative vanishes,
so $`V=0`$, whereas $`E=n(n-1)`$. Consequently the Hessian trace is negative
at this known maximum of value one. A proposed global inequality $`V\geq E`$
would already be false.

## 5. First-order stress at a global maximum

For a Hermitian matrix, write $`\mathop{\mathrm{cof}}_{\rm per}(A)`$ for the matrix
whose $`(i,j)`$ entry is $`\mathop{\mathrm{per}}A(i|j)`$, without a determinant
sign. Define

```math
M=\frac{\mathop{\mathrm{cof}}_{\rm per}(A)^T}{P},\qquad
N=\frac{A\circ\mathop{\mathrm{cof}}_{\rm per}(C)^T}{Q}.
```

For Hermitian perturbations $`B`$,
$`d\log P=\mathop{\mathrm{tr}}(MB)`$ and
$`d\log Q=2\mathop{\mathrm{tr}}(NB)`$. Both $`M`$ and $`N`$ are positive
semidefinite: permanent cofactor matrices are Gram matrices of symmetric
products, and the second assertion also uses the Schur product theorem.

At a global maximum of $`R`$, a positive rank-one perturbation $`A+tww^*`$,
followed by diagonal normalization, cannot increase the ratio. Hence

```math
W:=M-N\succeq0.
\tag{10}
```

Homogeneity gives $`\mathop{\mathrm{tr}}(AM)=\mathop{\mathrm{tr}}(AN)=n`$, so
$`\mathop{\mathrm{tr}}(AW)=0`$. Since both matrices are positive semidefinite,

```math
AW=WA=0.
\tag{11}
```

Suppose further that the order $`n`$ is minimal among counterexamples. Put
$`p_i=\mathop{\mathrm{per}}A(i|i)`$ and
$`q_i=\mathop{\mathrm{per}}C(i|i)`$. Then lower-order Chollet gives
$`q_i\leq p_i^2`$, and the one-vector case of Lieb's permanent inequality
gives $`p_i\leq P`$. If $`Q>P^2`$,

```math
W_{ii}=\frac{p_i}{P}-\frac{q_i}{Q}
>\frac{p_i}{P}-\frac{p_i^2}{P^2}\geq0.
\tag{12}
```

Thus $`W`$ is nonzero and supported on $`\ker A`$, proving that such a
maximizer is singular. This argument does not bound its rank by $`\sqrt n`$.
No further rank reduction is justified by (10)--(12).

## 6. Prior-work distinction

Zhang's accessible 2013 abstract reports singular and irreducible maximizing
partners. His [2016 survey, Section 5](https://scholars.nova.edu/ws/portalfiles/portal/42826589/An%20Update%20on%20a%20Few%20Permanent%20Conjectures.pdf)
defines that maximization as $`\max_X\mathop{\mathrm{per}}(A\circ X)`$, with
$`A`$ fixed, rather than maximization of $`R(X)`$. Its conclusions therefore
cannot be substituted for the missing argument in Section 4.

The rank bound for extreme points follows from the criterion in Li and Tam,
[A note on extreme correlation matrices (1994)](https://people.wm.edu/~cklixx/corr.pdf).
That is a statement about extreme points of a convex set. It does not state
that this nonlinear ratio has an extreme maximizer.

No full-scope conclusion has been obtained from these identities.
