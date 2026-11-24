# A normalized spectral metric with a unit-length wire is an interval

Status: proved deductions from the imported edge-classification and
price-curvature theorems. The result is a boundary statement. It does
not assert conditional negative type for arbitrary spectral metrics,
and it does not prove the matrix multiplication perimeter bound.

The geometric inputs are Theorem C.1 and Proposition C.3 of
*VP ≠ VNP over every field*, pinned at commit
[`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp).
The spectral input is Corollary 8.10 of Alman, Li, and Pratt,
[*The edge of the asymptotic spectrum of tensors*,
arXiv:2604.01386v2](https://arxiv.org/html/2604.01386v2).
The normalization and restriction conventions are those of
`NORMALIZED_EXTENSION.md`.

## 1. Interval rigidity

Let $`F`$ be a normalized spectral point on a finite party set
$`I`$. Write $`F(W_{XY}(r))=r^{d_{XY}}`$ and
$`F(U_S(r))=r^{u(S)}`$. Suppose that two parties satisfy
$`d_{AB}=1`$. Then there are numbers $`t_X\in[0,1]`$, with
$`t_A=0,t_B=1`$, such that

```math
d_{XY}=|t_X-t_Y|\qquad(X,Y\in I).                 \tag{1}
```

First fix any other party $`X`$. The unit on $`\{A,B,X\}`$
restricts to the $`AB`$ wire, while every subset unit has charge at
most the normalized full-unit charge. Hence

```math
1=d_{AB}\le u(ABX)\le u(I)=1.
```

Thus the restriction of $`F`$ to these three parties is normalized
and additive. By the imported edge classification, its unit wire
forces

```math
d_{AX}+d_{XB}=1.                                  \tag{2}
```

Set $`t_X=d_{AX}`$. The wire metric is a price. Proposition C.3
embeds its metric quotient isometrically into a complete CAT(0)
space. Equation (2) puts every old point on the geodesic from $`A`$
to $`B`$: concatenate minimizing geodesics from $`A`$ to $`X`$
and from $`X`$ to $`B`$; their total length equals
$`d_{AB}`$. CAT(0) geodesics are unique. Their distance parameter
therefore gives (1).

This use of Proposition C.3 preserves the old metric only. No claim
is made that its entire completion is one normalized spectral point.

### A proof using only finite midpoint extensions and Theorem C.1

One can avoid invoking the completion explicitly. Repeatedly add
midpoints of the $`AB`$ interval by Proposition A.8, preserving all
old price distances. This gives finite dyadic grids
$`M_{j/2^N}`$. Their consecutive distances are their parameter
differences; the triangle inequality and $`d_{AB}=1`$ force
$`d(M_s,M_t)=|s-t|`$ on each grid.

Induction using Theorem C.1 gives, for each old $`X`$ and every
dyadic grid point,

```math
d(X,M_t)^2\le (t_X-t)^2.
```

The endpoint cases are (2). For a midpoint of neighboring parameters
$`s,t`$, the induction step is the identity

```math
\frac12(t_X-s)^2+\frac12(t_X-t)^2
 -\frac14(t-s)^2
=\left(t_X-\frac{s+t}{2}\right)^2.
```

The triangle inequality with $`A`$ gives the reverse bound, so
$`d(X,M_t)=|t_X-t|`$. If $`t_X\ne t_Y`$, choose a dyadic
parameter between them and use its two distances to bound
$`d_{XY}\le|t_X-t_Y|`$. If the parameters agree, use a sequence
of dyadic parameters approaching the common value to obtain
$`d_{XY}=0`$. The opposite inequality follows from the triangle
inequality with $`A`$. Each argument uses only finite extensions;
their choices need not agree on new tensor values.

## 2. All subset-unit charges and three-party restrictions

For every nonempty subset $`S\subseteq I`$,

```math
u(S)=\max_{X\in S}t_X-\min_{X\in S}t_X.           \tag{3}
```

The unit restricts to the wire between a pair attaining the two
extremes, giving the lower bound. For the upper bound, order the
points of $`S`$ by their coordinates and use the path through that
order as a spanning tree. The tree-to-unit restriction gives
$`u(S)\le\sum d_{X_jX_{j+1}}`$, and the sum telescopes to the
displayed diameter. A singleton gives zero on both sides.

Consequently every three-party restriction is completely determined
by the edge theorem, including triples which omit the original
$`AB`$ edge. For $`t_X\le t_Y\le t_Z`$ and
$`h=t_Z-t_X>0`$,

```math
F(T)=\left(
 \zeta^{((t_Y-t_X)/h,\,0,\,(t_Z-t_Y)/h)}(T)
 \right)^h
\qquad(T\text{ supported on }X,Y,Z).              \tag{4}
```

The three weights are ordered $`X,Y,Z`$. To prove (4), divide the
logarithmic values of the restricted cover functional by its unit
charge $`h`$. Its normalized endpoint wire has value $`r`$, so
Corollary 8.10 applies. The two other wires determine the displayed
weights. When $`h=0`$, the restriction has value one on every
nonzero tensor, by the zero-exponent case of the normalization lemma.

In particular, a higher-party commutative-rank spectral point whose
selected wire has exponent one cannot supply an interior
three-party restriction by choosing a triple that omits that wire.
All its triples are still edge restrictions after rescaling. The
full higher-party functional may nevertheless contain information
not determined by its wires or by these separate restrictions.

## 3. Every finite interval metric has a normalized realization

Conversely, take finitely many prescribed coordinates
$`t_X\in[0,1]`$, including endpoints $`A,B`$. Start with the
unique normalized two-party point, matrix rank on $`A,B`$. Choose
one joint random retraction by a common threshold $`s\in[0,1]`$:
send $`X`$ to $`B`$ when $`s<t_X`$, and to $`A`$ otherwise.
For finitely many coordinates this is a finite law, with at most
$`|I|+1`$ distinct retraction maps. It fixes both endpoints and has

```math
\mathbb E\,d(\sigma(X),\sigma(Y))=|t_X-t_Y|.
```

The normalized extension theorem supplies one point preserving all
old two-party values and with wire distances at most these expected
distances. The $`AB`$ wire still has charge one. Its triangle
inequality first forces $`d_{AX}=t_X`$ and
$`d_{BX}=1-t_X`$, and then the triangle inequality with $`A`$
forces $`d_{XY}\ge|t_X-t_Y|`$. This matches the upper bound.
The result is a genuine normalized point, not merely a scalar price
model.

## 4. A signed quadratic consequence on this boundary

Let $`D=(d_{XY})`$ and let $`J`$ be the all-ones matrix. On the
boundary described above,

```math
J-2D\succeq0.                                    \tag{5}
```

For $`s\in[0,1]`$, let $`v_s(X)`$ be $`1`$ when
$`t_X\le s`$ and $`-1`$ otherwise. Direct integration gives

```math
1-2|t_X-t_Y|=\int_0^1v_s(X)v_s(Y)\,ds.
```

Thus $`J-2D=\int_0^1v_sv_s^{\mathsf T}\,ds`$ is positive
semidefinite. In particular $`z^{\mathsf T}Dz\le0`$ whenever
$`\sum_Xz_X=0`$. Formula (5) has been proved here only for
normalized points with a wire of exponent one.

## 5. CAT(0) alone does not imply this signed inequality

The following concrete example prevents extending Section 4 by a
claim about all CAT(0) metrics. Let $`T_m`$ be a metric star with
$`m`$ arms, and take the product of two such stars with the
$`\ell_2`$ product metric. This is CAT(0). To check the curvature
directly, in a tree let $`m`$ be the midpoint of a path of length
$`2D`$, and let the projection of $`z`$ onto that path have signed
coordinate $`t\in[-D,D]`$ from $`m`$. Put $`h`$ equal to the
distance from $`z`$ to the path. The three distances are
$`h+|t|,h+D+t,h+D-t`$, so the right side of the CN inequality
is $`h^2+2hD+t^2\ge(h+|t|)^2`$. The squared CN inequalities
add for the $`\ell_2`$ product. Completeness and the coordinate
geodesics are immediate; the CN characterization gives CAT(0).

Put $`A_1,\ldots,A_m`$
at distance $`1/\sqrt2`$ from the center on the distinct arms of
the first factor, with second coordinate the center. Put
$`B_1,\ldots,B_m`$ analogously in the second factor. Then

```math
d(A_i,A_j)=d(B_i,B_j)=\sqrt2\quad(i\ne j),
\qquad d(A_i,B_j)=1.
```

For the zero-sum vector with entries $`1/m`$ on the first part
and $`-1/m`$ on the second,

```math
z^{\mathsf T}Dz=2\sqrt2\left(1-\frac1m\right)-2.
```

This is positive for every $`m\ge4`$. Therefore even the
ordinary-distance conditional negative-type inequality can fail
in a CAT(0) space. The example is not asserted to be a tensor price
or the metric of a normalized spectral point. Scaling this metric
does not change the sign of the displayed obstruction, but scaling
alone also does not provide spectral normalization.
