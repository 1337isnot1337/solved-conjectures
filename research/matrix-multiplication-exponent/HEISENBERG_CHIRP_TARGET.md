# The Heisenberg target and the cost of the chirp coordinate

Status: a concrete target and an exact single-block construction. The coherent packing tested below produces commutative blocks and therefore does not prove a matrix multiplication bound. No low-rank Heisenberg construction is claimed.

## Boundary of monomial group constructions

Blasiak, Church, Cohn, Grochow, Naslund, Sawin and Umans, *On cap sets and the group-theoretic approach to matrix multiplication*, [arXiv:1605.06702v4](https://arxiv.org/abs/1605.06702v4), Discrete Analysis 2017:3, Theorem B, rule out exponent two from simultaneous-triple-product-property constructions in abelian groups whose exponents have one uniform bound. The published [journal introduction](https://discreteanalysisjournal.com/article/1245-on-cap-sets-and-the-group-theoretic-approach-to-matrix-multiplication) expressly leaves abelian groups of unbounded exponent outside this obstruction. The original strong-USP capacity conjecture is also excluded by the tricolored-sum-free-set bounds in that work.

Consequently a fixed-$`p`$ tensor-power STPP search is a blocked route. A family in $`(\mathbb Z/p\mathbb Z)^3`$ with $`p\to\infty`$ is not ruled out by that bounded-exponent theorem. Arbitrary rectangular linear compression is not the STPP construction model either. These distinctions identify the hypotheses; they do not produce a compression or an exponent improvement.

## A noncommutative target with the right direct-sum size

Let $`p`$ be an odd prime, let $`\zeta`$ be a primitive complex $`p`$th root of unity, and let $`H_p`$ be the group on $`\mathbb F_p^3`$ with law

```math
(x,y,z)(x',y',z')=(x+x',y+y',z+z'+yx').
```

For $`\lambda\ne0`$, the operators

```math
\rho_\lambda(x,y,z)e_t
=\zeta^{\lambda(z+yt)}e_{t+x}
```

form a representation. Direct substitution verifies the group law. The diagonal operator from $`(0,1,0)`$ has distinct eigenvalues, and the shift from $`(1,0,0)`$ cyclically permutes its eigenvectors. Their products span every matrix unit, so this representation supplies a full $`p\times p`$ matrix-algebra block.

The central Fourier idempotents

```math
e_\lambda=\frac1p\sum_{z\in\mathbb F_p}
\zeta^{-\lambda z}(0,0,z)
```

split the group algebra into $`p`$ summands of dimension $`p^2`$. For $`\lambda\ne0`$, the displayed representation identifies its summand with $`\mathop{\mathrm{Mat}}_p(\mathbb C)`$. For $`\lambda=0`$, the summand is the commutative group algebra of $`\mathbb F_p^2`$, whose ordinary Fourier transform gives $`p^2`$ scalar summands. Hence

```math
\mathbb C[H_p]\cong
\mathbb C^{p^2}\oplus
\bigoplus_{\lambda\in\mathbb F_p^*}\mathop{\mathrm{Mat}}_p(\mathbb C).
```

A multiplication-tensor rank bound $`p^{3+o(1)}`$ for this algebra would force $`\omega_{\mathbb C}=2`$. Indeed, choose a normalized three-party point attaining the maximum perimeter in [SPECTRAL_MODEL.md](SPECTRAL_MODEL.md). Additivity and multiplicativity give its value on this direct sum as $`p^2+(p-1)p^{\omega_{\mathbb C}}`$. Monotonicity bounds that value by the proposed rank. Taking logarithms and letting $`p`$ tend to infinity gives $`1+\omega_{\mathbb C}\le3`$. This describes the exact target; no such rank bound is constructed here.

## Exact factorization problem for a contracted polynomial source

Let $`B_L=\{0,\ldots,L-1\}^3`$. A local restriction of a fourth-party contraction of $`Q_L^{\otimes3}`$ to a target tensor $`T`$ is precisely a choice of matrices $`A,B,C`$ and an output coefficient array $`w`$ satisfying

```math
T_{xyz}=\sum_{u,v,t\in B_L}
A_{x,u}B_{y,v}C_{z,t}\,w_{u+v+t}.
```

The same formula with Laurent-polynomial maps and a specified leading coefficient describes a degeneration. For $`L=O(p)`$, the source has rank $`O(p^3)`$. A construction for the Heisenberg target, or for $`p^{1-o(1)}`$ full direct-sum blocks of $`MM_{p^{1-o(1)}}`$, would therefore suffice. In the latter alternative, the block count and edge size must retain their indicated exponents.

For monomial input embeddings $`f_A,f_B,f_C`$, this specializes to

```math
T_{xyz}=a_xb_yc_z\,
w_{f_A(x)+f_B(y)+f_C(z)}.
```

Thus target coefficients divided by the three local factors must agree whenever the three embedded indices have the same sum. This is an exact locality condition; assigning an arbitrary target-dependent weight after different triples have collapsed to the same output does not satisfy it.

## A chirp does generate one alternating Weyl phase

Work temporarily with cyclic indices in $`\mathbb F_p`$. Cyclic three-dimensional convolution is obtained from $`Q_p^{\otimes3}`$ by reducing each output degree modulo $`p`$. Its rank is $`p^3`$, by the ordinary Fourier transform.

Write $`a=(a_1,a_2)`$, $`b=(b_1,b_2)`$, and $`c=-a-b`$. The exact identity

```math
a_1b_2-a_2b_1
=(a_1+b_2)^2-c_1c_2-a_1^2+a_1a_2-b_2^2+b_1b_2
```

shows how to produce the alternating phase from one additional convolution coordinate. Embed the inputs by

```math
a\mapsto(a_1,a_2,a_1),\qquad
b\mapsto(b_1,b_2,b_2),\qquad
c\mapsto(c_1,c_2,0).
```

At the output, use coefficients

```math
w(s_1,s_2,s_3)
=\mathbf1_{s_1=0}\mathbf1_{s_2=0}\zeta^{\lambda s_3^2}.
```

Multiply the three input basis vectors by the local factors

```math
\zeta^{\lambda(-a_1^2+a_1a_2)},\quad
\zeta^{\lambda(-b_2^2+b_1b_2)},\quad
\zeta^{-\lambda c_1c_2},
```

respectively. The resulting coefficient is exactly

```math
\mathbf1_{a+b+c=0}\,
\zeta^{\lambda(a_1b_2-a_2b_1)}.
```

For nonzero $`\lambda`$, this is a Weyl-basis multiplication tensor for a full matrix algebra, after a harmless rescaling of the nonzero cocycle parameter. The construction is a genuine rectangular restriction, but it spends rank $`p^3`$ on one matrix block. It therefore does not improve the ordinary cubic bound.

## Why the natural central lift loses the phase

To try to recover $`p`$ blocks, give the three inputs extra free central indices $`u,v,t`$ and replace their third embedded coordinates by $`u+a_1`$, $`v+b_2`$, and $`t`$. For any central coefficient function $`\phi`$, the new central coefficient is

```math
\phi(u+v+t+a_1+b_2).
```

Write its Fourier expansion as

```math
\phi(s)=\sum_{\eta\in\mathbb F_p}\widehat\phi(\eta)\zeta^{\eta s}.
```

Fourier transformation of the three free central coordinates makes their block labels equal to one common $`\eta`$. Inside this block, the only new factor depending on $`a,b`$ is

```math
\widehat\phi(\eta)\zeta^{\eta a_1}\zeta^{\eta b_2}.
```

It separates into a scalar and two local factors. After the already local chirp corrections, the block is therefore locally isomorphic to untwisted commutative convolution on $`\mathbb F_p^2`$, whose Fourier decomposition consists of scalar blocks. It is not a matrix-algebra block.

This calculation rules out this specific coherent-packing attempt for every central function $`\phi`$, including quadratic Gauss chirps. It does not rule out arbitrary rectangular input mixing in the exact factorization problem above. Such mixing would have to couple the central Fourier blocks with the two other coordinates instead of merely translating a single central convolution kernel.
