# Lieb's permanental dominance conjecture

Date: 20 November 2026, America/Chicago. Status: an audit of rank-two averaging and possible
diagonal-product or determinant corrections. No full MINC problem is
resolved. The formal separator below is not a Gram-matrix counterexample.

## 1. Scope and the reviewed projection theorem

The companion note
`research/minc/continuation-2026-11-20/inequalities/mixed_block_projection_obstruction.md` proves the
optimal relative Fourier multiplier for unitarily invariant random PSD
metrics with a prescribed rank cap. Its proof has been independently
reviewed here. In particular, for

```math
A=W^*W,\qquad B=W^*TW,\qquad \operatorname{rank}T\le2,
```

where $`W`$ has $`r\ge3`$ rows and the law of $`T`$ is invariant under
unitary conjugation, write

```math
\mathbb E C_\lambda(B)=\beta_\lambda C_\lambda(A).
```

Assume a finite sixth moment and a nonzero law. With
$`\beta_6=\beta_{(6)}>0`$ and $`\beta_{33}=\beta_{(3,3)}`$, the exact
optimal ratio is

```math
\frac{\beta_{33}}{\beta_6}
\le\kappa_r:=\frac{1/35}{r_{33}(r)}\le\frac25,
\qquad
r_{33}(r)=\frac{r(r-1)(r+1)}{(r+3)(r+4)(r+5)}.
\tag{1}
```

The values for ambient ranks 3, 4, 5, 6 are respectively
$`2/5,6/25,6/35,33/245`$. Haar rank-two projections attain them.

As an elementary check of this specialization, if the two possibly nonzero
eigenvalues of $`T`$ are $`a,b`$, then
$`s_{33}(T)=(ab)^3`$ and

```math
h_6(a,b)=a^6+a^5b+a^4b^2+a^3b^3+a^2b^4+ab^5+b^6
\ge7(ab)^3.
```

For positive $`a,b`$, this is the sum of three reciprocal-pair AM--GM
inequalities and the central term, after division by $`(ab)^3`$; zero
eigenvalues follow directly. Combined with
$`\beta_\lambda=\mathbb E s_\lambda(T)/s_\lambda(1^r)`$, it proves
(1). The general companion theorem is an application of Sra's
[published Theorem 2](https://optml.mit.edu/papers/sra_schur_published.pdf),
not a new normalized Schur-function inequality.

I checked the general companion proof's Schur--Weyl normalization, padding
with zero eigenvalues, hook-content cancellation, row-order monotonicity,
and positive-mixture argument. Its extension to a fixed noninvariant law
with universal scalar identities for every $`W`$ is also valid: twirling
the law preserves those identities by applying them to every $`U^*W`$.
No Specht-dimension factor is missing from its multiplier formula.

## 2. Averaging the diagonal-product correction

The proved rank-two inequalities include

```math
t_{33}(B)\le2P(B)-9h(B),\qquad
X_i(B)\le P(B)-\frac92h(B),
\tag{2}
```

where $`P=\operatorname{per}`$, $`h=\prod_j a_{jj}`$,
$`t_\lambda=\operatorname{tr}C_\lambda`$, and

```math
X_i(A)=\frac56\langle v_i,C_{33}(A)v_i\rangle.
```

The $`v_i`$ are the six unit exceptional sign-spherical vectors. In every
rank the actual subgroup function is
$`f_i(A)=\det(A)/6+X_i(A)`$. In rank two the determinant vanishes.

Fourier inversion at the identity gives

```math
h(A)=\frac1{720}\sum_{\lambda\vdash6}d_\lambda t_\lambda(A).
\tag{3}
```

Since the metric has rank at most two, only the four partitions
$`(6),(5,1),(4,2),(3,3)`$ survive averaging. Their Specht dimensions are
$`1,5,9,5`$, respectively. Therefore

```math
\mathbb E h(B)=\frac1{720}
\bigl(\beta_6P+5\beta_{51}t_{51}
           +9\beta_{42}t_{42}+5\beta_{33}t_{33}\bigr).
\tag{4}
```

This correction must not be treated as a scalar multiple of $`h(A)`$.
Averaging the first inequality in (2) yields exactly

```math
\frac{159}{80}\beta_6P
-\frac1{16}\beta_{51}t_{51}
-\frac9{80}\beta_{42}t_{42}
-\frac{17}{16}\beta_{33}t_{33}\ge0.
\tag{5}
```

The second yields

```math
\beta_6P-\beta_{33}X_i-\frac92\mathbb E h(B)\ge0.
\tag{6}
```

Thus including the diagonal-product correction introduces other central
traces. It does not remove the unequal multiplier issue automatically.

## 3. Exact separator for these inequalities

The following is a formal assignment of Fourier-block data. No PSD Gram
matrix realizing it is asserted. Its purpose is to test what follows from
the listed inequalities alone.

Choose the six spherical vectors with
$`\langle v_i,v_j\rangle=-1/5`$ for $`i\ne j`$, and set

```math
P=1,\qquad D=0,\qquad
C_{33}=\frac3{10}I_5+\frac32v_1v_1^*,
\qquad C_\lambda=0\quad(\lambda\ne(6),(3,3)).
\tag{7}
```

Here $`C_{(6)}`$ is the scalar one and $`D=C_{(1^6)}`$. Every block is
PSD. The nonzero eigenvalues of $`C_{33}`$ are $`9/5`$ and four copies
of $`3/10`$, so

```math
t_{33}=3,\quad t_{51}=t_{42}=0,\quad
X_1=\frac32,\quad X_i=\frac3{10}\ (i\ne1).
\tag{8}
```

Equation (3) assigns $`h=(1+5\cdot3)/720=1/45`$. The pure-block alignment
inequalities $`X_i\le t_{33}/2`$ all hold, with equality at $`i=1`$.
The Fourier data also define a positive-definite function on $`S_6`$,
because all its Fourier blocks are positive; this does not assert that the
function is a collection of permutation monomials of a Gram matrix.

For every metric in (1), the left side of (5), evaluated at (7), is

```math
\frac{159}{80}\beta_6-\frac{51}{16}\beta_{33}
\ge\left(\frac{159}{80}-\frac{51}{16}\frac25\right)\beta_6
=\frac{57}{80}\beta_6>0.
\tag{9}
```

The smallest left side of (6) occurs at $`i=1`$, and equals

```math
\frac{159}{160}\beta_6-\frac{51}{32}\beta_{33}
\ge\frac{57}{160}\beta_6>0.
\tag{10}
```

All six inequalities therefore hold for every such metric and every
positive mixture. Nevertheless the desired dominance comparison fails
at the level of these formal data:

```math
P-\left(D/6+X_1\right)=1-3/2=-1/2.
```

This proves a precise limitation: the averaged inequalities (5)--(6),
the all-rank alignment inequalities, block positivity, and the trace
identity (3) do not imply full dominance as constraints on Fourier data.
In particular, no nonnegative combination of those inequalities plus
determinant terms can supply that implication. An additional relation
specific to realizable Gram matrices is required.

## 4. Determinant terms and signed averages

The determinant of every projected rank-two matrix is zero. Adding a
determinant term before averaging cannot change (5) or (6). Adding a finite
multiple of $`\det A`$ afterwards also cannot eliminate the separator,
because $`D=0`$ there. More generally, determinants vanish on actual
rank-three through rank-five inputs, so they cannot by themselves compensate
for the nontrivial loss of the $`(3,3)`$ multiplier in those ranks.

Signed combinations can formally invert some multiplier losses, but
positivity is then lost. For example, Gaussian widths one and two give
permanent multipliers $`720,5040`$, while their $`(3,3)`$ multipliers
are $`0,144`$. Matching both target multipliers to one requires weights

```math
a_2=1/144,\qquad a_1=-17/360.
```

The negative first weight shows why this formal inversion is not a valid
positive averaging argument. Any justification for a signed combination
would require an additional inequality, not just the known nonnegativity
of the averaged gaps.

## 5. Column normalization remains outside this obstruction

Global random scales and normalizations depending only on the eigenvalues
of $`T`$ are included in (1). Normalizing each projected Gram column
separately is different. For
$`\widehat B=D_B^{-1/2}BD_B^{-1/2}`$, every degree-six generalized
matrix function is divided by $`h(B)`$. Averaging then gives expressions
such as $`\mathbb E[C_\lambda(B)/h(B)]`$, with weights depending on the
particular original Gram vectors. Universal scalar block multipliers no
longer follow.

This failure is concrete at order six. Apply a Haar rank-two projection in
ambient dimension six and normalize each projected column. Starting from the all-ones correlation matrix
$`J=\mathbf1\mathbf1^*`$ leaves $`J`$, so a hypothetical universal permanent multiplier
would be one. Starting from $`I_6`$ produces a unit-diagonal rank-two Gram
matrix whose permanent is at least $`5040e^{-6}>1`$, by the prior
sphere bound in [Lemma 3.1 of Ma's preprint](https://arxiv.org/html/2609.37461v1).
The input permanent was one, contradicting that universal multiplier.

This example rejects the scalar-multiplier justification for such a
normalization; it does not exclude an argument using new bounds on its
configuration-dependent expectations. Nor does this audit exclude metrics
chosen from the individual Gram configuration or coupled higher-rank
constructions. No such additional comparison is proved here.

The exact remaining question is whether Gram realizability supplies a
mixed-block inequality strong enough for full permanent dominance. The
rank-two averaging identities and the reviewed corrections do not answer
that question. Full conjecture resolutions added: zero.
