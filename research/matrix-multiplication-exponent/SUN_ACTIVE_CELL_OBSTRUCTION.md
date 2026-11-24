# Sun v1: compression of the printed active correction cells

Research note, 23 November 2026 (America/Chicago). This note tests the
literal source accounting of Lemmas 10.3--10.4 in
[arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1). Its algebraic
compression lemma is unconditional. The budget contradiction applies to
the joint assertion that the stated bases exist and that the designated
source pairs have exactly the images claimed in the propagation proof.
It does not prove a lower bound above two for the exponent.

## A five-term identity without division

The numerical contradiction already follows from an identity that works
for any X-side linear operator $`U`$, without a diagonal assumption or
rational coefficients. Write

```math
A=z_0\sum_{i=1}^4x_i y_i+z_1x_2y_1+z_2x_4y_4,
\qquad J=x_2y_2z_1.
```

Equation (7.3), evaluated at its nonzero parameter value $`1`$, gives the
following four-term decomposition of $`A+J`$:

```math
\begin{aligned}
R_1={}&(-x_1+x_2)(-y_1)z_0
       +x_2(y_1+y_2)(z_0+z_1)\\
&+x_3y_3z_0+x_4y_4(z_0+z_2)=A+J.
\end{aligned}
```

Consequently the entire printed family from (10.4) satisfies

```math
\begin{aligned}
\mathcal C(t)
 &=U_XA+bJ+\sigma t\,U_XJ\\
 &=U_XR_1+
   \bigl(bx_2+(\sigma t-1)U(x_2)\bigr)y_2z_1.
\end{aligned}
```

The first term is the image of four rank-one terms; the last term is
rank one. This is an exact polynomial five-term decomposition for every
$`t`$, with no limiting or division argument. It remains valid if $`U`$
itself has Laurent entries. Any later local maps preserve the equality.

Under the complete-cell hypothesis made precise below, replacing all
five eight-term cells by these five-term expressions saves fifteen
source directions. The resulting claimed bounds would be

```math
\underline R(M_{128})\le32768-15=32753<32760,
```

```math
\underline R(M_{4096})\le33554432-15=33554417<33554419.
```

The right-hand sides in both comparisons are the independently proved
Landsberg--Michałek lower bounds. The diagonal four-term refinement
below gives a stronger saving but is not needed for either contradiction.

## The entire correction cell uses four rank-one terms

Use the paper's canonical active tensor and error tensor:

```math
A=z_0\sum_{i=1}^4x_i y_i+z_1x_2y_1+z_2x_4y_4,
\qquad J=x_2y_2z_1.
```

The four face operators in Definition 10.1 span the diagonal matrices.
Write $`U=\mathop{\mathrm{diag}}(u_1,u_2,u_3,u_4)`$. For a nonzero scalar
$`c`$ the following identity is exact:

```math
\begin{aligned}
UA+cJ={}&
\left(u_1x_1-\frac{u_2^2}{c}x_2\right)y_1z_0\\
&+x_2\left(\frac{u_2}{c}y_1+y_2\right)(u_2z_0+cz_1)\\
&+u_3x_3y_3z_0+u_4x_4y_4(z_0+z_2).
\end{aligned}
```

The two coefficients at $`x_2y_1z_0`$ cancel. The other terms give exactly
the six terms of $`UA`$ and the term $`cJ`$. Thus the rank is at most four
whenever $`c\ne0`$. Letting $`c`$ tend to zero proves that every tensor in
$`V_{\rm act}`$ has border rank at most four, including arbitrary zero
values of the $`u_i`$.

The stronger observation concerns the full Laurent family in equation
(10.4), not only its leading tensor. Since $`UJ=u_2J`$, that family equals

```math
\mathcal C(t)=UA+(b+\sigma t u_2)J,
\qquad \sigma\ne0.
```

Put $`c(t)=b+\sigma t u_2`$. If $`c(t)`$ is not identically zero, the displayed
four-term identity is an exact decomposition over $`\mathbb C(t)`$. If
$`c(t)`$ is identically zero, then the constant data satisfy $`b=u_2=0`$;
the remaining tensor has the three displayed rank-one terms with
indices $`1,3,4`$. In every case the **entire** printed cell has rank at
most four over the rational-function field.

Rational coefficients present no obstacle to a Laurent degeneration.
Each has a Laurent series with finite negative part. In any finite
composition with other Laurent maps, truncate sufficiently far beyond
the requested leading order. This preserves that leading coefficient
and gives four Laurent-polynomial rank-one terms. If desired, this
truncation can be implemented by a separate parameter and then combined
with the other finitely many parameters. No rank-one source direction
is added by truncation or parameter substitution.

This replacement is stronger than replacing $`UA+bJ`$ by an unrelated
border-rank approximation: it preserves all coefficients of the
rational cell family before any downstream maps are applied.

## Consequence for the printed allocation

Here is the precise no-go statement. Suppose a three-party source has a
direct-sum decomposition

```math
S=S_{\rm rest}\oplus\bigoplus_{j=1}^5D_{8,j},
\qquad\underline R(S_{\rm rest})\le B-40.
```

Suppose three local Laurent-polynomial maps have leading tensor $`T`$ and
the complete image of each $`D_{8,j}`$ is the printed correction family,
possibly followed by further local Laurent maps. Then

```math
\underline R(T)\le B-15.
```

To prove this, use the five-product identity on each designated summand.
For every nonzero parameter outside finitely many poles, the image of
$`S_{\rm rest}`$ has border rank at most $`B-40`$, and the other five images
have rank at most five each. Subadditivity bounds the border rank of the
whole transformed tensor by $`B-15`$. Scaling by the common leading power
does not change this bound. The set of tensors of border rank at most
$`B-15`$ is closed, so its limit $`T`$ has the same bound. No reconstruction
of the unknown ordinary-row right-hand sides is used in this implication.

Lemma 10.4 specifies five source-disjoint cells, each using one current
$`D_4`$ and one carrier $`D_4`$, and states that no source occurrence is
used twice. If each such pair's complete image is indeed equation
(10.4), as the displayed allocation asserts, replace each eight-term
cell by the four-term representation above. Every other source map
can remain as specified, including arbitrary nonzero uses of all
54 spare $`D_4`$ copies. There is no assumption that the spare copies
are killed.

Using the diagonal refinement, the replacement saves five copies of $`D_4`$, or twenty rank-one source
directions, while preserving the claimed final degeneration. The
remaining elementary source realizations have the budgets used in the
paper, so the joint level-$`5`$ base and propagation assertion would imply

```math
\underline R_{\mathbb C}(M_{128})
\le 16\cdot2^{11}-20=32748.
```

Landsberg--Michałek,
[arXiv:1608.07486v1](https://arxiv.org/abs/1608.07486v1), Theorem 1.1,
gives instead

```math
\underline R_{\mathbb C}(M_{128})
\ge2\cdot128^2-7-1=32760.
```

The level-$`10`$ base leads to the same issue at size $`4096`$: the compressed
budget is $`33554412`$, whereas that theorem gives $`33554419`$.

These inequalities cannot coexist. Consequently the claimed bases and
the literal source-disjoint correction-cell propagation cannot all be
valid as written. This conclusion does not identify whether the actual
failure is the unverified base admissibility, the residual assertion,
or additional source uses omitted from the correction-cell ledger.
The division-free five-term identity gives the same incompatibility
even without using the diagonal restriction on $`U`$.

For a reconstruction to escape this particular contradiction, the
designated source pairs would have to carry additional output terms
outside the printed family. Such terms would have to be stated and
checked, together with their use in the global target. They cannot be
supplied by the currently displayed equation (10.4). If the entire
image equals that equation, the algebraic compression applies without
any further condition on the unknown ordinary-row right-hand sides.

The argument does not claim that arbitrary rank-$`32768`$ algorithms for
$`M_{128}`$ are impossible, and does not claim that $`\omega_{\mathbb C}>2`$.

## A separate obstruction to simple row-map reuse

Here is a finite linear-algebra check on a natural reconstruction, not
an additional assertion about the unprinted maps.

Suppose $`U_1,U_2,U_3`$ are linear maps on $`\mathbb F_2^d`$ and every
nonempty sum of a subset of them is invertible. Fix $`v\ne0`$. The map

```math
\mathbb F_2^3\longrightarrow\mathbb F_2^d,
\qquad(s_1,s_2,s_3)\longmapsto
(s_1U_1+s_2U_2+s_3U_3)v
```

is injective, because a nonzero kernel vector would give a noninvertible
nonempty sum. Therefore $`d\ge3`$. The three-map row condition used in
Section 8 cannot hold on a one-bit or two-bit factor by itself.

If one tries to preserve an old row projection while extending the three
row maps in block-triangular form, every nonempty sum on the fresh
diagonal block must likewise be invertible. A fresh two-bit block cannot
meet that requirement. This excludes straightforward block-preserving
reuse of that particular row compiler. It does not exclude other
source-resolved constructions; Definition 10.1 does not explicitly
require that this precise matrix model be used for the fresh row map.


## Exact check

`check_sun_active_cell_compression.py` expands the five-product identity with arbitrary formal vectors $`U(x_i)`$, checks the diagonal four-product refinement after clearing its denominator, and verifies both budget comparisons. It also enumerates all 216 triples of invertible binary two-by-two row maps for the separate block-preserving diagnostic. These finite checks do not establish the complete-cell premise for an alternative unprinted construction.
