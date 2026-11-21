# Independent review of the C44 asymptotic gap

Reviewed 20 November 2026 (America/Chicago) against the frozen draft
[radial asymptotic note](c44_radial_asymptotic_gap.md).

The determinant estimate and both hypothesis-obstruction families pass
review. They do not establish a permanent comparison or resolve C44.
No numerical test is needed for the identities below.

## Determinant estimate

Let $`d=n-1\ge2`$, $`Q=I-\mathcal J/n`$, and $`X_0=-Q/d`$. Zero row and
column sums give $`QD=DQ=D`$; the zero diagonal gives
$`\mathop{\mathrm{tr}}D=0`$. Hence

```math
\langle X_0,D\rangle_F=0,\qquad
\|X_0+D\|_F^2=1/d+\|D\|_F^2.
```

Both operators preserve $`\mathbf1^\perp`$ and annihilate $`\mathbf1`$.
If $`\|X_0+D\|_{\mathrm{op}}<1`$, their squared singular values on this
$`d`$-dimensional space lie in $`[0,1)`$. Jensen's inequality therefore
gives exactly

```math
\Psi(X_0+D)-\Psi(X_0)
\ge-\frac d2\log\left(1-\frac{d\|D\|_F^2}{d^2-1}\right)
\ge\frac{d^2}{2(d^2-1)}\|D\|_F^2.
```

The logarithm is defined because the mean squared singular value is
strictly below one. The weaker coefficient $`1/2`$ used in the draft is
valid. The separate Schatten-power proof also passes: its higher-power
first variations are scalar multiples of $`\mathop{\mathrm{tr}}(QD)=0`$.
The exclusion of $`n=2`$ is necessary for this finite determinant model.

## Permutation-mixture family

For a derangement matrix $`P_n`$,

```math
\langle P_n,U_n\rangle_F=\|U_n\|_F^2=\frac n{n-1},
\quad
\|P_n-U_n\|_F^2=\frac{n(n-2)}{n-1}.
```

Thus the draft's convex mixture is zero-diagonal and doubly stochastic,
and with $`t_n=n^{-3/4}`$ its squared distance from $`U_n`$ is precisely

```math
\frac{n-2}{(n-1)\sqrt n}.
```

At each of the $`n`$ permutation positions,

```math
E_{ij}=\frac1{n-1}+nt_n\frac{n-2}{n-1}\sim n^{1/4}.
```

The empirical absolute $`p`$-moment is consequently at least
$`n^{p/4-1}(1+o(1))`$, which diverges for every fixed $`p>4`$.
This is an entire family, not a numerical order check. Its centered
operator norm is bounded by $`(1-t_n)/(n-1)+t_n`$, which tends to zero.
The failed moment premise cannot be attributed to a disappearing
spectral gap.

## Bounded-entry rank-one family

For even $`n\ge4`$, let $`x=e_1-e_2`$, let $`y_1=y_2=0`$, and assign equal
numbers of $`+1,-1`$ to the other coordinates. For $`0\lt a<1`$,

```math
D=(a/n)xy^{\mathsf T}
```

has zero margins and zero diagonal. Its negative entries have magnitude
$`a/n<1/(n-1)`$, so $`U_n+D`$ is positive at every allowed off-diagonal
position. Its exact squared Frobenius norm is

```math
\|D\|_F^2=\frac{2a^2(n-2)}{n^2}.
```


For $`E=n(U_n+D-\mathcal J/n)`$, the diagonal is $`-1`$, unperturbed
off-diagonal entries are $`1/(n-1)`$, and the changed entries are
$`1/(n-1)\pm a`$. Thus the uniform entry bound $`2`$ is valid.
Once $`a>1/(n-1)`$, the first two absolute row sums are exactly

```math
a(n-2)+1+\frac1{n-1}.
```

Every other absolute row sum is $`2`$. Columns 1 and 2 also have absolute
sum $`2`$; every remaining column has absolute sum

```math
2+2a-\frac2{n-1}.
```

Therefore the maximum absolute row/column line sum satisfies
$`L(E)/n\to a`$, as claimed. Meanwhile
$`\|U_n+D-\mathcal J/n\|_{\mathrm{op}}
\le1/(n-1)+\|D\|_F\to0`$.

## Source assumptions checked directly

The review inspected the cited primary documents, without repeating a
literature search:

- [McCullagh's author PDF](https://www.stat.uchicago.edu/~pmcc/pubs/dspermanent.pdf),
  Section 3, defines weak boundedness by bounded empirical absolute
  moments of every fixed order. Its displayed leading determinant has
  parameter $`1`$; the later numerical modification uses
  $`n/(n-1)`$. Section 3's eigenvalue/operator-norm terminology is
  inconsistent with the singular-value wording in Section 4.1. The
  draft identifies that ambiguity, and both constructed sequences
  satisfy the stronger vanishing singular-value condition anyway.
- [Li's primary manuscript](https://arxiv.org/html/2608.01671v1),
  Theorem 2.1 and equation (2.1), use the maximum absolute row/column
  line sum, a fixed entry bound $`C_0`$, and a prescribed
  $`\eta_n\to0`$. The error constant depends only on $`C_0`$, whereas
  the sufficiently-large-order threshold may also depend on the
  sequence $`\eta_\bullet`$. Entrywise nonnegativity permits zeros.
  The draft states these requirements correctly.

The first family violates the moment and fixed-entry premises. The
second has fixed bounded entries but violates $`L(E)=o(n)`$. Neither
failure asserts that the corresponding permanent approximation is false
on that family; each shows that the stated theorem cannot be invoked
from Frobenius confinement alone.

## Residual estimate and scope

The first derivatives of both $`\log\mathop{\mathrm{per}}`$ and $`\Psi`$
vanish at $`U_n`$ along the stated tangent space. The former follows
because all off-diagonal cofactors are equal; the latter follows from
its gradient being a scalar multiple of $`Q`$.

A bound

```math
R_n(U_n+D)-R_n(U_n)
\ge-(1/2-\varepsilon)\|D\|_F^2
```

would combine with the determinant margin to give strict improvement
away from $`U_n`$, within its justified domain. Separate bounds on the
two values of $`R_n`$, even of order $`n^{-2}`$, do not imply this
quadratically vanishing difference bound when $`D`$ is arbitrarily
small. The draft leaves this step, the confinement constants, and any
required order coverage explicitly unresolved.

No mathematical correction was required.
