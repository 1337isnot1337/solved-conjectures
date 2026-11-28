# Steinerberger’s radial shell deformation question

## Statements and conventions

[Steinerberger, *Some Open Problems*, §22 (March 31, 2026)](https://faculty.washington.edu/steinerb/openproblems.pdf)
asks which lattices have the following property: for every radius,
summing the distances of the points of the original lattice shell
after a small covolume-preserving change of basis increases the sum.
The list writes shells at the origin. The motivating papers
[Faulhuber–Steinerberger](https://arxiv.org/abs/1903.06856) and
[Helms](https://arxiv.org/abs/2212.01929) instead fix an external
deep hole $`p`$, and compare the distances of the deformed points
from that fixed $`p`$.

Here are precise conclusions, distinguishing these cases. We use
$`d\ge2`$; the origin-shell statement in dimension one is trivial.

1. At the origin, a lattice has the stated property exactly when
   all its nonempty positive-radius shells are spherical $`2`$-designs.
   It is then a global minimum under all determinant-one linear maps,
   and the increase is strict for nonorthogonal changes. This includes
   all irreducible root lattices, their duals, $`\mathbb Z^d`$, and
   the Leech lattice.
2. At an arbitrary center, taking all volume-preserving affine
   perturbations of the vectors relative to that center, the same
   equivalence holds. In particular this property is independent of
   the lattice translate used to represent the center. It implies
   the motivating papers' inequality for a fixed $`p`$ under a
   linear lattice perturbation.
3. At deep holes of the Leech lattice, the affine property holds
   precisely for types $`A_1^{24}`$ and $`A_2^{12}`$, out of all 23
   deep-hole types. At every other type, even volume-preserving
   linear maps of the shell vectors about the hole can reduce the
   nearest-shell distance sum. Moreover, the same classification
   holds with the original fixed-reference convention for every
   individual representative of each deep hole.
4. At all deep holes of $`D_d^*`$ the property holds for even
   $`d\ge4`$, but fails at every deep hole for odd $`d\ge3`$.
   At deep holes of irreducible root lattices (in particular $`D_4,E_8`$),
   pre-existing shifted-shell $`2`$-design theorems already combine
   with the criterion to give the affine property.

## 1. A finite-shell criterion

Let $`X\subset rS^{d-1}`$ be a nonempty finite shell, with $`r>0,d\ge2`$.
Write $`m=|X|`$, $`N=\frac1m\sum_{x\in X}xx^\top`$, and
$`\xi=\frac1m\sum_{x\in X}x`$. The following are equivalent:

- $`I`$ is a local minimum of $`\sum_{x\in X}\|Ax\|`$ among
  $`A\in SL_d(\mathbb R)`$;
- $`N=r^2I/d`$;
- $`I`$ is a global minimum of the same function.

In the analogue for $`\sum_{x\in X}\|Ax+b\|`$, with $`b\in\mathbb R^d`$
freely variable, the characterization is $`N=r^2I/d,\ \xi=0`$.
These are the second- and first-moment conditions for a spherical
$`2`$-design. For a lattice shell at the origin, the first moment
is automatic by central symmetry.

For necessity differentiate through $`A=e^{tS}`$ for arbitrary
real symmetric trace-free $`S`$. The directional derivative at zero
is $`m\mathop{\mathrm{tr}}(SN)/r`$; it vanishes for all such $`S`$
exactly when $`N`$ is scalar. The trace fixes the scalar. In the affine
case varying $`b`$ in any direction additionally forces $`\xi=0`$.

For sufficiency write the polar decomposition $`A=UH`$, where
$`H`$ is positive definite, $`\det H=1`$, and $`U`$ is orthogonal.
For each $`x`$, using the supporting unit vector $`x/r`$ gives
```math
 \|Ax+b\|=\|Hx+U^\top b\|
 \ge \big\langle x/r,Hx+U^\top b\big\rangle.
```
For $`b=0`$ or $`\xi=0`$, summing yields
```math
 \sum_{x\in X}\|Ax+b\| \ \ge\  mr\,\frac{\mathop{\mathrm{tr}}H}{d}
 \ \ge\ mr .
 \tag{1}
```
The last inequality is AM–GM. It is strict unless $`H=I`$.
For $`H=I`$, equality in the first inequality for every $`x`$
requires $`U^\top b`$ parallel to every $`x`$; isotropy makes
$`X`$ span, so $`b=0`$. In particular the minimizers in the affine
case are exactly the orthogonal maps with zero translation.

The uniform shell-wise quadratic stability also follows directly.
Write $`H=e^S`$, so $`\mathop{\mathrm{tr}} S=0`$. For an eigenvalue $`s`$
of $`S`$, $`e^s-1-s\ge \tfrac12e^{-|s|}s^2`$; summing gives
```math
 \sum_{x\in X}\|Ax+b\|-mr
 \ \ge\ \frac{mr}{2d}e^{-\|S\|_{\rm op}}\|S\|_{\rm F}^2 .
 \tag{2}
```
This is independent of the radius apart from the factor $`mr`$.

For the original fixed-$`p`$ comparison, put
$`X=\{\lambda-p:\lambda\in L,\ \|\lambda-p\|=r\}`$.
Then $`A\lambda-p=Ax+(A-I)p`$, covered by (1)–(2) for a
$`2`$-design. The unconstrained affine equivalence is not claimed
to be the exact local criterion for this last restricted model at an
individual representative $`p`$; its derivative is the full
trace-free Frobenius pairing with $`(m/r)(N+\xi p^\top)`$.
If the fixed-$`p`$ local comparison is imposed at every lattice
translate $`p+\lambda_0`$, necessity does recover the affine
criterion: subtracting the derivatives makes $`\xi\lambda_0^\top`$
scalar for every lattice vector $`\lambda_0`$; a nonzero rank-one
matrix cannot be scalar in dimension $`d\ge2`$.

## 2. Origin-shell criterion is a classical implication

For the no-translation case, the characterization is already a
direct implication of [Petty, *Surface area of a convex body under
affine transformations*, Proc. AMS 12 (1961), 824–828](https://doi.org/10.1090/S0002-9939-1961-0130618-0).
See also [Giannopoulos–Papadimitrakis, *Isotropic surface area
measures*, Theorem 1 and equations (2.1)–(2.6)](https://fourier.math.uoc.gr/~papadim/isotropic_surface_area.pdf)
for a proof with exactly the same trace argument. For a spanning
centrally symmetric shell, its normalized counting measure on the
unit sphere is the surface-area measure of a polytope by Minkowski
existence. Under the volume-preserving map $`A^{-T}`$ the resulting
surface area is proportional to $`\sum_{x\in X}\|Ax\|`$. If the
original shell is not centrally symmetric, symmetrize its counting
measure first; neither the moment nor the sum of norms changes.
For a nonspanning shell in $`d\ge2`$, decreasing lengths on its span
and compensating in its orthogonal complement prevents minimality.
These classical facts already give the origin equivalence. We
include the direct proof for clarity and for the independent
translation variable, not as a new origin-shell resolution.


A finite group of orthogonal symmetries acting irreducibly on
the ambient real space makes every invariant shell isotropic:
its symmetric moment commutes with the group, so any eigenspace
is invariant. Applying this to the irreducible Weyl actions,
dual lattices, and the Leech lattice gives the examples in
Statement 1. The same argument applies to shifted shells with
their affine stabilizer's linear parts; an irreducible action
in $`d\ge2`$ also forces the mean to vanish.

The all-origin-shell $`2`$-design condition predates this application.
[Coulangeon–Lazzarini, *Spherical designs and heights of Euclidean
lattices*, §4](https://arxiv.org/abs/1401.2891) call it
*full criticality*, and give a finite weighted-theta-series
test and a classification through dimension six. Thus those
classifications also classify the origin-shell deformation property
in those dimensions. Their Proposition 15
also records the elementary fact that strongly eutactic lattices
are proportional to integral ones. To see this directly, for
a basis matrix $`B`$ write $`x=Bm`$ on any isotropic nonempty
shell. Then the integral matrix $`\sum mm^\top`$ is a positive
scalar multiple of $`(B^\top B)^{-1}`$, so the Gram matrix is
rational up to scale. This property is not shared by every
lattice. For example a rectangular lattice whose shortest
basis side is unique has its first shell confined to one line.

For shifted shells, [Bachoc–Moustrou–Vallentin–Zimmermann,
*Polarization of lattices: stable cold spots and spherical designs*,
§§3–4](https://doi.org/10.1017/fms.2026.10169) prove
that all inhomogeneous shells about deep holes of irreducible root
lattices, $`E_6^*,E_7^*`$, Coxeter–Todd and Barnes–Wall are spherical
$`2`$-designs. These pre-existing results supply the affine property
for those lattices, including the specific $`D_4`$ and $`E_8`$
deep-hole examples in Steinerberger's question.

## 3. All Leech deep-hole types

The nearest shell to a Leech deep hole has Gram matrix in orthogonal
components prescribed by the 23 extended ADE diagrams; see
[Conway–Parker–Sloane, *The covering radius of the Leech
lattice*](https://neilsloane.com/doc/Me87.pdf) and
[Conway–Sloane, *Twenty-three constructions for the Leech lattice*,
pp. 280–282](https://neilsloane.com/doc/Me86.pdf).
In each irreducible affine component of $`s`$ unit-normalized
contact vectors, the Gram matrix has rank $`s-1`$, no positive
off-diagonals, and a one-dimensional kernel with strictly positive
coordinates (the affine root marks). Nonadjacent vertices have
inner product zero. If the full shell has scalar second moment,
the nonzero eigenvalues of each component's Gram matrix are that
same positive scalar. A component Gram matrix would then be a
positive scalar multiple of $`I-uu^\top`$ for a unit vector $`u>0`$
spanning its kernel. Every off-diagonal entry of this projector
is strictly negative. The only complete extended ADE diagrams
are $`\widetilde A_1`$ and $`\widetilde A_2`$.
The two unit contact vectors of the former yield tight-frame
scalar $`2`$; the three of the latter yield $`3/2`$.
Thus all components must be of the same type, and the only possible
Leech hole types for the affine property are $`A_1^{24}`$ and
$`A_2^{12}`$.

To prove every shifted shell is a $`2`$-design at these two types,
use the Golay special cases of Conway–Sloane's holy construction,
pp. 280–282. In both cases the coordinate origin is the hole.
For $`A_1^{24}`$ the shifted lattice is in 24 orthogonal real
lines, the coordinate group is the binary Golay code acting
by sign changes, and $`M_{24}`$ acts transitively on those lines.
For $`A_2^{12}`$ it is in 12 orthogonal real planes, written in
complex coordinates. The ternary Golay code acts by multiplying
coordinate $`j`$ by $`\omega^{c_j}`$ with $`\omega=e^{2\pi i/3}`$,
and the monomial group projects to transitive $`M_{12}`$ on the
planes. These actions are also seen directly in the holy construction:
coordinate-wise code shifts permute the fundamental vectors
and send glue vector $`g_a`$ to $`g_{a+c}`$. Thus they preserve
both integer combinations and the coefficient-sum-one condition
describing the hole-centered coset. The transitive code
automorphisms likewise permute both lists; where a ternary
code symbol is negated, take complex conjugation in that plane.
The usual binary coordinate-sign action is also described by
[Wilson, *The Leech lattice and the Conway group*, §5.3](https://webspace.maths.qmul.ac.uk/r.a.wilson/simplegroups_files/notes5.pdf).
For the ternary code see [Gill–Gillespie–Praeger–Semeraro,
*Conway’s groupoid and its relatives*, §3](https://arxiv.org/abs/1604.04429)
and [Tonchev, *An Introduction to Coding Theory: Lecture Notes*,
§§7–8](https://pages.mtu.edu/~tonchev/Coding-Theory-Tohoku-June-09.pdf).

The binary and ternary extended Golay codes are self-dual and
have minimum Hamming weights 8 and 6. Thus each coordinate
functional restricted to the code is nonzero, and any two
are linearly independent: a dependence would give a nonzero word
of weight at most two in the dual. Consequently each coordinate
has some code symmetry acting by its nontrivial rotation
($`-1`$ on a binary line, a $`120^\circ`$ rotation in a ternary
plane), and for each pair of different coordinates there is a
symmetry rotating one but acting trivially on the other.
Averaging any shifted shell over this code action gives zero mean
and kills all cross-coordinate blocks of its second moment.
Each line or plane block is scalar, since in a plane a symmetric
operator commuting with a $`120^\circ`$ rotation is scalar.
Transitivity on coordinates equalizes all blocks. Hence both
hole types pass the criterion for every shell.

### Fixed reference, at every individual representative

The preceding sufficiency proof covers every representative $`p`$
of the two qualifying hole types. To prove necessity even without
independent translations, apply the fixed-$`p`$ first variation to
the nearest shell. In the orthogonal decomposition into affine
root components, $`N`$ is block diagonal. In an $`A`$ component
the mean vanishes, since all the affine root marks are equal.
In a $`D`$ or $`E`$ component it is nonzero, because its
one-dimensional kernel cannot contain the all-ones vector:
at a branching vertex of the simply-laced affine diagram, the
associated Cartan matrix has nonzero row sum.

If there are two or more nonzero component means, the off-diagonal
blocks of $`N+\xi p^\top`$ could vanish only when $`p=0`$:
for every component $`j`$, choose a nonzero mean in a different
component $`i`$; that block is $`\xi_i p_j^\top`$. A deep hole of a
lattice containing the origin is not $`0`$. If there is no nonzero
mean, the condition is just the already classified isotropy.

Suppose there is exactly one $`D`$ or $`E`$ component. Any other
component is of type $`A_j`$, and has the same Coxeter number as
the first component by the Niemeier classification. A $`D`$ or $`E`$
Coxeter number is at least six, so $`j\ge5`$. This $`A_j`$ block
by itself is not scalar (by the projector test above), and its mean
is zero, so the fixed-$`p`$ derivative cannot vanish in all directions.
If there is no other component, the only possibility is $`D_{24}`$.

Finally, the affine $`D_{24}`$ diagram has graph diameter at least
three, so its Gram matrix $`G`$ has at least four distinct eigenvalues.
Indeed, for vertices of graph distance $`h`$, the corresponding
entry of $`G^j`$ vanishes for $`0\le j<h`$ and is nonzero for $`j=h`$:
all shortest walks have the same sign in the product of matrix
entries. For a pair at distance equal to the diameter, a minimal
polynomial of degree at most that diameter would contradict this.
Since $`G`$ is symmetric, its distinct eigenvalue count is the
degree of its minimal polynomial. If $`N+\xi p^\top`$ were scalar,
$`N`$ would be a scalar plus rank at most one, with at most two
distinct eigenvalues. But $`N`$ shares its positive eigenvalues,
up to a fixed scale, with $`G`$, and $`G`$ has exactly one zero
eigenvalue. This is impossible. Thus the nearest-shell sum strictly
decreases in some infinitesimal determinant-one direction at
every nonqualifying deep hole, for the fixed-reference convention too.

This classification is for the radial shell deformation property.
It neither asserts that these holes are cold spots for Gaussian
potentials nor uses which Leech hole is selected asymptotically
by the Gaussian potential.

## 4. Dual checkerboard deep holes and parity

Use $`D_d^*=\mathbb Z^d\cup((1/2,\ldots,1/2)+\mathbb Z^d)`$.
If $`y_i=\mathop{\mathrm{dist}}(z_i,\mathbb Z)`$ and $`w_i=4y_i-1`$,
its squared distance from $`z`$ is
```math
 \min\{\textstyle\sum_i y_i^2,\sum_i(1/2-y_i)^2\}
     ={d+\sum_i w_i^2-2|\sum_i w_i|\over16}.
```
If $`d`$ is even, the maximum is $`d/8`$, attained precisely
at equal counts of $`w_i=\pm1`$. For odd $`d`$ the maximum is
$`(2d-1)/16`$ and is attained precisely at one zero and equal
counts of $`w_i=\pm1`$ among the other entries. Indeed, on the
half-box $`\sum_iw_i\ge0`$ (or $`\le0`$) the objective is strictly
convex, so any maximum occurs at a vertex of that polytope.
The vertices are box vertices or intersections of the cutting
hyperplane with a box edge. For odd $`d`$ the latter must have
one zero entry; their objective exceeds the best value of the
box vertices. In even dimension the formula already characterizes
equality. Thus the hole representatives up to lattice isometry
are $`p=(0^k,(1/2)^k)`$ and $`p=(0^k,(1/2)^k,1/4)`$, respectively.

For $`d=2k`$, all individual coordinate sign flips preserve the
shifted lattice $`D_d^*-p`$. Coordinate permutations within either
block also preserve it, and exchanging the blocks does too since
it moves $`p`$ by a half-integer lattice vector. Hence all shifted
shells have zero mean and diagonal, scalar second moment.

For $`d=2k+1`$, the nearest shell at the displayed representative
consists of a $`k`$-cube of side $`1`$ from each coset. For points
from $`\mathbb Z^d`$, the block centered at $`1/2`$ has choices
$`\pm1/2`$ relative to $`p`$ and the last coordinate is $`-1/4`$.
For the other coset the roles of the two core blocks reverse and
the last coordinate is $`+1/4`$. The mean is zero, and the
diagonal of the average second moment is $`1/8`$ on the core
coordinates and $`1/16`$ on the last. This violates isotropy
for every $`k\ge1`$. The odd-dimensional deep holes fail the
criterion even with $`b=0`$, and because the mean is zero
they fail the original fixed-$`p`$ comparison as well.

Bachoc–Moustrou–Vallentin–Zimmermann, §1.6, assert without
a parity distinction that for $`D_n^*`$ with $`n\ge5`$, the
deep-hole shells are not all spherical $`2`$-designs. The even
dimensional sign-and-swap argument shows the necessary qualification
of that sentence.

## Priority scope

The previously established all-shell design properties and the
classical holy construction, Golay data, and Leech hole classification
are inputs, not new claims. The concrete contributions here are the external affine and
fixed-reference Leech classification and the dual-checkerboard
parity distinction. The origin-shell classification criterion
has classical complete implications and is not counted as an
independent new resolution. There is no all-dimensional enumeration
of isometry classes claimed here. Searches for
Faulhuber–Steinerberger radial shell extremality with spherical
designs, all-shell deformations, and Leech $`A_1^{24},A_2^{12}`$
shifted $`2`$-designs did not locate these exact formulations in
prior primary work. This is not a guarantee of priority.
