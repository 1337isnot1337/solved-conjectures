# Lieb's permanental dominance conjecture

Date: 20 November 2026, America/Chicago.

Status: an exact obstruction to a family of proposed rank-reduction
arguments. This note does not resolve MINC Conjecture 42 or Problem 2, and
does not count as a full conjecture resolution. Its principal inequality is
an application of Sra's published normalized Schur-function theorem; no
novelty claim is made for that theorem or for the Schur--Weyl averaging
identity.

## 1. The question and the obstruction

The companion note `isotypic_rank_lifting.md` proves that a linear
inequality involving only one Fourier block can be lifted from its minimal
nonvanishing Gram rank. An inequality comparing that block with the
permanent acquires different averaging factors. We determine the best
possible relative factor for an entire class of positive rank reductions.

Let $`A=W^*W`$, where $`W`$ has $`r`$ rows. Let $`T`$ be a random
positive semidefinite $`r\times r`$ matrix whose law is invariant under
unitary conjugation, and suppose

```math
\mathop{\mathrm{rank}}T\leq s\leq r,
\qquad \mathbb E\|T\|^n<\infty,
\qquad \Pr(T\ne0)>0.
```

Put $`B=W^*TW`$, so that $`\mathop{\mathrm{rank}}B\leq s`$. For a
partition $`\lambda\vdash n`$ with $`\ell(\lambda)\leq r`$, use
the convention

```math
C_\lambda(A)=\sum_{\sigma\in S_n}
       \left(\prod_i a_{i,\sigma(i)}\right)\rho_\lambda(\sigma).
```

There are nonnegative scalars $`\beta_\lambda`$, independent of
$`W`$, such that

```math
\mathbb E C_\lambda(B)=\beta_\lambda C_\lambda(A),
\qquad
\mathbb E\mathop{\mathrm{per}}B=\beta_{(n)}\mathop{\mathrm{per}}A.
\tag{1}
```

Define the content ratio

```math
r_\lambda(k)=
\frac{\prod_{(i,j)\in\lambda}(k+j-i)}
     {k(k+1)\cdots(k+n-1)}.
\tag{2}
```

If $`\ell(\lambda)\leq s`$, then

```math
\boxed{
\frac{\beta_\lambda}{\beta_{(n)}}
\leq \frac{r_\lambda(s)}{r_\lambda(r)}.}
\tag{3}
```

Equality in (3) is attained by $`T=tUP_sU^*`$, where $`t>0`$,
$`U`$ is Haar unitary, and $`P_s`$ is an orthogonal projection of
rank $`s`$. Thus Haar projection is optimal simultaneously for every
partition. Arbitrary eigenvalue distributions, random positive scales, and
positive mixtures cannot improve its relative factor. If
$`\ell(\lambda)>s`$, the numerator in (3) is zero instead.

For every nontrivial partition $`\lambda\ne(n)`$, the right side of
(3) is strictly below one whenever
$`\ell(\lambda)\leq s<r`$. The relative loss is therefore intrinsic
to this class of rank reductions.

## 2. The averaging factors

Write $`s_\lambda`$ for the Schur polynomial and
$`h_n=s_{(n)}`$ for the complete homogeneous symmetric polynomial.
Then

```math
\boxed{\beta_\lambda=
\frac{\mathbb E s_\lambda(T)}{s_\lambda(1^r)}.}
\tag{4}
```

Here $`s_\lambda(T)`$ means evaluation at the eigenvalues of $`T`$.
To verify (4), decompose

```math
(\mathbb C^r)^{\otimes n}
 =\bigoplus_{\ell(\lambda)\leq r}
     S_\lambda(\mathbb C^r)\otimes V_\lambda
```

under the commuting unitary and symmetric-group actions. The operator
$`T^{\otimes n}`$ acts as $`S_\lambda(T)\otimes I`$ on the
$`\lambda`$ summand. Unitary conjugation invariance makes its expectation
a scalar on $`S_\lambda(\mathbb C^r)`$. Its trace is
$`\mathbb E s_\lambda(T)`$, and that representation has dimension
$`s_\lambda(1^r)`$, proving (4).

For completeness, put $`w=w_1\otimes\cdots\otimes w_n`$, where the
$`w_i`$ are the columns of $`W`$. The products
$`\prod_i b_{i,\sigma(i)}`$ are matrix coefficients of
$`T^{\otimes n}`$ followed by tensor-factor permutations. Every matrix
entry of $`C_\lambda(B)`$ extracts the $`\lambda`$ isotypic part of
these coefficients. Multiplying that part by the scalar in (4) proves
(1), without any assumption that an individual generalized matrix function
is an eigenvalue.

The moment hypothesis makes the expectations finite. Since
$`h_n(T)>0`$ whenever $`T\ne0`$, the assumptions also give
$`\beta_{(n)}>0`$, so the ratio in (3) is well-defined.

## 3. Sra's theorem proves optimality

Sra's Theorem 2 states that if $`\lambda\preceq\mu`$ in dominance
order, then for every $`x\in\mathbb R_{\geq0}^s`$,

```math
\frac{s_\lambda(x)}{s_\lambda(1^s)}
\leq
\frac{s_\mu(x)}{s_\mu(1^s)}.
\tag{5}
```

All partitions of $`n`$ are dominated by $`(n)`$. Apply (5) to the
at most $`s`$ nonzero eigenvalues of each outcome of $`T`$, padding
with zeros if necessary. This gives the pointwise bound

```math
s_\lambda(T)
\leq \frac{s_\lambda(1^s)}{h_n(1^s)}h_n(T).
```

Take expectations and use (4):

```math
\frac{\beta_\lambda}{\beta_{(n)}}
\leq
\frac{s_\lambda(1^s)/s_\lambda(1^r)}
     {h_n(1^s)/h_n(1^r)}.
\tag{6}
```

The hook-content formula says

```math
s_\lambda(1^k)
 =\frac{\prod_{(i,j)\in\lambda}(k+j-i)}{\prod_{u\in\lambda}h(u)},
\qquad
h_n(1^k)=\frac{k(k+1)\cdots(k+n-1)}{n!}.
```

The hook factors cancel between the ranks $`s`$ and $`r`$, turning
(6) into (3). For $`T=tUP_sU^*`$, every nonzero eigenvalue is $`t`$,
so homogeneity gives equality in each displayed ratio. The same attainment
holds if the common scale is randomized with a finite, positive $`n`$th
moment. No uniqueness assertion about equality is needed here.

More generally, (6) holds with $`h_n`$ replaced by $`s_\mu`$ whenever
$`\lambda\preceq\mu`$, both partitions have at most $`s`$ rows,
and the corresponding denominator expectation is positive. Thus the same
projection is optimal for the relative factors of any such pair of blocks.

## 4. Strict loss and mixtures of projection dimensions

Number the cells of $`\lambda`$ in row order. If $`(i,j)`$ has
number $`k=\lambda_1+\cdots+\lambda_{i-1}+j`$, then

```math
r_\lambda(x)
 =\prod_{(i,j)\in\lambda}\frac{x+j-i}{x+k-1}
\qquad (x\geq\ell(\lambda)).
\tag{7}
```

For cells in the first row the factor is one. In every lower row,
$`k-1>j-i`$, and the factor is positive, below one, and strictly
increasing in $`x`$. Therefore a nontrivial $`r_\lambda(x)`$ is
strictly increasing, is below one, and tends to one as $`x`$ tends to
infinity. In particular

```math
0\lt r_\lambda(s)/r_\lambda(r)<1
\quad\text{if}\quad
\ell(\lambda)\leq s\lt r.
```

A positive mixture of maps has a ratio
$`\beta_\lambda/\beta_{(n)}`$ equal to a weighted average of the
component ratios; the weights are proportional to the permanent
multipliers. Consequently it cannot exceed the largest component ratio.
With a fixed rank cap, (3) already applies directly to the mixture. Mixing
smaller projection dimensions cannot outperform the largest allowed
dimension.

For comparison, a standard complex Gaussian $`r\times s`$ matrix $`G`$ gives
$`T=GG^*`$ and the exact factors

```math
\beta_\lambda=c_\lambda(s)
 :=\prod_{(i,j)\in\lambda}(s+j-i),
\qquad \beta_{(n)}=(s)^{\overline n}.
```

Here the Gaussian entries are independent with $`\mathbb E|G_{ij}|^2=1`$.
Its relative factor is $`r_\lambda(s)`$, below the optimal Haar factor
$`r_\lambda(s)/r_\lambda(r)`$ for a nontrivial block. Even the
optimal factor remains below one when the rank is genuinely reduced.

These statements concern nonnegative averaging. A signed linear combination
does not preserve an inequality merely because each averaged inequality is
valid.

## 5. The order-six exceptional subgroup calculation

For $`\lambda=(3,3)`$,

```math
r_{(3,3)}(k)
 =\frac{k(k-1)(k+1)}{(k+3)(k+4)(k+5)}.
```

The values relevant to the preceding rank-two work are

| Ambient rank $`r`$ | $`r_{(3,3)}(r)`$ | Best ratio for rank cap two |
| --- | --- | --- |
| 3 | $`1/14`$ | $`2/5`$ |
| 4 | $`5/42`$ | $`6/25`$ |
| 5 | $`1/6`$ | $`6/35`$ |
| 6 | $`7/33`$ | $`33/245`$ |

Here $`r_{(3,3)}(2)=1/35`$. For ambient rank six, a Haar rank-two
projection gives

```math
\beta_{(3,3)}=\frac1{490},\qquad
\beta_{(6)}=\frac7{462}=\frac1{66},
\qquad
\frac{\beta_{(3,3)}}{\beta_{(6)}}=\frac{33}{245}.
```

The pure-block Segre alignment inequality therefore lifts, as established
in `isotypic_rank_lifting.md`. A comparison with the permanent receives the
loss in the table. For example, averaging a rank-two inequality of the form
$`L(C_{(3,3)}(B))\leq\mathop{\mathrm{per}}B`$, with $`L`$ linear, gives

```math
L(C_{(3,3)}(A))
\leq\frac{\beta_{(6)}}{\beta_{(3,3)}}\mathop{\mathrm{per}}A,
```

when $`\beta_{(3,3)}>0`$. This route alone cannot retain coefficient
one. The determinant component vanishes under a rank-two projection, so
the projection also does not recover it. Additional comparisons or
corrections require separate arguments; they are not consequences of
scalar block averaging.

## 6. What is and is not excluded

The theorem covers all random PSD metrics with a unitary-invariant law and
a prescribed rank cap, including random spectra and scales. It also covers
a fixed noninvariant law if that law has the universal scalar identities
(1) for every $`W`$: replacing $`T`$ by $`UTU^*`$, with independent
Haar $`U`$, preserves those identities, since
$`(U^*W)^*(U^*W)=W^*W`$, and reduces to the invariant case.

This does not exclude choices of a metric that depend on the individual
Gram configuration, nonlinear normalization with configuration-dependent
weights, signed decompositions supported by further inequalities, or
arguments using several coupled blocks. None of those has been supplied
here. In particular, the original permanental dominance conjecture remains
open in this work.

## Sources

1. Suvrit Sra, “On inequalities for normalized Schur functions,” *European
   Journal of Combinatorics* **51** (2016), 492--494, Theorem 2.
   [Primary author PDF](https://optml.mit.edu/papers/sra_schur_published.pdf),
   [DOI](https://doi.org/10.1016/j.ejc.2015.07.005).
   This proves (5), including nonnegative variables by continuity.
2. Sho Matsumoto and Jonathan Novak, “Jucys--Murphy Elements and Unitary
   Matrix Integrals,” equations (1.5)--(1.6).
   [Primary preprint](https://arxiv.org/pdf/0905.1992).
   These give the cycle-class and content-product identities used for the
   Gaussian comparison. The Schur--Weyl derivation of (4) is included above.
3. [MINC Conjecture 42](https://yair-lavi.com/mincs-list/conjecture-42/index.html)
   and [MINC Problem 2](https://yair-lavi.com/mincs-list/problem-2/index.html)
   specify the full problems. This note resolves neither.
