# Equal-radius circular webs: a counterexample route and two obstructions

21 November 2026. This note concerns the full [Erdős 104 target](target-and-prior-audit.md). It proves a conditional route to a quadratic counterexample and checks two classes of circular-web constructions. No such equal-radius web is constructed, no subquadratic bound is proved, and no bounty completion is added. No novelty is claimed for the elementary web discretization or the projective circle dictionary.

## 1. What a local equal-radius web would accomplish

Suppose a nonempty planar open set has three transverse foliations by arcs of distinct radius-one circles, with a local coordinate map in which their leaves are

```math
u=\text{constant},\qquad v=\text{constant},\qquad
u+v=\text{constant}.
\tag{1}
```

This is a local hexagonal circular 3-web, with the additional requirement that every leaf belongs to a Euclidean circle of radius exactly one.

Shrink the coordinate domain around a regular point. Within each family, the complete circles can be taken to vary injectively with the leaf parameter. The three complete circles at the base point are distinct because their tangent directions are distinct. Their centers therefore lie in three disjoint neighborhoods after a further shrink, so circles from different families are distinct as well.

For each positive integer $`N`$, choose a sufficiently small arithmetic grid

```math
u_i=u_0+ih,\qquad v_j=v_0+jh,
\qquad 0\le i,j\lt N,
```

inside the coordinate domain. Use the $`N`$ first-family circles, $`N`$ second-family circles, and $`2N-1`$ third-family circles at levels

```math
u_0+v_0+kh,\qquad 0\le k\le2N-2.
```

They are $`4N-1`$ distinct unit circles with at least $`N^2`$ distinct triple-intersection points, namely the images of the grid. Circle–point duality now gives a set $`P_N`$ of their $`4N-1`$ centers and at least $`N^2`$ distinct unit circles containing three members of $`P_N`$. Consequently

```math
U(4N-1)\ge N^2,
\qquad
\limsup_{n\to\infty}\frac{U(n)}{n^2}\ge\frac1{16}.
\tag{2}
```

Thus one actual local equal-radius hexagonal web would disprove the original asymptotic conjecture. This is not a finite-cardinality surrogate. The missing object is the web itself.

## 2. A circle pencil cannot supply one of the families

A pencil of generalized circles is a projective line in the coefficient space of equations

```math
a(x^2+y^2)+bx+cy+d=0.
```

On the affine chart $`a=1`$, its coefficients vary along an affine line. Write its center as $`c(t)=c_0+tv`$ and its constant coefficient as $`d_0+te`$. The squared radius is

```math
r(t)^2=|c_0+tv|^2-d_0-te.
\tag{3}
```

If infinitely many members of a nonconstant pencil have one fixed positive radius, this quadratic polynomial is constant. Its quadratic coefficient forces $`v=0`$, and its linear coefficient then forces $`e=0`$. The pencil would be constant on this chart, a contradiction. Therefore a nonconstant real pencil contains at most two circles of any prescribed positive radius. A possible straight-line member outside the chart is not a radius-one circle.

Möbius transformations act projectively on generalized-circle coefficient space and preserve pencils. Therefore a web containing a pencil family cannot be transformed by a Möbius map into a web whose every leaf has radius one.

## 3. Consequence of the published symmetry classification

Agafonov, [*Hexagonal Circular 3-Webs with Reducible Polar Curves of Degree Three*](https://sigma-journal.com/2025/043/), SIGMA 21 (2025), 043, Theorem 6.1, classifies hexagonal circular 3-webs with a one-dimensional Möbius symmetry. I read the complete T-, D-, and R-type lists on printed pp. 23–25 and the proof on pp. 25–28.

Every listed type has at least one pencil family: a family of parallel or concurrent lines, a family of concentric circles, or the explicitly listed polar-line family. The nondegenerate Wunderlich orbit constructions in that list also have the group-orbit family, which is a pencil of lines or concentric circles. The classification has no loxodromic type. A projective line of polar points is exactly a pencil family of generalized circles.

Combining that classification with Section 2 gives:

**Consequence.** A local hexagonal web consisting entirely of Euclidean unit-circle arcs cannot have a nontrivial one-dimensional Möbius symmetry.

This includes common translation and rotation constructions. It is not a classification of all hexagonal circular webs. The same paper's reducible-degree-three classification has a different restricted hypothesis. Its Section 7.5 proposes a further algebraicity classification as a conjecture, and explicitly mentions a polar twisted-cubic example. No unproved classification is used here.

## 4. The fixed-radius quadric in circle coefficient space

Use inverse stereographic coordinates on the unit sphere,

```math
(X,Y,Z)=\frac{(2x,2y,1-x^2-y^2)}{1+x^2+y^2}.
```

The plane cutting out the image of the planar circle

```math
(x-a)^2+(y-b)^2=r^2
```

has homogeneous coefficient vector

```math
q=(-2a,-2b,a^2+b^2-r^2-1,a^2+b^2-r^2+1).
\tag{4}
```

Here $`q`$ denotes plane coefficients, not the polar point; applying the sphere's polarity changes the last sign. Define the dual quadratic form and a linear form by

```math
Q_0^*(q)=q_1^2+q_2^2+q_3^2-q_4^2,
\qquad \ell(q)=q_4-q_3.
```

Direct substitution gives

```math
Q_0^*(q)=4r^2,\qquad \ell(q)^2=4.
```

Consequently the homogeneous equation for the radius-one locus is

```math
U(q)=Q_0^*(q)-\ell(q)^2=0,
\qquad \ell(q)\ne0.
\tag{5}
```

The nonzero covector $`\ell`$ is null for the inverse form: its coordinates $`(0,0,-1,1)`$ satisfy $`1-1=0`$. Under a change of homogeneous coordinates this remains a rank-one subtraction from the dual sphere form, with a nonzero null covector. Under a fixed positive radius $`r`$, the subtraction is $`r^2\ell^2`$; absorbing $`r`$ into $`\ell`$ makes the argument below unchanged.

The nonvanishing condition in (5) excludes the degenerate coefficient point at stereographic infinity. It cannot be replaced by treating every algebraic point on $`U`$ as a genuine planar unit circle.

## 5. A generic Wunderlich obstruction

Pottmann, Shi, and Skopenkov, [*Darboux Cyclides and Webs from Circles*](https://www.geometrie.tuwien.ac.at/geom/ig/pottmann/oldpub/2012/websfromcircles/darboux.pdf), author preprint of 8 June 2011, Theorem 15 and Remark 16, recalls Wunderlich's construction: suitable tangent-plane families of singular cones in a quadric pencil cut hexagonal conic webs on an oval quadric. In the spherical model the corresponding sections are circles. This is a separate construction from the one-parameter symmetry cases in Section 3.

Here is an obstruction for the generic pencil. Work over the complex numbers for the algebraic calculation, while retaining real circle arcs when applying it. Suppose the pencil's nondegenerate base form and second form have four distinct generalized eigenvalues. An orthogonal eigenbasis puts them in the form

```math
Q_0(X)=\sum_{j=1}^4\varepsilon_jX_j^2,
\qquad
Q_1(X)=\sum_{j=1}^4\varepsilon_j\lambda_jX_j^2,
\qquad \lambda_j\ne\lambda_k\ (j\ne k),
\tag{6}
```

where the $`\varepsilon_j`$ are nonzero. Such a basis exists over the complex numbers: distinct eigenvectors are orthogonal for $`Q_0`$, and none can be null because it would then be orthogonal to a whole eigenbasis, contrary to nondegeneracy. Scaling can make every $`\varepsilon_j=1`$ over the complex numbers, but this normalization is unnecessary.

The singular cone $`Q_1-\lambda_iQ_0`$ has vertex the $`i`$th coordinate point. A tangent plane contains that vertex. Its coefficient vectors form the nondegenerate conic

```math
q_i=0,\qquad
\sum_{j\ne i}\frac{q_j^2}{\varepsilon_j(\lambda_j-\lambda_i)}=0.
\tag{7}
```

Indeed, for a smooth cone point $`X`$, its tangent coefficients are proportional to $`\varepsilon_j(\lambda_j-\lambda_i)X_j`$, and substitution yields (7). Conversely the same formula recovers a cone point from every point of (7).

In these dual coordinates the fixed-radius equation has the form

```math
U(q)=\sum_{j=1}^4\frac{q_j^2}{\varepsilon_j}
 -\left(\sum_{j=1}^4\ell_jq_j\right)^2=0,
\qquad
\sum_{j=1}^4\varepsilon_j\ell_j^2=0,
\qquad \ell\ne0.
\tag{8}
```

**Lemma.** Three distinct conics from (7) cannot all lie on (8).

**Proof.** If the $`i`$th conic lies on $`U`$, the restriction of $`U`$ to its coordinate plane is proportional to the diagonal quadratic form in (7), or is identically zero. This follows because a nondegenerate plane conic is irreducible and its degree-two vanishing ideal is one-dimensional. The same conclusion follows from containment of a nonempty real conic arc, since such an arc is Zariski dense in that conic.

Every off-diagonal coefficient in that restriction must therefore vanish. Thus

```math
\ell_j\ell_k=0
\quad\text{whenever }j\ne k\text{ and }j,k\ne i.
\tag{9}
```

If this holds for three different omitted indices $`i`$, then it holds for every pair $`j\ne k`$: among those three indices there is always one outside the pair. Hence $`\ell`$ has at most one nonzero coordinate. Since every $`\varepsilon_j`$ is nonzero, the null relation in (8) then forces that last coordinate to be zero as well. This contradicts $`\ell\ne0`$. $`\square`$

Therefore three distinct generic Wunderlich cone families cannot all provide fixed-radius circle arcs. No choice of coordinate chart or Möbius change removes the obstruction: the null-covector description in (8) is invariant under the corresponding coordinate changes.

The lemma has an explicit generic hypothesis. Repeated generalized eigenvalues, nonsemisimple pencils, and degenerations require separate arguments. No claim about those cases is inferred merely by continuity of the generic obstruction.

## 6. What remains unresolved

The conditional construction in Section 1 would settle the paid problem negatively if the required web existed. Sections 3 and 5 exclude symmetric webs and the specified generic Wunderlich route. They do not exclude every equal-radius circular web, and they do not extract a web from an arbitrary dense sequence of finite unit-circle arrangements.

Even a proof that no such analytic web exists would therefore not, by itself, establish $`U(n)=o(n^2)`$. A density-to-geometry theorem with the correct hypotheses would still be needed. The [local removal analysis](local-removal-and-pasch-gap.md) shows two concrete obstacles to replacing that missing step with a small forbidden-configuration argument.

The ESS envelope theorem also cannot be invoked solely by counting possible tangent unit circles. Its analytic-domain and one-parameter assumptions must hold, and inverse branches can become singular in pairs. Those conditions have not been obtained for arbitrary input configurations here.

## Primary-file receipts

The downloaded papers are research intermediates, not redistributed in this checkpoint.

| Source | Downloaded PDF SHA256 |
| --- | --- |
| Agafonov, SIGMA 21 (2025), 043 | 26dbc35841963d6d0006f58c3af7f428b7c20d419fe0f8e74073abdff41ee6d0 |
| Pottmann–Shi–Skopenkov, author preprint, 8 June 2011 | 2317cf8f1be2c4aa0c8bc5b9c0f201e48bc2a7f038d1b528b70978b230071374 |
