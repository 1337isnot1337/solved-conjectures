# Entropy derivative at the Hilbert–Schmidt exponent

Research toward [Audenaert’s conjecture, issue 213](https://github.com/1337isnot1337/solved-conjectures/issues/213). This is a necessary condition and a possible counterexample mechanism. The entropy inequality below has not been proved or refuted here.

## 1. Exact statement

Let `T` be a nonzero complex matrix partitioned into two compatible block rows and finitely many block columns. Normalize its Frobenius norm to one. Set

```math
w_{ij}=\|T_{ij}\|_2^2,\qquad B_{ij}=\sqrt{w_{ij}},\qquad
\rho=TT^*,\qquad \sigma=BB^*.
```

Both `rho` and `sigma` have trace one. For a positive weight define

```math
\rho_{ij}=\frac{T_{ij}T_{ij}^*}{w_{ij}}.
```

Omit zero-weight terms. All entropies below use natural logarithms and the convention `0 log 0=0`:

```math
S(R)=-\mathop{\mathrm{Tr}}(R\log R).
```

For `p>0`, let `C_p(T)` be the scalar matrix of the Schatten `p` norms of the individual blocks, and put

```math
F(p)=\log\|T\|_p-\log\|C_p(T)\|_p.
```

Then `F(2)=0`, and the derivative exists even when blocks or Grams are singular:

```math
F'(2)=\frac14\left[
S(\sigma)+\sum_{i,j}w_{ij}S(\rho_{ij})-S(\rho)
\right].
\tag{1}
```

Consequently either branch of the full conjecture in a neighborhood of two requires

```math
S(TT^*)\ge S(BB^*)+
\sum_{i,j}w_{ij}S(\rho_{ij}).
\tag{2}
```

If one finite compatible block matrix violates (2) strictly, then that matrix violates Audenaert’s upper inequality for every `p>2` sufficiently close to two and its lower inequality for every `p<2` sufficiently close to two. This would refute the original universal conjecture. It would be one resolution, not separate results for different exponents.

## 2. The original matrix term

Let `lambda_k` be the eigenvalues of `rho`. Its positive eigenvalues sum to one. Then

```math
\log\|T\|_p=\frac1p\log\left(\sum_k\lambda_k^{p/2}\right),
\qquad
\left.\frac{d}{dp}\log\|T\|_p\right|_{p=2}
=\frac14\sum_k\lambda_k\log\lambda_k
=-\frac14S(\rho).
\tag{3}
```

Zero eigenvalues contribute identically zero and cause no differentiation problem.

## 3. The compressed entries depend on p

Fix a nonzero block `X`, write `w=||X||_2^2`, and let `tau=XX*/w`. For

```math
z_X(p)=\|X\|_p^2
=\left(\mathop{\mathrm{Tr}}(XX^*)^{p/2}\right)^{2/p},
```

differentiation gives

```math
z_X'(2)
=\frac12\mathop{\mathrm{Tr}}(XX^*\log(XX^*))
-\frac{w}{2}\log w
=-\frac{w}{2}S(\tau).
\tag{4}
```

A zero block has `z_X(p)=0` identically. In particular, with

```math
M(p)=C_p(T)C_p(T)^*,
```

we have

```math
M(2)=\sigma,\qquad
\mathop{\mathrm{Tr}}M'(2)
=-\frac12\sum_{i,j}w_{ij}S(\rho_{ij}).
\tag{5}
```

Set `Z(p)=Tr M(p)^(p/2)`. If `sigma` is positive definite, ordinary spectral differentiation yields

```math
Z'(2)
=\mathop{\mathrm{Tr}}M'(2)
+\frac12\mathop{\mathrm{Tr}}(\sigma\log\sigma)
=-\frac12\left[
\sum_{i,j}w_{ij}S(\rho_{ij})+S(\sigma)
\right].
\tag{6}
```

Here `Z(2)=1`, so

```math
\left.\frac{d}{dp}\log\|C_p(T)\|_p\right|_{p=2}
=\left.\frac{d}{dp}\frac{\log Z(p)}p\right|_{p=2}
=\frac12 Z'(2).
\tag{7}
```

Equations (3), (6), and (7) prove (1). Treating `C_p(T)` as a constant matrix while differentiating would incorrectly omit the weighted block entropies.

## 4. Singular compressed Grams

Every nonzero block norm is a real analytic function of `p` near two: its positive singular values are fixed, and its power sum is strictly positive. A zero block norm is identically zero. Thus the entries of `M(p)` are real analytic near two, and `M(p)` is positive semidefinite on a two-sided neighborhood.

Because `Tr M(2)=1`, a singular two-by-two `M(2)` has eigenvalues one and zero. The two eigenvalues are simple there and have real analytic continuations. The small eigenvalue `mu(p)` is nonnegative on both sides and vanishes at two, so `mu'(2)=0` and `mu(p)=O((p-2)^2)`. On a small neighborhood with `p/2>3/4`,

```math
0\le\mu(p)^{p/2}=O(|p-2|^{3/2})=o(|p-2|).
```

Its derivative contribution to `Z` is zero, as are `mu'(2)` and the term `mu(2) log mu(2)`. The positive eigenvalue gives exactly the remaining terms in (6). Hence the derivative formula includes singular `sigma`, singular blocks, and zero blocks. The normalization excludes only the identically zero matrix, for which both norm inequalities are equalities.

## 5. What ordinary entropy concavity gives

The standard average-entanglement bound supplies only

```math
S(TT^*)\ge\sum_{i,j}w_{ij}S(\rho_{ij}).
\tag{8}
```

One can see this without introducing any operational terminology. Write `T_i` for the entire `i`th block row and `r_i=||T_i||_2^2`. Since

```math
T^*T=\sum_iT_i^*T_i,
```

entropy concavity and equality of the nonzero spectra of `T_i*T_i` and `T_iT_i*` give

```math
S(TT^*)=S(T^*T)
\ge\sum_i r_i S(T_iT_i^*/r_i).
```

Apply concavity once more to

```math
T_iT_i^*=\sum_jT_{ij}T_{ij}^*
```

to obtain (8). Zero row masses are omitted. This argument provides no additional `S(BB*)` term. That term is nonnegative and is the substantive gap in (2).

When `B` has rank one, its entropy term vanishes, so (8) proves the derivative condition. This is already inside Audenaert’s known full rank-one-compression case. For a nonnegative scalar matrix `C` and an arbitrary matrix `X`, the tensor family `T=C tensor X` attains equality of the original norm expressions at every exponent, so its derivative vanishes. Neither observation is a new resolution.

## 6. Relevant prior entropy work

Tang–Zhu–Bai–Wang, [arXiv:2609.28592v1](https://arxiv.org/html/2609.28592v1), Theorem 4.2 and Appendix A, prove the triangular block entropy inequality. The OpenAI manuscript [*Classical capacity and entropy inequalities for generalized amplitude damping*](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Classical-capacity-and-entropy-inequalities-for-generalized-amplitude-damping-September-24-2026/build/sections/block.tex) gives a direct proof of its one-zero-block case and explicitly distinguishes it from the general norm-compression conjecture. This is a prior positive case of the entropy condition, not evidence that (2) holds for all blocks.

Peixue Wu’s [*Additivity of classical communication* repository](https://github.com/pxwu24/additivity-of-classical-communication) states a Schur-weighted block entropy theorem for a positive block operator with a scalar positive Schur factor and block-diagonal noise. Its relation to unrestricted sums of coherent block-column Grams requires an additional argument. No implication to (2) or to Audenaert’s full inequality is claimed here.
