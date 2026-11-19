# Lean normalization and density transfer

These files prove reusable parts of the five-speed norm reduction. The full
norm bound and the classification outside the critical families remain open
formalization tasks.

## Gcd normalization

[`LonelinessNormalization.lean`](../../lean/Conjectures/LonelinessNormalization.lean)
defines the greatest common divisor of a list by an iterated `Nat.gcd`, and
defines `normalize ds` by dividing every speed by that divisor.

`value_scale` proves, for every positive integer \(d\),

\[
\operatorname{value}(d\,ds)=\operatorname{value}(ds).
\]

The upper bound reduces arbitrary real times modulo one. The lower bound uses
the time \(t/d\) for every \(t\in[0,1]\).

For a nonempty positive list, normalization preserves its actual value, length,
positivity, and distinctness, and makes its greatest common divisor one.
`primitive_representative` collects these conclusions in a single existence
theorem.

Normalization also preserves containment of either critical quadruple. This
removes the primitivity hypothesis from the previously proved classification:

```lean
Loneliness.Normalization.critical_family_below_threshold
```

For every positive speed list of length five containing a positive dilation of
`[1,2,3,4]` or `[1,3,4,7]`, a value below \(1/5\) therefore equals
\(s/(5s+1)\) for some positive integer \(s\).

## Density transfer by rounding coefficients

[`LonelinessSubspaceDensity.lean`](../../lean/Conjectures/LonelinessSubspaceDensity.lean)
works directly with a real linear subspace \(E\subseteq\mathbb R^n\). It defines

\[
G(x)=\min_i\|x_i\|,
\qquad
M(E)=\sup_{x\in E}G(x).
\]

The definitions are `pointClearance` and `spaceValue`. The theorem
`spaceValue_speed_line` identifies \(M(\mathbb Rv)\) with the existing actual
real-time loneliness value of the natural speed list \(v\).

Let \(w_1,\ldots,w_j\in\mathbb Z^n\), and choose arbitrary approximating vectors
\(v_i\in E\). Suppose

\[
|(w_i)_a-(v_i)_a|\le r_i
\quad\text{for every }i,a.
\]

`extension_density` proves that every point

\[
x\in E+\operatorname{span}_{\mathbb R}\{w_1,\ldots,w_j\}
\]

has a vector \(y\in E\) and an integer vector \(z\in\mathbb Z^n\) with

\[
\max_a|x_a-z_a-y_a|\le\frac12\sum_{i=1}^j r_i.
\]

The construction is explicit. Express \(x=e+\sum_i b_iw_i\), and put

\[
z=\sum_i\operatorname{round}(b_i)w_i,
\qquad
y=e+\sum_i\bigl(b_i-\operatorname{round}(b_i)\bigr)v_i.
\]

Then

\[
x-z-y=\sum_i\bigl(b_i-\operatorname{round}(b_i)\bigr)(w_i-v_i).
\]

Each scalar coefficient has absolute value at most \(1/2\). The triangle
inequality gives the asserted coordinate bound. This construction does not
require the added vectors to be linearly independent.

`point_transfer` proves the required Lipschitz inequality modulo integer
vectors. `extension_value_bound` and `extension_value_bound_norm` conclude

\[
M\bigl(E+\operatorname{span}\{w_i\}\bigr)
\le M(E)+\frac12\sum_i\|w_i-v_i\|_\infty.
\]

Taking \(v_i\) to be the orthogonal projection of \(w_i\) onto \(E\) gives the
coefficient-rounding transfer used by the lattice method. The existence of
short projected lattice vectors is a separate mathematical step.

## Exact arithmetic of the norm thresholds

[`LonelinessNormArithmetic.lean`](../../lean/Conjectures/LonelinessNormArithmetic.lean)
proves the numerical part with all lattice and subspace hypotheses explicit.
It does not assert that those hypotheses have already been established for
every speed tuple.

For ordered nonnegative numbers \(a\le b\le c\le d\), the inequalities

\[
a+b>\frac1{10},\qquad
a+b+c>\frac4{15},\qquad
a+b+c+d>\frac35
\]

imply

\[
b>\frac1{20},\qquad c>\frac4{45},\qquad d>\frac3{20},
\qquad bcd>\frac1{1500}.
\]

Given \(abcd\le1/V\), `first_minimum_bound` proves \(a<1500/V\).
`five_speed_threshold` combines this with the density inequalities and
\(V\ge33750\) to prove that the containing two-dimensional space has value
strictly below \(2/9\).

The analogous three-minimum calculation gives \(A<4374/5\).
`squared_covolume_integer_bound` proves that an integral squared covolume then
satisfies \(A^2\le765275\).

## Remaining dependency stack

The source for the external reduction is Yi, Gill and Bu,
[*Four runners that are barely lonely*, arXiv:2610.40694v1](https://arxiv.org/abs/2610.40694),
especially Sections 3, 11, and 12. A readable
[PDF mirror](https://arxiv.cnoctave.top/pdf/2610.40694) contains the same paper.

Corollary 11.6(ii) uses the projected-lattice covolume identity, Vaaler's
cube-section theorem, Minkowski's second theorem, coordinate coalescence, and
Theorem 11.5. The latter uses the four-speed gap and an additional enumeration.
The four-speed proof enumerates 800,816,099 quadruples. The five-coordinate
`g5enum2` enumeration visits 65,989,492,206 vectors, retains 30,485,136,454
normalized vectors, and has sixteen survivors. These searches are separate
from this repository's final 317 five-speed candidates.

The pinned Mathlib contains lattice bases and covolumes in
`Mathlib.Algebra.Module.ZLattice.Basic` and
`Mathlib.Algebra.Module.ZLattice.Covolume`. It also contains Blichfeldt's theorem
and Minkowski's first convex-body theorem in
`Mathlib.MeasureTheory.Group.GeometryOfNumbers`. Searches of this pinned source
did not find Vaaler's theorem, Minkowski's second theorem, successive minima,
or a lonely-runner classification.

Consequently these files do not close the full five-speed exhaustion. They
prove normalization, the density transfer, and the numerical threshold
calculation without concealing the remaining mathematical inputs.
