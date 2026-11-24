# Conditional geodesic uncrossing is equivalent to perimeter two

Status: research, proved conditional theorem. The geometric implication
below has received two independent mathematical reviews. The conditional tensor uncrossing
identity (G) remains unproved. This note does not establish that the
complex matrix multiplication exponent is two.

The new implications are proved below. The imported geometric facts are
specified in Section 5. No claim of priority is made for the geometric
criterion or its application.

## 1. Convexity of unit charges on the metric completion

Let $`F`$ be an actual normalized spectral point on a finite party set.
Write $`d(A,B)`$ for its logarithmic wire values and $`u(S)`$ for the
logarithmic value of a subset unit. Identify labels at zero distance.

Suppose that an old label $`M`$ is a metric midpoint of old labels
$`X,Y`$. Add a new label $`M'`$ by the fixed-law normalized extension
theorem, using the two retractions $`M'\mapsto X`$ and
$`M'\mapsto Y`$ with probabilities one half. Preserve every old tensor
value. Then $`M'`$ is also a midpoint of $`X,Y`$. Applying the pinned
midpoint CN inequality with the other midpoint as test point gives
$`d(M,M')=0`$.

Zero-distance wire transport identifies all tensor values after moving a
factor between $`M`$ and $`M'`$. Consequently, for every fixed tensor
with one varying party, the two-retraction bound applies to its value at
the already existing midpoint. In particular,

```math
u(A,B,M)\le\frac{u(A,B,X)+u(A,B,Y)}2.
\tag{1}
```

Repeated labels are allowed: when two labels coincide, the unit is the
unit on the resulting set of distinct labels. The same argument works
with any finite collection of midpoint factors and a synchronized joint
choice of their endpoints. Only (1) is needed below.

For completeness, wire transport is an ordinary local restriction.
Tensor a unit with a wire from its old party to the replacement party,
and contract the two old local indices. The unit index is left at the
replacement party. Thus

```math
|u(A,B,X)-u(A,B,Y)|\le d(X,Y).
\tag{2}
```

The compatible normalized midpoint extensions, followed by metric
completion, give a CAT(0) space containing the original labels. The unit
charges extend by (2). First (1) gives convexity at dyadic parameters,
and then continuity gives convexity at every real parameter. Therefore
on this completion, for every fixed $`A,B`$, the function

```math
X\longmapsto u(A,B,X)
\tag{3}
```

is convex along every geodesic.

This argument does not assert one extension satisfying arbitrary
incompatible retraction laws. Each comparison uses a new copy with one
fixed law, while zero-distance identification makes its tensor value
equal to the old midpoint value.

## 2. An abstract geometric theorem

Let $`(X,d)`$ be a CAT(0) space. Let $`u:X^3\to\mathbb R`$ be a
symmetric continuous function. Assume the following three properties.

1. For every triple, writing $`P=d(A,B)+d(B,C)+d(C,A)`$,

```math
\max\{d(A,B),d(B,C),d(C,A)\}
\le u(A,B,C)\le P/2.
\tag{4}
```

2. For fixed two arguments, $`u`$ is convex along every geodesic in its
   third argument.

3. If $`D\in[A,B]`$, then

```math
u(A,C,D)+u(B,C,D)=u(A,B,C)+d(C,D).
\tag{G}
```

**Theorem.** Under these hypotheses,

```math
u(A,B,C)=\frac{d(A,B)+d(B,C)+d(C,A)}2
\qquad\text{for all }A,B,C\in X.
\tag{5}
```

Define

```math
\varepsilon(A,B,C)
=\frac{d(A,B)+d(B,C)+d(C,A)}2-u(A,B,C).
\tag{6}
```

By (4),

```math
0\le\varepsilon(A,B,C)
\le\frac{d(A,B)+d(B,C)+d(C,A)}2
       -\max\{d(A,B),d(B,C),d(C,A)\}.
\tag{7}
```

By (G), the content is additive under subdivision of a side:

```math
D\in[A,B]\quad\Longrightarrow\quad
\varepsilon(A,B,C)
=\varepsilon(A,D,C)+\varepsilon(D,B,C).
\tag{8}
```

It remains to prove that this content is zero. The proof needs only
one-dimensional convex-function facts and the two elementary CAT(0)
angle facts recorded in Section 5. It does not require properness,
finite dimension, an ambient Euclidean realization, geodesic extension
beyond endpoints, or a planar majorization map.

## 3. A density controlled by the distance function

Fix a unit-speed geodesic $`\gamma:[0,L]\to X`$, with
$`A=\gamma(0)`$, $`B=\gamma(L)`$, and fix $`C\in X`$.
The case $`L=0`$ is immediate. Put

```math
r(t)=d(C,\gamma(t)),\qquad
F(t)=\varepsilon(C,A,\gamma(t)).
```

By (8), for $`0\le s\le t\le L`$,

```math
F(t)-F(s)=\varepsilon(C,\gamma(s),\gamma(t)).
\tag{9}
```

The upper bound in (7) is at most half the shortest side of its triangle.
In particular,

```math
0\le F(t)-F(s)\le(t-s)/2.
\tag{10}
```

Thus $`F`$ is absolutely continuous. Its derivative, denoted $`f`$,
exists almost everywhere, lies in $`[0,1/2]`$, and

```math
\varepsilon(C,A,B)=F(L)=\int_0^L f(t)\,dt.
\tag{11}
```

The coordinatewise convexity assumption gives more regularity. The
identities

```math
\begin{aligned}
u(C,A,\gamma(t))
 &=\frac{r(0)+r(t)+t}{2}-F(t),\\
u(C,B,\gamma(t))
 &=\frac{r(L)+r(t)+L-t}{2}-F(L)+F(t)
\end{aligned}
```

show that both functions

```math
H_-(t)=\frac{r(t)}2-F(t),\qquad
H_+(t)=\frac{r(t)}2+F(t)
\tag{12}
```

are convex.

**Density lemma.** At every interior point where $`r`$ is
differentiable, $`F`$ is differentiable as well. If $`p,x`$ are two such
points, then

```math
|f(x)-f(p)|\le\frac12|r'(x)-r'(p)|.
\tag{13}
```

**Proof.** Convex functions have left and right derivatives, whose jumps
are nonnegative. Since $`H_++H_-=r`$, the differentiability of $`r`$
at a point makes both derivative jumps zero there. Consequently both
$`H_+,H_-`$ and $`F=(H_+-H_-)/2`$ are differentiable there.

Suppose $`x>p`$. Set
$`a=H_+'(x)-H_+'(p)\ge0`$ and
$`b=H_-'(x)-H_-'(p)\ge0`$. Then
$`r'(x)-r'(p)=a+b`$ and
$`f(x)-f(p)=(a-b)/2`$, giving (13). Exchange $`p,x`$ for the
other order. This proves the lemma. In distributional language, the
same statement is $`|Df|\le\tfrac12D^2r`$, but no distributional
calculus is required below. ∎

The distance function $`r`$ is convex in a CAT(0) space, hence
differentiable almost everywhere. Therefore a positive integral in
(11) would give an interior point $`p`$ with

```math
r'(p)=v,\qquad F'(p)=f(p)=h>0.
\tag{14}
```

We show that no such point exists.

## 4. Contracting the root yields a contradiction

Let $`P=\gamma(p)`$ and $`R=d(P,C)`$. If $`C`$ lies on the
base geodesic, (7) already makes the entire triangle content zero.
Thus in the case under consideration $`R>0`$.

For $`0<s\le1`$, let $`C_s`$ be the point on $`[P,C]`$ with
$`d(P,C_s)=sR`$. Repeat the preceding definitions with $`C_s`$ as
root:

```math
r_s(t)=d(C_s,\gamma(t)),\qquad
F_s(t)=\varepsilon(C_s,A,\gamma(t)),\qquad
f_s=F_s'.
```

Let $`\alpha`$ be the angle at $`P`$ between the rays toward $`C`$
and $`A`$, and let $`\beta`$ be the angle between the rays toward
$`C`$ and $`B`$. The first variation formula, applied to the base
geodesic on its two sides, gives

```math
r'_-(p)=\cos\alpha,\qquad r'_+(p)=-\cos\beta.
```

By differentiability at $`p`$,

```math
\cos\alpha=v,
\qquad \cos\beta=-v.
\tag{15}
```

The direction from $`P`$ toward $`C_s`$ is the same as that toward
$`C`$. Therefore every $`r_s`$ is differentiable at $`p`$, with

```math
r_s'(p)=v.
\tag{16}
```

By the density lemma, every $`F_s`$ is also differentiable at $`p`$.

### 4.1 The density at the basepoint is unchanged

For $`t>p`$, split the side $`[P,C]`$ of the triangle
$`(C,P,\gamma(t))`$ at $`C_s`$. Equations (8)--(9) give

```math
F(t)-F(p)-F_s(t)+F_s(p)
=\varepsilon(C,C_s,\gamma(t)).
```

The bound (7), using $`r(t)`$ as one of the candidate longest sides,
implies

```math
0\le\varepsilon(C,C_s,\gamma(t))
\le\frac{(1-s)R+r_s(t)-r(t)}2.
\tag{17}
```

The right side is zero at $`t=p`$. Its derivative there is zero by
(16). Divide by $`t-p`$ and let $`t\downarrow p`$. It follows that

```math
f_s(p)=f(p)=h
\qquad(0<s\le1).
\tag{18}
```

Only a right limit is needed, since both derivatives exist. Thus there
is no exceptional-set issue depending on $`s`$ in (18).

### 4.2 The total content is smaller than linear in $`s`$

Apply first variation along $`[P,C]`$ to the distances from $`A`$
and $`B`$. Its speed in the parameter $`s`$ is $`R`$, so

```math
\begin{aligned}
d(C_s,A)&=p-sR\cos\alpha+o(s),\\
d(C_s,B)&=L-p-sR\cos\beta+o(s).
\end{aligned}
```

The two linear terms cancel by (15). Consequently (7) gives

```math
0\le F_s(L)=\varepsilon(C_s,A,B)
\le\frac{r_s(0)+r_s(L)-L}{2}=o(s).
\tag{19}
```

### 4.3 The unchanged positive density forces linear mass

For fixed $`x\in\mathbb R`$ and sufficiently small $`s>0`$, define

```math
G_s(x)=\frac{r_s(p+sx)}s.
```

Each $`G_s`$ is convex on its domain. The CAT(0) comparison-angle
limit and the Euclidean law of cosines give

```math
\lim_{s\downarrow0}G_s(x)
=g(x):=\sqrt{R^2+x^2+2Rvx}.
\tag{20}
```

For $`x>0`$, the two radial lengths from $`P`$ are $`sR,sx`$
and the limiting angle is $`\beta`$, whose cosine is $`-v`$.
For $`x<0`$, those lengths are $`sR,-sx`$ and the limiting
angle is $`\alpha`$, whose cosine is $`v`$. These give exactly
the same expression (20). At $`x=0`$ the formula is immediate.

Since $`R>0`$, the function $`g`$ is differentiable near zero and
$`g'(0)=v`$. Choose $`\eta>0`$ sufficiently small that both secant
slopes

```math
\frac{g(-\eta)-g(-2\eta)}\eta,
\qquad
\frac{g(2\eta)-g(\eta)}\eta
```

differ from $`v`$ by less than $`h/2`$. By the four pointwise limits
in (20), for all sufficiently small $`s`$ the corresponding slopes
of $`G_s`$ differ from $`v`$ by less than $`h`$. Convexity then
bounds every derivative of $`G_s`$ at a differentiability point in
$`[-\eta,\eta]`$ between those two secant slopes. Equivalently,

```math
|r_s'(t)-v|<h
\quad\text{for almost every }
t\in[p-s\eta,p+s\eta].
\tag{21}
```

Make $`s`$ smaller if necessary so that this interval lies inside
$`(0,L)`$. Apply the density lemma to $`r_s,F_s`$, using
(16), (18), and (21). It gives

```math
f_s(t)>h/2
\quad\text{for almost every }
t\in[p-s\eta,p+s\eta].
```

Hence

```math
F_s(L)=\int_0^L f_s(t)\,dt
\ge h\eta s.
\tag{22}
```

This contradicts (19). Thus (14) is impossible. The nonnegative density
in (11) is zero almost everywhere, and
$`\varepsilon(C,A,B)=0`$. Since the original triple was arbitrary,
this proves the theorem. ∎

## 5. Imported results and their exact uses

The spectral source is *VP ≠ VNP over every field*, at the exact commit
[`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp).
The imported statements and the normalization repair are:

- Proposition A.7, extension, upgraded to a normalized extension
  preserving all old tensor values by Theorem 2 of
  `NORMALIZED_EXTENSION.md`.
- Theorem C.1, curvature bound for prices: when
  $`d(X,M)=d(Y,M)=d(X,Y)/2`$, one has

```math
d(Z,M)^2\le\frac{d(Z,X)^2+d(Z,Y)^2}{2}
                 -\frac{d(X,Y)^2}{4}.
```

- Proposition C.3, embedding into a price space: adding midpoints
  repeatedly, identifying zero distances, and completing gives a
  CAT(0) metric space. Its proof uses Theorem C.1 and verifies that
  Cauchy endpoint sequences have Cauchy midpoint sequences.

Here we use the completion argument of Proposition C.3, but choose each
finite extension by the normalized theorem above. Thus all old tensor
values, rather than only old wire distances, are retained at every
finite stage. We do not assert that the entire completed space has
already been equipped with a single normalized spectral point on
arbitrary infinitely supported tensors. Only the compatible finite
values and the continuous triple-unit function are required.

These source statements are used under the repository's standing
premise. The new midpoint-convexity implication is proved in Section 1;
its full tensor version is in `TENSOR_MIDPOINT_CONVEXITY.md`.

For metric geometry we use Martin R. Bridson and André Haefliger,
*Metric Spaces of Non-Positive Curvature*, Grundlehren 319, Springer,
1999:

- Proposition II.3.1: comparison angles along two geodesics issuing
  from a point converge to the Alexandrov angle as both radial
  parameters tend to zero. This is used only to obtain (20).
- Corollary II.3.6: the first variation formula for distance to a fixed
  point along a unit-speed geodesic. This gives (15)--(16) and the
  two expansions preceding (19).

The relevant statements were checked in the
[primary book scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/bridsonhaefligerx.pdf),
printed pages 184--185. Neither statement assumes properness or finite
dimension. Standard one-dimensional convex-function facts used above
are proved to the extent needed in the density lemma and the secant
argument. The fundamental theorem for absolutely continuous real
functions gives (11).

## 6. Consequence for the matrix multiplication project

Assume (G) holds for every actual normalized four-party spectral point.
Normalize any nonzero-exponent four-party restriction by taking the
appropriate positive power; the cover-functional classification in
`NORMALIZED_EXTENSION.md` justifies this normalization. A zero-exponent
restriction has all unit charges zero. Thus (G) applies to every four
labels in a compatible larger extension, and continuity passes it to
the CAT(0) completion. More explicitly, approximate three endpoints by
labels in the midpoint closure and approximate the parameter of the
fourth point on their geodesic by dyadic parameters. The corresponding
dyadic subdivision labels are actual geodesic points of finite
extensions. CAT(0) continuity of geodesic interpolation and (2) pass
their identities to the prescribed completed configuration. This avoids
assuming that arbitrary approximating fourth labels remain exactly
collinear.

The subset-unit inequalities give (4): deletion of parties gives the
lower bound, and the three-party minimum-perimeter theorem after
normalization gives the upper bound. Section 1 gives coordinatewise
convexity. Therefore the theorem applies to the preserved original
normalized triangle, whose unit charge is still exactly one. It gives

```math
d_{AB}+d_{BC}+d_{CA}=2.
```

Strassen's characterization would then imply
$`\omega_{\mathbb C}=2`$.

Conversely, suppose $`\omega_{\mathbb C}=2`$. Take any actual
normalized point on finitely many parties and restrict it to any three
labels. If that restricted unit has exponent $`h>0`$, the normalized
restricted point has all three wire exponents summing to exactly two:
the minimum is two, and Strassen duality bounds the maximum by
$`\omega_{\mathbb C}=2`$. Rescaling back gives
$`u(A,B,C)=P/2`$. If $`h=0`$, all three distances are zero and the
same identity holds. Coinciding labels give the degenerate instance
$`u(A,A,B)=d(A,B)`$.

Now let $`D\in[A,B]`$. Apply this half-perimeter formula to
$`ACD`$, $`BCD`$, and $`ABC`$. The sum of the first two perimeters
is the third perimeter plus $`2d(C,D)`$, because
$`d(A,D)+d(D,B)=d(A,B)`$. Dividing by two gives (G).

Therefore, under the stated spectral imports, (G) on all actual
normalized four-party points is equivalent to
$`\omega_{\mathbb C}=2`$. This does not prove (G), construct the
conditional geodesic tensor trade, or justify an unconditional
conclusion about the exponent. The weaker abstract zero-content
question using only (7)--(8), without convexity of $`u`$, is not needed
for this equivalence and is not settled here.

[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md), Section 3, also
proves that (G) is equivalent to a family of finite source-only unit
conversions with overhead $`q^{o(1)}`$ and an unrestricted neutral
flag. That converse uses compactness followed by spectral duality,
with the flag parameter fixed before taking each tensor-power limit.
It supplies an exact operational target, not a construction of it.

## Appendix: a rejected single-root metric rigidity statement

An earlier approach fixed one root $`O`$ and considered a pseudometric
$`d'_O\le d`$ which agrees with $`d`$ on every distance from
$`O`$ and is additive on all $`d`$-geodesics. Those conditions alone
do not imply $`d'_O=d`$.

Let $`X=\mathop{\mathrm{conv}}\{0,e_1,e_2\}\subset\mathbb R^2`$
with Euclidean distance, and let $`O=0`$. Put

```math
p=(-4/5,4/5),\qquad
K=\mathop{\mathrm{conv}}(B_2\cup\{p,-p\}),
```

where $`B_2`$ is the closed Euclidean unit disk. Let
$`d'(x,y)=\|x-y\|_K`$ be the norm distance with unit ball $`K`$.
It is dominated by Euclidean distance, because $`B_2\subset K`$,
and is additive on every straight segment.

For nonzero $`x\in X`$, set $`v=x/\|x\|_2`$. Its coordinates are
nonnegative, so

```math
|\langle v,p\rangle|
=\tfrac45|v_2-v_1|\le\tfrac45<1.
```

The linear functional $`\langle v,\cdot\rangle`$ has maximum one
on $`K`$, attained on the Euclidean disk. Hence
$`\|x\|_K\ge\langle v,x\rangle=\|x\|_2`$; the reverse
inequality follows from domination. Every radial distance from $`O`$
is therefore unchanged. But $`p`$ is a boundary point of $`K`$ and
$`e_1-e_2=-\tfrac54p`$, so

```math
d'(e_1,e_2)=\tfrac54<\sqrt2=d(e_1,e_2).
```

This construction gives only one rooted metric. It does not give a
coherent symmetric triangle function satisfying the hypotheses of the
theorem, and it is not asserted to come from a tensor spectral point.
The proof above retains the shared triangle function and the convexity
of its unit charge; it does not use the rejected single-root assertion.
