# The strict systolic inequality for a square truncated at one corner

**Theorem.** Let $`Q`$ be a pentagon obtained by cutting off one corner of a square, with the two cut endpoints in the interiors of the adjacent sides. For every planar convex body $`K`$,
```math
\frac{c_{\mathrm{EHZ}}(K\times Q)^2}{2|K||Q|}<1.
```
This proves the strict inequality part of [Meylender–Thalmaier’s conjecture, Conjecture 6.1 of Balitskiy–Mitrofanov–Polyanskii, arXiv:2603.12495v2](https://arxiv.org/pdf/2603.12495v2#page=25). The specified optimizer in the same conjecture is disproved by the separate exact pentagonal cover. The theorem here does not identify the actual optimizer.

## 1. Shape normalization and a lattice cover

Translate and rotate $`Q`$ and normalize its original side to 1. The resulting $`Q`$ is a unit square with a corner right triangle of legs $`a,b\in(0,1)`$ removed, in the coordinates
```math
Q=[0,1]^2\cap\{(x,y): bx+ay\le L\},\qquad L=a+b-ab.
```
The systolic ratio is invariant under this normalization. It is also invariant under positive homotheties of $`K`$ alone: the capacity is homogeneous of degree one when scaling just $`K`$, by combining scalar dilation in $`\mathbb R^4`$ with the symplectic map $`(x,y)\mapsto(\sqrt s\,x,y/\sqrt s)`$ on the two factors. Normalize $`c_{\rm EHZ}(K\times Q)=1`$. We must prove $`|K|>1/(2-ab)`$.

Put $`A=b/L,\ B=a/L,\ \alpha=1-A,\ \beta=1-B,\ \gamma=A+B-1`$. These quantities satisfy
```math
0\lt A,B<1,\quad \alpha,\beta>0,\quad \alpha+\beta<1,\quad
a=\frac{\gamma}{A},\quad b=\frac{\gamma}{B},\quad
R:=\frac{1}{2-ab}=\frac{AB}{1-\alpha^2-\beta^2}>\frac12.
```
The last denominator identity follows from $`2AB-\gamma^2=1-\alpha^2-\beta^2`$.

By the four-normal-triangles covering characterization in [the primary source, Definition 3.2 and Theorem 3.3](https://arxiv.org/pdf/2603.12495v2#page=10), $`K`$ contains translates of a horizontal unit segment, a vertical unit segment, and two opposite right triangles with leg lengths $`A,B`$. In detail, the only opposite pairs of outward facet directions of $`Q`$ are the coordinate axes, and their widths are 1. For a nondegenerate triangle the only three directions with a positive linear dependence are $`-e_1,-e_2,(b,a)`$. The support function of $`Q`$ in the first two directions is 0 and in the last is $`L`$, so the normalized edge vectors are $`(-A,0),(0,-B),(A,B)`$ in one of the two cyclic orders. Translation of $`Q`$ does not change the length of a closed polygonal curve. After a horizontal-axis reflection of $`K`$ for the geometric argument, take the two required triangles to be $`T=\mathop{\mathrm{conv}}(0,Ae_1,Be_2)`$ and $`-T`$.

Let $`\Gamma=A\mathbb Z\times B\mathbb Z`$. The lattice rectangles split along diagonals into translates of $`T,-T`$. Since every triangle of this triangulation fits into $`K`$, [the primary source's Lemma 4.3](https://arxiv.org/pdf/2603.12495v2#page=16) gives $`K+\Gamma=\mathbb R^2`$.

## 2. A lattice multiplicity inequality

If $`K`$ contains an axis-aligned rectangle of dimensions $`A,B`$, first symmetrize its horizontal slices about $`x=0`$, then its vertical slices about $`y=0`$ (axis Steiner symmetrizations). The first operation centers the rectangle in $`x`$, keeps some unit horizontal segment, and sends the $`y`$-levels of the vertical unit segment into its new central vertical axis. The second centers the rectangle in $`y`$, retains a unit vertical segment and sends the $`x`$-levels of the horizontal unit segment into its new central horizontal axis. The resulting convex body has the same area and contains the centered rectangle and centered horizontal and vertical unit segments. Adding the four triangular caps over its four sides gives
```math
|K|\ge AB+\frac{B(1-A)+A(1-B)}2=\frac{A+B}{2}>\frac{1}{2-ab}.
```
The four caps have disjoint interiors, since they lie in the corresponding different exterior side strips of the rectangle. The last inequality is equivalent to the positive quantity $`ab(2-a-b)>0`$.

In the remaining case $`K`$ contains no axis-aligned $`A`$ by $`B`$ rectangle. Over each point of a half-open fundamental rectangle for $`\Gamma`$, form the finite graph whose vertices are the points of its lattice fiber belonging to $`K`$, and whose edges join neighbors differing by $`(A,0)`$ or $`(0,B)`$. There is at least one vertex by lattice coverage. This graph is acyclic: a simple cycle of the rectangular grid encloses at least one full grid cell, and the hull of its vertices lies in $`K`$ by convexity. A full grid cell would give the excluded rectangle. Therefore the number of edges is at most the number of vertices minus one in every fiber. Integrate over the fundamental rectangle, and enumerate each horizontal or vertical lattice edge once by its forward endpoint. We obtain
```math
|K|-AB\ \ge\ |K\cap(K+(A,0))| + |K\cap(K+(0,B))|. \tag{1}
```

## 3. Concave slices and consequences of equality

Let $`f`$ be the horizontal slice-length function on the vertical projection interval of $`K`$. It is continuous and concave. Continuity at projection endpoints follows from compactness for the upper limit and concavity between the endpoint and any fixed interior level for the lower limit. Choose a maximum at level $`y_0`$, with value $`m\ge1`$ because of the unit segment, and set $`t=1-A/m\in(0,1)`$. At the level $`\phi(y)=(1-t)y_0+ty`$, concavity gives
```math
f(\phi(y))\ge (1-t)m+t f(y)=A+t f(y).
```
Integrating these overlap lengths over the contracted interval yields
```math
|K\cap(K+(A,0))|
=\int (f(y)-A)_+\,dy
\ge t^2|K|\ge\alpha^2|K|.
\tag{2}
```
Likewise the vertical overlap is at least $`\beta^2|K|`$. Combining (1) and (2) proves $`|K|\ge R`$.

To prove strictness, suppose $`|K|=R`$. All overlap bounds must be equalities. In each coordinate direction the maximum slice is exactly 1, and the width profile is linear on either side of its maximal level and zero at each projection endpoint other than a maximal endpoint. Here is the equality argument for $`f`$. Equality in (2) forces $`m=1`$, equality in the displayed concavity inequality at all interior $`y`$ by continuity, and zero overlap outside the contracted projection. For $`y\ne y_0`$, equality at the interior point $`\phi(y)`$ of $`[y,y_0]`$ then makes $`f`$ affine on all of $`[y,y_0]`$. If $`y_e`$ is a projection endpoint not equal to $`y_0`$, the contracted endpoint $`\phi(y_e)`$ is an interior projection point, adjoining levels outside the contracted interval where $`f\le A`$. Continuity and equality from inside give $`A+t f(y_e)\le A`$, hence $`f(y_e)=0`$.

The right boundary of the horizontal slices is concave and the left boundary is convex. Their difference is $`f`$, so on each affine piece of $`f`$ both are affine (the sum of their concave deviations from linearity is zero). Therefore $`K`$ is either a triangle or a quadrilateral. If it is a quadrilateral, its opposite vertices include the two endpoints of the maximal horizontal segment at the unique peak level, and likewise the endpoints of the maximal vertical segment. (A peak at a projection endpoint would give only a triangle.) The diagonals are thus orthogonal unit segments, and its area is $`1/2<R`$. It remains to rule out the triangle.

## 4. The triangular equality case is impossible

Suppose $`K`$ is a triangle whose largest coordinate-parallel chords have lengths 1. Choose its three outward side normals $`n_i`$ by rotating the oriented edge vectors clockwise through $`90^\circ`$ and dividing by $`2|K|`$. Then
```math
\sum_i n_i=0,\qquad \sum_i h_K(n_i)=1,\qquad
|\det(n_1,n_2)|=\frac{1}{2|K|}.
```
The support-sum identity is the edge shoelace formula. For any triangle the largest horizontal chord equals $`2|K|`$ divided by its vertical span, since its horizontal widths form a tent whose integral is the area. Thus the positive parts of the first coordinate column of $`(n_i)`$ sum to 1: before dividing, the positive sum of the oriented vertical edge increments is exactly the vertical span. The same argument in the other direction gives positive sum 1 for the second column. The negative parts in each column also sum to 1 by $`\sum n_i=0`$.

Reflect either coordinate and permute rows if needed, so the first coordinate column is $`(1,-u,-(1-u))`$ and the second is either $`(1,-v,-(1-v))`$ or $`(-v,1,-(1-v))`$, with $`u,v\in[0,1]`$. Under the coordinate reflections, the two required triangles are still opposite. By choosing which one is called $`T`$, they can be written as $`T=\mathop{\mathrm{conv}}(0,Ae_1,sBe_2)`$ and $`-T`$ for $`s\in\{+1,-1\}`$. The fact that both fit into $`K`$ implies
```math
\sum_i h_T(n_i)\le1,\qquad \sum_i h_T(-n_i)\le1,\qquad
h_T(x,y)=\max(0,Ax,sBy).
\tag{3}
```
Indeed, the shifts of support sums vanish because the normals sum to zero.

* **Positive entries in the same row.** If $`s=-1`$, the $`h_T(n_i)`$ sum is at least $`A+B>1`$, impossible. For $`s=+1`$, (3) implies $`Au+B(1-v)\le1`$ and $`Bv+A(1-u)\le1`$. It follows that
```math
|\det(n_1,n_2)|=|u-v|\le
\frac{1-\min(A,B)}{\max(A,B)}
=1-\min(a,b)<1-\frac{ab}{2}.
```
For example if $`A\ge B`$, the first inequality gives $`A(u-v)\le1-B`$ when $`u\ge v`$ because $`Au+B(1-v)=B+A(u-v)+(A-B)v`$. The second gives $`A(v-u)\le1-B`$ when $`v\ge u`$ by the same rearrangement. The other ordering of $`A,B`$ swaps their roles.
* **Positive entries in different rows.** If $`s=+1`$, the $`h_T(n_i)`$ sum is at least $`A+B`$, again impossible. If $`s=-1`$, (3) implies $`A+B(1-v)\le1`$ and $`B+A(1-u)\le1`$, so $`v\ge b`$, $`u\ge a`$. Therefore
```math
|\det(n_1,n_2)|=1-uv\le1-ab<1-\frac{ab}{2}.
```

In both cases $`|K|=1/(2|\det(n_1,n_2)|)>1/(2-ab)=R`$, contradicting equality. This completes the strict bound. $`\square`$

## Attainment for fixed $`Q`$

In fact the supremum over $`K`$ for a fixed truncated square $`Q`$ is attained and still strictly below 1. In the capacity-one normalization, minimize area over convex bodies containing the four required shapes. For a minimizing sequence with bounded area, translate each body so that the lines of its horizontal and vertical unit segments meet at the origin. Any point of the body forms a triangle with either unit segment, showing that its distances from the corresponding lines are each at most twice the area. Thus all these translated bodies lie in a fixed rectangle. Blaschke selection and continuity of area give a limiting convex body. Containment of translates of the four required shapes is closed under this convergence: after passing to a subsequence, their translation vectors converge, since the bodies are uniformly bounded. The limiting body has positive area since it contains a nondegenerate required triangle. If its capacity were bigger than 1, scaling just this body back to capacity 1 would strictly decrease its area while preserving the cover property. Thus it attains the optimum, and the strict theorem puts its ratio below 1.

## Priority and scope

The August 2026 primary revision still gives the strict inequality for this family as Conjecture 6.1. The same work establishes the inequality for quadrilateral norms and a regular-hexagon case, and reviews the failure for unrestricted pentagons, but does not establish this truncated-square case. A bounded search for the exact family, conjecture, and original lab project found no exact prior resolution of the strict clause. This does not establish exclusive priority.
